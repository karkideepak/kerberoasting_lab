netsh interface portproxy add v4tov4 listenport=8080 connectport=80 connectaddress=192.168.1.10
#Access http://localhost:8080 → forwarded to 192.168.1.10:80

netsh interface portproxy add v4tov4 listenaddress=127.0.0.1 listenport=9000 connectaddress=10.0.0.5 connectport=9000
# Access http://127.0.0.1:9000 -> forwarded 10.0.0.5:9000
