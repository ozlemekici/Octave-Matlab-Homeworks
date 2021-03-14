%%% ----------- HACETTEPE ÜNÝVERSÝTESÝ ----------- %%%
% FÝZ219 - Bilgisayar Programlama dersi 2020-2021 Güz Dönemi Ýkinci Ödev Çözümü
% DÝRAC GRUBU : METEHAN ÇELEBÝ, ÖZLEM EKÝCÝ, DENÝZ KAHYA

% Grafikleri görebilmeniz için "Enter"a basmanýz gerekmektedir
% Elde edilen sonuçlarý grafiklerle beraber göreceksiniz
% Ödev hem en küçük kareler yöntemi hem de Monte Carlo yöntemini içermektedir



% EN KÜÇÜK KARELER YÖNTEMÝ GRAFÝK ÇÝZÝMÝ

%Veriler; ilk sütun x, ikinci sütun y deðeri olmak üzere yazýlýr
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

%%Birinci Adým 
%Veriler doðrultusunda x-y grafiði noktalar daire olacak þekilde çizdirildi:
disp("Verilerin Grafikte Ýþaretlenmesi")
disp("")
plot(x,y,"o-")
pause()

%%Ýkinci Adým:
A11 = A12 = A22 = B11 = B12 = 0;
N = rows(x);
for i = 1:N  
  A11 = A11 + 2*x(i)^2;
  A12 = A12 + 2*x(i);
  A22 = A22 + 2;
  B11 = B11 + 2*x(i)*y(i);
  B12 = B12 + 2*y(i);
endfor 
disp("EN KÜÇÜK KARELER YÖNTEMÝ GRAFÝK ÇÝZÝMÝ")
m = (B11 - (A12 * B12 / A22))  / (A11 - (A12^2 / A22))
n = (B12 - A12 * m) / A22 
disp(" ")
xx = linspace(-6,6,100);
tt = m.*xx + n;
plot(xx,tt,x,y,"ro")
pause()

%%Üçüncü Adým:
%Parabol için gerekli aralýk ve denklem yazýlarak noktalar ve çizgiler istenilen þekilde yazdýrýlýr.
x_ara = -6:6;
parabol = x_ara.^2+x_ara.*4-24;


%%Dördüncü Adým:
%Zoom yaparak bulunan kesiþim noktalarý
disp("Zoom yaparak bulunan kesiþim noktalarý")
zoom_x1=-5.0272;
zoom_x2=5.1134;

%Zoom yaparak bulunan ya da bulunan kökleri denklemlerde yerine yazarak iþlemler bitirilir.
z_ykok1 = m.*zoom_x1 + n; %1.Kökün doðrudaki y deðeri
z_ykok2 = m.*zoom_x2 + n; %2.Kökün doðrudaki y deðeri
z_y_kok1 = zoom_x1^2+zoom_x1*4-24; %1.Kökün paraboldeki y deðeri
z_y_kok2 = zoom_x2^2+zoom_x2*4-24; %2.Kökün paraboldeki y deðeri
z_fark1 = abs(z_ykok1-z_y_kok1);%mutlak deðerlerin farklarý 1. kök için
z_fark2 = abs(z_ykok2-z_y_kok2);%mutlak deðerlerin farklarý 2. kök için
fprintf("Doðru Üzerindeki Birinci Nokta: %g, %g \n",zoom_x1,z_ykok1);
fprintf("Parabol Üzerindeki Birinci Nokta: %g, %g \n",zoom_x1,z_y_kok1);
fprintf("Doðru Üzerindeki Ýkinci Nokta: %g, %g \n",zoom_x2,z_ykok2);
fprintf("Parabol Üzerindeki Ýkinci Nokta: %g, %g \n",zoom_x2,z_y_kok2);
fprintf("Birinci Noktalar Arasýndaki Fark: %g\n",z_fark1);
fprintf("Ýkinci Noktalar Arasýndaki Fark: %g\n",z_fark2);
disp(" ")

%% EN KÜÇÜK KARELER YÖNTEMÝ ÝÇÝN BONUS
%Kýsaca denklemin köklerini bulan bir program yardýmýyla kesiþen noktalar belirlenir.
kesim = x_ara.^2+x_ara.*(4-m)-(24+n);
A= 1;
B= 4-m;
C= -24-n;
%Delta yöntemi ile basit bir program yazýlýp denklemin kökleri bulunur.
disp("Delta yöntemi ile bulunan kesiþim noktalarý")
delta=B^2-4*A*C;
if delta > 0
    x1=(-B-sqrt(delta))/(2*A);
    x2=(-B+sqrt(delta))/(2*A);
endif
%Burada tercih ettiðimiz noktalar kesin olarak bulunan kök noktalarý oldu.
%Köklerin y deðerlerini hesaplama:
ykok1 = m.*x1 + n; %1.Kökün doðrudaki y deðeri
ykok2 = m.*x2 + n; %2.Kökün doðrudaki y deðeri
y_kok1 = x1^2+x1*4-24; %1.Kökün paraboldeki y deðeri
y_kok2 = x2^2+x2*4-24; %2.Kökün paraboldeki y deðeri
fark1 = abs(ykok1-y_kok1);%mutlak deðerlerin farklarý 1. kök için
fark2 = abs(ykok2-y_kok2);%mutlak deðerlerin farklarý 2. kök için
fprintf("Doðru Üzerindeki Birinci Nokta: %g, %g \n",x1,ykok1);
fprintf("Parabol Üzerindeki Birinci Nokta: %g, %g \n",x1,y_kok1);
fprintf("Doðru Üzerindeki Ýkinci Nokta: %g, %g \n",x2,ykok2);
fprintf("Parabol Üzerindeki Ýkinci Nokta: %g, %g \n",x2,y_kok2);
fprintf("Birinci Noktalar Arasýndaki Fark: %g\n",fark1);
fprintf("Ýkinci Noktalar Arasýndaki Fark: %g\n",fark2);
disp(" ")
plot(xx,tt,"r-",x,y,"mx",x_ara,parabol,"b-o")
pause()




