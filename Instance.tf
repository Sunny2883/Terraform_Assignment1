resource "aws_instance" "myFirstServerbyTerraform" {
  ami                    = "ami-06b72b3b2a773be2b"
  instance_type          = "t2.micro"
  key_name = "${aws_key_pair.key-tf.key_name}"
  vpc_security_group_ids = [aws_security_group.SecurityGroupAssignement1TF.id]
  subnet_id = aws_subnet.subnetTFAssignment1.id
  associate_public_ip_address = true
  tags = {
    Name = "FirstInstanceWithTerraform"
  }
  user_data = <<EOF
#!bin/bash
yum -y update
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Hello World" > /var/www/html/index.html
    EOF

}
