[default]
aws_access_key_id = your_access_key_id
aws_secret_access_key = your_secret_access_key

8HNv5pAEqwLJ+dpN7bev/RkIILaEmT4j64/zJTT0


  region                  = "us-east-2"  # Specify your preferred region
  aws_access_key_id       = "AKIAQ3EGR3ADZR5OHFYQ"
  aws_secret_access_key   = "8HNv5pAEqwLJ+dpN7bev/RkIILaEmT4j64/zJTT0"

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.ef5975ca

172.31.25.40 ansible_user=ec2-user ansible_connection=ssh ansible_ssh_private_key_file=/tmp/jan.pem
172.31.18.29 ansible_user=ec2-user ansible_connection=ssh ansible_ssh_private_key_file=/tmp/jan.pem

'
1.steps for creating k8s cluster by using kubectl 
----------------------------------------------------------------------------------------------------------------------------------
Perquisites two or more worker nodes and 2cpu for each node/machine 
Prepare the environment: Install necessary packages and disable swap.
Install Docker (or another container runtime).
Install kubeadm, kubelet, and kubectl.
Initialize the Kubernetes control plane on the master node.
Install a pod network add-on (e.g., Calico).
Join worker nodes to the cluster using the kubeadm join command.
Verify the cluster and node statuses with kubectl.
By following these steps, you can create a basic Kubernetes cluster using kubectl and kubeadm, and be ready to start deploying containerized applications.
