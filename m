Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F2BCCD185
	for <opensbi@archiver.kernel.org>; Wed,  8 Oct 2025 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjODOekMP1Da5aTF8l5aJGRYccQRGp/mfese1etXcdk=; b=KABJZN7RGveBBI
	P/1n+n44o6XtbJ6YEily6+SUm8rjHBqiDTcvDZhmvyqokNEsnbNzd0N85iPEEHG+Psgi/HrUolcVs
	2uRw1RkmGT6HLDhdUcfsGnb1aXrbt2uvddW63Vj8/VkA3rmeVjkV+9vBqUdJxN0Z/l6d3Nd8/ptf2
	dInY8yPv6zdcuphFvQ5nhvBjxLGeBwV0epQ9EPEmeEltDxDC42+nRH7xwspIY6VGQ0bsOmjcxBOIU
	mMshpsllfAfmSLNRWTNjTbCJFRt9uBDME6HkUcUuCrBc1BUr8SISe/ANSddojEOtItIyqlvCh0kK7
	l+V2ustppZJsTylCAMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Pn7-00000003UR8-3T47;
	Wed, 08 Oct 2025 08:44:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Pn5-00000003UPr-1mI5
	for opensbi@lists.infradead.org;
	Wed, 08 Oct 2025 08:44:56 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-273a0aeed57so8829525ad.1
        for <opensbi@lists.infradead.org>; Wed, 08 Oct 2025 01:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759913094; x=1760517894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XKzWJkUh5RMwgbe7le39Sw5Squ8nGWI7QF0YCW/z4I=;
        b=fcjMUMLZ6mqnoF3xjtYY43URu4SpSVRLlwST9IEeTKO1P1XDjM6/ZCoardi2YdZ0PS
         qIT9qnaMijUBVosRk/QtC5db+1/t7zub3ZEKE9lORPE+6giPwUMpmlrZrsdnLJ60nDZO
         8EOI1IqUYWpeXbY5Qv3Gby2Z8yFBP/8ZsY3jq0lje2kZn70QgBfzzq4lqKbvz9UXKztu
         RRlObLs9pjHFDb3Y5zjzMfLXpUGAffksdk3dWTxH8Yh73J0B7PqklBX402DiBYrZt5uK
         a5PxLWpRB4+8CevW22eJCmFdCcCIr8fak5pvS7BKC6dYPTr5BE34dxkoQUZRYF8aRAqr
         QcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913094; x=1760517894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XKzWJkUh5RMwgbe7le39Sw5Squ8nGWI7QF0YCW/z4I=;
        b=VkfRwL3R03/YS5O657EGALSbG0+BUZ0/FPtlgNVXzXg7tL3PX2sNH3sIpdXSZ99k6W
         ogiGIZiicTEDG4a/szi0Ltu4GK1NBzpbfaDv+QeALHrAZ+QKBvaoZxN3X4gadMI4DZeu
         aeW1uUvDVPm09LthRC7wUwNmf2TN61FQ7xshSXn0yfZyNS2Bprz5dgjXioKbil5o68NG
         iDpg1SzbHxx9Rhfi27u9nR+j7SjAduktZlLvzlKW53Gizc7Mfvc/h1FOeDqVTCHOyymv
         c5kxq8bG3AXc19MMNKIK4L8C0rZeiCPo0xMicCGWL2JriPfPGPxR6wcRq/UFZMB9qAau
         WRpA==
X-Gm-Message-State: AOJu0Yzy1EWND1CB6Bc9gLEi2P95oNZeZt6rulhhx+V4rkShtkU1OTS0
	ZJRtdGEPQdq/TMyarvUxXcjlzWelW4Ok5mDH5m6liIglNrFZ3cK/en+/FFV93SnwFJ6WwYwSAn1
	WpIgH69BkstXPsG4LSLaIKJSWDHzxAGJ5nDljYCp7aX5OlCiMpoEdksIrLjBTiGWi2fSgqPjqKe
	XgjKmS/WQapg8VcxofimZUKQzGqAvHIv/ZjDrcVRiOh2a4ptCnnkw=
