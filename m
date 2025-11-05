Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386FCCCFA0D
	for <opensbi@archiver.kernel.org>; Wed,  5 Nov 2025 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/9FCvmK9l0GfjRCDG+rUVYZTfiD+0oZ6Q11cwJyaEA=; b=tJD5s5lZcNXBuQ
	prm1w8cSF1izL+nNqone/bBEH+l+eAB35G/WIb/prkPugq8xLtilEyPSDRtyLEe82iuz3j7gJFyHA
	bANEYgJjPMm78pEwtAj+zTYleIfvbCkOfICu/JHaTkGVyqQbf4L8osYWHjnmo36GJnIXHmKVq9hAH
	3SOvZsX3P8nx+g/NNcQBeLeZhbLm3gjD5KNdzojwWLHuinj6Y6XkVrPHpkp9FXlJsSIweQtrEaRIl
	7yv0fkE3RGiiY4LJsKTRgSp1RqxWYBTKlrb3OD6ZaSE/bXE+SrI/gTPsT9tjg31A2EAVqLMTC8wRh
	TD+nmQBEnMMzgtNGhKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg6c-0000000E1te-3AHW;
	Wed, 05 Nov 2025 16:11:30 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg6Z-0000000E1tG-2jIG
	for opensbi@lists.infradead.org;
	Wed, 05 Nov 2025 16:11:28 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-4332381ba9bso46357915ab.1
        for <opensbi@lists.infradead.org>; Wed, 05 Nov 2025 08:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762359086; x=1762963886; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNHwDmQ56qP7BBS87tKwuRV2Cd/krQrX3ZeFMNJ4PNc=;
        b=Dtz/MUmU4A7TjMGnFKuYOsM1Jo6dremKCAoapUROrxkEMXKZpM7dnE6wz62x1mA6DR
         CeZ1Iy1v+nt49nVVsatyEk0nlYaC73oGJxS70Ow+vd19BQ4a4sWPRehnr/+NDt3qeV4g
         9zXYevNkqOKGFckYlmgOkyd+42cKdoswclOum5MjbDJs4Z3MHfieA/D/xkJAbzC7Da6D
         k2iBzaLontaWjRMEHA299vvVhzqdYtK9kJKW2w2xdnVILf7THql6UOwA/V+SbU+XfpVS
         644Lzc0lfaHEj9eU1XQKLbDJshUji77gVUyP08kYYZoadWdFB7eUNl9HKxWlcpSS6op2
         SZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762359086; x=1762963886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNHwDmQ56qP7BBS87tKwuRV2Cd/krQrX3ZeFMNJ4PNc=;
        b=QoehXN/mjvLmYkXjmbQHsTw6gojDnt9SiHsfkks/cZoQ3LkTA5EDZM6GlO3SMX4fGT
         5MQw/egjj3cyD02KEBm2WsjZqk/MiRc71P8dX5Lc1SYEt6++32U9sNnVAUEaQWCFMak7
         7avEAOztAAjpB07UT5brXH89sf59mx8w64P9upG0TDCJHabTd7iZDgBEJW5Q/PQRSAMP
         vOM1qtnVBoS89q0c5ZXRCfCEdq1skfl3osptcGztaf3c7fWXtjkH+7pxUT8KGEx7dSt4
         u3O9QVXMZEE1Iq/yIoP50xRpVVON9yy9Pb0kjec3dZkDtjUWGfiN2KVQ0vzgSlN9ZcEK
         o0Dw==
X-Gm-Message-State: AOJu0YxLfC6/cHkhi0Sh5vvj9rvYPqDFDyLduS2sIMZfUH0asbTHES34
	48W6tfwByJLlX/NpdPtLwJcxz/j6qxzL9leYXVJIDYP7uoRuxGdyk5R+k0kM2Z0Q002ed5Y1lbl
	ADICUwi5nlcqHBt5cyuRi/PEGlLysqLVgoXvkJqSRkg==
