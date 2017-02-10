## Copyright (C) 2016 
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
## @deftypefn {Function File} {@var{retval} =} Lagr_interpolation (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <alekseym@am>
## Created: 2016-05-19
function [res] = Lagr_interpolation (X, Y)
  res = gf(0, 8,285);
  for i = 1:length(X)
    res += L_i(X, i) * Y(i);
  end
end

function res = L_i(X, i)
  res  = gf(1, 8, 285);
  denum = gf(1, 8 ,285);
  
  for j = 1:length(X)
    if j == i
      continue;
    end
    
    p = gf([1, X(j)], 8, 285);
    res = conv(res, p);
    denum = conv(denum, X(i) + X(j));
  end
  
  res = res * (denum^(-1));
end
  


