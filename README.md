# azure-virtual-machine-terraform

for this repo you will able to provision
- azure vnet
- azure subnet
- azure nsg
- create ssh-key and download to working directory
- azure vm
- install docker and docker-compose
- run docker-compose file from working directory

## service principal

when you create resource on azure wiht terraform first you need a service account. on azure this name is "service principal" 
create app registration and create secret on cllient secret menu. 
copy this value because you can not afterwise. 
go to subscription and create role assingment from IAM. give contirbutor role for previous app registration. 

then you can write terraform.tfvars this values.

```
client_id       = ""
client_secret   = ""
tenant_id       = ""
subscription_id = ""
```

currently this repo contains this variable key on variable.tf. if you dont want write on terraform.tfvars you can seperate this valus with different file. like secrets.tfvars.
but if you do that you need mention this file while terraform plan or apply. 

```
terraform plan -var-file="secrets.tfvars"
terraform apply -var-file="secrets.tfvars"
```

<img width="939" alt="image" src="https://github.com/user-attachments/assets/edb8cdf0-c89e-4ebd-9b77-4a8cb05a5acc">


