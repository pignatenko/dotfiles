## CREATE IF IT DOESN"T EXIXT
DOCKER_CONTAINER_NAME='nvim_plant_uml'
PORT='37176'

[ ! "$(docker ps -a | grep $DOCKER_CONTAINER_NAME)" ] && docker run -d --name "$DOCKER_CONTAINER_NAME" -p "$PORT:8080" plantuml/plantuml-server:jetty && exit

docker container start "$DOCKER_CONTAINER_NAME"

