# Install dependencies
echo Installing Dependencies
sudo apt-get install -y --force-yes  build-essential pkg-config libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev libqt4-dev

echo Setting up temporary directories
mkdir ~/makemkv_sources
cd ~/makemkv_sources

# Get OSS and BIN packages
echo Downloading packages
wget http://www.makemkv.com/download/makemkv-bin-1.9.9.tar.gz
wget http://www.makemkv.com/download/makemkv-oss-1.9.9.tar.gz

# Extract packages
echo Extracting BIN package
tar -zxvf makemkv-bin-1.9.9.tar.gz
echo Extracting OSS package
tar -zxvf makemkv-oss-1.9.9.tar.gz

# Build OSS
echo Installing OSS package
cd makemkv-oss-1.9.9/
PKG_CONFIG_PATH=~/ffmpeg_build/lib/pkgconfig ./configure 
make
sudo make install

# Build binary
echo Installing BIN package
cd ~/makemkv_sources/makemkv-bin-1.9.9/
./configure
make
sudo make install

# Cleanup
echo Cleaning up
