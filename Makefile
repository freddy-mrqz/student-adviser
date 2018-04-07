migrate:
	docker run --rm -v $(PWD)/sql/:/flyway/sql boxfuse/flyway -url=jdbc:mysql://db:3306/courses -user=root -password=root migrate
