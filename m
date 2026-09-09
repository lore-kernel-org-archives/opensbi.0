Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F11AC79FB6
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zis9WyVW/QGRVSSCE5xW+nzs1BHSrcfnO6w9otGVcNw=; b=abqi+ENURj2yTc
	F/O5YiwOEm0ni7Icb0N4djKt/A25mxAvDVHyzMYCRUgJb62itz9WVaE9BnSfn8ZvnnEwCq3C+WKO2
	iLb6Y3OX7MZ+1TkLdblkdSr3JKyduYkL05AA/s4RBeqZS2ggmNpoM2//UvPlPWgeWce97iJmic74u
	SAMx0MKK0VzxBUyV564LkTdu0zePfljTduCOq8mGD8L05vEqsbamlFm1WXuuOO7nq2+G7Murovmp6
	krIc3lIteVPRobK0DcAOnLVqVGa4RWAR5z29Sav4zFvRtUtaR8FMhBk597dEDeelvMxvtOBRyeDxE
	JLhBTYg9wlKxc6RFYnwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LDE-0000000CJzu-3jrq;
	Wed, 09 Sep 2026 16:31:52 +0000
Received: from mail-wm2-x08.google.com ([2a00:1450:4864:31::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LDC-0000000CJvm-0O6W
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:51 +0000
Received: by mail-wm2-x08.google.com with SMTP id 5b1f17b1804b1-4956bc73c0eso23553445e9.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971508; x=1789576308; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hHcm29/OSHV5fFQ14dhzsKTh/WP74XZM4CvdHzhlEU=;
        b=ZxVIhVoDt5y8ERh9HtUCa2lB0TUyl5p9Hlq2wp75e0n9wL7U1Df/E8/Kgh0L3ZfXPJ
         c0jb33rzl5TGoDGyXzPsT28xtEa3FdtIRog/5lwi2mgdN/dx+T4apbfQy25oKKT+3weQ
         sBf9u01Bf2Jq4DsdlQG22MkPMbUz8OPwlSRErZLEckKrgvWdvROd9pTQd4/exT4uFtBR
         ttmHsUiafhckdhVxQDdvt4Xs4kVkalilRNHPo3BkRb4329kUoUOV3bOtG/x3OkNJyU5Z
         RzJ5ilTnb3s904za+CG7lrwNjpSm+nq6HncP40ymJYwH6mU5MoNcmZTkV4GhDmEkn4lG
         +Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971508; x=1789576308;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hHcm29/OSHV5fFQ14dhzsKTh/WP74XZM4CvdHzhlEU=;
        b=VWFx+0nsiSLu+f+lNZQdrLBTeAqSg+tKZJB/pz1A9esqmwXIEmYPv2bLv/DCrk2/qe
         /SrOhNjHzQXjmqRyJxIYIQDd0etMu/EEO6RJNwayvOMazLlcyRemHOTpVg+ko6w62tsj
         BmMuZMFgoDX7cMs9juhTG7EoYroYTOEK7Kq0z1SURnI+BDcEoN+XwnIC+kj5zUQpkv80
         2nAPw/4HObpEOIwP4GfsOB+19y9Uuir0/fKon/b1JI7QG2zL5ySXmcO2FRoGhat6oQuR
         1PmXyZpa85F//GycernCiMO+6XqiPQUKLpN+QRY4nbmd/qBMCOxuw4l6mS8BHfpwVquh
         WeVQ==
X-Gm-Message-State: AFuF++lo50rDt9N5+boVzbUgst7BNLgsOGc4WiUU911boNi+oF2aHVBy
	JTb48PEr3D1pJO0tghQgdWzyJJ3gs6VpKe3hsRcgLPKFlMcn8NC0J+qF1EbcFDIe
X-Gm-Gg: AYBFou1JBrUG05yBk7bpczEN3uxcPejZ2IAOcQFCz4cPw1prQGP1zvJigtak9CZXS0C
	OsgDgYPsGrJpLCEWdwlhafpB6qF5NGWEa1lBxmqUBzCb+dJo/35lD4wdY9rumF8T2xyhSOnOy20
	lxrQN+kpMZw3CbwMEzq/8C6FtMbvD8w0VfD2uqW0I9SlMToS1AulVZp6O4lHcMQmwEaJx0pVOJg
	s0Csx0D8AE6uUeFyyOgMOQws/zSlrkiwDWYT7Ti3wNLjn1zERb1TSgbdx67GTeRrKxaKkcvd9el
	sOo3sQBHz2skTFpPi7Tn6eyoehuz2aJEE5eflvpecjb03xoox64+5TbrTC8KEwWdOE9j8V3PX9i
	JHZtHO5gMmZlZCdryjbvXdyhlVOEtXOl3IzPMAHlRloiyyDK+ZZhra9jWscRstIYiF/4mR98EVp
	uVLsl/z4ONkc3276r4apGt6UTSWXzkFN3UyykByWvbFuyJIFGb7otvGBp0pspqoBPRnIqnJIhge
	KRA3fGyqH0F6X7jzBrASY6frbC3i07sw9CnjVX29tYcbA8ITA821J6mNsj+c+aX7Yglet0yyf6b
	cwo=
X-Received: by 2002:a05:600c:3b02:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49cf8220edemr388881435e9.6.1788971508253;
        Wed, 09 Sep 2026 09:31:48 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:47 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 14/14] Makefile: enable Thread Safety Analysis
Date: Wed,  9 Sep 2026 18:23:23 +0200
Message-ID: <20260909162322.29778-16-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093150_153144_7B7EC6A5 
X-CRM114-Status: UNSURE (   9.02  )
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
Z2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQppbmRleCBhZWJhYTk4YzM2YzkuLjFiMzMzM2YzYzJk
ZiAxMDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTIwOSw2ICsyMDksOSBA
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
