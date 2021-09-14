EMAIL=
FORGE_CLIENT_ID=
FORGE_CLIENT_SECRET=
IP_ADDRESS="10.0.0.1\/24"

# DO NOT MODIFY BELOW THIS LINE
CODE_HOSTING_BUCKET=$(cat code-bucket.txt)

files=".taskcat_overrides.yml qs-prod-cfn.json qs-prod-codepipeline.json"

echo "Updating input parameter files"
for f in $files; do
    gsed -i "s/YOUR_CODE_HOSTING_BUCKET/$CODE_HOSTING_BUCKET/g" $f
done    

echo "Updating CodePipeline configuration zip file"
PROD_CONFIG=qs-prod-codepipeline.json

ZIP_FILE=quickstart-serverless-survey.zip
if test -f "$ZIP_FILE"; then
    rm -v $ZIP_FILE
fi

cp /Users/shukvino/dev/vsnyc/quickstart-serverless-survey/templates/serverless-survey.template.yaml .
zip $ZIP_FILE serverless-survey.template.yaml ${PROD_CONFIG}
rm serverless-survey.template.yaml
