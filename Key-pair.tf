resource "aws_key_pair" "key-tf" {
  key_name ="keypair"
  public_key = file("${path.module}/id_rsa.pub")
}