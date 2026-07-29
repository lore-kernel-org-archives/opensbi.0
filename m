Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C40C53219
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCiE6ho16ODUbs0TcI9zNK0NqBLwUjhaPocDsBd6Zbw=; b=WXgmJDy4ISWshZ
	oNwaUyhVTZgj2Gc6SIgH6hQ0RiGF788chVkr9mI4j/0Aspg4xlRBv81PtiXkq7OcB7cEXtRdstEYV
	gAmkknAlGuTW3c0KmxRluMhgOTSJmUThyFzNPO7tooDHdvLLX1owiMDKFbCI3HEgyr7sHnCpmozwT
	2/87hqGFYjDCKB0J78yXtD13jhLHKpg5XIYFp1jECFpr3JUimnBqRA512xl8ayofvwwjafO3plZ65
	N2idSPTQx3LI8UdHzpzoOyuhnDaT/+m1dUz2nqIAVVYo6HVJYCp92kw+xSbIzsoD/kaVfLdR30d1K
	TFGT3A8yWcU+4j3sQQJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Ok-00000008bZe-2zF6;
	Wed, 29 Jul 2026 16:44:50 +0000
Received: from mail-wr2-x02.google.com ([2a00:1450:4864:30::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oi-00000008bTB-10FH
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:49 +0000
Received: by mail-wr2-x02.google.com with SMTP id ffacd0b85a97d-47f8fd5f16aso417349f8f.0
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343486; x=1785948286; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vK87WVurv60TeCOhjYgUsH+elyo/0Vie5Qb3Nh3ESU=;
        b=G0g7/hP2tUD7+HE+RbAyR5YYWCSW+fmmKctbmTyXdIUre43AdzM0s9cw2mR8KHFTfw
         +icXP0eQgHAyqpe1pboVVlNwbXietgrnI0Jf/QjTOEs4PyQYsprA1rhPf8pnveAMehS7
         2cKWYyV/3zMgb+tOdM6lLyPLiRfZ4REqHSnV32XB0lwtZ9aFRgunNy50Cp2PpVWXMDdK
         4j5mpWN1+YKeJnGAM1arbkWA2NYYnjQdn+6TTESJ5CP+3cKOQYBjRSSExl2d9jkRvUKh
         NUytVdYuIYcvdMfW/Clkgd+vIwJM7H2mYZ6EZ2oNDwxUosbVUbrYSIBLHyxhbo1uwrna
         D3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343486; x=1785948286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vK87WVurv60TeCOhjYgUsH+elyo/0Vie5Qb3Nh3ESU=;
        b=JyLQQ7wgaEm78NyryWSHDvPR6O8jNnYn2fmMrZdqjeKAlABzkHqjx3/PtRYYG1Rv8f
         pr1AI04mZNf71cbaWw4RHfnmIED4AQ/Dwp0TTLKQFIb6JiMg8GjzY/vfhurYoNxeYm3G
         eh1Df3uDxosLB9TK8ejAssIleHsPD+jXGDXav2FnCqqVxYxM+U1FuXmWlBZHok/6/GEV
         4LBKp6cMn8V8tX/82Rapz+OTWHWB49DdCkoZj2dQahCnRWH3YTJduCzDQxofWDWi+6tG
         5sGUk4LfBx+GgG6pciTPOwLa8sxlYUDv037aeaBMhW9nligqr2PDJoZjO+l2DvCmRB61
         86Mg==
X-Gm-Message-State: AOJu0YzcQhx2PhLRw43y8Qk30mRU1tMTTLOwUUnGe6Di4edst2lHvPYT
	BNuXFYjOCKTo+9W04+2VGNG0aRqcRmtIPR3moBbGsNU87Lpt14ODf7/mSCQgtu36o2w=
X-Gm-Gg: AR+sD11sPwjk+tvNLxgpRTF1gSUR3oAkyrttDz2MLV02kDg4/yXGEd+KyI9BC7V1ry/
	yokSjtdHD15GaAc1QOKfNCFnvUh0OZosHL2oNZ1LYW+UFWba45vnd8ENMk9AGqQ3468AkBuAWBU
	wfEjD1nKkMKDcplpxzhiSaQkVxZkziJnGW650xv2yjQ4P1ail6oBvR2qGgTtU1pW3klAX+HRZ3l
	vPV9SY+pdVKs3JUchY0SJu+UEzSRag4fgjF5ep4u3MyRlDSxey3FnUAruV1ZhQ1gHD4XVc40RCM
	Ay4CASxq6wiK3mREMYA5+rc+iz5tKEA/5brDFpbMBOCUry9Fgo0UvPaP+Tzv3fw2WYCaS9AbPmK
	+CJOWUKMF1L6tbOZZhItU/WT7AlYuD5ZCB6FIE9hcqNEjORsUleGaoVvigRjl8euqKHcsI1Tsqv
	f6BP/g5r/sbCtaY047bT+aIeRvHbkHZqbYuJdBq5XXnI8BWdjnDgflj5+K5Snx70VmanRZkz9E3
	EvrtWxD6q1rBm7uiRldaNk5v3qcGDN7rdhSenngStEo/DA8145h8bhTsQ==
X-Received: by 2002:a5d:64e9:0:b0:47f:921f:3a37 with SMTP id ffacd0b85a97d-47fb1f107f9mr8776638f8f.35.1785343486486;
        Wed, 29 Jul 2026 09:44:46 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:46 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 14/14] Makefile: enable Thread Safety Analysis
Date: Wed, 29 Jul 2026 18:35:41 +0200
Message-ID: <20260729163540.3162978-16-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094448_320330_BB0B053F 
X-CRM114-Status: UNSURE (   8.27  )
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

Tm93IHRoYXQgYWxsIGxvY2tpbmcgY29kZSBoYXMgYmVlbiBwcm9wZXJseSBhbm5vdGF0ZWQsIGVu
YWJsZSBjbGFuZydzClRocmVhZCBTYWZldHkgQW5hbHlzaXMuCgpUd28gZmxhZ3MgYXJlIGF2YWls
YWJsZSwgLVd0aHJlYWQtc2FmZXR5LCBhbmQgdGhlIG1vcmUgcmVjZW50Ci1XdGhyZWFkLXNhZmV0
eS1wb2ludGVyLiBUaGUgZm9ybWVyIHdhcyBpbnRyb2R1Y2VkIGJlZm9yZSBjbGFuZyBnYWluZWQK
UklTQy1WIHN1cHBvcnQsIHNvIGl0IGlzIGd1YXJhbnRlZWQgdG8gYmUgYXZhaWxhYmxlLiBUaGUg
bGF0dGVyIHdhcwppbnRyb2R1Y2VkIGluIGNsYW5nIDIxLCBzbyBjaGVjayBpZiB0aGUgcHJvdmlk
ZWQgY29tcGlsZXIgc3VwcG9ydHMgaXQKYmVmb3JlIGVuYWJsaW5nIGl0LgoKU2lnbmVkLW9mZi1i
eTogQ2FybG9zIEzDs3BleiA8Y2FybG9zLmxvcGV6cjQwOTZAZ21haWwuY29tPgotLS0KIE1ha2Vm
aWxlIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQppbmRleCAzNzc5M2FhZjRmZDYuLjUxYTRjN2FlYzFi
YiAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTIwOSw2ICsyMDksOSBA
QCBDQ19TVVBQT1JUX1pJQ1NSX1pJRkVOQ0VJIDo9ICQoc2hlbGwgJChDQykgJChDTEFOR19UQVJH
RVQpICQoUkVMQVhfRkxBRykgLW5vc3RkbAogIyBDaGVjayB3aGV0aGVyIHRoZSBhc3NlbWJsZXIg
YW5kIHRoZSBjb21waWxlciBzdXBwb3J0IHRoZSBWZWN0b3IgZXh0ZW5zaW9uCiBDQ19TVVBQT1JU
X1ZFQ1RPUiA6PSAkKHNoZWxsICQoQ0MpICQoQ0xBTkdfVEFSR0VUKSAkKFJFTEFYX0ZMQUcpIC1u
b3N0ZGxpYiAtbWFyY2g9cnYkKE9QRU5TQklfQ0NfWExFTilndiAtZE0gLUUgLXggYyAvZGV2L251
bGwgMj4mMSB8IGdyZXAgLXEgcmlzY3YuKnZlY3RvciAmJiBlY2hvIHkgfHwgZWNobyBuKQogCisj
IENoZWNrIHdoZXRoZXIgdGhlIGNvbXBpbGVyIHN1cHBvcnRzIC1XdGhyZWFkLXNhZmV0eS1wb2lu
dGVyIChjbGFuZyA+PSAyMikKK0NDX1NVUFBPUlRfV1RIUkVBRF9TQUZFVFlfUE9JTlRFUiA6PSAk
KHNoZWxsICQoQ0MpICQoQ0xBTkdfVEFSR0VUKSAkKFJFTEFYX0ZMQUcpIC1ub3N0ZGxpYiAtV3Ro
cmVhZC1zYWZldHktcG9pbnRlciAteCBjIC9kZXYvbnVsbCAtbyAvZGV2L251bGwgMj4mMSB8IGdy
ZXAgLXEgInVua25vd24gd2FybmluZyIgJiYgZWNobyBuIHx8IGVjaG8geSkKKwogaWZuZXEgKCQo
T1BFTlNCSV9MRF9QSUUpLHkpCiAkKGVycm9yIFlvdXIgbGlua2VyIGRvZXMgbm90IHN1cHBvcnQg
Y3JlYXRpbmcgUElFcywgb3BlbnNiaSByZXF1aXJlcyB0aGlzLikKIGVuZGlmCkBAIC0zNTksNiAr
MzYyLDEwIEBAIGVuZGlmCiBpZmVxICgkKENDX0lTX0NMQU5HKSx5KQogR0VORkxBR1MJKz0JJChD
TEFOR19UQVJHRVQpCiBHRU5GTEFHUwkrPQktV25vLXVudXNlZC1jb21tYW5kLWxpbmUtYXJndW1l
bnQKK0dFTkZMQUdTCSs9CS1XdGhyZWFkLXNhZmV0eQoraWZlcSAoJChDQ19TVVBQT1JUX1dUSFJF
QURfU0FGRVRZX1BPSU5URVIpLHkpCitHRU5GTEFHUwkrPQktV3RocmVhZC1zYWZldHktcG9pbnRl
cgorZW5kaWYKIGVuZGlmCiBHRU5GTEFHUwkrPQktSSQocGxhdGZvcm1fc3JjX2RpcikvaW5jbHVk
ZQogR0VORkxBR1MJKz0JLUkkKGluY2x1ZGVfZGlyKQotLSAKMi41MS4wCgoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
