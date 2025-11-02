Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40451CCFA02
	for <opensbi@archiver.kernel.org>; Sun,  2 Nov 2025 11:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GO6jDaSJdQlQ2j4wqm9GILfTNyZ12gRM91E4vBITGyE=; b=GyG/TYC5E+jMp7
	XwVUrpcYgjcioFyPYk5XRFE/DBP3KCNgAO4W5NZPg1ctZazMTOQrjWqSZQjtIEpU2L6dRYCVcD2bq
	gdN0NP928+Ziqc+TyvLszqLNUqDwI7SWW2RpPEUSnzsqho66XMJmAXnGDc9fg1tR+RjCDjRxNC9fy
	d6mCuEtuDc8faAuSkZIvmeFSFF1PlKoyfxRRXr8tAZVem+F2TtZCbkrmF++tG13bxLxtCSGFdfJVI
	JYb+/n5pjZvquqOgUam6fuF07ltZDzvhOcFF06ShlA5pLchghtg1zE93ffr7fOP2iZdhWTbDe6Vbl
	49gpZDeKvsHmcgt0kUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFWT1-00000008VxA-00DY;
	Sun, 02 Nov 2025 11:41:51 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFWSy-00000008Vwl-1OZH
	for opensbi@lists.infradead.org;
	Sun, 02 Nov 2025 11:41:49 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-4330d2ea04eso11078165ab.3
        for <opensbi@lists.infradead.org>; Sun, 02 Nov 2025 03:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762083707; x=1762688507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6fsnvARv+yoMfjC/cHX6oQ1xzJGfJyyQua3MMF72fA=;
        b=ygRnhNkKM5I0SCrjr50xzZveoMYDcNqfZ9y7nmU0Y9kXUN1hDs78gAeWk+j0dCUuf4
         1YC2eAqhlmqTN+WLqRD4ugpqUxSV/KD93PGE9OVS5EtT9hOK50+nNjzQRdF2OXzrHPOm
         fVFe1Q/728Prpf2f7/FGo873dkNVkBVYa9+Vp45PvQFTQcvn0APP6W/JPPOXaTqnuMw4
         mqffwiTyfZEO3/HJ24Fqg6fdZTItXpJQlNUn4omdoDjn3n1Hjph9+puwXC1WDPVPMFrG
         U3YMXOZOhL75Hmmi6Gju9Z5fjwhfpUinv8nYuEUezTCLK06P2LrzAxFuwp1BtxMhDqBk
         5SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762083707; x=1762688507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6fsnvARv+yoMfjC/cHX6oQ1xzJGfJyyQua3MMF72fA=;
        b=PYV26Qfm3YNPo4hpaueW8zzJ/TePgeaFzkBaQulFBqplNZF6EESlJP0oAzrjh34fqI
         ruq9dlr1ixkhiUGr2F3FS4z0cmOtcaLoqMsQyJz/MU3ULsT4Pc11yO9NE4EU6HhFrjr2
         CwztT6ulIkwptec6TnqzSQvpFOUT/trlGxWGqgDfs8lYWMPfstqer+hc3Tw9DcYDJVdl
         9x/2uuvqjI1Y+bD+gG//tj8ZBy+piNyOh0YGgBhpVUJxzmlV9ZPmCpS6V77FIaXeBNEK
         seIjFw5QQ7Cjv+Q0onRmbrf7EFqljLlJc+BquC2ETxhb6K7/fWNCMxFRp2OVFdVbTTga
         bdrQ==
X-Gm-Message-State: AOJu0YzPK1VhiFDkjFIOgfktafc50MwaWKKO2X7ezCGyrmeFGpBlO8+W
	uiHJkkFJrTZtVX1nPga77q6IcVcstVmAttzdE5KlqecoP2vsESO48wCcrBEDLyom3U3vGcsdyfF
	TZ4E2In6vD3wSVjnAvNjDCiD7sCWX66/nje5Q9EwFnQ==
X-Gm-Gg: ASbGnctgw+bmg7wnRfG1A8tyocjR1cmIRDIwxd+vI5GW2WvDG9FUjx2BpHtJgBO9m1w
	P2KJtv41HsTR+jfMToc+e7BVRYwxkSXI7JI+U6K4RW16kWYDPrNDfB8SIXYSorPB80BXnQGh/0B
	yLVrhdPUdYd9ks5RuI9jsxA7Xk5vjLs02AmeFtZBEqv/pCOV4UAMy9bj1XmlwX0/VTJnzWjVWG8
	JK62HpBeyS6p0CNTDjBMqNY5TygMN04qrlY67Uues6OfMH+nvCRVizr/VR3SL4QhivOeat+eGZ4
	4h1DPYqZ0X/fwnKFC1ySAIEobbw=
