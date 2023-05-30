# feup-grs-2023
Gestão de redes e sistemas project 

## Commands
`docker exec -it <container> /bin/bash`

`ip r ls`

## TEST

### NAT shop A
isp router ping device in shop A net | FAIL
`docker exec feup-grs-2023-isp_router-1 /bin/bash -c 'ping 172.31.255.6'`

device in shop A net ping isp router | OK
`docker exec feup-grs-2023-shop_a_client-1 /bin/bash -c 'ping 172.30.255.254'`

### NAT DMZ 
isp router ping device in HQ private net | FAIL
`docker exec feup-grs-2023-isp_router-1 /bin/bash -c 'ping 10.0.1.2'`

device in HQ DMZ net ping isp router | OK
`docker exec feup-grs-2023-hq_private_server-1 /bin/bash -c 'ping 172.30.255.254'`

isp router ping device in HQ public net | OK
`docker exec feup-grs-2023-isp_router-1 /bin/bash -c 'ping 172.16.123.130'`

device in shop A net ping HQ public server| OK
`docker exec feup-grs-2023-shop_a_client-1 /bin/bash -c 'ping 172.16.123.130'`

device in HQ DMZ net ping HQ private server| OK
`docker exec feup-grs-2023-hq_server-1 /bin/bash -c 'ping 10.0.1.2'`

### DNS
device in shop A net ping HQ DNS server | OK
`docker exec feup-grs-2023-shop_a_client-1 /bin/bash -c 'ping ns1.alm.hq'`

device in shop A net ping HQ www server | OK
`docker exec feup-grs-2023-shop_a_client-1 /bin/bash -c 'ping www.alm.hq'`