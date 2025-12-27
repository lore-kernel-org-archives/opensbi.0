Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4FCE8FDD0
	for <opensbi@archiver.kernel.org>; Sat, 27 Dec 2025 10:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rh4XAkPOesPHW7g+GYztymHDvaH2TaXvduXsjeLSdj8=; b=wxomMW9Vvps+E/
	KCq0tXOXHGC5XTo692+5AeoMhzGBDco+lLbg3sjEEiU6B23WElsxD10KgM4KTwiAipujo0sI82h28
	Ggk0deUA3ASHFd1KucpPLn2JZFHR40VRLcADoqOBd+35MmavJYhXAPi6POWOHKHKPIU1TI7XAPh0t
	K1dnUsiaIyR2xFxhIIjUozzab/EUMflN7P8h7S7psc6u4V1Zgud2LMATxuUUuI7/r4E7cxS/k4mKj
	mEGo3JqbMEiyuIE4RPEVkYcsoRNvartNdhw9hKBB7oetOSemAxwZvpcpW3/1MNXlnysqzVEEy4IFm
	G9b08aGFG7nW26Ed2hjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZRRP-00000001rI8-26kX;
	Sat, 27 Dec 2025 10:22:31 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZRRN-00000001rHn-0Fce
	for opensbi@lists.infradead.org;
	Sat, 27 Dec 2025 10:22:30 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-65cf050a5cdso4778754eaf.1
        for <opensbi@lists.infradead.org>; Sat, 27 Dec 2025 02:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1766830948; x=1767435748; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7XWeI90CenS9/Xtvh003dTRQPLEYdSGL1zhHFXpKu8=;
        b=rBJG05crwFzpq4UeKdh11/qCrIevOrFluP7we/H7SWK8Kp56kqbftboelmZb3a8SEH
         03qVaGT29NpmJVtPXGcDNPQ3BWXcY3XlGnh4ncsgHOtNAdy3xgQLL6Odt4sRo1BE7NYI
         XzugS7jzlzoK5gAIrUB39Jo6qjTUPJcTxqV3w8C68ml3s3QXs5e4QaNHUBx25Gx20EAv
         w2Cg2vEJyp+TDKla5TS2AbjPQWzADHsEH2ZueOVHJTZz/nj8k3ol/8jU9XlLCAbJM7Qx
         AvJ8N5Hy0DHK2JIREu01wW/dU97Y6IDwC234va5Vg61wmVSUuwn6ahHK9hI+o9oMJZs4
         Pkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766830948; x=1767435748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m7XWeI90CenS9/Xtvh003dTRQPLEYdSGL1zhHFXpKu8=;
        b=oSgQ8yF/0nt1NO3kqDeqgPYF0dpnsKymVohm48zOnHkEDCryIdrITtNV54Yv36Fm2q
         vRETmWA77vOznZTqiB+Uqo/jfHy5o/6WmwI1FZdjr9S6KVQ/2C8thvt/Y8fAfYvclR6w
         /5yJFeEQLMC8z4cioH87krWjrSXlCKZf5Ulfx3Uz1f6yun05eH5h2Dd5mJwmfXYZoJTh
         Iu9EK1/K+0mFf9ewQo5//ehZDzdcBZBZWqQQNjKdlhj21sAeZqdhvKPb068+9MaPNvNI
         iDKhSUkKIBKnz1mCt/j7V9LbSu4wKp3Ylk5nquICxydBwNNjQLjlph0MswskZ2FUbm3s
         xmAQ==
X-Gm-Message-State: AOJu0YydaEBxYBPbhe3BZLAZUB3pTyB+Et2YDpkmyjYb7lWXj774qRsa
	QnUcsDsPGiU8o2zSJfJGg4SlwurxtpO1j/sjI/UuNsU9fxNOKGIwJG/qNlSDGArF0tWXfBZ4AyR
	5Twe4p0ywfSkCvnI2+eyz78NibknVKm+ItMibXoLG8Q==
