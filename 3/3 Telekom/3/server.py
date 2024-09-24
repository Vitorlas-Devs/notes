from socket import socket, AF_INET, SOCK_STREAM


def main():
    server_addr = ("localhost", 4321)

    with socket(AF_INET, SOCK_STREAM) as server:
        server.bind(server_addr)
        # server.listen()
        server.listen(2) 

        # while True:
        for i in range(3):
            client, client_addr = server.accept()
            print("Connected by", client_addr)

            data = client.recv(200)
            print("Received:", data.decode())

            client.sendall(b"Hello client!")
            client.close()


if __name__ == "__main__":
    main()
