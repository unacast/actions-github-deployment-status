IMAGE_NAME=$(shell basename $(CURDIR))

.PHONY: docker-lint
docker-lint: ## Run Dockerfile Lint on all dockerfiles.
	$(COMMAND) dockerfile_lint -r .dockerfile_lint/github_actions.yaml $(wildcard Dockerfile* */Dockerfile*)

.PHONY: docker-build
docker-build: ## Build the top level Dockerfile using the directory or $IMAGE_NAME as the name.
	docker build -t $(IMAGE_NAME) -f build-dockerfile .

.PHONY: docker-tag
docker-tag: ## Tag the docker image using docker tag
	docker tag $(IMAGE_NAME):latest $(DOCKER_REPO)/$(IMAGE_NAME):latest

.PHONY: docker-publish
docker-publish: docker-tag ## Publish the image and tags to a repository.
	docker push $(DOCKER_REPO)/$(IMAGE_NAME)
