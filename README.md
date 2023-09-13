# Cloudwatch to invoke Lambda to start/stop EC2 using Terraform  

Technical Description:

The technical architecture involves using Terraform to configure a Lambda function integrated with a CloudWatch cron event to trigger the execution of a Python script. The Python script utilizes the Boto3 library to start or stop EC2 instances based on a specific tag.

1. Infrastructure Provisioning with Terraform:
   - Use Terraform to define the infrastructure components required for the solution, including the Lambda function, IAM roles, and CloudWatch cron configuration.
   - Configure the necessary AWS provider and resource blocks in the Terraform configuration file.
   - Define the Lambda function resource, specifying the source code file (Python script) and any required dependencies.
   - Configure the IAM role to grant necessary permissions to the Lambda function, such as EC2 instance manipulation.

2. Lambda Function Configuration:
   - Set up the Lambda function with the corresponding IAM role, timeout, and memory requirements.
   - Configure the CloudWatch cron event to trigger the Lambda function at regular intervals.
   - Associate the cron event with the Lambda function to define the schedule for executing the EC2 start/stop actions.

3. Python Script Execution:
   - Write a Python script to be executed by the Lambda function.
   - Use the Boto3 library to interact with the AWS EC2 service.
   - Implement the logic to query EC2 instances based on a specific tag.
   - Determine the states of the EC2 instances (running or stopped).
   - Perform start or stop actions based on the current state of each instance.

4. Deployment and Execution:
   - Deploy the infrastructure using Terraform by running the `terraform init`, `terraform plan`, and `terraform apply` commands.
   - Terraform will provision the required resources and configure the Lambda function with the CloudWatch cron event and IAM role.
   - Upon schedule, the CloudWatch cron event triggers the Lambda function, executing the Python script.
   - The Python script uses the Boto3 library to interact with the AWS EC2 service, identifying instances with the specified tag, and initiating the appropriate start or stop actions.

By combining Terraform, Lambda functions, and CloudWatch cron events, the solution automates the start/stop actions on EC2 instances with a specific tag based on a defined schedule. This approach provides flexibility, scalability, and ease of management for managing EC2 instances in an automated manner.

Please note that Terraform, Boto3 library, and the required AWS credentials need to be properly configured and available for the successful execution of this solution.


![architecure](https://github.com/fahadh25/terraform/assets/57483996/4b0f1717-2f47-4f96-ae68-caf0a0220697)
