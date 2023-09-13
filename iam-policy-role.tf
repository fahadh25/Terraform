resource "aws_iam_policy" "ec2-lambda-policy" {
    name = "ec2-lambda-policy"
    path = "/"
    description = "Policy to allow lambda to start/stop ec2"
    policy = "${file("policy-ec2-lambda.json")}"
}

resource "aws_iam_role" "ec2-lambda-role" {
    name = "ec2-lambda-role"
    path = "/"
    description = "Role to allow lambda to start/stop ec2"
    assume_role_policy = "${file("role-ec2-lambda.json")}"
}

resource "aws_iam_policy_attachment" "ec2-lambda-attachment" {
    name = "ec2-lambda-iam"
    roles = ["${aws_iam_role.ec2-lambda-role.name}"]
    policy_arn = "${aws_iam_policy.ec2-lambda-policy.arn}"
  
}