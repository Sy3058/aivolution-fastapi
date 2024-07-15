build:
	docker build -t my-fastapi-app .
run:
	docker run -d -p 3100:3100 --name my-fastapi-container my-fastapi-app
exec:
	docker exec -it my-fastapi-container /bin/bash
stop:
	docker stop my-fastapi-container
ps:
	docker ps -a
img:   
	docker images
rm:
	docker rm -f $$(docker ps -aq)
rmi:
	docker rmi -f $$(docker images -q)