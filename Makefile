clean:
	@rm -rf ./bin

dist-tools:
	go get github.com/pilu/fresh
	go get github.com/robfig/glock

deps:
	@glock sync github.com/alinz/releasifier

build:
	@mkdir -p ./bin
	cd cmd/releasifier && GOGC=off go build -i -o ../../bin/releasifier

dev:
	@(export CONFIG=$$PWD/etc/releasifier.conf && \
		cd ./cmd/releasifier && \
		fresh -c ../../etc/fresh-runner.conf)

##
## Database mgmt
##
reset-db:
	bash scripts/init_db.sh