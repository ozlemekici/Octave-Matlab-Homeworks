%%% ----------- HACETTEPE �N�VERS�TES� ----------- %%%
% F�Z219 - Bilgisayar Programlama dersi 2020-2021 G�z D�nemi �kinci �dev ��z�m�
% D�RAC GRUBU : METEHAN �ELEB�, �ZLEM EK�C�, DEN�Z KAHYA

% Grafikleri g�rebilmeniz i�in "Enter"a basman�z gerekmektedir
% Elde edilen sonu�lar� grafiklerle beraber g�receksiniz
% �dev hem en k���k kareler y�ntemi hem de Monte Carlo y�ntemini i�ermektedir



% EN K���K KARELER Y�NTEM� GRAF�K ��Z�M�

%Veriler; ilk s�tun x, ikinci s�tun y de�eri olmak �zere yaz�l�r
xy = [
 -6,-21
 -5,-20
 -4,-16
 -3,-10
 -2, -7
 -1, -2
 0, 2
 1, 6
 2, 11
 3, 13
 4, 18
 5, 24
 6, 25];

x = xy(:,1);
y = xy(:,2);

%%Birinci Ad�m 
%Veriler do�rultusunda x-y grafi�i noktalar daire olacak �ekilde �izdirildi:
disp("Verilerin Grafikte ��aretlenmesi")
disp("")
plot(x,y,"o-")
pause()

%%�kinci Ad�m:
A11 = A12 = A22 = B11 = B12 = 0;
N = rows(x);
for i = 1:N  
  A11 = A11 + 2*x(i)^2;
  A12 = A12 + 2*x(i);
  A22 = A22 + 2;
  B11 = B11 + 2*x(i)*y(i);
  B12 = B12 + 2*y(i);
endfor 
disp("EN K���K KARELER Y�NTEM� GRAF�K ��Z�M�")
m = (B11 - (A12 * B12 / A22))  / (A11 - (A12^2 / A22))
n = (B12 - A12 * m) / A22 
disp(" ")
xx = linspace(-6,6,100);
tt = m.*xx + n;
plot(xx,tt,x,y,"ro")
pause()

%%���nc� Ad�m:
%Parabol i�in gerekli aral�k ve denklem yaz�larak noktalar ve �izgiler istenilen �ekilde yazd�r�l�r.
x_ara = -6:6;
parabol = x_ara.^2+x_ara.*4-24;


%%D�rd�nc� Ad�m:
%Zoom yaparak bulunan kesi�im noktalar�
disp("Zoom yaparak bulunan kesi�im noktalar�")
zoom_x1=-5.0272;
zoom_x2=5.1134;

%Zoom yaparak bulunan ya da bulunan k�kleri denklemlerde yerine yazarak i�lemler bitirilir.
z_ykok1 = m.*zoom_x1 + n; %1.K�k�n do�rudaki y de�eri
z_ykok2 = m.*zoom_x2 + n; %2.K�k�n do�rudaki y de�eri
z_y_kok1 = zoom_x1^2+zoom_x1*4-24; %1.K�k�n paraboldeki y de�eri
z_y_kok2 = zoom_x2^2+zoom_x2*4-24; %2.K�k�n paraboldeki y de�eri
z_fark1 = abs(z_ykok1-z_y_kok1);%mutlak de�erlerin farklar� 1. k�k i�in
z_fark2 = abs(z_ykok2-z_y_kok2);%mutlak de�erlerin farklar� 2. k�k i�in
fprintf("Do�ru �zerindeki Birinci Nokta: %g, %g \n",zoom_x1,z_ykok1);
fprintf("Parabol �zerindeki Birinci Nokta: %g, %g \n",zoom_x1,z_y_kok1);
fprintf("Do�ru �zerindeki �kinci Nokta: %g, %g \n",zoom_x2,z_ykok2);
fprintf("Parabol �zerindeki �kinci Nokta: %g, %g \n",zoom_x2,z_y_kok2);
fprintf("Birinci Noktalar Aras�ndaki Fark: %g\n",z_fark1);
fprintf("�kinci Noktalar Aras�ndaki Fark: %g\n",z_fark2);
disp(" ")

%% EN K���K KARELER Y�NTEM� ���N BONUS
%K�saca denklemin k�klerini bulan bir program yard�m�yla kesi�en noktalar belirlenir.
kesim = x_ara.^2+x_ara.*(4-m)-(24+n);
A= 1;
B= 4-m;
C= -24-n;
%Delta y�ntemi ile basit bir program yaz�l�p denklemin k�kleri bulunur.
disp("Delta y�ntemi ile bulunan kesi�im noktalar�")
delta=B^2-4*A*C;
if delta > 0
    x1=(-B-sqrt(delta))/(2*A);
    x2=(-B+sqrt(delta))/(2*A);
endif
%Burada tercih etti�imiz noktalar kesin olarak bulunan k�k noktalar� oldu.
%K�klerin y de�erlerini hesaplama:
ykok1 = m.*x1 + n; %1.K�k�n do�rudaki y de�eri
ykok2 = m.*x2 + n; %2.K�k�n do�rudaki y de�eri
y_kok1 = x1^2+x1*4-24; %1.K�k�n paraboldeki y de�eri
y_kok2 = x2^2+x2*4-24; %2.K�k�n paraboldeki y de�eri
fark1 = abs(ykok1-y_kok1);%mutlak de�erlerin farklar� 1. k�k i�in
fark2 = abs(ykok2-y_kok2);%mutlak de�erlerin farklar� 2. k�k i�in
fprintf("Do�ru �zerindeki Birinci Nokta: %g, %g \n",x1,ykok1);
fprintf("Parabol �zerindeki Birinci Nokta: %g, %g \n",x1,y_kok1);
fprintf("Do�ru �zerindeki �kinci Nokta: %g, %g \n",x2,ykok2);
fprintf("Parabol �zerindeki �kinci Nokta: %g, %g \n",x2,y_kok2);
fprintf("Birinci Noktalar Aras�ndaki Fark: %g\n",fark1);
fprintf("�kinci Noktalar Aras�ndaki Fark: %g\n",fark2);
disp(" ")
plot(xx,tt,"r-",x,y,"mx",x_ara,parabol,"b-o")
pause()