X-Gm-Gg: ASbGnctyHHr1usVS9x3DvZXSfuxXM+rsLJo6DBE8UM8QMdaS6E+gk3bUdNT8r2zubMJ
	HJ9qYy3y1yWb2poVabK008CkP2iJObSktLBxR0cGOoaDbtSBZtKjFIOHPPYcqMO0r2Sp1+BHH9o
	pmZ9Dm5YZ9KvG5FnCtR+J2xGINxX4PqQnTm9SacyiWoFqqH5NEi1RtD1eiUw/DgTvfvxGowGBhl
	RScFyBBmysCYJ2SZJG+OjFHATTudqvooxXvpxkkvGCfmaMu5pfCnFSVf4KmUg==
X-Google-Smtp-Source: AGHT+IEpHGRil6Dlv0CGgLeE9y1mxSkfnmKNVmtchTV/JG4PDAwQYm/E4mcZb4FCGVy4ExSx+PpAcMqADN2SqdXDaiw=
X-Received: by 2002:a05:6e02:4416:20b0:433:4e9d:de8f with SMTP id
 e9e14a558f8ab-4334e9ddfb5mr3023795ab.19.1762359083191; Wed, 05 Nov 2025
 08:11:23 -0800 (PST)
MIME-Version: 1.0
References: <20251027-p8700-aclint-v2-0-f10cbfb66e92@bootlin.com> <20251027-p8700-aclint-v2-2-f10cbfb66e92@bootlin.com>
In-Reply-To: <20251027-p8700-aclint-v2-2-f10cbfb66e92@bootlin.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 5 Nov 2025 21:41:11 +0530
X-Gm-Features: AWmQ_bm6vRRqr8dsjtaZGcjZ-q8534kXchA_W5FoOsEgKW-m9EV-vD0vaVV3gLw
Message-ID: <CAAhSdy3QTuFkuqjGaibU5btxxbsANwLpwaiku30cavG+jtrKwQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] lib: utils/timer: mtimer: add MIPS P8700 compatible
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: opensbi@lists.infradead.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_081127_702890_957DAEA9 
X-CRM114-Status: GOOD (  30.02  )
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