X-Gm-Gg: AY/fxX7RRpUjW7HPbPdTTvpnsNm/DH/ySMF2hHpGeXHMiocn0lDFBZgVmyVwjevJ5No
	VDnbWkoFVEtsfMFzwzP7rnZSk1rWbYzsWOvcRd2mGAv+sV0u0/R7bJZJ+C3jpwAXQJJ/s0eZHOD
	gvrcDbeo4sjCQS3ZUAj3oC1SVin7Xb6AHiaPvsrGlVOLv/jtvitPeS3/JzJb12SlEnl5f5QwSGY
	chRWg6Dn8cnBgbaTBp+PPK0Dgz27akOjXn/b8QttuSEFpC3O8nfCLE31a3B4dTHbE4e+TZWvJuB
	VLf7jFoqmHo97FsnuxOsSGDCRRHFBnhcUMFvsDrQVF+NeHWEO+UJFPtWvw9bJDnY0cDv
X-Google-Smtp-Source: AGHT+IEL93YN2F5mdwYWxqUVsE+y4jhDG/k2Cj25E9BjEObTKW8GJT5irqMQeYsdpLhIG/fKCiv1uf+XdHEp+GhX2yI=
X-Received: by 2002:a05:6820:488f:b0:659:9a49:8e25 with SMTP id
 006d021491bc7-65cfe746e25mr8131842eaf.23.1766830947746; Sat, 27 Dec 2025
 02:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20251225111826.4048400-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251225111826.4048400-1-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 27 Dec 2025 15:52:16 +0530
X-Gm-Features: AQt7F2oueqG81rL19I3qEeOSwN6GYP46alFbx9tvTFM1XEy7X5OsXq_qNY_MZlE
Message-ID: <CAAhSdy1WfBK=0rdY23NysLANsix_XoOYz1nedrgMqeHZPN0VXA@mail.gmail.com>
Subject: Re: [PATCH] atomics: fix AMO test macros
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_022229_450485_72B66C77 
X-CRM114-Status: GOOD (  18.74  )
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

