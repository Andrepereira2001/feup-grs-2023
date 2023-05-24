FROM internetsystemsconsortium/bind9:9.16
RUN apt update && apt install -y vim iproute2 iputils-ping tcpdump iptables dnsutils curl nagios-nrpe-server nagios-plugins 

COPY start.sh /root/start.sh
ENTRYPOINT []
RUN chmod u+x /root/start.sh
CMD /root/start.sh