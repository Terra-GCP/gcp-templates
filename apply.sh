#!/bin/sh

#................................................. gcp-folder ..............................................#


case $1 in

    gcp-folder)
    cd gcp-templates/gcp-folder/template/
    export GOOGLE_APPLICATION_CREDENTIALS=/home/admin_/prj-o-tf-sa.json
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Initialization Started, Please wait......!!!!"
    terraform init
    #terraform init -upgrade
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    JSON_FILE="../input-json-file/folders.tfvars.json"
    PLAN_FILE="../plan-file/folders-tf-plan.json"
    echo "Terraform Plan Initiated, Please wait......!!!!"
    terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Apply is going to start, Please wait......!!!!"
    echo "terraform apply $PLAN_FILE"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo "Answer: $ans"
    if [ $ans == "y" ]
    then
    terraform apply $PLAN_FILE
    else
    echo "Answer is 'n', Hence, exiting."
    fi
    ;;

#................................................ gcp-project ............................................#

    gcp-project)
    cd gcp-templates/gcp-project/template/
    export GOOGLE_APPLICATION_CREDENTIALS=/home/admin_/prj-o-tf-sa.json
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Initialization Started, Please wait......!!!!"
    terraform init
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    JSON_FILE="../input-json-file/projects.tfvars.json"
    PLAN_FILE="../plan-file/projects-tf-plan.json"
    echo "Terraform Plan Initiated, Please wait......!!!!"
    terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Apply is going to start, Please wait......!!!!"
    echo "terraform apply $PLAN_FILE"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo "Answer: $ans"
    if [ $ans == "y" ]
    then
    terraform apply $PLAN_FILE
    else
    echo "Answer is 'n', Hence, exiting."
    fi
    ;;

#................................................ gcp-project ............................................#

    gcp-network)
    cd gcp-templates/gcp-network/template/
    export GOOGLE_APPLICATION_CREDENTIALS=/home/admin_/prj-o-tf-sa.json
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Initialization Started, Please wait......!!!!"
    terraform init
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    JSON_FILE="../input-json-file/network.tfvars.json"
    PLAN_FILE="../plan-file/network-tf-plan.json"
    echo "Terraform Plan Initiated, Please wait......!!!!"
    terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Apply is going to start, Please wait......!!!!"
    echo "terraform apply $PLAN_FILE"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo "Answer: $ans"
    if [ $ans == "y" ]
    then
    terraform apply $PLAN_FILE
    else
    echo "Answer is 'n', Hence, exiting."
    fi
    ;;

#................................................. gcp-mgmt ..............................................#

    gcp-mgmt)
    cd gcp-templates/gcp-mgmt/template/
    export GOOGLE_APPLICATION_CREDENTIALS=/home/admin_/prj-o-tf-sa.json
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Initialization Started, Please wait......!!!!"
    terraform init -upgrade
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    JSON_FILE="../input-json-file/mgmt.tfvars.json"
    PLAN_FILE="../plan-file/mgmt-tf-plan.json"
    echo "Terraform Plan Initiated, Please wait......!!!!"
    terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Apply is going to start, Please wait......!!!!"
    echo "terraform apply $PLAN_FILE"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo "Answer: $ans"
    if [ $ans == "y" ]
    then
    terraform apply $PLAN_FILE
    else
    echo "Answer is 'n', Hence, exiting."
    fi
    ;;

    #................................................. gcp-mgmt ..............................................#

    gcp-resources)
    cd gcp-templates/gcp-resources/template/
    export GOOGLE_APPLICATION_CREDENTIALS=/home/admin_/prj-o-15032023-tf-demand-sa.json
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Initialization Started, Please wait......!!!!"
    terraform init
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    JSON_FILE="../input-json-file/resources.tfvars.json"
    PLAN_FILE="../plan-file/resources-tf-plan.json"
    echo "Terraform Plan Initiated, Please wait......!!!!"
    terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Apply is going to start, Please wait......!!!!"
    echo "terraform apply $PLAN_FILE"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo "Answer: $ans"
    if [ $ans == "y" ]
    then
    terraform apply $PLAN_FILE
    else
    echo "Answer is 'n', Hence, exiting."
    fi
    ;;
    
*)
echo "ERROR :: Baseline $1 is invalid"
exit 1
;;
esac

