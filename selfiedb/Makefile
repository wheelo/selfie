run: clean build
	#docker run -it -v /Users/ali/go/src/github.com/pressly/selfie/selfiedb/db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=test selfiedb
	docker run -it -e POSTGRES_PASSWORD=test selfiedb

build: copy
	docker build -t selfiedb .
	rm -rf data
	rm -rf init_db.sh

clean:
	docker ps -a | awk 'NR>1' | grep selfiedb | awk '{print $$1}' | xargs docker rm
	docker images | awk 'NR>1' | grep selfiedb | awk '{print $$3}' | xargs docker rmi

copy:
	rm -rf data
	mkdir -p data
	cp -r ../data/schemas data
	cp ../scripts/init_db.sh .