X-Google-Smtp-Source: AGHT+IG0mesurZ7dko7zZG++Jo0m+V8/6Yy4GKoIcwNi5KD1Cqhxd/nIrg3NRB1Khxo1vFqKFdy2+KEpJSNJujpikXI=
X-Received: by 2002:a05:6e02:214a:b0:431:d726:9efd with SMTP id
 e9e14a558f8ab-4330d138fccmr142306745ab.12.1762083707186; Sun, 02 Nov 2025
 03:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20251008084444.3525615-1-peter.lin@sifive.com> <20251008084444.3525615-9-peter.lin@sifive.com>
In-Reply-To: <20251008084444.3525615-9-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 2 Nov 2025 17:11:35 +0530
X-Gm-Features: AWmQ_bkgsK6jg4ZlTSnj85UpEAGPTFHyskr11g6f1G9ZqSipgZG7iIpYpviDrAo
Message-ID: <CAAhSdy2cDdq8c6seME+yn-anLoSSNM_uwfqdByFGmkGsnk07-Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] lib: sbi_domain_context: preserve firmware PMP
 entries during domain context switch
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	wxjstz@126.com, alvinga@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_034148_375281_2FB3E41D 
X-CRM114-Status: GOOD (  14.99  )
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

T24gV2VkLCBPY3QgOCwgMjAyNSBhdCAyOjE14oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIFNtZVBNUCBpcyBlbmFibGVkLCBjbGVh
cmluZyBmaXJtd2FyZSBQTVAgZW50cmllcyBkdXJpbmcgYSBkb21haW4KPiBjb250ZXh0IHN3aXRj
aCBjYW4gdGVtcG9yYXJpbHkgcmV2b2tlIGFjY2VzcyB0byBPcGVuU0JJ4oCZcyBvd24gY29kZSBh
bmQKPiBkYXRhLCBsZWFkaW5nIHRvIGZhdWx0cy4KPgo+IEtlZXAgZmlybXdhcmUgUE1QIGVudHJp
ZXMgZW5hYmxlZCBhY3Jvc3Mgc3dpdGNoZXMgc28gZmlybXdhcmUgcmVnaW9ucwo+IHJlbWFpbiBh
Y2Nlc3NpYmxlIGFuZCBleGVjdXRhYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0
ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgbGliL3Ni
aS9zYmlfZG9tYWluX2NvbnRleHQuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyBi
L2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiBpbmRleCBmYjA0ZDgxZC4uNTE1MzRkZTEg
MTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+ICsrKyBiL2xpYi9z
Ymkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiBAQCAtMTE2LDYgKzExNiwxMCBAQCBzdGF0aWMgdm9p
ZCBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dChzdHJ1Y3QgaGFydF9jb250ZXh0ICpjdHgs
Cj4KPiAgICAgICAgIC8qIFJlY29uZmlndXJlIFBNUCBzZXR0aW5ncyBmb3IgdGhlIG5ldyBkb21h
aW4gKi8KPiAgICAgICAgIGZvciAoaW50IGkgPSAwOyBpIDwgcG1wX2NvdW50OyBpKyspIHsKPiAr
ICAgICAgICAgICAgICAgLyogRG9uJ3QgcmV2b2tlIGZpcm13YXJlIGFjY2VzcyBwZXJtaXNzaW9u
cyAqLwo+ICsgICAgICAgICAgICAgICBpZiAoc2JpX2hhcnRfc21lcG1wX2lzX2Z3X3JlZ2lvbihp
KSkKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArCj4gICAgICAgICAgICAg
ICAgIHNiaV9wbGF0Zm9ybV9wbXBfZGlzYWJsZShzYmlfcGxhdGZvcm1fdGhpc2hhcnRfcHRyKCks
IGkpOwo+ICAgICAgICAgICAgICAgICBwbXBfZGlzYWJsZShpKTsKPiAgICAgICAgIH0KPiAtLQo+
IDIuNDguMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
