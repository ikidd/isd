FROM python:3.12-slim-buster

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /isd
WORKDIR /isd

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir --upgrade \
    pip \
    setuptools \
    wheel
RUN python3 -m pip install --no-cache-dir \
    -r requirements.txt

CMD ["/bin/bash"]
