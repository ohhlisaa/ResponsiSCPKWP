%penyelesaian kasus menggunakan metode WP
clc;clear; %untuk membersihkan jendela command windows

opts = detectImportOptions('Real estate valuation data set.xlsx');
%mendeteksi file dataset Real estate valuation data set.xlsx
opts.SelectedVariableNames = (3:8);
%mengambil variabel pada kolom 3 sampai 8 di DATA RUMAH.xlsx
data = readmatrix('Real estate valuation data set.xlsx', opts);
%menempatkan data dari excel ke variabel data
x = data(1:50,[1 2 3 6])
%megambil 50 baris data pada kolom house age, distance to the nearest MRT station, number of convenience stores, house price of unit area

k = [1,0,1,0];
%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan 0= atribut biaya
w = [3,5,4,1];
%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3=cukup, 4= tinggi, 5= sangat tinggi)

%tahapan pertama, perbaikan bobot
[m n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n
if k(j)==0, w(j)=-1*w(j);
end
end
for i=1:m
S(i)=prod(x(i,:).^w);
end

%tahapan ketiga, proses perangkingan
V= S/sum(S)
Descend=sort(V,'descend')
Skor_Tertinggi = max(V) 