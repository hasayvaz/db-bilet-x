---------------------------------------------------------------------------------------------------------
-- 1
---------------------------------------------------------------------------------------------------------
-- il 'adana', ilce 'merkez'in, tüm salon ve koltuk adlarını göster (joinsiz)
select s.salon_ad, k.koltuk_ad from SALON s, KOLTUK k
where s.salon_id = k.salon_id and ililce_id IN (
	select ililce_id from ILILCE
	where il = 'adana' and ilce = 'merkez'
);

-- il 'adana', ilce 'merkez'in, tüm salon ve koltuk adlarını göster (joinli)
select s.salon_ad, k.koltuk_ad 
from SALON s, KOLTUK k, ILILCE i
where 
	s.salon_id = k.salon_id and
	s.ililce_id = i.ililce_id and
	i.il = 'adana' and
	i.ilce = 'merkez';
---------------------------------------------------------------------------------------------------------
-- 2
---------------------------------------------------------------------------------------------------------
-- il 'adana', ilce 'merkez', kategori türü 'sinema' olan etkinliklerin
-- adları, filmin başlangıç/bitiş tarihleri (joinli)
select etkinlik_ad, etkinlik_ilk_tarih, etkinlik_son_tarih, etkinlik_saat from ETKINLIK
where etkinlik_id IN (
	select etkinlik_id from YER
	where ililce_id IN (
		select ililce_id from ILILCE
		where il = 'adana' and ilce = 'merkez'
	)
) and kategori_id = (
	select kategori_id from KATEGORI
	where kategori_ad = 'sinema'
);

-- il 'adana', ilce 'merkez', kategori türü 'sinema' olan etkinliklerin
-- adları, filmin başlangıç/bitiş tarihleri (joinli)
select etkinlik_ad, etkinlik_ilk_tarih, etkinlik_son_tarih, etkinlik_saat 
from ETKINLIK e, ILILCE i, KATEGORI ka, YER y
where e.etkinlik_id = y.etkinlik_id and
	i.ililce_id = y.ililce_id and    
	ka.kategori_id = e.kategori_id and
	kategori_ad = 'sinema' and
	i.il = 'adana' and 
	i.ilce = 'merkez';
---------------------------------------------------------------------------------------------------------
-- 3
---------------------------------------------------------------------------------------------------------
-- member_id 8060331 olan, kişinin rezerve ettiği,yerler hakkında bilgiler
select extract(year from rezerve_tarih) as yil,
       extract(month from rezerve_tarih) as ay,
       extract(day from rezerve_tarih) as gun,
       m.member_name, m.member_surname,
       i.il, i.ilce, ka.kategori_ad, e.etkinlik_ad, s.salon_ad, k.koltuk_ad, u.ucret_ad, u.ucret_fiyat 
from REZERVE r, ILILCE i, SALON s, KOLTUK k, KATEGORI ka, ETKINLIK e,UCRET u, MEMBER m
where 
	ka.kategori_id = e.kategori_id and
	i.ililce_id = s.ililce_id and
	s.salon_id = r.salon_id and
	k.koltuk_id = r.koltuk_id and
	e.etkinlik_id = r.etkinlik_id and
	m.member_id = r.member_id and
	r.ucret_id = u.ucret_id and
	r.member_id = 8060331;
---------------------------------------------------------------------------------------------------------
-- 4
---------------------------------------------------------------------------------------------------------
-- sinema'daki etkinlik adı 'incredible hulk', olan etkinliği rezerve edenlerden
-- il 'adana'da, ilce 'merkez'den kazandığımız para (joinsiz)
select sum(u.ucret_fiyat) as sinema_incredible_hulk_adana_merkez_toplam_para from REZERVE r, UCRET u
where r.ucret_id = u.ucret_id and r.yer_id IN (
	select yer_id from YER
	where etkinlik_id IN (
		select etkinlik_id from ETKINLIK
		where kategori_id = (
			select kategori_id from KATEGORI
			where kategori_ad = 'sinema'
		) and etkinlik_ad = 'incredible hulk' 
	) and ililce_id IN (
		select ililce_id from ILILCE
		where il = 'adana' and ilce = 'merkez'
	)
);
-- sinema'daki etkinlik adı 'incredible hulk', olan etkinliği rezerve edenlerden
-- il 'adana'da, ilce 'merkez'den kazandığımız para (joinli)
select sum(u.ucret_fiyat) as sinema_incredible_hulk_adana_merkez_toplam_para 
from REZERVE r, UCRET u, YER y, KATEGORI ka, ILILCE i, ETKINLIK e
where r.ucret_id = u.ucret_id and
	r.yer_id = y.yer_id and 
	e.etkinlik_id = y.yer_id and
	ka.kategori_id = e.kategori_id and
	y.ililce_id = i.ililce_id and
	ka.kategori_ad = 'sinema' and
	i.il = 'adana' and
	i.ilce = 'merkez' and
	e.etkinlik_ad = 'incredible hulk';
