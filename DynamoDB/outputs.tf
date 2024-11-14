output db_instance_arn {
  value       = module.db.db_instance_arn
  description = "The ARN of the RDS instance"
}

output db_instance_endpoint {
  value       = module.db.db_instance_endpoint
  description = "The connection endpoint"
}

