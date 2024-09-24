from socket import socket, AF_INET, SOCK_STREAM


def main():
    server_addr = ("localhost", 4321)
    # server_addr = ("oktnb147.inf.elte.hu", 10000)

    with socket(AF_INET, SOCK_STREAM) as client:
        client.connect(server_addr)

        client.sendall(b"Hello server!")
        data = client.recv(200)
        print("Received:", data.decode())


if __name__ == "__main__":
    main()
