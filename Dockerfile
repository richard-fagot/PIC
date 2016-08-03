FROM jenkins:2.7.1


COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

USER root
RUN groupadd -g 999 docker
    && useradd -G docker jenkins
USER jenkins
