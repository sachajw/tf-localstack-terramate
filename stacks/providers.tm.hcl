# This file is part of Terramate Configuration.
# Terramate is an orchestrator and code generator for Terraform.
# Please see https://github.com/mineiros-io/terramate for more information.
#
# To generate/update Terraform code within the stacks
# run `terramate generate` from root directory of the repository.

##############################################################################
# Generate '_terramate_generated_providers.tf' in each stack
# All globals will be replaced with the final value that is known by the stack
# Any terraform code can be defined within the content block
generate_hcl "_terramate_generated_providers.tf" {
  content {

    # the default values of globals are defined in config.tm.hcl in this directory

    provider "aws" {
      project = global.terraform_aws_provider_project
      region  = global.terraform_aws_provider_region
      #      shared_config_files         = ["/Users/tvl/.aws/config"]
      #      shared_credentials_files    = ["/Users/tvl/.aws/credentials"]
      #      profile                     = "localstack"
      s3_use_path_style           = true
      skip_credentials_validation = true
      skip_metadata_api_check     = true
      skip_requesting_account_id  = true

      endpoints {
        apigateway     = "http://localhost.localstack.cloud:4566"
        apigatewayv2   = "http://localhost.localstack.cloud:4566"
        cloudformation = "http://localhost.localstack.cloud:4566"
        cloudwatch     = "http://localhost.localstack.cloud:4566"
        dynamodb       = "http://localhost.localstack.cloud:4566"
        ec2            = "http://localhost.localstack.cloud:4566"
        es             = "http://localhost.localstack.cloud:4566"
        elasticache    = "http://localhost.localstack.cloud:4566"
        firehose       = "http://localhost.localstack.cloud:4566"
        iam            = "http://localhost.localstack.cloud:4566"
        kinesis        = "http://localhost.localstack.cloud:4566"
        lambda         = "http://localhost.localstack.cloud:4566"
        rds            = "http://localhost.localstack.cloud:4566"
        redshift       = "http://localhost.localstack.cloud:4566"
        route53        = "http://localhost.localstack.cloud:4566"
        s3             = "http://s3.localhost.localstack.cloud:4566"
        secretsmanager = "http://localhost.localstack.cloud:4566"
        ses            = "http://localhost.localstack.cloud:4566"
        sns            = "http://localhost.localstack.cloud:4566"
        sqs            = "http://localhost.localstack.cloud:4566"
        ssm            = "http://localhost.localstack.cloud:4566"
        stepfunctions  = "http://localhost.localstack.cloud:4566"
        sts            = "http://localhost.localstack.cloud:4566"
      }
    }

    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = global.terraform_aws_provider_version
        }
      }
    }

    terraform {
      required_version = global.terraform_version
    }
  }
}
