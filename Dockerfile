FROM qwe1/debdocker:20.10
# https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/
ENV ansible_version=2.12.4
ENV molecule_version=3.6.1
ENV umask=022
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends python3 libc6-dev python3-pip gcc git python3-dev python3-setuptools python3-wheel libssl-dev openssh-client
RUN pip3 install --upgrade pip
RUN pip3 install ansible molecule==${molecule_version} molecule-docker docker ansible-lint flake8 yamllint
# python-vagrant pywinrm
RUN apt-get purge --autoremove -y libc6-dev gcc libssl-dev python3-dev python3-wheel && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /root/.cache

RUN rm -f /lib/systemd/system/multi-user.target.wants/getty.target

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]
