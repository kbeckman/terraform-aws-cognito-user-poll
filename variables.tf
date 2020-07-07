# top-level, non-block variables
variable "alias_attributes" {
  description = "(Optional) - Attributes supported as an alias for this User Pool. Possible values: 'phone_number', 'email', or 'preferred_username'."
  type        = list(string)
  default     = []
}

variable "allow_admin_create_user_only" {
  description = "(Optional) - Set to True if only the administrator is allowed to create user profiles. Set to False (default) if users can sign themselves up via an app."
  type        = bool
  default     = false
}

variable "auto_verified_attributes" {
  description = "(Optional) - The attributes to be auto-verified. Possible values: 'email', 'phone_number'."
  type        = list(string)
  default     = []
}

variable "mfa_configuration" {
  description = "(Optional) - Multi-Factor Authentication (MFA) configuration for the User Pool. Default is 'OFF'."
  type        = string
  default     = "OFF"
}

variable "name" {
  type        = string
  description = "(Required) - The name of the User Pool."
}

variable "sms_authentication_message" {
  description = "(Optional) - A string representing the SMS authentication message. The message must contain the {####} placeholder, which will be replaced with the code."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) - Custom AWS resource tags."
  type        = map
  default     = {}
}


# admin_create_user_config.invite_message_template
variable "invite_message_template" {
  description = "(Optional) - The invite message template structure."
  type        = map
  default = {
    email_message = null
    email_subject = null
    sms_message   = null
  }
}

variable "invite_message_template_email_message" {
  description = "(Optional) - The message template for email messages. Must contain '{username}' and '{####}' placeholders, for username and temporary password, respectively."
  type        = string
  default     = null
}

variable "invite_message_template_email_subject" {
  description = "(Optional) - The subject line for email messages."
  type        = string
  default     = null
}

variable "invite_message_template_sms_message" {
  description = "(Optional) - The message template for SMS messages. Must contain '{username}' and '{####}' placeholders, for username and temporary password, respectively."
  type        = string
  default     = null
}


# device_configuration
variable "device_configuration" {
  description = "(Optional) - The configuration for the User Pool's device tracking."
  type        = map
  default = {
    challenge_required_on_new_device      = null
    device_only_remembered_on_user_prompt = null
  }
}

variable "device_configuration_challenge_required_on_new_device" {
  description = "(Optional) - Indicates whether a challenge is required on a new device. Only applicable to a new device."
  type        = bool
  default     = null
}

variable "device_configuration_device_only_remembered_on_user_prompt" {
  description = "(Optional) - If true, a device is only remembered on user prompt."
  type        = bool
  default     = null
}


# email_configuration
variable "email_configuration" {
  description = "(Optional) - The Email Configuration."
  type        = map
  default = {
    email_sending_account  = "COGNITO_DEFAULT"
    from_email_address     = null
    reply_to_email_address = null
    source_arn             = null
  }
}

variable "email_configuration_email_sending_account" {
  description = "(Optional) - Instruct Cognito to either use its built-in functional or Amazon SES to send out emails."
  type        = string
  default     = "COGNITO_DEFAULT"
}

variable "email_configuration_from_email_address" {
  description = "(Optional) - Sender’s email address or sender’s name with their email address (e.g. john@smith.com or John Smith <john@smith.com>)."
  type        = string
  default     = null
}

variable "email_configuration_reply_to_email_address" {
  description = "(Optional) - The REPLY-TO email address."
  type        = string
  default     = null
}

variable "email_configuration_source_arn" {
  description = "(Optional) - The ARN of the email source."
  type        = string
  default     = null
}


# lambda_config
variable "lambda_config" {
  description = "(Optional) - A container for the AWS Lambda triggers associated with the User Pool."
  type        = map
  default = {
    create_auth_challenge           = null
    custom_message                  = null
    define_auth_challenge           = null
    pre_authentication              = null
    pre_sign_up                     = null
    pre_token_generateion           = null
    post_authentication             = null
    post_confirmation               = null
    user_migration                  = null
    verify_auth_challenge_response  = null
  }
}

variable "lambda_config_create_auth_challenge" {
  description = "(Optional) - The ARN of the lambda creating an authentication challenge."
  type        = string
  default     = null
}

variable "lambda_config_custom_message" {
  description = "(Optional) - A custom Message AWS Lambda trigger."
  type        = string
  default     = null
}

variable "lambda_config_define_auth_challenge" {
  description = "(Optional) - Defines the authentication challenge."
  type        = string
  default     = null
}

variable "lambda_config_pre_authentication" {
  description = "(Optional) - A pre-authentication AWS Lambda trigger."
  type        = string
  default     = null
}

variable "lambda_config_pre_sign_up" {
  description = "(Optional) - A pre-registration AWS Lambda trigger. "
  type        = string
  default     = null
}

variable "lambda_config_pre_token_generation" {
  description = "(Optional) - Allow to customize identity token claims before token generation."
  type        = string
  default     = null
}

variable "lambda_config_post_authentication" {
  description = "(Optional) - A post-authentication AWS Lambda trigger."
  type        = string
  default     = null
}

variable "lambda_config_post_confirmation" {
  description = "(Optional) - A post-confirmation AWS Lambda trigger."
  type        = string
  default     = null
}

