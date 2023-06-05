FROM ubuntu:22.04
RUN apt update && apt install -y vim iproute2 iputils-ping tcpdump iptables dnsutils curl wireguard
COPY sleep.sh /root/sleep.sh
RUN chmod u+x /root/sleep.sh
CMD /root/sleep.sh
