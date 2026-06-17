-- ============================================
-- OPTİK / GÖZLÜK TEMASI — Kurulum SQL
-- Kurumsal/Hizmet arketipinden türetildi (tema-master).
-- Kullanım: phpMyAdmin > Import  (veya: mysql -u root < kurulum.sql)
-- ============================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `optik_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `optik_db`;

-- ============ AYARLAR ============
DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE `ayarlar` (
  `anahtar` VARCHAR(80) NOT NULL PRIMARY KEY,
  `deger` TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ayarlar` (`anahtar`,`deger`) VALUES
('site_adi','Vizyon Optik'),
('site_baslik','Vizyon Optik — Gözlük, Lens ve Ücretsiz Göz Tahlili'),
('site_aciklama','Numaralı gözlük, güneş gözlüğü ve kontakt lenste dünya markaları. Uzman optisyenlerimiz ve ücretsiz göz tahlili ile net görüşün adresi.'),
('telefon','+90 444 0 000'),
('telefon2','+90 532 000 00 00'),
('mail','info@vizyonoptik.com'),
('adres','Merkez Mah. Moda Cad. No:12, Kadıköy / İstanbul'),
('calisma_saati','Pzt - Cmt: 09:30 - 20:00 • Pazar: 11:00 - 19:00'),
('hakkimizda_kisa','Vizyon Optik olarak 20 yıldır net görüş ve şık tasarımı bir araya getiriyoruz. Uzman optisyen kadromuz, ücretsiz göz tahlili imkanımız ve dünya markası gözlük koleksiyonumuzla gözlerinize en doğru çözümü sunuyoruz.'),
('hakkimizda_uzun','Vizyon Optik; numaralı gözlük, güneş gözlüğü, kontakt lens ve göz sağlığı ürünlerinde uzmanlaşmış köklü bir optik mağazasıdır. Son teknoloji bilgisayarlı göz tahlili cihazlarımız, deneyimli optisyenlerimiz ve geniş dünya markası ürün yelpazemizle her yaşa ve ihtiyaca uygun çözümler üretiyoruz. Reçetenize en uygun cam ve çerçeveyi birlikte seçiyor, anti-reflit, mavi ışık filtreli ve incelttirilmiş cam seçenekleriyle hem görüşünüzü hem konforunuzu artırıyoruz. Çocuk gözlüklerinden progresif (multifokal) camlara, lüks güneş gözlüklerinden günlük kontakt lenslere kadar tüm ihtiyaçlarınızda yanınızdayız. Ücretsiz göz tahlili ve uzman danışmanlığı için mağazamıza bekliyoruz.'),
('misyon','Herkesin net, konforlu ve şık bir şekilde görmesini sağlamak; doğru cam, doğru çerçeve ve uzman danışmanlığıyla göz sağlığını önceliklendirmek.'),
('vizyon','Optik sektöründe güvenin ve kalitenin ilk akla gelen markası olmak; teknoloji ve estetiği müşteri memnuniyetiyle buluşturmak.'),
('yil','20'),
('proje_sayi','45000'),
('musteri_sayi','38000'),
('personel_sayi','15'),
('facebook','#'),('instagram','#'),('twitter','#'),('linkedin','#'),('youtube','#');

-- ============ HİZMETLER ============
DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE `hizmetler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `ikon` VARCHAR(60) DEFAULT 'bi-eyeglasses',
  `gorsel` VARCHAR(255),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hizmetler` (`baslik`,`slug`,`ozet`,`icerik`,`ikon`,`gorsel`,`sira`) VALUES
