variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16" # Set a default value that makes sense
}

variable "subnet_names" {
  description = "List of names for the subnets"
  type        = list(string)
  default     = ["web", "app", "business"] # Provide a default value
}

# variable "availability_zones" {
#   description = "List of availability zones to create subnets in"
#   type        = list(string)
#   default     = ["us-west-2a"]  # Provide a default value
# }

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for the subnets. If not provided, it will be calculated automatically."
  type        = list(string)
  default     = [] # Allow calculation or provide an empty list by default
}

variable "region" {
  description = "This is Default region"
  type        = string
  default     = "ap-south-1"

}