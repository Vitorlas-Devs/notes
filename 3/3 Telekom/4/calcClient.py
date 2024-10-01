from socket import socket, AF_INET, SOCK_STREAM
from time import sleep
from struct import Struct

server_addr = ("localhost", 4321)
packer = Struct("iic")
packer_resp = Struct("f")


def main():
    num1, operator, num2 = input(
        "Enter two numbers and an operator (ex. 1 + 2): "
    ).split()
    num1 = int(num1)
    num2 = int(num2)
    operator = operator.strip()
    print(f"Sending: {num1} {operator} {num2}")

    data = packer.pack(num1, num2, operator.encode())

    with socket(AF_INET, SOCK_STREAM) as client:
        client.connect(server_addr)
        print(f"Connected to {server_addr}")

        for i in range(5):
            client.sendall(data)
            resp_data = client.recv(packer_resp.size)
            result = packer_resp.unpack(resp_data)[0]
            print(f"Result: {result}")
            sleep(1)


if __name__ == "__main__":
    main()
