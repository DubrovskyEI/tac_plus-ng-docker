### This script run tac_plus-ng in Docker

Using tac_plus-ng from https://github.com/MarcJHuber/event-driven-servers 

# Run instruction

## 1. Install Docker for your system

Install the Docker Engine. Download links for all popular platforms are provided at [Install Docker Engine](https://docs.docker.com/engine/install/)

## 2. Clone this repository

```Shell
git clone git@github.com:DubrovskyEI/tac_plus-ng-docker.git
```

## 3. Edit tac_plus-ng.cfg

Edit tac_plus-ng configuration file

Documentation is available on the original site https://www.pro-bono-publico.de/projects/tac_plus-ng.html

## 4. Run startup script

```Shell
chmod +x run-tac_plus-ng-docker.sh
./run-tac_plus-ng-docker.sh
```

### Check container is runnig

```Shell
docker ps | grep tac_plus-ng-docker
```

### Stop container

```Shell
docker stop tac_plus-ng-docker
```
### Run container in interactive mode 

```Shell
docker run --rm -it -v ./tac_plus-ng:/usr/local/etc/ -v ./tac_plus-ng-logs:/var/log/tac_plus-ng/ -p 49:49 tac_plus-ng-docker /bin/bash
```

### Start /bin/bash interactive in running container

```Shell
docker exec -it tac_plus-ng-docker /bin/bash
```

### Log files

Logging to files in Docker Volume:

- tac_plus-ng-logs/authentication - authentication logs
- tac_plus-ng-logs/authorization - authorization logs
- tac_plus-ng-logs/accounting - accounting logs

### TODO:

- [ ] Run container as a service to start container automatically on system boot
