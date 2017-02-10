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
## @deftypefn {Function File} {@var{retval} =} ComputeWeight (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <alekseym@am>
## Created: 2017-02-07

function w=ComputeWeight( val )
w = val;
w = bitand(bitshift(w, -1), uint32(1431655765)) + ...
    bitand(w, uint32(1431655765));

w = bitand(bitshift(w, -2), uint32(858993459)) + ...
    bitand(w, uint32(858993459));

w = bitand(bitshift(w, -4), uint32(252645135)) + ...
    bitand(w, uint32(252645135));

w = bitand(bitshift(w, -8), uint32(16711935)) + ...
    bitand(w, uint32(16711935));

w = bitand(bitshift(w, -16), uint32(65535)) + ...
    bitand(w, uint32(65535));

endfunction
