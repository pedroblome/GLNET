FROM python:3.10-slim-buster

WORKDIR /


# Copy the poetry.lock and pyproject.toml files to the working directory
COPY poetry.lock pyproject.toml 



COPY . .

RUN pip install --upgrade pip && \
    pip install poetry && \
    poetry install --no-root

RUN poetry config installer.max-workers 40

RUN poetry install --no-interaction --no-ansi -vvv

CMD ["python3", "baseline.py"]