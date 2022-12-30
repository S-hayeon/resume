
FROM python:3.7


COPY . /app/
WORKDIR /app/

# Install and cache requirements for faster builds
RUN pip install -r requirements.txt
EXPOSE 80


CMD ["flask",  "run", "--host=0.0.0.0","--port=80"]



