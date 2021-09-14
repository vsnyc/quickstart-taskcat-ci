CONFIG_REGION=$1
#SUFFIX=$(uuidgen | cut -c'1-13')
#MacOS
SUFFIX=$(uuidgen | tr "[:upper:]" "[:lower:]" | cut -c'1-13')
CONFIG_BUCKET_NAME=awsqs-ci-cd-demo-config-$SUFFIX
echo $CONFIG_BUCKET_NAME > config-bucket.txt
aws s3 mb s3://${CONFIG_BUCKET_NAME} --region ${CONFIG_REGION}
aws s3api put-public-access-block --bucket ${CONFIG_BUCKET_NAME} --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
aws s3api put-bucket-versioning --bucket ${CONFIG_BUCKET_NAME}  --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket ${CONFIG_BUCKET_NAME} --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'

echo "Created config bucket: $CONFIG_BUCKET_NAME"

CODE_HOSTING_REGION=$1
CODE_BUCKET_NAME=awsqs-ci-cd-demo-code-$SUFFIX
echo $CODE_BUCKET_NAME > code-bucket.txt
aws s3 mb s3://${CODE_BUCKET_NAME} --region ${CODE_HOSTING_REGION}
aws s3api put-public-access-block --bucket ${CODE_BUCKET_NAME} --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
aws s3api put-bucket-encryption --bucket ${CODE_BUCKET_NAME} --server-side-encryption-configuration '{"Rules": [{"ApplyServerSideEncryptionByDefault": {"SSEAlgorithm": "AES256"}}]}'

echo "Created code hosting bucket: $CODE_BUCKET_NAME"