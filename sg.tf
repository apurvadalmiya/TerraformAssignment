resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "Allow SSH traffic from everywhere"
  vpc_id      = "vpc-06761b9f9a78eb6aa"
}

resource "aws_security_group_rule" "ssh_ingress" {
  security_group_id = "${aws_security_group.ssh.id}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh_egress" {
  security_group_id = "${aws_security_group.ssh.id}"
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}