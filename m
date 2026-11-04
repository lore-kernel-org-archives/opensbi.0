Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC88606A31B
	for <opensbi@archiver.kernel.org>; Wed,  4 Nov 2026 03:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=URAOV9Lb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=AlN2O+kw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KRAQh9ks8lcEgndzXRyp1vInsI2NnXue4/stwLzN+jw=; b=URAOV9Lbgea6v6gYQc1DCkLo0z
	zeJJJIHehkemqWpBud6Kt2w1Eg2BwTSdLdzmQwA4dE1tBdCF+hg3AL2eJymJzaNHGpbnL4xn+sXUE
	UKh856c49LIBg9ok24ClzEKtAPgw3aWuvTVJQJH27i39yP+neXBkDV9iJD/2V35XKe0MDaU4jyMhV
	TMGjXCf1axv47DCTSOtRfgVzRXTiw8ILF3fAdl5ZZ+NHydlVnm/v53ToixPg216spgQ5otArVbd5N
	jVe9EWRzcNYY2XufwHcVgXGLS7d4GbZXHNNupBE2LYBEi3Du3GyFIh1Ql69Z7dRZSHFrHwziq5mOM
	EX165zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORjp-00000004GCe-3AL2;
	Wed, 04 Nov 2026 03:32:37 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORjl-00000004GC3-46jd
	for opensbi@lists.infradead.org;
	Wed, 04 Nov 2026 03:32:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso179747f8f.2
        for <opensbi@lists.infradead.org>; Tue, 03 Nov 2026 19:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793763152; cv=none;
        d=google.com; s=arc-20260327;
        b=sbyTQDbVNk1RoDiw4nnxCYtuDvejHsVkoAHCW5JRttDaaL5CB/6WXo0oskWllHL7Gd
         ZwtUr/XIaLUTnorUoYWtILen4ePdG024J6eFytKqnLOoJDtxu3gLT2RXGFr6DauTTXYr
         Gjb/hENGHrWkb4t0sSq5qPLUkLwyh4vcuuJ5OZdCAxkFcd2ukcO5+jiXQqOIxTQZ+Njc
         Ew6AdBby2mYRJJe10Tskhep5d0N/eXL8Ui44PcfRPzrLUy1AO8bziyIMAXK++uxoMOza
         k8rawk6lwoaNlPhtgxguU5ZngMK5seh1ZXDyFnoE/VmUdQZ6ehXlthPlGy9DGCGZEf7N
         V74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mAtSVkU6toZK0uQXecJoYHzP9WlDeDBSztinhTFyojg=;
        fh=kzaInViZNSOfpfRS6IdHZX/H7OfEmg1t+EHUNhdJ0Xs=;
        b=mhpVT8cKWnLGECn4CSqTeN9CMOXe0Wxf63HTPx9nXgjZidF4LnUFc0dgwDscWnkrSl
         sqYUdR55rv/Xn5gLwJIbpu7eNNlv4wgHTLFmSPiPXlp8r8RrxMOkKYO1bua669JRj0Hx
         rDn+unm8KKxCicWckAhc4MpBrVFkPV/i9+UZw7DTSqNG61VbPCIwtr+NidIYg98WgDV8
         O+gyJPF1swsQTZE+v/koynNSC0+jwYBjAB+ceUowoliwPm+taLiFbyxqGu4yrZNRHZ/U
         cYDDG1z4LwBD8+NhXPf5lfHu7vQBofSEb/Ixd6g24/zINYrNVGJrzB1GtJ401ybd3ZZf
         7L3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793763152; x=1794367952; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mAtSVkU6toZK0uQXecJoYHzP9WlDeDBSztinhTFyojg=;
        b=AlN2O+kw0O7JniOwN7LVyYGLKuCE0om27EZ48FTb33Tcqw4xYl6XpnVJ1ki+eirdlh
         3Nmxg063JNARvAJBtoaE3TGryGpwWAX6LzvUDvwQJVvhJyIRWolaYEYPnMBrHWOWe9yk
         ulHPgJggdgaW1/QwTVkkM/uBNlgmjJ6nIBSlsCRJZXBJEDzPk+TVD0WMC8OxybscU20M
         8Qjr8H9tsY3+Kf1PW2aCuPjF4dfoWaLZlKpRfhOrZzaF96UXsZ/R/sd01/H+aDSdKUof
         RZao8XsH8PcXPRaPkH73nbgS1EvvQg6Pd4HDNRL+fDLWKkwJTQ8WjB6Jduv47J1sSlRt
         6MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763152; x=1794367952;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAtSVkU6toZK0uQXecJoYHzP9WlDeDBSztinhTFyojg=;
        b=Qx9BsHMPfsMsJIot2I0szioyD199K1/xrEUKYRx8tL2+XeinfGKOId4XFW4I6VOdDn
         MzdMYHttGiPB9I/avLIqk0Pqcjxw2gn2J2Jy4d9GziLncHcL9HP9eJeTkpG5jEOcSg5Q
         tAGkKFtViNxw7doCTuptw0h7TApdC+nYCl4EjohlmdhRcdjwWKvcANwpwjAxwpYV4gQo
         qEgBW1gU3YYHtmj5JOjYqw2potyyki7jF/T8dzVqXpRdcVrqQOT8pI2hxExdCcf+1vV4
         1ig4FXvh69u7XFNibkwWGKx19MeoLijisXnmYX9Aq/lkrWm9SSZoTAygLaOxUYkWE66K
         p2kQ==
