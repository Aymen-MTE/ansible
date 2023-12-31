FROM debian:bullseye-slim


# Set non interactive frontend for debian apt
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y --no-install-recommends ansible sshpass && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Assurez-vous d'être dans le répertoire contenant votre fichier ansible.cfg
COPY ansible.cfg /etc/ansible/ 

RUN chmod 777 -R /opt

WORKDIR /home/root/ansible/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
