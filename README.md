# devops_demokp

Pipeline Overview
Application: Node.js REST API with MongoDB
Flow: Code → Docker → Azure Container Registry → Kubernetes (AKS) → Production
How Each Tool Fits Together:

Docker: Containerizes the application for consistent deployment across environments
Terraform: Provisions Azure infrastructure (AKS cluster, ACR, CosmosDB)
Kubernetes: Orchestrates containers with scaling, health checks, and service discovery
Ansible: Automates deployment tasks and configuration management
Jenkins: Orchestrates the entire CI/CD pipeline
Azure: Provides cloud infrastructure and managed services

Key Workflow Steps:

Developer pushes code → Jenkins detects changes
Jenkins builds and tests → Creates Docker image
Image pushed to ACR → Scanned for vulnerabilities
Ansible deploys to K8s → Using infrastructure from Terraform
Health checks verify → Application is live

Why This Architecture Works:

Separation of Concerns: Each tool has a specific role
Infrastructure as Code: Everything is version-controlled and reproducible
Scalability: K8s can auto-scale based on demand
Security: Images scanned, secrets managed properly
Rollback Capability: Easy to revert to previous versions