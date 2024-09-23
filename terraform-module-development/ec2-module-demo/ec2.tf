module "ec2" {
    source = "https://github.com/Mohansai7-ctrl/terraform-practice/tree/main/terraform-module-development/terraform-aws-ec2"
    #source = "https://github.com/Mohansai7-ctrl/terraform-practice/tree/main/terraform-module-development/terraform-aws-ec2"
    
    sg_id = ["sg-0d91387712ba38962"]

    ami_id = var.ami_info

    instances = var.instances_info
}