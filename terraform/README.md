# AWS Learner Lab Terraform Project

This repository contains Terraform configurations for AWS Learner Lab environments. The project allows you to quickly provision and manage AWS resources using Infrastructure as Code (IaC) principles.

## Prerequisites

- Ubuntu 24.04 (fresh and updated installation)
- Internet connection
- AWS Learner Lab account

## Quick Setup

A Makefile is included to simplify the installation process. You can install all requirements using the following commands:

```bash
# Install Make
sudo apt update -y && sudo apt install make -y

# Install Terraform
cd <repo>/terraform
make install-terraform

# Install AWS CLI
make install-aws

# Configure AWS CLI with your Learner Lab credentials
make configure-aws

# Set your AWS session token (required for Learner Lab)
aws configure set aws_session_token <your-session-token>
```