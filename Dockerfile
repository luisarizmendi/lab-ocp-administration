FROM quay.io/openshifthomeroom/workshop-dashboard:5.0.0

USER root

RUN wget https://github.com/noobaa/noobaa-operator/releases/download/v2.0.9/noobaa-linux-v2.0.9 -O /usr/bin/noobaa
RUN chmod +x /usr/bin/noobaa

COPY . /tmp/src

RUN rm -rf /tmp/src/.git* && \
    chown -R 1001 /tmp/src && \
    chgrp -R 0 /tmp/src && \
    chmod -R g+w /tmp/src

USER 1001

RUN /usr/libexec/s2i/assemble
