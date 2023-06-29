resource "aws_instance" "mdgtask" {
  ami                         = "ami-04145650b3440cfe6"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true

  tags = {
    Name  = "mdgtask"
  }
}