function [ ph00, ph01, ph10, ph11, phdash00 ,phdash01, phdash10, phdash11, ph2dash00 ,ph2dash01, ph2dash10, ph2dash11] =...
    matriciescip1( n,h )
%MATRICIES Summary of this function goes here
%   Detailed explanation goes here
ph00= zeros(n+1,n+1); ph01= zeros(n+1,n+1); ph10= zeros(n+1,n+1);ph11= zeros(n+1,n+1);
phdash00= zeros(n+1,n+1); phdash01= zeros(n+1,n+1); phdash10= zeros(n+1,n+1);phdash11= zeros(n+1,n+1);
ph2dash00= zeros(n+1,n+1); ph2dash01= zeros(n+1,n+1);ph2dash10= zeros(n+1,n+1); ph2dash11= zeros(n+1,n+1);


for  i = 2:n
   ph00(i,i-1:i+1)=[9*h/70 26*h/35 9*h/70];
   ph01(i,i-1:i+1)=[13*h^2/420 0 -13*h^2/420];
   ph10(i,i-1:i+1)=[-13*h^2/420 0 13*h^2/420];
   ph11(i,i-1:i+1)=[-h^3/140 2*h^3/105 -h^3/140];
   phdash00(i,i-1:i+1)=[-1/2 0 1/2];
   phdash01(i,i-1:i+1)=[-h/10 h/5 -h/10];
   phdash10(i,i-1:i+1)=[h/10 -h/5 h/10];
   phdash11(i,i-1:i+1)=[h^2/60 0 -h^2/60];
   ph2dash00(i,i-1:i+1)=[6/(5*h) -12/(5*h) 6/(5*h)];
   ph2dash01(i,i-1:i+1)=[1/10 0 -1/10];
   ph2dash10(i,i-1:i+1)=[-1/10 0 1/10];
   ph2dash11(i,i-1:i+1)=[h/30 -4*h/15 h/30]; 
end

      
      %%%%%%%%%%%%%%%%%%%%%%%%%
      R1 = [
    (13*h)/35;
 (11*h^2)/210;
 (11*h^2)/210;
      h^3/105;
         -1/2;
         h/10;
        -h/10;
            0;
     -6/(5*h);
       -11/10;
        -1/10;
    -(2*h)/15;
 ];

   ph00(1,1:2)=[R1(1), 9*h/70];
   ph01(1,1:2)=[R1(2), -13*h^2/420];
   ph10(1,1:2)=[R1(3), 13*h^2/420];
   ph11(1,1:2)=[R1(4), -h^3/140];
   phdash00(1,1:2)=[R1(5), 1/2];
   phdash01(1,1:2)=[R1(6), -h/10];
   phdash10(1,1:2)=[R1(7), h/10];
   phdash11(1,1:2)=[R1(8), -h^2/60];
   ph2dash00(1,1:2)=[R1(9), 6/(5*h)];
   ph2dash01(1,1:2)=[R1(10), -1/10];
   ph2dash10(1,1:2)=[R1(11), 1/10];
   ph2dash11(1,1:2)=[R1(12), h/30]; 

 Rn=[(13*h)/35;
 -(11*h^2)/210;
 -(11*h^2)/210;
       h^3/105;
           1/2;
          h/10;
         -h/10;
             0;
      -6/(5*h);
         11/10;
          1/10;
     -(2*h)/15];

 ph00(n+1,n:n+1)=[9*h/70 ,Rn(1)];
   ph01(n+1,n:n+1)=[13*h^2/420 ,Rn(2)];
   ph10(n+1,n:n+1)=[-13*h^2/420 ,Rn(3)];
   ph11(n+1,n:n+1)=[-h^3/140 ,Rn(4)];
   phdash00(n+1,n:n+1)=[-1/2 ,Rn(5)];
   phdash01(n+1,n:n+1)=[-h/10 ,Rn(6)];
   phdash10(n+1,n:n+1)=[h/10 ,Rn(7)];
   phdash11(n+1,n:n+1)=[-h^2/60 ,Rn(8)];
   ph2dash00(n+1,n:n+1)=[6/(5*h),Rn(9)];
   ph2dash01(n+1,n:n+1)=[1/10 ,Rn(10)];
   ph2dash10(n+1,n:n+1)=[-1/10 ,Rn(11)];
   ph2dash11(n+1,n:n+1)=[h/30 ,Rn(12)]; 
 
end
