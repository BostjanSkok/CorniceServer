
FROM python:3.5-alpine

USER root

RUN pip install --upgrade pip \
 && pip install cornice 
 && pip install Waitress


ENV APPLOC /BackEnd
WORKDIR $APPLOC