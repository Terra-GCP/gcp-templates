#!/bin/sh

#................................................. gcp-folder ..............................................#

case $1 in

    gcp-folder)
    cd gcp-templates/gcp-folder/template/

    PROJECT_ID="prj-o-tf-sa"
    RED='\033[0;31m'
    BLUE_BOLD='\033[1;34m'
    GREEN_BOLD='\033[1;32m'
    CYAN_BOLD='\033[1;96m'
    
    gcloud config set project $PROJECT_ID
    export GOOGLE_APPLICATION_CREDENTIALS=/home/admin_/prj-o-tf-sa.json
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}Terraform Initialization Started, Please wait......!!!!"
    #terraform init
    terraform init -upgrade
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    
    JSON_FILE="../input-json-file/folders.tfvars.json"
    PLAN_FILE="../plan-file/folders-tf-plan.json"

    echo -e "${CYAN_BOLD}Terraform Plan Initiated, Please wait......!!!!"
    terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}Terraform Apply is going to start, Please wait......!!!!"
    echo -e "${CYAN_BOLD}terraform apply $PLAN_FILE"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo -e "${CYAN_BOLD}Answer: $ans"
    if [ $ans == "y" ]
    then
    terraform apply $PLAN_FILE
    else
    echo -e "${CYAN_BOLD}Answer is 'n', Hence, exiting."
    fi
    ;;

#................................................ gcp-project ............................................#

    gcp-project)
    cd gcp-templates/gcp-project/template/

    PROJECT_ID="prj-o-tf-sa"
    RED='\033[0;31m'
    BLUE_BOLD='\033[1;34m'
    GREEN_BOLD='\033[1;32m'
    CYAN_BOLD='\033[1;96m'

    gcloud config set project $PROJECT_ID
    export GOOGLE_APPLICATION_CREDENTIALS=/home/admin_/prj-o-tf-sa.json
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}Terraform Initialization Started, Please wait......!!!!"
    #terraform init
    terraform init -upgrade
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    
    JSON_FILE="../input-json-file/projects.tfvars.json"
    PLAN_FILE="../plan-file/projects-tf-plan.json"

    echo -e "${CYAN_BOLD}Terraform Plan Initiated, Please wait......!!!!"
    terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}Terraform Apply is going to start, Please wait......!!!!"
    echo -e "${CYAN_BOLD}terraform apply $PLAN_FILE"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo -e "${CYAN_BOLD}Answer: $ans"
    if [ $ans == "y" ]
    then
    terraform apply $PLAN_FILE
    else
    echo -e "${CYAN_BOLD}Answer is 'n', Hence, exiting."
    fi
    ;;

#................................................ gcp-project ............................................#

    gcp-network)
    cd gcp-templates/gcp-network/template/

    PROJECT_ID="prj-o-tf-sa"
    RED='\033[0;31m'
    BLUE_BOLD='\033[1;34m'
    GREEN_BOLD='\033[1;32m'
    CYAN_BOLD='\033[1;96m'

    gcloud config set project $PROJECT_ID
    export GOOGLE_APPLICATION_CREDENTIALS=/home/admin_/prj-o-tf-sa.json
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}Terraform Initialization Started, Please wait......!!!!"
    #terraform init
    terraform init -upgrade
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    
    JSON_FILE="../input-json-file/network.tfvars.json"
    PLAN_FILE="../plan-file/network-tf-plan.json"

    echo -e "${CYAN_BOLD}Terraform Plan Initiated, Please wait......!!!!"
    terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}Terraform Apply is going to start, Please wait......!!!!"
    echo -e "${CYAN_BOLD}terraform apply $PLAN_FILE"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo -e "${CYAN_BOLD}Answer: $ans"
    if [ $ans == "y" ]
    then
    terraform apply $PLAN_FILE
    else
    echo -e "${CYAN_BOLD}Answer is 'n', Hence, exiting."
    fi
    ;;

#................................................. gcp-mgmt ..............................................#



    gcp-mgmt)
    cd gcp-templates/gcp-mgmt/template/

    PROJECT_ID="prj-o-tf-sa"
    RED='\033[0;31m'
    BLUE_BOLD='\033[1;34m'
    GREEN_BOLD='\033[1;32m'
    CYAN_BOLD='\033[1;96m'

    gcloud config set project $PROJECT_ID
    export GOOGLE_APPLICATION_CREDENTIALS=/home/admin_/prj-o-tf-sa.json
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}Terraform Initialization Started, Please wait......!!!!"
    terraform init
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"

    JSON_FILE="../input-json-file/mgmt.tfvars.json"
    PLAN_FILE="../plan-file/mgmt-tf-plan.json"

    echo -e "${CYAN_BOLD}Terraform Plan Initiated, Please wait......!!!!"
    terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}Terraform Apply is going to start, Please wait......!!!!"
    echo -e "${CYAN_BOLD}terraform apply $PLAN_FILE"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo -e "${CYAN_BOLD}Answer: $ans"
    if [ $ans == "y" ]
    then
    terraform apply $PLAN_FILE
    else
    echo -e "${CYAN_BOLD}Answer is 'n', Hence, exiting."
    fi
    ;;

    #............................................. gcp-resources .........................................#

    gcp-resources)
    cd gcp-templates/gcp-resources/template/

    PROJECT_ID="prj-o-15032023-tf-demand-sa"
    RED='\033[0;31m'
    BLUE_BOLD='\033[1;34m'
    GREEN_BOLD='\033[1;32m'
    CYAN_BOLD='\033[1;96m'

    gcloud config set project $PROJECT_ID
    export GOOGLE_APPLICATION_CREDENTIALS=/home/admin_/prj-o-15032023-tf-demand-sa.json

    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}Terraform Initialization Started, Please wait......!!!!"
    #terraform init
    terraform init -upgrade
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD}------------------------------------------------------------------------------"

    JSON_FILE="../input-json-file/resources.tfvars.json"
    PLAN_FILE="../plan-file/resources-tf-plan.json"
    
    echo -e "${CYAN_BOLD} Terraform Plan Initiated, Please wait......!!!!"
    terraform plan -var-file=$JSON_FILE -out=$PLAN_FILE

    echo -e "${CYAN_BOLD} ------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD} ------------------------------------------------------------------------------"
    echo -e "${CYAN_BOLD} Terraform Apply is going to start, Please wait......!!!!"
    echo -e "${CYAN_BOLD}terraform apply $PLAN_FILE"
    read -p "Your infrastructure is getting changed. Are you Sure ? y or n: " ans
    echo -e "${CYAN_BOLD} Answer: $ans"
    if [ $ans == "y" ]
    then
    terraform apply $PLAN_FILE
    else
    echo -e "${CYAN_BOLD}Answer is 'n', Hence, exiting."
    fi
    ;;
    
*)
echo -e "${CYAN_BOLD}ERROR :: Baseline $1 is invalid"
exit 1
;;
esac