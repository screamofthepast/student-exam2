FROM python:3.6-alpine
MAINTAINER Safonov Nikita <Safon.x@protonmail.com>
RUN apk add --no-cache git && \
    git clone https://github.com/screamofthepast/student-exam2 /py_app/student-exam2
WORKDIR py_app
RUN python3 -m venv venv
CMD . venv/bin/activate && \
    pip install -e student-exam2/ && \
    export FLASK_APP=js_example && \
    flask run --host=0.0.0.0