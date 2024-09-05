cd ../environments/dev
terraform plan -var-file=env.tfvars -out=../../plan.out
terraform show -json ../../plan.out > ../../plan.json