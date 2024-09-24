from datetime import datetime
from socket import socket, AF_INET, SOCK_STREAM
import struct


server_addr = ("localhost", 4321)
packer = struct.Struct("s")


def main():
    with socket(AF_INET, SOCK_STREAM) as server:
        server.bind(server_addr)
        server.listen()

        client, client_addr = server.accept()
        print("Connected by", client_addr)

        data = client.recv(packer.size)
        command = packer.unpack(data)
        command = command[0].decode()
        print(f"Received: {command}")

        if command == "getDate":
            today = datetime.now().isoformat()
            result = f"Today is {today}"
        else:
            result = f"{command} is not implemented yet"

        client.sendall(packer.pack(result))
        client.close()


if __name__ == "__main__":
    main()
