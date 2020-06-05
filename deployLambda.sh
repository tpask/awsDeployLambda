#!/usr/bin/env bash
#script to deploy or update lambda function

acctId=
roleName=
functionName=
zipFile=
profile=default
runtime=python3.8
handler=lambda_function.lambda_handler
role=arn:aws:iam::${acctId}:role/${roleName}
zipFile=deploy_requests.zip

function create {
  aws --profile ${profile} lambda create-function --function-name ${functionName} \
    --handler ${handler} \
    --role ${role}\
    --runtime ${runtime} \
    --zip-file fileb://${zipFile}
}

function update {
  aws --profile ${profile} lambda update-function-code --function-name ${functionName} --zip-file fileb://${zipFile}
}

case "$1" in 
  create)
    create
    ;;

  update)
    update
    ;;
  *)
  echo $"usage: $0 [ create|update ]"
  exit 1
esac
