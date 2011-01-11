-- ------------------------------------
--    BILET-X_vX-insert
-- ------------------------------------
-- ©  Copyright 2010 designed by gdemir
-- http://gdemir.me                   
-- Tüm hakkları mahfuzdur
-- ------------------------------------

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

insert into YER (yer_id, etkinlik_id, ililce_id, salon_id)
values
	(1,  1, 11, 1), -- adana merkez'in salonları A001/B001 oldugunu düşünüyoruz.	
	(2,  1, 11, 2),	
	(3,  1, 12, 3), -- adana kozan'in salonları A/B oldugunu düşünüyoruz.
	(4,  1, 12, 4), 
	(5,  1, 21, 5), -- adıyaman merkez'in salonları T-A/T-B oldugunu düşünüyoruz.
	(6,  1, 21, 6),
	(7,  2, 11, 1),
	(8,  2, 11, 2),
	(9,  3, 12, 3),
	(10, 3, 12, 4),
	(11, 4, 21, 5),
	(12, 4, 21, 6),
	(13, 4, 22, 5),
	(14, 4, 22, 6);

insert into SALON (salon_id, salon_ad, salon_kapasite)
values
	(1, 'A001', 4),
	(2, 'B001', 4),
	(3, 'A',    4),
	(4, 'B',    4),
	(5, 'T-A',  6),
	(6, 'T-B',  6);

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
	(22, 4, 'b-6'),
	-- T-A salonu
	(23, 5, 'aa'),
	(24, 5, 'ab'),
	-- T-B salonu
	(25, 6, 'ba'),
	(26, 6, 'bb');

insert into REZERVE (rezerve_id, rezerve_gun, rezerve_ay, rezerve_yil, yer_id, koltuk_id, ucret_id, member_id)
values
	(1,  13,10,2010,  1, 1,  1, 8060331),
	(2,  13,10,2010,  1, 2,  1, 8060331),
	(3,  23,10,2010,  1, 4,  2, 8060327),
	(4,  15,10,2010,  2, 7,  1, 8060333),
	(5,  15,10,2010,  3, 11, 1, 8060320),
	(6,  20,10,2010,  3, 12, 2, 8060321),
	(7,  20,10,2010,  7, 1,  2, 8060321),
	(8,  21,10,2010,  5, 23, 1, 8060331);

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
	(3, 'Tam ücreti',           10);