X-Gm-Gg: ASbGncsbh7++6/ZdgRnQUS2DEg5zAOk8EZQieEOn5xB2Gr8wtv0fRkjpR0b2EdS3HzH
	ul3ocJp7FfThyYWh7ysSQy7008HsmQz9HaLO17Dg4iLC/7PTN1ccDZlnstt1e3Su4AbKdGJ3B/P
	Ps/4lW0MmUJjQVM5AGwYjJFQ/uaz4uZOQB4G1aTHebNQKhiqzkrk7YjHkbkHqaFQHtD0wzHuXV/
	+SacSqr+ba7hGv68Q04ErLajM6t6x4Opl+qoYTu0Et3a0VoDQxvG6/JCJZDvSk6231P0J+CJYNQ
	CbhxMwnEZy991dbHceTk6l9ptuvWQ4OZ2P/1vsoyr9VbTZfQSP5cihdOl/Ifr4Q44qRPV6Ctbj2
	zzoN7ufJjFH7EkqvePUrPmzfMbrwlN+41gT5VDlFYl+6O0tMHHeaCrX9dvNVWMvrFEQ77UAd/KI
	JD1gghyc/b4DOBfggkl82lROdchlgorNISzH+to38onxco1fDLWd7fTMMI
X-Google-Smtp-Source: AGHT+IG0u9BWDJsne/Z2XdpvHrz+gf91+txQn8NVlzvg8ZnxA1sxU7SmFuwL3wqCcc2eMl0xrxpbUw==
X-Received: by 2002:a17:903:388d:b0:27e:f03e:c6b7 with SMTP id d9443c01a7336-28ec9c27a45mr76375775ad.10.1759913094240;
        Wed, 08 Oct 2025 01:44:54 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ecaefd60fsm51327255ad.93.2025.10.08.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:44:53 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	wxjstz@126.com,
	alvinga@andestech.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 2/8] lib: sbi_domain: allow specifying inaccessible region
Date: Wed,  8 Oct 2025 16:44:38 +0800
Message-ID: <20251008084444.3525615-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008084444.3525615-1-peter.lin@sifive.com>
References: <20251008084444.3525615-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014455_467640_BE8C9FE0 
X-CRM114-Status: GOOD (  13.93  )
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

