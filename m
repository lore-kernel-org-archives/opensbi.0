Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C3CC43458
	for <opensbi@archiver.kernel.org>; Wed,  1 Jul 2026 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEAzEMPV4nLoYMXV05k4TW7RUGRVZdGmuX/DSHYXOHI=; b=Asiw+74Y39Xpqz
	/kbKIKHBOSrPwVx99PiqzoF7kTl2fRCaRQtYAOvbUXtxq9fTv90KAa5Xkqt52f46mp8IBhcGtOMOM
	K817GDOzkaVrmpzmxFshNACQCcT0GNOifb0MI0JbvVyvm+jcMnWvOjXcr86dWa6iUuTC4Huc7hWek
	ZqZU2crHCqJ8k55evfi76ZB97XSwtQ7tEiduaWWgaFcbvqLlEyLprqd6Rq1x9yTV7cpQhukamoBKi
	ekPqmYgh4egaP1g6ZNpj7UlamdW188ovXU4T5w2qMy3o98UErDQCe16soK9zItaZZM2p12o9XfC7w
	mw8bRUErrdDbe8vTI4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexRE-00000002U9r-02wE;
	Wed, 01 Jul 2026 16:05:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexRA-00000002U9O-41pq
	for opensbi@lists.infradead.org;
	Wed, 01 Jul 2026 16:05:22 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5aeae771c49so795484e87.3
        for <opensbi@lists.infradead.org>; Wed, 01 Jul 2026 09:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782921918; cv=none;
        d=google.com; s=arc-20260327;
        b=SgQWcqoDcrGqKYQAGKSl1xA4ScU6eX8ylKS3IzaVwnA+WjTFplDVkiHqTcFYvVYukO
         QAQn7JZbwDtZ35fk62afP325vpa5cWAzmF1i81xJgSfbcHiNSAxBXA4/mpqcRYwtw8j6
         nZhxRTwmzhDdw0llHHb35ig7Z8xXBTBz+aJvNkPyTiVJcRGrZks4jvn2Hiyal6/7Bqf5
         A4HOFvT1MMpc0F5f8ezggQ0LWwupZMOT6GQUzboZK6CiEw0+CDAZmM9ONlFNOaTSxWyL
         fL7Es9VyArSo+SHR5oLT0Yi+xMGcdlWrvyZyckp+M8AZfYZ020lTSyZaKl2kRxfjW8+s
         Fuvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n8G/wXsr11l8PthweR2ym9RhZLJxwzQOVdalvNyhaNE=;
        fh=k30hSMoZ0oeooQv8Jfqd2uU9T9iKy5U5AEKe8HKmXIE=;
        b=Xpyf96Fc7pOOvNulJ0gwdJ8EIFY0n4OGteH3lZzdtKXuRXZpgml/lRXMbd7dEuatde
         db+bljais7lTEhsCQQbQtWrvS8dGXpLP4xjoGYwTWuRdnep1olDqUp4rd54I4iCSwjd3
         ciefijwLcT5jQ8Ps+kZeRurgWBbwokOyo1XdVp/1bEFdyN/gFCAuQwndp7BhhadXE2HE
         ZbjCuC2vKvW9rHQplsHVn1SOqclvgEGyioYD6npBuJ2dr6KeoEF1k2IqdOCGPggvFSJn
         tW8B4lXWMUtOhCL2tAqbJT05pv1BCML/LPFE+Ii188BM0DzXeRoe6Pg5OK3u1d57NDIo
         EFRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1782921918; x=1783526718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8G/wXsr11l8PthweR2ym9RhZLJxwzQOVdalvNyhaNE=;
        b=QzoMDiK8k9jT0PkXT6qJ77k1KX+tqUwaF3T7brjp0U3vMpeFpzW/1dFpEKOICfebm8
         0NBz9jJFmtCzH1T/bXw2yKbc/mlOLSYBy/NGphcCqzJwGLE+0vV+t3M6XRS4feavJN3x
         /gEYJfzyyidbpXNKWna8lbmF0BOT4/WUvU6EoNVCNdBAYwQ4srohKj/Zs1CQneHOJU75
         o8l6R5AelrNC5DjdtgEm8aWzNBp0VQ/ZsOnb+6pVsvXORszMcnWc38rk2UflFHd9xhnF
         puuNcEn7uTl5Q5x0b3bMd+CGVMxL+gPvtIzfeFa/NgoRdhfrf28Tc36IqpAIoRlUqbkJ
         51Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921918; x=1783526718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n8G/wXsr11l8PthweR2ym9RhZLJxwzQOVdalvNyhaNE=;
        b=KTNl+X3Cy6S+GCty/o202ovKjudoAhKkXiigQ7YF2GzQNKUPJ96WkVcT3M98qgrvg0
         U//mzIWI+zzqMk0PFTOLPmrHG9j2o4U7gVKRyPcWicPaX05NGL/Aa/2/B21h7QXWdeIW
         lchEJhu9wkbPIzHSJf14bzuWiMiUCt0QMKPafwi4fjqGPuzmbAm6prlBVCnjGanNJ6hU
         Twfm4McFRdJdfi558kQOnAjjqr8ZT5ER00IPUpSlCjqg3Y1Q7nc2/nELxQS8NR841/E3
         ahctic7t/7k+FnTewgKbmxyheVBQjMr+HuNiRuohj0dcIIxTJs8kBqVkKcNO9O/Mm1+h
         Qw8Q==
