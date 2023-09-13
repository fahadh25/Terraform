data "archive_file" "zip-python-code" {
    type = "zip"
    source_dir = "${path.module}/start_stop_lambda_function/"
    output_path = "${path.module}/start_stop_lambda_function/start_stop_lambda_function.zip"
}

resource "aws_lambda_function" "ec2-lambda-function" {
    filename = "${path.module}/start_stop_lambda_function/start_stop_lambda_function.zip"
    function_name = "ec2-lambda-function"
    role = aws_iam_role.ec2-lambda-role.arn
    handler = "start_stop_lambda_function.lambda_handler"
    runtime = "python3.9"
}