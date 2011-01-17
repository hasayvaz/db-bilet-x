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

insert into ETKINLIK (etkinlik_id, etkinlik_ad, etkinlik_ilk_tarih, etkinlik_son_tarih, etkinlik_saat, etkinlik_durum, kategori_id)
values
	(1, 'incredible hulk',    '2010-10-12', '2010-10-24', '18:00:00', 1, 1),
	(2, 'ironman 2',          '2010-10-13', '2010-10-25', '19:00:00', 1, 1),
	(3, '7 kocalı hürmüz',    '2010-10-15', '2010-10-27', '20:00:00', 1, 2),
	(4, 'hacıvat ve karagöz', '2010-10-16', '2010-10-28', '21:00:00', 1, 2);

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

insert into REZERVE (rezerve_id, rezerve_tarih, etkinlik_id, yer_id, salon_id, koltuk_id, ucret_id, member_id)
values
	(1,  '2010-10-13', 1, 1, 1, 1,  1, 8060331),
	(2,  '2010-10-13', 1, 1, 1, 2,  1, 8060331),
	(3,  '2010-10-13', 1, 1, 2, 1,  1, 8060332),
	(4,  '2010-10-23', 1, 1, 1, 4,  2, 8060327),
	(5,  '2010-10-15', 1, 2, 2, 7,  1, 8060333),
	(6,  '2010-10-15', 1, 3, 3, 11, 1, 8060320),
	(7,  '2010-10-20', 2, 4, 1, 1,  2, 8060321),
	(8,  '2010-10-20', 4, 6, 2, 1,  2, 8060321),
	(9,  '2010-10-21', 3, 5, 5, 23, 1, 8060331);

insert into ILILCE (ililce_id, il, ilce) 
values
	(11, 'adana',    'merkez'),
	(12, 'adana',    'kozan'),
	(21, 'adıyaman', 'merkez');

insert into MEMBER (member_id, ililce_id, member_name, member_surname, member_telephone, member_email, member_username, member_password, member_kredikart)
values
	(8060331, 11, 'gökhan', 'demir',  '535xxxxxxx', 'gdemir@bil.omu.edu.tr',     'gdemir',   '******', 12345),
	(8060333, 12, 'sefa',   'yıldız', '541xxxxxx',  'sayz@bil.omu.edu.tr',       'sayz',     '******', 12346),
	(8060327, 21, 'yunus',  'ateş',   '542xxxxxx',  'yunus.ates@bil.omu.edu.tr', 'yunusa',   '******', 12347),
	(8060320, 21, 'hasan',  'ayvaz',  '542xxxxxx',  'hasayvaz@bil.omu.edu.tr',   'hasayvaz', '******', 12348),
	(8060321, 21, 'erol',   'uslu',   '541xxxxxx',  'erol.uslu@bil.omu.edu.tr',  'euslu',    '******', 12349);

insert into ADMIN (admin_id, admin_name, admin_surname, admin_password)
values
	(1, 'kill', 'bill', 'secret1'),
	(2, 'kul',  'bul',  'secret2');

insert into UCRET (ucret_id, ucret_ad, ucret_fiyat)
values
	(1, 'İndirimli-gün ücreti', 6),
	(2, 'Öğrenci ücreti',       8),
	(3, 'Tam ücreti',           15);

