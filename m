Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8204DD1CDC6
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 04:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiWx1mjewZqk4njyvbE88Rn7htlx2OiF0b5eASTELes=; b=hROFiUT3Te7VWM
	ipgh/H4EGYbnx72FzeQ0M4IipYkFrF5M3MTdtajlvHQm0AbUGyGWM72K3smolwMAqzzH1WlUKC1/Y
	zKJ6Lefh34qXsZzDpdhP4/A7MuWZ14uC4hfYZkyH1uAQns5kzosK5E/f0FtVMpzOiPaiRqsxgjxgv
	+6wPkF5F0YEw2lSPpzKI64DphqsRldn0ugkZ6OgPGzD/jS1CzYVP+JnHIHmqlZ5qhWxSFrr1C1n9Q
	WFTayzRmlDF2Ze4TkuQdwzGm34oo1nTYDnJ1YZ2yvYVCw6LmFFdQb6SSjK8OSBnNZHMuJggdclf93
	SiN9+3gNFwW4aK9hbSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSpHQ-0000000Dnw5-2xBH;
	Tue, 09 Dec 2025 04:24:52 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSpHN-0000000Dnvf-2pmB
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 04:24:51 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6597455d07aso2774918eaf.2
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765254288; x=1765859088; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPMH7JeV/VHdnjy85KMwJfyH1nZpj1/9+xGH5EsnhnE=;
        b=TGJhxuaT00NAot3i0y1b7i2z3a25rSmwavydayzt6qz2IqHvOxr8dg9We/23vUbxs4
         Kk7nNtRGLFVqcaneGkqhTTyUdD7jyCN+4NZ5Dq1dDz28GjlJAZc66imnmxnxX7hBI8iz
         b6sNnxkzZ3za2xnDsnZslfBVFYZOAxPqg20oR7FscWCezJJKI3GG493EHP0uV5PkqHv6
         XR03JLWSMM5XdHpPNdC7Ih5LXRb5M2WVHE7bP3DBEINPyaT2LvkTrmUbC+SA5p9Hvwph
         LJwx2C+arw50uve1YH0B0xzmhVOMRNor/uPO6inLfRq9DJ+1et/62kDjztsWtyZ6mtX8
         V2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254288; x=1765859088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPMH7JeV/VHdnjy85KMwJfyH1nZpj1/9+xGH5EsnhnE=;
        b=MKRSRAU2sqkhCQ5FTM30/rdwuS69AzIMknFFNJz7dRbIyoZ+WE0bD0LGs51SCGQpZB
         CeFmkw5iXNYvoOx2lM/RqUgEGYhTQP6clI9wuN0Deq7fActTiRifUWpBM7JtM7NR9WvY
         1BxM+LrpYmm+0FwXPnFYNI20ZANacwjwENEOHi6Q9YPZ4m6CENk5KvnIdcDaSCHAkRqn
         Gfj5wP2Cy52ieEFblNAjubia+FBtJRv4JLBPIRb/1nHocjzQJZxVP0/66WEByTOJDuaT
         1L7AnNPBTb03ZhyldmqDcokcnOoVtoYI/BHU2JYzdM6BNMym05QcK1LEObQHSLPbIBLf
         GzDg==
X-Forwarded-Encrypted: i=1; AJvYcCVSAjfX7L0TdquVISbSDt6wFFTsTY7OK8B0C4zxxA+NxVv/hqDhDFPnqNK8Z3EkCznzBgw/XR0b@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+nqDTTx1PGM1m8mEx64r7lV3myYwoK2wf377tTVHVGMFaT3rX
	NUW9exgQwIyzX40Li0BcZsfYAWh+YJZiPj6Sg84C3K5s24kkqQCndFdsz3msigtx8VCTBrt8xEN
	I+hPw4iluxFfb5QIvepk1/NRPQhtoTESb3iRUmHsLoA==
X-Gm-Gg: ASbGncvqNnPl026AeWhP2QY/EOe+ZqbHex5ZXDzohXIHaHujDSzDX3+gPn8MDvE4yER
	OzD2ofp2dwDKw07xRiVzHvrpyADdP89q3DHk5PJ0ShBWbMIOH2A48U1kR12LwFx50Fi1L5bJjQH
	wXfl9mU+++Vw52mfd1eKDccwf9ylRn1I3x9Gk2SLNmE62hQXNa+YzVTggXesOOqAbTv+dmeBanu
	xcV1sF44Qv80czXTqySV3zJbUm8XS8uVos7qp0XfV3zG4XNDKkwLc720vTjW5cERrz+Li8=
