Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D89606A31A
	for <opensbi@archiver.kernel.org>; Sat, 31 Oct 2026 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ikaZnolg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=tmmY23Oz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QGvO605qiHi2mVNAE2RccS+8mma3/4xfJk4OnacCYQk=; b=ikaZnolgPTgiARGeZA8Ya0SzXC
	7zCsBeMTPTwcipbEdXWXZTkHZoHb6/fOYyLwff0O6/uqNB52AjzJWbk4zUm7lqjvIoS8KSrpPOEzw
	nWUz2Hb7f0wTCvGsIP7mnntQzVXy6QsR7AfSTdz1yk7kkiIrW4lV5BMTPhtaRV3sa/lvQrG5ZHoVY
	gBqg6+sEQf4G7hmEa4J65pgk3mtzlWPy3+ScLfshgDpQxYPEvyc0FKYXM1ZcXSp/o1Hj7qJ4URaES
	u/qcULL9u07d+pLO54/VvZtCyZpu9hHDdTqZaCE25qfOy6fVxNiwsKgNqAboVR2Zy+EbtSSma82Yb
	SjvuEgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8WJ-0000000DKwn-1oJO;
	Sat, 31 Oct 2026 12:49:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8WH-0000000DKvP-0dDd
	for opensbi@lists.infradead.org;
	Sat, 31 Oct 2026 12:49:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48df54150dfso726844f8f.0
        for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 05:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793450951; cv=none;
        d=google.com; s=arc-20260327;
        b=Rse5v3yEdIOMdlaWU3DBWqfCEd+ST5z2L3twG4aENZFKJZ/5yryIrq1JDrnIO5lnak
         L5PjOJUackgyRKiYjHhyYCgo7OCm0pOlHcJ7b2UNLArI6ZCbLOLq5s5cAP3JmgIpsUiN
         LG6NQY6mk8dInER1pWVduVjD/cyGWnezspM+Bu8hs6dCsUKb+KtQMUO/bLJhb7O3vnub
         +kLUhuagxmpOsfmfFBZWY9MSBka5MMNH8tBr7K8Uk7eFC+IHoUSxLKpjPKQcEaE2N5/E
         2abIuorsEHxLwJuKWNskZIkjTexZsW7vxNchu35RYvosxiefdOgqX+E/UmtD6Z/ih7CY
         dYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+YBvd7TrrM3c0Z9nukSRu0h7VldT9SLC3BmjivZKUk8=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=RCrEHhY7cw8dgCHYXh84KjRiFicAVhvHPr6HgUsPAUX7jpW68Hl9V6z5oj8SCZLdyv
         En6EFNnJeEUzs4XGMJOx03YtBEvIgco8wwNn/bzneh+rOSxlz3OLPIYH2dPSzfqHlrPb
         6SOS6SYNCzMLr807VD1Do3D22jhj2Htn17KR3gYe0Mp4g4iSwFoEb6qVlixAsJ1Wxhvg
         G6l4XYX3oh3TLOxSGPYuu9hIoXB2tK2TmGefTRZI58wXVKunRbb6oIInIA4KcXO49NuV
         wYOeJgZahNzbvTNdweyDp2pJkpV8enTB4xkNccmxpYEqEIioej1BvKYfgoUATLIDjoNc
         +URw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793450951; x=1794055751; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+YBvd7TrrM3c0Z9nukSRu0h7VldT9SLC3BmjivZKUk8=;
        b=tmmY23OzGLsYn1mowHT4OlRfQvX4UDeU0w5P/TiAKByl11F2ecTlQb5JAbWZFqGFt3
         Kh25cyH7g7RrCaejDbomrb1tiC2kmbkdJRHDtgShwICdsiYYiWONmzeNyRKRGWLoSywy
         ieiFTQXWDA4qNNqplT1wxDiM9GRF/+4tZMDL8EdRMlWvoQKITm0DDChsZIXoiD2XRVFW
         hD8lCa0GCnOEPTVZkiyaUVk5pBJ349Y0PBT4u0IHBbH+AYvYnjfuXo+D8mAqNq4dvgqf
         bTi7RFSnBl6FNPbqMx+3VfYd6EoOamZpccuwdDlk3ADFZgWTruOMaTi3/wlJlIzWCrNj
         992w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450951; x=1794055751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YBvd7TrrM3c0Z9nukSRu0h7VldT9SLC3BmjivZKUk8=;
        b=c/W0p9FmC858v9TF99+oKwxrWCMiJe9/WRJAHYgb/0ofY935Q4jS6pcF5IBtMhk1Yl
         F6/rHrSxJpzgASJBU0Z1QFR3AxrXav9t5/SjIo/bAsx1zmZ6222SqVeAD2ZVj1CRTLda
         KTVQHkkL4QaEPlsb6/+9DUb/budl5poWOOqT/FH4mfjV0mwpjfEI8JtchojnzrBLiRUv
         w22kaPlAecOHPMEcw6yGyznmLvJyUhxNh41eAkK0V0/v3WEXi/tiJFsxDss1psOg5jIb
         rstQjLTioiqZuEyXo+sJfbKP0PaoV1RfrEsdhcFbBvtO4P2RmKXth6wf1/H/sSHJtnqI
         cVGw==
