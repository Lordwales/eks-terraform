# Simple Microservice

A terraform project to setup Elastic Kubernetes Service on AWS

---

## Requirements

For this project, you will AWS Account, Terraform installed on your local machine, access to a terminal.

### AWS
- #### AWS Account Creation

  1. go on [AWS website](https://aws.amazon.com/account/signup) and signup for an account
  
  2. Setup IAM permissions listed on the [EKS module documentation](https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/docs/iam-permissions.md)

  3. Download AWS CLI to configure your machine with your AWS credentials. Folow the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html).

  4. Install ```kubectl```. This will be used to access your clusters after it has been deployed. Follow instructions [here](https://kubernetes.io/docs/tasks/tools/install-kubectl/)


- ### TERRAFORM INSTALLATION
Folllow the instructions [here](https://learn.hashicorp.com/tutorials/terraform/install-cli) to install terraform




## PROJECT SETUP

1. Clone this github repository ```git clone https://github.com/Lordwales/eks-terraform.git```

2. cd into the ```eks-terraform``` directory.

3. On your terminal while in the root of the repository, run the following commands in sequence:
```
terraform init       #this will initialize the terrafom project and download the required plugins and create a local backend.

terraform plan       #this will display all the resources that are planed to be deployed on AWS.

terraform apply      # this will run our terraform code and deploy those resources to AWS.
```

## ADD CLUSTER TO CONFIG

```aws eks update-kubeconfig --region us-east-1 --name terraformEKScluster```

## VERIFY DEPLOYMENT

Visit the Elastic Kubernetes Service section in your AWS Console to view the details of the newly created cluster.