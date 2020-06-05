# awsDeployLambda
Script to deploy/update aws lambda

Requisites:
* aws cli is installed and configured
* lambda role is already configured
* pip is installed
* lambda function is using python runtime
* zip is installed on your WS

Lambda functions do not come with all 3rd party libraries that one might need. There are two ways to add libraries for lambda:
1) Add layers to your lambda function and that contains the appropriate libraries. This method will not be address here.
2) Package you libraries in a lambda deployment package and push it to AWS lambda service using aws cli. Here's an example of how you can create a lambda deployment package.

For this example we will be bundling requests python library. here are the prameters that we will be using:
lambdaFunctionName: myLambda
package/library: requests
pythonScriptName: lambda_function.py
deploymentDirectory: deploy
deploymentZipFile: lambda_deploy.zip
1) create deploymentDirectory 
    mkdir deploy
2) cd into deploymentDirectory
    cd deploy
3) use pip to install requests package/libragry
    pip install requests --target .
4) create or copy in your python script, lambda_function.py.
5) zip up the deploymentDirectory and name it lambda_deploy.zip.
    zip -r ../lambda_deploy.zip *
6) lambda_deploy.zip is in the parent dir of deploymentDirectory. Modify deployLambda.sh to supply it with the appropriate vars.
7) run "deployLambda.sh create" to create new lambda function.
8) to update existing function, run "deployLambda.sh update"
