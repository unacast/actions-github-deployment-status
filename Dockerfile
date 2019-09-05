FROM alpine

LABEL "name"="deploystatus"
LABEL "maintainer"="Unacast <developers+github@unacast.com>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Deploy status"
LABEL "com.github.actions.description"="Create a deploy status"
LABEL "com.github.actions.icon"="upload"
LABEL "com.github.actions.color"="green"

RUN mkdir /deploy-scripts

COPY ./bin /deploy-scripts/bin

ENTRYPOINT ["/deploy-scripts/bin/deployment-create-status"]

CMD [""]
