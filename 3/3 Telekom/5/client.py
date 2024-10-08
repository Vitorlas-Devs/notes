from socket import socket, AF_INET, SOCK_DGRAM

server_addr = ("localhost", 10000)


def main():
    with socket(AF_INET, SOCK_DGRAM) as client:
        client.sendto(b"Hello, Server!", server_addr)

        data, _ = client.recvfrom(200)
        print(f"Received: {data.decode()}")


if __name__ == "__main__":
    main()
