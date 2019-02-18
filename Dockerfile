FROM python:3.6-alpine
LABEL MAINTAINER="Safonov Nikita <Safon.x@protonmail.com>"
COPY ~/student-exam2 /py_app/student-exam2/
WORKDIR /py_app/student-exam2/
RUN pip install -e .
CMD export FLASK_APP=js_example && \
	flask run --host=0.0.0.0