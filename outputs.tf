# Extract the bash command to connect to the database with psql
output "pg_europe_psql" {
  value       = elestio_postgresql.pg_europe.database_admin.command
  description = "This is the bash command to connect to the europe database with psql"
  sensitive   = true
}

# Extract the bash command to connect to the database with psql
output "pg_asia_psql" {
  value       = elestio_postgresql.pg_asia.database_admin.command
  description = "This is the bash command to connect to the asia database with psql"
  sensitive   = true
}
