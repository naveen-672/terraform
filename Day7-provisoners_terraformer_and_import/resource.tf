resource "aws_instance" "dev" {
  tags = {
    Name = "dev-server"
  }
  ami           = "ami-01edba92f9036f76e"
  instance_type = "t3.micro"
  key_name      = "MyKeyPair"
  vpc_security_group_ids = ["sg-006d58c252b2ca021"]

  #each local-execprovisioner allows only one command
  provisioner "local-exec" {
    command = "echo Hello, World! && echo ${self.public_ip}"
  }

  provisioner "local-exec" {
    command = "touch ./hello.txt"
  }

  #After the instance is created, terraform sees the remote-exec provisioner.Terraform uses the connection
  #block to establish an SSH connection from your local machine to the EC2 instance.
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("/Users/chandanapeddamallagari/downloads/MyKeyPair.pem")
    host        = self.public_ip
  }

  #remote-exec allows multiple commands to be executed on the remote instance using inline and we want 
  #to execute scripts we use script/scripts instead of inline
  provisioner "remote-exec" {
    inline = ["sudo yum install -y httpd", "sudo systemctl start httpd", "sudo systemctl enable httpd"]
  }

  #file provisioner allows you to copy files or directories from the machine executing Terraform to the newly created resource.
  #we can only copy files only if we can establish an SSH connection to resource only ec2 and azure vms and google compute engine instances are supported.
  provisioner "file" {
    source = "./provider.tf"
    destination = "/home/ec2-user/provider.tf"
  }
}

#terraformer is an infrastructure management tool that allows you to import existing infrastructure
#from cloud
