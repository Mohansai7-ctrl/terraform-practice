variable "ami_info" {
    type = string
    default = "ami-09c813fb71547fc4f"

}

variable "instances_info" {
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}