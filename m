Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672771098782
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PxAQL0LRwVZjBpIJrBGOfoWIdhyReR0GZAimSxwuRac=; b=ceSDoy1zM9Ntci
	L9aAqnkgx/6v32VqtZlJAkpW0WGgdcup0WRXoJ7mxxaNFIp//S9A6Vf7Et4c6Ztg6KEmUO7OdJRIN
	o0znHtL7SrD+2fMeVtn6b5uf8tRoJgIgqtWt3+dYqUfgOmAMIixRYB5sJFCxciaAmNkcwE2l+XPMf
	MODFGJlmnePfxagm0wQ/TRkJgK134qax5U0lVFXiXTdiCW6pEfrLNZ/A8BkKVWf2TSbkCOexqGxda
	YqyOQmnAE4h/87VNODxD+KmFZcOWkk2xQ9VK6kF2ozQuT1ITaz/5JtMmSDRB0i44NHAVd0rqj//77
	bvZ4KayeAzKT2k/PgvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3arn-0000000CwVt-35dX;
	Fri, 20 Mar 2026 14:30:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3arl-0000000CwV7-32n9
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 14:30:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48374014a77so18987295e9.3
        for <opensbi@lists.infradead.org>; Fri, 20 Mar 2026 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1774017019; x=1774621819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXOv1u0Mdtr4k5K1fYAgeZwRIlMrsw04+h03H1iBmVE=;
        b=bnSZoPg1hHKcC9p/POY27eozNVP1n0DLcDgVC1CPxY8FMnBJKCT3sPPj33sY1zehRp
         caCPB180lFDVqzaQUxqeKOSE39se8ougvmnisoaK+gofgYVp2+Le0zwBrv6xHqV3UKdp
         NyG5MsV6a7Cv59W0nVOdjJ7qvFjbxSaCCWNLHHDJGb7hUpNTP70F0Fv3IYC7k1FmCEZZ
         9nVIGPFyZ8tWB5lVfc5LDy7ieYMLXJ3BOuu3mStq3vjV8MZSPdCTJqLBetBJqW7aO4kD
         9O6A2Mdx3GPeunYCOleQ3rYo+S6oC7AAh5AwfCCNpOUZHIO9a/BL3RCFRlpA2CoKye12
         E2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017019; x=1774621819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXOv1u0Mdtr4k5K1fYAgeZwRIlMrsw04+h03H1iBmVE=;
        b=eKhJYKBBhGkrkL8NB2B/sKELmkT6gXVVIhjezPeS2iDR81Iw8p5bzwKx2oZVnspJlO
         Ulypqu3wvYKa2aL/4SqDSydSukDu0/ttpfZ++AOY6Odjz/U/UKXT2UzMY7AXxtKSby31
         ixXnQ3Mc0gRe/odHwd2LULkuXoyfRojsV6PusvM/s90sNWdfGgiILoAUEe/cwjq/oXmk
         BnR3z/hQKOFO3NrrSEXy71a+ziC859swM6gonqpJCXH3S3K5Inm+fUF8RmTPOY+NC676
         CNAqqoSm8Aa38jtBSnarWwjXS5xtJqK1EFgt7kq+3tWb9EXpdbEhOmWKo7jdm3Cjm/mH
         wRsA==
X-Gm-Message-State: AOJu0Yzwtsvs5JVZKygpsXKso2n+HTpIfoRtONOBoLTrabCiurXbC4Js
	I4MEAJ9oOaRYPq3shuRFhkK0oTm7kkon8VjMPD8FgqcvuwGsKlWbTd9GZaLNaxD22LSWkPYwi53
	UKsgONIg=
X-Gm-Gg: ATEYQzwAVYDZHgzzCCmiEI83+fJn37UoBL5MZPUvXXHV8KrYcJ2t9NKiZHu59PJ9C+q
	GWcag9vHOe9leRp7TZnw5OdpqGHnTdDATz6zUVdmyiq2X/KOGyuA2xnodn7FVIbu8H8FZxlQbWd
	q3SZ2fTUF/EKChAnVlF3OEd/oLtdLLzwdDEh3YThegjM1JQ9u3vLIBNsdebOk3bu/dpo06Inazo
	/F5J0RX8NpdFN2TxQxetGc8q2CuaFvPdcl0cJJtj/2YBjabqyDK+ccVh1FpkZwjIYbAdR1kYREG
	ss7j2I3DwkRbHugbruJcRFxHT42t5ZR4EXW+JnZE4TOxEge1da2y1q3pSleec9gGO3/5PNjd9/h
	kDERsYS2kDgRl9rikBZzJAnD6lxPPChdFuUrcpZF1P2o995VwoBa6Fv8dKHbQCqEzvGsx6+R0kw
	vpcz00d5CZU+sE0tAL0j7fFB1DrcTlNaCYLeI3QXu2fz6/9zBRisfZurFbGTIEtBqhVi/nsqBZq
	XKmzw==
X-Received: by 2002:a05:600c:83c4:b0:485:4006:960c with SMTP id 5b1f17b1804b1-486fee051bbmr48146065e9.16.1774017019398;
        Fri, 20 Mar 2026 07:30:19 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1aeafdsm16608435e9.21.2026.03.20.07.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:30:18 -0700 (PDT)
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
Date: Fri, 20 Mar 2026 14:30:14 +0000
Message-ID: <20260320143018.74191-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_073021_799619_A936037D 
X-CRM114-Status: UNSURE (   5.52  )
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
