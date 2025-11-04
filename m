Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D4ECCFA00
	for <opensbi@archiver.kernel.org>; Tue,  4 Nov 2025 03:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5nVc2BZYkGxr+768Gv0XM2pCEkYl4nfReRcd8r6f5o=; b=RHGe62Iq4mLSRQ
	uuQ2vyQxhPf2R9uvAqNB9JNYcSpJSCi9+QyRKMO9G2qEovLhkL/vCWjGQeP15ZKTLZRkav63+imrV
	Ke56r1+7LIHuH51yLqaBlXC0rDZCALstGdmuAbdCrI+npAEoL8kvD7s1SoDV7JD4ijCWs7C16F01I
	Gzzhaf/imZofGmKnb12N6yROyvd+wT0mUtwJLE7v7Icm0oQjH8SA9eUG4ysyyx+l78bVdvcM4JMUS
	9r2D2SBqchD7QvKb1JfMNLP6gUlCXM7p3imMJNzoFFrveFVtgcBqiHFdOgRMGW99Ovhat5f9Azw+e
	zvoFV0/1XVMms0PVv+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG85g-0000000B5Dm-06qQ;
	Tue, 04 Nov 2025 03:52:16 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG85d-0000000B5DR-38UV
	for opensbi@lists.infradead.org;
	Tue, 04 Nov 2025 03:52:14 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-940d9772e28so215706139f.2
        for <opensbi@lists.infradead.org>; Mon, 03 Nov 2025 19:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762228333; x=1762833133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pxjcrhYDh3ygrt2PkYoA/etPKnyEkLDtzElLb4cuHc=;
        b=fqOa5S6r4zGRtGdpbw+UqPiMjc+NqC8Z5Hur99WmZ8p8hPRCKLo06Egcn8XAL5WqhQ
         2t1nDrmxfNwvH7nHe6VwDB49QDPzsyTLj+ArKBcz/1NSJJqLntCf8gD0JR/jev2hkhzq
         JdyUKkLm6r1Rr9jgPClN+eGUOM32LItsg9sb8cVNglOMQsRr8SS1LJufEOd3Av9VXtEW
         npcClP3oAGRus3oMI2v5bHNmfk7vwdsBUtaUgHbrbuNObFOy2a+SaT0qLY78Vv//AZHV
         kdNW9dLLVyITPalLXZ5sWuVXH+E9mtK4hBec87rO8H9smo6WFUSut+AGHkIoQYu7v/OX
         GPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762228333; x=1762833133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pxjcrhYDh3ygrt2PkYoA/etPKnyEkLDtzElLb4cuHc=;
        b=snGpDBUGTFcCLIS8clkezCGvHyTIykTE6HSa/JPL5J3+usM6kigs3oThlH/7LgsK7b
         QSrUTXUtLV16NAVXNytBnXRRcBDRMb3pNjJ0PRBvamhGjSyTJq1XH62Vqa7oJTwElMyI
         HEiOgAvSXS8mwkw2H9E1nFifz2n9QCKF2VPYH++TQVZGjU+NwU/vqZcmuhhtONOEewgq
         48KwclMgCgEloy2wNXAWG3J2uT32Q6/jWjiPyNiw0royYfK5Xi2GHJoE/QHfpVDXvpIf
         xnM1dGxXbqvAl8g5OBJASxxZ4aTkcBxHInJRnsauAGEqS7HJkLIDQpftdxUhuyCBPvM5
         aG4w==
X-Gm-Message-State: AOJu0YxSNJ6G4975585Kx3zsBxklKWSbDLGeG/kqIeUpgI75RNp0D0X2
	WQ5Xnm9mWeOHYGASsocbsV/DY3uXorxfMupqUtJpU+jHM2SfUMO1MI+M2gHmYrJ6qBrNPFmHoHu
	FwLbQu/RH2mYFPENVGL6VD7Uy7C/U/pskO18Ny08K5g==
X-Gm-Gg: ASbGncs9mVUH5OBq+XZKii8+vlMJuj+fFoeU0qx0H4nwT+lStXdLzg4KZSdb/1axqEB
	CAsu0pECPbNHt45Jj1ReDt4X4pKd0gAvSQPC9u9ktReiie3SkX56iSp5rFbAn2PfArO59R7AC/H
	Sz8F83wLK3iyOv0f1BGstA42qEH8n2SZDIJBB3Y7ola0XlehrlVqRp4G8E9QJS8YYTYApWvx+0q
	bz9x94GFCKwnANFZuSTFSgJBDhLt0SgvB87NfCGLN+KUPNF8Q36fQnAzqen
X-Google-Smtp-Source: AGHT+IEQlJuL/OPqPSHfxQP9XNDmTNis5JPu4os6JArUi/LACjLcKRekjXQoae/dQMyBaBOeTdIQKoGWnS151j0pIUg=
X-Received: by 2002:a05:6e02:12c1:b0:430:cad8:45fc with SMTP id
 e9e14a558f8ab-4330d20e62emr222360645ab.29.1762228332718; Mon, 03 Nov 2025
 19:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20250930022728.887069-1-wxjstz@126.com> <330f2eb8d65ea7abfb4442ecdffef308855aed73.camel@126.com>
