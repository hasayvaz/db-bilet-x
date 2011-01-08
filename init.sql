-- ------------------------------------
--    BILET-X_v2                      
-- ------------------------------------
-- ©  Copyright 2010 designed by gdemir
-- http://gdemir.me                   
-- Tüm hakkları mahfuzdur
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
	etkinlik_ilk varchar(50) not null,
	etkinlik_son varchar(50) not null,
	etkinlik_durum int(1) not null,
	kategori_id int(10) not null,
	PRIMARY KEY(etkinlik_id)
)type=MyISAM default charset=utf8;

create table YER (
	yer_id int(11) not null,
	etkinlik_id int(10) not null,
	ililce_id int(10) not null,
	salon_id int(10) not null,
	PRIMARY KEY(yer_id)
)type=MyISAM default charset=utf8;

create table SALON (
	salon_id int(10) not null auto_increment,
	salon_ad varchar(60) not null,
	salon_kapasite int(10) not null,
	PRIMARY KEY(salon_id)
)type=MyISAM default charset=utf8;

create table KOLTUK (
	koltuk_id int(10) not null auto_increment,
	koltuk_ad varchar(60) not null,
	salon_id int(10) not null,
	PRIMARY KEY(koltuk_id)
)type=MyISAM default charset=utf8;

create table REZERVE (
	rezerve_id int(10) not null auto_increment,
	ucret_id int(10) not null,
	koltuk_id int(10) not null,
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

insert into ETKINLIK (etkinlik_id, etkinlik_ad, etkinlik_ilk, etkinlik_son, etkinlik_durum, kategori_id)
values
	(1, 'incredible hulk', '12.10.2010', '24.10.2010', 1, 1),
	(2, 'ironman 2', '13.10.2010', '25.10.2010', 1, 1),
	(3, '7 kocalı hürmüz', '15.10.2010', '27.10.2010', 1, 2),
	(4, 'hacıvat ve karagöz', '16.10.2010', '28.10.2010', 1, 2);

insert into YER (yer_id, etkinlik_id, ililce_id, salon_id)
values
	(1, 1, 11, 1),	
	(2, 1, 11, 2),	
	(3, 1, 12, 1),	
	(4, 1, 12, 2),
	(5, 1, 21, 3),
	(6, 1, 21, 4),
	(7, 2, 11, 1),
	(8, 2, 11, 2),
	(9, 3, 12, 5),
	(10, 3, 12, 6),
	(11, 4, 21, 5),
	(12, 4, 21, 6),
	(13, 4, 22, 5),
	(14, 4, 22, 6);

insert into SALON (salon_id, salon_ad, salon_kapasite)
values
	(1, 'A001', 4),
	(2, 'B001', 4),
	(3, 'A', 6),
	(4, 'B', 6),
	(5, 'T-A', 4),
	(6, 'T-B', 4);

insert into KOLTUK (koltuk_id, salon_id, koltuk_ad)
values  -- A001 salonu koltukları
	(1,  1, 'a1'),
	(2,  1, 'a2'),
	(3,  1, 'a3'),
	(4,  1, 'a4'),
	-- B001 salonu koltukları
	(7,  2, 'b1'),
	(8,  2, 'b2'),
	(9,  2, 'b3'),
	(10, 2, 'b4'),
	-- A salonu koltukları
	(11, 3, 'a-1'),
	(12, 3, 'a-2'),
	(13, 3, 'a-3'),
	(14, 3, 'a-4'),
	(15, 3, 'a-5'),
	(16, 3, 'a-6'),
	-- B salonu koltukları
	(17, 4, 'b-1'),
	(18, 4, 'b-2'),
	(19, 4, 'b-3'),
	(20, 4, 'b-4'),
	(21, 4, 'b-5'),
	(22, 4, 'b-6');

insert into REZERVE (rezerve_id, ucret_id, koltuk_id, member_id)
values
	(1, 1, 1, 8060331),   
	(2, 1, 2, 8060331),   
	(3, 2, 3, 8060327),   
	(4, 1, 4, 8060333),  
	(5, 1, 5, 8060320), 
	(6, 1, 6, 8060321);

insert into ILILCE (ililce_id, il, ilce) 
values
	(11, 'adana', 'merkez'),
	(12, 'adana', 'kozan'),
	(21, 'adıyaman', 'merkez'),
	(22, 'adıyaman', 'falanfilan');

insert into MEMBER (member_id, ililce_id, member_name, member_surname, member_telephone, member_email, member_username, member_password)
values
	(8060331, 11, 'gökhan', 'demir', '535xxxxxxx', 'gdemir@bil.omu.edu.tr', 'gdemir', '******'),
	(8060333, 12, 'sefa', 'yıldız', '541xxxxxx', 'sayz@bil.omu.edu.tr', 'sayz', '******'),
	(8060327, 21, 'yunus', 'ateş', '542xxxxxx', 'yunus.ates@bil.omu.edu.tr', 'yunusa', '******'),
	(8060320, 21, 'hasan', 'ayvaz', '542xxxxxx', 'hasayvaz@bil.omu.edu.tr','hasayvaz', '******'),
	(8060321, 21, 'erol', 'uslu', '541xxxxxx', 'erol.uslu@bil.omu.edu.tr', 'euslu', '******');

insert into ADMIN (admin_id, admin_name, admin_surname, admin_password)
values
	(1, 'kill', 'bill', 'secret1'),
	(2, 'kul', 'bul', 'secret2');

insert into UCRET (ucret_id, ucret_ad, ucret_fiyat)
values
	(1, 'İndirimli-gün ücreti', 6),
	(2, 'Öğrenci ücreti', 8),
	(3, 'Tam ücreti', 10);


--
-- FIXME  explain : coming soon..
--
/*
--
-- sorgu
--
-- il="adana" ve ilce="kozan" olan müşterilerin tüm bilgileri 
select * from MEMBER
where ililce_id=(
	select ililce_id from ILILCE
	where il='adana' and ilce='kozan'
);

-- il="adana" olan müşterilerin bütün bilgileri 
select * from MEMBER
where ililce_id in (
	select ililce_id from ILILCE
	where il='adana'
);

-- il="adana" ve ilce="merkez" de etkinlik tip olarak
-- sinema olan etkinliklerin adı ve kapsitesini göster 
select etkinlik_ad, kapasite from ETKINLIK_YER
where ililce_id=(
	select ililce_id from ILILCE
	where il='adana' and ilce='merkez'
) and kategori_id=(
	select kategori_id from KATEGORI
	where kategori_ad='sinema'
);

-- il="adana" olan etkinlik_yer'lerinin ad'ı kapasite'sini göster
select etkinlik_ad, kapasite from ETKINLIK_YER
where ililce_id in (
	select ililce_id from ILILCE
	where il='adana'
);

-- user_id=08060331 olan kişinin rezerve ettiği etkinliğin adı'nı göster 
select etkinlik_ad from ETKINLIK_YER
where etkinlik_id in (
	select etkinlik_id from KOLTUK
	where koltuk_id in (
		select koltuk_id from REZERVE
		where member_id=8060331
	)
);

-- il="adana" olarak sinema'daki etkinlik adı="incredible hulk"
-- olan etkinliği rezerve edenlerin sayısını göster
select count(*) from REZERVE
where koltuk_id in (
	select koltuk_id from KOLTUK
	where etkinlik_id in (
		select etkinlik_id from ETKINLIK_YER
		where ililce_id in(
			select ililce_id from ILILCE
			where il='adana'
		) and kategori_id=(
			select kategori_id from KATEGORI
			where kategori_ad='sinema'
		) and etkinlik_ad='incredible hulk'
	) 
);

-- il="adana" olarak etkinlik yer'lerini rezerve eden kişilerin tüm bilgilerini göster 
select * from MEMBER
where member_id in (
	select distinct member_id from REZERVE
	where koltuk_id in (
		select koltuk_id from KOLTUK
		where etkinlik_id in (
			select etkinlik_id from ETKINLIK_YER
			where ililce_id in (
				select ililce_id from ILILCE
				 where il='adana'
			)
		)
	)
);

-- il="adana" ve ilce="kozan" olan etkinlik yer'lerini seçen kişilerin tüm bilgilerini göster 
select * from MEMBER
where member_id in (
	select member_id from REZERVE
	where koltuk_id in (
		select koltuk_id from KOLTUK
		where etkinlik_id in (
			select etkinlik_id from ETKINLIK_YER
			where ililce_id in (
				select ililce_id from ILILCE
				where il='adana' and ilce='merkez'
			)
		)
	)
);

select * from SALON
where salon_id in (
	select salon_id from ETKINLIK_YER
);
*/
