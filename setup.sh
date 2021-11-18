
#!/bin/sh

echo "Repo to clone, e.g. \"F1nnM/server-management\": "
read REPO
echo "For private repos: Personal Auth Token (PAT): "
read PAT

docker network create gitdeploy

if [ -z "${VAR}" ]; then
  docker run -e REPOSITORY=$REPO \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v gitdeploy:/app/cloned-repo/ \
  f1nnm/git-docker-manager:release-0.5.25 init
else
  docker run -e REPOSITORY=$REPO \
  -e PAT=$PAT \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v gitdeploy:/app/cloned-repo/ \
  f1nnm/git-docker-manager:release-0.5.25 init
fi

echo "Setup finished!"