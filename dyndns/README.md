## Dynamic DNS

This container runs a node app [dynroute](https://github.com/alessioalex/dynroute) that updates Route 53 with the current 
IP address of the host.

### Setup

1. create a subdir called `.aws`, with a file `dyndns-creds` containing your AWS secrets
2. add an `.envrc` file with DOMAIN and ZONE exported (assumes you are using `direnv`)
3. (optional) change REFRESH to a value other than 1800 (30 mins)

### Examples:

#### .aws/dyndns-creds

```
[credentials]
accessKeyId=AWS_ACCESS_ID
secretAccessKey=AWS_SECRET_KEY
```

#### .envrc

```
export DOMAIN=your.domain.name
export ZONE=YOUR_ROUTE53_ZONE
```

####


