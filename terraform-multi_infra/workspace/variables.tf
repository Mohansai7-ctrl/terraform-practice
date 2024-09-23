variable "instances" {
    type = map
    default = {
        dev = "t3.micro"
        prod = "t3.small"
    }
}

variable "domain_name" {
    default = "mohansai.online"
}