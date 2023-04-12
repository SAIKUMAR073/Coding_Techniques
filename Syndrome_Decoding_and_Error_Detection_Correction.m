%Code for Syndrome Decoding and Error Detection & Correction
%Code By Saikumar Mulkalla (BT19ECE073)
clc;
close all;
%CodeWord Length
n = input('Enter the CodeWord Length');
%Message Length
k = input('Enter Number of Message Bits');
%Generator Matrix
G = input('Enter Generator Matrix');
for i = 1 : 2^k
  for j = k : -1 : 1
    if rem(i -1, 2^(-j+k+1)) >= 2^(-j+k)
      M(i,j) = 1;
     else
      M(i,j) = 0;
    end
  end
 end
 disp('Message Matrix');
 disp(M);
 EncodeMsg = encode(M,n,k,'linear', G);
 disp('Encoded Messages');
 disp(EncodeMsg);
 P = hammgen(n-k);
 E = syndtable(P);
 disp('Error Matrix');
 disp(E);
 Par = G(:,k+1:n);
 P = (Par)';
 disp('Parity Matrix');
 disp(P);
 I = eye(k-1);
 H = [P I];
 h = H';
 S = mod(E*h, 2);
 disp('Syndrome Table');
 disp(S);
 decodeMsg = decode(EncodeMsg,n,k,'linear', G);
 disp('Decoding Messages');
 disp(decodeMsg);
 HammDis = zeros(2^k,1);
 for i = 1:2^k
   for j = 1:n
     if EncodeMsg(i,j) == 1
       HammDis(i) = HammDis(i) + 1;
     end
   end
 end
 sort(HammDis);
 if HammDis(1) == 0
   dmin = HammDis(2);
  else
   dmin = HammDis(1);
 end
 disp("Minimum Hamming Distance is");
 disp(dmin);
 ErrDet = dmin - 1;
 ErrCor = ErrDet/2;
 disp("No.of Error(s) Detected");
 disp(ErrDet)
 disp("No.of Error(s) Corrected");
 disp(ErrCor);