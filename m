Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0076A606A31C
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qFd3JtdM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=u45hWqOy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pZl0Xmoq7F3nuiqNH+XYo6M1U+4lrJSyXtWZah+xiC4=; b=qFd3JtdMWXK81q7FfRRBsgbY2e
	vfYzfFXy6z0Gc+ItfYmGPyiiy/w0b/qfCX1aBjqZe0ehyo3rCWtgY8k47DBkHBp8igUWzymhfAhuv
	GOW+YI4531sg1exPuMDiGadmh4SrimFJ7PedAUTuQzBrTzTGXtIuJ5U8fOXTgEpKk0cj4lZkseIfj
	j8wMulULjxorOzuuO/wyOvTzADkIYD7BAnlN/AnVDE6EsEfnHN4ebP+kC2kaB+Iuh+rVUwi/BMCze
	0c4MZh5rjun1t5+Kmn+IpVE7Dy5XDIF5ySC1frMRmDAxs6zC60kJIFPUUwkCMy6tSJTjb+IHq4kWY
	+BwB2i5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1IX-00000006oG7-2rMK;
	Wed, 28 Oct 2026 10:54:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1IU-00000006oFU-2uS3
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 10:54:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e10a70540so497859f8f.1
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 03:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793184861; cv=none;
        d=google.com; s=arc-20260327;
        b=rvRs73fawO302xp4pqkGqM9eBlz92IJy5kDr6+CR2KfQrW9vqS1h4gUhS0JvtCE3FG
         8Viq+IlCAnhY9W9ahJbBstQBvvu2SJD4bdeE0qnmdYmsTI4EaefpKJqH+O0ilTHuZ2io
         89QjkIYXsiFhO1ljW9BoWRbJmnQdZdJbIJ00vFBep4V6ZCQAm7P1aZFw5jXDjRsyKOIC
         w4hM5cc/rFxXt3YbhjYWWMtLIGLDQi2kzxa+F+bvFcohvtViZadwBkRvzVO/pxBtvXwP
         GC2QL8qEldMucmhZHBgeZzKY0GjWjH52zb5voWhOtKlNYpYnAWVZf2f0OI/wxCuBv9zL
         wxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLWLD8lh9b6tgI7EVxr87PP+ojLxnHvo2IuUO2Ovmqw=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=ZtEpATUyoyE+iQ1rbFMy0IlIzq5jzWokeogJh3vepCdOxUqIzCq7vr2cNL8dwmmjan
         DVxMD6TaOwi3e66+kuSKFrTwd5HNaxW9OxGTAO1QwplE/hAujvV6Cn1gmVse2q287+lB
         CJhzEHIWS7f2N/T2xS7oekC85bguIc59aeJgppGQugDrt0OyQb/h2iwPUkJykMxdPLMP
         pWUVdVXOt9B1s2XjDaKGEcKtTtia3rf8W4E/XFV8VL3kP1CpxTgZz9P/G0stMRiyuP8y
         3x4IptGVkosbVZx0QNP8izO8G2SAMu+5LSlG1qEXYcNrH7Kidqxrsk/qNdU2IB8nev98
         dAlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793184861; x=1793789661; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLWLD8lh9b6tgI7EVxr87PP+ojLxnHvo2IuUO2Ovmqw=;
        b=u45hWqOyEsLpYehZyzfuUQRQNavtNhqct5FE2l4l74t6evkemTU/JzJG4zmxko1WUH
         DdVayKx+0kyu15e+XbW/Ibj+09FAprRRipTiyX/59V5ojiSaQ3ZS5ZA8zcMRyZUh9g9c
         QZX7xq/gvijbGPFiTvSPkvLxahhIrbOzHQekJGiq7G3dNDNhT/r6PjGF/2eS1cs4wWEv
         jC9THOyV52PclrH1dpr9sIyx/SbQ6W1zrgnUr9JKBhRAKB5y1qLm2h3FvrEqd+iOMMNL
         gmkF7DTFcx8W9REqbNSTe15HcV7sTypsCxuJnJdLkJ06/ZU8ZkP+8yhsAbU7L9hjSz8e
         j+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184861; x=1793789661;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLWLD8lh9b6tgI7EVxr87PP+ojLxnHvo2IuUO2Ovmqw=;
        b=0qzG9QlHxz6h0gXBjY5+7Glm89+TrB7G9V2BPAwx5II3ivU1Hwo+svEHXp6Xg6pM3Y
         ltdM5sYAxJW5qAraH1Y1ZLF5dXJVdyVqfIUzKs2D/ZpW6bEjFmHEqI01ZY9BlJq+yvhp
         H4VFfyu7qMPKhE/wI7jajYjuLzCrBwrtsqf+UkBM/JxkatpX8Po843uuc92rsaHvAe0n
         ewAfQUfLYGSDiRFoZpt5YuC7uHDsaH5LMs1c38KdVCGMQLG8B+ExBvHoVNQSch08BZ23
         HViUW4WgMYCHmeMNjuxGWvYAI62CFsParqfiWBPAFAfYpvaUjJL/uF6jHK7tR+xMOZO0
         DKQA==