In-Reply-To: <330f2eb8d65ea7abfb4442ecdffef308855aed73.camel@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Nov 2025 09:22:01 +0530
X-Gm-Features: AWmQ_bnTT8DpWcWFi-ysHVfAJx98CqcNIJIg7pdbaCT6ekMCY38USdRMgAZOpyI
Message-ID: <CAAhSdy0CB+Mn9j6TzHqasYVovqzXoN6Ck+E=RYi+Wir+9tF0UA@mail.gmail.com>
Subject: Re: firmware: Initialize stack guard via Zkr
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_195213_785474_095C799C 
X-CRM114-Status: GOOD (  12.62  )
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

T24gTW9uLCBPY3QgNiwgMjAyNSBhdCAxOjMz4oCvUE0gWGlhbmcgVyA8d3hqc3R6QDEyNi5jb20+
IHdyb3RlOgo+Cj4gVHJ5IHRvIGluaXRpYWxpemUgc3RhY2sgcHJvdGVjdGlvbiBndWFyZCB2aWEg
dGhlIHprciBleHRlbnNpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZyBXIDx3eGpzdHpAMTI2
LmNvbT4KClRoZSBwYXRjaCBzdWJqZWN0IGlzIGxhY2tpbmcgdGhlICJbUEFUQ0hdIiBwcmVmaXgg
b3RoZXJ3aXNlCml0IGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGZpcm13YXJlL2Z3
X2Jhc2UuUyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MjQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL2Z3X2Jhc2UuUyBiL2Zp
cm13YXJlL2Z3X2Jhc2UuUwo+IGluZGV4IDUzMDBlY2YyLi45NTNmYmE5NSAxMDA2NDQKPiAtLS0g
YS9maXJtd2FyZS9md19iYXNlLlMKPiArKysgYi9maXJtd2FyZS9md19iYXNlLlMKPiBAQCAtMTA3
LDYgKzEwNywzMCBAQCBfYnNzX3plcm86Cj4gICAgICAgICBhZGQgICAgIHM0LCBzNCwgX19TSVpF
T0ZfUE9JTlRFUl9fCj4gICAgICAgICBibHQgICAgIHM0LCBzNSwgX2Jzc196ZXJvCj4KPiArICAg
ICAgIC8qIFRyeWluZyB0byBpbml0aWFsaXplIHRoZSBzdGFjayBndWFyZCB2aWEgdGhlIFprciBl
eHRlbnNpb24gKi8KPiArICAgICAgIGxsYSAgICAgdDAsIF9fc3RhY2tfY2hrX2d1YXJkX2RvbmUK
PiArICAgICAgIGNzcncgICAgQ1NSX01UVkVDLCB0MAo+ICsgICAgICAgbGkgICAgICB0MCwgMAo+
ICsgICAgICAgbGkgICAgICB0MywgMgo+ICsgICAgICAgbGkgICAgICB0NCwgMHhmZmZmCj4gKyAg
ICAgICBsaSAgICAgIHQ1LCBfX1NJWkVPRl9QT0lOVEVSX18KPiArX19zdGFja19jaGtfZ3VhcmRf
bG9vcDoKPiArICAgICAgIGNzcnJ3ICAgdDEsIENTUl9TRUVELCB4MAo+ICsgICAgICAgc3JsaSAg
ICB0MiwgdDEsIDMwCj4gKyAgICAgICBhbmRpICAgIHQyLCB0MiwgMwo+ICsgICAgICAgYmd0ICAg
ICB0MiwgdDMsIF9fc3RhY2tfY2hrX2d1YXJkX2RvbmUKPiArICAgICAgIGJsdCAgICAgdDIsIHQz
LCBfX3N0YWNrX2Noa19ndWFyZF9sb29wCj4gKyAgICAgICBhbmQgICAgIHQxLCB0MSwgdDQKPiAr
ICAgICAgIHNsbGkgICAgdDAsIHQwLCAxNgo+ICsgICAgICAgb3IgICAgICB0MCwgdDAsIHQxCj4g
KyAgICAgICBhZGRpICAgIHQ1LCB0NSwgLTIKPiArICAgICAgIGJndHogICAgdDUsIF9fc3RhY2tf
Y2hrX2d1YXJkX2xvb3AKPiArICAgICAgIGxsYSAgICAgdDEsIF9fc3RhY2tfY2hrX2d1YXJkCj4g
KyAgICAgICBSRUdfUyAgIHQwLCAwKHQxKQo+ICsgICAgICAgaiAgICAgICBfX3N0YWNrX2Noa19n
dWFyZF9kb25lCj4gKyAgICAgICAuYWxpZ24gMwo+ICtfX3N0YWNrX2Noa19ndWFyZF9kb25lOgo+
ICsKPiAgICAgICAgIC8qIFNldHVwIHRlbXBvcmFyeSB0cmFwIGhhbmRsZXIgKi8KPiAgICAgICAg
IGxsYSAgICAgczQsIF9zdGFydF9oYW5nCj4gICAgICAgICBjc3J3ICAgIENTUl9NVFZFQywgczQK
PiAtLQo+IDIuNDcuMwo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
