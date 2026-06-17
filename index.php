<?php
require_once __DIR__ . '/inc/header.php';
$hizmetler = getList('hizmetler','durum=1','sira ASC');
$projeler  = getList('projeler','durum=1','sira ASC',6);
$referanslar = getList('referanslar','durum=1','id ASC');
$blogYazi  = getList('blog','durum=1','tarih DESC',3);
?>

<section class="hero">
  <div class="container">
    <div class="row align-items-center g-5">
      <div class="col-lg-6">
        <span class="hero-badge"><i class="bi bi-circle-fill"></i> Net Görüş · Şık Tasarım · Uzman Optisyen</span>
        <h1>Net Bir Bakış,<br>Şık Bir <span>Tarz</span>.</h1>
        <p><?= e(ayar('site_aciklama')) ?></p>
        <div class="hero-cta">
          <a href="<?= SITE_URL ?>/teklif" class="btn btn-orange">Ücretsiz Göz Tahlili <i class="bi bi-arrow-right ms-2"></i></a>
          <a href="<?= SITE_URL ?>/hizmetler" class="btn btn-line">Hizmetlerimiz</a>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="hero-visual">
          <img src="https://images.unsplash.com/photo-1577744486770-020ab432da65?w=900&q=85" alt="Vizyon Optik">
          <div class="hero-float">
            <i class="bi bi-eye"></i>
            <div><strong>Ücretsiz Göz Tahlili</strong><small>Bilgisayarlı hassas ölçüm</small></div>
          </div>
          <div class="hero-float top">
            <i class="bi bi-patch-check"></i>
            <div><strong>Dünya Markaları</strong><small>Orijinal ürün garantisi</small></div>
          </div>
        </div>
      </div>
    </div>
    <div class="hero-meta">
      <div class="row g-3">
        <div class="col-md-4 col-12"><div class="meta-item"><i class="bi bi-award-fill"></i><div><strong><?= e(ayar('yil')) ?>+ Yıl Tecrübe</strong><small>Alanında uzman kadro</small></div></div></div>
        <div class="col-md-4 col-12"><div class="meta-item"><i class="bi bi-eyeglasses"></i><div><strong>Geniş Koleksiyon</strong><small>Numaralı, güneş & lens</small></div></div></div>
        <div class="col-md-4 col-12"><div class="meta-item"><i class="bi bi-clock-history"></i><div><strong>Aynı Gün Teslim</strong><small>Çoğu gözlükte hızlı teslim</small></div></div></div>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="container">
    <div class="row align-items-center g-5">
      <div class="col-lg-6">
        <div class="about-img-wrap">
          <img src="https://images.unsplash.com/photo-1556015048-4d3aa10df74c?w=900&q=85" alt="">
          <div class="exp-badge"><span class="num"><?= e(ayar('yil')) ?>+</span><span class="lbl">Yıllık Tecrübe</span></div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="section-head">
          <span class="mini">Hakkımızda</span>
          <h2>Net Görüş,<br><span>Şık Tasarım</span></h2>
          <p class="desc"><?= e(ayar('hakkimizda_kisa')) ?></p>
        </div>
        <ul class="about-features">
          <li><i class="bi bi-check"></i> Ücretsiz Bilgisayarlı Göz Tahlili</li>
          <li><i class="bi bi-check"></i> Uzman Optisyen Danışmanlığı</li>
          <li><i class="bi bi-check"></i> Dünya Markası Çerçeve & Cam</li>
          <li><i class="bi bi-check"></i> Anti-reflit & Mavi Işık Filtreli Cam</li>
        </ul>
        <a href="<?= SITE_URL ?>/hakkimizda" class="btn btn-orange mt-4">Daha Fazla <i class="bi bi-arrow-right ms-2"></i></a>
      </div>
    </div>
  </div>
</section>

<section class="services-grid">
  <div class="container">
    <div class="section-head center">
      <span class="mini">Hizmetlerimiz</span>
      <h2>Sunduğumuz <span>Optik Hizmetler</span></h2>
      <p class="desc">Göz tahlilinden numaralı gözlüğe, kontakt lensten güneş gözlüğüne kadar her ihtiyaca uzman çözüm.</p>
    </div>
    <div class="row g-4">
      <?php foreach($hizmetler as $h): ?>
      <div class="col-lg-4 col-md-6">
        <div class="service-card">
          <div class="icon"><i class="bi <?= e($h['ikon']) ?>"></i></div>
          <h4><?= e($h['baslik']) ?></h4>
          <p><?= e($h['ozet']) ?></p>
          <a href="<?= SITE_URL ?>/hizmet-detay?slug=<?= e($h['slug']) ?>">Detay <i class="bi bi-arrow-right"></i></a>
        </div>
      </div>
      <?php endforeach; ?>
      <div class="col-lg-4 col-md-6">
        <a href="<?= SITE_URL ?>/teklif" class="service-card d-flex align-items-center justify-content-center text-decoration-none" style="background:var(--dark);color:#fff;min-height:100%">
          <div class="text-center">
            <i class="bi bi-arrow-up-right" style="font-size:2.5rem;color:var(--primary)"></i>
            <h4 style="color:#fff;margin-top:1rem">Randevu Al</h4>
            <p style="color:#9ca3af;margin:0">Ücretsiz göz tahlili için tıklayın</p>
          </div>
        </a>
      </div>
    </div>
  </div>
