RCol='\e[0m'    # Text Reset
GREEN='\e[0;32m'
RED='\e[0;31m'

sudo apt-get -y --force-yes install yasm libmp3lame-dev libopus-dev libx264-dev cmake mercurial

mkdir ~/ffmpeg_sources

printf "${GREEN}Installing libfdk-aac\n${RCol}"
cd ~/ffmpeg_sources
printf "Retrieving package\n"
wget -O fdk-aac.tar.gz https://github.com/mstorsjo/fdk-aac/tarball/master
tar xzvf fdk-aac.tar.gz
cd mstorsjo-fdk-aac*
autoreconf -fiv
printf "Building package\n"
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean

printf "${GREEN}Installing libx265\n${RCol}"
cd ~/ffmpeg_sources
printf "Retrieving package\n"
hg clone https://bitbucket.org/multicoreware/x265
cd ~/ffmpeg_sources/x265/build/linux
printf "Building package\n"
PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source
make
make install
make distclean

printf "${Green}Installing libvpx\n${RCol}"
cd ~/ffmpeg_sources
printf "Retrieving package\n"
wget http://storage.googleapis.com/downloads.webmproject.org/releases/webm/libvpx-1.5.0.tar.bz2
tar xjvf libvpx-1.5.0.tar.bz2
cd libvpx-1.5.0
printf "Installing package\n"
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests
PATH="$HOME/bin:$PATH" make
make install
make clean

printf "${GREEN}Installing ffmpeg\n${RCol}"
printf "Retrieving package\n"
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
printf "Installing package\n"
printf "${GREEN}TH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree
PATH="$HOME/bin:$PATH" make
make install
make distclean
hash -r

