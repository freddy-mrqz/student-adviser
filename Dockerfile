FROM python:3.5

COPY requirements.txt /home/docker/requirements.txt
RUN pip install -r /home/docker/requirements.txt

WORKDIR /home/docker/student_advisor
COPY ./student_advisor .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
