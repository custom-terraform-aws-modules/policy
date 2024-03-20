output "arn" {
  description = "The ARN of the IAM policy."
  value       = try(aws_iam_policy.main.arn, null)
}
