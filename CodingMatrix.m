## Copyright (C) 2017 
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
## @deftypefn {Function File} {@var{retval} =} CodingMatrix (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <alekseym@am>
## Created: 2017-02-08

function C = CodingMatrix (n, m, X, NewPoints)
    C = gf(zeros(m, n), 8, 285);
    
    for i = 1:n
        denum = w_d(X, X(i));
  
        for j = 1:m
            numerator = w_di(X, i, NewPoints(j));
            C(j, i) = numerator / denum;
        end;
    end;

endfunction