X-Gm-Message-State: APuU4Z/ZncwnOZ4FwYgBwVIekQldYsmLlgQchcGGJ4zLG/uLLdVoZ9wt
	geguqS6G706DzgpbE4oiyS9NsTmH9gnQS3ug62CSappeSw7whGLeOyxQ6DCuhRK6muWH3b7p+sA
	0+BKPJ/98dvL3cFID5NGTpXNa0RC/2q72tdY/9UFrWw==
X-Gm-Gg: AYBFou2V5OATXozrqIA6ki4B3wYm1wkIxgtD++Qc/tFVhuczdtY8soPXuSlVMq7vhQu
	ceAoScUWbNvBMyINM+LD0Ymzl50JQ/vgpXr6EsAvj/TVtkJxHNXw7xScS4hyoKxmygZagGOB6L4
	60U2GaSnzq7AC5m/jE6j4eVseUG1Vxn3RElKa1vxmVrixtiahzPicU8Zyh0H9UXrW1Y7wAT/J3t
	nTNM0uiJxfdEsSSjzfPZ9DBoQ9y5ny8klIQaOWzb40L7+4GeizqCfYv1O9o8QJuzkIZNtP2U5YR
	0xY2lfWrodcsS8d3ptq+Wty5vmohkeRC4abxkgVrZ+cxUMpPpHdsMk4/K7jAU1jtjii9TSKdMhp
	D28x3x9ewMtbPMQKzCtQ87ZeX2kzVFeAHLLSyl7nHrf4xYZRSIMYR7bVlhm7/P5j9xFF7/sI8Op
	Qk+JTJv78vP5Mpc6acp0CkiXMqMvTj/NR35FxFttckBd+HuxbDtLT+cB7AA9mlg66Ua95ORS/Li
	4W/
X-Received: by 2002:a05:6000:4914:b0:48c:69b3:610f with SMTP id
 ffacd0b85a97d-48e6e5008b4mr32014605f8f.26.1793763151553; Tue, 03 Nov 2026
 19:32:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006193609.735547-1-nickolai@csail.mit.edu>
In-Reply-To: <20261006193609.735547-1-nickolai@csail.mit.edu>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Nov 2026 09:01:42 +0530
X-Gm-Features: AclHuK-W8l-VXwqwNlBfCvkN-k8jfhGTCeLDUX7EIKKW1XNqREH8yQhJ8qbNo2w
Message-ID: <CAAhSdy0nRSHsT=Ue9MB+vN4YfCfc9-jY+MyxH1+zScWuHZUGaw@mail.gmail.com>
Subject: Re: [PATCH] firmware: fw_base: add an acquire fence after the
 _boot_status wait loop
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: opensbi@lists.infradead.org, 
	Nickolai Zeldovich <nickolai.zeldovich@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_193234_057810_F12C2176 
