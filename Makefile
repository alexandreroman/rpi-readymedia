# Copyright (c) 2017 Alexandre Roman <alexandre.roman@gmail.com>
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

all: rpi-readymedia

clean:
	/bin/rm -f minidlnad
	sudo docker image rm rpi-readymedia-build
	sudo docker image rm rpi-readymedia

minidlnad:
	sudo docker build -t rpi-readymedia-build -f Dockerfile_build .
	sudo docker create --name rpi-readymedia-tmp rpi-readymedia-build
	sudo docker cp rpi-readymedia-tmp:/minidlna-git/minidlnad .
	sudo docker rm -v rpi-readymedia-tmp

rpi-readymedia: minidlnad
	sudo docker build -t rpi-readymedia .
