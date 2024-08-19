resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.subnet_ids, 0) # Use the first subnet
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  associate_public_ip_address = true  # Ensure public IP association

  tags = {
    Name = "cicd-instance"
  }
}

resource "aws_eip" "example" {
  instance = aws_instance.example.id
  domain   = "vpc"
}

#output "instance_id" {
#  value = aws_instance.this.id
#}

output "public_ip" {
  value = aws_eip.example.public_ip
}