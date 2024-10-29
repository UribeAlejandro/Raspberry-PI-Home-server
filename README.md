# Raspberry Pi - Home Server

This repository contains the configuration files and scripts for my Raspberry Pi home server.

## Installation

1. Install Raspbian on the Raspberry Pi.
2. Clone this repository to the Raspberry Pi.

Install the required packages:

```bash
chmod +x install.sh
sh install.sh
```

Wait for the Raspberry Pi to reboot.

Clone this repository to the Raspberry Pi:

```bash
git clone https://github.com/UribeAlejandro/Raspberry-PI-Home-server.git
```

## Secrets

Create a `.env` file in the root of the repository following the `.env.template` file.

## Usage

Run `docker-compose up -d` to start the services.
