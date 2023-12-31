resource "aws_security_group_rule" "allowed-http" {
    security_group_id = data.aws_security_group.test-sg.id
    type = "ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "allowed-ssh" {
    security_group_id = data.aws_security_group.test-sg.id
    type = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "outbound" {     
    security_group_id = data.aws_security_group.test-sg.id
    type = "egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
      
}