GREEN='\033[0;31m'
NC='\033[0m'

printf "${GREEN}Installing packages${NC}"
sudo apt-get -y --force-yes install zsh git

#printf "${GREEN}Installing Google Chrome\n${NC}"
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#sudo dpkg -i google-chrome-stable_current_amd64.deb

printf "${GREEN}Running Installation Scripts\n${NC}"
#sudo chmod 0777 *.sh

#./ffmpeg.install.sh

printf "${GREEN}Retrieving dot file package\n${NC}"
#mkdir -p ~/src/Teagan42/
#cd ~/src/Teagan42/
#git clone https://github.com/Teagan42/DotFiles.git
#cd DotFiles
#sudo ./install.sh

printf "${GREEN}Github SSH\n${NC}"
sudo ./git.install.sh
