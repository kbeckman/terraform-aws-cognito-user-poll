# This is a working, advanced example for the terraform-aws-cognito-user-pool setup / implementation. Several blocks
# below are left commented-out because they require other valid resources (i.e. Lambda function ARNs) and would likely
# fail when used in a new environment. The commented blocks remain for documentation purposes detailing the various
# usage of configuration varialbe combinations.
module "advanced_user_pool" {
  source = "../."

  name = "example-advanced"

  alias_attributes         = ["email"]
  auto_verified_attributes = ["email"]

  # allow_admin_create_user_only        = false
  # invite_message_template_sms_message = "{username}, here's your code - {####}."
  # invite_message_template = {
  #   email_subject = "Invite Email Subject"
  # }

  # email_configuration_source_arn = "arn:aws:ses:us-west-2:123456789012:identity/example.com"
  # email_configuration = {
  #   email_sending_account  = "COGNITO_DEFAULT"
  #   reply_to_email_address = "jane.doe@example.com"
  # }

  # lambda_config_define_auth_challenge = "arn:aws:lambda:us-west-2:123456789012:function:define-auth-challenge"
  # lambda_config = {
  #   create_auth_challenge = "arn:aws:lambda:us-west-2:123456789012:function:create-auth-challenge"
  #   post_authentication   = "arn:aws:lambda:us-west-2:123456789012:function:post-authentication"
  # }

  # password_policy_minimum_length                   = 15
  # password_policy_require_lowercase                = true
  # password_policy_require_numbers                  = true
  # password_policy_require_symbols                  = false
  # password_policy_require_uppercase                = true
  # password_policy_temporary_password_validity_days = 7
  password_policy = {
    minimum_length                   = 12
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = false
    require_uppercase                = true
    temporary_password_validity_days = 7
  }

  # mfa_configuration = "ON"
  # sms_configuration = {
  #   external_id    = "example-id"
  #   sns_caller_arn = "arn:aws:iam::123456789012:user/jane-doe"
  # }

  # software_token_mfa_configuration_enabled = true
  # software_token_mfa_configuration = {
  #   enabled = false
  # }

  # verification_message_template_sms_message = "Alternate code confirmation - {####}"
  # verification_message_template = {
  #   default_email_option = "CONFIRM_WITH_CODE"
  #   sms_message          = "Confirm your account with this code - {####}."
  # }
}


output "advanced_user_pool_arn" {
  description = "Cognito User Pool ARN"
  value       = module.advanced_user_pool.user_pool_arn
}

output "advanced_user_pool_endpoint" {
  description = "Cognito User Pool endpoint"
  value       = module.advanced_user_pool.user_pool_endpoint
}

output "advanced_user_pool_id" {
  description = "Cognito User Pool ID"
  value       = module.advanced_user_pool.user_pool_id
}
