resource "tls_private_key" "hashidog" {
  algorithm = "RSA"
}

resource "aws_key_pair" "hashidog" {
  key_name   = "hashidog_keypair"
  public_key = tls_private_key.hashidog.public_key_openssh
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "random_shuffle" "public_subnets" {
  input        = module.vpc.public_subnets
  result_count = 1
}

resource "aws_instance" "hashidog" {
  count = 2
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.hashidog.key_name
  associate_public_ip_address = true
  subnet_id                   = random_shuffle.public_subnets.result[0]
  vpc_security_group_ids      = [aws_security_group.hashidog.id]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = tls_private_key.hashidog.private_key_pem
    host        =  self.public_ip
  }

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo apt -y update",
      "sleep 15",
      "sudo apt -y update",
      "sudo apt -y install apache2",
      "sudo systemctl start apache2",
      "sudo chown -R ubuntu:ubuntu /var/www/html",
      "chmod +x *.sh",
      "PLACEHOLDER=${var.placeholder} WIDTH=${var.width} HEIGHT=${var.height} PREFIX=${var.prefix} ./deploy_app.sh",
      "sudo apt -y install cowsay",
      "cowsay -f tux 'Mooooooorrrrnin!'",
    ]
  }
}