X-Gm-Message-State: AFq9FYKrT7BhQCzfjs4VQqAnVQlSTDAGkud5ewP+hW+AHD76rrZOrbGS
	qS51sW8gMKAEVeIhYa2k6EVOG8tXPQA7V+H15U7/klGXyjZ8eeBIKjBqwEht5a0q8WLsZ1SGRci
	bubWSX/PP0ssSc1g1YZPTzkT/839PUHbkJLYnD23OhQ==
X-Gm-Gg: AYBFou3rizokS/aS+FugHVVL8/5axpTh9cUwYoMsAqvFZltS1pMiftPoLvy5HYq+uk8
	dNEnyULiX2p9qr+tIhJVdjYXT4xq8aQFvw5Gp+2BqESDXHy/r2DyrJ9vpavmMDgC8QZSXarEnsu
	XHvf3sj+HN2kPXWnIrvADsjTkOphAomqBTRq7Byo0xkuAtSqPik5x8aFIi2XgtiWzheXalXXxhY
	gdbggB39ToUZnvbL48CqMksuqObYUkUiAtiMgBYtAsOwH5Q65/KDUWiiHP7v59Z20xPJHiNfe4H
	CUh9t334dEJSimpIUhFLP59O+HD2ja4hDf0cCrEv1wKrwLm57EpkqgoO2WweBN7HS1070bmXViq
	pNdzSkHkr3bWFrW6FraHBEVtoagR1URmvpu+R+rAYFsVh0FX7nKdj5yNkReQTZDwZ0vIgBCqj28
	gS8EXkY6lpLzqrXMWYElbfjNW9evHWTkIqfyR4SEiGqG0+vs2ur/Bf0T0YGQ==
X-Received: by 2002:a05:6000:41d9:b0:48e:646e:fb61 with SMTP id
 ffacd0b85a97d-48e6e305b9emr12871763f8f.34.1793450951024; Sat, 31 Oct 2026
 05:49:11 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030104518.3297875-1-peter.lin@sifive.com> <20261030104518.3297875-3-peter.lin@sifive.com>
In-Reply-To: <20261030104518.3297875-3-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 31 Oct 2026 18:18:57 +0530
X-Gm-Features: AclHuK8_yeBpOo6heS7UNzn5BZzU9JRke1HjKntWFKl-bqFC8qdd_1cQ_HlXBNA
Message-ID: <CAAhSdy0fETwPP54DsVK8qF_Si=__1Pp3E0dgEh1yuKZj7Kr-sA@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] lib: utils: fdt_helper: parse RISC-V Worlds
 per-hart WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_054913_235961_9D8BB790 
X-CRM114-Status: GOOD (  20.00  )
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