X-Google-Smtp-Source: AGHT+IHnFAta+LjumB/orDnQ59SQTaVUOzCRcAVKM1128Lkd/+gi7LGtsSkDz14yQASXwYcwUd8XtfC/i3uNP1I2kCg=
X-Received: by 2002:a05:6820:16a6:b0:659:9a49:8f1e with SMTP id
 006d021491bc7-6599a950d44mr3825546eaf.47.1765254288437; Mon, 08 Dec 2025
 20:24:48 -0800 (PST)
MIME-Version: 1.0
References: <46f88d260ac64ca7af4e5f5cbefabeb7@thalesgroup.com>
 <20251204173011.10815-1-manuel.hernandez@openchip.com> <5b9a5b33b81f4f6e98bfd6c08b3ed637@thalesgroup.com>
In-Reply-To: <5b9a5b33b81f4f6e98bfd6c08b3ed637@thalesgroup.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Dec 2025 09:54:38 +0530
X-Gm-Features: AQt7F2oLMA1kxQ5PzsD28awqYKqLiAzB1KkJryMxLVJr-QADyuwnVrf9Zjy0QIw
Message-ID: <CAAhSdy0YTa50YzCeOWPfjHitAmL+bVumSyP4YD+1pj8KWPcMWQ@mail.gmail.com>
Subject: Re: platform: generic: add CVA6 platform and support for PMU
To: LE RHUN Jimmy <jimmy.lerhun@thalesgroup.com>
Cc: =?UTF-8?Q?Manuel_Hern=C3=A1ndez_=7C_OPENCHIP?= <manuel.hernandez@openchip.com>, 
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_202449_742922_1E52BA70 
X-CRM114-Status: GOOD (  10.07  )
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

T24gRnJpLCBEZWMgNSwgMjAyNSBhdCAxMDozN+KAr1BNIExFIFJIVU4gSmltbXkKPGppbW15Lmxl
cmh1bkB0aGFsZXNncm91cC5jb20+IHdyb3RlOgo+Cj4gQ2xhc3NpZmllZCBhczoge09QRU59Cj4K
PiBMZSBqZXVkaSA0IGTDqWNlbWJyZSAyMDI1IDE4OjMwIE1hbnVlbCBIZXJuw6FuZGV6IGEgw6lj
cml0IDoKPiA+IEhpIEppbW15LAo+ID4KPiA+IFRoaXMgZnVuY3Rpb25hbGl0eSBoYXMgYmVlbiBh
bHJlYWR5IG1lcmdlZCwgeW91IGNhbiBmaW5kIGl0IGZvciB0aGUKPiA+IENWQTYgaW4gdGhpcyBj
b21taXQ6IGU4ZGZhNTVmM2Q2YWRhMmUxZjcxNjcxMjEzYmQzYTY4ZWM5NmVhNzYuCj4gPgo+ID4g
UmVnYXJkcywKPiA+IE1hbnVlbAo+Cj4gSGkgTWFudWVsLAo+IFRoYW5rcyBmb3IgeW91ciBxdWlj
ayBhbnN3ZXIuIEkgYW0gY29uZnVzZWQsIGFzIGZvciBtZSBBcmlhbmUgaXMgYSBsZWdhY3kgZGVz
aWduLCBzdXBlcnNlZGVkIGJ5IENWQTYgd2hpY2ggaXMgbWFpbnRhaW5lZCBieSB0aGUgT3BlbiBI
YXJkd2FyZSBHcm91cC4KPiBCZXNpZGVzLCBteSBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHBlcmZv
cm1hbmNlIG1vbml0b3JpbmcgY291bnRlcnMuCgpOb3cgdGhhdCBib3RoIEFyaWFuZSBhbmQgT3Bl
bnBpdG9uIGFyZSBwYXJ0IG9mIHRoZSBnZW5lcmljIHBsYXRmb3JtLAp5b3UgY2FuIHVzZSBGRFQg
LyBEZXZpY2VUcmVlIGJhc2VkIFBNVSBldmVudHMgZGlzY292ZXJ5LgpSZWZlciwgPG9wZW5zYmlf
c291cmNlcz4vZG9jcy9wbXVfc3VwcG9ydC5tZCBmb3IgbW9yZSBkZXRhaWxzLgoKUmVnYXJkcywK
QW51cAoKPgo+IEtpbmQgcmVnYXJkcywKPiBKaW1teQo+Cj4ge09QRU59Cj4KPiAtLQo+IG9wZW5z
YmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
