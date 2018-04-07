.PHONY: migrate

migrate:	## Run migrations using flyway docker image
	docker run --rm -v ./sql:/flyway/sql -v flyway.conf:/flyway/conf boxfuse/flyway migrate
