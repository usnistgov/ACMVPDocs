# Kubernetes (k8s)

The application configuration for Kubernetes provides the necessary components
to deploy and manage a running instance of the WebPublic application.

## Features

- **Flexible Build Environments**: Support for locally built Docker images and service configurations
- **Portability**: Kubernetes configurations can be agnostic to the underlying infrastructure resources

## Prerequisites

Before using this Kubernetes, you will need the following:

- For local deployments you will need to build your images and host them locally in your Docker registry
- For EKS deployments you will need to provision ECR repositories to host your Docker images
- For local deployments you will need a running Kubernetes cluster (i.e. Docker Desktop, Rancher Desktop, etc.)
- For EKS deployments you will need a running EKS cluster

## Usage

For deployments, it's recommended that you use the Taskfile implementation to
deploy your applications locally.

Configuration of your Kubernetes deployment requires a few local environment
variables by running `export NAMESPACE="local"`.

To build and deploy Docker image, simply run `task deploy`.
