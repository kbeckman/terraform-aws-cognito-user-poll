locals {
  # If no admin_create_user_config list is provided, build a admin_create_user_config using the default values
  admin_create_user_config = {
    allow_admin_create_user_only = var.allow_admin_create_user_only
  }

  # Build a default device_configuration via the provided map/block or by the individual, top-level variables...
  device_configuration_default = {
    challenge_required_on_new_device      = lookup(var.device_configuration, "challenge_required_on_new_device", null) == null ? var.device_configuration_challenge_required_on_new_device : lookup(var.device_configuration, "challenge_required_on_new_device")
    device_only_remembered_on_user_prompt = lookup(var.device_configuration, "device_only_remembered_on_user_prompt", null) == null ? var.device_configuration_device_only_remembered_on_user_prompt: lookup(var.device_configuration, "device_only_remembered_on_user_prompt")
  }

  device_configuration_first_val          = coalesce(lookup(local.device_configuration_default, "challenge_required_on_new_device"), lookup(local.device_configuration_default, "device_only_remembered_on_user_prompt"), "all-defaults-null")
  device_configuration_all_defaults_null  = local.device_configuration_first_val == "all-defaults-null"
  device_configurations                   = local.device_configuration_all_defaults_null ? [] : [local.device_configuration_default]

  # Build a default email_configuration block (while this is optional, email_sending_account will always be set via the
  # Terraform resource)...
  email_configuration_default = {
    email_sending_account   = lookup(var.email_configuration, "email_sending_account", null) == null ? var.email_configuration_email_sending_account : lookup(var.email_configuration, "email_sending_account")
    from_email_address      = lookup(var.email_configuration, "from_email_address", null) == null ? var.email_configuration_from_email_address : lookup(var.email_configuration, "from_email_address")
    reply_to_email_address  = lookup(var.email_configuration, "reply_to_email_address", null) == null ? var.email_configuration_reply_to_email_address : lookup(var.email_configuration, "reply_to_email_address")
    source_arn              = lookup(var.email_configuration, "source_arn", null) == null ? var.email_configuration_source_arn : lookup(var.email_configuration, "source_arn")
  }

  # Build a default invite_message_template via the provided map/block or by the individual, top-level variables...
  invite_message_template_default = {
    email_message = lookup(var.invite_message_template, "email_message", null) == null ? var.invite_message_template_email_message : lookup(var.invite_message_template, "email_message")
    email_subject = lookup(var.invite_message_template, "email_subject", null) == null ? var.invite_message_template_email_subject : lookup(var.invite_message_template, "email_subject")
    sms_message   = lookup(var.invite_message_template, "sms_message", null) == null ? var.invite_message_template_sms_message : lookup(var.invite_message_template, "sms_message")
  }

  invite_message_template_first_val         = coalesce(lookup(local.invite_message_template_default, "email_message"), lookup(local.invite_message_template_default, "email_subject"), lookup(local.invite_message_template_default, "sms_message"), "all-defaults-null")
  invite_message_template_all_defaults_null = local.invite_message_template_first_val == "all-defaults-null"
  invite_message_templates                  = local.invite_message_template_all_defaults_null ? [] : [local.invite_message_template_default]

  lambda_config_default = {
    create_auth_challenge           = lookup(var.lambda_config, "create_auth_challenge", null) == null ? var.lambda_config_create_auth_challenge : lookup(var.lambda_config, "create_auth_challenge")
    custom_message                  = lookup(var.lambda_config, "custom_message", null) == null ? var.lambda_config_custom_message : lookup(var.lambda_config, "custom_message")
    define_auth_challenge           = lookup(var.lambda_config, "define_auth_challenge", null) == null ? var.lambda_config_define_auth_challenge : lookup(var.lambda_config, "define_auth_challenge")
    pre_authentication              = lookup(var.lambda_config, "pre_authentication", null) == null ? var.lambda_config_pre_authentication : lookup(var.lambda_config, "pre_authentication")
    pre_sign_up                     = lookup(var.lambda_config, "pre_sign_up", null) == null ? var.lambda_config_pre_sign_up : lookup(var.lambda_config, "pre_sign_up")
    pre_token_generation            = lookup(var.lambda_config, "pre_token_generation", null) == null ? var.lambda_config_pre_token_generation : lookup(var.lambda_config, "pre_token_generation")
    post_authentication             = lookup(var.lambda_config, "post_authentication", null) == null ? var.lambda_config_post_authentication : lookup(var.lambda_config, "post_authentication")
    post_confirmation               = lookup(var.lambda_config, "post_confirmation", null) == null ? var.lambda_config_post_confirmation : lookup(var.lambda_config, "post_confirmation")
    user_migration                  = lookup(var.lambda_config, "user_migration", null) == null ? var.lambda_config_user_migration : lookup(var.lambda_config, "user_migration")
    verify_auth_challenge_response  = lookup(var.lambda_config, "verify_auth_challenge_response", null) == null ? var.lambda_config_verify_auth_challenge_response : lookup(var.lambda_config, "verify_auth_challenge_response")
  }

  lambda_config_first_val         = coalesce(lookup(local.lambda_config_default, "create_auth_challenge"), lookup(local.lambda_config_default, "custom_message"), lookup(local.lambda_config_default, "define_auth_challenge"), lookup(local.lambda_config_default, "pre_authentication"), lookup(local.lambda_config_default, "pre_sign_up"), lookup(local.lambda_config_default, "pre_token_generation"), lookup(local.lambda_config_default, "post_authentication"), lookup(local.lambda_config_default, "post_confirmation"), lookup(local.lambda_config_default, "user_migration"), lookup(local.lambda_config_default, "verify_auth_challenge_response"), "all-defaults-null")
  lambda_config_defaults_all_null = local.lambda_config_first_val == "all-defaults-null"
  lambda_configs                  = local.lambda_config_defaults_all_null ? [] : [local.lambda_config_default]

  # Build a default password_policy block (while this is optional, password_policy will always be set via the
  # Terraform resource)...
  password_policy_default = {
    minimum_length                   = lookup(var.password_policy, "minimum_length", null) == null ? var.password_policy_minimum_length : lookup(var.password_policy, "minimum_length")
    require_lowercase                = lookup(var.password_policy, "require_lowercase", null) == null ? var.password_policy_require_lowercase : lookup(var.password_policy, "require_lowercase")
    require_numbers                  = lookup(var.password_policy, "require_numbers", null) == null ? var.password_policy_require_numbers : lookup(var.password_policy, "require_numbers")
    require_symbols                  = lookup(var.password_policy, "require_symbols", null) == null ? var.password_policy_require_symbols : lookup(var.password_policy, "require_symbols")
    require_uppercase                = lookup(var.password_policy, "require_uppercase", null) == null ? var.password_policy_require_uppercase : lookup(var.password_policy, "require_uppercase")
    temporary_password_validity_days = lookup(var.password_policy, "temporary_password_validity_days", null) == null ? var.password_policy_temporary_password_validity_days : lookup(var.password_policy, "temporary_password_validity_days")
  }

  # Build a default sms_configuration via the provided map/block or by the individual, top-level variables...
  sms_configuration_default = {
    external_id     = lookup(var.sms_configuration, "external_id", null) == null ? var.sms_configuration_external_id : lookup(var.sms_configuration, "external_id")
    sns_caller_arn  = lookup(var.sms_configuration, "sns_caller_arn", null) == null ? var.sms_configuration_sns_caller_arn : lookup(var.sms_configuration, "sns_caller_arn")
  }

  sms_configuration_first_val          = coalesce(lookup(local.sms_configuration_default, "external_id", null), lookup(local.sms_configuration_default, "sns_caller_id", null), "all-defaults-null")
  sms_configuration_all_defaults_null  = local.sms_configuration_first_val == "all-defaults-null"
  sms_configurations                   = local.sms_configuration_all_defaults_null ? [] : [local.sms_configuration_default]

  # Build a default software_token_mfa_configuration via the provided map/block or by the individual, top-level variables...
  software_token_mfa_configuration_default = {
    enabled = lookup(var.software_token_mfa_configuration, "enabled", null) == null ? var.software_token_mfa_configuration_enabled : lookup(var.software_token_mfa_configuration, "enabled")
  }

  software_token_mfa_configuration_first_val          = coalesce(lookup(local.software_token_mfa_configuration_default, "enabled", null), "all-defaults-null")
  software_token_mfa_configuration_all_defaults_null  = local.software_token_mfa_configuration_first_val == "all-defaults-null"
  software_token_mfa_configurations                   = local.software_token_mfa_configuration_all_defaults_null ? [] : [local.software_token_mfa_configuration_default]

  # Build a default verification_message_template block (while this is optional, verification_message_template will
  # always be set via the Terraform resource)...
  verification_message_template_default = {
    default_email_option    = lookup(var.verification_message_template, "default_email_option", null) == null ? var.verification_message_template_default_email_option : lookup(var.verification_message_template, "default_email_option")
    email_message           = lookup(var.verification_message_template, "email_message", null) == null ? var.verification_message_template_email_message : lookup(var.verification_message_template, "email_message")
    email_message_by_link   = lookup(var.verification_message_template, "email_message_by_link", null) == null ? var.verification_message_template_email_message_by_link : lookup(var.verification_message_template, "email_message_by_link")
    email_subject           = lookup(var.verification_message_template, "email_subject", null) == null ? var.verification_message_template_email_subject : lookup(var.verification_message_template, "email_subject")
    email_subject_by_link   = lookup(var.verification_message_template, "email_subject_by_link", null) == null ? var.verification_message_template_email_subject_by_link : lookup(var.verification_message_template, "email_subject_by_link")
    sms_message             = lookup(var.verification_message_template, "sms_message", null) == null ? var.verification_message_template_sms_message : lookup(var.verification_message_template, "sms_message")
  }
}


