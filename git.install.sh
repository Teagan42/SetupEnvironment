sudo apt-get -y --force-yes install xclip git

git config --global core.editor vim

printf "Generating rsa key\n"
ssh-keygen -t rsa -b 4096 -C "{$email}"

printf "Adding to SSH"
ssh-add ~/.ssh/id_rsa

printf "Public key copied to clipboard"
xclip -sel clip < ~/.ssh/id_rsa.pub
