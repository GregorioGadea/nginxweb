resource "aws_instance" "web" {
  provider      = aws
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  user_data     = file("./web/user-data-web.sh")
  key_name      = var.aws_key
  monitoring    = true
  availability_zone = "us-east-1a"

  root_block_device {
    delete_on_termination = true
    volume_type           = "gp2"
    volume_size           = 20
  }

  tags = {
    Name = "SnipeIT"
    env  = "infra"
    IaC  = "true"
  }
}