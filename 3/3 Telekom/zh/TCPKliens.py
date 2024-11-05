from socket import socket, AF_INET, SOCK_STREAM
from struct import Struct

server_addr = ("oktnb147.inf.elte.hu", 11224)
msg = (b"TCPKliens", b"IO3O4S", b"dee865hvqq5isq17")

packer = Struct("10s6s20s")
packer2 = Struct("3s")
packer_resp = Struct("10s100s")


with socket(AF_INET, SOCK_STREAM) as client:
    client.connect(server_addr)
    data = packer.pack(*msg)

    client.sendall(data)

    data = client.recv(packer_resp.size)
    result = packer_resp.unpack(data)[1].decode()
    print(f"Received: {result}")

    data2 = (result[5] + result[5] + result[7]).encode()

    data2 = packer2.pack(data2)
    client.sendto(data2, server_addr)

    data2 = client.recv(packer_resp.size)
    result = packer_resp.unpack(data)
    print(f"Received: {result[1].decode()}")
