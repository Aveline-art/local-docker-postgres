# Dockerfile
ARG TAG
FROM postgres:${TAG} 
COPY ./dump_and_restore.sh /dump_and_restore.sh
RUN chmod +x /dump_and_restore.sh
CMD ["/dump_and_restore.sh"]