% MONTE CARLO Y�NTEM� �LE �NTEGRAL HESABI
disp("MONTE CARLO Y�NTEM� �LE �NTEGRAL HESABI")
k1 = [(-5.0299), (-5.0299), (5.1233), (5.1233),(-5.0299)];
k2 = [(-29), (25), (25), (-29), (-29) ];

%% D�KD�RTGEN ���N BONUS KES�M
%kesim = x^2+x*(4-m)-(24+n);
%integral i�i: mx+n - (x^2+4*x-24) = -x^2+(m-4)*x+24+n
%integral : -x^3/3+x^2*((m-4)/2)+((24+n)*x)
% x1=5.12326, x2=-5.02985 kesimin k�klerinden bulunmu�tu
int_ust = (-x2^3)/3+x2^2*((m-4)/2)+((24+n)*x2);
int_alt = (-x1^3)/3+x1^2*((m-4)/2)+((24+n)*x1);
int_alan = int_ust - int_alt;

disp(" ")


%%% ULTRA BONUS
rand("seed",219)
N = 20000;
%Matris tan�mland�
matrix(:,1) = (rand([N,1])-0.5)*12;
matrix(:,2) = (-30) + rand([N,1])*56.330;
matrix(:,3) = matrix(:,1).*m+n; %Do�ru �zerindeki yd de�erleri
matrix(:,4) = matrix(:,1).^2+ matrix(:,1).*4-24; %Parabol �zerindeki yp de�erleri

%Yamu�un d���na d��enler
f1 = matrix(:,2)-matrix(:,3)>0;
hs1 = [1:N](f1);
bir = matrix(hs1,:);

%Yamu�un alt�na d��enler
iki_uc = matrix([1:N](not(f1)),:);
n2=rows(iki_uc);

%Bizden istenen b�lgeye d��enler
f2 = iki_uc(:,2)- iki_uc(:,4)>0;
uc = iki_uc([1:N](f2),:);

%Yamukta parabol alt�na d��enler
iki = iki_uc([1:N](not(f2)),:);

%�stenen b�lgedeki nokta say�s�
nokta = rows(uc);
%Yamu�un i�indeki nokta say�s�
nokta2 = rows(iki_uc);
%Yamu�un alan� 
y_alan = ((7.2088+56.330)/2)*12; % yamu�un alan�=381.23 
Alan = (nokta*y_alan)/nokta2;

disp("Ultra bonus:")
disp("Yamuk ��in")
fprintf("Ara B�lgedeki Nokta Say�s� : %g\n",nokta);
fprintf("Ara B�lgenin Alan� : %g\n",Alan);
disp(" ")
plot(xx,tt,"r-",x_ara,parabol,"b-",uc(:,1),uc(:,2),".b",iki(:,1),iki(:,2),".r")
pause()




% D�KD�RTGENDE MONTE CARLO
disp("Dikd�rtgende Monte Carlo")
rand("seed",219)
N = 10000;
plot(xx,tt,"r-",x_ara,parabol,"b-",k1,k2,"g-") %dikd�rtgen �izimi
pause()
%Matris tan�mland�
matris(:,1) = (rand([N,1])-0.4955)*10.153;
matris(:,2) = (-29) + rand([N,1])*54;
matris(:,3) = matris(:,1).*m+n; %Do�ru �zerindeki yd de�erleri
matris(:,4) = matris(:,1).^2+ matris(:,1).*4-24; %Parabol �zerindeki yp de�erleri

%���nc� B�lgedekiler
hangileri1 = matris(:,3) - matris(:,2)>0 & matris(:,4) - matris(:,2)<0;
ici = matris([1:N](hangileri1),:);

%Birinci ve �kinci B�lgedekiler
dis = matris([1:N](not(hangileri1)),:);
toplam = [ici;dis];


%Nokta say�lar�
n = rows(ici);
fprintf("���nc� B�lgedeki Nokta Say�s� : %g\n",n);
n1 = rows(dis);
fprintf("1. ve 2. B�lgelerdeki Nokta Say�lar� : %g\n",n1);
n3 = rows(toplam);
fprintf("Toplam Nokta Say�s� : %g\n",n3);


%Dikd�rtgenin alan� 
d_alan = 548.27;
%Toplam nokta say�s� = N
alan = (n*d_alan)/N;
fprintf("Monte Carlo ile Bulunan ���nc� B�lgenin Alan� : %g\n",alan);
disp(" ")
disp("Bonus: ")
disp("Dikd�rtgen ��in")
fprintf("Analitik Olarak Bulunan ���nc� B�lgenin Alan� : %g\n",int_alan);

plot(xx,tt,"r-",x_ara,parabol,"b-",k1,k2,"g-",ici(:,1),ici(:,2),".b",dis(:,1),dis(:,2),".r")
pause()

%%% ----------- HACETTEPE �N�VERS�TES� ----------- %%%
% F�Z219 - Bilgisayar Programlama dersi 2020-2021 G�z D�nemi �kinci �dev ��z�m�
% D�RAC GRUBU : METEHAN �ELEB�, �ZLEM EK�C�, DEN�Z KAHYA
% Kaynaklar : FIZ219 Ders Notlar� - Emre S. Ta���