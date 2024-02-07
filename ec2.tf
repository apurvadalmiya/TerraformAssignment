resource "aws_instance" "example" {
  ami                  = var.ami
  instance_type        = var.instance_type
  key_name             = "${var.aws_key_name}"
  security_groups      = ["${aws_security_group.ssh.name}"]
  iam_instance_profile = "${aws_iam_instance_profile.instance_profile.name}"
  //user_data = "${data.template_file.user_data_linux}"
  user_data = "${file("data.sh")}"

 
}