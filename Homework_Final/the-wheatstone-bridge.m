%%% ----------- HACETTEPE ÜNÝVERSÝTESÝ ----------- %%%
% FÝZ219 - Bilgisayar Programlama dersi 2020-2021 Güz Dönemi Final Ödev Çözümü
% DÝRAC GRUBU : METEHAN ÇELEBÝ, ÖZLEM EKÝCÝ, DENÝZ KAHYA

% Program uzun süreli bir iþlem yaptýðý için biraz yavaþ çalýþmaktadýr.
% Lütfen programý çalýþtýrdýktan sonra 15-20 sn bekleyiniz.
% Diðer grafiðe geçmek için enter kullanýnýz.


rand("seed",219)

disp("Deneysel Ayarlamalar")
R1 = randi([10 30])
R2 = randi ([0 50]) %Reosta  
R3 = randi([10 30])
Rx = randi([10 30]) %Bilinmeyen direnç
Vs = 30 
VG = ((R2/(R1+R2))-(Rx/(R3+Rx)))*Vs;
fprintf("Galvanometrede Okunan Deðer : %g\n" ,VG) 
disp("")

%Fonksiyonlaþtýralým
disp("VG(R1,R2,R3,Rx,Vs) Fonksiyonu : ")
function f=VG(R1,R2,R3,Rx,Vs)
  f=((R2/(R1+R2))-(Rx/(R3+Rx)))*Vs;
endfunction
vg = VG(23,10,13,20,19);
fprintf("VG(23,10,13,20,19): %g\n" ,vg);
disp("")
 
%Reosta ile oynayarak VG deðerini sýfýr yapmaya çalýþalým
%Kök söktürücüde yaptýðýmýz gibi;
x0 = 0;
adim_boyu = 1E-5; 
a = ((x0/(x0+R1))-(Rx/(R3+Rx)))*Vs;
for i=1:5000000
    x1 = x0 + adim_boyu;
    b = ((x1/(x1+R1))-(Rx/(R3+Rx)))*Vs;
    if((a/b) < 0)
        kok = (x0 + x1) /2;
        VG = ((kok/(kok+R1))-(Rx/(R3+Rx)))*Vs;
        fprintf("R2: %g\nVG: %g\n" ,kok,VG);
        break;
    endif
    x0 = x1;
    a = b;
endfor
R2 = kok; %Bulduðumuz kökü R2 olarak atadýk
disp("")

%%Saðlamasý
disp("Saðlamasý")
%VG=0 olmasý durumunda R2=(Rx*R1)/R3 olur.
A = (Rx*R1)/R3;
B = ((A/(A+R1))-(Rx/(R3+Rx)))*Vs;
fprintf("R2: %g\nVG: %g\n" ,A,B);
disp("")

disp("Akýmlarýn ve Rx Direncinin Bulunmasý")
%I3 akýmýnýn bulunmasý
i1 = Vs / (R1+R2);
fprintf("I1 akýmý : %g\n" ,i1);
i3 = (i1*R1) / R3;
fprintf("I3 akýmý : %g\n" ,i3);
%Deneysel olarak elde edilen Rx deðerinin bulunmasý
Rx_= (i1*R2) / i3; 
fprintf("Rx : %g\n" ,Rx_);
fprintf("Baþlangýçta bulunan Rx : %g\n" ,Rx);
disp("")
%Deneysel olarak elde edilen Rx deðeri ve belirlenen gerçek Rx deðerinin karþýlaþtýrýlmasý
Hata=((abs(Rx-Rx_))/Rx)*100;
fprintf("Bulunan Rx deðerinin doðruluðu(yüzde) : %g\n" ,Hata);
disp("")

%Reosta 10'dan 30'a deðiþtirilirken
disp("R2 = 10-30 Ohm iken VG Grafiði")
R2 = linspace(10,30,100); 
VG = ((R2./(R2.+R1))-(Rx/(R3+Rx)))*Vs;
plot(R2,VG) 
xlabel ("R2");
ylabel ("VG");
title("R2 - VG Grafiði")
pause
disp("")

%%Bonus
disp("R1 ve R2 Reostalý Devrede VG Grafiði")
R1 = R2 =  linspace(10,50,100);
[r1,r2] = meshgrid(R1,R2); %R1 ve R2 deðerlerini harmanladýk
VG = ((r2./(r1.+(r2.*1)))-(Rx/(R3+Rx)))*Vs;
mesh(R1,R2,VG)
xlabel ("R1");
ylabel ("R2");
zlabel ("VG");
title ("R1 - R2 - VG Grafiði");

%%% ----------- HACETTEPE ÜNÝVERSÝTESÝ ----------- %%%
% FÝZ219 - Bilgisayar Programlama dersi 2020-2021 Güz Dönemi Final Ödev Çözümü
% DÝRAC GRUBU : METEHAN ÇELEBÝ, ÖZLEM EKÝCÝ, DENÝZ KAHYA
% Kaynaklar : FIZ219 Ders Notlarý - Emre S. Taþçý
