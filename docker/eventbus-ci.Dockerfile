# EventBus CI — generated. DO NOT EDIT.
# Runs the Python + JavaScript event bus suites and demos.
#   docker build -f docker/eventbus-ci.Dockerfile -t eventbus-ci .
#   docker run --rm eventbus-ci
FROM python:3.13-slim
RUN apt-get update && apt-get install -y --no-install-recommends nodejs git && rm -rf /var/lib/apt/lists/*
WORKDIR /src
COPY proto ./proto
COPY python ./python
COPY js ./js
COPY gen ./gen
CMD ["bash", "-c", "python3 -m unittest discover -s python/tests -p 'test_eventbus.py' && python3 python/examples/eventbus_demo.py && node --test js/test/eventbus.test.js && node js/examples/eventbus_demo.js"]