resource "aws_cognito_user_pool" "name" {
  for_each = toset([var.name])

  name = each.value

  alias_attributes           = var.alias_attributes
  auto_verified_attributes   = var.auto_verified_attributes
  mfa_configuration          = var.mfa_configuration
  sms_authentication_message = var.sms_authentication_message
  tags                       = var.tags

  # Conflicts with (and implemented instead by) verification_message_template config block attributes...
  email_verification_message = null
  email_verification_subject = null
  sms_verification_message   = null

  admin_create_user_config {
    allow_admin_create_user_only = var.allow_admin_create_user_only

    dynamic "invite_message_template" {
      for_each = local.invite_message_templates

      content {
        email_message = lookup(invite_message_template.value, "email_message")
        email_subject = lookup(invite_message_template.value, "email_subject")
        sms_message   = lookup(invite_message_template.value, "sms_message")
      }
    }
  }

  dynamic "device_configuration" {
    for_each = local.device_configurations

    content {
      challenge_required_on_new_device      = lookup(device_configuration.value, "challenge_required_on_new_device")
      device_only_remembered_on_user_prompt = lookup(device_configuration.value, "device_only_remembered_on_user_prompt")
    }
  }

  email_configuration {
    email_sending_account  = lookup(local.email_configuration_default, "email_sending_account")
    from_email_address     = lookup(local.email_configuration_default, "from_email_address")
    reply_to_email_address = lookup(local.email_configuration_default, "reply_to_email_address")
    source_arn             = lookup(local.email_configuration_default, "source_arn")
  }

  dynamic "lambda_config" {
    for_each = local.lambda_configs

    content {
      create_auth_challenge          = lookup(lambda_config.value, "create_auth_challenge")
      custom_message                 = lookup(lambda_config.value, "custom_message")
      define_auth_challenge          = lookup(lambda_config.value, "define_auth_challenge")
      pre_authentication             = lookup(lambda_config.value, "pre_authentication")
      pre_sign_up                    = lookup(lambda_config.value, "pre_sign_up")
      pre_token_generation           = lookup(lambda_config.value, "pre_token_generation")
      post_authentication            = lookup(lambda_config.value, "post_authentication")
      post_confirmation              = lookup(lambda_config.value, "post_confirmation")
      user_migration                 = lookup(lambda_config.value, "user_migration")
      verify_auth_challenge_response = lookup(lambda_config.value, "verify_auth_challenge_response")
    }
  }

  password_policy {
    minimum_length                   = lookup(local.password_policy_default, "minimum_length")
    require_lowercase                = lookup(local.password_policy_default, "require_lowercase")
    require_numbers                  = lookup(local.password_policy_default, "require_numbers")
    require_symbols                  = lookup(local.password_policy_default, "require_symbols")
    require_uppercase                = lookup(local.password_policy_default, "require_uppercase")
    temporary_password_validity_days = lookup(local.password_policy_default, "temporary_password_validity_days")
  }

  dynamic "sms_configuration" {
    for_each = local.sms_configurations

    content {
      external_id    = lookup(sms_configuration.value, "external_id")
      sns_caller_arn = lookup(sms_configuration.value, "sns_caller_arn")
    }
  }

  dynamic "software_token_mfa_configuration" {
    for_each = local.software_token_mfa_configurations

    content {
      enabled = lookup(software_token_mfa_configuration.value, "enabled")
    }
  }

  username_configuration {
    case_sensitive = var.username_configuration_case_sensitive
  }

  user_pool_add_ons {
    advanced_security_mode = var.user_pool_add_ons_advanced_security_mode
  }

  verification_message_template {
    default_email_option  = lookup(local.verification_message_template_default, "default_email_option")
    email_message         = lookup(local.verification_message_template_default, "email_message")
    email_message_by_link = lookup(local.verification_message_template_default, "email_message_by_link")
    email_subject         = lookup(local.verification_message_template_default, "email_subject")
    email_subject_by_link = lookup(local.verification_message_template_default, "email_subject_by_link")
    sms_message           = lookup(local.verification_message_template_default, "sms_message")
  }
}
