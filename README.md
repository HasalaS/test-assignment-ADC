# Technical Assessment - ADC

## **Application Overview**

Python app that deployed to an eks cluster which provide the different actions according to the user acces uri
- Show Gandalf's picture when accessing /gandalf
- Current time now Colombo City (Sri Lanka) when accessing /colombo

Also this application contains built-in prometheus exporter and to capture two metrics:
- Total number of requests to /gandalf uri.
- Total number of requests to /colombo uri

As well as there is a prometheus server deployed vm will run by capturing the metrics which are relavant to the above application

## **Components**

- **EKS** - Easy to manage and scalability
- **ECR** - AWS inbuilt image artifactory
- **AWS ELB** - Simply manage the external access and allow metrics scraping via annotations
- **AWS IAM** - Manage the users and relavant permissions on roles
- **AWS Light-Sail** - Cost effective VM service on AWS which capable of managing current prometheus setup

- **FastAPI** - Simple and lightweight python framework to create web API
- **Prometheus_client** - Multi language support library for metric collector
- **Terraform** - To build and manage infra via code level

## **App Functionality and Deployment**  

This simple python application gives responses based on the requested URI and updates Prometheus counters for observability:

- Show Gandalf's picture when accessing /gandalf
- Current time now Colombo City (Sri Lanka) when accessing /colombo 
- Show captured metrics via /metrics

This app will follow following deployment stages

- App packaged in Docker image while exposing the port 80 and push to AWS ECR.
- Then deployed to adc namespace, which is created dedicated to this application.
- Application have 2 replicas for high availability.
- Also this deployment will contain Prometheus anotations for enable metrics scraping.

## **Prometheus Server Deployment**

- First create a Light-Sail instance and access to it via ssh.
- Once access download the Prometheus via [Prometheus Releases](https://github.com/prometheus/prometheus/releases)
- Now change the configuration as per the attached prometheus.yml in this repo, which will set the target to above application metrics
- Start Prometheus manually or setup it as a systemd service to run as background service.
- Then setup a Static IP Address to this Light-Sail instance via Networking on the aws console
- Now you can access the Prometheus dashboard via <Instance-Public-IP>:9090

## **Referrence**

- [Terraform AWS modules](https://registry.terraform.io/namespaces/terraform-aws-modules)
- [Hashicorp AWS provider](https://registry.terraform.io/providers/hashicorp/aws/5.24.0)
- [FastApi](https://fastapi.tiangolo.com/)
- [Prometheus-Client](https://pypi.org/project/prometheus-client/)
