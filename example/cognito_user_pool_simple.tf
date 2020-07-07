module "simple_user_pool" {
  source = "../."

  name = "example-simple"
}


output "simple_user_pool_arn" {
  description = "Cognito User Pool ARN"
  value       = module.simple_user_pool.user_pool_arn
}

output "simple_user_pool_endpoint" {
  description = "Cognito User Pool endpoint"
  value       = module.simple_user_pool.user_pool_endpoint
}

output "simple_user_pool_id" {
  description = "Cognito User Pool ID"
  value       = module.simple_user_pool.user_pool_id
}
