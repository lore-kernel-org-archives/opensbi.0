Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D95606A330
	for <opensbi@archiver.kernel.org>; Mon, 16 Nov 2026 13:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tqDEWroq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=b7ypuj4B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Ywtq2urW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SGxzqMKofBIGlqGBERAjcpPGZsVAS4EWYozSWYxKPIo=; b=tqDEWroqA8G62AGSBbGN7AdwST
	3/RmFAyMm1aFF11u4zZhWye+f5DjhIDSn621pIX3PGZFXpXQYsA2Ey7s9lzoTi4+Z1Pm2oF1SKKdi
	JaRQ8jmNmze6FMnlOc8qxdQ0/uQjFRVPl7CVMkNQwqhq3Z8kkaqCuB7UqB4r5gjQtHH34ObqWSbc6
	8tYY6uwe+FSphTFVsCi9FLyHmxzbZ4MROuL/RuWciMXosJz1x5ETEfIlX9lFAzI3FjFUyKIAxlk7J
	v2O/Pwx/wZA7VYL6t3XigpjDppewKMwkQuViBWEwxshBXtQRu1tFVp/PlBCwBqmde77Mjm9Rfclmt
	o/bMcWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwXY-00000002ZAq-337c;
	Mon, 16 Nov 2026 13:14:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwXX-00000002ZAM-1kNe
	for opensbi@bombadil.infradead.org;
	Mon, 16 Nov 2026 13:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4/sVTF7vmf41pSNQfzQ6l2qxZ3fjIw/kH6fGPZTUHvM=; b=b7ypuj4BimbyOQzmgMBaaBF6Hk
	WyqCyQT9186scNi2bUIrqtDDr3FN0QSrJ6QQXoZymgJLnuSC4dEGcpUk5Q1j71VsLNTQrqHs/WaEt
	oqyakELn6lmwQTReniaGm3MQiMXHjsbEHYOZ3HisX1Dbx9ZiBqy6hBOR74+9Re/4sFj11j7wIG3FL
	qjWbkEoEMxOK+ricXM6Xc/zNNVZr4qRo8OltluB7i71MI5bEUXrCKyO1PS6mpqm5UMM7i6ajlDWWh
	5DMih2Nyo9LKVEqiTn9OK4uxBj0FxmYSnYl3DHWyeMNdbEaBccqlJja+dnO/O29pBfoV/IzRJaF4z
	XVfaaPjw==;
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwXT-0000000DqOW-0h9I
	for opensbi@lists.infradead.org;
	Mon, 16 Nov 2026 13:14:30 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3adef977ad9so30811291fa.1
        for <opensbi@lists.infradead.org>; Mon, 16 Nov 2026 05:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794834864; cv=none;
        d=google.com; s=arc-20260327;
        b=Kwmyg69afB456LkxkjyFs6fa4aF9u81JbkeBv7vAXFpvlM9tjHylf9K3BQURV9ZGDK
         B+KP51joBUMmkwMxcddetvAuxwwJEO9UdgSl4+GDMwxq037k33vTJa83HyxFXQZOPk2A
         cIdJOB6EsBhKNsIPPCNhx2msexywa8HQyPG+RVC3eOf4p3KpaQqfiaGDrdlZerQB0Pum
         ZXfbz+T2xpobQ7dQEUNGbVnit9X0Tze/GA6jACzaziYlhWV5K0CGO2jEgS5ViO8WA7Qz
         fTURkGhmAJpUurfKVCHM1QT9pa4vwCzDl5EbkLAdZ0dI5Xg2iBnVrxt9ZVC+IesnHAys
         hlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4/sVTF7vmf41pSNQfzQ6l2qxZ3fjIw/kH6fGPZTUHvM=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=ApieI4bwryw+o3a/ygLBcdgsCtt2c0BGivgdw3B2imbR3v8Zje1u64hKiUkP86qkQ3
         m+ydZ1CECynjfu6cJCu5bLCkikFJ+1YkUsFn+1tN70wst3gRMbsX+6sY53I+JZIDkbca
         A9pX4LOGgKknQAmkEmsSEwYC0Rlno3O7cRFQFJI5s5IC7Xjx3RnnVAMoQFg1d6jWNAMY
         Msi9Jdt4YQQvGKZ6F5p+dCuAd+bNaDD4EdvOEkCvIeAaxPDtCzzshSNwxOZ7c3qmgW+s
         RVvBBPyIf4C8QyJIANVDoVeUOPlwo2ZbctBCz7EtZCkag7dGg0+DN35MMKh1cW8ahG/g
         Jn3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794834864; x=1795439664; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4/sVTF7vmf41pSNQfzQ6l2qxZ3fjIw/kH6fGPZTUHvM=;
        b=Ywtq2urW/I0zOPLBe9kDi32zZEql3A2SDznQs/i1pSR7wtsIQ4HrgwMdxE4HDxghBR
         jYzniT4VEY1TRMGP+KZdaHOKRdlFTvNLnsB2v4C+ZpicNFObxrSE/GdCRpePMHtnkIYN
         D+FxGrH6r+XW7Vd6Z/2bp/pSM09JZMd132yiLbqC+5lZteg6LOi4MGTrYRLosT/6lOHH
         +0o3xkj3lshgtZrxyjx72u3D6CkRzY7fVDr1UH/o3n6kssoamV/d3L9hY9DXgJUTBfpP
         NVeUK2ht9FyVVaVzZ+u0WYTSjqhD5DHhqM76EMtAwZEPqRh7MnZ2h4l8I1YzMWeoNr0y
         WpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834864; x=1795439664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/sVTF7vmf41pSNQfzQ6l2qxZ3fjIw/kH6fGPZTUHvM=;
        b=ydDwdqzTOt7Cvh4pak8/qEfHE/1vYY8ahBVb3mWrrU5+kXMPUw5uwk4Sra9VEwzpT5
         75blT5OQonhmVIvDmarqw+6rfTZIUoS9/3FLGM1UWgMc75MlVrk0K9g5c2qlIhPmzuEh
         jTX3sDs8Mm/bGZVLGZtExcuSEWr3hrtKphwM4yYAqfBlDKa47Z7mYZLhwCIfKsXoewGk
         iJAQvzvtS5IPDz9LQaBF98wEONTcYRDEkXDARY584EDVIYa6jrXD8o+Qkn97KWP/Gd4+
         N+LUdIpmJXjOMdbestK7ZUUlQ/dZbdVfzO28C1qAz+bHYFPP7SgiDCls/ODbwvHm5CO2
         ttpA==
