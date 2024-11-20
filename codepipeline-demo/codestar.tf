resource "aws_codestarconnections_connection" "github" {
  name          = "my-connection"
  provider_type = "GitHub"
}