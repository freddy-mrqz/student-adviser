FROM python:3.5

COPY requirements.txt /home/docker/requirements.txt
RUN pip install -r /home/docker/requirements.txt

COPY student_advisor/ /home/docker/student_advisor/
