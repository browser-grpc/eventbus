# EventBus demo — generated. DO NOT EDIT.
#   docker build -f docker/eventbus-demo.Dockerfile -t eventbus-demo .
#   docker run --rm eventbus-demo
FROM python:3.13-slim
WORKDIR /src
COPY proto ./proto
COPY python ./python
CMD ["python3", "python/examples/eventbus_demo.py"]
