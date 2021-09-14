aws cloudformation --region $DEPLOY_REGION create-stack --stack-name survey-prod \
  --template-url https://aws-cfn-samples.s3.amazonaws.com/quickstart-serverless-survey/templates/serverless-survey.template.yaml \
  --parameters ParameterKey=ConfigFileLocation,ParameterValue=aws-cfn-samples/quickstart-serverless-survey/scripts/config.yaml \
  --capabilities "CAPABILITY_IAM" "CAPABILITY_AUTO_EXPAND" --disable-rollback
