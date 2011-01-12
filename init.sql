-- ------------------------------------
--    BILET-X_vX-deneme
-- ------------------------------------
-- ©  Copyright 2010 designed by gdemir
-- http://gdemir.me                   
-- Tüm hakkları mahfuzdur
-- |DİKKAT!| bu sql düzenlenecek ya da
-- silinecektir.(el ile yazılmıştır.)
-- ------------------------------------

--
-- database tanımla, seç
--
drop database bilet_x;
create database if not exists bilet_x;
use bilet_x;

--
-- tablo var ise, sil
--
drop table if exists KATEGORI;
drop table if exists ETKINLIK;
drop table if exists YER;
drop table if exists SALON;
drop table if exists KOLTUK;
drop table if exists REZERVE;
drop table if exists ILILCE;
drop table if exists MEMBER;
drop table if exists ADMIN;
drop table if exists UCRET;

--
-- tabloları tanımları
--
create table KATEGORI (
	kategori_id int(10) not null auto_increment,
	kategori_ad varchar(50) not null,
	PRIMARY KEY(kategori_id)
)type=MyISAM default charset=utf8;

create table ETKINLIK (
	etkinlik_id int(10) not null auto_increment,
	etkinlik_ad varchar(128) not null,
	etkinlik_ilk_gun int(10) not null,
	etkinlik_ilk_ay int(10) not null,
	etkinlik_ilk_yil int(10) not null,
	etkinlik_son_gun int(10) not null,
	etkinlik_son_ay int(10) not null,
	etkinlik_son_yil int(10) not null,
	etkinlik_saat varchar(50) not null,
	etkinlik_durum int(1) not null,
	kategori_id int(10) not null,
	PRIMARY KEY(etkinlik_id)
)type=MyISAM default charset=utf8;

create table YER (
	yer_id int(11) not null,
	etkinlik_id int(10) not null,
	ililce_id int(10) not null,
	PRIMARY KEY(yer_id)
)type=MyISAM default charset=utf8;

create table SALON (
	salon_id int(10) not null auto_increment,
	ililce_id int(10) not null,
	salon_ad varchar(60) not null,
	salon_kapasite int(10) not null,
	PRIMARY KEY(salon_id)
)type=MyISAM default charset=utf8;

create table KOLTUK (
	koltuk_id int(10) not null auto_increment,
	salon_id int(10) not null,
	koltuk_ad varchar(60) not null,
	PRIMARY KEY(koltuk_id)
)type=MyISAM default charset=utf8;

create table REZERVE (
	rezerve_id int(10) not null auto_increment,
	rezerve_gun int(10) not null,
	rezerve_ay int(10) not null,
	rezerve_yil int(10) not null,
	etkinlik_id int(10) not null,
	yer_id int(10) not null,
	salon_id int(10) not null,
	koltuk_id int(10) not null,
	ucret_id int(10) not null,
	member_id int(10) not null,
	PRIMARY KEY(rezerve_id)
)type=MyISAM default charset=utf8;

create table ILILCE (
	ililce_id int(10) not null,
	il varchar(50) not null,
	ilce varchar(50) not null,
	PRIMARY KEY(ililce_id)
)type=MyISAM default charset=utf8;

create table MEMBER (
	member_id int(10) not null auto_increment,
	ililce_id varchar(60) not null,
	member_name varchar(60) not null,
	member_surname varchar(60) not null,
	member_telephone varchar(60) not null,
	member_email varchar(60) not null,
	member_username varchar(60) not null,
	member_password varchar(60) not null,
	PRIMARY KEY(member_id)
)type=MyISAM default charset=utf8;

create table ADMIN (
	admin_id int(10) not null auto_increment,
	admin_name varchar(60) not null,
	admin_surname varchar(60) not null,
	admin_password varchar(60) not null,
	PRIMARY KEY(admin_id)
)type=MyISAM default charset=utf8;

create table UCRET (
	ucret_id int(10) not null auto_increment,
	ucret_ad varchar(60) not null,
	ucret_fiyat varchar(60) not null,
	PRIMARY KEY(ucret_id)
)type=MyISAM default charset=utf8;

--
-- tablolara girdi yap
--
insert into KATEGORI (kategori_id, kategori_ad)
values
	(1, 'sinema'),
	(2, 'tiyatro'),
	(3, 'opera'),
	(4, 'bale');

insert into ETKINLIK (etkinlik_id, etkinlik_ad, 
		      etkinlik_ilk_gun, etkinlik_ilk_ay, etkinlik_ilk_yil,
		      etkinlik_son_gun, etkinlik_son_ay, etkinlik_son_yil,
		      etkinlik_saat, etkinlik_durum, kategori_id)