X-Gm-Message-State: APuU4Z9LDa/tHMr1DQ2cnblf0Hn6tShT9KSWBJovAMr9r0H/h0PH4jnr
	7ko9EadpkWlz+IQxiirjdtcYqdh1uWCPX26+1DbFFfjZqZBRV99u+/5CwdOU0uj5MC1lRRCW1s2
	UJV0h7wM8mepQXSm/KTyOcLKVcK8xbJpsj4ccvECpPw==
X-Gm-Gg: AYBFou03unHyYoJvKaDES2XktB6YrVvzw8ze4GDZCZ+v1I5cdu6w1GaKfNRTM+TjQTE
	6c+lAWJM6hCnakTOx0ze5B8L7T27JVC+gKeo8tm59+e5XS3LSt/OX+jV1tnbk5sx4wwcLIWg5rI
	b2qJPGIhTqp4iG93dgyXKpMmn5BWiVxxcH/k/tGpasrYf9c1OkUJr1Q71E88VdtpfIKUU72huTC
	9s9IFjAdgm4i6kOu9dZtuTNM/DmL0yC+Qdw36QlU/uV7HsejuJfLQPVxp/Y9N8AzUMZeifWn1Ko
	iZQqQ0ieTaVNr73T9dwhy5i/20AAXQA20Xiy9yjhOm7M3n3G4itaJVMoRyNVlfi/6csv5zWJlS1
	enJUfx4MbVKtMO6YWWAkOziZXoh/cLTUlACj2G79jrL+PHp6aTr7LHU4gprMSKki1LZ1Y1P+5F1
	/JLBfOVu6yV/g/MUEMjonRfJW0DMznHQsoeUeJufVwt/rrONaHRLn1fZI=
