FROM loadimpact/k6

USER root

ENV K6_HOME /home/k6

COPY entrypoint.sh /
RUN chmod -R a+rwX $K6_HOME && \
    apk add git

WORKDIR $K6_HOME
ENTRYPOINT ["/entrypoint.sh"]