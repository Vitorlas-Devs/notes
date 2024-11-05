from socket import socket, AF_INET, SOCK_STREAM
from struct import Struct
import select

server_addr = ("localhost", 12000)
packer = Struct("20si?")
packer_resp = Struct("10s")


with socket(AF_INET, SOCK_STREAM) as server:
    inputs = [server]
    server.bind(server_addr)
    server.listen()

    while True:
        timeout = 1
        readable, writable, errored = select.select(inputs, [], [], timeout)

        if not (readable or writable or errored):
            continue

        for sock in readable:
            if sock is server:
                client, client_addr = server.accept()
                inputs.append(client)
                print(f"Accepted connection from {client_addr}")
            else:
                data = sock.recv(packer.size)
                if not data:
                    inputs.remove(sock)
                    print(f"Closed connection from {sock.getpeername()}")
                    sock.close()
                else:
                    string, num, boolean = packer.unpack(data)
                    string = string.decode()

                    print(f"Received: {string}, {num}, {boolean} from {client_addr}")

                    if boolean:
                        result: str = string[:num]
                    else:
                        result: str = string[-num:]

                    result = result.rjust(10, "\0")

                    print(f"Sent: {result.encode()}")

                    sock.sendall(packer_resp.pack(result.encode()))

