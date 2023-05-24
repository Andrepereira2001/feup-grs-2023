FROM nginx:latest
RUN apt update && apt install -y vim iproute2 iputils-ping

ENTRYPOINT []
COPY start.sh /root/start.sh
RUN chmod u+x /root/start.sh
CMD /root/start.sh
