import socket
import sys
import threading


def forward_data(source, destination):
    try:
        while True:
            data = source.recv(4096)
            if not data:
                break
            destination.send(data)
    except Exception:
        pass
    finally:
        source.close()
        destination.close()


def handle_client(client_socket, target_host, target_port):
    # Connect to target server
    target_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    target_socket.connect((target_host, target_port))

    # Create threads to forward data bidirectionally
    client_to_target = threading.Thread(
        target=forward_data, args=(client_socket, target_socket)
    )
    target_to_client = threading.Thread(
        target=forward_data, args=(target_socket, client_socket)
    )

    client_to_target.start()
    target_to_client.start()


def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <target_host> <target_port>")
        print(f"Example: {sys.argv[0]} ggombos.web.elte.hu 9000")
        sys.exit(1)

    target_host = sys.argv[1]
    local_port = int(sys.argv[2])
    target_port = 80

    # Create proxy server
    proxy = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    proxy.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    proxy.bind(("0.0.0.0", local_port))
    proxy.listen(5)

    print(f"Proxy listening on localhost:{local_port}")
    print(f"Forwarding to {target_host}:{target_port}")

    while True:
        try:
            client_socket, addr = proxy.accept()
            print(f"Received connection from {addr[0]}:{addr[1]}")

            proxy_thread = threading.Thread(
                target=handle_client, args=(client_socket, target_host, target_port)
            )
            proxy_thread.start()
        except KeyboardInterrupt:
            break
        except Exception as e:
            print(f"Error: {e}")
            break

    proxy.close()


if __name__ == "__main__":
    main()
