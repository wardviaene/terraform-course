# Running the cdktf-go example

## Install dependencies
1. Install an IDE like VSCode (https://code.visualstudio.com/). Then
2. Install golang, terraform, cdktf:

On MacOS:
```
brew install go cdktf terraform
```

On Windows / Mac / Linux with vagrant:
```
git clone https://github.com/wardviaene/devops-box
cd devops-box
vagrant up
vagrant ssh
/vagrant/scripts/install_cdktf.sh # kicks of install of golang / npm / cdktf
```

On Windows, install a package manager (https://chocolatey.org/), then:
```
choco install nodejs
npm install --global cdktf-cli@latest
```

# Download & init the provider

```
cdktf get 
go mod tidy
```

Note: can take a some time to finish

# Provision

This provisions the infrastructure on AWS.

```
cdktf deploy
```

# Initialize new project
If you'd like to initialize your own project, you can use this command (I used the same command to initialize this project):
```
cdktf init --template="go" --local
```
