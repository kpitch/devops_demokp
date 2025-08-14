variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-myapi-prod"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "acrmyapiprod"
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "aks-myapi-prod"
}

variable "dns_prefix" {
  description = "DNS prefix for AKS"
  type        = string
  default     = "myapi"
}

variable "node_count" {
  description = "Number of nodes in AKS"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "cosmos_account_name" {
  description = "Name of the Cosmos DB account"
  type        = string
  default     = "cosmos-myapi-prod"
}

variable "database_name" {
  description = "Name of the MongoDB database"
  type        = string
  default     = "myapp"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default = {
    Environment = "production"
    Project     = "myapi"
  }
}