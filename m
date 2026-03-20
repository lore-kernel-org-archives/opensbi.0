Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6CC1098788
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PxAQL0LRwVZjBpIJrBGOfoWIdhyReR0GZAimSxwuRac=; b=KYA8tguYp1mmWz
	jQgY8wq/mJc2PjD5NE3jf8u206mWGIKPDAmDIIimi0QTm4aL1ctBCgdKAG87WgP9xekYd75dQ8IEm
	PuWdZRYSuZR2X5Avf8tHNij/FjFtvHqUFVqGIzKXEheRrAS7vikCbYwkjxl0gMbua0cR7rHM5+pnJ
	3JvbVfE4m4Gmm/3GX86akNbMCo95no6l1SyqGrBcNVKEgSOeI221Nkbw8yoAisj0mN4BAvOwHi698
	4phDRyXY8hZLyszlAclmTgYgJ/kyQSko2E6um7NodcGB8CrTbRLxaswukJeIA8JPZJseYh7zUecH7
	X6zxXQSTgsncOSpk9Odw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3alY-0000000CvoS-2tQr;
	Fri, 20 Mar 2026 14:23:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3alW-0000000Cvng-0rja
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 14:23:55 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-483487335c2so15441185e9.2
        for <opensbi@lists.infradead.org>; Fri, 20 Mar 2026 07:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774016632; x=1774621432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXOv1u0Mdtr4k5K1fYAgeZwRIlMrsw04+h03H1iBmVE=;
        b=aEfUaMp+nz1npdjqcHVbGctGuRiyPctPJSnSHe/G0Nw+92+IhP2/tA4PpPdKKv/EQo
         TUu4izEr90oZC573HiHR0Qo17mcMUGoa/97V4x9IZ5cEI15I5Nb/4WJtoTmBy5/NiOKg
         QreNleLtn0KK78qUS3S0pcvqu5a7issBQQ7tbdXeUea/mq1rjs7IOL6TcpSSe6DgB+pd
         Ew7q1K0n+G6+WWAXPHmlG5W4tpLVbL7I4FyqeeTcMb6mSBvf/kG02DlceMDAhlBhUy+V
         z5g+vFlqX3OkxjZ8PNCdSMe+/TeteFpyKzHRuh/2/1YikVOhQ6oA143WDp7LQ5Er2+NP
         B+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774016632; x=1774621432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXOv1u0Mdtr4k5K1fYAgeZwRIlMrsw04+h03H1iBmVE=;
        b=T0eDg+JIQMl25x3nDkRoseKvgqE4KI0j7PARjQ9Od4gNTuwn6p6q8n9Pj7zHLOKjM3
         hpU5nuVOmFN4VeVLYigoTIT5FH0gmnrMEgsGrwiG6wcAYEkMPfYmiEUzrzTUCWUMvnJb
         4UiA8jqhxk7JKxXiiZHHADlLn1qnZ93KniliBO0B/29eebMn82GNouGdLrbu+4gsJDYx
         ueA9Uo697X9RWMJX1av4nSeegzxqtf6ppKwdlEBkGAtI9F32wqF2NPHpfzVwQuanSKNH
         bNLSMqCc0rkSnsx2pmt/NVomo6TZ1TDOBUhFyHLcApBGDyi+x4bLruqNTNZBOum5AjKt
         eLfQ==
X-Gm-Message-State: AOJu0YwlC/VfNJRdTsuHb7hg4346LL/r8M/O49tif1E1YFOMeOJOAX/5
	J7YfIULMGf4fUG0+W3dznZkVlLqVFSgW2xUhyu80hz72xfgRnKhTanhmKEoSyN7qJtSJ/bKYDsv
	iTR9Ekko=
X-Gm-Gg: ATEYQzx2ZMKLGLG5kKxfEPCxrV2/QRgnxfGII7J9BJXMEHlDMqqKMzUG8wK8+5GkwsG
	hecCQGvQjHJnvec4InNnllPwIzs2O1tKCUh2Y9fGCEfZte1WakQRFe2oWPbKE0+kw1e5Oxj8XeD
	P8ubv4fBq7nV4hQGDtHWefrJkg0Mdw5s6+g5STYhvfanN1+dIpMl9npWEbOm5ZVJF0Cb9eSCByg
	gbKqAgg1GjD20WQSjZGO1N0eY/XLOnPhWQL9IF1pBPJk2lWONB3wMuTGzCN8d0OzQwLO/8KopWI
	1Gsl1Tw47tm/1cohQBbMxTTncEzlMniABQgnm37UhHpNHkICX31I95h5atBBL2lbP3mkbcS35SN
	kO9bJAy9GrKNISO9Ha8yhfqqX7b4VcsG2WG6o1HyH2EGgRDFkY3I/m2/DqVCWZ0WS6gNYSAFZRN
	sCsM6uIg5d7+Gi4zaFEumt812DmZ/diWLbpXGssx/xJtUuYrwGVV+XITfHY5KQ6a3uGJs=
X-Received: by 2002:a05:600c:3e16:b0:486:fad0:b166 with SMTP id 5b1f17b1804b1-486fee0b74emr51839075e9.17.1774016631722;
        Fri, 20 Mar 2026 07:23:51 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d923fsm108445265e9.1.2026.03.20.07.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:23:50 -0700 (PDT)
From: dave.patel@riscstar.com
To: opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v1 0/4] Add eager FP and RISC-V vector context switching support
Date: Fri, 20 Mar 2026 14:23:45 +0000
Message-ID: <20260320142349.72980-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_072354_512163_A2D68579 
X-CRM114-Status: UNSURE (   5.83  )
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

SGksCgpUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGVhZ2VyIGZsb2F0aW5nLXBv
aW50IGFuZCBSSVNDLVYgdmVjdG9yCmNvbnRleHQgc2F2ZS9yZXN0b3JlIGluIE9wZW5TQkkuCgpU
aGUgZ29hbCBpcyB0byBlbnN1cmUgdGhhdCBtYWNoaW5lLW1vZGUgdHJhcCBoYW5kbGluZyBwcmVz
ZXJ2ZXMgdGhlIGZ1bGwKYXJjaGl0ZWN0dXJhbCBzdGF0ZSBvZiBsb3dlciBwcml2aWxlZ2Ugc29m
dHdhcmUgKGUuZy4sIFMtbW9kZSksIHByb3ZpZGluZwpjb3JyZWN0IGlzb2xhdGlvbiBhY3Jvc3Mg
dHJhcCBib3VuZGFyaWVzLgoKIyMjIE92ZXJ2aWV3CgpUaGlzIHNlcmllcyBpbnRyb2R1Y2VzOgoK
KiBQZXItaGFydCBGUCBhbmQgdmVjdG9yIGNvbnRleHQgcG9pbnRlcnMgaW4gYHNiaV9zY3JhdGNo
YAoqIEZQIGNvbnRleHQgc2F2ZS9yZXN0b3JlIGltcGxlbWVudGF0aW9uCiogUklTQy1WIHZlY3Rv
ciBjb250ZXh0IHNhdmUvcmVzdG9yZSBpbXBsZW1lbnRhdGlvbgoqIEludGVncmF0aW9uIGludG8g
dGhlIE9wZW5TQkkgdHJhcCBoYW5kbGVyCgojIyMgRGVzaWduCgpUaGUgaW1wbGVtZW50YXRpb24g
Zm9sbG93cyBhbiBlYWdlciBjb250ZXh0IHN3aXRjaGluZyBtb2RlbDoKCiogRlAgYW5kIHZlY3Rv
ciBzdGF0ZSBpcyBzYXZlZCBvbiBldmVyeSB0cmFwIGVudHJ5CiogRlAgYW5kIHZlY3RvciBzdGF0
ZSBpcyByZXN0b3JlZCBiZWZvcmUgcmV0dXJuaW5nIGZyb20gdHJhcHMKClRoaXMgZW5zdXJlcyBj
b3JyZWN0bmVzcyBhbmQgYXZvaWRzIHRoZSBuZWVkIGZvciBsYXp5IHN3aXRjaGluZyBvcgp0cmFw
LW9uLWZpcnN0LXVzZSBtZWNoYW5pc21zLgoKIyMjIENvbnRleHQgU3RvcmFnZQoKKiBGUCBjb250
ZXh0OgoKICAqIGYw4oCTZjMxIHJlZ2lzdGVycwogICogZmNzcgoKKiBWZWN0b3IgY29udGV4dDoK
CiAgKiB2MOKAk3YzMSByZWdpc3RlcnMKICAqIHZsLCB2dHlwZSwgdmNzcgoKU3RvcmVkIHBlci1o
YXJ0IHZpYSBgc2JpX3NjcmF0Y2hgLgoKIyMjIE5vdGVzIC8gQXNzdW1wdGlvbnMKCiogQXNzdW1l
cyBGUCBhbmQgdmVjdG9yIHVuaXRzIGFyZSBlbmFibGVkIHdoZW4gdXNlZCAobXN0YXR1cy5GUy9W
UykKKiBBc3N1bWVzIFJWNjQgZm9yIGZsb2F0aW5nLXBvaW50IGltcGxlbWVudGF0aW9uIChmc2Qv
ZmxkKQoqIFZlY3RvciBtYXhpbXVtIHNpemUgaXMgYm91bmRlZCBieSBTQklfTUFYX1ZMRU5CCiog
Q29udGV4dCBwb2ludGVycyBtdXN0IGJlIGluaXRpYWxpemVkIGJlZm9yZSB1c2UKCiMjIyBQZXJm
b3JtYW5jZQoKVGhpcyBhcHByb2FjaCBpbnRyb2R1Y2VzIGFkZGl0aW9uYWwgb3ZlcmhlYWQgb24g
ZXZlcnkgdHJhcCBkdWUgdG8gZnVsbApzdGF0ZSBzYXZlIGFuZCByZXN0b3JlLCBlc3BlY2lhbGx5
IGZvciB2ZWN0b3Igc3RhdGUsIGJ1dCBwcm92aWRlcyBhCnNpbXBsZSBhbmQgZGV0ZXJtaW5pc3Rp
YyBtb2RlbC4KCiMjIyBQYXRjaCBCcmVha2Rvd24KCiogUGF0Y2ggMTogQWRkIEZQIGNvbnRleHQg
c2F2ZS9yZXN0b3JlIHN1cHBvcnQKKiBQYXRjaCAyOiBBZGQgdmVjdG9yIGNvbnRleHQgc2F2ZS9y
ZXN0b3JlIHN1cHBvcnQKKiBQYXRjaCAzOiBFeHRlbmQgc2JpX3NjcmF0Y2ggd2l0aCBGUC92ZWN0
b3IgY29udGV4dCBwb2ludGVycwoqIFBhdGNoIDQ6IEludGVncmF0ZSBpbnRvIHRyYXAgaGFuZGxl
cgoKRmVlZGJhY2sgaXMgd2VsY29tZSwgZXNwZWNpYWxseSByZWdhcmRpbmc6CgoqIENTUiByZXN0
b3JlIG9yZGVyaW5nICh2dHlwZS92bC92Y3NyKQoqIFRyYXAgcGVyZm9ybWFuY2UgaW1wbGljYXRp
b25zCgpUaGFua3MsCkRhdmUgUGF0ZWwKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
