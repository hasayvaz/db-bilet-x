#### Veritabanı Yönetim Sistemleri  
#### Dersi Uygulaması  
#### Dönem Projesi  
#### Konu : bilet_x veritabanı  

### Ne

Yapılan bilet alımının  kaydını tutan,  
rezervasyon veya satın alma işlemini  
yapan bir veritabanı sistemi.  

### Nasıl

- Etkinliklerde seçim yapma imkanı  
- Etkinlik mekânlarını görebilme ve en idealini seçme imkanı  
- Yapılan rezervasyona kayıt yapabilme  
- Bir kullanıcının birden fazla rezervasyon yapabilme özelliği  
- Müşteri sadece etkinlik seçebilecek ama yöneticiler tüm kayıtları görebilecek.

### Çıktı

verilen veritabanı için aşağıda verilen çalışmaları yapınız.  
   1.  İş kurallarını yazınız. (10 puan)  
   2.  Bütünlük kısıtlamalarını yazınız. (10 puan)  
   3.  Veritabanı tablolarını ve tablolarda saklanacak bilgileri belirleyiniz. (10 puan)  
   4.  Varlık-İlişki Çizeneğini çiziniz ve tablolar arasındaki 1:1, 1:N, N:N ilişki türlerini belirleyiniz. (20 puan)  
   5. İlişkisel Şema Çizeneğini çiziniz. (10 puan)  
   6. MySQL Workbench kullanarak, veritabanının MySQL Modeli için aşağıdakileri bileşenleri oluşturunuz. (20 puan)    

- MySQL Schema (Tablolar, Kolonlar, Yabancı Anahtarlar, Bütünlük kısıtlamaları, Veriler)  
- EER Diagram  
- SQL CREATE Script  
   7. Oluşturduğunuz SQL CREATE Script’ini MySQL Query Browser’da çalıştırarak  
       veritabanının fiziksel şemasını oluşturunuz. Oluşturduğunuz veritabanı şeması üzerinde 10  
       farklı SQL sorgusu yazınız. Sorgularınızı çalıştırarak doğru sonuç ürettiğinden emin olunuz.  
       (20 puan)  
Açıklamalar  
- 1 ila 5 numaralı çalışmalar Kelime İşlemci programı ile hazırlanacaktır.  
- 6 numaralı çalışma sonucu 2 dosya üretilecektir.  
	- İlk dosya MySQL Schema ve EER diagram içeren MWB uzantılı MySQL WorkBench dosyasıdır.  
	- SQL uzantılı script dosyasıdır.  
- 7 numaralı çalışma sonucu, içinde 10 adet SQL komutu bulunan SQL uzantılı bir script dosyası üretilecektir.  
- Toplam teslim edilecek dosya sayısı 4 adettir.  
	- 1 adet Word/Openoffice dosyası (DOC ya da ODT uzantılı)  
	- 1 adet MYSQL Workbench dosyası (MWB uzantılı)  
	- 1 adet SQL Create Script dosyası (SQL uzantılı)  
	- 1 adet SQL sorgularını içeren script dosyası (SQL uzantılı)  
- Her gruptan bir kişi yaptıkları çalışma sonucu oluşturdukları dosyaları, gruptaki kişilerin  
  isimleriyle birlikte e-posta ile gönderecektir. (onur.baran@bil.omu.edu.tr)  
- Ödev teslim tarihi Son Final Sınavı Tarihi (**Her geciken gün için 5 puan kırılacaktır.**)  

### uygulmayı denemek için

	$ cd ~/
	$ git clone git@github.com:gdemir/db-bilet-x.git
	$ mysql -u root -p < ~/db-bilet-x/init.sql
