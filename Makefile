.PHONY: build apply start-redis create-redis-cli run-job logs clean

# The name of your Docker image
IMAGE_NAME=redsync-learn

# The name of your Job
JOB_NAME=redsync-learn

# The name of your Kubernetes configuration files
REDIS_CONFIG=./contrib/redis.yaml
JOB_CONFIG=./contrib/redsync_learn.yaml

build:
	docker build -t $(IMAGE_NAME) .

apply:
	kubectl apply -f $(JOB_CONFIG)

start-redis:
	kubectl apply -f $(REDIS_CONFIG)

create-redis-cli:
	kubectl run redis-cli --image=redis

run-job:
	kubectl delete job $(JOB_NAME) --ignore-not-found=true
	kubectl apply -f $(JOB_CONFIG)

clean:
	kubectl delete jobs $(JOB_NAME) --ignore-not-found=true
	kubectl delete pods redis-cli --ignore-not-found=true
	kubectl delete deploy redis --ignore-not-found=true
	kubectl delete svc redis-service --ignore-not-found=true

logs:
	kubectl logs -l job-name=$(JOB_NAME) --tail=100

all: start-redis build run-job