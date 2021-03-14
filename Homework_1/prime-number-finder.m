
%%% ----------- HACETTEPE ÜNÝVERSÝTESÝ ----------- %%%
% FÝZ219 - Bilgisayar Programlama dersi 2020-2021 Güz Dönemi Birinci Ödev Çözümü
% DÝRAC GRUBU : METEHAN ÇELEBÝ, ÖZLEM EKÝCÝ, DENÝZ KAHYA
% Ödevin amacý: 1 ile 300 arasýndaki asal sayýlarý bulan bir program yazmak


asal_sayilar = []; % asallarý toplayacaðýmýz küme

for i=2:300
  pbs=0; % pozitif bölen sayýsý için baþlangýç deðeri
  
  % i'nin pozitif bölen sayýsý bulunur
  for j=1:i 
    if mod(i,j) == 0
      pbs = pbs+1;
    endif 
  endfor
  % Asal olup olmadýðýný kontrol etme mekanizmasý
  if pbs == 2    
    asal_sayilar = [asal_sayilar i];
  endif
endfor
asal_sayilar



%%% ----------- HACETTEPE ÜNÝVERSÝTESÝ ----------- %%%
% FÝZ219 - Bilgisayar Programlama dersi 2020-2021 Güz Dönemi Birinci Ödev Çözümü
% DÝRAC GRUBU : METEHAN ÇELEBÝ, ÖZLEM EKÝCÝ, DENÝZ KAHYA
% Kaynaklar : FIZ219 Ders Notlarý - Emre S. Taþçý