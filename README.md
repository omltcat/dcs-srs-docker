# DCS SRS Server Docker Image
Run Simple Radio Standalone (SRS) server with docker.  
Take the [Linux binary file](https://github.com/ciribob/DCS-SimpleRadioStandalone/releases/latest/download/SRS-Server-Commandline-Linux) directly from the [official SRS repo](https://github.com/ciribob/DCS-SimpleRadioStandalone).

All configuration can be done via environment variables. See [docker-compose.yaml](docker-compose.yaml).

Get latest or specific SRS version of the image from docker hub:
```bash
docker pull omltcat/dcs-srs-server:latest
docker pull omltcat/dcs-srs-server:2.4.0.0
```