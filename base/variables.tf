variable "gh_token" {
  type        = string
  description = "GitHub Personal Access Token for authentication"
  sensitive   = true
}

variable "username" {
  type        = string
  description = "Dummy API username"
  sensitive   = true
}

variable "password" {
  type        = string
  description = "Dummy API password"
  sensitive   = true
}