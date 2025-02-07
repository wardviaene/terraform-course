provider "aws" {
  access_key = "AKIAQS2NMXRRZNUQT2P2"
  secret_key = "+YyKvOlu9ORthle0+hka3Bm65nkISpf92WEH6d4x"
  region     = "us-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0ce8df1bc73215555"
  instance_type = "t2.micro"
}

