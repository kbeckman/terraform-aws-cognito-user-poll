# terraform-aws-cognito-user-pool

This repository represents a Terraform module for provisioning
[AWS Cognito User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html).


## Input Variables

This module has a significant amount of configuration options thanks to the underlying Terraform
[aws_cognito_user_pool](https://www.terraform.io/docs/providers/aws/r/cognito_user_pool.html) resource. All
configuration block variables have corresponding top-level variables that adhere to the following naming convention --
`configuration_block_name_variable_name`. In instances where a setting is configured both via the object/map block as
well as the associated top-level variable, the object/map block takes precedence. For example:

```hcl
module "example_user_pool" {
  # Other settings omitted for brevity...

  device_configuration_challenge_required_on_new_device       = false
  device_configuration_device_only_remembered_on_user_prompt  = true

  # While technically this config object/map has the same config options defined
  # as above, these values have precedence and will be used instead...
  device_configuration = {
    challenge_required_on_new_device      = true
    device_only_remembered_on_user_prompt = false
  }
}
```

### Top-level Input Variables

* `alias_attributes` -- (Optional) - Attributes supported as an alias for this user pool. Possible values:
   `phone_number`, `email`, or `preferred_username`.
* `allow_admin_create_user_only` -- (Optional) - Set to `True` if only the administrator is allowed to create user
  profiles. Set to `False` (default) if users can sign themselves up via an app.
* `auto_verified_attributes` -- (Optional) - The attributes to be auto-verified. Possible values: `email`,
  `phone_number`.
* `device_configuration` -- (Optional) - The configuration for the User Pool's device tracking.
* `email_configuration` -- (Optional) - The Email Configuration.
* `invite_message_template` -- (Optional) - The invite message template structure.
* `lambda_config` -- (Optional) - A container for the AWS Lambda triggers associated with the User Pool.
* `mfa_configuration` -- (Optional) - Multi-Factor Authentication (MFA) configuration for the User Pool. Default is
  `OFF`.
* `name` -- (Required) - The name of the User Pool.
* `password_policy` -- (Optional) A container for information about the user pool password policy.
* `sms_authentication_message` -- (Optional) - A string representing the SMS authentication message. The message must
  contain the {####} placeholder, which will be replaced with the code.
* `sms_configuration` -- (Optional) - Configuration block for Short Message Service (SMS) settings. These settings apply
  to SMS user verification and SMS Multi-Factor Authentication (MFA). Due to Cognito API restrictions, the SMS
  configuration cannot be removed without recreating the Cognito User Pool. For user data safety, this resource will
  ignore the removal of this configuration by disabling drift detection. To force resource recreation after this
  configuration has been applied, see the `taint` command.
* `software_token_mfa_configuration` -- (Optional) - Configuration block for software token Mult-Factor Authentication
  (MFA) settings.
* `username_configuration_case_sensitive` -- (Required) - Specifies whether username case sensitivity will be applied
  for all users in the User Pool through Cognito APIs.
* `user_pool_add_ons_advanced_security_mode` -- (Required) - The mode for advanced security, must be one of `OFF`,
  `AUDIT` or `ENFORCED`.
* `verification_message_template` -- (Optional) - The verification message templates configuration.

### device_configuration

* `configuration_challenge_required_on_new_device` -- (Optional) - Indicates whether a challenge is required on a new
  device. Only applicable to a new device.
* `device_only_remembered_on_user_prompt` -- (Optional) - If `true`, a device is only remembered on user prompt.

| Top-level Variables                                         |
| -------------------                                         |
| device_configuration_challenge_required_on_new_device       |
| device_configuration_device_only_remembered_on_user_prompt  |

### email_configuration

* `email_sending_account` -- (Optional) - Instruct Cognito to either use its built-in functional or Amazon SES to send
  out emails.
* `from_email_address` -- (Optional) - Sender’s email address or sender’s name with their email address (e.g.
  john@smith.com or John Smith <john@smith.com>).
* `reply_to_email_address` -- (Optional) - The REPLY-TO email address.
* `source_arn` -- (Optional) - The ARN of the email source.

| Top-level Variables                         |
| -------------------                         |
| email_configuration_email_sending_account   |
| email_configuration_from_email_address      |
| email_configuration_reply_to_email_address  |
| email_config_source_arn                     |

### invite_message_template

* `email_message` -- (Optional) - The message template for email messages. Must contain `{username}` and `{####}`
  placeholders, for username and temporary password, respectively.
* `email_subject` -- (Optional) - The subject line for email messages.
* `sms_message` -- (Optional) - The message template for SMS messages. Must contain `{username}` and `{####}`
  placeholders, for username and temporary password, respectively.

| Top-level Variables                         |
| -------------------                         |
| invite_message_template_email_message       |
| invite_message_template_email_subject       |
| invite_message_template_sms_message         |

### lambda_config

* `create_auth_challenge` --  (Optional) - The ARN of the lambda creating an authentication challenge.
* `custom_message` -- (Optional) - A custom Message AWS Lambda trigger.
* `define_auth_challenge` -- (Optional) - Defines the authentication challenge.
* `pre_authentication` -- (Optional) - A pre-authentication AWS Lambda trigger.
* `pre_sign_up` -- (Optional) - A pre-registration AWS Lambda trigger.
* `pre_token_generation` -- (Optional) - Allow to customize identity token claims before token generation.
* `post_authentication` -- (Optional) - A post-authentication AWS Lambda trigger.
* `post_confirmation` -- (Optional) - A post-confirmation AWS Lambda trigger.
* `user_migration` -- (Optional) - The user migration Lambda config type.
* `verify_auth_challenge_response` -- (Optional) - Verifies the authentication challenge response.

| Top-level Variables                           |
| -------------------                           |
| lambda_config_create_auth_challenge           |
| lambda_config_custom_message                  |
| lambda_config_define_auth_challenge           |
| lambda_config_pre_authentication              |
| lambda_config_pre_sign_up                     |
| lambda_config_pre_token_generation            |
| lambda_config_post_authentication             |
| lambda_config_post_confirmation               |
| lambda_config_user_migration                  |
| lambda_config_verify_auth_challenge_response  |

### password_policy

* `minimum_length` -- (Optional) - The minimum length of the password policy that you have set.
* `require_lowercase` -- (Optional) -  Whether you have required users to use at least one lowercase letter in their
  password.
* `require_numbers` -- (Optional) - Whether you have required users to use at least one number in their password.
* `require_symbols` -- (Optional) - Whether you have required users to use at least one symbol in their password.
* `require_uppercase` -- (Optional) - Whether you have required users to use at least one uppercase letter in their
  password.
* `temporary_password_validity_days` --  (Optional) - In the password policy you have set, refers to the number of days
  a temporary password is valid. If the user does not sign-in during this time, their password will need to be reset by
  an administrator.

| Top-level Variables                               |
| -------------------                               |
| password_policy_minimum_length                    |
| password_policy_require_lowercase                 |
| password_policy_require_numbers                   |
| password_policy_require_symbols                   |
| password_policy_require_uppercase                 |
| password_policy_temporary_password_validity_days  |

### sms_configuration

* `external_id` -- (Required) - The external ID used in IAM role trust relationships.
* `sns_caller_arn` -- (Required) - The ARN of the Amazon SNS caller. This is usually the IAM role that you've given
  Cognito permission to assume.

| Top-level Variables                         |
| -------------------                         |
| sms_configuration_external_id               |
| sms_configuration_source_arn                |

### software_token_mfa_configuration

* `enabled` -- (Required) - Boolean whether to enable software token Multi-Factor (MFA) tokens, such as Time-based
  One-Time Password (TOTP). To disable software token MFA when `sms_configuration` is not present, the
  `mfa_configuration` argument must be set to `OFF` and the `software_token_mfa_configuration` configuration block must
  be fully removed.

| Top-level Variables                         |
| -------------------                         |
| software_token_mfa_configuration_enabled    |

### verification_message_template

* `default_email_option` -- (Optional) - The default email option. Must be either `CONFIRM_WITH_CODE` or
  `CONFIRM_WITH_LINK`. Defaults to `CONFIRM_WITH_CODE`.
* `email_message` -- (Optional) - The email message template. Must contain the `{####}` placeholder.
* `email_message_by_link` -- (Optional) - The email message template for sending a confirmation link to the user, it
  must contain the `{##Click Here##}` placeholder.
* `email_subject` -- (Optional) - The subject line for the email message template.
* `email_subject_by_link` -- (Optional) - The subject line for the email message template for sending a confirmation
  link to the user.
* `sms_message` -- (Optional) - The SMS message template. Must contain the `{####}` placeholder.

| Top-level Variables                                 |
| -------------------                                 |
| verification_message_template_default_email_option  |
| verification_message_template_email_message         |
| verification_message_template_email_message_by_link |
| verification_message_template_email_subject         |
| verification_message_template_email_subject_by_link |
| verification_message_template_sms_message           |


## Outputs

| Output                | Description                                       |
| ------                | -----------                                       |
| `user_pool_arn`       | Cognito User Pool ARN                             |
| `user_pool_endpoint`  | Cognito User Pool Endpoint                        |
| `user_pool_id`        | Cognito User Pool ID                              |
