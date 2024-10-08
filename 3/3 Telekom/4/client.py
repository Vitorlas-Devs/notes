from socket import socket, AF_INET, SOCK_STREAM
from time import sleep

server_addr = ("localhost", 4321)


def main():
    with socket(AF_INET, SOCK_STREAM) as client:
        client.connect(server_addr)
        print(f"Connected to {server_addr}")

        for i in range(5):
            client.sendall(f"Hello, Server {i}".encode())
            data = client.recv(200)
            print(f"Received {data.decode()}")
            sleep(1)


if __name__ == "__main__":
    main()
