variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "cluster_name" {
  description = "Cluster_name"
  type        = string
  sensitive   = true
}
