locals {
  Vpc_tags = {
    Project = "JuneProject"
    Owner = "TobaTheCreator"
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }

  Subnet_tags ={
    Project = "JuneProject"
    Owner = "TobaTheCreator"
    time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }

  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
 
}