X-CRM114-Status: GOOD (  31.92  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgNywgMjAyNiBhdCAxOjA24oCvQU0gTmlja29sYWkgWmVsZG92aWNoCjxuaWNr
b2xhaUBjc2FpbC5taXQuZWR1PiB3cm90ZToKPgo+IEZyb206IE5pY2tvbGFpIFplbGRvdmljaCA8
bmlja29sYWkuemVsZG92aWNoQGdtYWlsLmNvbT4KPgo+IE5vbi1ib290IGhhcnRzIGV4aXQgX3dh
aXRfZm9yX2Jvb3RfaGFydCBvbiBhIHBsYWluIGxvYWQgb2YgX2Jvb3Rfc3RhdHVzCj4gYW5kIGdv
IG9uIHRvIHJlYWQgcGxhdGZvcm0uaGFydF9pbmRleDJpZCBhbmQgb3RoZXIgZGF0YSB0aGUgYm9v
dCBoYXJ0Cj4gcmVsb2NhdGVkIGJlZm9yZSBwdWJsaXNoaW5nLiAgTm90aGluZyBvcmRlcnMgdGhv
c2UgbG9hZHMgYWZ0ZXIgdGhlCj4gc3RhdHVzIGxvYWQsIHNvIHVuZGVyIFJWV01PIGEgaGFydCBj
YW4gcmVhZCB0aGUgdW5yZWxvY2F0ZWQgcG9pbnRlciBhbmQKPiBmYXVsdCB0aHJvdWdoIGl0IGJl
Zm9yZSBtdHZlYyBpcyBzZXQuCj4KPiBQYWlyIHRoZSBib290IGhhcnQncyByZWxlYXNlIGZlbmNl
IHdpdGggYSAiZmVuY2UgciwgcnciIGFmdGVyIHRoZSBsb29wLgo+Cj4gU2lnbmVkLW9mZi1ieTog
Tmlja29sYWkgWmVsZG92aWNoIDxuaWNrb2xhaS56ZWxkb3ZpY2hAZ21haWwuY29tPgo+IENvLUF1
dGhvcmVkLUJ5OiBDbGF1ZGUgRmFibGUgNS4xIDxub3JlcGx5QGFudGhyb3BpYy5jb20+CgpVc2Ug
QXNzaXN0ZWQtYnkgaW5zdGVhZCBvZiBDby1BdXRob3JlZC1CeSBmb3IgTExNcy4KCj4gLS0tCj4g
VGhpcyBidWcgd2FzIGZvdW5kIGluIHRoZSBwcm9jZXNzIG9mIGZvcm1hbGx5IHZlcmlmeWluZyB0
aGUgY29ycmVjdG5lc3MKPiBvZiBPcGVuU0JJIG9uIHRvcCBvZiB0aGUgU2FpbCBSSVNDLVYgc2Vt
YW50aWNzIHVzaW5nIExlYW4uCj4KPiBTdW1tYXJ5Ogo+Cj4gTm9uLWJvb3QgaGFydHMgbGVhdmUg
X3dhaXRfZm9yX2Jvb3RfaGFydCBvbiBhIHBsYWluIGxvYWQgb2YgX2Jvb3Rfc3RhdHVzCj4gYW5k
IGltbWVkaWF0ZWx5IHJlYWQgZGF0YSB0aGUgYm9vdCBoYXJ0IHByb2R1Y2VkIGJlZm9yZSBwdWJs
aXNoaW5nLgo+IE5vdGhpbmcgb24gdGhlIHdhaXRpbmcgc2lkZSBvcmRlcnMgdGhhdCBsb2FkIGJl
Zm9yZSB0aGUgbGF0ZXIgbG9hZHMuCj4gVW5kZXIgUlZXTU8gYSB3YWl0ZXIgY2FuIG9ic2VydmUg
dGhlICJkb25lIiBzdGF0dXMgYW5kIHN0aWxsIHJlYWQgcHJlLQo+IHJlbG9jYXRpb24gdmFsdWVz
LCBpbmNsdWRpbmcgdGhlIHVucmVsb2NhdGVkIHBsYXRmb3JtLmhhcnRfaW5kZXgyaWQKPiBwb2lu
dGVyLCBhbmQgZmF1bHQgdGhyb3VnaCBpdCBiZWZvcmUgbXR2ZWMgaXMgc2V0LiBPbmUgZmVuY2Ug
ciwgcncgYWZ0ZXIKPiB0aGUgbG9vcCBjbG9zZXMgaXQuCj4KPiBBbiBleGVjdXRpb24gdGhhdCB0
cmlnZ2VycyBpdDoKPgo+IFNldHVwOiBmd19keW5hbWljIGxvYWRlZCBhdCBhbiBhZGRyZXNzIGRp
ZmZlcmVudCBmcm9tIGl0cyBsaW5rIGFkZHJlc3MsCj4gc28gdGhlIGJvb3QgaGFydCBydW5zIHRo
ZSBzZWxmLXJlbG9jYXRpb24gcGFzczsgZWlnaHQgaGFydHM7IFJWV01PCj4gaGFyZHdhcmUgKG9y
IGFueSBtb2RlbCB0aGF0IGxldHMgYSBwbGFpbiBsb2FkIGJlIHNhdGlzZmllZCBlYXJseSwgZS5n
Lgo+IHRoZSBTYWlsL01hY2hDU0wgbW9kZWwgdXNlZCB0byBmaW5kIHRoaXMpLgo+Cj4gMS4gSGFy
dCAxIHJlYWNoZXMgX3dhaXRfZm9yX2Jvb3RfaGFydCB3aGlsZSBoYXJ0IDAgaXMgc3RpbGwgcmVs
b2NhdGluZy4KPiAgICBIYXJ0IDEncyBsb29wIGJvZHkgaXMgbGQgdDEsIF9ib290X3N0YXR1czsg
ZGl2OyBkaXY7IGRpdjsgYm5lLiBJdHMKPiAgICBsb2FkIG9mIF9ib290X3N0YXR1cyByZXR1cm5z
IHRoZSBwcmUtZG9uZSB2YWx1ZSwgaXQgbG9vcHMuCj4gMi4gSGFydCAxJ3MgY29yZSBzcGVjdWxh
dGl2ZWx5IGlzc3VlcyB0aGUgKm5leHQqIGl0ZXJhdGlvbidzIGxvYWRzCj4gICAgZWFybHkuIFJW
V01PIGFsbG93cyBhIGxhdGVyIGxvYWQgdG8gYmUgcGVyZm9ybWVkIGJlZm9yZSBhbiBlYXJsaWVy
Cj4gICAgbG9hZCB0byBhIGRpZmZlcmVudCBhZGRyZXNzIHdoZW4gbm90aGluZyBvcmRlcnMgdGhl
bS4gSW4gcGFydGljdWxhcgo+ICAgIHRoZSBsb2FkcyB0aGF0IGZvbGxvdyB0aGUgbG9vcCBleGl0
LCBsd3UgcGxhdGZvcm0uaGFydF9jb3VudCwgbGQKPiAgICBwbGF0Zm9ybS5oYXJ0X2luZGV4Mmlk
LCBtYXkgYmUgc2F0aXNmaWVkIG5vdywgZnJvbSBtZW1vcnkgdGhhdCBoYXJ0IDAKPiAgICBoYXMg
bm90IHlldCByZXdyaXR0ZW46IHBsYXRmb3JtLmhhcnRfaW5kZXgyaWQgc3RpbGwgaG9sZHMgaXRz
IGxpbmstCj4gICAgdGltZSB2YWx1ZSAweDQ0OWY4Lgo+IDMuIEhhcnQgMCBmaW5pc2hlczogaXQg
Zml4ZXMgdXAgcGxhdGZvcm0uaGFydF9pbmRleDJpZCB0byAweDgwMDQ0OWY4IHZpYQo+ICAgIHRo
ZSBSX1JJU0NWX1JFTEFUSVZFIHBhc3MsIGV4ZWN1dGVzIGZlbmNlIHJ3LCBydywgc3RvcmVzIF9i
b290X3N0YXR1cwo+ICAgID0gQk9PVF9TVEFUVVNfQk9PVF9IQVJUX0RPTkUuCj4gNC4gSGFydCAx
J3MgbG9vcCBsb2FkIG5vdyByZXR1cm5zIERPTkUsIHRoZSBibmUgZmFsbHMgdGhyb3VnaC4gVGhl
Cj4gICAgYWxyZWFkeS1wZXJmb3JtZWQgbG9hZCBvZiBwbGF0Zm9ybS5oYXJ0X2luZGV4MmlkIGlz
IG5vdCByZS1leGVjdXRlZDoKPiAgICBzOSA9IDB4NDQ5ZjguCj4gNS4gSGFydCAxIGV4ZWN1dGVz
IGx3dSBhNSwgMChzOSk6IGEgbG9hZCBmcm9tIDB4NDQ5ZjgsIHdoaWNoIGlzIG91dHNpZGUKPiAg
ICBldmVyeSBQTUEgcmVnaW9uIG9uIHRoZSB2aXJ0IHBsYXRmb3JtLiBUaGUgYWNjZXNzIGZhdWx0
cy4KPiA2LiBIYXJ0IDEgaGFzIG5vdCB5ZXQgZXhlY3V0ZWQgX3N0YXJ0X3dhcm0ncyBjc3J3IG10
dmVjOyBtdHZlYyBob2xkcyBpdHMKPiAgICByZXNldCB2YWx1ZS4gVGhlIHRyYXAgdmVjdG9ycyB0
byBhbiB1bmRlZmluZWQgYWRkcmVzcyBhbmQgdGhlIGhhcnQgaXMKPiAgICBsb3N0LiBUaGUgc3lz
dGVtIGJvb3RzIHdpdGggNyBoYXJ0cywgb3IgaGFuZ3MgaW4gc21wX2luaXQgd2FpdGluZyBmb3IK
PiAgICBpdC4KPgo+IFRoZSByZWxlYXNlIG9uIHRoZSBib290IGhhcnQgKGZlbmNlIHJ3LCBydyBi
ZWZvcmUgdGhlIHN0YXR1cyBzdG9yZSkgaXMKPiBjb3JyZWN0OyB0aGUgYnVnIGlzIHRoZSBtaXNz
aW5nIGFjcXVpcmUgb24gdGhlIHdhaXRpbmcgc2lkZS4gVGhlIGZlbmNlCj4gYWRkZWQgaGVyZSBz
aXRzICphZnRlciogdGhlIGxvb3AgYW5kIHJ1bnMgb25jZSBwZXIgaGFydC4gQSAyMDE5IGF0dGVt
cHQKPiBwbGFjZWQgYSBmZW5jZSBydywgcncgaW5zaWRlIHRoZSBsb29wIGJlZm9yZSB0aGUgbG9h
ZCAoMDU2MDJlMmJmNDgxKSBhbmQKPiB3YXMgcmV2ZXJ0ZWQgKDY5ZDc5NGNiY2JhYikgYWZ0ZXIg
YSB3YXJtLXJlc2V0IHJlZ3Jlc3Npb24gb24gdGhlIEhpRml2ZQo+IFVubGVhc2hlZCB3aG9zZSBy
b290IGNhdXNlIHdhcyBuZXZlciBmb3VuZDsgdGhhdCBmZW5jZSBkaWQgbm90IHByb3ZpZGUKPiB0
aGUgbmVlZGVkIG9yZGVyaW5nIGFueXdheS4KPgo+IFZlcmlmaWNhdGlvbjoKPgo+IFByb3ZlZDog
d2l0aCB0aGUgZmVuY2UsIHRoZSBub24tYm9vdCBoYXJ0cycgcGF0aCBmcm9tIF9zdGFydCB0bwo+
IF9zdGFydF93YXJtIHNhdGlzZmllcyBpdHMgY29udHJhY3QgYWdhaW5zdCB0aGUgU2FpbCBSSVND
LVYgbW9kZWwgdW5kZXIKPiBhbiBSVldNTy1mYWl0aGZ1bCBtZW1vcnkgbW9kZWwuIFdpdGhvdXQg
dGhlIGZlbmNlIHRoZSBzdGFsZSByZWFkIGlzIGFuCj4gYWxsb3dlZCBleGVjdXRpb24gYW5kIHRo
ZSBjb250cmFjdCBpcyB1bnByb3ZhYmxlLgo+Cj4gZmlybXdhcmUvZndfYmFzZS5TIHwgMTEgKysr
KysrKysrKysgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPgo+IEZZSSwgdGhlIHNh
bWUgY2hhbmdlIGlzIGFsc28gZmlsZWQgYXMgR2l0SHViIHB1bGwgcmVxdWVzdCAjNDI5Ogo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3BlbnNiaS9wdWxsLzQyOQoKTWlz
c2luZyAiLS0tIiBvdmVyIGhlcmUuCgo+Cj4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL2Z3X2Jhc2Uu
UyBiL2Zpcm13YXJlL2Z3X2Jhc2UuUwo+IGluZGV4IGE3NmRkYzFiLi4yOTQ3ODdhMiAxMDA2NDQK
PiAtLS0gYS9maXJtd2FyZS9md19iYXNlLlMKPiArKysgYi9maXJtd2FyZS9md19iYXNlLlMKPiBA
QCAtNDA3LDYgKzQwNywxNyBAQCBfd2FpdF9mb3JfYm9vdF9oYXJ0Ogo+ICAgICAgICAgZGl2ICAg
ICB0MiwgdDIsIHplcm8KPiAgICAgICAgIGRpdiAgICAgdDIsIHQyLCB6ZXJvCj4gICAgICAgICBi
bmUgICAgIHQwLCB0MSwgX3dhaXRfZm9yX2Jvb3RfaGFydAo+ICsgICAgICAgLyoKPiArICAgICAg
ICAqIEFjcXVpcmU6IG9yZGVyIHRoZSBfYm9vdF9zdGF0dXMgbG9hZCBhYm92ZSBiZWZvcmUgZXZl
cnkgbGF0ZXIKPiArICAgICAgICAqIGxvYWQgKHBsYXRmb3JtLmhhcnRfY291bnQsIHBsYXRmb3Jt
LmhhcnRfaW5kZXgyaWQsIHRoZSBzY3JhdGNoCj4gKyAgICAgICAgKiBzcGFjZSwgLi4uKS4gIFRo
ZSBib290IGhhcnQgcHVibGlzaGVzIHdpdGggImZlbmNlIHJ3LCBydyIgYmVmb3JlCj4gKyAgICAg
ICAgKiBpdHMgc3RvcmUgdG8gX2Jvb3Rfc3RhdHVzLCBidXQgd2l0aG91dCBhIG1hdGNoaW5nIGFj
cXVpcmUgaGVyZQo+ICsgICAgICAgICogUlZXTU8gbGV0cyBhIHdhaXRpbmcgaGFydCB0aGF0IHNh
dyBCT09UX1NUQVRVU19CT09UX0hBUlRfRE9ORQo+ICsgICAgICAgICogc3RpbGwgcmVhZCBwcmUt
cmVsb2NhdGlvbiB2YWx1ZXMsIGUuZy4gdGhlIHVucmVsb2NhdGVkCj4gKyAgICAgICAgKiBwbGF0
Zm9ybS5oYXJ0X2luZGV4MmlkIHBvaW50ZXIsIGFuZCBmYXVsdCB0aHJvdWdoIGl0IGJlZm9yZQo+
ICsgICAgICAgICogbXR2ZWMgaXMgc2V0Lgo+ICsgICAgICAgICovCj4gKyAgICAgICBmZW5jZSAg
IHIsIHJ3Cj4KPiAgX3N0YXJ0X3dhcm06Cj4gICAgICAgICAvKiBSZXNldCBhbGwgcmVnaXN0ZXJz
IGV4Y2VwdCByYSwgYTAsIGExLCBhMiwgYTMgYW5kIGE0IGZvciBub24tYm9vdCBIQVJUICovCj4g
LS0KPiAyLjU1LjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQoKSSBoYXZlIHRha2VuIGNhcmUgb2YgdGhlIGFib3ZlIGNvbW1lbnRzIGF0
IHRoZSB0aW1lIG9mIG1lcmdpbmcuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBv
LgoKVGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