T24gTW9uLCBPY3QgMjcsIDIwMjUgYXQgNjo0MuKAr1BNIEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5t
b25pbkBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBUaGUgTVRJTUVSIG9mIHRoZSBNSVBTIFA4NzAw
IGlzIGNvbXBsaWFudCB3aXRoIHRoZSBBQ0xJTlQgc3BlY2lmaWNhdGlvbiwKPiBzbyBhZGQgYSBj
b21wYXRpYmxlIHN0cmluZyBmb3IgaXQuCj4KPiBJbiBhIG11bHRpLWNsdXN0ZXIgY29uZmlndXJh
dGlvbiwgdGhlcmUgaXMgb25lIE1USU1FUiBwZXIgY2x1c3RlciwgZWFjaAo+IGFzc29jaWF0ZWQg
d2l0aCB0aGUgSEFSVFMgb2YgdGhlIGNsdXN0ZXIuIFNvIHdlIGRvIG5vdCBoYXZlIGEgTVRJTUVS
Cj4gd2l0aCBubyBhc3NvY2lhdGVkIEhBUlRzIHRvIHVzZSBhcyBvdXIgcmVmZXJlbmNlLgo+Cj4g
VG8gYmUgYWJsZSB0byBzZWxlY3QgYSByZWZlcmVuY2UgTVRJTUVSIGluIHRoYXQgY2FzZSwgYWRk
IGEgcXVpcmsgdG8gbG9vawo+IHVwIGFuIG9wdGlvbmFsIGRldmljZSB0cmVlIHByb3BlcnR5IHRo
YXQgaW5kaWNhdGUgd2hpY2ggTVRJTUVSIHRvIHVzZS4KPiBGb3IgdGhlIE1JUFMgUDg3MDAsIHRo
ZSBwcm9wZXJ0eSBpcyAibWlwcyxyZWZlcmVuY2UtbXRpbWVyIi4KPgo+IFNpZ25lZC1vZmYtYnk6
IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KPiAtLS0KPiAgbGliL3V0
aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYyB8IDI1ICsrKysrKysrKysrKysrKysrKystLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYyBiL2xpYi91
dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMKPiBpbmRleCBlMWZkMDUxLi5lOThjOTlmIDEw
MDY0NAo+IC0tLSBhL2xpYi91dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMKPiArKysgYi9s
aWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210aW1lci5jCj4gQEAgLTIwLDYgKzIwLDcgQEAgc3Ry
dWN0IHRpbWVyX210aW1lcl9xdWlya3Mgewo+ICAgICAgICAgdW5zaWduZWQgaW50ICAgIGNsaW50
X210aW1lX29mZnNldDsKPiAgICAgICAgIGJvb2wgICAgICAgICAgICBjbGludF93aXRob3V0X210
aW1lOwo+ICAgICAgICAgYm9vbCAgICAgICAgICAgIGhhc182NGJpdF9tbWlvOwo+ICsgICAgICAg
Y29uc3QgY2hhciAgICAgICpkdF9yZWZfcHJvcDsKPiAgfTsKPgo+ICBzdHJ1Y3QgdGltZXJfbXRp
bWVyX25vZGUgewo+IEBAIC0zOSw2ICs0MCw3IEBAIHN0YXRpYyBpbnQgdGltZXJfbXRpbWVyX2Nv
bGRfaW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLAo+ICAgICAgICAgc3RydWN0IGFj
bGludF9tdGltZXJfZGF0YSAqbXQ7Cj4gICAgICAgICBjb25zdCBzdHJ1Y3QgdGltZXJfbXRpbWVy
X3F1aXJrcyAqcXVpcmtzID0gbWF0Y2gtPmRhdGE7Cj4gICAgICAgICBib29sIGlzX2NsaW50ID0g
cXVpcmtzICYmIHF1aXJrcy0+aXNfY2xpbnQ7Cj4gKyAgICAgICBib29sIGlzX3JlZiA9IGZhbHNl
Owo+Cj4gICAgICAgICBtdG4gPSBzYmlfemFsbG9jKHNpemVvZigqbXRuKSk7Cj4gICAgICAgICBp
ZiAoIW10bikKPiBAQCAtMTEwLDEzICsxMTIsMTggQEAgc3RhdGljIGludCB0aW1lcl9tdGltZXJf
Y29sZF9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsCj4gICAgICAgICB9Cj4KPiAg
ICAgICAgIC8qCj4gLSAgICAgICAgKiBTZWxlY3QgZmlyc3QgTVRJTUVSIGRldmljZSB3aXRoIG5v
IGFzc29jaWF0ZWQgSEFSVHMgYXMgb3VyCj4gLSAgICAgICAgKiByZWZlcmVuY2UgTVRJTUVSIGRl
dmljZS4gVGhpcyBpcyBvbmx5IGEgdGVtcG9yYXJ5IHN0cmF0ZWd5Cj4gLSAgICAgICAgKiBvZiBz
ZWxlY3RpbmcgcmVmZXJlbmNlIE1USU1FUiBkZXZpY2UuIEluIGZ1dHVyZSwgd2UgbWlnaHQKPiAt
ICAgICAgICAqIGRlZmluZSBhbiBvcHRpb25hbCBEVCBwcm9wZXJ0eSBvciBzb21lIG90aGVyIG1l
Y2hhbmlzbSB0bwo+IC0gICAgICAgICogaGVscCB1cyBzZWxlY3QgdGhlIHJlZmVyZW5jZSBNVElN
RVIgZGV2aWNlLgo+ICsgICAgICAgICogSWYgd2UgaGF2ZSBhIERUIHByb3BlcnR5IHRvIGluZGlj
YXRlIHdoaWNoIE1USU1FUiBpcyB0aGUgcmVmZXJlbmNlLAo+ICsgICAgICAgICogc2VsZWN0IHRo
ZSBmaXJzdCBNVElNRVIgZGV2aWNlIHRoYXQgaGFzIGl0LiBPdGhlcndpc2UsIHNlbGVjdCB0aGUK
PiArICAgICAgICAqIGZpcnN0IE1USU1FUiBkZXZpY2Ugd2l0aCBubyBhc3NvY2lhdGVkIEhBUlRz
IGFzIG91ciByZWZlcmVuY2UuCj4gICAgICAgICAgKi8KPiAtICAgICAgIGlmICghbXQtPmhhcnRf
Y291bnQgJiYgIW10X3JlZmVyZW5jZSkgewo+ICsgICAgICAgaWYgKHF1aXJrcyAmJiBxdWlya3Mt
PmR0X3JlZl9wcm9wKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChmZHRfZ2V0cHJvcChmZHQsIG5v
ZGVvZmYsIHF1aXJrcy0+ZHRfcmVmX3Byb3AsIE5VTEwpKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGlzX3JlZiA9IHRydWU7Cj4gKyAgICAgICB9IGVsc2UgaWYgKCFtdC0+aGFydF9jb3VudCkg
ewo+ICsgICAgICAgICAgICAgICBpc19yZWYgPSB0cnVlOwo+ICsgICAgICAgfQo+ICsKPiArICAg
ICAgIGlmIChpc19yZWYgJiYgIW10X3JlZmVyZW5jZSkgewo+ICAgICAgICAgICAgICAgICBtdF9y
ZWZlcmVuY2UgPSBtdDsKPiAgICAgICAgICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICog
U2V0IHJlZmVyZW5jZSBmb3IgYWxyZWFkeSBwcm9wYmVkIE1USU1FUiBkZXZpY2VzCj4gQEAgLTE1
Miw2ICsxNTksMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB0aW1lcl9tdGltZXJfcXVpcmtzIHRo
ZWFkX2FjbGludF9xdWlya3MgPSB7Cj4gICAgICAgICAuaGFzXzY0Yml0X21taW8gICAgICAgICA9
IGZhbHNlLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdGltZXJfbXRpbWVyX3F1aXJr
cyBtaXBzX2FjbGludF9xdWlya3MgPSB7Cj4gKyAgICAgICAuZHRfcmVmX3Byb3AgICAgICAgICAg
ICA9ICJtaXBzLHJlZmVyZW5jZS1tdGltZXIiLAo+ICt9Owo+ICsKCkkgdGhpbmsgdGhpcyBEVCBw
cm9wZXJ0eSBjYW4gYmUgdXNlZnVsIHRvIG90aGVyIHBsYXRmb3JtcyBhcyB3ZWxsLgpIb3cgYWJv
dXQgInJpc2N2LHJlZmVyZW5jZS1tdGltZXIiIGFzIGEgRFQgcHJvcGVydHkgPyBUaGlzIHdheQp5
b3UgZG9uJ3QgbmVlZCB0byBtYWtlIGl0IGFzIE1JUFMgcXVpcmsuCgo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IGZkdF9tYXRjaCB0aW1lcl9tdGltZXJfbWF0Y2hbXSA9IHsKPiAgICAgICAgIHsgLmNv
bXBhdGlibGUgPSAicmlzY3YsY2xpbnQwIiwgLmRhdGEgPSAmc2lmaXZlX2NsaW50X3F1aXJrcyB9
LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJzaWZpdmUsY2xpbnQwIiwgLmRhdGEgPSAmc2lm
aXZlX2NsaW50X3F1aXJrcyB9LAo+IEBAIC0xNTksNiArMTcwLDggQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBmZHRfbWF0Y2ggdGltZXJfbXRpbWVyX21hdGNoW10gPSB7Cj4gICAgICAgICB7IC5jb21w
YXRpYmxlID0gInRoZWFkLGM5MDAtY2xpbnQiLCAuZGF0YSA9ICZ0aGVhZF9jbGludF9xdWlya3Mg
fSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAidGhlYWQsYzkwMC1hY2xpbnQtbXRpbWVyIiwK
PiAgICAgICAgICAgLmRhdGEgPSAmdGhlYWRfYWNsaW50X3F1aXJrcyB9LAo+ICsgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJtaXBzLHA4NzAwLWFjbGludC1tdGltZXIiLAo+ICsgICAgICAgICAuZGF0
YSA9ICZtaXBzX2FjbGludF9xdWlya3MgfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmlz
Y3YsYWNsaW50LW10aW1lciIgfSwKPiAgICAgICAgIHsgfSwKPiAgfTsKPgo+IC0tCj4gMi41MS4x
Cj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkKClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
