FROM python:3.11-alpine

# python to send output to terminal
ENV PYTHONUNBUFFERED=1
# prevents Python to write .pyc files, actual in the container 
ENV PYTHONDONTWRITEBYTECODE 1 

ENV PATH "$PATH:/new/path:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/lib/postgresql/:/var/lib/postgresql/data/"

# Set the working directory
WORKDIR  /djangoapp

# Install dependencies
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python3","manage.py","runserver", "0.0.0.0:8000"]