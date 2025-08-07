service account
===============
It is non human user that pod uses to run. by default when we create namespace a serviceaccount with name is default is created

1. Create OIDC provider

REGION_CODE=us-east-1
CLUSTER_NAME=roboshop
ACC_ID=338556495561

eksctl utils associate-iam-oidc-provider \
    --region $REGION_CODE \
    --cluster $CLUSTER_NAME \
    --approve

    2. Create policy and attach permissions

arn:aws:iam::338556495561:policy/rabac-sa

eksctl create iamserviceaccount \
--cluster=$CLUSTER_NAME \
--namespace=roboshop \
--name=roboshop-mysql-secret-reader \
--attach-policy-arn=arn:aws:iam::338556495561:policy/rabac-sa \
--override-existing-serviceaccounts \
--region $REGION_CODE \
--approve

