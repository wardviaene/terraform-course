#!/bin/bash
REGION="eu-west-1"
`aws ecr get-login --no-include-email --region ${REGION}`