X-Gm-Message-State: AFq9FYLagcFDkGnjoERsJxs/PaIJD24DzufedauwsXL7MhvbMRcFLeIF
	SgUtQkS7aR2UzAmI5uokFaI946cMGxWG3ZaWJ7hCQA9Vf9YbrUPRiHOkhI/HwIaHqCwzHkc6sgE
	oDxbEBNOXdYu72SkHL0+Zd3ePRCn/iXM8NmW9/oNpag==
X-Gm-Gg: AYBFou2zjIcV9mOFLGFJ0FmGemU6BNeQsax3+rn0Z0Cfs6NYCJYDvWcG4WkUDwZQBHf
	0toydB61dDrYq5EGetzMpAnz/idLQbAr1Si7SCBVOBPKVTjYEL/B8pfeS83QqowNaFpk+mG9bPE
	razsweIfBvhgITELAAEjtpdQF5+t8UZztAf0qCV34en6oKfvXapOUo1mdt+j91h5+FEtp1pE5/t
	LTnrOsKah54ECJUFvsz/O1KnDnkwf1rTzTX1zgZLXbOcFKsNu01keaMJVpxSBiGYX++tgGXW9wy
	+OD7lO9mcEiTJUPC9svMkpNVdcZyi0n4RTXtBaMTSZlvPDAByVR5IcYltgTlCq1MDR335Tnbh5m
	2ad5vY757O6FiQxVMQLFvY/fsZ+6k4Jop5POxTW3XC2X4kvlzFFgU5JFcgqy5KUwSYw4M6c9TxV
	B4rwlEYLyW13A0pBVNXMvZW2yfYmRy7RrYSzx1JA28IgfL4rkmbpNSHaMCqGowns4YUGCKx9WEO
	aPi
X-Received: by 2002:a05:6000:2d09:b0:48e:d88:55f5 with SMTP id
 ffacd0b85a97d-48e5d5c8a9bmr3703223f8f.30.1793184860785; Wed, 28 Oct 2026
 03:54:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-6-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-6-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2026 16:24:08 +0530
