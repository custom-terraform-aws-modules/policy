# Module: Policy

This module provides the creation of an IAM policy. The specified actions are allowed to be exercised on the specified resources.

## Contents

- [Requirements](#requirements)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Example](#example)
- [Contributing](#contributing)

## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | >= 1.0  |
| aws       | >= 5.20 |

## Inputs

| Name       | Description                                             | Type           | Default | Required |
| ---------- | ------------------------------------------------------- | -------------- | ------- | :------: |
| identifier | Unique identifier to differentiate global resources.    | `string`       | n/a     |   yes    |
| effect     | Effect of the policy statement, e.g. 'Allow' or 'Deny'. | `string`       | "Allow" |    no    |
| actions    | List of actions for this IAM policy to allow.           | `list(string)` | []      |    no    |
| resources  | List of resources to allow this IAM policy access to.   | `list(string)` | []      |    no    |
| tags       | A map of tags to add to all resources.                  | `map(string)`  | {}      |    no    |

## Outputs

| Name | Description                |
| ---- | -------------------------- |
| arn  | The ARN of the IAM policy. |

## Example

```hcl
module "policy" {
  source = "github.com/custom-terraform-aws-modules/policy"

  identifier = "example-policy-dev-GetSecrets"
  effect     = "Allow"
  actions    = ["secretsmanager:GetSecretValue"]
  resources  = ["aws:arn:secretsmanager-test123"]

  tags = {
    Project     = "example-project"
    Environment = "dev"
  }
}
```

## Contributing

In order for a seamless CI workflow copy the `pre-commit` git hook from `.github/hooks` into your local `.git/hooks`. The hook formats the terraform code automatically before each commit.

```bash
cp ./.github/hooks/pre-commit ./.git/hooks/pre-commit
```
