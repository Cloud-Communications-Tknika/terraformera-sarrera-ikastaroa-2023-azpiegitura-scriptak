

data "aws_ami" "Ubuntu_latest" {

  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22*"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}
 