% MONTE CARLO YÖNTEMÝ ÝLE ÝNTEGRAL HESABI
disp("MONTE CARLO YÖNTEMÝ ÝLE ÝNTEGRAL HESABI")
k1 = [(-5.0299), (-5.0299), (5.1233), (5.1233),(-5.0299)];
k2 = [(-29), (25), (25), (-29), (-29) ];

%% DÝKDÖRTGEN ÝÇÝN BONUS KESÝM
%kesim = x^2+x*(4-m)-(24+n);
%integral içi: mx+n - (x^2+4*x-24) = -x^2+(m-4)*x+24+n
%integral : -x^3/3+x^2*((m-4)/2)+((24+n)*x)
% x1=5.12326, x2=-5.02985 kesimin köklerinden bulunmuþtu
int_ust = (-x2^3)/3+x2^2*((m-4)/2)+((24+n)*x2);
int_alt = (-x1^3)/3+x1^2*((m-4)/2)+((24+n)*x1);
int_alan = int_ust - int_alt;

disp(" ")


%%% ULTRA BONUS
rand("seed",219)
N = 20000;
%Matris tanýmlandý
matrix(:,1) = (rand([N,1])-0.5)*12;
matrix(:,2) = (-30) + rand([N,1])*56.330;
matrix(:,3) = matrix(:,1).*m+n; %Doðru üzerindeki yd deðerleri
matrix(:,4) = matrix(:,1).^2+ matrix(:,1).*4-24; %Parabol üzerindeki yp deðerleri

%Yamuðun dýþýna düþenler
f1 = matrix(:,2)-matrix(:,3)>0;
hs1 = [1:N](f1);
bir = matrix(hs1,:);

%Yamuðun altýna düþenler
iki_uc = matrix([1:N](not(f1)),:);
n2=rows(iki_uc);

%Bizden istenen bölgeye düþenler
f2 = iki_uc(:,2)- iki_uc(:,4)>0;
uc = iki_uc([1:N](f2),:);

%Yamukta parabol altýna düþenler
iki = iki_uc([1:N](not(f2)),:);

%Ýstenen bölgedeki nokta sayýsý
nokta = rows(uc);
%Yamuðun içindeki nokta sayýsý
nokta2 = rows(iki_uc);
%Yamuðun alaný 
y_alan = ((7.2088+56.330)/2)*12; % yamuðun alaný=381.23 
Alan = (nokta*y_alan)/nokta2;

disp("Ultra bonus:")
disp("Yamuk Ýçin")
fprintf("Ara Bölgedeki Nokta Sayýsý : %g\n",nokta);
fprintf("Ara Bölgenin Alaný : %g\n",Alan);
disp(" ")
plot(xx,tt,"r-",x_ara,parabol,"b-",uc(:,1),uc(:,2),".b",iki(:,1),iki(:,2),".r")
pause()




% DÝKDÖRTGENDE MONTE CARLO
disp("Dikdörtgende Monte Carlo")
rand("seed",219)
N = 10000;
plot(xx,tt,"r-",x_ara,parabol,"b-",k1,k2,"g-") %dikdörtgen çizimi
pause()
%Matris tanýmlandý
matris(:,1) = (rand([N,1])-0.4955)*10.153;
matris(:,2) = (-29) + rand([N,1])*54;
matris(:,3) = matris(:,1).*m+n; %Doðru üzerindeki yd deðerleri
matris(:,4) = matris(:,1).^2+ matris(:,1).*4-24; %Parabol üzerindeki yp deðerleri

%Üçüncü Bölgedekiler
hangileri1 = matris(:,3) - matris(:,2)>0 & matris(:,4) - matris(:,2)<0;
ici = matris([1:N](hangileri1),:);

%Birinci ve Ýkinci Bölgedekiler
dis = matris([1:N](not(hangileri1)),:);
toplam = [ici;dis];


%Nokta sayýlarý
n = rows(ici);
fprintf("Üçüncü Bölgedeki Nokta Sayýsý : %g\n",n);
n1 = rows(dis);
fprintf("1. ve 2. Bölgelerdeki Nokta Sayýlarý : %g\n",n1);
n3 = rows(toplam);
fprintf("Toplam Nokta Sayýsý : %g\n",n3);


%Dikdörtgenin alaný 
d_alan = 548.27;
%Toplam nokta sayýsý = N
alan = (n*d_alan)/N;
fprintf("Monte Carlo ile Bulunan Üçüncü Bölgenin Alaný : %g\n",alan);
disp(" ")
disp("Bonus: ")
disp("Dikdörtgen Ýçin")
fprintf("Analitik Olarak Bulunan Üçüncü Bölgenin Alaný : %g\n",int_alan);

plot(xx,tt,"r-",x_ara,parabol,"b-",k1,k2,"g-",ici(:,1),ici(:,2),".b",dis(:,1),dis(:,2),".r")
pause()

%%% ----------- HACETTEPE ÜNÝVERSÝTESÝ ----------- %%%
% FÝZ219 - Bilgisayar Programlama dersi 2020-2021 Güz Dönemi Ýkinci Ödev Çözümü
% DÝRAC GRUBU : METEHAN ÇELEBÝ, ÖZLEM EKÝCÝ, DENÝZ KAHYA
% Kaynaklar : FIZ219 Ders Notlarý - Emre S. Taþçý