## Copyright (C) 2017 Chaman Agrawal
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} polynomial (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Chaman Agrawal <chaman@pc>
## Created: 2017-10-12

function [y] = polynomial (x,B ,n,m)
  P = ones(n,1);
  for i=1:n
    for j=1:n
      if(i~=j)
        P(i,1)=P(i,1).*(x-B(j,1))/(B(i,1)-B(j,1));
      end;
    end;
  end;
  y=0;
  for i=1:n
    y=y+B(i,2)*P(i,1);
  end;

endfunction
