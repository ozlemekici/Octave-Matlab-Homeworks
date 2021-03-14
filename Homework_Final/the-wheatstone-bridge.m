%%% ----------- HACETTEPE �N�VERS�TES� ----------- %%%
% F�Z219 - Bilgisayar Programlama dersi 2020-2021 G�z D�nemi Final �dev ��z�m�
% D�RAC GRUBU : METEHAN �ELEB�, �ZLEM EK�C�, DEN�Z KAHYA

% Program uzun s�reli bir i�lem yapt��� i�in biraz yava� �al��maktad�r.
% L�tfen program� �al��t�rd�ktan sonra 15-20 sn bekleyiniz.
% Di�er grafi�e ge�mek i�in enter kullan�n�z.


rand("seed",219)

disp("Deneysel Ayarlamalar")
R1 = randi([10 30])
R2 = randi ([0 50]) %Reosta  
R3 = randi([10 30])
Rx = randi([10 30]) %Bilinmeyen diren�
Vs = 30 
VG = ((R2/(R1+R2))-(Rx/(R3+Rx)))*Vs;
fprintf("Galvanometrede Okunan De�er : %g\n" ,VG) 
disp("")

%Fonksiyonla�t�ral�m
disp("VG(R1,R2,R3,Rx,Vs) Fonksiyonu : ")
function f=VG(R1,R2,R3,Rx,Vs)
  f=((R2/(R1+R2))-(Rx/(R3+Rx)))*Vs;
endfunction
vg = VG(23,10,13,20,19);
fprintf("VG(23,10,13,20,19): %g\n" ,vg);
disp("")
 
%Reosta ile oynayarak VG de�erini s�f�r yapmaya �al��al�m
%K�k s�kt�r�c�de yapt���m�z gibi;
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
R2 = kok; %Buldu�umuz k�k� R2 olarak atad�k
disp("")

%%Sa�lamas�
disp("Sa�lamas�")
%VG=0 olmas� durumunda R2=(Rx*R1)/R3 olur.
A = (Rx*R1)/R3;
B = ((A/(A+R1))-(Rx/(R3+Rx)))*Vs;
fprintf("R2: %g\nVG: %g\n" ,A,B);
disp("")

disp("Ak�mlar�n ve Rx Direncinin Bulunmas�")
%I3 ak�m�n�n bulunmas�
i1 = Vs / (R1+R2);
fprintf("I1 ak�m� : %g\n" ,i1);
i3 = (i1*R1) / R3;
fprintf("I3 ak�m� : %g\n" ,i3);
%Deneysel olarak elde edilen Rx de�erinin bulunmas�
Rx_= (i1*R2) / i3; 
fprintf("Rx : %g\n" ,Rx_);
fprintf("Ba�lang��ta bulunan Rx : %g\n" ,Rx);
disp("")
%Deneysel olarak elde edilen Rx de�eri ve belirlenen ger�ek Rx de�erinin kar��la�t�r�lmas�
Hata=((abs(Rx-Rx_))/Rx)*100;
fprintf("Bulunan Rx de�erinin do�rulu�u(y�zde) : %g\n" ,Hata);
disp("")

%Reosta 10'dan 30'a de�i�tirilirken
disp("R2 = 10-30 Ohm iken VG Grafi�i")
R2 = linspace(10,30,100); 
VG = ((R2./(R2.+R1))-(Rx/(R3+Rx)))*Vs;
plot(R2,VG) 
xlabel ("R2");
ylabel ("VG");
title("R2 - VG Grafi�i")
pause
disp("")

%%Bonus
disp("R1 ve R2 Reostal� Devrede VG Grafi�i")
R1 = R2 =  linspace(10,50,100);
[r1,r2] = meshgrid(R1,R2); %R1 ve R2 de�erlerini harmanlad�k
VG = ((r2./(r1.+(r2.*1)))-(Rx/(R3+Rx)))*Vs;
mesh(R1,R2,VG)
xlabel ("R1");
ylabel ("R2");
zlabel ("VG");
title ("R1 - R2 - VG Grafi�i");

%%% ----------- HACETTEPE �N�VERS�TES� ----------- %%%
% F�Z219 - Bilgisayar Programlama dersi 2020-2021 G�z D�nemi Final �dev ��z�m�
% D�RAC GRUBU : METEHAN �ELEB�, �ZLEM EK�C�, DEN�Z KAHYA
% Kaynaklar : FIZ219 Ders Notlar� - Emre S. Ta���
