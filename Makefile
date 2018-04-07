.PHONY: migrate
migrate:	## Run migrations using flyway docker image
	docker run --rm -v $(PWD)/sql:/flyway/sql -v $(PWD)/flyway.conf:/flyway/conf boxfuse/flyway migrate
