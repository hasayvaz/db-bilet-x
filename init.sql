-- ------------------------------------
--    BILET-X_v1                          
-- ------------------------------------
-- © Copyright 2010 designed by gdemir
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
drop table if exists ETKINLIK_TIP;
drop table if exists ETKINLIK_YER;
drop table if exists ILILCE;
drop table if exists REZERVE;
drop table if exists KOLTUK;
drop table if exists MUSTERI;
drop table if exists YONETICI;

--
-- tabloları tanımları
--
create table ETKINLIK_TIP (
	etkinlik_kod int(10) not null auto_increment,
	etkinlik_tur varchar(50) not null,
	PRIMARY KEY(etkinlik_kod)
)type=MyISAM default charset=utf8;

create table ETKINLIK_YER (
	etkinlik_id int(11) not null,
	ililce_id int(10) not null,
	kapasite int(10) not null,
	etkinlik_kod int(10) not null,
	etkinlik_ad varchar(128) not null,
	PRIMARY KEY(etkinlik_id)
)type=MyISAM default charset=utf8;

create table ILILCE (
	ililce_id int(10) not null,
	il varchar(50) not null,
	ilce varchar(50) not null,
	PRIMARY KEY(ililce_id)
)type=MyISAM default charset=utf8;

create table REZERVE (
	koltuk_id int(10) not null,
	user_id int(10) not null,
	PRIMARY KEY(koltuk_id)
)type=MyISAM default charset=utf8;

create table KOLTUK (
	koltuk_id int(10) not null auto_increment,
	etkinlik_id int(10) not null,
	koltuk_kod varchar(60) not null,
	PRIMARY KEY(koltuk_id)
)type=MyISAM default charset=utf8;

create table MUSTERI (
	user_id int(10) not null auto_increment,
	ililce_id varchar(60) not null,
	ad varchar(60) not null,
	soyad varchar(60) not null,
	ceptel varchar(60) not null,
	email varchar(60) not null,
	PRIMARY KEY(user_id)
)type=MyISAM default charset=utf8;

create table YONETICI (
	admin_id int(10) not null auto_increment,
	ad varchar(60) not null,
	soyad varchar(60) not null,
	sifre varchar(60) not null,
	PRIMARY KEY(admin_id)
)type=MyISAM default charset=utf8;

--
-- tablolara girdi yap
--
insert into ETKINLIK_TIP (etkinlik_tur)
values
	('sinema'),
	('tiyatro'),
	('bale');

insert into ILILCE 
VALUES
	(11, 'adana', 'merkez'),
	(12, 'adana', 'kozan'),
	(21, 'adıyaman', 'merkez');

insert into ETKINLIK_YER (etkinlik_id, ililce_id, kapasite, etkinlik_kod, etkinlik_ad)
values
	(111, 11, 40, 1, "incredible hulk"),
	(112, 12, 40, 1, "her şey vatan için");

insert into MUSTERI (user_id, ililce_id, ad, soyad, ceptel, email)
values
	(8060331, 11, "gökhan", "demir", "535xxxxxxx", "gdemir@bil.omu.edu.tr"),
	(8060333, 12, "sefa", "yıldız", "541xxxxxx", "sayz@bil.omu.edu.tr"),
	(8060327, 21, "yunus", "ates", "542xxxxxx", "yunus.ates@bil.omu.edu.tr");

insert into YONETICI (ad, soyad, sifre)
values
	("kill", "bill", "secret1"),
	("kul", "bul", "secret2");

insert into KOLTUK (etkinlik_id, koltuk_kod)
values
	(111, "a1"),
	(111, "a2"),
	(111, "b1"),
	(111, "b2"),
	(111, "c1"),
	(111, "c2"),
	(112, "AA1"),
	(112, "AA2"),
	(112, "AB1"),
	(112, "AB2"),
	(112, "AC1"),
	(112, "AC2");
insert into REZERVE (koltuk_id, user_id)
values
	(1, 8060331),
	(7, 8060333);

--
-- sorgu
--
/* il="adana" ve ilce="merkez" olan müşterilerin tüm bilgileri */
select * from MUSTERI
where ililce_id=(
	select ililce_id from ILILCE
	where il="adana" and ilce="merkez"
);

/* il="adana" olan müşterilerin bütün bilgileri */
select * from MUSTERI
where ililce_id in (
	select ililce_id from ILILCE
	where il="adana"
);

/* il="adana" ve ilce="merkez" olan etkinlik_yerinin ad'ı kapasite'si*/
select etkinlik_ad, kapasite from ETKINLIK_YER
where ililce_id=(
	select ililce_id from ILILCE
	where il="adana" and ilce="kozan"
);

/* il="adana" olan etkinlik_yerinin ad'ı kapasite'si*/
select etkinlik_ad, kapasite from ETKINLIK_YER
where ililce_id in (
	select ililce_id from ILILCE
	where il="adana"
);

/* user_id=08060331 olan kişinin rezerve ettiği etkinliğin adı'nı gösterir */
select etkinlik_ad from ETKINLIK_YER
where etkinlik_id in (
	select etkinlik_id from KOLTUK
	where koltuk_id in (
		select koltuk_id from REZERVE
		where user_id=8060331
	)
);
/* il="adana" olan etkinlik yerlerini seçen kişilerin tüm bilgilerini göster*/
select * from MUSTERI
where user_id in (
	select user_id from REZERVE
	where koltuk_id in (
		select koltuk_id from KOLTUK
		where etkinlik_id in (
			select etkinlik_id from ETKINLIK_YER
			where ililce_id in (
				select ililce_id from ILILCE
				 where il="adana"
			)
		)
	)
);

/* ilce="kozan" olan etkinlik yerlerini seçen kişilerin tüm bilgilerini göster*/
select * from MUSTERI
where user_id in (
	select user_id from REZERVE
	where koltuk_id in (
		select koltuk_id from KOLTUK
		where etkinlik_id in (
			select etkinlik_id from ETKINLIK_YER
			where ililce_id in (
				select ililce_id from ILILCE
				where ilce="merkez"
			)
		)
	)
);
/* 
