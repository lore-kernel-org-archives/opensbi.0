Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C00C55175
	for <opensbi@archiver.kernel.org>; Mon,  3 Aug 2026 07:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kN6kQif0pKSFXxaNekJw1oEklpLmAwNyoTrbgoWNpsA=; b=YQzbSmQzguIsIO
	RsiBYZkX1AUy2qNpqpb+8TMY5lCXV7QFsCQ2RuTRQXZB7n0nZafI6xrKbt9jx7+eLXJu2FqaI49Pr
	bcbZexCOwOwPrBCHwVVgTBg74qlW35vepRkZ8JBx8Ff5W6ys2zAGIr/Oy5LnoQAXcy9tjeNWc16ML
	+b4rdfC27CH+FARsa6JiyDf2DJr8J72QKrB2Unj1FTL8s3WTzBSB5Oawz/3vDM3YtKry8sfq5B3n3
	LonJG1n/ILn0wd3MdKGYGhWxhVEVxC6UGJBqPtBxi20xRmE8ezoOXof6Br+5fj+PmSQSb3HoXVq/Z
	ILOab5kWVXXcGv409hKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmxy-0000000GVr1-01nh;
	Mon, 03 Aug 2026 07:20:06 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmxu-0000000GVqC-1vIq
	for opensbi@lists.infradead.org;
	Mon, 03 Aug 2026 07:20:04 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ce7d2adef4so50374845ad.3
        for <opensbi@lists.infradead.org>; Mon, 03 Aug 2026 00:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785741601; x=1786346401; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8DwagQKV/PdVl/yPDTwVAktITdStrxCZxIPD5KLsIDA=;
        b=FAEXsS9MIH0Sfwboi6KjpTuB5MuBOsGOzE6DovP8QuzkkQuijhw6yWRqweS++vFLzX
         de/7TM8uMxJRaVYjBK7SfjSjlo+OuoD9LLt99Sy4ZDR/2M/fopmQVnC3QLHw+jVn61mU
         LlF6ZvtHJ19qqnemU+M9jns4zb6KeBppp72VhnxvhpysYheeRhWz73zWLxtQ2XwAIx7Y
         3evGiCns5Jy/hEyorsb4vHjyBL+06SfW+rja7G+VtpHn57M6dbOQ6Xkh4+ynoyFHaZn5
         7BGcOv2SEmmteHYvyLVEMiDVy7dc+wcxwsCSTWVhqAelZoOc+krG/ar1kdbl9I++inid
         tCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741601; x=1786346401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8DwagQKV/PdVl/yPDTwVAktITdStrxCZxIPD5KLsIDA=;
        b=VJxL8KuKQWJc+yASrKuchoBQwBR0km5TLBqRHrMst92xmq8L/MyW6S4mfuJAdKUQM5
         su4jAcbzEN124AAadXPGaE/mDaVqTxIfcVe0WlDx6UOwfqpkBZ06kAcygRyt1DiEVLB+
         fYM+XVcChoNnditYZeW0g+n9g+Qd+5UpL+NV0FlIKgGn4lOVGa0ozMfxZI0I+Ig7SAVa
         GegsfCgGs4ds84dm3NseBJDe45CKuB/nT1pyA0Et3NYkLoSN4h4oTxsYBVjUdONv5Gc3
         SOKIeGp7LyghvbZ8+NlbbjW1+1GACCNobb1GYpL2kH2k96PwQmjmHWF4wWuGvICRDjHK
         +6TQ==
X-Gm-Message-State: AOJu0YxaT11HML6jw2Kle6krivaJ5oLVqV4QauNwWd5shqqFbMjQ0bv/
	RBcizoLtVNLiiQ366GZCyp+MOGu1ldS6Z/p/yjycXrOipl33FPghd28CYdU1ILlkcq2Ne6eod+d
	rRDtNehmAxcbalgNcJQuLV4iA2J/ounIUPtLNzZZGyVfYV2YmriBozKrBD+pKTaLzoslR8Cgaev
	BwPRKiTfo8dyKK0k6/Dc9ZK1CWz4EqberhloaOdjhTZriJVMyrgF5gqw==
