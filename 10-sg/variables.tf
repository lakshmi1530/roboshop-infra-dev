variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
  type = list(string)
  default = [ 
    #Database 
    "mongodb", "redis", "mysql", "rabbitmq",
    #Application
    "catalogue", "cart", "shipping", "payment", "user", "backend_alb",
    #fronend
    "frontend",
    "frontend_alb",
    #bastion/flow
    "bastion"
    ]
}