import struct
import sys
import socket

packer = struct.Struct("20si")


def main():
    if len(sys.argv) == 1:
        print(socket.gethostname())
        return
    elif len(sys.argv) == 3:
        recNum = int(sys.argv[1])
        recType = sys.argv[2]
    else:
        print("Usage: python first.py <record number> <record type>")
        return

    with open("domainPort.bin", "rb") as f:
        f.seek((recNum - 1) * packer.size)
        data = f.read(packer.size)

        domain, port = packer.unpack(data)
        domain = domain.decode().strip("\x00")

        if recType == "domain":
            print(socket.gethostbyname(domain))
        elif recType == "port":
            print(socket.getservbyport(port))


if __name__ == "__main__":
    main()
