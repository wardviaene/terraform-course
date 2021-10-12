# application_load_balancer
  
These templates implements a application load balancer, and associated necessary steps require for loadbalancing. We used below services : 

- Security groups for instances and loadbalancer
- Target grout attachment for instances
- Template for launching instances
- Load balancer


-- Mention your region, secret and access keys, vpc_id, subnet_ids and ami_id required in the templates.

To run these templates, clone the repository and run `terraform apply` within its own directory.

For example:

```tf
$ git clone https://github.com/wardviaene/terraform-course.git
$ cd terraform-course/application_load_balancer/
$ terraform apply
```
