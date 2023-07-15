terraform {
  required_providers {
    elestio = {
      source  = "elestio/elestio"
      version = "0.10.0" # check out the latest version available
    }
  }
}

# Configure the Elestio Provider with your credentials
provider "elestio" {
  email     = var.elestio_email
  api_token = var.elestio_api_token
}

# Create a Project
resource "elestio_project" "pg_project" {
  name             = "PostgreSQL Project"
  description      = "Contains a postgres database in Europe and Asia"
  technical_emails = var.elestio_email
}

# Create a PostgreSQL Service in Europe
resource "elestio_postgresql" "pg_europe" {
  project_id    = elestio_project.pg_project.id
  server_name   = "pg-europe"
  provider_name = "lightsail"
  datacenter    = "eu-central-1"
  server_type   = "MICRO-1C-1G"
}

# Create a PostgreSQL Service in Asia
resource "elestio_postgresql" "pg_asia" {
  project_id    = elestio_project.pg_project.id
  server_name   = "pg-asia"
  provider_name = "lightsail"
  datacenter    = "ap-northeast-2"
  server_type   = "MICRO-1C-1G"
}

# Output the command that can be used to connect to the database
output "pg_europe_command" {
  value       = elestio_postgresql.pg_europe.database_admin.command
  description = "This command is provided by Elestio to connect to the europe database with psql"
  sensitive   = true
}

# Output the command that can be used to connect to the database
output "pg_asia_command" {
  value       = elestio_postgresql.pg_asia.database_admin.command
  description = "This command is provided by Elestio to connect to the asia database with psql"
  sensitive   = true
}
