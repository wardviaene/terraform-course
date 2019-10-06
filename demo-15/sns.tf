# Uncomment if you want to have autoscaling notifications
#resource "aws_sns_topic" "example-sns" {
#  name         = "sg-sns"
#  display_name = "example ASG SNS topic"
#} # email subscription is currently unsupported in terraform and can be done using the AWS Web Console
#
#resource "aws_autoscaling_notification" "example-notify" {
#  group_names = ["${aws_autoscaling_group.example-autoscaling.name}"]
#  topic_arn     = "${aws_sns_topic.example-sns.arn}"
#  notifications  = [
#    "autoscaling:EC2_INSTANCE_LAUNCH",
#    "autoscaling:EC2_INSTANCE_TERMINATE",
#    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR"
#  ]
#}
