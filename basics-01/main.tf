variable "myvar" {
  type    = string
  default = "hello terraform"
}

variable "mymap" {
  type = map(string)
  default = {
    mykey = "my value"
  }
}

variable "mylist" {
  type    = list(any)
  default = [1, 2, 3]
}