values
	(1, 'incredible hulk',    12,10,2010, 24,10,2010, '18:00:00', 1, 1),
	(2, 'ironman 2',          13,10,2010, 25,10,2010, '19:00:00', 1, 1),
	(3, '7 kocalı hürmüz',    15,10,2010, 27,10,2010, '20:00:00', 1, 2),
	(4, 'hacıvat ve karagöz', 16,10,2010, 28,10,2010, '21:00:00', 1, 2);

insert into YER (yer_id, etkinlik_id, ililce_id)
values
	(1, 1, 11), -- incredible hulk/adana-merkez
	(2, 1, 12), -- incredible hulk/adana-kozan
	(3, 1, 21), -- incredible hulk/adiyaman-merkez
	(4, 2, 11), -- ironman 2/adana-merkez
	(5, 3, 12), -- 7 kocalı hürmüz/adana-kozan
	(6, 4, 21); -- hacıvat ve karagöz/adiyaman-merkez

insert into SALON (salon_id, ililce_id, salon_ad, salon_kapasite)
values
	(1, 11, 'A001', 4), -- adana/merkez a001 salonu
	(2, 11, 'B001', 4), -- adana/merkez b001 salonu
	(3, 12, 'A',    6), -- adana/kozan A salonu
	(4, 12, 'B',    6), -- adana/kozan B salonu
	(5, 21, 'T-A',  2), -- adiyaman/merkez T-A salonu
	(6, 21, 'T-B',  2); -- adiyaman/merkez T-B salonu

insert into KOLTUK (koltuk_id, salon_id, koltuk_ad)
values  
	(1,  1, 'a1'),  -- adana/merkez a001/a1
	(2,  1, 'a2'),  -- adana/merkez a001/a2
	(3,  1, 'a3'),  -- adana merkez a001/a3 
	(4,  1, 'a4'),  -- adana/merkez a001/a4

	(7,  2, 'b1'),  -- adana/merkez b001/b1
	(8,  2, 'b2'),  -- adana/merkez b001/b2
	(9,  2, 'b3'),  -- adana/merkez b001/b3
	(10, 2, 'b4'),  -- adana/merkez b001/b4
	
	(11, 3, 'a-1'), -- adana/kozan A/a-1
	(12, 3, 'a-2'), -- adana/kozan A/a-2
	(13, 3, 'a-3'), -- adana/kozan A/a-3
	(14, 3, 'a-4'), -- adana/kozan A/a-4
	(15, 3, 'a-5'), -- adana/kozan A/a-5
	(16, 3, 'a-6'), -- adana/kozan A/a-6
	
	(17, 4, 'b-1'), -- adana/kozan B/b-6
	(18, 4, 'b-2'), -- adana/kozan B/b-6
	(19, 4, 'b-3'), -- adana/kozan B/b-6
	(20, 4, 'b-4'), -- adana/kozan B/b-6
	(21, 4, 'b-5'), -- adana/kozan B/b-6
	(22, 4, 'b-6'), -- adana/kozan B/b-6
	
	(23, 5, 'aa'),  -- adiyaman/merkez T-A/aa
	(24, 5, 'ab'),  -- adiyaman/merkez T-A/ab
	
	(25, 6, 'ba'),  -- adiyaman/merkez T-B/ba
	(26, 6, 'bb');  -- adiyaman/merkez T-B/bb

insert into REZERVE (rezerve_id, rezerve_gun, rezerve_ay, rezerve_yil, etkinlik_id, yer_id, salon_id, koltuk_id, ucret_id, member_id)
values
	(1,  13,10,2010, 1, 1, 1, 1,  1, 8060331),
	(2,  13,10,2010, 1, 1, 1, 2,  1, 8060331),
	(3,  13,10,2010, 1, 1, 2, 1,  1, 8060332),
	(4,  23,10,2010, 1, 1, 1, 4,  2, 8060327),
	(5,  15,10,2010, 1, 2, 2, 7,  1, 8060333),
	(6,  15,10,2010, 1, 3, 3, 11, 1, 8060320),
	(7,  20,10,2010, 2, 4, 1, 1,  2, 8060321),
	(8,  20,10,2010, 4, 6, 2, 1,  2, 8060321),
	(9,  21,10,2010, 3, 5, 5, 23, 1, 8060331);

insert into ILILCE (ililce_id, il, ilce) 
values
	(11, 'adana',    'merkez'),
	(12, 'adana',    'kozan'),
	(21, 'adıyaman', 'merkez');

insert into MEMBER (member_id, ililce_id, member_name, member_surname, member_telephone, member_email, member_username, member_password)
values
	(8060331, 11, 'gökhan', 'demir',  '535xxxxxxx', 'gdemir@bil.omu.edu.tr',     'gdemir',   '******'),
	(8060333, 12, 'sefa',   'yıldız', '541xxxxxx',  'sayz@bil.omu.edu.tr',       'sayz',     '******'),
	(8060327, 21, 'yunus',  'ateş',   '542xxxxxx',  'yunus.ates@bil.omu.edu.tr', 'yunusa',   '******'),
	(8060320, 21, 'hasan',  'ayvaz',  '542xxxxxx',  'hasayvaz@bil.omu.edu.tr',   'hasayvaz', '******'),
	(8060321, 21, 'erol',   'uslu',   '541xxxxxx',  'erol.uslu@bil.omu.edu.tr',  'euslu',    '******');

