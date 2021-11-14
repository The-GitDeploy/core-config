# core-config
The basic config for GitDeploy. Fork this repository to get started.

## Initial Setup
### 1. Install Docker

### 2. Run init script
```
bash <(curl -s https://github.com/The-GitDeploy/core-config/blob/main/setup.sh)
```
### 3. Fork this repo and set up the Github Webhook
This repository contians the basic ocnfig to get you started; fork it, to have your own repo ready to go.
In your repository go to Settings > Webhooks and add a new one for the push event.
The URL of the webhook should be `https://<your server>:5555/webhook`.

### 4. If your repo is private:
If your repository is private, you need to add a Personal Auth Token (PAT) to the file "compose/management/docker-compose.yml" in line 18.

### 5. Optional, but recommended: Change admin password
You can generate a new password by running the following command:
```openssl passwd -5```
Paste the output of this command into the file `/compose/management/build_nginx/.htpasswd`, replacing the other hash.
There you can also change the username or add more users.

### 6. Finished.
You can see the monitoring panel under the port 5555.

### Debugging issues
If you have any issues, because of a faulty configuration, follow the following steps:
#### 1. Update the configuration and push it to the repository
#### 2. Check if it updated automatically
If the running git-docker-manager was successfully notified, it'll attempt to deploy your new configuration and you are done.
#### 3. If not:
Kill all docker containers manually:
```
docker kill $(docker ps -q) && docker rm $(docker ps -a -q)
```
The run the command from step 4 again.

## Adding a new application
All you need to do to add a new app, is create a folder for it inside the `compose` folder and place your `docker-compose.yml` in there.
### Connecting it to a subdomain
Edit the following file: `/compose/nginx/build/servers.conf`
Detailed instructions will follow.

### Access to files in this repo
The contents of the repo are available in the docker volume `gitdeploy`. Mount it to get access to it.
