#!/bin/sh

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

# ReadyMedia container may fail to restart, because a previous lock may exist:
# let's shoot it!
/bin/rm -rf /var/run/minidlna

/usr/local/bin/minidlnad -d -r -L -f /etc/minidlna.conf