X-Gm-Message-State: AOJu0YzRcp6qRYomnH7bbfmrJ4r9EoY2TLDIcGZ5f5x9NeVvQSxASteM
	vz6HJArKbUAI4M1a6/gdYrJtzKpjwmJvHm/jGslXXqxH1OzMVEtS7iJfba0v/E+D5AAxrVCKaHf
	WQk8LTz6ZZYioxMl41JdtCzqcaZ/duYYNpjTxlvsE004r6Hn2DcEGQ6E=
X-Gm-Gg: AfdE7cnclbfadA2KfD07QLFb5elxvSmiqy3BdtWVnhN1MpHKWA7wdQz8LxtYumMF+dH
	suOuZ5YyScVXosXMgUPprC5DS1ZMDZGaBaoFMZLfStQwhkrL9RZd1eOOY2fjdfCQvvrw7+TfGkO
	tFFIv3xfqtckPpcSrjDwwOw31/3GalodpOBGOVwYyeiNCBhMFNrmvpNnHueghAYXKcFDsBh6ST2
	J8iQhMNmSAMO67pwgkviPEtXe2Mwj/LZnG1ISBa4yYDkSly10qXoCHN1+UEZeaPN5J0Q9jpcGLE
	sRGIgoQX5Nw/5lUwjGKBwSOgv5hmPYU=
X-Received: by 2002:a05:6512:671c:b0:5ae:ba40:ae6d with SMTP id
 2adb3069b0e04-5aec67a3d1amr510226e87.16.1782921918277; Wed, 01 Jul 2026
 09:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260619103424.990954-1-subrahmanya.lingappa@oss.qualcomm.com>
