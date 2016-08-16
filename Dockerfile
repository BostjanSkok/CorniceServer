
FROM python:3.5-alpine

USER root

RUN pip install --upgrade pip \
 && pip3 install cornice && pip3 install Waitress \
 && pip3 install sqlalchemy && pip3 install zope.sqlalchemy \
 && pip3 install alembic
RUN apk update;apk add postgresql-dev;apk add gcc
RUN apk add python3-dev;apk add  musl-dev
RUN pip3 install psycopg2
RUN apk del gcc;apk del python3-dev;apk del musl-dev

RUN apk add openssh
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 3333
CMD ["/usr/sbin/sshd", "-D"]
