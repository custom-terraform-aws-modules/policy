################################
# IAM Policy                   #
################################

data "aws_iam_policy_document" "main" {
  statement {
    effect = var.effect

    actions = var.actions

    resources = var.resources
  }
}

resource "aws_iam_policy" "main" {
  name   = var.identifier
  policy = data.aws_iam_policy_document.main.json

  tags = var.tags
}