</section>

<section class="stats">
  <div class="container">
    <div class="row g-4">
      <div class="col-md-3 col-6"><div class="stat"><i class="bi bi-award-fill"></i><h3><?= e(ayar('yil')) ?>+</h3><p>Yıllık Tecrübe</p></div></div>
      <div class="col-md-3 col-6"><div class="stat"><i class="bi bi-eyeglasses"></i><h3><?= e(ayar('proje_sayi')) ?>+</h3><p>Hazırlanan Gözlük</p></div></div>
      <div class="col-md-3 col-6"><div class="stat"><i class="bi bi-people-fill"></i><h3><?= e(ayar('musteri_sayi')) ?>+</h3><p>Mutlu Müşteri</p></div></div>
      <div class="col-md-3 col-6"><div class="stat"><i class="bi bi-person-badge"></i><h3><?= e(ayar('personel_sayi')) ?>+</h3><p>Uzman Optisyen</p></div></div>
    </div>
  </div>
</section>

<section>
  <div class="container">
    <div class="section-head d-flex justify-content-between align-items-end flex-wrap">
      <div>
        <span class="mini">Galeri</span>
        <h2>Koleksiyon & <span>Mağazamız</span></h2>
      </div>
      <a href="<?= SITE_URL ?>/projeler" class="btn btn-orange">Tüm Galeri <i class="bi bi-arrow-right ms-2"></i></a>
    </div>
    <div class="row g-4">
      <?php foreach($projeler as $p): ?>
      <div class="col-lg-4 col-md-6">
        <a class="proj" href="<?= SITE_URL ?>/proje-detay?slug=<?= e($p['slug']) ?>">
          <img src="<?= e($p['gorsel']) ?>" alt="<?= e($p['baslik']) ?>">
          <div class="proj-info">
            <span class="cat"><?= e($p['kategori']) ?> · <?= e($p['tarih']) ?></span>
            <h5><?= e($p['baslik']) ?></h5>
          </div>
        </a>
      </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<section style="background:#f4f4f5">
  <div class="container">
    <div class="section-head center">
      <span class="mini">Referanslar</span>
      <h2>Müşterilerimiz <span>Ne Diyor?</span></h2>
    </div>
    <div class="row g-4">
      <?php foreach($referanslar as $r): ?>
      <div class="col-lg-4 col-md-6">
        <div class="testi">
          <div class="stars"><?= str_repeat('★',(int)$r['yildiz']) ?></div>
          <p>"<?= e($r['yorum']) ?>"</p>
          <div class="testi-user">
            <img src="<?= e($r['foto']) ?>" alt="">
            <div><h6><?= e($r['ad']) ?></h6><span><?= e($r['unvan']) ?></span></div>
          </div>
        </div>
      </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<section class="cta-strip">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-8"><h3>Ücretsiz göz tahliliniz için randevu alın</h3><p>Uzman optisyenlerimiz numaranızı ölçsün, size en uygun cam ve çerçeveyi birlikte seçelim.</p></div>
      <div class="col-lg-4 text-lg-end mt-3 mt-lg-0"><a href="<?= SITE_URL ?>/teklif" class="btn">Randevu Al <i class="bi bi-arrow-right ms-2"></i></a></div>
    </div>
  </div>
</section>

<section style="padding-top:30px">
  <div class="container">
    <div class="section-head center">
      <span class="mini">Blog</span>
      <h2>Göz Sağlığı & <span>Stil Rehberi</span></h2>
    </div>
    <div class="row g-4">
      <?php foreach($blogYazi as $b): ?>
      <div class="col-lg-4 col-md-6">
        <div class="blog-card">
          <div class="img">
            <img src="<?= e($b['gorsel']) ?>" alt="">
            <span class="cat"><?= e($b['kategori']) ?></span>
          </div>
          <div class="blog-body">
            <div class="meta"><i class="bi bi-calendar3"></i><?= trTarih($b['tarih']) ?></div>
            <h5><a href="<?= SITE_URL ?>/blog-detay?slug=<?= e($b['slug']) ?>"><?= e($b['baslik']) ?></a></h5>
            <p><?= e($b['ozet']) ?></p>
          </div>
        </div>
      </div>
      <?php endforeach; ?>
    </div>
  </div>
</section>

<?php require_once __DIR__ . '/inc/iletisim-bolumu.php'; ?>

<?php require_once __DIR__ . '/inc/footer.php'; ?>
