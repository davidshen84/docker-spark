# README

## System configuration & setup

- Ubuntu:cosmic
- Spark:2.3.2
- Hadoop:2.7
- Java:8

## Exposed ports:
- 7077, default spark master port.
- 8080, default spark master web UI port.
- 8081, default spark worker web UI port.

## Usage

    # To start a master
    docker run --rm docker-spark master

    # To start a slave
    docker run --rm docker-spark slave