X-Gm-Gg: AR+sD10HTRFDmAjxEnnBt9fTE9ENaPmvGRbCZICBDmOuegd7M72SuRdwl7UexKRa1yW
	a49n2msPtvicdeuDnmTJ2k6m07A8VBTlxONnICTmGfh6ZDo7RhSUGMX5rlwb9beu2J76jdm4V0g
	aAKtHuQS0UTHJCNj+zsbBajQHV84IxFMalRKqfwpYhbmp5/0ofJpFUtMEu1fmmUxMMO6nkCBLqY
	IQv+hXaPbhR9fr7GqQ+EnIZYWtjWRyHmNCc1C3LLiZlGSvYCL5cn4yDtZj/yw/vlrYeFN2lfua3
	aW49oKBGEj/z5sY7sW//z3pBa/F3GHncOLguBKoh1u9zg4M4q0fxlZaeWyBupEleyqzZZQCGfsb
	StAe/5dQR1p+FvcButvjVKRYr/DfPT/i7qxhIHB3HGRkNLyo7WuO79yFUJBGw+J8tk9p8JfxV9E
	9uxeVjfVDWiAZO4/ROcvZtYOQf/Sn4+3UYhmzV2j+YXaRyN9kyiHamJe47lPU=
X-Received: by 2002:a17:903:32ce:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2d0521a5806mr89155085ad.1.1785741600751;
        Mon, 03 Aug 2026 00:20:00 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae19757sm33934345ad.5.2026.08.03.00.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:19:59 -0700 (PDT)
Date: Mon, 3 Aug 2026 15:19:55 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org, anup.patel@qti.qualcomm.com
Cc: zong.li@sifive.com, greentime.hu@sifive.com, anup@brainfault.org,
	scott@riscstar.com, conor@kernel.org, dave.patel@riscstar.com,
	raymond.mao@riscstar.com, robin.randhawa@sifive.com,
	samuel.holland@sifive.com, pawandeep.oza@oss.qualcomm.com
Subject: Re: [RFC PATCH 02/12] lib: utils: fdt_helper: parse RISC-V Worlds DT
 properties
Message-ID: <anBBG9dyACxwHyjr@plin-1878>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-3-peter.lin@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260626101433.3133466-3-peter.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_002002_530501_0066EFB9 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

