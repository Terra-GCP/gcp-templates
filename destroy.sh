#!/bin/sh

#................................................. gcp-org ..............................................#


case $1 in

    gcp-org)
    cd gcp-env1/gcp-org/org-template/
    export GOOGLE_APPLICATION_CREDENTIALS=/home/amit_kumar/eastern-lodge-374307-5eedac2e2288.json
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Destruction of resources is going to start, Please wait......!!!!"
    read -p "Your infrastructure will be destroyed. Are you Sure ? y or n: " ans
    echo "Answer: $ans"
    if [ $ans == "y" ]
    then
        terraform destroy
    else
        echo "Answer is 'n', Hence, exiting."
    fi
    ;;

#................................................ gcp-devops ............................................#

    gcp-devops)
    cd gcp-env1/gcp-devops/input-json-file/
    export GOOGLE_APPLICATION_CREDENTIALS=/home/amit_kumar/eastern-lodge-374307-5eedac2e2288.json
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Destruction of resources is going to start, Please wait......!!!!"
    read -p "Your infrastructure will be destroyed. Are you Sure ? y or n: " ans
    echo "Answer: $ans"
    if [ $ans == "y" ]
    then
        terraform destroy
    else
        echo "Answer is 'n', Hence, exiting."
    fi
    ;;

#................................................ gcp-demand ............................................#

    gcp-demand)
    cd gcp-env1/gcp-demand/input-json-file/
    export GOOGLE_APPLICATION_CREDENTIALS=/home/amit_kumar/eastern-lodge-374307-5eedac2e2288.json
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Destruction of resources is going to start, Please wait......!!!!"
    read -p "Your infrastructure will be destroyed. Are you Sure ? y or n: " ans
    echo "Answer: $ans"
    if [ $ans == "y" ]
    then
        terraform destroy
    else
        echo "Answer is 'n', Hence, exiting."
    fi
    ;;

#.......................................... gcp-demand-resources ........................................#

    gcp-demand-resources)
    cd gcp-env1/gcp-demand-resources/resources-template/
    export GOOGLE_APPLICATION_CREDENTIALS=/home/amit_kumar/eastern-lodge-374307-5eedac2e2288.json
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Destruction of resources is going to start, Please wait......!!!!" 
    read -p "Your infrastructure will be destroyed. Are you Sure ? y or n: " ans
    echo "Answer: $ans"
    if [ $ans == "y" ]
    then
        terraform destroy
    else
        echo "Answer is 'n', Hence, exiting."
    fi
    ;;

#........................................... gcp-terraform-mgmt .........................................#

    gcp-terraform-mgmt)
    cd gcp-env1/gcp-terraform-mgmt/input-json-file/
    export GOOGLE_APPLICATION_CREDENTIALS=/home/amit_kumar/eastern-lodge-374307-5eedac2e2288.json
    echo "------------------------------------------------------------------------------"
    echo "------------------------------------------------------------------------------"
    echo "Terraform Destruction of resources is going to start, Please wait......!!!!"
    read -p "Your infrastructure will be destroyed. Are you Sure ? y or n: " ans
    echo "Answer: $ans"
    if [ $ans == "y" ]
    then
        terraform destroy
    else
        echo "Answer is 'n', Hence, exiting."
    fi
    ;;
*)
echo "ERROR :: Baseline $1 is invalid"
exit 1
;;
esac