from socket import socket, AF_INET, SOCK_STREAM
from select import select

server_addr = ("", 4321)


def main():
    with socket(AF_INET, SOCK_STREAM) as server:
        inputs = [server]
        server.bind(server_addr)
        server.listen()

        while True:
            timeout = 1
            readable, writable, errored = select(inputs, [], [], timeout)

            if not (readable or writable or errored):
                continue

            for sock in readable:
                if sock is server:
                    client, client_addr = server.accept()
                    inputs.append(client)
                    print(f"Accepted connection from {client_addr}")
                else:
                    data = sock.recv(200)
                    if not data:
                        inputs.remove(sock)
                        print(f"Closed connection from {sock.getpeername()}")
                        sock.close()
                    else:
                        print(f"Received {data.decode()} from {sock.getpeername()}")
                        sock.sendall(b"Hello, World!")


if __name__ == "__main__":
    main()
