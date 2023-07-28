# iac 👷

IaC ([Infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code)) is the process of managing and provisioning computer data centers through machine-readable definition files, rather than physical hardware configuration or interactive configuration tools.

Here I document my learnings on the tools I find most relevant for this domain: [Terraform](https://www.terraform.io/), [Ansible](https://www.ansible.com/), [Docker](https://www.docker.com/), and [Kubernetes](https://kubernetes.io/).

## Terraform

TLDR: it allows you to manage cloud infrastructure resources like VMs, networking, DNS, cloud-specific access and/or permissions (also called policies), etc.

### The Terraform workflow

It has three stages:

- **Write**  
  You define resources, which may be across multiple cloud providers and services. For example, you might create a configuration to deploy an application on virtual machines in a Virtual Private Cloud (VPC) network with security groups and a load balancer
- **Plan**  
  Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration
- **Apply**  
  On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. For example, if you update the properties of a VPC and change the number of virtual machines in that VPC, Terraform will recreate the VPC before scaling the virtual machines

### Syntax

Terraform files are named with a `.tf` extension and are consisted of HCL blocks:

```tf
# main.tf

terraform {

}
```
