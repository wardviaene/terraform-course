#!/bin/bash
REGION="us-east-1"
`aws ecr get-login --no-include-email --region ${REGION}`
