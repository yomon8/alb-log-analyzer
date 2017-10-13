alb-log-analyzer
====

## Usage


### Download

```
git clone https://github.com/yomon8/alb-log-analyzer.git
cd alb-log-analyzer
```

### Modify settings

```
vi ./conf/awsenv.sh
```

```
AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY
AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY
AWS_REGION=aws-region
S3_BUCKET=your-bucket-name
S3_PREFIX=prefix/to/alb/accesslog
```

### Start

```
./alb-log-analyzer/bin/start.sh
```

### Access
Access the url below with your browser

http://127.0.0.1:8983/banana/#/dashboard/solr/ALB

### Stop

```
./alb-log-analyzer/bin/stop.sh
```

