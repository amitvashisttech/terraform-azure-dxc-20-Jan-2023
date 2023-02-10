# Prerequisites
```
apt-get update
apt-get install jq wget unzip -y 
```

# Download Terragrunt 
```
wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.43.2/terragrunt_linux_amd64
```

# Install Terragrunt 
```
mv terragrunt_linux_amd64 /usr/local/bin/terragrunt
chmod +x /usr/local/bin/terragrunt
```

# Verify Terragrunt
```
terragrunt --version
```





