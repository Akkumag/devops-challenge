variable "region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "us-east-1"
}

variable "ssh_allowed_cidr" {
  description = "Single CIDR allowed to SSH to the instance, e.g. \"203.0.113.10/32\"."
  type        = string
  # No default on purpose: there's no sane default for "my IP".

  validation {
    condition     = can(cidrhost(var.ssh_allowed_cidr, 0)) && var.ssh_allowed_cidr != "0.0.0.0/0"
    error_message = "ssh_allowed_cidr must be a valid CIDR and must not be 0.0.0.0/0."
  }
}