T24gRnJpLCBPY3QgMzAsIDIwMjYgYXQgNDoxNeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gRXh0ZW5kIGZkdF9wYXJzZV9pc2FfZXh0ZW5z
aW9uc19hbGxfaGFydHMoKSB0byBhbHNvIHBhcnNlIHRoZQo+IHBsYXRmb3JtLWRlZmluZWQgUklT
Qy1WIFdvcmxkcyBEVCBwcm9wZXJ0aWVzIGluIC9jcHVzL2NwdUBYOgo+IC0gcmlzY3YscG13aWQ6
IE0tbW9kZSBXb3JsZCBJRAo+IC0gcmlzY3YscG13aWRsaXN0OiBiaXRtYXAgb2YgcGVybWl0dGVk
IE0tbW9kZSBXSURzCj4gLSByaXNjdixwbWx3aWRsaXN0OiBiaXRtYXAgb2YgcGVybWl0dGVkIGxv
d2VyLXByaXZpbGVnZSBXSURzCj4gYW5kIHN0b3JlIHRoZSBwYXJzZWQgdmFsdWVzIGluIHN0cnVj
dCBzYmlfaGFydF9mZWF0dXJlcy4KPgo+IFRoZXNlIHBsYXRmb3JtLWRlZmluZWQgdmFsdWVzIHNl
cnZlIGFzIHRoZSByb290LW9mLXRydXN0IGNvbnN0cmFpbnRzCj4gZm9yIHBlci1kb21haW4gV0lE
IGFzc2lnbm1lbnQgZHVyaW5nIGRvbWFpbiBjcmVhdGlvbiBhbmQgY29udGV4dAo+IHN3aXRjaGlu
Zy4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2
ZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpUaGFua3MsCkFudXAKCgo+IC0tLQo+IENoYW5nZSB2My0+djQ6Cj4gLSBQYXJzZSBXb3Js
ZHMgcHJvcGVydGllcyBpbiBmZHRfcGFyc2VfaXNhX2V4dGVuc2lvbnNfYWxsX2hhcnRzKCkKPiAg
IGluc3RlYWQgb2YgYSBzZXBhcmF0ZSBmZHRfcGFyc2Vfd29ybGRzX2FsbF9oYXJ0cygpIChBbnVw
KS4KPiAtIERyb3AgUkItdGFnIGZyb20gT3phCj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9oYXJ0
LmggICAgIHwgIDUgKysrCj4gIGxpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jIHwgNjkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2NyBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2Jp
L3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gaW5kZXggZWQzNDQ3ODMuLjYy
OWUzZjY0IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiArKysgYi9pbmNs
dWRlL3NiaS9zYmlfaGFydC5oCj4gQEAgLTEzOCw2ICsxMzgsMTEgQEAgc3RydWN0IHNiaV9oYXJ0
X2ZlYXR1cmVzIHsKPiAgICAgICAgIHVuc2lnbmVkIGludCBtaHBtX21hc2s7Cj4gICAgICAgICB1
bnNpZ25lZCBpbnQgbWhwbV9iaXRzOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBleHBlY3RlZF90
cmFwOwo+ICsgICAgICAgdTMyIHBtd2lkOwo+ICsgICAgICAgdTY0IHBtd2lkbGlzdDsKPiArICAg
ICAgIHU2NCBwbWx3aWRsaXN0Owo+ICsgICAgICAgYm9vbCBoYXNfcG13aWQ7Cj4gKyAgICAgICBi
b29sIGhhc19wbWx3aWRsaXN0Owo+ICB9Owo+Cj4gIGV4dGVybiB1bnNpZ25lZCBsb25nIGhhcnRf
ZmVhdHVyZXNfb2Zmc2V0Owo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIu
YyBiL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCj4gaW5kZXggNzQ3YmEwMjguLmZkZDI1NjQ4
IDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCj4gKysrIGIvbGliL3V0
aWxzL2ZkdC9mZHRfaGVscGVyLmMKPiBAQCAtNDQyLDE2ICs0NDIsNzEgQEAgaW50IGZkdF9wYXJz
ZV9pc2FfZXh0ZW5zaW9uc19hbGxfaGFydHMoY29uc3Qgdm9pZCAqZmR0KQo+ICAgICAgICAgICAg
ICAgICBpZiAodmFsICYmIGxlbiA+IDApIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBmZHRf
cGFyc2VfaXNhX2V4dGVuc2lvbnNfb25lX2hhcnQoKGNvbnN0IGNoYXIgKil2YWwsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhmZWF0
dXJlcy0+ZXh0ZW5zaW9ucywgbGVuKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgICAgICAgICB2
YWwgPSBmZHRfZ2V0cHJvcChmZHQsIGNwdV9vZmZzZXQsICJyaXNjdixpc2EiLCAmbGVuKTsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXZhbCB8fCBsZW4gPD0gMCkKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5PRU5UOwo+ICsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBlcnIgPSBmZHRfcGFyc2VfaXNhX29uZV9oYXJ0KChjb25zdCBjaGFyICop
dmFsLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaGZlYXR1cmVzLT5leHRlbnNpb25zKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAo
ZXJyKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPiAgICAg
ICAgICAgICAgICAgfQo+Cj4gLSAgICAgICAgICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwg
Y3B1X29mZnNldCwgInJpc2N2LGlzYSIsICZsZW4pOwo+IC0gICAgICAgICAgICAgICBpZiAoIXZh
bCB8fCBsZW4gPD0gMCkKPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT0VO
VDsKPiArICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBjcHVfb2Zmc2V0LCAi
cmlzY3YscG13aWQiLCAmbGVuKTsKPiArICAgICAgICAgICAgICAgaWYgKHZhbCAmJiBsZW4gPT0g
c2l6ZW9mKGZkdDMyX3QpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaGZlYXR1cmVzLT5w
bXdpZCA9IGZkdDMyX3RvX2NwdSgqdmFsKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVh
dHVyZXMtPmhhc19wbXdpZCA9IHRydWU7Cj4gKyAgICAgICAgICAgICAgIH0KPgo+IC0gICAgICAg
ICAgICAgICBlcnIgPSBmZHRfcGFyc2VfaXNhX29uZV9oYXJ0KChjb25zdCBjaGFyICopdmFsLCBo
ZmVhdHVyZXMtPmV4dGVuc2lvbnMpOwo+IC0gICAgICAgICAgICAgICBpZiAoZXJyKQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gKyAgICAgICAgICAgICAgIHZhbCA9IGZk
dF9nZXRwcm9wKGZkdCwgY3B1X29mZnNldCwgInJpc2N2LHBtd2lkbGlzdCIsICZsZW4pOwo+ICsg
ICAgICAgICAgICAgICBpZiAodmFsICYmIGxlbiA9PSAyICogc2l6ZW9mKGZkdDMyX3QpKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgaGZlYXR1cmVzLT5wbXdpZGxpc3QgPSAoKHU2NClmZHQz
Ml90b19jcHUodmFsWzBdKSA8PCAzMikgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGZkdDMyX3RvX2NwdSh2YWxbMV0pOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGlmICghaGZlYXR1cmVzLT5wbXdpZGxpc3QpIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0JXUgcmlzY3YscG13aWRsaXN0IGlz
IGVtcHR5XG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBf
X2Z1bmNfXywgaGFydGlkKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBTQklfRUlOVkFMOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAg
ICAgfQo+ICsKPiArICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBjcHVfb2Zm
c2V0LCAicmlzY3YscG1sd2lkbGlzdCIsICZsZW4pOwo+ICsgICAgICAgICAgICAgICBpZiAodmFs
ICYmIGxlbiA9PSAyICogc2l6ZW9mKGZkdDMyX3QpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaGZlYXR1cmVzLT5wbWx3aWRsaXN0ID0gKCh1NjQpZmR0MzJfdG9fY3B1KHZhbFswXSkgPDwg
MzIpIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZmR0MzJfdG9fY3B1KHZhbFsxXSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaGZlYXR1cmVz
LT5oYXNfcG1sd2lkbGlzdCA9IHRydWU7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAg
ICAgICAgICAgIC8qIFNhbml0eSBjaGVja3MgKi8KPiArI2lmIF9fcmlzY3ZfeGxlbiA9PSAzMgo+
ICsgICAgICAgICAgICAgICBpZiAoaGZlYXR1cmVzLT5wbXdpZGxpc3QgJiYKPiArICAgICAgICAg
ICAgICAgICAgIChoZmVhdHVyZXMtPnBtd2lkbGlzdCA+PiAzMikpIHsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCV1IHJpc2N2LHBtd2lkbGlzdCBoYXMgYml0
cyBiZXlvbmQgWExFTlxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
ZnVuY19fLCBoYXJ0aWQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlO
VkFMOwo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoaGZlYXR1
cmVzLT5oYXNfcG1sd2lkbGlzdCAmJgo+ICsgICAgICAgICAgICAgICAgICAgKGhmZWF0dXJlcy0+
cG1sd2lkbGlzdCA+PiAzMikpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRm
KCIlczogaGFydCV1IHJpc2N2LHBtbHdpZGxpc3QgaGFzIGJpdHMgYmV5b25kIFhMRU5cbiIsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlkKTsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAgICAgICAg
ICAgfQo+ICsjZW5kaWYKPiArCj4gKyAgICAgICAgICAgICAgIGlmIChoZmVhdHVyZXMtPmhhc19w
bXdpZCAmJgo+ICsgICAgICAgICAgICAgICAgICAgaGZlYXR1cmVzLT5wbXdpZCA+PSBfX3Jpc2N2
X3hsZW4pIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCV1
IHJpc2N2LHBtd2lkICgldSkgZXhjZWVkcyBtYXggV0lEXG4iLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGhhcnRpZCwgaGZlYXR1cmVzLT5wbXdpZCk7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKyAgICAgICAgICAg
ICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGlmIChoZmVhdHVyZXMtPnBtd2lkbGlzdCAmJiBo
ZmVhdHVyZXMtPmhhc19wbXdpZCAmJgo+ICsgICAgICAgICAgICAgICAgICAgIShoZmVhdHVyZXMt
PnBtd2lkbGlzdCAmIEJJVF9VTEwoaGZlYXR1cmVzLT5wbXdpZCkpKSB7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGhhcnQldSByaXNjdixwbXdpZCAoJXUpIG5vdCBp
biBwbXdpZGxpc3RcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1
bmNfXywgaGFydGlkLCBoZmVhdHVyZXMtPnBtd2lkKTsKPiArICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4g
ICAgICAgICByZXR1cm4gMDsKPiAtLQo+IDIuNDMuNwo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
