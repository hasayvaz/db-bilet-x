-- ------------------------------------
--    BILET-X_vX-sorgu
-- ------------------------------------
-- ©  Copyright 2010 designed by gdemir
-- http://gdemir.me                   
-- Tüm hakkları mahfuzdur
-- ------------------------------------
--
-- sorgu
--
-- user_id=8060331 olan kişinin rezerve sayısı 
select count(*) from REZERVE
where member_id = 8060331;

-- il='adana' olan üyelerin bütün bilgileri 
select * from MEMBER
where ililce_id in (
	select ililce_id from ILILCE
	where il = 'adana'
);

-- il='adana' ve ilce='kozan' olan üyelerin tüm bilgileri 
select * from MEMBER
where ililce_id = (
	select ililce_id from ILILCE
	where il = 'adana' and ilce = 'kozan'
);

-- il='adana' olan etkinliklerinin adları
select etkinlik_ad from ETKINLIK
where etkinlik_id in (
	select etkinlik_id from YER
	where ililce_id in (
		select ililce_id from ILILCE
		where il = 'adana'
	)
);

-- il='adana' ilce='merkez' olan etkinliklerinin adları
select etkinlik_ad from ETKINLIK
where etkinlik_id in (
	select etkinlik_id from YER
	where ililce_id in (
		select ililce_id from ILILCE
		where il = 'adana' and ilce = 'merkez'
	)
);

-- il='adana' kategori='sinema' olan etkinliklerin
-- adları, filmin giriş/bitiş tarihleri
select etkinlik_ad, etkinlik_ilk, etkinlik_son, etkinlik_saat from ETKINLIK
where etkinlik_id in (
	select etkinlik_id from YER
	where ililce_id in (
		select ililce_id from ILILCE
		where il = 'adana'
	)
) and kategori_id = (
	select kategori_id from KATEGORI
	where kategori_ad = 'sinema'
);

-- il='adiyaman' ilce='merkez' kategori='tiyatro' olan etkinliklerin
-- adları, filmin giriş/bitiş tarihleri
select etkinlik_ad, etkinlik_ilk, etkinlik_son, etkinlik_saat from ETKINLIK
where etkinlik_id in (
	select etkinlik_id from YER
	where ililce_id in (
		select ililce_id from ILILCE
		where il = 'adiyaman' and ilce = 'merkez'
	)
) and kategori_id = (
	select kategori_id from KATEGORI
	where kategori_ad = 'tiyatro'
);

-- user_id=8060331 olan kişinin rezerve ettiği, koltuk adları
select koltuk_ad as 8060331_rezerve_koltuk_adlari from KOLTUK
where koltuk_id in (
	select koltuk_id from REZERVE
	where member_id = 8060331
);

-- member_id=8060331 olan kişinin rezerve ettiği etkinliklerin
-- adları, filmin giriş/bitiş tarihleri
select etkinlik_ad, etkinlik_ilk, etkinlik_son, etkinlik_saat from ETKINLIK
where etkinlik_id in (
	select etkinlik_id from REZERVE
	where member_id = 8060331
);

-- sinema'daki etkinlik adı='incredible hulk'
-- olan etkinliği rezerve edenlerin sayısı
select count(*) as sinema_incredible_hulk_toplam_rezerve_sayisi from REZERVE
where yer_id in (
	select yer_id from YER
	where etkinlik_id in (
		select etkinlik_id from ETKINLIK
		where kategori_id = (
			select kategori_id from KATEGORI
			where kategori_ad = 'sinema'
		) and etkinlik_ad = 'incredible hulk' 
	)
);

-- sinema'da rezerve edenlerden kazandığımız para
select sum(u.ucret_fiyat) as sinema_toplam_para from REZERVE r, UCRET u
where r.ucret_id = u.ucret_id and r.yer_id in (
	select yer_id from YER
	where etkinlik_id in (
		select etkinlik_id from ETKINLIK
		where kategori_id = (
			select kategori_id from KATEGORI
			where kategori_ad = 'sinema'
		)
	)
);

-- sinema'daki etkinlik adı='ironman 2'
-- olan etkinliği rezerve edenlerden kazandığımız para
select sum(u.ucret_fiyat) as sinema_iron_man_toplam_para from REZERVE r, UCRET u
where r.ucret_id = u.ucret_id and r.yer_id in (
	select yer_id from YER
	where etkinlik_id in (
		select etkinlik_id from ETKINLIK
		where kategori_id = (
			select kategori_id from KATEGORI
			where kategori_ad = 'sinema'
		) and etkinlik_ad = 'ironman 2' 
	)
);

