From python:2.7

RUN apt-get update

WORKDIR /app

COPY ./www /app

ADD requirement.pip ./

RUN pip install --upgrade pip
RUN pip install -r ./requirement.pip

CMD python main.py