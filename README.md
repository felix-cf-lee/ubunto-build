# Create Ubunto based Docker container with:
. JDK
. Ant
. Maven
. GIT
. VI
. Network utilities

To build:
docker build -t ubunto-build:2.0 .
To run:
docker run -it ubunto-build:2.0
docker start -ia docker-id
docker exec -it docker-id /bin/bash

