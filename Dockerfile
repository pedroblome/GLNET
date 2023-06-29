FROM python:3.10-slim-buster

WORKDIR /


# Copy the poetry.lock and pyproject.toml files to the working directory


COPY ./requirements.txt /requirements.txt
COPY . .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt &&\
    pip install -U sphinx && \
    sphinx-quickstart && \
    sudo apt install make


CMD ["python3", "baseline.py"]