BUILDER=docker-compose -f ./docker-compose.yml run --rm mvn-jdk8

test:
	$(BUILDER) mvn clean test