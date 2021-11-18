
#!/bin/sh

echo "Repo to clone, e.g. \"F1nnM/server-management\": "
read REPO
echo "For private repos: Personal Auth Token (PAT): "
read PAT

docker network create gitdeploy

if [ -z "${PAT}" ]; then
  docker run -e REPOSITORY=$REPO \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v gitdeploy:/app/cloned-repo/ \
  f1nnm/git-docker-manager:release-0.5.28 init
else
  docker run -e REPOSITORY=$REPO \
  -e PAT=$PAT \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v gitdeploy:/app/cloned-repo/ \
  f1nnm/git-docker-manager:release-0.5.28 init
fi

echo $REPO
echo $PAT
echo "Setup finished!"