In-Reply-To: <20260619103424.990954-1-subrahmanya.lingappa@oss.qualcomm.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 1 Jul 2026 21:35:06 +0530
X-Gm-Features: AVVi8CdzcVLodgzPflCL-1wTSUnnfXTK_WEvyjLkAP6JxTFTotbdhdhKYC9HtaU
Message-ID: <CAK9=C2XzXseep+tV0k7+JuA2Sg1A0BpaRGEHneFZ6qKamWKL=A@mail.gmail.com>
Subject: Re: [PATCH v5] lib: utils: Add Logging service group handlers
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Rahul Pathak <rahul.pathak@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090521_062195_826D26D5 
X-CRM114-Status: GOOD (  22.59  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMTksIDIwMjYgYXQgNDowNeKAr1BNIFN1YnJhaG1hbnlhIExpbmdhcHBhCjxz
dWJyYWhtYW55YS5saW5nYXBwYUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEFkZCB2YXJp
b3VzIHNlcnZpY2VzIG9mIExPR0dJTkcgc2VydmljZSBncm91cAo+Cj4gVGhlIHNlcnZpY2UgaXMg
ZXhwb3J0ZWQgb24gTVBYWSB3aXRoIFJQTUkgYXMgYmFja2VuZC4KClRoZSBwYXRjaCBzdWJqZWN0
IGFuZCBkZXNjcmlwdGlvbiBpcyBvdmVyIHNpbXBsaWZpZWQuIEkgd2lsbCByZXdyaXRlCnRoaXMg
YXQgdGhlIHRpbWUgb2YgbWVyZ2luZyB0aGlzIHBhdGNoLgoKQXBwbGllZCB0aGlzIHBhdGNoIHRv
IHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4KPiBSZXZpZXdlZC1ieTog
UmFodWwgUGF0aGFrIDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBTdWJyYWhtYW55YSBMaW5nYXBwYSA8c3VicmFobWFueWEubGluZ2FwcGFAb3NzLnF1YWxj
b21tLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3Qu
aCB8IDE5ICsrKysrKysrKwo+ICBsaWIvdXRpbHMvbXB4eS9LY29uZmlnICAgICAgICAgICAgICAg
ICAgIHwgIDQgKysKPiAgbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9sb2dnaW5nLmMgICB8
IDUxICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICBsaWIvdXRpbHMvbXB4eS9vYmplY3RzLm1r
ICAgICAgICAgICAgICAgIHwgIDMgKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNv
bmZpZyAgICAgICB8ICAxICsKPiAgNSBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2xvZ2dpbmcu
Ywo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpX3V0aWxzL21haWxib3gvcnBtaV9tc2dwcm90
LmggYi9pbmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oCj4gaW5kZXggNGZl
YzY0MDIuLmFlYWVlNTc1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpX3V0aWxzL21haWxib3gv
cnBtaV9tc2dwcm90LmgKPiArKysgYi9pbmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNn
cHJvdC5oCj4gQEAgLTIyMSw2ICsyMjEsNyBAQCBlbnVtIHJwbWlfc2VydmljZWdyb3VwX2lkIHsK
PiAgICAgICAgIFJQTUlfU1JWR1JQX0RFVklDRV9QT1dFUiA9IDB4MDAwOSwKPiAgICAgICAgIFJQ
TUlfU1JWR1JQX1BFUkZPUk1BTkNFID0gMHgwMDAwQSwKPiAgICAgICAgIFJQTUlfU1JWR1JQX01B
TkFHRU1FTlRfTU9ERSA9IDB4MDAwQiwKPiArICAgICAgIFJQTUlfU1JWR1JQX0xPR0dJTkcgPSAw
eDAwMEUsCj4gICAgICAgICBSUE1JX1NSVkdSUF9JRF9NQVhfQ09VTlQsCj4KPiAgICAgICAgIC8q
IFJlc2VydmVkIHJhbmdlIGZvciBzZXJ2aWNlIGdyb3VwcyAqLwo+IEBAIC0xMDMyLDQgKzEwMzMs
MjIgQEAgc3RydWN0IHJwbWlfcmFzX3N5bmNfZXJyX3Jlc3Agewo+ICAgICAgICAgdTMyIHBlbmRp
bmdfdmVjc1tNQVhfUEVORF9WRUNTXTsKPiAgfTsKPgo+ICsvKiogUlBNSSBMT0dHSU5HIFNlcnZp
Y2VHcm91cCBTZXJ2aWNlIElEcyAqLwo+ICtlbnVtIHJwbWlfbG9nZ2luZ19zZXJ2aWNlX2lkIHsK
PiArICAgICAgIFJQTUlfTE9HR0lOR19TUlZfRU5BQkxFX05PVElGSUNBVElPTiA9IDB4MDEsCj4g
KyAgICAgICBSUE1JX0xPR0dJTkdfU1JWX0xPR19EQVRBID0gMHgwMiwKPiArICAgICAgIFJQTUlf
TE9HR0lOR19TUlZfTUFYX0NPVU5ULAo+ICt9Owo+ICsKPiArc3RydWN0IHJwbWlfbG9nZ2luZ19s
b2dfZGF0YV9yZXEgewo+ICsgICAgICAgdTMyIHR5cGU7Cj4gKyAgICAgICB1MzIgbnVtX2R3b3Jk
czsKPiArI2RlZmluZSBNQVhfTE9HR0lOR19ETEVOICAoKFJQTUlfTVNHX0RBVEFfU0laRShSUE1J
X1NMT1RfU0laRV9NSU4pIC0gKHNpemVvZih1MzIpICogMikpIC8gc2l6ZW9mKHUzMikpCj4gKyAg
ICAgICB1MzIgZGF0YVtNQVhfTE9HR0lOR19ETEVOXTsKPiArfTsKPiArCj4gK3N0cnVjdCBycG1p
X2xvZ2dpbmdfbG9nX2RhdGFfcmVzcCB7Cj4gKyAgICAgICBzMzIgc3RhdHVzOwo+ICt9Owo+ICsK
PiAgI2VuZGlmIC8qICFfX1JQTUlfTVNHUFJPVF9IX18gKi8KPiBkaWZmIC0tZ2l0IGEvbGliL3V0
aWxzL21weHkvS2NvbmZpZyBiL2xpYi91dGlscy9tcHh5L0tjb25maWcKPiBpbmRleCAxYTM4Yjc5
Mi4uYTNlZDFjMjIgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL21weHkvS2NvbmZpZwo+ICsrKyBi
L2xpYi91dGlscy9tcHh5L0tjb25maWcKPiBAQCAtMTgsNiArMTgsMTAgQEAgY29uZmlnIEZEVF9N
UFhZX1JQTUlfQ0xPQ0sKPiAgICAgICAgIGJvb2wgIk1QWFkgZHJpdmVyIGZvciBSUE1JIGNsb2Nr
IHNlcnZpY2UgZ3JvdXAiCj4gICAgICAgICBkZWZhdWx0IG4KPgo+ICtjb25maWcgRkRUX01QWFlf
UlBNSV9MT0dHSU5HCj4gKyAgICAgICBib29sICJNUFhZIGRyaXZlciBmb3IgUlBNSSBsb2dnaW5n
IHNlcnZpY2UgZ3JvdXAiCj4gKyAgICAgICBkZWZhdWx0IG4KPiArCj4gIGNvbmZpZyBGRFRfTVBY
WV9SUE1JX1NZU01TSQo+ICAgICAgICAgYm9vbCAiTVBYWSBkcml2ZXIgZm9yIFJQTUkgc3lzdGVt
IE1TSSBzZXJ2aWNlIGdyb3VwIgo+ICAgICAgICAgZGVmYXVsdCBuCj4gZGlmZiAtLWdpdCBhL2xp
Yi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfbG9nZ2luZy5jIGIvbGliL3V0aWxzL21weHkvZmR0
X21weHlfcnBtaV9sb2dnaW5nLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwLi5lOGYwODVlYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9saWIvdXRpbHMvbXB4eS9mZHRf
bXB4eV9ycG1pX2xvZ2dpbmcuYwo+IEBAIC0wLDAgKzEsNTEgQEAKPiArLyoKPiArICogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMp
IDIwMjYgUXVhbGNvbW0sIEluYwo+ICsgKgo+ICsgKiBBdXRob3JzOgo+ICsgKiAgIFN1YnJhaG1h
bnlhIExpbmdhcHBhIDxzdWJyYWhtYW55YS5saW5nYXBwYUBvc3MucXVhbGNvbW0uY29tPgo+ICsg
Ki8KPiArCj4gKyNpbmNsdWRlIDxzYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX21ib3guaD4K
PiArCj4gK3N0YXRpYyBzdHJ1Y3QgbXB4eV9ycG1pX3NlcnZpY2VfZGF0YSBsb2dnaW5nX3NlcnZp
Y2VzW10gPSB7Cj4gKyAgICAgICBbMF0gPSB7Cj4gKyAgICAgICAgICAgICAgIC5pZCA9IFJQTUlf
TU1fU1JWX0VOQUJMRV9OT1RJRklDQVRJT04sCj4gKyAgICAgICAgICAgICAgIC5taW5fdHhfbGVu
ID0gc2l6ZW9mKHN0cnVjdCBycG1pX2VuYWJsZV9ub3RpZmljYXRpb25fcmVxKSwKPiArICAgICAg
ICAgICAgICAgLm1heF90eF9sZW4gPSBzaXplb2Yoc3RydWN0IHJwbWlfZW5hYmxlX25vdGlmaWNh
dGlvbl9yZXEpLAo+ICsgICAgICAgICAgICAgICAubWluX3J4X2xlbiA9IHNpemVvZihzdHJ1Y3Qg
cnBtaV9lbmFibGVfbm90aWZpY2F0aW9uX3Jlc3ApLAo+ICsgICAgICAgICAgICAgICAubWF4X3J4
X2xlbiA9IHNpemVvZihzdHJ1Y3QgcnBtaV9lbmFibGVfbm90aWZpY2F0aW9uX3Jlc3ApLAo+ICsg
ICAgICAgfSwKPiArICAgICAgIFsxXSA9IHsKPiArICAgICAgICAgICAgICAgLmlkID0gUlBNSV9M
T0dHSU5HX1NSVl9MT0dfREFUQSwKPiArICAgICAgICAgICAgICAgLm1pbl90eF9sZW4gPSBzaXpl
b2YodTMyKSAqIDIsCj4gKyAgICAgICAgICAgICAgIC5tYXhfdHhfbGVuID0gc2l6ZW9mKHN0cnVj
dCBycG1pX2xvZ2dpbmdfbG9nX2RhdGFfcmVxKSwKPiArICAgICAgICAgICAgICAgLm1pbl9yeF9s
ZW4gPSBzaXplb2Yoc3RydWN0IHJwbWlfbG9nZ2luZ19sb2dfZGF0YV9yZXNwKSwKPiArICAgICAg
ICAgICAgICAgLm1heF9yeF9sZW4gPSBzaXplb2Yoc3RydWN0IHJwbWlfbG9nZ2luZ19sb2dfZGF0
YV9yZXNwKSwKPiArICAgICAgIH0sCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogS2VlcCBhIGxv
Y2FsIHRlcm1pbmF0b3IgZm9yIHNhZmUgbG9va3VwIGJlY2F1c2Ugb25seSBzZXJ2aWNlIElEIDB4
MDIKPiArICAgICAgICAqIGlzIGludGVudGlvbmFsbHkgZXhwb3NlZCBieSB0aGlzIE1QWFkgc2Vy
dmljZSBncm91cCBoYW5kbGVyLgo+ICsgICAgICAgICovCj4gKyAgICAgICBbMl0gPSB7Cj4gKyAg
ICAgICAgICAgICAgIC5pZCA9IFJQTUlfTE9HR0lOR19TUlZfTUFYX0NPVU5ULAo+ICsgICAgICAg
fSwKPiArfTsKPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXB4eV9ycG1pX21ib3hfZGF0YSBs
b2dnaW5nX2RhdGEgPSB7Cj4gKyAgICAgICAuc2VydmljZWdycF9pZCA9IFJQTUlfU1JWR1JQX0xP
R0dJTkcsCj4gKyAgICAgICAubnVtX3NlcnZpY2VzID0gUlBNSV9MT0dHSU5HX1NSVl9NQVhfQ09V
TlQsCj4gKyAgICAgICAuc2VydmljZV9kYXRhID0gbG9nZ2luZ19zZXJ2aWNlcywKPiArfTsKPiAr
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoIGxvZ2dpbmdfbWF0Y2hbXSA9IHsKPiAr
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmlzY3YscnBtaS1tcHh5LWxvZ2dpbmciLCAuZGF0YSA9
ICZsb2dnaW5nX2RhdGEgfSwKPiArICAgICAgIHsgfSwKPiArfTsKPiArCj4gK2NvbnN0IHN0cnVj
dCBmZHRfZHJpdmVyIGZkdF9tcHh5X3JwbWlfbG9nZ2luZyA9IHsKPiArICAgICAgIC5tYXRjaF90
YWJsZSA9IGxvZ2dpbmdfbWF0Y2gsCj4gKyAgICAgICAuaW5pdCA9IG1weHlfcnBtaV9tYm94X2lu
aXQsCj4gKyAgICAgICAuZXhwZXJpbWVudGFsID0gdHJ1ZSwKPiArfTsKPiBkaWZmIC0tZ2l0IGEv
bGliL3V0aWxzL21weHkvb2JqZWN0cy5tayBiL2xpYi91dGlscy9tcHh5L29iamVjdHMubWsKPiBp
bmRleCA5Y2ZkODZiYy4uMWYxYmYwYTAgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL21weHkvb2Jq
ZWN0cy5tawo+ICsrKyBiL2xpYi91dGlscy9tcHh5L29iamVjdHMubWsKPiBAQCAtMjksMyArMjks
NiBAQCBsaWJzYml1dGlscy1vYmpzLSQoQ09ORklHX0ZEVF9NUFhZX1JQTUlfREVWSUNFX1BPV0VS
KSArPSBtcHh5L2ZkdF9tcHh5X3JwbWlfZGV2aQo+Cj4gIGNhcnJheS1mZHRfbXB4eV9kcml2ZXJz
LSQoQ09ORklHX0ZEVF9NUFhZX1JQTUlfTU0pICs9IGZkdF9tcHh5X3JwbWlfbW0KPiAgbGlic2Jp
dXRpbHMtb2Jqcy0kKENPTkZJR19GRFRfTVBYWV9SUE1JX01NKSArPSBtcHh5L2ZkdF9tcHh5X3Jw
bWlfbW0ubwo+ICsKPiArY2FycmF5LWZkdF9tcHh5X2RyaXZlcnMtJChDT05GSUdfRkRUX01QWFlf
UlBNSV9MT0dHSU5HKSArPSBmZHRfbXB4eV9ycG1pX2xvZ2dpbmcKPiArbGlic2JpdXRpbHMtb2Jq
cy0kKENPTkZJR19GRFRfTVBYWV9SUE1JX0xPR0dJTkcpICs9IG1weHkvZmR0X21weHlfcnBtaV9s
b2dnaW5nLm8KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZp
ZyBiL3BsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcKPiBpbmRleCAwMWQxMTJjNy4u
YjBiNjI4MmUgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZp
Zwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcKPiBAQCAtODMsMyAr
ODMsNCBAQCBDT05GSUdfRkRUX01QWFlfUlBNSV9ERVZJQ0VfUE9XRVI9eQo+ICBDT05GSUdfRkRU
X01QWFlfUlBNSV9QRVJGT1JNQU5DRT15Cj4gIENPTkZJR19GRFRfTVBYWV9SUE1JX1NZU01TST15
Cj4gIENPTkZJR19GRFRfTVBYWV9SUE1JX01NPXkKPiArQ09ORklHX0ZEVF9NUFhZX1JQTUlfTE9H
R0lORz15Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
