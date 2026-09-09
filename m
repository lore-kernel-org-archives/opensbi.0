Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0962DC79FBF
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1sD+YcFqd6GRrUPdDfywvV3e7H/Z+/bCLEQfF2U+Iw=; b=kRnhUPqYfeNO7r
	flogRVksNrL5bSa0Vb/QGtcRlL1SbsoocbreZoY3lu8GYZL1ptCXkFgq2DBvbgleDl9JY3VVnuZia
	M4n6qzd2MCLeewETlX77LF0QD39CoEAh8O6OAcdZtgMNh0p0+F1XvVxLcOhc6N3lGCLjoZVAT1G9I
	K/2HbYz3iNlvSAnr6dPAvKbhpmPVIsH+sqIW8KTqPqHvMHLdrVFI76J0ixuJ7T25Zx/rI4DRLsrT1
	NRou71P24D12i/nWwQVa4o1RSE0CEIKPBF/0yiSCVYeOaTsmk9dqBpl5tWVeEbHxjgknR3Ttv0y8b
	GSUKxxxgXAGqQCwrCNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCk-0000000CJbC-48Sr;
	Wed, 09 Sep 2026 16:31:22 +0000
Received: from mail-wm2-x0a.google.com ([2a00:1450:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LCi-0000000CJYq-0QWl
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:21 +0000
Received: by mail-wm2-x0a.google.com with SMTP id 5b1f17b1804b1-495501e57beso26930675e9.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971478; x=1789576278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oimCyaUVgC1Ktdf2j+o40ks8fFeS+45SZhhZXjtyyxQ=;
        b=kzZUiiCR1+lWSPAdbxIN0YR8DXxcLWz4tK4UpnesZFRMUObDtNx+hcxxK766MpntrR
         +GoMLb0SRaGnYwxnB2nzkT21pVgLXC5sjmI682znl1MJeEXEdO7Q31u4MEubafM0KyNn
         ThHccoVA5FjCnOIEpSvkRvf0PX0mxWGYPiNt+lan95wB/nJ6oNpxN13fuU8BaA7MifCc
         mis+nUyVLZqQbS2H6X/hVh11seBqlgvsDZNW/PVAAXXS9R5wDuoUJ3smIBwX6Zp3EWfX
         bsV5ud0IULfBD+m4t39neGO0E0tjVr2PLro0+TKPP6WqDxrky8UPtHa1EPzbXYj6dIyz
         NI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971478; x=1789576278;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oimCyaUVgC1Ktdf2j+o40ks8fFeS+45SZhhZXjtyyxQ=;
        b=jJKtEFturnyvyHwXL69q3BCPih+13pSR1/WjGQWsXMvUjJGFeWJUP3mKo8YL3kDX9e
         65f6/GRfvQKBC7/T/KNmynfCJf/dhh8aqrFP+7DEjGpklmGFw2bT3vU2lIabFlVLJt9X
         GLf7rMS73E26dkYK9gcXnKfvvQD8j59vz6B1JwCqCB4GZbrEXixOIQBg3+FRk5NSGy/s
         McvCis3ck+CxOh7j7d7LLxE38+9UkFN6spMT5jL36p7cl4W3IO+8KvWOO7hTlDEri6LY
         Og/Bw5bzrUpcrh3mTXTvTY00Fk23ZutTz4tnV+Wssmsl5eatgkF3dgdFQNf/AP/8w3/2
         +E6g==
X-Gm-Message-State: AFuF++lPietrYcwRzEl6M1Q3ukTO79aB/YdOkQCIQMr1Q5V5XeHjFuV/
	ZLMFY+R4+dejMNmbVcxgxcZt3KD8KDJKzeyjy5rfa1Ev5Cm7u1cpzwRVFhDnAfMR
X-Gm-Gg: AYBFou33m8EaG4jH+8FBT5XVUMA+5rnz6/H6OvoruAazv+SG3b/gw5nouA290mFA3UV
	d+OFDZ89xrw89j1tcGz3WTQwGpE2mx36YIVB2PWWqbwOgFEaZXFYQrb3SduS95oG4W0XseZX2kZ
	N1bDqQF6g9s6Y66Pt8QzbXMzrYu/F4eNEm3mNiboJC0spS1+KJc6I6uhSk/ydM84t6IBqM96Z4f
	Ug0iL6/6heln5pAIloc6s60nuoSVCJUD9LTrtzzmvQrSreNaVUyWRgpNUEXbqmUrfiTZBM6Yo9v
	nDxrKTp5mfcaZWyVzqHZ/a5OSlAn+VQ5o6NeNWu2qfNFQV6Lvgc1K25rAUc3bEuU4O6PWslGuik
	RBZN3x7LY0yK4NJ3ecewZeQveIAZ5p9+Ra9Pe+VhfH/vPi00AnxZZh1X0LhAU9MfjnEoTr6uqVK
	IUoYmeFq/Fc4LYUSTqfQpCE1+O23UXkRXGjKUPc09EAFYVpVTqVUbM3w2jraJTmadMKy6OOO4u4
	K6bA3EliKNBM+1A3mwBCHjfQupgkue+W/NRomqrAExM2G0K+A5zC3pzB0EGON9G9MBITUY74vpQ
	K3M=
X-Received: by 2002:a05:600c:620e:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-49cff2078b8mr344712235e9.31.1788971478302;
        Wed, 09 Sep 2026 09:31:18 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:17 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 03/14] lib: sbi_fifo: add TSA annotations
Date: Wed,  9 Sep 2026 18:23:12 +0200
Message-ID: <20260909162322.29778-5-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093120_157067_9BE35F35 
X-CRM114-Status: GOOD (  11.62  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSBGSUZP
CmltcGxlbWVudGF0aW9uLiBUaGlzIGNvbnNpc3RzIG9mIGluZGljYXRpbmcgd2hpY2ggZmllbGRz
IGFyZSBwcm90ZWN0ZWQKYnkgYSBzcGlubG9jayBhbmQgYW5ub3RhdGluZyBmdW5jdGlvbnN0IHRo
YXQgbXVzdCBiZSBjYWxsZWQgdW5kZXIgYQpzcGlubG9jay4gc2JpX2ZpZm9faW5pdCgpIG11c3Qg
YmUgZXhjbHVkZWQsIGFzIGFjcXVpcmluZyBhIHNwaW5sb2NrCmJlZm9yZSBpdCBpcyBpbml0aWFs
aXplZCBkb2VzIG5vdCBtYWtlIHNlbnNlLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8
Y2FybG9zLmxvcGV6cjQwOTZAZ21haWwuY29tPgotLS0KIGluY2x1ZGUvc2JpL3NiaV9maWZvLmgg
fCAgNiArKystLS0KIGxpYi9zYmkvc2JpX2ZpZm8uYyAgICAgfCAxMSArKysrKysrKy0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvc2JpL3NiaV9maWZvLmggYi9pbmNsdWRlL3NiaS9zYmlfZmlmby5oCmluZGV4
IDg5YTJlYTI2YTI1OS4uNGVjMTBlMDU0MTVlIDEwMDY0NAotLS0gYS9pbmNsdWRlL3NiaS9zYmlf
Zmlmby5oCisrKyBiL2luY2x1ZGUvc2JpL3NiaV9maWZvLmgKQEAgLTE1LDEyICsxNSwxMiBAQAog
I2luY2x1ZGUgPHNiaS9zYmlfdHlwZXMuaD4KIAogc3RydWN0IHNiaV9maWZvIHsKLQl2b2lkICpx
dWV1ZTsKIAlzcGlubG9ja190IHFsb2NrOworCXZvaWQgKnF1ZXVlIFBUX0dVQVJERURfQlkoJnFs
b2NrKTsKIAl1MTYgZW50cnlfc2l6ZTsKIAl1MTYgbnVtX2VudHJpZXM7Ci0JdTE2IGF2YWlsOwot
CXUxNiB0YWlsOworCXUxNiBhdmFpbCBHVUFSREVEX0JZKCZxbG9jayk7CisJdTE2IHRhaWwgR1VB
UkRFRF9CWSgmcWxvY2spOwogfTsKIAogI2RlZmluZSBTQklfRklGT19JTklUSUFMSVpFUihfX3F1
ZXVlX21lbSwgX19lbnRyaWVzLCBfX2VudHJ5X3NpemUpCVwKZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX2ZpZm8uYyBiL2xpYi9zYmkvc2JpX2ZpZm8uYwppbmRleCBkMDdlYmZmNDk1NWMuLjg4Yjg4
ODhkMmU4MSAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlfZmlmby5jCisrKyBiL2xpYi9zYmkvc2Jp
X2ZpZm8uYwpAQCAtMTMsNyArMTMsNyBAQAogI2luY2x1ZGUgPHNiaS9zYmlfc3RyaW5nLmg+CiAK
IHZvaWQgc2JpX2ZpZm9faW5pdChzdHJ1Y3Qgc2JpX2ZpZm8gKmZpZm8sIHZvaWQgKnF1ZXVlX21l
bSwgdTE2IGVudHJpZXMsCi0JCSAgIHUxNiBlbnRyeV9zaXplKQorCQkgICB1MTYgZW50cnlfc2l6
ZSkgTk9fVEhSRUFEX1NBRkVUWV9BTkFMWVNJUwogewogCWZpZm8tPnF1ZXVlCSAgPSBxdWV1ZV9t
ZW07CiAJZmlmby0+bnVtX2VudHJpZXMgPSBlbnRyaWVzOwpAQCAtMjUsNiArMjUsNyBAQCB2b2lk
IHNiaV9maWZvX2luaXQoc3RydWN0IHNiaV9maWZvICpmaWZvLCB2b2lkICpxdWV1ZV9tZW0sIHUx
NiBlbnRyaWVzLAogCiAvKiBOb3RlOiBtdXN0IGJlIGNhbGxlZCB3aXRoIGZpZm8tPnFsb2NrIGhl
bGQgKi8KIHN0YXRpYyBpbmxpbmUgYm9vbCBfX3NiaV9maWZvX2lzX2Z1bGwoc3RydWN0IHNiaV9m
aWZvICpmaWZvKQorCU1VU1RfSE9MRCgmZmlmby0+cWxvY2spCiB7CiAJcmV0dXJuIChmaWZvLT5h
dmFpbCA9PSBmaWZvLT5udW1fZW50cmllcykgPyB0cnVlIDogZmFsc2U7CiB9CkBAIC01OCw3ICs1
OSw4IEBAIGludCBzYmlfZmlmb19pc19mdWxsKHN0cnVjdCBzYmlfZmlmbyAqZmlmbykKIH0KIAog
LyogTm90ZTogbXVzdCBiZSBjYWxsZWQgd2l0aCBmaWZvLT5xbG9jayBoZWxkICovCi1zdGF0aWMg
aW5saW5lIHZvaWQgIF9fc2JpX2ZpZm9fZW5xdWV1ZShzdHJ1Y3Qgc2JpX2ZpZm8gKmZpZm8sIHZv
aWQgKmRhdGEpCitzdGF0aWMgaW5saW5lIHZvaWQgX19zYmlfZmlmb19lbnF1ZXVlKHN0cnVjdCBz
YmlfZmlmbyAqZmlmbywgdm9pZCAqZGF0YSkKKwlNVVNUX0hPTEQoJmZpZm8tPnFsb2NrKQogewog
CXUzMiBoZWFkOwogCkBAIC05MSw3ICs5Myw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCAgX19zYmlf
Zmlmb19lbnF1ZXVlKHN0cnVjdCBzYmlfZmlmbyAqZmlmbywgdm9pZCAqZGF0YSkKIH0KIAogLyog
Tm90ZTogbXVzdCBiZSBjYWxsZWQgd2l0aCBmaWZvLT5xbG9jayBoZWxkICovCi1zdGF0aWMgaW5s
aW5lIHZvaWQgIF9fc2JpX2ZpZm9fZGVxdWV1ZShzdHJ1Y3Qgc2JpX2ZpZm8gKmZpZm8sIHZvaWQg
KmRhdGEpCitzdGF0aWMgaW5saW5lIHZvaWQgX19zYmlfZmlmb19kZXF1ZXVlKHN0cnVjdCBzYmlf
ZmlmbyAqZmlmbywgdm9pZCAqZGF0YSkKKwlNVVNUX0hPTEQoJmZpZm8tPnFsb2NrKQogewogCWlm
ICghZGF0YSkKIAkJZ290byBza2lwX2RhdGFfY29weTsKQEAgLTEyNiw2ICsxMjksNyBAQCBza2lw
X2RhdGFfY29weToKIAogLyogTm90ZTogbXVzdCBiZSBjYWxsZWQgd2l0aCBmaWZvLT5xbG9jayBo
ZWxkICovCiBzdGF0aWMgaW5saW5lIGJvb2wgX19zYmlfZmlmb19pc19lbXB0eShzdHJ1Y3Qgc2Jp
X2ZpZm8gKmZpZm8pCisJTVVTVF9IT0xEKCZmaWZvLT5xbG9jaykKIHsKIAlyZXR1cm4gKGZpZm8t
PmF2YWlsID09IDApID8gdHJ1ZSA6IGZhbHNlOwogfQpAQCAtMTQ2LDYgKzE1MCw3IEBAIGludCBz
YmlfZmlmb19pc19lbXB0eShzdHJ1Y3Qgc2JpX2ZpZm8gKmZpZm8pCiAKIC8qIE5vdGU6IG11c3Qg
YmUgY2FsbGVkIHdpdGggZmlmby0+cWxvY2sgaGVsZCAqLwogc3RhdGljIGlubGluZSB2b2lkIF9f
c2JpX2ZpZm9fcmVzZXQoc3RydWN0IHNiaV9maWZvICpmaWZvKQorCU1VU1RfSE9MRCgmZmlmby0+
cWxvY2spCiB7CiAJc2l6ZV90IHNpemUgPSAoc2l6ZV90KWZpZm8tPm51bV9lbnRyaWVzICogZmlm
by0+ZW50cnlfc2l6ZTsKIAotLSAKMi41MS4wCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
