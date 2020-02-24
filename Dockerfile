# Copyright (c) 2020 Alexandre Roman <alexandre.roman@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM balenalib/raspberry-pi-debian:buster
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends build-essential git
RUN apt-get install -y --no-install-recommends autopoint debhelper dh-autoreconf gcc libavutil-dev libavcodec-dev libavformat-dev libjpeg-dev libsqlite3-dev libexif-dev libid3tag0-dev libogg-dev libvorbis-dev libflac-dev

RUN git clone http://git.code.sf.net/p/minidlna/git minidlna-git
WORKDIR /minidlna-git
RUN git checkout v1_2_1

RUN ./autogen.sh && ./configure && make

FROM balenalib/raspberry-pi-debian:buster
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends libjpeg62-turbo libid3tag0 libsqlite3-0 libavformat58 libexif12 libflac8
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
COPY --from=0 /minidlna-git/minidlnad /usr/local/bin
COPY minidlna.conf /etc
COPY minidlna.sh /
EXPOSE 8200 1900/udp
CMD /minidlna.sh
