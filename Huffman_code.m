%Saikumar Mulkalla
%Entropy Coding ---> Huffman Coding
clc;
clear all;   % clearing Command Window
close all;
X = input ("Enter the number of symbol:");
N = 1:X;
fprintf("The number of symbols are N!");
disp (N);
P = input("Enter the Probabilities")
disp (P);
S = sort(P,'descend');
disp (S);
[dict, avglen] = huffmandict (N,S);
disp ("The average length of the code is ");
disp (avglen);
H = 0
for i=1:X
H = H + (P(i) * log2(1/P(i)));
end
disp("Entropy is");
disp (H);
disp ("bits/msg");
E = (H/avglen) * 100,
disp("Efficiency is :");
disp(E);
codeword = huffmanenco (N,dict);
disp("The Codewords are")
disp (codeword);
decode = huffmandeco(codeword,dict);
disp("The Decoded Output is")
disp (decode);