from socket import socket, AF_INET, SOCK_STREAM
import struct

server_addr = ("localhost", 4321)
packer = struct.Struct("iic")
packer_resp = struct.Struct("f")


def main():
    num1, operator, num2 = input(
        "Enter two numbers and an operator (ex. 1 + 2): "
    ).split()
    num1 = int(num1)
    num2 = int(num2)
    operator = operator.strip()
    print(f"num1: '{num1}', num2: '{num2}', operator: '{operator}'")
    data = packer.pack(num1, num2, operator.encode())

    with socket(AF_INET, SOCK_STREAM) as client:
        client.connect(server_addr)

        client.sendall(data)

        resp_data = client.recv(packer_resp.size)
        result = packer_resp.unpack(resp_data)
        print(f"Result: {result[0]}")


if __name__ == "__main__":
    main()
