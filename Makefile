.PHONY: terraform init plan clean apply destroy

terraform: plan apply

init: clean
	terraform init

plan: .terraform/plan

.terraform/plan:
	envchain dnsimple terraform plan -input -out .terraform/plan

clean:
	rm .terraform/plan

apply:
	envchain dnsimple terraform apply -auto-approve .terraform/plan

destroy:
	envchain dnsimple terraform destroy -auto-approve
