FROM python:3.9-slim-buster

COPY requirements.txt .
RUN pip3 install -r requirements.txt

WORKDIR /myportfolio

COPY . .

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]

EXPOSE 5000 