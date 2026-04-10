terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.37.0"
    }
  }

  #configuring remote state in AWS S3
  backend "s3" {
    bucket         = "remote-state-aws-pratyu-dev" # repalce with unique bucket name
    key            = "roboshop-dev-sg.tfstate" #key should be changed elase the same .tfstate will updtae which is wrong
    region         = "us-east-1"
    encrypt = true
    use_lockfile = true  #this lock is mandatory to make sure .state file is not corupted when different users are using
    
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}