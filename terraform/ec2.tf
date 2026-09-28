data "aws_ami" "amazon_linux" {
  owners = ["137112412989"]

  filter {
    name   = "image-id"
    values = ["ami-0db58a8e82c5175f8"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "app_a" {

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_app_a.id
  vpc_security_group_ids      = [aws_security_group.app.id]
  key_name                    = var.key_name
  iam_instance_profile        = aws_iam_instance_profile.ec2.name
  associate_public_ip_address = false

  user_data_replace_on_change = true

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y python3 amazon-ssm-agent
              systemctl enable amazon-ssm-agent
              systemctl start amazon-ssm-agent
              EOF

  tags = {
    Name = "app-server-a"
    Role = "application"
  }
}

resource "aws_instance" "app_b" {

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_app_b.id
  vpc_security_group_ids      = [aws_security_group.app.id]
  key_name                    = var.key_name
  iam_instance_profile        = aws_iam_instance_profile.ec2.name
  associate_public_ip_address = false

  user_data_replace_on_change = true

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y python3 amazon-ssm-agent
              systemctl enable amazon-ssm-agent
              systemctl start amazon-ssm-agent
              EOF

  tags = {
    Name = "app-server-b"
    Role = "application"
  }
}