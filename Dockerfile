FROM geerlingguy/docker-debian11-ansible:latest

RUN apt update && apt install -y curl apt-utils
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]
