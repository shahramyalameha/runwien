#! /usr/bin/gawk -f
#
# This file is part of runwien.awk
#
# Copyright (c) 2007 Alberto Otero <aoterodelaroza@gmail.com> and 
#  Víctor Luaña <victor@carbono.quimica.uniovi.es>. Universidad de Oviedo.
# 
# runwien.awk is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version. 
# 
# runwien.awk is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
BEGIN{
    filename = ARGV[1]
    atom = ARGV[2]
    lms = ARGV[3]
    for (i=1;i<=lms;i++){
	l[i] = ARGV[4+2*(i-1)]
	m[i] = ARGV[4+2*(i-1)+1]
    }
    ARGC = 2
}
NR==3+atom{
    for(i=1;i<=lms;i++){
	printf "%3i%2i",l[i],m[i] > "tempfile_script"
    }
    printf "\n" > "tempfile_script"
    next
}
{print > "tempfile_script"}
END{
   system("mv tempfile_script " filename)
}
