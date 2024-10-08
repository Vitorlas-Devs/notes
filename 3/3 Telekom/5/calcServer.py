from socket import socket, AF_INET, SOCK_DGRAM, timeout
from struct import Struct

server_addr = ("", 10000)
packer = Struct("iic")
packer_resp = Struct("f")


def main():
    with socket(AF_INET, SOCK_DGRAM) as server:
        server.bind(server_addr)
        server.settimeout(1)

        while True:
            try:
                data, client_addr = server.recvfrom(200)
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

                print(f"Received: {num1} {operator} {num2} from {client_addr}")

                server.sendto(packer_resp.pack(result), client_addr)
            except timeout:
                pass


if __name__ == "__main__":
    main()
