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
## @deftypefn {Function File} {@var{retval} =} f (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Chaman Agrawal <chaman@pc>
## Created: 2017-08-31

function y = f (n, coeff,x)
  y=0;
  for k=1:n+1
    y=y+coeff(1,k)*x^(k-1);
  end;
endfunction
