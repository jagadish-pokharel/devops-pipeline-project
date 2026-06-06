
Local CI/CD Pipeline with Jenkins
Project Link: View Project
Author: jagadish pokharel

Email: pokhareljagadish285@gmail.com


Building a Production-Style CI/CD Pipeline
Project goals and architecture
In this project, I'm building a complete devops flow using docker kubernetics jenkins and terraform without using any cloud account.
Setting Up the Local Kubernetes Environment
Tools and cluster setup
In this step, I'm setting up the tools that are needed for this project.

Verified tools and Minikube driver
I verified the tools like docker kubectl,minicube,terraform and i use docker to start the minikube.
Containerizing the Node.js Application
Dockerfile and app creation
In this step, I'm creating a

Node.js HTTP server that returns a JSON response.

Write a Dockerfile to containerize the application.

Build and test the Docker image locally.

Application response and versioning
The three fields are.message,version and timestampThe version field helps me with the app build version.
Running Jenkins as a Docker Container
Jenkins setup approach
In this step, I'm setting up the jenkins container with the docker socket access so that I can instal Docker pipeline plugin

Docker socket access explained
Jenkins needs the Docker socket because Mounting the Docker socket (/var/run/docker.sock) into Jenkins container enables Docker-out-of-Docker (DooD) functionality
Provisioning Kubernetes Infrastructure with Terraform
Infrastructure as Code configuration
In this step, I'm writing a terraform configuration files so that I can define kubernetics services and run as IaC

Terraform provider and kubeconfig
The config_path parameter tells Terraform where to find your Kubernetes configuration file (kubeconfig), which contains the credentials and connection information needed to communicate with your Kubernetes cluster.
Automating Deployments with a Jenkins Pipeline
Pipeline design and Jenkinsfile
In this step, I'm creating a jenkins files so that I can automate the flow.
Pipeline stages breakdown
The fourstages are

Verify → Build → Test → Deploy
Each stage must pass before moving to the next, ensuring only working code reaches production! stages are... Each one is responsible for...
Implementing Zero-Downtime Rolling Updates

Rolling update strategy and zero-downtime configuration
In this project extension, I configured rolling update strategy with max_surge = 1 and max_unavailable = 0 which ensures zero downtime during deployment by always keeping the desired number of pods available while gradually replacing old versions with new ones.
Reflections and Takeaways
Key tools and concepts learned
I built a complete DevOps pipeline using Docker, Jenkins, Kubernetes, and Terraform to automate building, testing, and deploying a Node.js application with zero-downtime rolling updates.
Time and challenges
This project took me approximately 2hour The most challenging part was to configure terraform and match the indendation
Personal learning goals
I did this project today to learn how to use docker kubernete Another skill I want to learn is to implement in large application with green blue deployment strategy

Built with NextWork - View this project
