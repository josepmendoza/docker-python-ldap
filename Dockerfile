FROM python:3.9.2 AS ldap-build

RUN apt-get update -y && \ 
    apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev && \
    python -m pip wheel --wheel-dir=/tmp python-ldap==3.3.1

FROM python:3.9.2
COPY --from=ldap-build /tmp/*.whl /tmp/
RUN python -m pip install /tmp/*.whl

CMD tail -f /dev/null