('Ücretsiz Göz Tahlili','ucretsiz-goz-tahlili','Son teknoloji bilgisayarlı cihazlarla hızlı ve hassas görme ölçümü.','Mağazamızda bilgisayarlı (otorefraktometre) göz tahlili tamamen ücretsizdir. Uzman optisyenlerimiz numaranızı hassas şekilde ölçer, mevcut gözlüğünüzü kontrol eder ve ihtiyacınıza en uygun cam ve çerçeveyi belirlemenize yardımcı olur. Düzenli göz kontrolü göz sağlığınız için önemlidir; tahlil sonucunuza göre gerektiğinde göz hekimine yönlendirme yapılır.','bi-eye','https://images.unsplash.com/photo-1591076482161-42ce6da69f67?w=800&q=80',1),
('Numaralı Gözlük','numarali-gozluk','Reçetenize özel cam ve çerçeve ile net, konforlu görüş.','Numaralı gözlüğünüzü reçetenize ve yüz hatlarınıza en uygun şekilde hazırlıyoruz. Anti-reflit, çizilmeye dayanıklı, mavi ışık filtreli ve incelttirilmiş cam seçenekleri sunuyoruz. Tek odaklı, bifokal ve progresif (multifokal) cam çözümleriyle her ihtiyaca yanıt veriyoruz. Çerçeve seçiminde uzman danışmanlık alabilirsiniz.','bi-eyeglasses','https://images.unsplash.com/photo-1574258495973-f010dfbb5371?w=800&q=80',2),
('Güneş Gözlüğü','gunes-gozlugu','Dünya markası, UV korumalı numaralı ve numarasız güneş gözlükleri.','Lüks ve günlük dünya markalarından oluşan geniş güneş gözlüğü koleksiyonumuzla hem gözlerinizi UV ışınlarından koruyun hem de tarzınızı yansıtın. Numaralı güneş gözlüğü ve polarize cam seçenekleri mevcuttur. Sezonun trend modelleri mağazamızda sizi bekliyor.','bi-sun','https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800&q=80',3),
('Kontakt Lens','kontakt-lens','Günlük, aylık ve renkli lenslerde uzman ölçüm ve danışmanlık.','Numaralı, renkli, günlük ve aylık kontakt lens çeşitlerimizle özgürce görün. Uzman optisyenlerimiz lens ölçümünüzü yapar, kullanım ve hijyen konusunda sizi bilgilendirir. İlk kez lens kullanacaklar için uygulamalı eğitim veriyoruz. Astigmat ve multifokal lens seçenekleri de mevcuttur.','bi-circle','https://images.unsplash.com/photo-1606122017369-d782bbb78f32?w=800&q=80',4),
('Çocuk Gözlükleri','cocuk-gozlukleri','Dayanıklı, esnek ve sevimli çocuk gözlüğü çözümleri.','Çocuklarınızın aktif yaşamına uygun, esnek ve kırılmaya dayanıklı çerçeveler sunuyoruz. Hafif ve güvenli cam seçenekleri, eğlenceli renkler ve karakterli modellerle çocuğunuzun gözlük takmasını keyifli hale getiriyoruz. Çocuk göz sağlığı için doğru numara ve konfor önceliğimizdir.','bi-emoji-smile','https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?w=800&q=80',5),
('Cam Değişimi & Tamir','cam-degisimi-tamir','Çerçevenizi koruyun; cam yenileme ve hızlı gözlük tamiri.','Beğendiğiniz çerçeveyi atmadan camlarınızı yenileyebilirsiniz. Numara değişikliği, kırılan cam veya çizilen cam için hızlı cam değişimi yapıyoruz. Vida sıkma, burunluk değişimi, menteşe tamiri gibi küçük onarımları çoğu zaman aynı gün tamamlıyoruz. Çerçeve ayarı ücretsizdir.','bi-tools','https://images.unsplash.com/photo-1503443207922-dff7d543fd0e?w=800&q=80',6);

