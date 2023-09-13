resource "aws_cloudwatch_event_rule" "ec2-lambda-cw-rule-start" {
    name = "ec2-lambda-cw-rule-start"
    description = "cron to start ec2"
    schedule_expression = "cron(*/2 * * * ? *)"  
}

resource "aws_cloudwatch_event_rule" "ec2-lambda-cw-rule-stop" {
    name = "ec2-lambda-cw--rule-stop"
    description = "cron to stop ec2"
    schedule_expression = "cron(*/10 * * * ? *)"  
}

resource "aws_cloudwatch_event_target" "ec2-start-lambda" {
    arn = aws_lambda_function.ec2-lambda-function.arn
    rule = aws_cloudwatch_event_rule.ec2-lambda-cw-rule-start.name
    input = <<JSON
    {
        "operation":"start"
    }
JSON
}

resource "aws_cloudwatch_event_target" "ec2-stop-lambda" {
    arn = aws_lambda_function.ec2-lambda-function.arn
    rule = aws_cloudwatch_event_rule.ec2-lambda-cw-rule-stop.name
    input = <<JSON
    {
        "operation":"stop"
    }
JSON
}

resource "aws_lambda_permission" "start-permission" {
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.ec2-lambda-function.arn
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.ec2-lambda-cw-rule-start.arn
}

resource "aws_lambda_permission" "stop-permission" {
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.ec2-lambda-function.arn
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.ec2-lambda-cw-rule-stop.arn
}