QWNjb3JkaW5nIHRvIHRoZSBSSVND4oCRViBQcml2aWxlZ2VkIFNwZWNpZmljYXRpb24sIFNtZVBN
UApyZWdpb25zIHRoYXQgZ3JhbnQgbm8gYWNjZXNzIGluIGFueSBwcml2aWxlZ2UgbW9kZSBhcmUK
dmFsaWQuIEFsbG93IHN1Y2ggcmVnaW9ucyB0byBiZSBzcGVjaWZpZWQuCgpTaWduZWQtb2ZmLWJ5
OiBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgotLS0KIGxpYi9zYmkv
c2JpX2RvbWFpbi5jIHwgMTIgKysrKysrKysrKystCiBsaWIvc2JpL3NiaV9oYXJ0LmMgICB8ICA0
IC0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW4uYyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5j
CmluZGV4IDFmYTU2YjZhLi44OTI1MGQ0YyAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlfZG9tYWlu
LmMKKysrIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKQEAgLTEyNiw3ICsxMjYsMTcgQEAgdW5zaWdu
ZWQgaW50IHNiaV9kb21haW5fZ2V0X3NtZXBtcF9mbGFncyhzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1y
ZWdpb24gKnJlZykKIHsKIAl1bnNpZ25lZCBpbnQgcG1wX2ZsYWdzID0gMDsKIAotCWlmIChTQklf
RE9NQUlOX01FTVJFR0lPTl9JU19TSEFSRUQocmVnLT5mbGFncykpIHsKKwlpZiAoKHJlZy0+Zmxh
Z3MgJiBTQklfRE9NQUlOX01FTVJFR0lPTl9BQ0NFU1NfTUFTSykgPT0gMCkgeworCQkvKgorCQkg
KiBSZWdpb24gaXMgaW5hY2Nlc3NpYmxlIGluIGFsbCBwcml2aWxlZ2UgbW9kZXMuCisJCSAqCisJ
CSAqIFNtZVBNUCBhbGxvd3MgdHdvIGVuY29kaW5ncyBmb3IgYW4gaW5hY2Nlc3NpYmxlIHJlZ2lv
bjoKKwkJICogICAtIHBtcGNmZy5MUldYID0gMDAwMCAoSW5hY2Nlc3NpYmxlIHJlZ2lvbikKKwkJ
ICogICAtIHBtcGNmZy5MUldYID0gMTAwMCAoTG9ja2VkIGluYWNjZXNzaWJsZSByZWdpb24pCisJ
CSAqIFdlIHVzZSB0aGUgZmlyc3QgZW5jb2RpbmcgaGVyZS4KKwkJICovCisJCXJldHVybiAwOwor
CX0gZWxzZSBpZiAoU0JJX0RPTUFJTl9NRU1SRUdJT05fSVNfU0hBUkVEKHJlZy0+ZmxhZ3MpKSB7
CiAJCS8qIFJlYWQgb25seSBmb3IgYm90aCBNIGFuZCBTVSBtb2RlcyAqLwogCQlpZiAoU0JJX0RP
TUFJTl9NRU1SRUdJT05fSVNfU1VSX01SKHJlZy0+ZmxhZ3MpKQogCQkJcG1wX2ZsYWdzID0gKFBN
UF9MIHwgUE1QX1IgfCBQTVBfVyB8IFBNUF9YKTsKZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hh
cnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwppbmRleCAyZGNhMjY5OS4uZDAxODYxOWIgMTAwNjQ0
Ci0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYworKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKQEAgLTM1
OCw4ICszNTgsNiBAQCBzdGF0aWMgaW50IHNiaV9oYXJ0X3NtZXBtcF9jb25maWd1cmUoc3RydWN0
IHNiaV9zY3JhdGNoICpzY3JhdGNoLAogCQl9CiAKIAkJcG1wX2ZsYWdzID0gc2JpX2RvbWFpbl9n
ZXRfc21lcG1wX2ZsYWdzKHJlZyk7Ci0JCWlmICghcG1wX2ZsYWdzKQotCQkJcmV0dXJuIDA7CiAK
IAkJc2JpX2hhcnRfc21lcG1wX3NldChzY3JhdGNoLCBkb20sIHJlZywgcG1wX2lkeCsrLCBwbXBf
ZmxhZ3MsCiAJCQkJICAgIHBtcF9sb2cyZ3JhbiwgcG1wX2FkZHJfbWF4KTsKQEAgLTM4NCw4ICsz
ODIsNiBAQCBzdGF0aWMgaW50IHNiaV9oYXJ0X3NtZXBtcF9jb25maWd1cmUoc3RydWN0IHNiaV9z
Y3JhdGNoICpzY3JhdGNoLAogCQl9CiAKIAkJcG1wX2ZsYWdzID0gc2JpX2RvbWFpbl9nZXRfc21l
cG1wX2ZsYWdzKHJlZyk7Ci0JCWlmICghcG1wX2ZsYWdzKQotCQkJcmV0dXJuIDA7CiAKIAkJc2Jp
X2hhcnRfc21lcG1wX3NldChzY3JhdGNoLCBkb20sIHJlZywgcG1wX2lkeCsrLCBwbXBfZmxhZ3Ms
CiAJCQkJICAgIHBtcF9sb2cyZ3JhbiwgcG1wX2FkZHJfbWF4KTsKLS0gCjIuNDguMAoKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
