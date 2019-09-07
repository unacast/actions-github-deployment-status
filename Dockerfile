FROM alpine:3.10

RUN mkdir /deploy-scripts

COPY ./bin /deploy-scripts/bin

ENTRYPOINT ["/deploy-scripts/bin/deployment-create-status"]

CMD [""]
