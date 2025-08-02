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
  --ipv6 \
  -o parent=eth0 homelab_vlan
```

```bash
docker network create -d bridge \
  --subnet=172.20.0.0/24 \
  --gateway=172.20.0.1 \
  --ipv6 \
  homelab_dns
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

Run `docker-compose -f [filename] up -d` to start the services.

Test the `unbound` service by running:

```bash
dig www.google.com @172.25.0.28 -p 5335
```

Install `dns-utils` if needed:

```bash
sudo apt-get install dnsutils
```

## Troubleshooting

### `No memory limit support`

Can happen when starting [monitoring](pi-5/docker-compose-monitoring.yaml) containers.

Try:

```bash
docker info
```

Getting the following output:

```bash
WARNING: No memory limit support
WARNING: No swap limit support
WARNING: No kernel memory limit support
WARNING: No oom kill disable support
WARNING: No cpu cfs quota support
WARNING: No cpu cfs period support
```

Then enable `cgroups`, as follows:

```bash
sudo nano /boot/firmware/cmdline.txt
```

Then add the following content:

```bash
cgroup_enable=memory swapaccount=1 cgroup_memory=1 cgroup_enable=cpuset
```

Then reboot the Raspberry Pi:

```bash
sudo reboot now
```