SGkgQW51cCwKClJlZ2FyZGluZyB0byB0aGUgc3VnZ2VzdGlvbiBpbiB5b3VyIHBhdGNoOgoiWzQv
NV0gbGliOiBzYmk6IEV4dGVuZCBoYXJ0IHByb3RlY3Rpb24gYWJzdHJhY3Rpb24gdG8gYWxsb3cg
SUQgY29uZmlndXJhdGlvbiIKIAogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9jb21tZW50
LzM3MjUxMDUvIAoKPiBUaGUgUklTQy1WIHdvcmxkIERUIHByb3BlcnR5IHBhcnNpbmcgY2FuIGJl
IGRvbmUgYXQgdGhlCj4gdGltZSBvZiBwYXJzaW5nIGRvbWFpbnMgZnJvbSBGRFQgKGxpa2UgYWxy
ZWFkeSBkb25lIGluIHRoaXMKPiBzZXJpZXMpLiBUaGUgaGFydCBwbGF0Zm9ybSBhYnN0cmFjdGlv
biB3aWxsIGJlIG9ubHkgZm9yIGNvbmZpZ3VyaW5nCj4gdGhlIFJJU0MtViB3b3JsZCBDU1JzLgoK
SSBjb25zaWRlcmVkIG1vdmluZyBwZXItaGFydCBwbXdpZCBEVCBwcm9wZXJ0aWVzIHBhcnNpbmcg
aW50bwpnZW5lcmljX2RvbWFpbnNfaW5pdCgpLT5mZHRfZG9tYWluc19wb3B1bGF0ZSgpLCBidXQg
SSB0aGluawpnZW5lcmljX2V4dGVuc2lvbnNfaW5pdCgpLT5mZHRfcGFyc2Vfd29ybGRzX2FsbF9o
YXJ0cygpIGlzCnN0aWxsIHRoZSByaWdodCBwbGFjZSBmb3IgdHdvIHJlYXNvbnM6CjEuIHJpc2N2
LHBtd2lkLCByaXNjdixwbXdpZGxpc3QsIGFuZCByaXNjdixwbWx3aWRsaXN0IGFyZQogICBwZXIt
aGFydCBwcm9wZXJ0aWVzIHN0b3JlZCBpbiBzYmlfaGFydF9mZWF0dXJlcyDigJQgbm90CiAgIHBl
ci1kb21haW4uIFRoZXkgZGVzY3JpYmUgdGhlIGhhcnQncyBwbGF0Zm9ybS1kZWZpbmVkIFdJRAog
ICBjb25maWd1cmF0aW9uLCBpbmRlcGVuZGVudCBvZiB3aGljaCBkb21haW4gdGhlIGhhcnQgaXMK
ICAgYXNzaWduZWQgdG8uCjIuIHBtd2lkIHBhcnNpbmcgc2hvdWxkIGFsc28gd29yayBvbiByb290
LWRvbWFpbi1vbmx5IHN5c3RlbXMKICAgKG5vIC9jaG9zZW4vb3BlbnNiaS1kb21haW5zIGluIERU
KS4gU2luY2UKICAgZmR0X2l0ZXJhdGVfZWFjaF9kb21haW4oKSByZXR1cm5zIGVhcmx5IHdoZW4g
dGhlIGRvbWFpbgogICBjb25maWcgbm9kZSBpcyBhYnNlbnQsIF9fZmR0X3BhcnNlX2RvbWFpbigp
IGlzIG5ldmVyCiAgIGNhbGxlZCDigJQgc28gcGxhY2luZyBwbXdpZCBwYXJzaW5nIHRoZXJlIHdv
dWxkIG1pc3MgdGhvc2UKICAgaGFydCBmZWF0dXJlIGluZm9ybWF0aW9uLgoKU28gdGhlIGZsb3cg
aXM6CgogaW5pdF9jb2xkYm9vdCgpCiDilIIKIOKUnOKUgCBzYmlfaGFydF9pbml0KCkKIOKUgiAg
ICDilJTilIAgaGFydF9kZXRlY3RfZmVhdHVyZXMoKQog4pSCICAgICAgIOKUlOKUgCBnZW5lcmlj
X2V4dGVuc2lvbnNfaW5pdCgpCiDilIIgICAgICAgICAgICDilJzilIAgZmR0X3BhcnNlX2lzYV9l
eHRlbnNpb25zX2FsbF9oYXJ0cygpICDihpAgL2NwdXM6IGhmLT5leHRlbnNpb25zCiDilIIgICAg
ICAgICAgICDilJTilIAgZmR0X3BhcnNlX3dvcmxkc19hbGxfaGFydHMoKSAgICAgICAgICDihpAg
L2NwdXM6IGhmLT5wbXdpZC9wbXdpZGxpc3QvcG1sd2lkbGlzdAog4pSCCiDilJzilIAgc2JpX2Rv
bWFpbl9maW5hbGl6ZSgpCiDilIIgICAg4pSU4pSAIGdlbmVyaWNfZG9tYWluc19pbml0KCkKICAg
ICAgICAgICDilJTilIAgZmR0X2RvbWFpbnNfcG9wdWxhdGUoKQogICAgICAgICAgICAgICAg4pSc
4pSAIHRyYXZlcnNlIC9jcHVzIGZvciBjb2xkYm9vdCBoYXJ0IGRvbWFpbgogICAgICAgICAgICAg
ICAg4pSU4pSAIF9fZmR0X3BhcnNlX2RvbWFpbigpIMOXIE4KICAgICAgICAgICAgICAgICAgICAg
4pSc4pSAIHBhcnNlIHdpZCwgd2lkX2RlbGVnICAgICDihpAgcGVyLWRvbWFpbiBTLW1vZGUgV0lE
CiAgICAgICAgICAgICAgICAgICAgIOKUlOKUgCB0cmF2ZXJzZSAvY3B1cyBmb3IgaGFydCBhc3Np
Z25tZW50CgpEb2VzIHRoaXMgcmVhc29uaW5nIG1ha2Ugc2Vuc2UgdG8geW91PyBPciBkaWQgSSBt
aXNzIHNvbWV0aGluZz8KClRoYW5rcywKUGV0ZXIgTGluCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
