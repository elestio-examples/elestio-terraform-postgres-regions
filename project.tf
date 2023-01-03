# Create a Project
resource "elestio_project" "pg_project" {
  name             = "PostgreSQL Project"
  description      = "Contains a postgres database in Europe and Asia"
  technical_emails = var.elestio_email
}
