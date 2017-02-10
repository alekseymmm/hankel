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
## @deftypefn {Function File} {@var{retval} =} H_k (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <alekseym@am>
## Created: 2016-05-19

function [res] = H_k (c, k)
    M = [];
    if k == 1
        M = [1];
    else
        for i = 1:(k-1)
            M = [M; c(i:(i + k - 1))];
        end
    
        M = [M; zeros(1, k )];
    end
    
    coeffs = [];
    
    for i = 1:(k)
        minor = Minor(M, k, k-i+1);
        coeffs = [coeffs, det(minor)];
    end
    res = coeffs;
end

function res = Minor(M, i, j)
    if size(M) == [1,1]
        res = M(1,1);
        return 
    end
    res = M;
    res = res([1:i-1 i+1:end],[1:j-1 j+1:end]);
end
