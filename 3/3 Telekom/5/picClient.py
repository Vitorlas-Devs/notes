from socket import socket, AF_INET, SOCK_DGRAM

server_addr = ("localhost", 10000)


def main():
    with socket(AF_INET, SOCK_DGRAM) as client, open("./out.jpg", "rb") as img:
        data = img.read(200)
        while data:
            client.sendto(data, server_addr)
            data, _ = client.recvfrom(2)
            data = img.read(200)
        client.sendto(b"", server_addr)
        data, _ = client.recvfrom(2)

    print("Received")


if __name__ == "__main__":
    main()