X-Gm-Features: AclHuK9wVkV4cn8BwtKPz-U4cnLDNkWIpu6F9OKGR_B3H30vLG3-_tPabnND1vw
Message-ID: <CAAhSdy3HNx9o_iBONfx4cAUyLp4C7AFk4=8M=qUt+DC=x5-TkA@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] lib: sbi_domain_context: propagate error from sbi_hart_protection_reconfigure
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_035422_746604_EFF5E638 
X-CRM114-Status: GOOD (  16.81  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMjowNeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gUHJvcGFnYXRlIHRoZSByZXR1cm4gdmFsdWUg
b2Ygc2JpX2hhcnRfcHJvdGVjdGlvbl9yZWNvbmZpZ3VyZSBpbgo+IHN3aXRjaF90b19uZXh0X2Rv
bWFpbl9jb250ZXh0IHRvIGVuc3VyZSB0aGF0IGRvbWFpbiB0cmFuc2l0aW9uCj4gZmFpbHVyZXMg
YXJlIGNvcnJlY3RseSBoYW5kbGVkIGJ5IHRoZSBjYWxsZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZ
dS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAt
LS0KPiBDaGFuZ2UgdjItPnYzOgo+IC0gTmV3IHBhdGNoOiBwcm9wYWdhdGUgcmV0dXJuIHZhbHVl
IG9mIHNiaV9oYXJ0X3Byb3RlY3Rpb25fcmVjb25maWd1cmUoKQo+ICAgaW4gc3dpdGNoX3RvX25l
eHRfZG9tYWluX2NvbnRleHQoKS4KPiAtLS0KPiAgbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQu
YyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgYi9saWIv
c2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4gaW5kZXggOTg3YWM3ZmEuLjE3NTFkMDE2IDEwMDY0
NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiArKysgYi9saWIvc2JpL3Ni
aV9kb21haW5fY29udGV4dC5jCj4gQEAgLTExMCw2ICsxMTAsNyBAQCBzdGF0aWMgaW50IHN3aXRj
aF90b19uZXh0X2RvbWFpbl9jb250ZXh0KHN0cnVjdCBoYXJ0X2NvbnRleHQgKmN0eCwKPiAgICAg
ICAgIE1VU1RfTk9UX0hPTEQoJmN0eC0+ZG9tLT5hc3NpZ25lZF9oYXJ0c19sb2NrKQo+ICAgICAg
ICAgTVVTVF9OT1RfSE9MRCgmZG9tX2N0eC0+ZG9tLT5hc3NpZ25lZF9oYXJ0c19sb2NrKQo+ICB7
Cj4gKyAgICAgICBpbnQgcmM7Cj4gICAgICAgICB1MzIgaGFydGluZGV4ID0gY3VycmVudF9oYXJ0
aW5kZXgoKTsKPiAgICAgICAgIHN0cnVjdCBzYmlfdHJhcF9jb250ZXh0ICp0cmFwX2N0eDsKPiAg
ICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpjdXJyZW50X2RvbSwgKnRhcmdldF9kb207Cj4gQEAg
LTE3Myw3ICsxNzQsOSBAQCBzdGF0aWMgaW50IHN3aXRjaF90b19uZXh0X2RvbWFpbl9jb250ZXh0
KHN0cnVjdCBoYXJ0X2NvbnRleHQgKmN0eCwKPiAgICAgICAgICAqIGlzIGFsc28gcmVxdWlyZWQg
Zm9yIHNvbWUgb2YgdGhlIGFib3ZlIENTUiB1cGRhdGVzIChzdWNoCj4gICAgICAgICAgKiBhcyBz
YXRwIENTUikuCj4gICAgICAgICAgKi8KPiAtICAgICAgIHNiaV9oYXJ0X3Byb3RlY3Rpb25fcmVj
b25maWd1cmUoc2NyYXRjaCwgY3VycmVudF9kb20sIHRhcmdldF9kb20pOwo+ICsgICAgICAgcmMg
PSBzYmlfaGFydF9wcm90ZWN0aW9uX3JlY29uZmlndXJlKHNjcmF0Y2gsIGN1cnJlbnRfZG9tLCB0
YXJnZXRfZG9tKTsKPiArICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJj
Owo+Cj4gICAgICAgICAvKiBNYXJrIGN1cnJlbnQgY29udGV4dCBzdHJ1Y3R1cmUgaW5pdGlhbGl6
ZWQgYmVjYXVzZSBjb250ZXh0IHNhdmVkICovCj4gICAgICAgICBjdHgtPmluaXRpYWxpemVkID0g
dHJ1ZTsKPiAtLQo+IDIuNDMuNwo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