-- sinema'daki etkinlik adı='incredible hulk'
-- olan etkinliği rezerve edenlerden kazandığımız para
select sum(u.ucret_fiyat) as sinema_incredible_hulk_toplam_para from REZERVE r, UCRET u
where r.ucret_id = u.ucret_id and r.yer_id in (
	select yer_id from YER
	where etkinlik_id in (
		select etkinlik_id from ETKINLIK
		where kategori_id = (
			select kategori_id from KATEGORI
			where kategori_ad = 'sinema'
		) and etkinlik_ad = 'incredible hulk' 
	)
);

-- sinema'daki etkinlik adı='incredible hulk'
-- olan etkinliği rezerve edenlerden il='adiyaman'da kazandığımız para
select sum(u.ucret_fiyat) sinema_incredible_hulk_adiyaman_toplam_para from REZERVE r, UCRET u
where r.ucret_id = u.ucret_id and r.yer_id in (
	select yer_id from YER
	where etkinlik_id in (
		select etkinlik_id from ETKINLIK
		where kategori_id = (
			select kategori_id from KATEGORI
			where kategori_ad = 'sinema'
		) and etkinlik_ad = 'incredible hulk' 
	) and ililce_id in (
		select ililce_id from ILILCE
		where il = 'adiyaman'
	)
);

-- sinema'daki etkinlik adı='incredible hulk'
-- olan etkinliği rezerve edenlerden il='adana'da kazandığımız para
select sum(u.ucret_fiyat) as sinema_incredible_hulk_adana_toplam_para from REZERVE r, UCRET u
where r.ucret_id = u.ucret_id and r.yer_id in (
	select yer_id from YER
	where etkinlik_id in (
		select etkinlik_id from ETKINLIK
		where kategori_id = (
			select kategori_id from KATEGORI
			where kategori_ad = 'sinema'
		) and etkinlik_ad = 'incredible hulk' 
	) and ililce_id in (
		select ililce_id from ILILCE
		where il = 'adana'
	)
);

-- il='adana' ilce='merkez'de kategori='sinema' etkinlik_adı='incredible hulk' olan filmin 
-- salon='A001' de tarih=13.10.2010' da rezerve edilen koltukları göster
-- olan etkinliği rezerve edenlerin sayısını göster
select koltuk_ad as sinema_incredible_hulk_adana_merkez_A001_13_10_2010_rezerve_koltuk_adlari from KOLTUK
where koltuk_id in (
	select koltuk_id from REZERVE
	where yer_id in (
		select yer_id from YER
		where etkinlik_id in (
			select etkinlik_id from ETKINLIK
			where kategori_id = (
				select kategori_id from KATEGORI
				where kategori_ad = 'sinema'
			) and etkinlik_ad = 'incredible hulk' 
		) and ililce_id in (
			select ililce_id from ILILCE
			where il = 'adana' and ilce = 'merkez'
		) and salon_id in (
			select salon_id from SALON
			where salon_ad = 'A001'
		)
	) and rezerve_gun = 13 and rezerve_ay = 10 and rezerve_yil = 2010
);

-- il='adana' ilce='merkez' kategori='sinema' etkinlik_ad='incredible hulk' 
-- olan etkinliklerin gerçekleşeceği salon_ad, salon_kapasiteleri
select salon_ad, salon_kapasite from SALON
where salon_id in (
	select salon_id from YER
	where etkinlik_id in (
		select etkinlik_id from ETKINLIK
		where kategori_id in (
			select kategori_id from KATEGORI
			where kategori_ad='sinema'
		) and etkinlik_ad = 'incredible hulk'
	) and ililce_id in (
		select ililce_id from ILILCE
		where il = 'adana' and ilce = 'merkez'
	)
);

-- il='adana' ilce='merkez' kategori='sinema' etkinlik_ad='incredible hulk' 
-- olan etkinliklerin gerçekleşeceği salon_ad, salon_kapasiteleri ve koltuk adları
select s.salon_kapasite, s.salon_ad, k.koltuk_ad from KOLTUK k, SALON s
where k.salon_id = s.salon_id and s.salon_id in (
	select salon_id from YER
	where etkinlik_id in (
		select etkinlik_id from ETKINLIK
		where kategori_id in (
			select kategori_id from KATEGORI
			where kategori_ad='sinema'
		) and etkinlik_ad = 'incredible hulk'
	) and ililce_id in (
		select ililce_id from ILILCE
		where il = 'adana' and ilce = 'merkez'
	)
);