-- ============ PROJELER / MARKALAR & GALERİ ============
DROP TABLE IF EXISTS `projeler`;
CREATE TABLE `projeler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180),
  `kategori` VARCHAR(60),
  `gorsel` VARCHAR(255),
  `aciklama` TEXT,
  `tarih` VARCHAR(40),
  `sira` INT DEFAULT 0,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `projeler` (`baslik`,`slug`,`kategori`,`gorsel`,`aciklama`,`tarih`,`sira`) VALUES
('Optik Çerçeve Koleksiyonu','optik-cerceve-koleksiyonu','Numaralı Gözlük','https://images.unsplash.com/photo-1574258495973-f010dfbb5371?w=800&q=80','Klasikten modern tasarıma, asetat ve metal çerçevelerden oluşan geniş numaralı gözlük koleksiyonumuz.','Yeni Sezon',1),
('Güneş Gözlüğü Vitrini','gunes-gozlugu-vitrini','Güneş Gözlüğü','https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=800&q=80','Polarize ve UV korumalı, dünya markası lüks ve günlük güneş gözlüğü modelleri.','Yeni Sezon',2),
('Mağaza & Showroom','magaza-showroom','Mağazamız','https://images.unsplash.com/photo-1556015048-4d3aa10df74c?w=800&q=80','Ferah ve modern showroomumuzda yüzlerce modeli deneme imkanı ve uzman danışmanlık.','Mağaza',3),
('Bilgisayarlı Göz Tahlili Ünitesi','goz-tahlili-unitesi','Göz Tahlili','https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=800&q=80','Son teknoloji otorefraktometre cihazımızla hassas ve hızlı görme ölçümü.','Mağaza',4),
('Kontakt Lens Reyonu','kontakt-lens-reyonu','Kontakt Lens','https://images.unsplash.com/photo-1606122017369-d782bbb78f32?w=800&q=80','Günlük, aylık, renkli ve numaralı lens çeşitleriyle dolu reyonumuz.','Mağaza',5),
('Çocuk Gözlük Köşesi','cocuk-gozluk-kosesi','Çocuk','https://images.unsplash.com/photo-1518831959646-742c3a14ebf7?w=800&q=80','Esnek, dayanıklı ve renkli modellerle çocuklara özel gözlük köşemiz.','Mağaza',6);

-- ============ BLOG ============
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `baslik` VARCHAR(200) NOT NULL,
  `slug` VARCHAR(200),
  `kategori` VARCHAR(60),
  `ozet` TEXT,
  `icerik` LONGTEXT,
  `gorsel` VARCHAR(255),
  `tarih` DATE,
  `durum` TINYINT DEFAULT 1,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blog` (`baslik`,`slug`,`kategori`,`ozet`,`icerik`,`gorsel`,`tarih`) VALUES
('Mavi Işık Filtreli Cam Gerçekten Gerekli mi?','mavi-isik-filtreli-cam','Göz Sağlığı','Ekran başında uzun saatler geçirenler için mavi ışık filtreli camların faydalarını inceledik.','Bilgisayar, telefon ve tablet ekranlarından yayılan mavi ışık, uzun süreli maruziyette göz yorgunluğu, kuruluk ve uyku düzeninde bozulmaya yol açabilir. Mavi ışık filtreli (blue cut) camlar bu ışığın bir kısmını süzerek göz konforunu artırır. Özellikle ofis çalışanları, öğrenciler ve dijital cihazları yoğun kullananlar için önerilir. Numaralı veya numarasız olarak hazırlanabilir. Uzman optisyenlerimiz kullanım alışkanlığınıza göre en uygun cam tipini önerir.','https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=800&q=80','2026-05-18'),
('Yüz Şeklinize Uygun Gözlük Çerçevesi Nasıl Seçilir?','yuz-sekline-gore-cerceve','Stil Rehberi','Yuvarlak, kare, oval ya da kalp yüz... Her yüz şekline yakışan çerçeve modellerini derledik.','Doğru çerçeve, hem görüşünüzü hem de tarzınızı tamamlar. Yuvarlak yüzlere köşeli ve dikdörtgen çerçeveler hatları belirginleştirir. Kare yüzlere yuvarlak ve oval çerçeveler yumuşaklık katar. Oval yüzler çoğu modele uyum sağlar. Kalp yüzlere alt kısmı geniş, hafif çerçeveler önerilir. Cilt tonunuz ve saç renginiz de çerçeve rengi seçiminde etkilidir. Mağazamızda uzman danışmanlarımız yüz hatlarınıza en yakışan modelleri birlikte seçmenize yardımcı olur.','https://images.unsplash.com/photo-1508296695146-257a814070b4?w=800&q=80','2026-04-25'),
('Kontakt Lens Kullanımında Hijyen Kuralları','kontakt-lens-hijyen','Bilgi','Sağlıklı lens kullanımı için uyulması gereken temel hijyen kurallarını sizin için sıraladık.','Kontakt lens kullanırken göz sağlığınızı korumak için hijyen şarttır. Lensi takmadan ve çıkarmadan önce ellerinizi mutlaka sabunla yıkayın. Lens solüsyonunu her gün yenileyin, asla su veya tükürükle temizlemeyin. Lens kutusunu düzenli olarak değiştirin. Lensle uyumayın (gece lensleri hariç) ve kullanım süresini aşmayın. Gözde kızarıklık, yanma veya bulanıklık olursa lensi çıkarıp optisyeninize danışın. Düzenli göz kontrolü ihmal edilmemelidir.','https://images.unsplash.com/photo-1606122017369-d782bbb78f32?w=800&q=80','2026-03-30');

