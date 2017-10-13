package main

import (
	"bufio"
	"flag"
	"fmt"
	"log"
	"os"

	"github.com/vanng822/go-solr/solr"

	"github.com/yomon8/aloparse/parser"
)

func convertSolrDoc(e *parser.LogEntry) map[string]interface{} {
	return map[string]interface{}{
		"type":                     e.Type,
		"timestamp":                e.Timestamp.Format("2006-01-02T15:04:05Z"),
		"alb_fullname":             e.ALB,
		"client":                   e.Client,
		"client_port":              e.ClientPort,
		"target":                   e.Target,
		"target_port":              e.TargetPort,
		"request_processing_time":  e.RequestProcessingTime,
		"target_processing_time":   e.TargetProcessingTime,
		"response_processing_time": e.ResponseProcessingTime,
		"elb_status_code":          e.ElbStatusCode,
		"target_status_code":       e.TargetStatusCode,
		"received_bytes":           e.ReceivedBytes,
		"sent_bytes":               e.SentBytes,
		"request_method":           e.Method,
		"request_uri":              e.URL,
		"request_protocol":         e.Protocol,
		"user_agent":               e.UserAgent,
		"ssl_cipher":               e.SslCipher,
		"ssl_protocol":             e.SslProtocol,
		"target_group_arn":         e.TargetGroupArn,
		"domain":                   e.DomainName,
	}
}

func sendDocsToSolr(si *solr.SolrInterface, docs []interface{}) (*solr.SolrUpdateResponse, error) {
	data := map[string]interface{}{
		"add": docs,
	}
	return si.Update(data, nil)
}

func main() {
	var (
		version = "0"

		file        string
		solrhost    string
		solrport    string
		solrcore    string
		updatenum   int
		showVersion bool
	)
	flag.StringVar(&file, "f", "", "AWS ALB log file path")
	flag.StringVar(&solrhost, "s", "localhost", "Solr Hostname")
	flag.StringVar(&solrport, "p", "8983", "Solr Hostname")
	flag.StringVar(&solrcore, "c", "alb-log", "Solr Core or Collection Name")
	flag.IntVar(&updatenum, "u", 5000, "")
	flag.BoolVar(&showVersion, "v", false, "Show Version")
	flag.Parse()

	if showVersion {
		fmt.Println("version: ", version)
		os.Exit(0)
	}

	si, err := solr.NewSolrInterface(
		fmt.Sprintf("http://%s:%s/solr", solrhost, solrport), solrcore)
	if err != nil {
		log.Fatalf("Solr connection error:%#v\n", err)
	}

	fp, err := os.Open(file)
	if err != nil {
		log.Fatalf("File open error:%#v\n", err)
	}
	sc := bufio.NewScanner(fp)
	defer fp.Close()
	parser := parser.NewALBLogParser()
	docs := make([]interface{}, 0)
	for {
		if sc.Scan() {
			s := sc.Text()
			e, err := parser.Parse(s)
			if err != nil {
				log.Printf("[error]%s:%s\n", err, s)
			} else {
				doc := convertSolrDoc(e)
				docs = append(docs, doc)
				if len(docs) == updatenum {
					_, err := sendDocsToSolr(si, docs)
					if err != nil {
						log.Printf("[error]Solr Update Error %#v\n%#v", err, docs)
					} else {
						log.Printf("[info]Solr Update Success (%d docs)\n", len(docs))
					}
					docs = make([]interface{}, 0)
				}
			}
		} else {
			break
		}
	}
	sendDocsToSolr(si, docs)
	_, err = sendDocsToSolr(si, docs)
	if err != nil {
		log.Printf("[error]Solr Update Error %#v\n%#v", err, docs)
	} else {
		log.Printf("[info]Solr Update Success (%d docs)\n", len(docs))
	}
}
