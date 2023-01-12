variable "name" {
  type        = string
  description = "(optional) describe your variable"
}
variable "azure_role_name" {
  description = "A unique UUID/GUID for this Role Assignment - one will be generated if not specified."
  default     = null
}

variable "azure_role_description" {
  description = "The description for this Role Assignment"
  default     = null
}

variable "assignments" {
  description = "The list of role assignments to this service principal"
  type = list(object({
    scope                = string
    role_definition_name = string
  }))
  default = []
}
