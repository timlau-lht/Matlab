function L = Hypergraph_Laplacian( G, W )
%G is a n * m Matrix of Hypergraph, n is number of hyperedge and m is
%number of vertex
%W is a m * m wight Matrix of Hypergraph, m is number of hyperedge
D_v = zeros(size(G,1));
for i = 1:1:size(G,1)
    D_v(i,i) = sum(G(i,:));
end

D_e = zeros(size(G,2));
for i = 1:1:size(G,2)
    D_e(i,i) = sum(G(:,i));
end

H = G;

tempDV = zeros(size(D_v));
for i = 1:1:size(D_v,1)
    tempDV(i,i) = D_v(i,i)^-1/2;
end

S_z = tempDV * H * W * H' * tempDV;

I = eye(size(S_z));

L = I - S_z;
end

