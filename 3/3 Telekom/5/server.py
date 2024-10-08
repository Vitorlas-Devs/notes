from socket import socket, AF_INET, SOCK_DGRAM

server_addr = ("", 10000)


def main():
    with socket(AF_INET, SOCK_DGRAM) as server:
        server.bind(server_addr)

        data, client_addr = server.recvfrom(200)
        print(f"Received: {data.decode()} from {client_addr}")

        server.sendto(b"Hello, Client!", client_addr)


if __name__ == "__main__":
    main()
