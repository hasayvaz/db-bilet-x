-- ------------------------------------
--    BILET-X_v2                      
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
	etkinlik_id int(11) not null auto_increment,
	etkinlik_kod int(10) not null,
	ililce_id int(10) not null,
	kapasite int(10) not null,
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
insert into ETKINLIK_TIP (etkinlik_kod, etkinlik_tur)
values
	(1, 'sinema'),
	(2, 'tiyatro'),
	(3, 'bale');

insert into ILILCE (ililce_id, il, ilce) 
VALUES
	(11, 'adana', 'merkez'),
	(12, 'adana', 'kozan'),
	(21, 'adıyaman', 'merkez');

insert into ETKINLIK_YER (etkinlik_id, etkinlik_kod, ililce_id, kapasite, etkinlik_ad)
values
	(1, 1, 11, 40, 'incredible hulk'),
	(2, 1, 11, 50, 'ironman 2'),
	(3, 1, 12, 60, 'her şey vatan için'),
	(4, 1, 21, 70, '7 kocalı hürmüz');

insert into MUSTERI (user_id, ililce_id, ad, soyad, ceptel, email)
values
	(8060331, 11, 'gökhan', 'demir', '535xxxxxxx', 'gdemir@bil.omu.edu.tr'),
	(8060333, 12, 'sefa', 'yıldız', '541xxxxxx', 'sayz@bil.omu.edu.tr'),
	(8060327, 21, 'yunus', 'ateş', '542xxxxxx', 'yunus.ates@bil.omu.edu.tr'),
	(8060320, 21, 'hasan', 'ayvaz', '542xxxxxx', 'hasayvaz@bil.omu.edu.tr'),
	(8060321, 21, 'erol', 'uslu', '541xxxxxx', 'erol.uslu@bil.omu.edu.tr');

insert into YONETICI (ad, soyad, sifre)
values
	('kill', 'bill', 'secret1'),
	('kul', 'bul', 'secret2');

insert into KOLTUK (koltuk_id, etkinlik_id, koltuk_kod)
values
	(1,  1, 'a1'),
	(2,  1, 'a2'),
	(3,  1, 'b1'),
	(4,  1, 'b2'),
	(5,  1, 'c1'),
	(6,  2, 'c2'),
	(7,  2, 'AA1'),
	(8,  2, 'AA2'),
	(9,  2, 'AB1'),
	(10, 2, 'AB2'),
	(11, 3, 'A'),
	(12, 3, 'B'),
	(13, 3, 'C'),
	(14, 3, 'D'),
	(15, 3, 'E'),
	(16, 4, 'a-a1'),
	(17, 4, 'a-b1'),
	(18, 4, 'a-c1'),
	(19, 4, 'a-d1'),
	(20, 4, 'a-e1');

insert into REZERVE (koltuk_id, user_id)
values
	(1, 8060331), /* 1 => 1/a1  */
	(2, 8060331), /* 1 => 1/a2  */
	(3, 8060327), /* 2 => 1/b1  */
	(7, 8060333), /* 7 => 2/AA1 */
	(19, 8060320), /* 7 => 4/a-d1 */
	(20, 8060321); /* 7 => 4/a-e1 */

--
-- sorgu
--
-- il="adana" ve ilce="kozan" olan müşterilerin tüm bilgileri 
select * from MUSTERI
where ililce_id=(
	select ililce_id from ILILCE
	where il='adana' and ilce='kozan'
);

-- il="adana" olan müşterilerin bütün bilgileri 
select * from MUSTERI
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
) and etkinlik_kod=(
	select etkinlik_kod from ETKINLIK_TIP
	where etkinlik_tur='sinema'
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
		where user_id=8060331
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
		) and etkinlik_kod=(
			select etkinlik_kod from ETKINLIK_TIP
			where etkinlik_tur='sinema'
		) and etkinlik_ad='incredible hulk'
	) 
);

-- il="adana" olarak etkinlik yer'lerini rezerve eden kişilerin tüm bilgilerini göster 
select * from MUSTERI
where user_id in (
	select distinct user_id from REZERVE
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
select * from MUSTERI
where user_id in (
	select user_id from REZERVE
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