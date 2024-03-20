variable "identifier" {
  description = "Unique identifier to differentiate global resources."
  type        = string
  validation {
    condition     = length(var.identifier) > 2
    error_message = "Identifier must be at least 3 characters"
  }
}

variable "effect" {
  description = "Effect of the policy statement, e.g. 'Allow' or 'Deny'."
  type        = string
  default     = "Allow"
}

variable "actions" {
  description = "List of actions for this IAM policy to allow."
  type        = list(string)
  default     = []
}

variable "resources" {
  description = "List of resources to allow this IAM policy access to."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
