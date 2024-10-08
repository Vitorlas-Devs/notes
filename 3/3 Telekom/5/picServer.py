from socket import socket, AF_INET, SOCK_DGRAM

server_addr = ("", 10000)


def main():
    with socket(AF_INET, SOCK_DGRAM) as server, open("./img.jpg", "wb") as img:
        server.bind(server_addr)

        data, client_addr = server.recvfrom(200)
        while data:
            img.write(data)
            data, client_addr = server.recvfrom(200)
        server.sendto(b"OK", client_addr)


if __name__ == "__main__":
    main()
