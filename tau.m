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
## @deftypefn {Function File} {@var{retval} =} tau (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <alekseym@am>
## Created: 2016-05-19

function [res] = tau (D , Y)
    N = length(D);
    tau =  gf(zeros(1, 2 * N - 1), 8 ,285);
    
    for k = 1:(2 * N - 1)
        for j = 1:N
            cur = Y(j);
            cur *= D(j)^(k - 1);
            w = w_d(D, j);
            cur *= w^(-1);
            
            tau(k) += cur;
        end
    end
    res = tau;
end

