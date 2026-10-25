Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94287606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 07:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UaxYMOx0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=mkpmhLGV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sldFh1/ir2BVHW9GEbwADRke460fYnMj8GArqEwPbJ8=; b=UaxYMOx0anlxg2T4zo8FMA8ujc
	2B4LmNTDSdbN9c5IwKCY8W5tAdmHIr2wBpkhOuzCGxjcPAnvwviMrBK0yblnA+o4qpXbJcAI2x2a0
	8yl3UPRhubGhHBTJFaselumr5X8pkZytUpNHNaJB5tzZ7zBgeAY0P+7fkIsU3XoPp2GbB3ty4Exy1
	XWHZ/qSuCZNPthA+LO+T7dmbpoU4VKY5HfEvO7+yMQ6zOqSLPToEJCoAXjnRa79RBHkNHm19BrdAP
	rc2o5yGLO2NsCO1NUvZeqS8uK3QIEYz/gVk6666uy3UiDtIieiNATn0HvsUi/RXZlW0TqyjB/t24s
	oM5nFiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt7F-00000000rkp-1Izs;
	Sun, 25 Oct 2026 07:58:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt7C-00000000rk3-26gC
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 07:58:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso7724005e9.0
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 00:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792915080; cv=none;
        d=google.com; s=arc-20260327;
        b=JFeaAgubyQB6YzgqEo2zVn/ykkHGvtlknH4ScwPfKwIQ8isrErL7t9nAZshUE3J/bI
         Q1f56QVlOiAqeoBgntV4euYYvPGtDylRBjfRYS/AMIJLv0aDB8hds67hUcVKd1yaBjr4
         U814mHp/3lz0UqEiBxOx7FYtpu73vhgrc5e9AkwmawfwufkrEdWJpO2tE59XY6qXBNg+
         30rhc+76jwNQGdGaGr/Zal4aRVZ27drco7WG3h5Vefmy+Xexm/1tVq8F8M+jNmIPWWFZ
         1XtmvlO99zgdPvY5ckZaqjZtbGCx/+Z6kjT+5KjOo0lrMRMeViGnBBpf9RfEUGx/u1NM
         EPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zGwHCn/TDy213LfImn9eSzMGjPG7whV+kgmV+DOlENY=;
        fh=HW3mrcNprVsUti2p9yjsVziUCwYLaw79UR5+L9s/4Os=;
        b=ohf9wyRlR6RPHbNKGsmcDOXJM7NuRu0/KkicwztQ0JzmYod/7D1VXeP9lLUjNWEFhr
         FS35b0FMMndjwr69hlm7hoIkH7G+WAfJqrm6x9ck5u/rVQrKpJQR3EqMlUgvueIQpsBl
         tHtScWfb/Xm/kEY0LcpaEa6cwvpnb19ZJy4iEb2QQrvrQ8XjBN0W6P0YPOOFQT/4uLuH
         giMEdQnqtfvsWwyRiRZ0Hc5mBgjVueDJPnQAMZeo4RP1wTvrVOtG21E6MFEPh5G8ea2M
         wEcOFn69YqxXiAQxb1oojzeDxp4L1dyfIRRo1BnzBg1spHtpQkw8wSEYJ4vIHfOa8saa
         aIbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792915080; x=1793519880; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zGwHCn/TDy213LfImn9eSzMGjPG7whV+kgmV+DOlENY=;
        b=mkpmhLGVgNrzyYmRLYJaBB71OfHBp/FACEvzaxuILxvTx1QTjd/q9wK8dVfIOAQLhP
         oqC2NdW5khYOFUJ3i/HCt/1e5w6dICpYHQ4narhOl/VfivZQAE6Zhhcla8vRJJ5do/5C
         GjKDuOUQrdwfbs0ULmOSPsc9jEOydj7XRDBAY8cS0Ndc4CTTHgizQZNGk7bZuq5RH6RO
         v9oO3PNDTODOSmmV0ksVv2XYpPbvlheWv+u3MAk19ojwL5gisoVTPkUDRTOkraKQniC9
         +6PEjjiA2a9VPocMSAn+LgPf5cQfykYJ2PoKcVZb6IMuDQ3TuE/YOtW8JQ0pWqwVPn5a
         j17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792915080; x=1793519880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGwHCn/TDy213LfImn9eSzMGjPG7whV+kgmV+DOlENY=;
        b=xeT3XsG711BfIcjvQeNSQhr8VYFPrzHMAXunqD2TRc9O5W+kCm/fIoWQtU/Wy55syT
         Zp7IB4IrjfUSl6Z4OGRd6jOb9YzVpb2mfoEM+f7TcjkDCN1V5yrsYHZTlYYX8dyra16F
         kO7HUxflLrlT4OcsZm/LG9TQQiA0pkKHVTzX0NQaIy79ove36OzM6W1YLSQ2LjuiiwaC
         b1iwsCNm24DAYy2qdtSH4Yab3I3q7BwXUlWK/c70VN8f91v8GGprwphnYKrwSxJgav/8
         0BLpA2OjW2Rn0HZBvcenW5K25Sdrdm/gP1Hpypy51Fz2jCIaUA6/ZGTF+iGWn9ir7/Xl
         xd2Q==
