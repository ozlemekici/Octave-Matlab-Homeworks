
%%% ----------- HACETTEPE �N�VERS�TES� ----------- %%%
% F�Z219 - Bilgisayar Programlama dersi 2020-2021 G�z D�nemi Birinci �dev ��z�m�
% D�RAC GRUBU : METEHAN �ELEB�, �ZLEM EK�C�, DEN�Z KAHYA
% �devin amac�: 1 ile 300 aras�ndaki asal say�lar� bulan bir program yazmak


asal_sayilar = []; % asallar� toplayaca��m�z k�me

for i=2:300
  pbs=0; % pozitif b�len say�s� i�in ba�lang�� de�eri
  
  % i'nin pozitif b�len say�s� bulunur
  for j=1:i 
    if mod(i,j) == 0
      pbs = pbs+1;
    endif 
  endfor
  % Asal olup olmad���n� kontrol etme mekanizmas�
  if pbs == 2    
    asal_sayilar = [asal_sayilar i];
  endif
endfor
asal_sayilar



%%% ----------- HACETTEPE �N�VERS�TES� ----------- %%%
% F�Z219 - Bilgisayar Programlama dersi 2020-2021 G�z D�nemi Birinci �dev ��z�m�
% D�RAC GRUBU : METEHAN �ELEB�, �ZLEM EK�C�, DEN�Z KAHYA
% Kaynaklar : FIZ219 Ders Notlar� - Emre S. Ta���