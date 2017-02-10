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
## @deftypefn {Function File} {@var{retval} =} tet_hank (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author:  <alekseym@am>
## Created: 2016-05-19

function test_hank()
    n = 10;
    m = 6;
    
    X = gf(zeros(1,n), 8 ,285);
    D = gf(zeros(1,m), 8 ,285);
    seed = 0;
    for i = 1:n
        X(i) = gf(2, 8, 285) ^ (i - 1);
        D(i) = gf(randint(1,1,[0, 255]), 8 ,285);
    end
    
    disp("X : "), disp(X);
    disp("D : "), disp(D);

    P = Lagr_interpolation(X, D);
    disp("interp poly : "), disp(P)
    
    num_failures = 8;
    #failures = randperm(length(D));
    #failures = failures(1:num_failures) ;
    failures = [1, 2, 3];
    
    for i = 1: m
        X = [X, gf(2, 8, 285)^(n + i - 1)];
        D = [D, polyval(P, X(n + i))];
    end
    disp("after checksum calcualtion")
    disp("X : "), disp(X);
    disp("D : "), disp(D);
    C = CodingMatrix(n, m, X(1:n), X((n+1):end));
    
    disp("Failed X :"), disp(X(failures));
    e = zeros(1,3);
    for i = 1:length(failures) 
        #D(failures(i)) = gf(randint(1,1,[0,256]), 8, 285);
    end
    ###
    e(1) = 1;
    e(3) = (X(1) + X(2))/w_d(X, X(1))*w_d(X, X(3))/(X(2) + X(3));
    e(2) = (w_d(X, X(2))/w_d(X, X(1)) + e(3)*w_d(X, X(2))/w_d(X, X(3)));
    
    disp("SDC positions"),disp(failures), disp("errors"), disp(e);
    
    D(1) += e(1);
    D(2) += e(2);
    D(3) += e(3);
    ###
    disp("afrer SDC : "), disp(D);
    tau_k = tau(X, D);

    H = {};
    for i = 1:(m/2) + 1
        H{i} = H_k(tau_k, i);
       
        disp(["H_", num2str(i - 1)]);
        disp(H{i});
        disp("Roots : ");
        roots = gf_roots(H{i});
        disp(roots);
        disp("-----------------------------\n");
    end
end


function roots = gf_roots(poly)
    roots = [];
    if poly == [gf(0,8,285)]
        return 
    end
    
    for i =1:255
        if polyval(poly, gf(i, 8 ,285)) == gf(0,8,285)
            roots = [roots, gf(i, 8 ,285)];
        end
    end
end