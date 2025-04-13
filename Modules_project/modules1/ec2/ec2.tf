# Web Server 1
resource "aws_instance" "web_1" {
  ami           = var.my_ami
  instance_type = var.instance_type
  associate_public_ip_address = true
  #subnet_id = aws_subnet.public_subnet_1.id
  subnet_id = var.public_subnet_1_ec2
  user_data = file("${path.module}/web-apps.sh")
  #vpc_security_group_ids = [aws_security_group.public_sg.id]
  vpc_security_group_ids = [var.public_sg_ec2]
  key_name = "Linkey"
  tags = {
    Name = "web-server-1"
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host     = self.public_ip
    private_key = file("${path.module}/private_key/venkat_singapore.pem")
  }
  provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }
    provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp /tmp/index.html /var/www/html",
    ]
  }  
}

# Web Server 2
resource "aws_instance" "web_2" {
  ami           = "ami-02313e0b18afefc4b"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  #subnet_id = aws_subnet.public_subnet_2.id
  subnet_id = var.public_subnet_2_ec2
  user_data = file("${path.module}/web-apps.sh")
  #vpc_security_group_ids = [aws_security_group.public_sg.id]
  vpc_security_group_ids = [var.public_sg_ec2]
  key_name = "Linkey"
  tags = {
    Name = "web-server-2"
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    host     = self.public_ip
    private_key = file("${path.module}/private_key/venkat_singapore.pem")
  }
  provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }
    provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo cp /tmp/index.html /var/www/html",
    ]
  }  
}