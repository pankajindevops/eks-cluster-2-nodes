#
#
# aws cli installation
#

echo "Fetch awscli zip file"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

echo "Install unzip"
sudo apt install unzip

echo "Unzip awscliv2.zip file"
unzip awscliv2.zip

echo "Install awscli"
sudo ./aws/install

echo "Configure AWS keys"
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID" --profile user2 && aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY" --profile user2 && aws configure set region "$AWS_REGION" --profile user2 && aws configure set output "text" --profile user2 

echo "Fetch kubectl file"
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.13/2023-05-11/bin/linux/amd64/kubectl

echo "Fetch another file"
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.13/2023-05-11/bin/linux/amd64/kubectl.sha256

echo "Do a checksum"
sha256sum -c kubectl.sha256

echo "change file permissions"
chmod +x ./kubectl

echo "Making Directory"
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH

echo "Export PATH "
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

echo "Get kubectl version"
kubectl version --short --client