T24gVGh1LCBEZWMgMjUsIDIwMjUgYXQgNDo0OOKAr1BNIFZsYWRpbWlyIEtvbmRyYXRpZXYKPHZs
YWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPiB3cm90ZToKPgo+IFRoZSAiUklTQy1WIEMg
QVBJIiBbMV0gZGVmaW5lcyBhcmNoaXRlY3R1cmUgZXh0ZW5zaW9uIHRlc3QgbWFjcm9zCj4gc2F5
cyBuYW1pbmcgcnVsZSBmb3IgdGhlIHRlc3QgbWFjcm9zIGlzIF9fcmlzY3ZfPGV4dF9uYW1lPiwK
PiB3aGVyZSA8ZXh0X25hbWU+IGlzIGFsbCBsb3dlci1jYXNlLgo+IDMgZXh0ZW5zaW9ucyBkZWFs
aW5nIHdpdGggYXRvbWljcyBpbXBsZW1lbnRhdGlvbiwKPiAiemFhbW8iIGNvbnNpc3RzIG9mIEFN
TyBpbnN0cnVjdGlvbnMsICJ6YWxyc2MiIC0gTFIvU0MsCj4gImEiIGV4dGVuc2lvbiBtZWFucyBi
b3RoICJ6YWFtbyIgYW5kICJ6YWxyc2MiCj4gVGVzdCBtYWNyb3MgYXJlIF9fcmlzY3ZfYSwgX19y
aXNjdl96YWFtbyBhbmQgX19yaXNjdl96YWxyc2MuCj4gQWx0ZXJuYXRpdmUgdG8gdGhlIF9fcmlz
Y3ZfYSBtYWNybyBuYW1lLCBfX3Jpc2N2X2F0b21pYywgaXMgZGVwcmVjYXRlZC4KPgo+IFVzZSBj
b3JyZWN0IHRlc3QgbWFjcm8gX19yaXNjdl96YWFtbyBmb3IgdGhlIEFNTyB2YXJpYW50IG9mIGF0
b21pY3MuCj4gSXQgdXNlZCB0byBiZSBfX3Jpc2N2X2F0b21pYyB0aGF0IGlzIGJvdGggZGVwcmVj
YXRlZCBhbmQgaW5jb3JyZWN0Cj4gYmVjYXVzZSBpdCB0ZXN0cyBmb3IgdGhlICJhIiBleHRlbnNp
b247IGkuZS4gYm90aCAiemFhbW8iIGFuZCAiemFscnNjIgo+IElmIElTQSBlbmFibGVzIG9ubHkg
emFhbW8gYnV0IG5vdCB6YWxyc2MsIGNvZGUgYXMgaXQgd2FzIHdvdWxkIG5vdCBjb21waWxlLgo+
Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWMtYXBpLWRvYwo+
Cj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIua29uZHJhdGll
dkBtb2JpbGV5ZS5jb20+Cj4gLS0tCj4gIGZpcm13YXJlL2Z3X2Jhc2UuUyAgICAgICAgICAgIHwg
MiArLQo+ICBmaXJtd2FyZS9wYXlsb2Fkcy90ZXN0X2hlYWQuUyB8IDIgKy0KPiAgbGliL3NiaS9y
aXNjdl9hdG9taWMuYyAgICAgICAgfCA4ICsrKystLS0tCj4gIGxpYi9zYmkvcmlzY3ZfbG9ja3Mu
YyAgICAgICAgIHwgMiArLQo+ICBsaWIvc2JpL3NiaV9pbGxlZ2FsX2F0b21pYy5jICB8IDYgKysr
LS0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZmlybXdhcmUvZndfYmFzZS5TIGIvZmlybXdhcmUvZndfYmFzZS5T
Cj4gaW5kZXggNTMwMGVjZjIyZTBjLi45ZmJlMmI4NzA5NzQgMTAwNjQ0Cj4gLS0tIGEvZmlybXdh
cmUvZndfYmFzZS5TCj4gKysrIGIvZmlybXdhcmUvZndfYmFzZS5TCj4gQEAgLTU5LDcgKzU5LDcg
QEAgX3RyeV9sb3R0ZXJ5Ogo+ICAgICAgICAgLyogSnVtcCB0byByZWxvY2F0aW9uIHdhaXQgbG9v
cCBpZiB3ZSBkb24ndCBnZXQgcmVsb2NhdGlvbiBsb3R0ZXJ5ICovCj4gICAgICAgICBsbGEgICAg
IGE2LCBfYm9vdF9sb3R0ZXJ5Cj4gICAgICAgICBsaSAgICAgIGE3LCBCT09UX0xPVFRFUllfQUNR
VUlSRUQKPiAtI2lmZGVmIF9fcmlzY3ZfYXRvbWljCj4gKyNpZmRlZiBfX3Jpc2N2X3phYW1vCgpM
aWtlIFhpYW5nIGFscmVhZHkgcG9pbnRlZCwgdGhpcyB3aWxsIG5vdCB3b3JrIGZvcgpvbGRlciB0
b29sY2hhaW5zIHRoYXQgZG9uJ3QgZGVmaW5lIF9fcmlzY3ZfemFhbW8uCgo+ICAgICAgICAgYW1v
c3dhcC53IGE2LCBhNywgKGE2KQo+ICAgICAgICAgYm5leiAgICBhNiwgX3dhaXRfZm9yX2Jvb3Rf
aGFydAo+ICAjZWxpZiBfX3Jpc2N2X3phbHJzYwo+IGRpZmYgLS1naXQgYS9maXJtd2FyZS9wYXls
b2Fkcy90ZXN0X2hlYWQuUyBiL2Zpcm13YXJlL3BheWxvYWRzL3Rlc3RfaGVhZC5TCj4gaW5kZXgg
MDcwY2U4YWE5OGJlLi5hYTIwYTEzZjRiODkgMTAwNjQ0Cj4gLS0tIGEvZmlybXdhcmUvcGF5bG9h
ZHMvdGVzdF9oZWFkLlMKPiArKysgYi9maXJtd2FyZS9wYXlsb2Fkcy90ZXN0X2hlYWQuUwo+IEBA
IC0zMCw3ICszMCw3IEBAIF9zdGFydDoKPiAgICAgICAgIC8qIFBpY2sgb25lIGhhcnQgdG8gcnVu
IHRoZSBtYWluIGJvb3Qgc2VxdWVuY2UgKi8KPiAgICAgICAgIGxsYSAgICAgYTMsIF9oYXJ0X2xv
dHRlcnkKPiAgICAgICAgIGxpICAgICAgYTIsIDEKPiAtI2lmZGVmIF9fcmlzY3ZfYXRvbWljCj4g
KyNpZmRlZiBfX3Jpc2N2X3phYW1vCj4gICAgICAgICBhbW9hZGQudyBhMywgYTIsIChhMykKPiAg
I2VsaWYgX19yaXNjdl96YWxyc2MKPiAgX3NjX2ZhaWw6Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
cmlzY3ZfYXRvbWljLmMgYi9saWIvc2JpL3Jpc2N2X2F0b21pYy5jCj4gaW5kZXggZGYxNmEyZWIx
NTllLi43OTM1Y2E5YzY0MmMgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9yaXNjdl9hdG9taWMuYwo+
ICsrKyBiL2xpYi9zYmkvcmlzY3ZfYXRvbWljLmMKPiBAQCAtMTIsOCArMTIsOCBAQAo+ICAjaW5j
bHVkZSA8c2JpL3Jpc2N2X2F0b21pYy5oPgo+ICAjaW5jbHVkZSA8c2JpL3Jpc2N2X2JhcnJpZXIu
aD4KPgo+IC0jaWYgIWRlZmluZWQoX19yaXNjdl9hdG9taWMpICYmICFkZWZpbmVkKF9fcmlzY3Zf
emFscnNjKQo+IC0jZXJyb3IgIm9wZW5zYmkgc3Ryb25nbHkgcmVsaWVzIG9uIHRoZSBBIGV4dGVu
c2lvbiBvZiBSSVNDLVYiCj4gKyNpZiAhZGVmaW5lZChfX3Jpc2N2X3phYW1vKSAmJiAhZGVmaW5l
ZChfX3Jpc2N2X3phbHJzYykKPiArI2Vycm9yICJvcGVuc2JpIHN0cm9uZ2x5IHJlbGllcyBvbiB0
aGUgemFhbW8gb3IgemFscnNjIGV4dGVuc2lvbiBvZiBSSVNDLVYiCj4gICNlbmRpZgo+Cj4gIGxv
bmcgYXRvbWljX3JlYWQoYXRvbWljX3QgKmF0b20pCj4gQEAgLTMxLDcgKzMxLDcgQEAgdm9pZCBh
dG9taWNfd3JpdGUoYXRvbWljX3QgKmF0b20sIGxvbmcgdmFsdWUpCj4KPiAgbG9uZyBhdG9taWNf
YWRkX3JldHVybihhdG9taWNfdCAqYXRvbSwgbG9uZyB2YWx1ZSkKPiAgewo+IC0jaWZkZWYgX19y
aXNjdl9hdG9taWMKPiArI2lmZGVmIF9fcmlzY3ZfemFhbW8KPiAgICAgICAgIGxvbmcgcmV0Owo+
ICAjaWYgX19TSVpFT0ZfTE9OR19fID09IDQKPiAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9f
KCIgIGFtb2FkZC53LmFxcmwgICUxLCAlMiwgJTAiCj4gQEAgLTc1LDcgKzc1LDcgQEAgbG9uZyBh
dG9taWNfc3ViX3JldHVybihhdG9taWNfdCAqYXRvbSwgbG9uZyB2YWx1ZSkKPiAgICAgICAgIHJl
dHVybiBhdG9taWNfYWRkX3JldHVybihhdG9tLCAtdmFsdWUpOwo+ICB9Cj4KPiAtI2lmZGVmIF9f
cmlzY3ZfYXRvbWljCj4gKyNpZmRlZiBfX3Jpc2N2X3phYW1vCj4gICNkZWZpbmUgX19heGNoZyhw
dHIsIG5ldywgc2l6ZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiAgICAgICAgICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAg
ICAgX190eXBlb2ZfXyhwdHIpIF9fcHRyID0gKHB0cik7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9yaXNjdl9sb2Nrcy5jIGIvbGliL3Ni
aS9yaXNjdl9sb2Nrcy5jCj4gaW5kZXggNDFlOGZhYmQwOGJlLi4yZTQ3ODkzNjU5NjIgMTAwNjQ0
Cj4gLS0tIGEvbGliL3NiaS9yaXNjdl9sb2Nrcy5jCj4gKysrIGIvbGliL3NiaS9yaXNjdl9sb2Nr
cy5jCj4gQEAgLTUzLDcgKzUzLDcgQEAgdm9pZCBzcGluX2xvY2soc3BpbmxvY2tfdCAqbG9jaykK
Pgo+ICAgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18oCj4gICAgICAgICAgICAgICAgIC8qIEF0
b21pY2FsbHkgaW5jcmVtZW50IHRoZSBuZXh0IHRpY2tldC4gKi8KPiAtI2lmZGVmIF9fcmlzY3Zf
YXRvbWljCj4gKyNpZmRlZiBfX3Jpc2N2X3phYW1vCj4gICAgICAgICAgICAgICAgICIgICAgICAg
YW1vYWRkLncuYXFybCAgICUwLCAlNCwgJTNcbiIKPiAgI2VsaWYgX19yaXNjdl96YWxyc2MKPiAg
ICAgICAgICAgICAgICAgIjM6ICAgICBsci53LmFxcmwgICAgICAgJTAsICUzXG4iCj4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX2lsbGVnYWxfYXRvbWljLmMgYi9saWIvc2JpL3NiaV9pbGxlZ2Fs
X2F0b21pYy5jCj4gaW5kZXggOGZkNmM1NTc1YmZiLi4xMmJjNDM4Yzg3YzAgMTAwNjQ0Cj4gLS0t
IGEvbGliL3NiaS9zYmlfaWxsZWdhbF9hdG9taWMuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2lsbGVn
YWxfYXRvbWljLmMKPiBAQCAtMTEsMTEgKzExLDExIEBACj4gICNpbmNsdWRlIDxzYmkvc2JpX2ls
bGVnYWxfYXRvbWljLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2lsbGVnYWxfaW5zbi5oPgo+Cj4g
LSNpZiAhZGVmaW5lZChfX3Jpc2N2X2F0b21pYykgJiYgIWRlZmluZWQoX19yaXNjdl96YWxyc2Mp
Cj4gLSNlcnJvciAib3BlbnNiaSBzdHJvbmdseSByZWxpZXMgb24gdGhlIEEgZXh0ZW5zaW9uIG9m
IFJJU0MtViIKPiArI2lmICFkZWZpbmVkKF9fcmlzY3ZfemFhbW8pICYmICFkZWZpbmVkKF9fcmlz
Y3ZfemFscnNjKQo+ICsjZXJyb3IgIm9wZW5zYmkgc3Ryb25nbHkgcmVsaWVzIG9uIHRoZSBBTU8g
b3IgTFIvU0MgZXh0ZW5zaW9uIG9mIFJJU0MtViIKPiAgI2VuZGlmCj4KPiAtI2lmZGVmIF9fcmlz
Y3ZfYXRvbWljCj4gKyNpZmRlZiBfX3Jpc2N2X3phYW1vCj4KPiAgaW50IHNiaV9pbGxlZ2FsX2F0
b21pYyh1bG9uZyBpbnNuLCBzdHJ1Y3Qgc2JpX3RyYXBfcmVncyAqcmVncykKPiAgewo+IC0tCj4g
Mi40My4wCj4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
