alb-log-analyzer
====
AWS ALB Log Analyzer with Solr/Banana

<img src="https://raw.githubusercontent.com/yomon8/alb-log-analyzer/v0.0.2/image.png" width="600">

## Requirement

- Docker

## Usage


### 1. Download

```
git clone https://github.com/yomon8/alb-log-analyzer.git
cd alb-log-analyzer
```

### 2. Modify settings

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

### 3. Start

```
./alb-log-analyzer/bin/start.sh
```

### 4. Access
Access the url below with your browser

http://127.0.0.1:8983/banana/#/dashboard/solr/ALB

### 5. Stop

```
./alb-log-analyzer/bin/stop.sh
```

