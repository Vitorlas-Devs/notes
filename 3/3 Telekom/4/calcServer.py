from socket import socket, AF_INET, SOCK_STREAM
from select import select
from struct import Struct


server_addr = ("", 4321)
packer = Struct("iic")
packer_resp = Struct("f")


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
                    data = sock.recv(packer.size)
                    if not data:
                        inputs.remove(sock)
                        print(f"Closed connection from {sock.getpeername()}")
                        sock.close()
                    else:
                        num1, num2, operator = packer.unpack(data)
                        operator = operator.decode()

                        if operator == "+":
                            result = num1 + num2
                        elif operator == "-":
                            result = num1 - num2
                        elif operator == "*":
                            result = num1 * num2
                        elif operator == "/":
                            result = num1 / num2
                        else:
                            result = 0

                        print(
                            f"Received {num1} {operator} {num2} from {sock.getpeername()}"
                        )
                        sock.sendall(packer_resp.pack(result))


if __name__ == "__main__":
    main()
