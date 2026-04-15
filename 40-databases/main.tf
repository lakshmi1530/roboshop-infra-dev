#MongoDB instance
resource "aws_instance" "mongodb" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id     = local.database_subnet_ids
  vpc_security_group_ids = [local.mongodb_sg_id]
  #iam_instance_profile = aws_iam_instance_profile.mongodb.name
  tags = merge(
    local.common_tags, 
  {
    Name = "${var.project}-${var.environment}-mongodb"
  }
  )

}

#terraform_data is a custom resource that we are creating to execute the bootstrap script on the mongodb instance after it is created. 
#We are using the triggers_replace argument to trigger the execution of the bootstrap script whenever the mongodb instance is replaced. 

resource "terraform_data" "bootstrap_mongodb" {
  triggers_replace = [aws_instance.mongodb.id]
  
  #The connection block is used to specify the connection details for the remote-exec provisioner. 
  connection { 
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
  }

#The provisioner block is used to specify the commands that we want to execute on the remote server. 
  provisioner "file" { 
    source = "bootstrap.sh" #local file path
    destination = "/tmp/bootstrap.sh" #destination path on the remote server
  }

  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh mongodb ${var.environment}"
     ]
  }
}

#Redis instance
resource "aws_instance" "redis" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id     = local.database_subnet_ids
  vpc_security_group_ids = [local.redis_sg_id]
  #iam_instance_profile = aws_iam_instance_profile.redis.name
  tags = merge(
    local.common_tags, 
  {
    Name = "${var.project}-${var.environment}-redis"
  }
  )

}

resource "terraform_data" "bootstrap_redis" {
  triggers_replace = [aws_instance.redis.id]
  
  connection { 
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.redis.private_ip
  }

  provisioner "file" { 
    source = "bootstrap.sh" #local file path
    destination = "/tmp/bootstrap.sh" #destination path on the remote server
  }

  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh redis ${var.environment}"
     ]
  }
}

#mysql instance
resource "aws_instance" "mysql" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id     = local.database_subnet_ids
  vpc_security_group_ids = [local.mysql_sg_id]
  #iam_instance_profile = aws_iam_instance_profile.mysql.name
  tags = merge(
    local.common_tags, 
  {
    Name = "${var.project}-${var.environment}-mysql"
  }
  )

}

resource "terraform_data" "bootstrap_mysql" {
  triggers_replace = [aws_instance.mysql.id]
  
  connection { 
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mysql.private_ip
  }

  provisioner "file" { 
    source = "bootstrap.sh" #local file path
    destination = "/tmp/bootstrap.sh" #destination path on the remote server
  }

  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh mysql ${var.environment}"
     ]
  }
}

#rabbitmq instance
resource "aws_instance" "rabbitmq" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  subnet_id     = local.database_subnet_ids
  vpc_security_group_ids = [local.rabbitmq_sg_id]
  #iam_instance_profile = aws_iam_instance_profile.rabbitmq.name
  tags = merge(
    local.common_tags, 
  {
    Name = "${var.project}-${var.environment}-rabbitmq"
  }
  )

}

resource "terraform_data" "bootstrap_rabbitmq" {
  triggers_replace = [aws_instance.rabbitmq.id]
  
  connection { 
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.rabbitmq.private_ip
  }

  provisioner "file" { 
    source = "bootstrap.sh" #local file path
    destination = "/tmp/bootstrap.sh" #destination path on the remote server
  }

  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh rabbitmq ${var.environment}"
     ]
  }
}
