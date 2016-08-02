
FROM python:3.5-alpine

USER root

RUN pip install --upgrade pip \
 && pip install cornice && pip install Waitress \
 && pip install sqlalchemy && pip install zope.sqlalchemy
RUN apk update;apk add py-psycopg2  