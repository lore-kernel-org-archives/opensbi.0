Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC68C369B5
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhsVbCoDwwAHIOfHrG5p1lUGGyXJ9lyIW1H035ipKlA=; b=PiS5lBX58vsDQy
	SHM34vNamXEnyABXBZ3+T1CGE1vJF6SY/9B77tfm8ui/VUQtAPhgSFbo2oFXBszzK5gvqVilEgt6h
	AmIsfQDfQRM5NqxdKZ4w9DYmrInSYkD11IFJYQPSKm14ltNcrlGg+/lZKL02Q5c5TFbhovZYAJcHO
	v9k16yWJXVHLhPfB/GKdSlw4Vs8t+R5vG+WAGB9vmnacxhxyyQbgqJEkWwimkWhwm04CyZ7b+zfOd
	kjSIEOBplrZ2WF+77SVv3q53V18sL9pVElOFcyVB9Al/b8DEKhYS4MVPx92ZmEr9UPvZhW9Qeaixs
	6UJuT3D1q4xtsPsC/zaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVP-000000067v6-0K1E;
	Tue, 15 Apr 2025 14:43:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gCx-00000005t8x-29M0
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 13:20:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3978ef9a778so265307f8f.0
        for <opensbi@lists.infradead.org>; Tue, 15 Apr 2025 06:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744723210; x=1745328010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igjPAj86U+HtDYeSky3xLABUsIXuTDLfycwFtdxK5Z8=;
        b=mcWj5+qArKsUz/DwY6Ogg3afClC1nQXsva+/q11NCGMSaOhnO4MkyieYMvwgEW6T9I
         HVBmo3tTW6nHYKy3+322qH/quwh3DDiSVCEwp486pJTcav5gIwYAZbJHQC+qhOygUnLI
         39jTpuuWPIF9XyMz7UjkMEdiwOW5Cpp41JnG8KSdjUOjPhx9lTjNxgDzMZG/ahSpE4I8
         GzqfMYs/HR7m8q71IrgA9+SOPLNKS+JptmbnQU43TzcETdRjpKKRG9ssUHIDpSe6eJ1b
         oHb1LN9RCJX2CLmZtO1RvSHn3YeKM1SvryLHhifo34LWBvQOxaswpDH9SV1y+4s6ISvf
         scaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723210; x=1745328010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igjPAj86U+HtDYeSky3xLABUsIXuTDLfycwFtdxK5Z8=;
        b=ZzVtBgEpzfz579fsEuROSPqz/JKhluZxR4FGmeyWJSVgeX6zj6ym4q/boNdlfe+sPZ
         w6IrpcgLZm3uIbOYoZZYEWCTl6R/1KeYUPYvYH0d/ZAaHa90dibWslj9bWTfqQlWSB37
         XzC3l1rZwKIO/CUnSW70kJVxBi/UnbPnURslYp3mWhuAtAQPKHl5bgw3ZOi4G6/FCnKT
         INp7Lj7Uf0kYZj3TeU3ySqO/s5B/w6/ScKezuJ0Pn5GGvNSbK7vAzCJVDDkoHRjKLDct
         /v7VDP2zDtL80IAojwcAFGshIc8B7LPOrvzQ5WTJdX2LtDGxbHpw4KDlQ8VBU0ONr4yr
         tmRQ==
X-Gm-Message-State: AOJu0YzJf4Chfok4d009ZTpzGW38BYvRDbjh+vYtmwRHvOGJZ6yM8vv6
	xydachHbS2svviqSzW1qBXTd78vyK7069sHu8yIXj7nN95BDlimV1owtxVRSaJAbo7emyCBwgBH
	KJeA=
X-Gm-Gg: ASbGnct1DcMZ3eoCR4sRMWZBOfN9s0u56pc+unVGEUwg7zBAGjsprgIQFBWqFAirvjv
	JOy0ZBZYxT/ihBX+fCcj1CUtaRCwzi8osphayn8/+Vc6p0qD/3/gmbaLAfBmd1A2JMKda7IPQI9
	wAnimEhpdQ2PgdHE4T0tD8spLEXAFDo6PiB0F/OxWegRYMY5b5gvj1Hlpvk8n8txPDUc5kHnWwU
	Jm1fEQoV5vHqQsHHjDtsl89wb7c28kFHLgMPvJMB8Vr6xZBnBNYaisa0Spns111BQp8t4tCMWd5
	f0AEd8Z3tJkrAgSqaNZS5EXqIrKE1o5iTq4WrwR3RTKF9DCD
X-Google-Smtp-Source: AGHT+IG/QR+E7O3cG2MP0Ynk+4h9I4+1GAsEyqlqpQ62Ob7I+uDx9170oPq6sJUq57mC7r5krtnvAw==
X-Received: by 2002:a05:6000:2507:b0:39c:e0b:c621 with SMTP id ffacd0b85a97d-39ea51edee4mr4648109f8f.1.1744723209638;
        Tue, 15 Apr 2025 06:20:09 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:c67a:74e3:4d6f:be48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bdf9sm13982824f8f.22.2025.04.15.06.20.09
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:20:09 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 6/8] lib: sbi_hart: reset mstateen0
Date: Tue, 15 Apr 2025 15:19:07 +0200
Message-ID: <20250415131908.2699782-8-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_062011_551299_813F44C8 
X-CRM114-Status: GOOD (  12.17  )
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

VGhlIGN1cnJlbnQgbG9naWMgY2xlYXJzIHNvbWUgYml0cyBiYXNlZCBvbiBTQkkga25vd24gZXh0
ZW5zaW9ucy4KQmUgc2FmZSBhbmQgZG8gbm90IGxlYXZlIGVuYWJsZWQgYW55dGhpbmcgdGhhdCBT
QkkgZG9lc24ndCBjb250cm9sLgoKVGhpcyBpcyBub3QgYSBicmVha2luZyBjaGFuZ2UsIGJlY2F1
c2UgdGhlIHJlZ2lzdGVyIG11c3QgYmUgaW5pdGlhbGl6ZWQKdG8gMCBieSB0aGUgSVNBIG9uIHJl
c2V0LCBidXQgaXQgaXMgYmV0dGVyIHRvIG5vdCBkZXBlbmQgb24gaXQgd2hlbiB3ZQpkb24ndCBu
ZWVkIHRvLgoKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFt
aWNyby5jb20+Ci0tLQogbGliL3NiaS9zYmlfaGFydC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
aGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCmluZGV4IGIyMDlmMWNhYjI3ZC4uNTY5ZjgwMDhi
NTIzIDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKKysrIGIvbGliL3NiaS9zYmlfaGFy
dC5jCkBAIC04OSw3ICs4OSw3IEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qgc2Jp
X3NjcmF0Y2ggKnNjcmF0Y2gpCiAJCWNzcl93cml0ZShDU1JfSFNUQVRVUywgMCk7CiAKIAlpZiAo
c2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01TVEFURUVOKSkg
ewotCQltc3RhdGVlbl92YWwgPSBjc3JfcmVhZDY0KENTUl9NU1RBVEVFTjApOworCQltc3RhdGVl
bl92YWwgPSAwOwogCQltc3RhdGVlbl92YWwgfD0gU01TVEFURUVOX1NUQVRFTjsKIAkJbXN0YXRl
ZW5fdmFsIHw9IFNNU1RBVEVFTjBfQ09OVEVYVDsKIAkJbXN0YXRlZW5fdmFsIHw9IFNNU1RBVEVF
TjBfSFNFTlZDRkc7Ci0tIAoyLjQ4LjEKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
