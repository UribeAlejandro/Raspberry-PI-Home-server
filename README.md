# Raspberry Pi - Home Server

This repository contains the configuration files and scripts for my Raspberry Pi home server.

## Installation

Install the required packages:

```bash
chmod +x install.sh
sh install.sh
```

Wait for the Raspberry Pi to reboot.

Create the required networks for docker:

```bash
docker network create -d macvlan \
  --subnet=192.168.1.0/24 \
  --ip-range=192.168.1.0/24 \
  --gateway=192.168.1.1 \
  -o parent=eth0 homelab_vlan
```

```bash
docker network create -d bridge \
  --subnet=172.25.0.0/24 \
  --gateway=172.25.0.1 \
  homelab
```

Finally, clone this repository to the Raspberry Pi.

## Secrets

Create a `.env` file in the root of the repository following the `.env.template` file.

## Usage

Run `docker-compose up -d` to start the services.

