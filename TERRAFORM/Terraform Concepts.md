🧰 Section 1: Core Terraform Concepts
Q1. What is Terraform and how does it fit into the DevOps ecosystem?

Answer:
Terraform is an open-source Infrastructure as Code (IaC) tool that allows us to define and provision infrastructure declaratively. It integrates into DevOps workflows to:

Automate environment provisioning

Ensure consistent deployments across multiple environments (e.g., dev, staging, prod)

Version control infrastructure code using Git

Enable GitOps and CI/CD-driven infrastructure pipelines.

Scenario Example:
At a previous project, we used Terraform to build an entire AWS EKS cluster environment across 3 VPCs with security groups, load balancers, autoscaling groups, and monitoring—all triggered through a GitLab CI/CD pipeline.

🧭 Section 2: State Management & Collaboration
Q2. How do you manage Terraform state files in a team?

Answer:

Use remote state backends like Amazon S3 with Terraform Cloud or HashiCorp Consul for state locking and versioning.

Use DynamoDB for state locking when using S3 backend.

Restrict write access and enforce locking to avoid race conditions.

Scenario Example:
We had a team of 8 DevOps engineers working on multi-region AWS infrastructure. Initially, conflicts happened when two engineers applied at the same time. We solved it by moving the state file to S3 with DynamoDB lock. This ensured only one plan/apply ran at a time.

Q3. What is the impact if a Terraform state file is accidentally deleted?

Answer:

Terraform loses track of the infrastructure it manages.

Infrastructure remains running but cannot be updated or destroyed safely.

To recover:

Restore state file from S3 versioning or Terraform Cloud history.

If no backup, use terraform import to rebuild the state file.

Scenario Example:
A junior engineer manually deleted the S3 bucket holding our state. Since we had S3 versioning enabled, we restored it quickly. As a best practice, we later implemented bucket policies and MFA delete.

🧱 Section 3: Terraform Modules & Reusability
Q4. How do you structure Terraform for large-scale infrastructure?

Answer:

Use modular architecture: Create reusable modules for VPC, Security Groups, EC2, EKS, etc.

Use root modules for different environments (dev, staging, prod).

Maintain separate workspaces or directories per environment.

Keep variables, outputs, and state isolated.

Scenario Example:
For a multi-account AWS deployment, I created separate Terraform modules for networking, compute, monitoring, and security. Using versioned modules from a private Git repository helped maintain consistent infrastructure across 4 business units.

Q5. How do you version control Terraform modules?

Answer:

Store modules in Git.

Tag versions for stable releases.

Reference specific tags or branches in the root module.

Integrate with CI/CD to run tests before merging changes.

🌐 Section 4: Workspaces & Multi-Environment
Q6. When would you use Terraform workspaces vs separate state files?

Answer:

Workspaces are best for small variations (e.g., dev/staging/prod with the same structure).

Separate state files or directories are better for large environments with different configurations, networking, or compliance.

Scenario Example:
For a multi-region Kubernetes cluster deployment, I used separate workspaces for dev and staging. But for production, we maintained a separate state file to isolate failures and avoid accidental overwrites.

🔐 Section 5: Secrets & Security
Q7. How do you manage sensitive information in Terraform?

Answer:

Avoid hardcoding secrets in .tf files.

Use variables marked as sensitive = true.

Integrate with secret managers like AWS Secrets Manager, HashiCorp Vault, or environment variables.

Restrict access to state files because sensitive data may appear there.

⚙️ Section 6: Terraform with CI/CD
Q8. How do you integrate Terraform into a CI/CD pipeline?

Answer:

Use Terraform init, fmt, validate, and plan in pipeline stages.

Use manual approval or policy checks before apply.

Implement remote backends and service principals for authentication.

Use pipeline variables for environment-specific configuration.

Scenario Example:
We integrated Terraform with GitLab CI/CD where:

terraform plan ran on merge request

Security checks were enforced via policy as code

terraform apply required a manual approval step for production.

🧮 Section 7: Advanced & Real-World Scenarios
Q9. Scenario: You run terraform apply and it fails halfway. What do you do?

Answer:

Identify the failed resource in the logs.

Check the current state (terraform state list).

Fix the underlying issue (e.g., IAM permissions, network dependency).

Re-run terraform apply — Terraform is idempotent and will resume from where it failed.

If state is inconsistent, use terraform state rm or terraform taint if needed.

Q10. Scenario: You need to create identical infrastructure across 5 AWS accounts. How would you achieve this?

Answer:

Create reusable Terraform modules.

Use separate workspaces or pipelines per account.

Use variables for account IDs, regions, and resource names.

Authenticate using IAM roles or OIDC.

Use a central pipeline to trigger deployments in each account sequentially or in parallel.

Q11. Scenario: How would you handle a breaking change in a Terraform module used by multiple teams?

Answer:

Introduce versioning (e.g., v1.0, v2.0).

Communicate and document the breaking change.

Allow teams to upgrade at their own pace.

Provide migration steps or backward-compatible defaults.

Test extensively in lower environments before upgrading production.

🪛 Section 8: Debugging & Troubleshooting
Q12. How do you debug Terraform issues?

Use TF_LOG=TRACE or TF_LOG=DEBUG environment variables.

Run terraform plan to identify drift.

Use terraform state show to inspect current resource state.

Check cloud provider console for errors.

Leverage terraform refresh to sync state with real infrastructure.

🧼 Section 9: Drift Detection & Automation
Q13. How do you handle infrastructure drift?

Run terraform plan periodically or integrate drift detection in CI/CD.

Use terraform apply to reconcile differences.

Use terraform import for manually created resources.

Use policies to prevent manual changes.

Scenario Example:
In one project, developers manually added an S3 bucket for testing. During the next Terraform run, it failed. We imported the resource into the state file and enforced Service Control Policies (SCP) to prevent manual provisioning in production.

🪙 Section 10: Terraform Best Practices

Keep .tfstate secure and versioned.

Use descriptive variable and output names.

Modularize code for reusability.

Automate validation and security checks.

Apply least privilege IAM policies.

Maintain consistent naming conventions.

Implement policy as code using Open Policy Agent or Terraform Sentinel.

✅ Pro Tip for Principal DevOps Interviews:
For 13+ years of experience, interviewers often test architecture decisions rather than just syntax. Be ready to explain:

Why you used Terraform over CloudFormation or ARM templates

How you designed scalable module structures

How you integrated Terraform with cloud governance and security

How you handled disaster recovery and drift.