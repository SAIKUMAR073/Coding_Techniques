%Code for Linear Block Code Encoding and Decoding
%Code By: Saikumar Mulkalla (BT19ECE073)

clc;
clear all; 
close all;

%Codeword length
n = input ("Enter the Code Word Length(n)"); 
%Message length
k = input ("Enter the Message Length(k)");
fprintf("Enter the Parity matrix Elements enclosed in [] row wise as k is %d, enter %d elements\n",k,k*(n-k)); 
P = input ("Enter as enclosed in [] example [1,2,3,4,...]");
P = reshape(P,[n-k,k]);
P = transpose (P);
I = eye(k);
fprintf("Enter %d message bit (s) enclosed in []",k);
M = input ("Enter");
G = [I P];
encData = encode (M,n,k, 'linear/binary' ,G);
decData = decode(encData,n,k,'linear/binary' ,G);
fprintf("Length of Code Word is %d\n",n);
fprintf("Length of Message is %d\n",k);
fprintf("Identity matrix is\n")
disp (I); 
fprintf(" Parity Matrix is\n");
disp (P); 
fprintf("The generator Matrix is\n");
disp (G); 
fprintf("The Message bits are\n");
disp (M);
fprintf("The Encode data is\n");
disp(encData);
fprintf("The Decoded Data is\n");
disp(decData); 
if(M == decData)
    fprintf("The Message was Encoded and Decoded Successfully");
else
    fprintf("The Message was Not Encoded and Decoded!!!., TryAgain...");
end