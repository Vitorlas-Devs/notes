from socket import socket, AF_INET, SOCK_STREAM
import struct

# calculator server
# client sends 2 numbers and an operator
# server sends the result

server_addr = ("localhost", 4321)
packer = struct.Struct("iic")
packer_resp = struct.Struct("f")


def main():
    with socket(AF_INET, SOCK_STREAM) as server:
        server.bind(server_addr)
        server.listen()

        # while True:
        client, client_addr = server.accept()
        print("Connected by", client_addr)

        data = client.recv(packer.size)
        num1, num2, operator = packer.unpack(data)
        operator = operator.decode()
        print(f"Received: {num1} {operator} {num2}")

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

        client.sendall(packer_resp.pack(result))
        client.close()


if __name__ == "__main__":
    main()
