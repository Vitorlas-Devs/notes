from socket import socket, AF_INET, SOCK_DGRAM
from struct import Struct

server_addr = ("oktnb147.inf.elte.hu", 11235)
msg = (b"UDPKliens", b"IO3O4S", b"4ilhi21tat3iish8")

packer = Struct("10s6s20s")
packer2 = Struct("3s")
packer_resp = Struct("10s100s")


with socket(AF_INET, SOCK_DGRAM) as client:
    data = packer.pack(*msg)
    client.sendto(data, server_addr)

    data, _ = client.recvfrom(packer_resp.size)
    result = packer_resp.unpack(data)[1].decode()
    print(f"Received: {result}")

    data2 = packer.pack(result[2].encode(), result[3].encode(), result[8].encode())
    client.sendto(data2, server_addr)

    data2, _ = client.recvfrom(packer_resp.size)
    result = packer_resp.unpack(data)
    print(f"Received: {result[1].decode()}")
