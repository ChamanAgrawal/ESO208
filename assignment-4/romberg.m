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
## @deftypefn {Function File} {@var{retval} =} romberg (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Chaman Agrawal <chaman@pc>
## Created: 2017-11-09

function val = romberg (I,n,order,berg)
  if(n<=1)
    val = berg(1,1);
  else
    for i= 1:1:log2(n)
      berg(1,i) = ((2^order)*I(1,i)-I(1,i+1))/(2^order-1);
    end;
    val= romberg(I,n/2,order+2,berg);
  end;
endfunction
