# PostgreSQL and pgAdmin Setup

This setup includes a Docker Compose file to run PostgreSQL and pgAdmin containers, along with an initialization script for the database. It also includes a Makefile for easy management of these services.

## Getting Started

First, ensure you have Docker and Docker Compose installed on your system. Clone or download this repository to your local machine.

## Using the Makefile

The Makefile includes commands to simplify the process of starting and stopping your Docker containers.

### Starting the Services

To start the PostgreSQL and pgAdmin services, run:

make pg-up

To them down, run:

make pg-down

By default data for your database will be persisted in a mounted volume in the ./postgres directory, to safely clean it up run:

sudo su 
make pg-clean