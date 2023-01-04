FROM python:3.10.6-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .
HEALTHCHECK CMD curl --fail http://0.0.0.0:8000/swagger/ || exit 1
CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000", "--noreload"]