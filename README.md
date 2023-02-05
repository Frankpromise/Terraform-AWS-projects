# Terraform-AWS-projects

This Repo will contain several terraform aws projects for those looking to build a terraform project portfolio

1. [Task 1: encrpyting s3 events sent to sns topic](https://github.com/Frankpromise/Terraform-AWS-projects/tree/master/sns-topic) 

configure s3 events to be sent to an SNS topic. This way, the topic is able to publish the message to several endpoints like HTTPS, Lambda, Email and so on.

✅Its also not enough to publish the notifications, You should also consider adding a layer of security. To achieve this:

👉🏻 AWS has a server side encryption(SSE) for SNS which when enabled, is able to publish messages in an encrypted mode and its only decrypted when delivered to the endpoint.

In my example  I created a KMS key which is used to encrypt and decrypt the message, and also attached a policy that allows an account owner to administrate the key and allow the bucket to use it.


2. [Task 2: Host a static website on s3 using CDN and Route53](https://github.com/Frankpromise/Terraform-AWS-projects/tree/master/cdn-s3) 


