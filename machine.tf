resource "aws_instance" "nginx" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  security_groups = [aws_security_group.nginx_sg.name]

user_data = <<-EOF
           #!/bin/bash
           apt update -y
           apt install -y nginx
           echo "<h1>Welcome to NGINX on AWS</h1>" > /var/www/html/index.html
           systemctl restart nginx
           EOF

  tags = {
    Name = "nginx-server"
  }

    connection {
    type        = "ssh"
    user        = "ubuntu" 
    private_key = file("mykey")
    host        = self.public_ip
  }
 

}

resource "aws_key_pair" "deployer" {
  key_name   = "new-key"
  public_key = file("mykey.pub")
}
