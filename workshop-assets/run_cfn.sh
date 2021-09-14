aws cloudformation --region us-west-2 create-stack --stack-name Forge-Prod-Stack \
  --template-url https://aws-cfn-samples.s3.amazonaws.com/quickstart-serverless-survey/templates/serverless-survey.template.yaml \
  --parameters file://qs-prod-cfn.json \
  --capabilities "CAPABILITY_IAM" --disable-rollback
