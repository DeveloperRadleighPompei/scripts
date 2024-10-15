# Install VSCode Server
bash <(curl -s https://raw.githubusercontent.com/coder/code-server/main/install.sh) --port 8080 --host 0.0.0.0 --auth password --password PI21ccua!!
sudo apt install curl -y
# Create config file
mkdir -p ~/.config/code-server
echo "bind-addr: 0.0.0.0:8080" > ~/.config/code-server/config.yaml
echo "auth: password" >> ~/.config/code-server/config.yaml
echo "password: PI21ccua!!" >> ~/.config/code-server/config.yaml

# Create systemd service file
echo -e "[Unit]\nDescription=Code Server\nAfter=network.target\n\n[Service]\nType=simple\nUser=your_username_here\nExecStart=/usr/bin/code-server --config ~/.config/code-server/config.yaml\nRestart=always\n\n[Install]\nWantedBy=multi-user.target" | sudo tee /etc/systemd/system/code-server.service

# Enable and start the service
sudo systemctl enable code-server
sudo systemctl start code-server