X-Gm-Message-State: AFq9FYJYxPaHULuG1O8S1bkwzpG2uVwcO1pCIiHtwFZa3IbbGB0jAOoE
	fvvelPjTpYLD2G0/ioWPqNsKJcBhOj2wPAOD+XrqK55qKzAfdgbXVXhLrowby+8b3ckShH/s4NI
	5DNKlhB2SVojHfpKeuWzconBtjkEQyX7/7qqp6+lix6dMO1JbZi7o/TOcsA==
X-Gm-Gg: AYBFou1Q7oF9dDHRR6n1HgSSCqKDKvst8agxNLsk/PVpq+Xqr7h0r5JralnGYqtc/f1
	X1t+zEt3tIaWthWOq1i1RLBtGz10S2orxu3AuSz/QxX0dEi/Tj6/C/qLOn04E9nNu+o7cpKE/+p
	hhljpyPTXpmBjCLjwjwb0ZvNkIIMc8sEZEAdv24hwOD+CXECjzC04uE6NtT05e5SHQqdkBs1UDe
	COnDP4ss43Fx8vCOj/t9hJUemmxUBhhJguhGEerP9TJxXqaWu+iosYes9+oZiehUVYYcFr5El2f
	AEHJAh+Lz0BVYNbNeTY0waclD1+1i8PqmCYEDWd32/rHAxT4YAissAgVhsjLrq1vBysjA8JTaoC
	qxkhgIrK5pBvbzdWtnlczJ/1bwhRRM/BZlDZ1WHwa+5631yyr+zq+hLWElO2MuyFKAnK6/a+pmP
	7aM7kpJIQPgxFLC4A4fnwa7sCOXxoYAqZy34C83vEjTgwd36pvRdEWID5P
X-Received: by 2002:a05:600c:19c9:b0:4a2:1196:db0e with SMTP id
 5b1f17b1804b1-4a35ace0ba2mr65962915e9.30.1792915080092; Sun, 25 Oct 2026
 00:58:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260827115534.49509-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260827115534.49509-1-pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 13:27:48 +0530
