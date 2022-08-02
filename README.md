# aws-add-ssh-key
Simple script for adding your SSH key to an AWS instance

## How to use
1) Connect to the AWS instance and open a terminal in your browser
2) Run the following commands (copy and pastels
)

```sh
cd ~ # make sure you're in your home directory
wget https://raw.githubusercontent.com/jdavenport-vervio/aws-add-ssh-key/master/aws-add-key.sh
chmod +x aws-add-key.sh
./aws-add-key.sh

```

**DO NOT RUN AS ROOT**
- It may not work as AWS is a bit strict on running downloaded scripts as root (understandably so)
- Running it as root will put the SSH key in the wrong location
- The script will check for this and will not run as root