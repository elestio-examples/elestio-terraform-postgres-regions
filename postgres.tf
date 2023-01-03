# Create a PostgreSQL Service in Europe
resource "elestio_postgresql" "pg_europe" {
  project_id    = elestio_project.pg_project.id
  server_name   = "pg-europe"
  server_type   = "MICRO-1C-1G"
  provider_name = "lightsail"
  datacenter    = "eu-central-1"
  support_level = "level1"
  admin_email   = var.elestio_email
}

# Create a PostgreSQL Service in Asia
resource "elestio_postgresql" "pg_asia" {
  project_id    = elestio_project.pg_project.id
  server_name   = "pg-asia"
  server_type   = "MICRO-1C-1G"
  provider_name = "lightsail"
  datacenter    = "ap-northeast-2"
  support_level = "level1"
  admin_email   = var.elestio_email
}
