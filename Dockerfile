FROM python:3.7-slim

ARG BASIC_AUTH_USERNAME_ARG
ARG BASIC_AUTH_PASSWORD_ARG

ENV BASIC_AUTH_USERNAME=$BASIC_AUTH_USERNAME_ARG
ENV BASIC_AUTH_PASSWORD=$BASIC_AUTH_PASSWORD_ARG

COPY ./requirements.txt /user/requirements.txt

WORKDIR /user

RUN pip3 install -r requirements.txt

COPY ./src /user/src
COPY ./models /user/models

ENTRYPOINT [ "python3" ]

CMD [ "src/app/main.py" ]

# run on terminal: 
# docker build -t machine-learning-flask-api --build-arg BASIC_AUTH_USERNAME_ARG=alexandre BASIC_AUTH_PASSWORD_ARG=compesa ./
# docker run -p 5000:5000 machine-learning-flask-api