---------------------------------------------------------------------------------------------------------
-- 5
---------------------------------------------------------------------------------------------------------
-- il 'adana', ilce 'merkez'de kategori türü 'sinema', etkinlik_adı 'incredible hulk', olan filmin 
-- salon 'A001',de tarih 13.10.2010'da, rezerve edilmeyen koltukları göster
 select koltuk_ad as sinema_adana_merkez_a001_13_10_2010 from KOLTUK
 where not koltuk_id IN (
	select koltuk_id from REZERVE
	where etkinlik_id IN (
		select etkinlik_id from ETKINLIK
		where kategori_id = (
			select kategori_id from KATEGORI
			where kategori_ad = 'sinema'
		) and etkinlik_ad = 'incredible hulk' 
	) and yer_id IN (
		select yer_id from YER
		where ililce_id IN (
			select ililce_id from ILILCE
			where il = 'adana' and ilce = 'merkez'
		)
	)
	and extract(year from rezerve_tarih) = "2010"
	and extract(month from rezerve_tarih) = "10" 
	and extract(day from rezerve_tarih) = "13"
) and salon_id IN (
	select salon_id from SALON
	where salon_ad = 'A001'
);
---------------------------------------------------------------------------------------------------------
-- 6
---------------------------------------------------------------------------------------------------------
-- sinema'daki etkinlik adı 'incredible hulk'
-- olan tüm illerde etkinliği rezerve edenlerin sayısı (joinsiz)
select count(*) as sinema_incredible_hulk_toplam_rezerve_sayisi from REZERVE
where yer_id IN (
	select yer_id from YER
	where etkinlik_id IN (
		select etkinlik_id from ETKINLIK
		where kategori_id = (
			select kategori_id from KATEGORI
			where kategori_ad = 'sinema'
		) and etkinlik_ad = 'incredible hulk' 
	)
)and extract(year from rezerve_tarih) = "2010" 
 and extract(month from rezerve_tarih) = "10"
 and extract(day from rezerve_tarih) = "13";

-- sinema'daki etkinlik adı 'incredible hulk'
-- olan tüm illerde etkinliği rezerve edenlerin sayısı (joinli)
select count(*) as sinema_incredible_hulk_2010_10_13_toplam_rezerve_sayisi 
from REZERVE r, YER y, ETKINLIK e, KATEGORI ka
where r.yer_id = y.yer_id and
	y.etkinlik_id = e.etkinlik_id and
	ka.kategori_id = e.kategori_id and
	extract(year from rezerve_tarih) = "2010" and
	extract(month from rezerve_tarih) = "10" and
	extract(day from rezerve_tarih) = "13" and
	e.etkinlik_ad = 'incredible hulk' and
	ka.kategori_ad = 'sinema';
---------------------------------------------------------------------------------------------------------
-- 7
---------------------------------------------------------------------------------------------------------
-- verilen tarih '2010-10-24' ve il 'adana', ilce 'merkez'deki
-- etkinlik adı, etkinlik tarihleri, etkinlik saatleri ve salon bilgileri, salon kapasite'leri göster
select e.etkinlik_ad, e.etkinlik_ilk_tarih, e.etkinlik_son_tarih, e.etkinlik_saat, s.salon_ad, s.salon_kapasite
from ETKINLIK e, ILILCE i, YER y, SALON s
where
	s.ililce_id = i.ililce_id and 
	y.ililce_id = i.ililce_id and
	e.etkinlik_id = y.etkinlik_id and 
	e.etkinlik_ilk_tarih <= "2010-10-24" and "2010-10-24" <= e.etkinlik_son_tarih and
	i.il = 'adana' and
	i.ilce = 'merkez';
---------------------------------------------------------------------------------------------------------
-- 8
---------------------------------------------------------------------------------------------------------
-- verilen kategori_ad'ına göre girilen etkinlikleri,
-- tüm illerde etkinliği rezerve edenlerin sayısı
select r.etkinlik_id, e.etkinlik_ad, count(rezerve_id) as sayi
from REZERVE r, ETKINLIK e, KATEGORI ka
where
	ka.kategori_id = e.kategori_id and
	e.etkinlik_id = r.etkinlik_id and 
	ka.kategori_ad = 'sinema'
group by etkinlik_id
order by etkinlik_id;
---------------------------------------------------------------------------------------------------------
-- 9
---------------------------------------------------------------------------------------------------------
-- sinema, incredible_hulk etkinligine gidenlerin,
-- verdiği ücret türlerinin sayısı
select u.ucret_id, u.ucret_ad, count(rezerve_id) as sayi
from REZERVE r, ETKINLIK e, KATEGORI ka, UCRET u
where
	r.ucret_id = u.ucret_id and
	ka.kategori_id = e.kategori_id and
	e.etkinlik_id = r.etkinlik_id and 
	ka.kategori_ad = 'sinema' and
	e.etkinlik_ad = 'incredible hulk'
group by ucret_id
order by ucret_id;
---------------------------------------------------------------------------------------------------------
-- 10
---------------------------------------------------------------------------------------------------------
-- il 'adiyaman', ilce 'merkez', etkinlik adı 'incredible hulk' olan
-- etkinliklere dışarıdan gelen üyelerin bilgileri
select  member_name, member_surname, member_telephone
from ETKINLIK e, YER y, ILILCE i, MEMBER m
where 
	e.etkinlik_id = y.etkinlik_id and
	y.ililce_id = i.ililce_id and
	m.ililce_id != i.ililce_id and
	i.il='adiyaman' and
	i.ilce = 'merkez' and
	e.etkinlik_ad = 'incredible hulk';
