# Event bus over gRPC

A publish/subscribe event bus defined as one gRPC service,
`grpcdc.events.v1.EventBus` (see [EVENTBUS.md](EVENTBUS.md)),
with the broker and clients **generated in every language** —
browser and native — by [grpc-over-datachannels](https://github.com/browser-grpc/grpc-over-datachannels).
Publishers attach typed routing tags; subscribers declare a
containment filter; the broker assigns global sequence
numbers. A git-backed broker variant persists the log.

This repository is a generated export (version v0.42.0).

## Run the demo

```sh
docker run --rm ghcr.io/browser-grpc/eventbus-demo:latest
```

Or here, no install (stdlib only):

```sh
python3 python/examples/eventbus_demo.py
node js/examples/eventbus_demo.js
```

## Layout

- `proto/events.proto` — the schema (source of truth).
- `python/`, `js/` — complete dependency-free runtimes with
  the generated broker, clients, demos, and tests.
- `gen/<lang>/` — generated EventBus stubs, brokers, demos,
  and tests for the other fourteen languages; drop them into
  the matching runtime tree of the main repo.

## Tests

```sh
docker build -f docker/eventbus-ci.Dockerfile -t eventbus-ci .
docker run --rm eventbus-ci
```

GitHub Actions runs the same image on every push. Background:
[A generated event bus](https://c100k.blogspot.com/2026/10/a-generated-event-bus-publishsubscribe.html).
