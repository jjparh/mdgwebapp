FROM python:3.9.7-slim

RUN pip install django==3.2

COPY . .

RUN python manage.py makemigrations

RUN python manage.py migrate

CMD ["python","manage.py","runserver","0.0.0.0:80"]