insert into ADMIN (admin_id, admin_name, admin_surname, admin_password)
values
	(1, 'kill', 'bill', 'secret1'),
	(2, 'kul',  'bul',  'secret2');

insert into UCRET (ucret_id, ucret_ad, ucret_fiyat)
values
	(1, 'İndirimli-gün ücreti', 6),
	(2, 'Öğrenci ücreti',       8),
	(3, 'Tam ücreti',           15);

--
-- sorgu
--
-- user_id=8060331 olan kişinin rezerve sayısı 
select count(*) as 8060331_rezerve_sayisi from REZERVE
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
select etkinlik_ad, etkinlik_ilk_gun, etkinlik_ilk_ay, etkinlik_ilk_yil, etkinlik_son_gun, etkinlik_son_ay, etkinlik_son_yil, etkinlik_saat from ETKINLIK
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
select etkinlik_ad, etkinlik_ilk_gun, etkinlik_ilk_ay, etkinlik_ilk_yil, etkinlik_son_gun, etkinlik_son_ay, etkinlik_son_yil, etkinlik_saat from ETKINLIK
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

-- user_id=8060331 olan kişinin rezerve ettiği, il ilce kapasite bilgileri
select s.salon_ad, s.salon_kapasite, i.il, i.ilce from SALON s, ILILCE i
where s.ililce_id = i.ililce_id and salon_id in (
	select salon_id from REZERVE
	where member_id = 8060331
);

-- user_id=8060331 olan kişinin rezerve ettiği, il ilce ve etkinlikler
select e.etkinlik_ad, i.il, i.ilce from YER y, ILILCE i, ETKINLIK e
where y.ililce_id = i.ililce_id and y.etkinlik_id = e.etkinlik_id and yer_id in (
	select yer_id from REZERVE
	where member_id = 8060331
);

-- user_id=8060331 olan kişinin rezerve ettiği, il ilce ve etkinlikler
select m.member_name, e.etkinlik_ad, s.salon_ad, k.koltuk_ad from REZERVE r, SALON s, KOLTUK k, ETKINLIK e, MEMBER m
where s.salon_id = r.salon_id and k.koltuk_id = r.koltuk_id and e.etkinlik_id = r.etkinlik_id and m.member_id=r.member_id and r.member_id = 8060331;

-- member_id=8060331 olan kişinin rezerve ettiği etkinliklerin
-- adları, filmin giriş/bitiş tarihleri
select etkinlik_ad, etkinlik_ilk_gun, etkinlik_ilk_ay, etkinlik_ilk_yil, etkinlik_son_gun, etkinlik_son_ay, etkinlik_son_yil, etkinlik_saat from ETKINLIK
where etkinlik_id in (
	select etkinlik_id from REZERVE
	where member_id = 8060331
);


-- sinema'daki etkinlik adı='incredible hulk'
-- olan tüm illerde etkinliği rezerve edenlerin sayısı
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
where r.ucret_id = u.ucret_id and yer_id in (
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
 select koltuk_ad as sinema_adana_merkez_a001_13_10_2010 from KOLTUK
 where koltuk_id in (
	select koltuk_id from REZERVE
	where etkinlik_id in (
		select etkinlik_id from ETKINLIK
		where kategori_id = (
			select kategori_id from KATEGORI
			where kategori_ad = 'sinema'
		) and etkinlik_ad = 'incredible hulk' 
	) and yer_id in (
		select yer_id from YER
		where ililce_id in (
			select ililce_id from ILILCE
			where il = 'adana' and ilce = 'merkez'
		)
	) and salon_id in (
		select salon_id from SALON
		where salon_ad = 'A001'
	) and rezerve_gun = 13 and rezerve_ay = 10 and rezerve_yil = 2010

);

-- il='adana' ilce='merkez'in tüm salon ve koltuk adlarını göster
select s.salon_ad, k.koltuk_ad from SALON s, KOLTUK k
where s.salon_id = k.salon_id and ililce_id in (
	select ililce_id from ILILCE
	where il = 'adana' and ilce = 'merkez'
);


/*
-- il='adana' ilce='merkez' kategori='sinema' etkinlik_ad='incredible hulk' 
-- olan etkinliklerin gerçekleşeceği salon_ad, salon_kapasiteleri
-- select salon_ad, salon_kapasite from SALON
-- where salon_id in (

select koltuk_ad from KOLTUK
where salon_id in (
	select salon_id from SALON
	where ililce_id in (
		select ililce_id from ILILCE
		where il = 'adana' and ilce = 'merkez'
	)
);
/*
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
