
#!/bin/bash
set -e

echo "[*] Generating SSH key..."
ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa

echo "[*] Copying key to nodes..."
for host in node1 node2 node3; do
  ssh-copy-id root@$host
done

echo "[*] Done."