X-Gm-Features: AclHuK9-ArQ9yq5h3-9d67RjcmIgMco73ic_PhyNF1jFYfDGT5_G2w096BJszUQ
Message-ID: <CAAhSdy1CNXWR9vRRsjaoeyobfqKfbXYbeycV0LRM=Cdo-DbSSg@mail.gmail.com>
Subject: Re: [PATCH] lib: utils: irqchip: handle IMSIC mask boundaries
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_005802_674252_E3C23F49 
X-CRM114-Status: GOOD (  25.89  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBBdWcgMjcsIDIwMjYgYXQgNToyNeKAr1BNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gaW1zaWNfZGF0YV9jaGVjaygpIGFjY2VwdHMgZmllbGQg
Z2VvbWV0cmllcyB0aGF0IHJlYWNoIHRoZSBuYXRpdmUgd29yZAo+IHdpZHRoLCBidXQgdGhlbiBj
b25zdHJ1Y3RzIG1hc2tzIHdpdGggMVVMIDw8IGJpdHMuICBBIGZ1bGwtd2lkdGggbG93IGZpZWxk
Cj4gdGhlcmVmb3JlIHNoaWZ0cyBieSBCSVRTX1BFUl9MT05HLiAgVGhlIGdyb3VwIGVuZHBvaW50
IGNhbGN1bGF0aW9uIGFsc28KPiB1bmRlcmZsb3dzIHdoZW4gZ3JvdXBfaW5kZXhfYml0cyBpcyB6
ZXJvLCBldmVuIHRob3VnaCBhbiBhYnNlbnQgZ3JvdXAgZmllbGQKPiBoYXMgbm8gc2hpZnQgc2Vt
YW50aWNzLgo+Cj4gQnVpbGQgYWxsIGdlb21ldHJ5IG1hc2tzIHRocm91Z2ggYSBjaGVja2VkIGhl
bHBlci4gIFJlcHJlc2VudCBhIGZ1bGwtd2lkdGgKPiBmaWVsZCBhcyB+MFVMLCBrZWVwIHplcm8t
d2lkdGggZmllbGRzIGFzIGEgemVybyBtYXNrLCBhbmQgdmFsaWRhdGUgdGhlIGdyb3VwCj4gc2hp
ZnQgb25seSB3aGVuIGEgZ3JvdXAgZmllbGQgZXhpc3RzLiAgUmV1c2UgdGhlIHJlc3VsdGluZyBt
YXNrcyBmb3IgYmFzZQo+IGNhbm9uaWNhbGl6YXRpb24gYW5kIHJlZ3NldC1zaXplIGFsaWdubWVu
dC4KPgo+IEZpeGVzOiA5ZjczNjY5OTU5ZGQgKCJsaWI6IHV0aWxzL2lycWNoaXA6IEFkZCBJTVNJ
QyBsaWJyYXJ5IikKPgo+IFNpZ25lZC1vZmYtYnk6IFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNj
YXMuYWMuY24+CgpPdmVyYWxsIGRpcmVjdGlvbiBvZiB0aGUgcGF0Y2ggaXMgZ29vZCBidXQgc29t
ZSBuZWVkcyBpbXByb3ZlbWVudHMKZnJvbSByZWFkYWJpbGl0eSBwZXJzcGVjdGl2ZS4KCj4gLS0t
Cj4gQmFzZS1jb21taXQ6IDRlNzlmZDdkZTU5ZjFiMjg5OTA5MmMxYTg0Y2U2OGM4ZWJjNjhmOTMK
Pgo+ICBsaWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5jIHwgNzIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAy
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5j
IGIvbGliL3V0aWxzL2lycWNoaXAvaW1zaWMuYwo+IGluZGV4IGY2ZGE5ZjcuLjVmNmVlZDUgMTAw
NjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2lycWNoaXAvaW1zaWMuYwo+ICsrKyBiL2xpYi91dGlscy9p
cnFjaGlwL2ltc2ljLmMKPiBAQCAtMzAwLDEwICszMDAsMzAgQEAgc3RhdGljIGludCBpbXNpY193
YXJtX2lycWNoaXBfaW5pdChzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpkZXYpCj4gICAgICAg
ICByZXR1cm4gMDsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgaW1zaWNfbWFrZV9maWVsZF9tYXNrKHUz
MiBiaXRzLCB1MzIgc2hpZnQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyAqbWFzaykKCkJldHRlciB0byBtYWtlIHRoaXMgYXMgaW5saW5lIGZ1bmN0aW9u
IG5hbWVkIHNiaV9tYWtlX2ZpZWxkX21hc2sKYW5kIG1vdmUgdG8gc2JpX2JpdG9wcy5oCgo+ICt7
Cj4gKyAgICAgICBpZiAoIWJpdHMpIHsKPiArICAgICAgICAgICAgICAgKm1hc2sgPSAwOwo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAoc2hp
ZnQgPj0gQklUU19QRVJfTE9ORyB8fCBiaXRzID4gQklUU19QRVJfTE9ORyAtIHNoaWZ0KQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArCj4gKyAgICAgICBpZiAoYml0cyA9
PSBCSVRTX1BFUl9MT05HKQo+ICsgICAgICAgICAgICAgICAqbWFzayA9IH4wVUw7Cj4gKyAgICAg
ICBlbHNlCj4gKyAgICAgICAgICAgICAgICptYXNrID0gKCgxVUwgPDwgYml0cykgLSAxKSA8PCBz
aGlmdDsKClRoaXMgc2hvdWxkIGJlOgoKKm1hc2sgPSBHRU5NQVNLKGJpdHMgKyBzaGlmdCAtIDEs
IHNoaWZ0KTsKCj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gIGludCBpbXNpY19k
YXRhX2NoZWNrKHN0cnVjdCBpbXNpY19kYXRhICppbXNpYykKPiAgewo+IC0gICAgICAgdTMyIGks
IHRtcDsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgYmFzZV9hZGRyLCBhZGRyLCBtYXNrOwo+ICsg
ICAgICAgdTMyIGksIGxvd19pbmRleF9iaXRzLCB0bXA7CgpEcm9wIGxvd19pbmRleF9iaXRzCgo+
ICsgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyLCBiYXNlX2FkZHIsIGdyb3VwX21hc2ssIGxvd19t
YXNrLCByZWdzZXRfbWFzazsKCnMvbG93X21hc2svaGFydF9tYXNrLwpzL3JlZ3NldF9tYXNrL2d1
ZXN0X21hc2svCgo+ICsgICAgICAgaW50IHJjOwo+Cj4gICAgICAgICAvKiBTYW5pdHkgY2hlY2tz
ICovCj4gICAgICAgICBpZiAoIWltc2ljIHx8Cj4gQEAgLTMyNSwxMyArMzQ1LDI5IEBAIGludCBp
bXNpY19kYXRhX2NoZWNrKHN0cnVjdCBpbXNpY19kYXRhICppbXNpYykKPiAgICAgICAgIGlmICh0
bXAgPCBpbXNpYy0+Z3JvdXBfaW5kZXhfYml0cykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNC
SV9FSU5WQUw7Cj4KPiAtICAgICAgIHRtcCA9IElNU0lDX01NSU9fUEFHRV9TSElGVCArIGltc2lj
LT5ndWVzdF9pbmRleF9iaXRzICsKPiAtICAgICAgICAgICAgIGltc2ljLT5oYXJ0X2luZGV4X2Jp
dHM7Cj4gLSAgICAgICBpZiAoaW1zaWMtPmdyb3VwX2luZGV4X3NoaWZ0IDwgdG1wKQo+IC0gICAg
ICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiAtICAgICAgIHRtcCA9IGltc2ljLT5ncm91
cF9pbmRleF9iaXRzICsgaW1zaWMtPmdyb3VwX2luZGV4X3NoaWZ0IC0gMTsKPiAtICAgICAgIGlm
ICh0bXAgPj0gQklUU19QRVJfTE9ORykKPiAtICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5W
QUw7Cj4gKyAgICAgICBsb3dfaW5kZXhfYml0cyA9IElNU0lDX01NSU9fUEFHRV9TSElGVCArIGlt
c2ljLT5ndWVzdF9pbmRleF9iaXRzICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgaW1zaWMt
PmhhcnRfaW5kZXhfYml0czsKPiArICAgICAgIHJjID0gaW1zaWNfbWFrZV9maWVsZF9tYXNrKGxv
d19pbmRleF9iaXRzLCAwLCAmbG93X21hc2spOwo+ICsgICAgICAgaWYgKHJjKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgICAgcmMgPSBpbXNpY19tYWtlX2ZpZWxkX21h
c2soaW1zaWMtPmd1ZXN0X2luZGV4X2JpdHMgKwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgSU1TSUNfTU1JT19QQUdFX1NISUZULCAwLCAmcmVnc2V0X21hc2spOwo+ICsgICAg
ICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwoKUmVwbGFjZSBhYm92
ZSB3aXRoOgoKcmMgPSBpbXNpY19tYWtlX2ZpZWxkX21hc2soaW1zaWMtPmd1ZXN0X2luZGV4X2Jp
dHMsCklNU0lDX01NSU9fUEFHRV9TSElGVCwgJmd1ZXN0X21hc2spOwppZiAocmMpCiAgICAgcmV0
dXJuIHJjOwoKcmMgPSBpbXNpY19tYWtlX2ZpZWxkX21hc2soaW1zaWMtPmhhcnRfaW5kZXhfYml0
cywKSU1TSUNfTU1JT19QQUdFX1NISUZUICsgaW1zaWMtPmd1ZXN0X2luZGV4X2JpdHMsICZoYXJ0
X21hc2spOwppZiAocmMpCiAgICAgcmV0dXJuIHJjOwoKPiArICAgICAgIGlmIChpbXNpYy0+Z3Jv
dXBfaW5kZXhfYml0cykgewo+ICsgICAgICAgICAgICAgICBpZiAoaW1zaWMtPmdyb3VwX2luZGV4
X3NoaWZ0IDwgbG93X2luZGV4X2JpdHMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IFNCSV9FSU5WQUw7CgpUaGUgYWJvdmUgY2hlY2sgc2hvdWxkIGJlOgoKaWYgKGltc2ljLT5ncm91
cF9pbmRleF9zaGlmdCA8IElNU0lDX01NSU9fUEFHRV9TSElGVCArCmltc2ljLT5ndWVzdF9pbmRl
eF9iaXRzICsgaW1zaWMtPmhhcnRfaW5kZXhfYml0cykKICAgIHJldHVybiBTQklfRUlOVkFMOwoK
PiArCj4gKyAgICAgICAgICAgICAgIHJjID0gaW1zaWNfbWFrZV9maWVsZF9tYXNrKGltc2ljLT5n
cm91cF9pbmRleF9iaXRzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbXNpYy0+Z3JvdXBfaW5kZXhfc2hpZnQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZncm91cF9tYXNrKTsKPiArICAgICAgICAgICAgICAgaWYgKHJj
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByYzsKPiArICAgICAgIH0gZWxzZSB7
Cj4gKyAgICAgICAgICAgICAgIGdyb3VwX21hc2sgPSAwOwo+ICsgICAgICAgfQo+Cj4gICAgICAg
ICAvKgo+ICAgICAgICAgICogTnVtYmVyIG9mIGludGVycnVwdCBpZGVudGl0aWVzIHNob3VsZCBi
ZSAxIGxlc3MgdGhhbgo+IEBAIC0zNDYsMjMgKzM4MiwxNSBAQCBpbnQgaW1zaWNfZGF0YV9jaGVj
ayhzdHJ1Y3QgaW1zaWNfZGF0YSAqaW1zaWMpCj4KPiAgICAgICAgIC8qIE1hdGNoIHBhdHRlciBv
ZiBlYWNoIHJlZ3NldCAqLwo+ICAgICAgICAgYmFzZV9hZGRyID0gaW1zaWMtPnJlZ3NbMF0uYWRk
cjsKPiAtICAgICAgIGJhc2VfYWRkciAmPSB+KCgxVUwgPDwgKGltc2ljLT5ndWVzdF9pbmRleF9i
aXRzICsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbXNpYy0+aGFydF9pbmRl
eF9iaXRzICsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTVNJQ19NTUlPX1BB
R0VfU0hJRlQpKSAtIDEpOwo+IC0gICAgICAgYmFzZV9hZGRyICY9IH4oKCgxVUwgPDwgaW1zaWMt
Pmdyb3VwX2luZGV4X2JpdHMpIC0gMSkgPDwKPiAtICAgICAgICAgICAgICAgICAgICAgICBpbXNp
Yy0+Z3JvdXBfaW5kZXhfc2hpZnQpOwo+ICsgICAgICAgYmFzZV9hZGRyICY9IH5sb3dfbWFzazsK
PiArICAgICAgIGJhc2VfYWRkciAmPSB+Z3JvdXBfbWFzazsKClRoaXMgY2FuIHNpbXBseSBiZToK
CmJhc2VfYWRkciAmPSB+KGdyb3VwX21hc2sgfCBoYXJ0X21hc2sgfCBndWVzdF9tYXNrKTsKCj4g
ICAgICAgICBmb3IgKGkgPSAwOyBpIDwgSU1TSUNfTUFYX1JFR1MgJiYgaW1zaWMtPnJlZ3NbaV0u
c2l6ZTsgaSsrKSB7Cj4gLSAgICAgICAgICAgICAgIG1hc2sgPSAoMVVMIDw8IGltc2ljLT5ndWVz
dF9pbmRleF9iaXRzKSAqIElNU0lDX01NSU9fUEFHRV9TWjsKPiAtICAgICAgICAgICAgICAgbWFz
ayAtPSAxVUw7Cj4gLSAgICAgICAgICAgICAgIGlmIChpbXNpYy0+cmVnc1tpXS5zaXplICYgbWFz
aykKPiArICAgICAgICAgICAgICAgaWYgKGltc2ljLT5yZWdzW2ldLnNpemUgJiByZWdzZXRfbWFz
aykKClRoaXMgY2hlY2sgbXVzdCBiZToKCmlmIChpbXNpYy0+cmVnc1tpXS5zaXplICYgKGd1ZXN0
X21hc2sgfCAoSU1TSUNfTU1JT19QQUdFX1NaIC0gMSkpKQogICAgcmV0dXJuIFNCSV9FSU5WQUw7
Cgo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+Cj4gICAgICAg
ICAgICAgICAgIGFkZHIgPSBpbXNpYy0+cmVnc1tpXS5hZGRyOwo+IC0gICAgICAgICAgICAgICBh
ZGRyICY9IH4oKDFVTCA8PCAoaW1zaWMtPmd1ZXN0X2luZGV4X2JpdHMgKwo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW1zaWMtPmhhcnRfaW5kZXhfYml0cyArCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJTVNJQ19NTUlPX1BBR0Vf
U0hJRlQpKSAtIDEpOwo+IC0gICAgICAgICAgICAgICBhZGRyICY9IH4oKCgxVUwgPDwgaW1zaWMt
Pmdyb3VwX2luZGV4X2JpdHMpIC0gMSkgPDwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGltc2ljLT5ncm91cF9pbmRleF9zaGlmdCk7Cj4gKyAgICAgICAgICAgICAgIGFkZHIgJj0g
fmxvd19tYXNrOwo+ICsgICAgICAgICAgICAgICBhZGRyICY9IH5ncm91cF9tYXNrOwoKU2FtZSBj
b21tZW50IGFzIGFib3ZlOgoKYWRkciAmPSB+KGdyb3VwX21hc2sgfCBoYXJ0X21hc2sgfCBndWVz
dF9tYXNrKTsKCj4gICAgICAgICAgICAgICAgIGlmIChiYXNlX2FkZHIgIT0gYWRkcikKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiAgICAgICAgIH0KPiAtLQo+
IDIuNTAuMSAoQXBwbGUgR2l0LTE1NSkKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+
IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
