.PHONY:  keygen build

build:
	docker build -t jenkins-slave .

deploy:
	docker run -ti --name jenkins-slave -v /var/run/docker.sock:/var/run/docker.sock -v /etc/hosts:/etc/hosts -d jenkins-slave

remove:
	docker rm -f jenkins-slave


