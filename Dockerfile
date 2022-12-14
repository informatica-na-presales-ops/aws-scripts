FROM python:3.10.6-alpine3.16

RUN /usr/sbin/adduser -g python -D python

USER python
RUN /usr/local/bin/python -m venv /home/python/venv

COPY --chown=python:python requirements.txt /home/python/aws-scripts/requirements.txt
RUN /home/python/venv/bin/pip install --no-cache-dir --requirement /home/python/aws-scripts/requirements.txt

ENV PATH="/home/python/venv/bin:${PATH}" \
    PYTHONDONTWRITEBYTECODE="1" \
    PYTHONUNBUFFERED="1" \
    TZ="Etc/UTC"

LABEL org.opencontainers.image.authors="William Jackson <wjackson@informatica.com>" \
      org.opencontainers.iamge.source="https://github.com/informatica-na-presales-ops/aws-scripts"
