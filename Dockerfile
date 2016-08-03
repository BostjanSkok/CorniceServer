
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
