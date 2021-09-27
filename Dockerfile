FROM python:3
RUN mkdir /app
WORKDIR /app

COPY obmovies /app/obmovies
COPY tests /app/test
COPY migrations /app/migrations
COPY requirements.txt /app
COPY .ini /app
COPY run.py /app
COPY base.txt /app

EXPOSE 5000/tcp

RUN pip install -r requirements.txt

ENTRYPOINT [ "python" ]
CMD ["run.py", "--host", "0.0.0.0"]
