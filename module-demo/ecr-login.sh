#!/bin/bash
REGION="eu-west-1"
`AWS_PROFILE=ward aws ecr get-login --no-include-email --region ${REGION}`
