from socket import socket, AF_INET, SOCK_STREAM


def main():
    server_addr = ("localhost", 4321)

    client1 = socket(AF_INET, SOCK_STREAM)
    client2 = socket(AF_INET, SOCK_STREAM)
    client3 = socket(AF_INET, SOCK_STREAM)

    with client1, client2, client3:
        client1.connect(server_addr)
        client2.connect(server_addr)
        client3.connect(server_addr)

        client1.sendall(b"Hello server!")
        data1 = client1.recv(200)
        print("1 Received:", data1.decode())

        client2.sendall(b"Hello server!")
        data2 = client2.recv(200)
        print("2 Received:", data2.decode())

        client3.sendall(b"Hello server!")
        data3 = client3.recv(200)
        print("3 Received:", data3.decode())


if __name__ == "__main__":
    main()
