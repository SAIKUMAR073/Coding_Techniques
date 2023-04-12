%Saikumar Mulkalla
%Convolution Encoding and Decoding for 1/2 Convolution encoder
clc;
clear all;   % clearing Command Window
close all;
msg = [1 1 0 0 1 0]; % Message Bits
fprintf("Message Bits");
disp(msg);
code_trellis = poly2trellis(3,[7 5]); % Code trellis Constrinct Length = 3 and Outputs G1 = [1 1 1] and G2 = [1 0 1]
encoded_msg = convenc(msg,code_trellis); % Encoding msg by Convolution Encoder
fprintf("Encoded Message")
disp(encoded_msg);
tbdepth = 3; % Number of branches in Coder Trellis
decoded_msg = vitdec(encoded_msg,code_trellis,tbdepth,'trunc','hard'); % decoding by viterbi alogorithm
fprintf("Decoded Message")
disp(decoded_msg);