X-Received: by 2002:a2e:be26:0:b0:3aa:f42a:b78 with SMTP id
 38308e7fff4ca-3ae2b51fa0fmr30592231fa.20.1794834863580; Mon, 16 Nov 2026
 05:14:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-4-peter.lin@sifive.com>
In-Reply-To: <20261110095029.117504-4-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 16 Nov 2026 18:44:11 +0530
X-Gm-Features: AclHuK-68qRhouhyHWB3NC60neOk-tleJ1m6XNMsNSMOLcLTPHc0VEOSEA1kvfo
Message-ID: <CAAhSdy3NdkzEfA8mScofX+HTWzgiOv-COwqit+FTmdGj3_aNhA@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] lib: fdt_domain: parse domain WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_131428_266997_9D6D4961 
X-CRM114-Status: GOOD (  28.97  )
X-Spam-Score: -0.2 (/)
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

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMzoyMOKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHdpZCBhbmQgd2lkZGVsZWcgZmllbGRz
IHRvIHN0cnVjdCBzYmlfZG9tYWluIHRvIHN0b3JlIHRoZQo+IFJJU0MtViBXb3JsZHMgbWx3aWQg
YW5kIG13aWRkZWxlZyBDU1IgdmFsdWVzIGZvciBlYWNoIGRvbWFpbi4KPiBBbHNvLCBwYXJzZSB0
aGUgcm9vdCBhbmQgdXNlci1kZWZpbmVkIGRvbWFpbnMnIFdJRCBkdXJpbmcKPiBmZHRfZG9tYWlu
c19wb3B1bGF0ZSgpLgo+Cj4gVGhlIHJvb3QgZG9tYWluIFdJRCBpcyBkZXNjcmliZWQgaW4gdGhl
ICJyb290IiBzdWJub2RlLCB3aGljaAo+IGNhcnJpZXMgdGhlICJvcGVuc2JpLGRvbWFpbixpbnN0
YW5jZSIgY29tcGF0aWJsZSBzdHJpbmcuIFNraXAKPiB0aGlzIG5vZGUgaW4gZmR0X2l0ZXJhdGVf
ZWFjaF9kb21haW4oKSBzbyB0aGF0IGl0IGlzIG5vdAo+IHRyZWF0ZWQgYXMgYSByZWd1bGFyIGRv
bWFpbiBpbnN0YW5jZS4KPgo+IFdoZW4gU21sd2lkIGlzIGltcGxlbWVudGVkLCB0aGUgIndpZCIg
cHJvcGVydHkgaXMgbWFuZGF0b3J5Cj4gZm9yIGFsbCBkb21haW5zOyBmYWlsIGRvbWFpbiBwb3B1
bGF0aW9uIGlmIGl0IGlzIG1pc3NpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGllbiBQZXRl
ciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKPiAtLS0KPiBDaGFuZ2VzIHY0LT52NToKPiAtIFJl
amVjdCB3aWQgPj0gWExFTiBhbmQsIG9uIFJWMzIsIHdpZGRlbGVnIHdpZGVyIHRoYW4gTVhMRU4s
IHNvCj4gICBCSVRfVUxMKGRvbS0+d2lkKSBpcyBzYWZlIChSYWRpbSkKPiAtIERyb3AgUkItdGFn
IGZyb20gQW51cAo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggICB8ICAgNiArKysK
PiAgbGliL3NiaS9zYmlfZG9tYWluLmMgICAgICAgfCAgIDIgKwo+ICBsaWIvdXRpbHMvZmR0L2Zk
dF9kb21haW4uYyB8IDEwMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMTEwIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3NiaS9zYmlfZG9tYWluLmggYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBpbmRleCA1
NmEyMTM5Ny4uNWEyOTFkMWYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5o
Cj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gQEAgLTE5LDYgKzE5LDggQEAKPgo+
ICBzdHJ1Y3Qgc2JpX3NjcmF0Y2g7Cj4KPiArI2RlZmluZSBJTlZBTElEX1dJRCAgICAoKHVuc2ln
bmVkIGludCl+MFUpCj4gKwo+ICAvKiogRG9tYWluIGFjY2VzcyB0eXBlcyAqLwo+ICBlbnVtIHNi
aV9kb21haW5fYWNjZXNzIHsKPiAgICAgICAgIFNCSV9ET01BSU5fUkVBRCA9ICgxVUwgPDwgMCks
Cj4gQEAgLTIxOCw2ICsyMjAsMTAgQEAgc3RydWN0IHNiaV9kb21haW4gewo+ICAgICAgICAgYm9v
bCBzeXN0ZW1fcmVzZXRfYWxsb3dlZDsKPiAgICAgICAgIC8qKiBJcyBkb21haW4gYWxsb3dlZCB0
byBzdXNwZW5kIHRoZSBzeXN0ZW0gKi8KPiAgICAgICAgIGJvb2wgc3lzdGVtX3N1c3BlbmRfYWxs
b3dlZDsKPiArICAgICAgIC8qKiBXb3JsZCBJRCBmb3IgdGhpcyBkb21haW4gKG1sd2lkIHZhbHVl
KSAqLwo+ICsgICAgICAgdTMyIHdpZDsKPiArICAgICAgIC8qKiBXb3JsZCBJRCBkZWxlZ2F0aW9u
IGJpdG1hc2sgZm9yIHRoaXMgZG9tYWluIChtd2lkZGVsZWcgdmFsdWUpICovCj4gKyAgICAgICB1
NjQgd2lkZGVsZWc7Cj4gICAgICAgICAvKiogSWRlbnRpZmllcyB3aGV0aGVyIHRvIGluY2x1ZGUg
dGhlIGZpcm13YXJlIHJlZ2lvbiAqLwo+ICAgICAgICAgYm9vbCBmd19yZWdpb25faW5pdGVkOwo+
ICB9Owo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW4uYyBiL2xpYi9zYmkvc2JpX2Rv
bWFpbi5jCj4gaW5kZXggNDJmZTU2MzIuLmJlOTAyMGQwIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkv
c2JpX2RvbWFpbi5jCj4gKysrIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBAQCAtMzAsNiArMzAs
OCBAQCBzdHJ1Y3Qgc2JpX2RvbWFpbiByb290ID0gewo+ICAgICAgICAgLnBvc3NpYmxlX2hhcnRz
ID0gTlVMTCwKPiAgICAgICAgIC5zeXN0ZW1fcmVzZXRfYWxsb3dlZCA9IHRydWUsCj4gICAgICAg
ICAuc3lzdGVtX3N1c3BlbmRfYWxsb3dlZCA9IHRydWUsCj4gKyAgICAgICAud2lkID0gSU5WQUxJ
RF9XSUQsCj4gKyAgICAgICAud2lkZGVsZWcgPSAwLAo+ICAgICAgICAgLmZ3X3JlZ2lvbl9pbml0
ZWQgPSBmYWxzZSwKPiAgfTsKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9kb21h
aW4uYyBiL2xpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5jCj4gaW5kZXggZTRjY2U4YzMuLjI5NTU4
N2IwIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5jCj4gKysrIGIvbGli
L3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMKPiBAQCAtMTMsNiArMTMsNyBAQAo+ICAjaW5jbHVkZSA8
c2JpL3NiaV9jb25zb2xlLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2RvbWFpbi5oPgo+ICAjaW5j
bHVkZSA8c2JpL3NiaV9lcnJvci5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9oYXJ0Lmg+Cj4gICNp
bmNsdWRlIDxzYmkvc2JpX2hhcnRtYXNrLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2hlYXAuaD4K
PiAgI2luY2x1ZGUgPHNiaS9zYmlfc2NyYXRjaC5oPgo+IEBAIC0zNyw2ICszOCw5IEBAIGludCBm
ZHRfaXRlcmF0ZV9lYWNoX2RvbWFpbih2b2lkICpmZHQsIHZvaWQgKm9wYXF1ZSwKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIDA7Cj4KPiAgICAgICAgIGZkdF9mb3JfZWFjaF9zdWJub2RlKGRvZmZz
ZXQsIGZkdCwgcG9mZnNldCkgewo+ICsgICAgICAgICAgICAgICBpZiAoIXN0cmNtcChmZHRfZ2V0
X25hbWUoZmR0LCBkb2Zmc2V0LCBOVUxMKSwgInJvb3QiKSkKPiArICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsKPiArCj4gICAgICAgICAgICAgICAgIGlmIChmZHRfbm9kZV9jaGVja19j
b21wYXRpYmxlKGZkdCwgZG9mZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIm9wZW5zYmksZG9tYWluLGluc3RhbmNlIikpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgY29udGludWU7Cj4gQEAgLTI5MCw2ICsyOTQsNTcgQEAgc3RhdGljIGludCBf
X2ZkdF9wYXJzZV9yZWdpb24oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNldCwKPiAg
ICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIHZvaWQgZmR0X3BhcnNlX2RvbWFpbl93
aWRfcHJvcHMoY29uc3Qgdm9pZCAqZmR0LCBpbnQgb2Zmc2V0LAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gK3sKPiArICAg
ICAgIGNvbnN0IGZkdDMyX3QgKnZhbDsKPiArICAgICAgIGludCBsZW47Cj4gKyAgICAgICB1NjQg
dmFsNjQ7Cj4gKwo+ICsgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBvZmZzZXQsICJ3aWQi
LCAmbGVuKTsKPiArICAgICAgIGlmICh2YWwgJiYgbGVuID09IHNpemVvZihmZHQzMl90KSkKPiAr
ICAgICAgICAgICAgICAgZG9tLT53aWQgPSBmZHQzMl90b19jcHUodmFsWzBdKTsKPiArCj4gKyAg
ICAgICB2YWwgPSBmZHRfZ2V0cHJvcChmZHQsIG9mZnNldCwgIndpZGRlbGVnIiwgJmxlbik7Cj4g
KyAgICAgICBpZiAodmFsICYmIChsZW4gPT0gKDIgKiBzaXplb2YoZmR0MzJfdCkpKSkgewo+ICsg
ICAgICAgICAgICAgICB2YWw2NCA9IGZkdDMyX3RvX2NwdSh2YWxbMF0pOwo+ICsgICAgICAgICAg
ICAgICB2YWw2NCA9ICh2YWw2NCA8PCAzMikgfCBmZHQzMl90b19jcHUodmFsWzFdKTsKPiArICAg
ICAgICAgICAgICAgZG9tLT53aWRkZWxlZyA9IHZhbDY0Owo+ICsgICAgICAgfQo+ICt9Cj4gKwo+
ICtzdGF0aWMgaW50IHZhbGlkYXRlX2RvbWFpbl93aWQoY29uc3Qgc3RydWN0IHNiaV9kb21haW4g
KmRvbSkKPiArewo+ICsgICAgICAgLyogV29ybGRzIHN1cHBvcnRzIGF0IG1vc3QgWExFTiBXSURz
LCBhbmQgbXdpZGRlbGVnIGlzIE1YTEVOIGJpdHMgKi8KPiArICAgICAgIGlmIChkb20tPndpZCAh
PSBJTlZBTElEX1dJRCAmJiBkb20tPndpZCA+PSBfX3Jpc2N2X3hsZW4pIHsKPiArICAgICAgICAg
ICAgICAgc2JpX3ByaW50ZigiJXM6IGRvbWFpbiBcIiVzXCI6IFwid2lkXCIgJXUgZXhjZWVkcyBt
YXggV0lEICV1XG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBkb20t
Pm5hbWUsIGRvbS0+d2lkLCBfX3Jpc2N2X3hsZW4gLSAxKTsKPiArICAgICAgICAgICAgICAgcmV0
dXJuIFNCSV9FSU5WQUw7Cj4gKyAgICAgICB9Cj4gKwo+ICsjaWYgX19yaXNjdl94bGVuID09IDMy
Cj4gKyAgICAgICBpZiAoZG9tLT53aWRkZWxlZyA+PiAzMikgewo+ICsgICAgICAgICAgICAgICBz
YmlfcHJpbnRmKCIlczogZG9tYWluIFwiJXNcIjogXCJ3aWRkZWxlZ1wiIDB4JWxseCBleGNlZWRz
IE1YTEVOXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBkb20tPm5h
bWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZylkb20t
PndpZGRlbGVnKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKyAgICAg
ICB9Cj4gKyNlbmRpZgo+ICsKPiArICAgICAgIGlmIChkb20tPndpZCAhPSBJTlZBTElEX1dJRCkK
PiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hh
c19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCksCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBTQklfSEFSVF9FWFRfU01MV0lEKSkgewo+ICsgICAgICAgICAg
ICAgICBzYmlfcHJpbnRmKCIlczogZG9tYWluIFwiJXNcIjogbWlzc2luZyBcIndpZFwiIgo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICIgcHJvcGVydHkgKHJlcXVpcmVkIGJ5IFNtbHdpZClc
biIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGRvbS0+bmFtZSk7Cj4g
KyAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsgICAgICAgfQo+ICsKPiArICAg
ICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IF9fZmR0X3BhcnNlX2RvbWFpbihj
b25zdCB2b2lkICpmZHQsIGludCBkb21haW5fb2Zmc2V0LCB2b2lkICpvcGFxdWUpCj4gIHsKPiAg
ICAgICAgIHUzMiB2YWwzMjsKPiBAQCAtMzA2LDYgKzM2MSw3IEBAIHN0YXRpYyBpbnQgX19mZHRf
cGFyc2VfZG9tYWluKGNvbnN0IHZvaWQgKmZkdCwgaW50IGRvbWFpbl9vZmZzZXQsIHZvaWQgKm9w
YXF1ZSkKPiAgICAgICAgIGRvbSA9IHNiaV96YWxsb2Moc2l6ZW9mKCpkb20pKTsKPiAgICAgICAg
IGlmICghZG9tKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT01FTTsKPiArICAgICAg
IGRvbS0+d2lkID0gSU5WQUxJRF9XSUQ7Cj4KPiAgICAgICAgIHByZWcuZG9tID0gZG9tOwo+ICAg
ICAgICAgcHJlZy5yZWdpb25fY291bnQgPSAwOwo+IEBAIC00NDksNiArNTA1LDEyIEBAIHN0YXRp
YyBpbnQgX19mZHRfcGFyc2VfZG9tYWluKGNvbnN0IHZvaWQgKmZkdCwgaW50IGRvbWFpbl9vZmZz
ZXQsIHZvaWQgKm9wYXF1ZSkKPiAgICAgICAgIH0KPiAgICAgICAgIGRvbS0+bmV4dF9tb2RlID0g
dmFsMzI7Cj4KPiArICAgICAgIC8qIFJlYWQgIndpZCIgYW5kICJ3aWRkZWxlZyIgRFQgcHJvcGVy
dGllcyAqLwo+ICsgICAgICAgZmR0X3BhcnNlX2RvbWFpbl93aWRfcHJvcHMoZmR0LCBkb21haW5f
b2Zmc2V0LCBkb20pOwo+ICsgICAgICAgZXJyID0gdmFsaWRhdGVfZG9tYWluX3dpZChkb20pOwo+
ICsgICAgICAgaWYgKGVycikKPiArICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfYWxsOwo+
ICsKPiAgICAgICAgIC8qIFJlYWQgInN5c3RlbS1yZXNldC1hbGxvd2VkIiBEVCBwcm9wZXJ0eSAq
Lwo+ICAgICAgICAgaWYgKGZkdF9nZXRfcHJvcGVydHkoZmR0LCBkb21haW5fb2Zmc2V0LAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgInN5c3RlbS1yZXNldC1hbGxvd2VkIiwgTlVMTCkp
Cj4gQEAgLTQ3NywxMiArNTM5LDUyIEBAIGZhaWxfZnJlZV9kb21haW46Cj4gICAgICAgICByZXR1
cm4gZXJyOwo+ICB9Cj4KPiArc3RhdGljIGludCBmZHRfcm9vdF9kb21haW5fb2Zmc2V0KGNvbnN0
IHZvaWQgKmZkdCkKPiArewo+ICsgICAgICAgaW50IG9mZnNldDsKPiArCj4gKyAgICAgICBvZmZz
ZXQgPSBmZHRfcGF0aF9vZmZzZXQoZmR0LCAiL2Nob3NlbiIpOwo+ICsgICAgICAgaWYgKG9mZnNl
dCA8IDApCj4gKyAgICAgICAgICAgICAgIHJldHVybiBvZmZzZXQ7Cj4gKwo+ICsgICAgICAgb2Zm
c2V0ID0gZmR0X25vZGVfb2Zmc2V0X2J5X2NvbXBhdGlibGUoZmR0LCBvZmZzZXQsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAib3BlbnNiaSxkb21haW4s
Y29uZmlnIik7Cj4gKyAgICAgICBpZiAob2Zmc2V0IDwgMCkKPiArICAgICAgICAgICAgICAgcmV0
dXJuIG9mZnNldDsKPiArCj4gKyAgICAgICByZXR1cm4gZmR0X3N1Ym5vZGVfb2Zmc2V0KGZkdCwg
b2Zmc2V0LCAicm9vdCIpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGZkdF9wYXJzZV9yb290X2Rv
bWFpbihjb25zdCB2b2lkICpmZHQpCj4gK3sKPiArICAgICAgIGludCBvZmZzZXQ7Cj4gKwo+ICsg
ICAgICAgaWYgKGZkdCkgewo+ICsgICAgICAgICAgICAgICBvZmZzZXQgPSBmZHRfcm9vdF9kb21h
aW5fb2Zmc2V0KGZkdCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChvZmZzZXQgPj0gMCkKPiArICAg
ICAgICAgICAgICAgICAgICAgICBmZHRfcGFyc2VfZG9tYWluX3dpZF9wcm9wcyhmZHQsIG9mZnNl
dCwgJnJvb3QpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBFbnN1
cmUgcm9vdCBkb21haW4gaGFzIGEgdmFsaWQgV0lECj4gKyAgICAgICAgKiBldmVuIGlmIEZEVCBv
ciByb290IHN1Ym5vZGUgaXMgYWJzZW50Cj4gKyAgICAgICAgKi8KPiArICAgICAgIHJldHVybiB2
YWxpZGF0ZV9kb21haW5fd2lkKCZyb290KTsKPiArfQo+ICsKPiAgaW50IGZkdF9kb21haW5zX3Bv
cHVsYXRlKGNvbnN0IHZvaWQgKmZkdCkKPiAgewo+ICsgICAgICAgaW50IGVycjsKPiArCj4gICAg
ICAgICAvKiBTYW5pdHkgY2hlY2tzICovCj4gICAgICAgICBpZiAoIWZkdCkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4KPiArICAgICAgIC8qIFBhcnNlIHJvb3QgZG9tYWlu
IGNvbmZpZyBmcm9tICJyb290IiBzdWJub2RlICovCj4gKyAgICAgICBlcnIgPSBmZHRfcGFyc2Vf
cm9vdF9kb21haW4oZmR0KTsKPiArICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiBlcnI7Cj4gKwo+ICAgICAgICAgLyogSXRlcmF0ZSBvdmVyIGVhY2ggZG9tYWluIGluIEZE
VCBhbmQgcG9wdWxhdGUgZGV0YWlscyAqLwo+ICAgICAgICAgcmV0dXJuIGZkdF9pdGVyYXRlX2Vh
Y2hfZG9tYWluX3JvKGZkdCwgTlVMTCwgX19mZHRfcGFyc2VfZG9tYWluKTsKPiAgfQo+IC0tCj4g
Mi40My43Cj4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
