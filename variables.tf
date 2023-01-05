variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-2"
}

variable "public_sub_cidrs" {
  default = ["10.10.2.0/24", "10.10.2.0/24"]
}

variable "private_sub_cidrs" {
default = ["10.10.1.0/24", "10.10.1.0/24"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "height" {
  default     = "400"
  description = "Image height in pixels."
}

variable "width" {
  default     = "600"
  description = "Image width in pixels."
}

variable "placeholder" {
  default     = "placedog.net"
  description = "Image-as-a-service URL. Some other fun ones to try are fillmurray.com, placecage.com, placebeard.it, loremflickr.com, baconmockup.com, placeimg.com, placebear.com, placeskull.com, stevensegallery.com, placedog.net"
}

variable "owner" {
  description = "resource owner"
  default     = "George Jetson"
}
variable "prefix" {
  description = "This prefix will be included in the name of most resources."
  default     = "hashidog"
}

variable "num_instances" {
  default = 2
}

variable "ttl" {
  default = "24"
}

variable "TFC_WORKLOAD_IDENTITY_AUDIENCE" {
  
}