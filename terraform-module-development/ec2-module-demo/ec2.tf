module "ec2" {
    source = "git::https://github.com/Mohansai7-ctrl/terraform-practice/tree/main/terraform-module-development/ec2-module-demo.git"
    #source = "https://github.com/Mohansai7-ctrl/terraform-practice/tree/main/terraform-module-development/ec2-module-demo"
    
    sg_id = ["sg-0d91387712ba38962"]

    ami_id = var.ami_info

    instances = var.instances_info
}