variable "lambda_config_user_migration" {
  description = "(Optional) - The user migration Lambda config type."
  type        = string
  default     = null
}

variable "lambda_config_verify_auth_challenge_response" {
  description = "(Optional) - Verifies the authentication challenge response."
  type        = string
  default     = null
}


# password_policy
variable "password_policy" {
  description = "(Optional) A container for information about the user pool password policy."
  type = object({
    minimum_length                   = number,
    require_lowercase                = bool,
    require_numbers                  = bool,
    require_symbols                  = bool,
    require_uppercase                = bool,
    temporary_password_validity_days = number
  })
  default = {
    minimum_length                   = null,
    require_lowercase                = null,
    require_numbers                  = null,
    require_symbols                  = null,
    require_uppercase                = null,
    temporary_password_validity_days = null
  }
}

variable "password_policy_minimum_length" {
  description = "(Optional) - The minimum length of the password policy that you have set."
  type        = number
  default     = 8
}

variable "password_policy_require_lowercase" {
  description = "(Optional) -  Whether you have required users to use at least one lowercase letter in their password."
  type        = bool
  default     = true
}

variable "password_policy_require_numbers" {
  description = "(Optional) - Whether you have required users to use at least one number in their password."
  type        = bool
  default     = true
}

variable "password_policy_require_symbols" {
  description = "(Optional) - Whether you have required users to use at least one symbol in their password."
  type        = bool
  default     = true
}

variable "password_policy_require_uppercase" {
  description = "(Optional) - Whether you have required users to use at least one uppercase letter in their password."
  type        = bool
  default     = true
}

variable "password_policy_temporary_password_validity_days" {
  description = "(Optional) - In the password policy you have set, refers to the number of days a temporary password is valid. If the user does not sign-in during this time, their password will need to be reset by an administrator."
  type        = number
  default     = 7
}


# sms_verification_message
variable "sms_configuration" {
  description = "(Optional) - Configuration block for Short Message Service (SMS) settings. These settings apply to SMS user verification and SMS Multi-Factor Authentication (MFA). Due to Cognito API restrictions, the SMS configuration cannot be removed without recreating the Cognito User Pool. For user data safety, this resource will ignore the removal of this configuration by disabling drift detection. To force resource recreation after this configuration has been applied, see the 'taint' command."
  type        = map
  default = {
    external_id    = null,
    sns_caller_arn = null
  }
}

variable "sms_configuration_external_id" {
  description = "(Required) - The external ID used in IAM role trust relationships."
  type        = string
  default     = null
}

variable "sms_configuration_sns_caller_arn" {
  description = "(Required) - The ARN of the Amazon SNS caller. This is usually the IAM role that you've given Cognito permission to assume."
  type        = string
  default     = null
}


# software_token_mfa_configuration
variable "software_token_mfa_configuration" {
  description = "(Optional) - Configuration block for software token Mult-Factor Authentication (MFA) settings."
  type        = map
  default     = { enabled = null }
}

variable "software_token_mfa_configuration_enabled" {
  description = "(Required) - Boolean whether to enable software token Multi-Factor (MFA) tokens, such as Time-based One-Time Password (TOTP). To disable software token MFA when 'sms_configuration' is not present, the 'mfa_configuration' argument must be set to 'OFF' and the 'software_token_mfa_configuration' configuration block must be fully removed."
  type        = bool
  default     = null
}


# username_configuration
variable "username_configuration_case_sensitive" {
  description = "(Required) - Specifies whether username case sensitivity will be applied for all users in the User Pool through Cognito APIs."
  type        = bool
  default     = false
}


# user_pool_addons
variable "user_pool_add_ons_advanced_security_mode" {
  description = "(Required) - The mode for advanced security, must be one of 'OFF', 'AUDIT' or 'ENFORCED'."
  type        = string
  default     = "AUDIT"
}


# verification_message_template
variable "verification_message_template" {
  description = "(Optional) - The verification message templates configuration."
  type        = map
  default = {
    default_email_option  = "CONFIRM_WITH_CODE"
    email_message         = null
    email_message_by_link = null
    email_subject         = null
    email_subject_by_link = null
    sms_message           = null
  }
}

variable "verification_message_template_default_email_option" {
  description = "(Optional) - The default email option. Must be either 'CONFIRM_WITH_CODE' or 'CONFIRM_WITH_LINK'. Defaults to 'CONFIRM_WITH_CODE'."
  type        = string
  default     = "CONFIRM_WITH_CODE"
}

variable "verification_message_template_email_message" {
  description = "(Optional) - The email message template. Must contain the '{####}' placeholder."
  type        = string
  default     = null
}

variable "verification_message_template_email_message_by_link" {
  description = "(Optional) - The email message template for sending a confirmation link to the user, it must contain the '{##Click Here##}' placeholder."
  type        = string
  default     = null
}

variable "verification_message_template_email_subject" {
  description = "(Optional) - The subject line for the email message template."
  type        = string
  default     = null
}

variable "verification_message_template_email_subject_by_link" {
  description = "(Optional) - The subject line for the email message template for sending a confirmation link to the user."
  type        = string
  default     = null
}

variable "verification_message_template_sms_message" {
  description = "(Optional) - The SMS message template. Must contain the '{####}' placeholder."
  type        = string
  default     = null
}
