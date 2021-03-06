% Edited by M. Tavella <michele.tavella@epfl.ch> on 24/06/09 14:33:37
%
% function [ridx, cidx] = eegc2_contribute_matrix(M, th)
%
% Where: 
%          M         matrix to "sort"
%          th        threshold (>=)
%
% Returns:
%          ridx      row indexes, descending values
%          cidx      col indexes, descending values
%

function [ridx, cidx] = eegc3_contribute_matrix(M, th)

if(nargin == 1)
	th = min(min(M)) - 1;
end

v = reshape(M', prod(size(M)), 1);
[vs, vsidx] = sort(v, 'descend');

%eegc2_figure(666);
%plot(vs);
%con = eegc2_contribute(v,  0.250)
%hold on;
%plot(con, vs(con), 'ro');

ridx = [];
cidx = [];

for j = 1:length(v)
	if(vs(j) >= th)
		c = mod((vsidx(j) - 1) , size(M, 2)) + 1;
		r = floor((vsidx(j) - 1) / size(M, 2)) + 1;

		ridx = [ridx r];
		cidx = [cidx c];
	end
end

if(length(ridx) ~= length(cidx))
	disp('[eegc2_contribute_matrix] Error: dims do not agree!');
end
