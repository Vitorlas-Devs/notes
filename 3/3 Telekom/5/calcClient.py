from socket import socket, AF_INET, SOCK_DGRAM
from struct import Struct

server_addr = ("localhost", 10000)
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

    with socket(AF_INET, SOCK_DGRAM) as client:
        client.sendto(data, server_addr)

        data, _ = client.recvfrom(200)
        result = packer_resp.unpack(data)[0]
        print(f"Received: {result}")


if __name__ == "__main__":
    main()