-- ============ REFERANSLAR (MÜŞTERİ YORUMLARI) ============
DROP TABLE IF EXISTS `referanslar`;
CREATE TABLE `referanslar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100) NOT NULL,
  `unvan` VARCHAR(120),
  `yorum` TEXT,
  `foto` VARCHAR(255),
  `yildiz` TINYINT DEFAULT 5,
  `durum` TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `referanslar` (`ad`,`unvan`,`yorum`,`foto`,`yildiz`) VALUES
('Selin Kaya','Müşteri','Göz tahlilim ücretsiz yapıldı ve numaram çok hassas ölçüldü. Optisyen bey yüzüme en yakışan çerçeveyi sabırla seçmeme yardım etti. Gözlüğüm bir günde hazırdı, çok memnunum.','https://i.pravatar.cc/100?img=45',5),
('Burak Şahin','Müşteri','Progresif camlı gözlüğümü buradan aldım, uyum süreci çok rahat geçti. Hem fiyat hem ürün kalitesi açısından gönül rahatlığıyla tavsiye ederim.','https://i.pravatar.cc/100?img=13',5),
('Elif Demir','Müşteri','İlk kez kontakt lens kullanacaktım, bana uygulamalı olarak takıp çıkarmayı öğrettiler. İlgi ve uzmanlık tam not. Renkli lens seçenekleri de çok güzel.','https://i.pravatar.cc/100?img=47',5);

-- ============ MESAJLAR ============
DROP TABLE IF EXISTS `mesajlar`;
CREATE TABLE `mesajlar` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `konu` VARCHAR(200),
  `mesaj` TEXT,
  `okundu` TINYINT DEFAULT 0,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ TEKLİFLER (RANDEVU / GÖZ TAHLİLİ TALEPLERİ) ============
DROP TABLE IF EXISTS `teklifler`;
CREATE TABLE `teklifler` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `ad` VARCHAR(100),
  `mail` VARCHAR(150),
  `tel` VARCHAR(40),
  `hizmet` VARCHAR(120),
  `il` VARCHAR(60),
  `adres` VARCHAR(255),
  `alan` VARCHAR(60),
  `butce` VARCHAR(60),
  `baslangic` VARCHAR(60),
  `detay` TEXT,
  `durum` ENUM('yeni','degerlendiriliyor','teklif_verildi','kazanildi','kaybedildi') DEFAULT 'yeni',
  `notlar` TEXT,
  `tarih` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============ ADMIN ============
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `kullanici` VARCHAR(60) NOT NULL UNIQUE,
  `sifre_hash` VARCHAR(255) NOT NULL,
  `ad_soyad` VARCHAR(120),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Şifre: admin123  (password_hash bcrypt) — CANLIDA MUTLAKA DEĞİŞTİR
INSERT INTO `admin` (`kullanici`,`sifre_hash`,`ad_soyad`) VALUES
('admin','$2y$10$6gNrpOXRLof.Toy.Ugy.yu4DrKP23OcnJa7UBhKOH1iMxbtH8GK0.','Yönetici');

SET FOREIGN_KEY_CHECKS = 1;
