clc;
clear all;
close all;
n=input('énter the code word length : n :');
k=input('énter the message bits: k :');
m=n-k
z=2^m
i=0;
for j=0:1:n
  sum=0;
  for i=0:1:j
    c=factorial(n)/(factorial(n-1)*factorial(i));
    sum=sum+c;
  end
  if sum >= z
    j=j-1;
    sum=sum-c;
    break;
  end
end
 ans = sprintf('(%d,%d) can correct all combinations of %d errors and it can also correct %d combinations of %d errors', n,k,j,z-sum,j+1);
 ans