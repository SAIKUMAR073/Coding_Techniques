%Code for Cyclic Code Encoding and Decoding
%Code By: Saikumar Mulkalla (BT19ECE073)

clc;
clear all; 
close all;
n=input('Enter codeword length');
k=input('Enter No of msg bits');
G=input('Enter Generator Polynomial');
msg=dec2bin(0:2^k-1); %Generating all the Message Bits 
[i,px]=cyclgen(n,G); %Converting Generator Polynomial to Generator Matrix
g=circshift(px,[0,k]); %Circular Shifting the matrix to get correct generator Matrix
disp("Message Bits");
disp(msg);
disp("Generator Matrix");
disp(g);
c=rem(msg*g,2);
disp("CodeWords")
disp(c);