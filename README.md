Assignment 1
Create a new directory and write a terraform code which would create Ec2 instance and use Existing Security Group and Key.

Assignment 2
Create a new directory and write a terraform code which would create Security Group and new Key and create Ec2 instance and use newly created Security Group and Key.The security group should allow incoming traffic on port 22 (SSH) and port 80 (HTTP).

Assignment 3
Write a terraform code would create following resources

keypair (Public key– ON AWS – Private -key – Local)
Display a pvt key on Console
Create a Security group must open 80 Port
Create a Ec2 instance Ubuntu using the same Key & SecurityGroup which you created above.
You must install/Start apache2 in EC2 instance
$ apt-get update
$ apt-get install apache2 -y
$ systemctl start apache2
