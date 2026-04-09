docker desktop start 

docker --version

docker rm yeel-my-nginx

docker pull nginx:alpine3.20
docker run --name yeel-my-nginx -p 8000:8000 -d nginx:alpine3.20
docker logs yeel-my-nginx
docker ps -a
docker inspect yeel-my-nginx | jq '.[].Created'
docker inspect yeel-my-nginx | jq '.[].NetworkSettings.Networks.bridge.IPAddress'
docker inspect yeel-my-nginx | jq '.[0].Config.Env[] | select(test(\"NGINX_VERSION\"))'
docker exec yeel-my-nginx nginx -v
docker stop yeel-my-nginx

cd devops-lab5
cd python
docker build . -t pyapp
docker run -p 8080:8080 -d -it pyapp

cd ../java
docker build . -t javaapp:huge -f plain.Dockerfile 
docker build . -t javaapp:slim -f multi-stage.Dockerfile 
docker images -a | Select-String 'java'

docker desktop stop