echo "--- DEBUG INFO ---"
echo "Current User: $(whoami)"
echo "Home Directory: $HOME"
echo "SSH Dir Contents:"
ls -la /var/jenkins_home/.ssh || echo "Cannot access /var/jenkins_home/.ssh"
echo "Root SSH Dir Contents:"
ls -la /root/.ssh || echo "Cannot access /root/.ssh"

echo "--- TESTING SSH CONNECTIVITY ---"
# Try with -v (verbose) to see exactly where the handshake fails
ssh -v -i /var/jenkins_home/.ssh/id_rsa \
    -o UserKnownHostsFile=/var/jenkins_home/.ssh/known_hosts \
    -o StrictHostKeyChecking=no \
    ubuntu@145.239.84.160 "echo Remote shell reachable"

echo "--- STARTING UPDATE SCRIPT ---"
ssh -i /var/jenkins_home/.ssh/id_rsa \
    -o UserKnownHostsFile=/var/jenkins_home/.ssh/known_hosts \
    -o StrictHostKeyChecking=no \
    ubuntu@145.239.84.160 "bash /home/ubuntu/server/ci/update-webapp.sh"