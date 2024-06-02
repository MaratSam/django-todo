FROM python:3.11-alpine

# python to send output to terminal
ENV PYTHONUNBUFFERED=1

ENV PATH "$PATH:/new/path:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Set the working directory
WORKDIR  /django

# Install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python3","manage.py","runserver", "0.0.0.0:8000"]