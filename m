Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B25CA0EDC
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCVSMN9kpxA+dfY2pVkugtDIkaaR7pBrIvWZDuDFDGs=; b=AZlWaP3VRGDxyU
	BuAvNSNNZBZKEL9TNwia4y7IXM99Eo0g3Lma+FFzQOdiDoVZuj2ss7mdvh+ipfoiuXC6GF0cmhiwC
	0ukwRDL77orrj/8gWVKOypRr5HtegxdVwK9mlESKw8Th6xitVe0ghNrkreP3cqVKbA1GCMeu7D22D
	ZbsvP04FSwiEETY6ZT5W5R5xnfNYpe2wcgKe/WXalUHGCWg5SdokFBepvMKzMAqM4gPWoYduwLdkS
	38LlPo2Cl/sdvkALQS0D+Gf8wXQO9k8JAEYDvN92fCVJ8urFbSnP9GiTTkrjr7R4LnBaYQRLlpRV5
	Ls7EUDF0x7ImcFQDI8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXoZ-0000000H0Qk-2qBo;
	Thu, 14 Aug 2025 13:16:19 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVm9-0000000Gi53-0rA0
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 11:05:42 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b47175d02dcso777153a12.3
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 04:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755169540; x=1755774340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3oitl0sewgubeuvl0HPOz5rs57d2cVBVHghNC7FzDU=;
        b=nNZOugzdOjWEMXe3RjgXZB2nf1qTLFc6gLerYauJlBXGHwh8D1Y2K1NKYRTI8Kt3zI
         CR3Dh8YrG8GPSEnaAB7JEswrQTEaNr2mPPVl8OkiLodLs9QD4pfoTqJL/ol2nPrtwCOH
         b8LxcZ6fhaC+iQym/zPX20z4TB5qK52/gChE4kV5VQSr5Znu9o4Aa8nVwFOwkT3uPJcD
         O8a3uKu7wXOjQDgPIbPn7EyeihWYvqbvRtkhf0kSSGLXvQKP9jNZgsYOxgCaWg0LlvC4
         jHUNRFjR2MiosKmxjx/t+mk9QDTd88LG/eebiZ8P4wZuWPGmo8ldm3W1359zOGzSgLiz
         0xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755169540; x=1755774340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3oitl0sewgubeuvl0HPOz5rs57d2cVBVHghNC7FzDU=;
        b=f9jXEV3SPronD1/EpR0TbVrfV5pQH69YuPBlDKN5hY6g6tnV7ipQEkcewdkHOnT+LC
         W9PC0o7VI6fNWBtzF53K1GFS8luMnjEoHBNHlHkFQSV9d2R76YmnhTSLAAyeZCCPAmnc
         apyW+nh59YoIrSFXZQiPhwCFVHEeoRQfji0Pb2MtqLA2IsqYryTxJCxCUPXgM169V3Zo
         I2M/5E4G7ouv5OVt5bZ0hRWCN11uA9dRPgSzVeKAwzCx53eTRuXwVo50gLFpxJKn1SwF
         8qbvuMvxiMBKAlCZ3Y4uhZTcRAbTQV6GkoqMaq4S6nWdLyDgfRi8CRDRYFecrY5UdlCu
         NKcQ==
X-Gm-Message-State: AOJu0YxZxO4nggjVkkLSOxKCTvq7ubXjqSH6XnIOP+kdX3zduIaqpKOh
	OEMfGBADMja4v311EPdepJRE+yWsG3S6mDZA7OlMPHoOun7zZA42xd38z3jW5FuvhiVzKw9dCOa
	Onxw+S4Hnzu/v+q0S7ssf3d5T5tK0buRgtr1Ggy6siUjsrXN4O4FXGJI+JKHu+0/MCZ9Xrs5aty
	0YM+EwzTKK54qDo2XeCayACPVsG0RVvZmtaPsO32Y64OjtcecEpx9vOQ==
X-Gm-Gg: ASbGncvOPf5SY9dooNh1UWkp0BkIHRKLzD1vAlO3foJ+jJ1eq3okZ6sy+PJiVhhQOWt
	Hji/UvA3JnoS9K0wG4WEn0UDlbREUaQxFM7mSDqtaOVRKctSwiR1aii84UHRupfmUELdbdjsJkf
	2sQsFTua1kM/0MIqkf3ETiNCn0ql5FiyWWhYEe0yZk8am9aOcwg1E0ArJSMDddxMIMk7GqNs8nE
	5h1RajCDElySonu/NCReLL6eH904wEobLm4ncVqgQ+61/5FVPQgzuHljyTiedtHINxmshf7v7Ff
	WmEmaxMBf35w6JdhFMC5WAmpW5K4EQN7dl7zNYCl+BxTVHH+x94PhwTZLr1yEMAt6ubpCDWENPC
	0ekIZRA1S+aqKSFElhpnqfBPG6NXXRXJcijZKKo3WKCNFsJA=
X-Google-Smtp-Source: AGHT+IG6c40O8WXuanr4XxMnKq6ucFl8qqnhM0ir6j7/N7XoWg2uIR5wlrf/na0OfwCDvZ7+sqCMHA==
X-Received: by 2002:a17:903:1b50:b0:240:14f9:cf13 with SMTP id d9443c01a7336-244586f6e7amr38363495ad.51.1755169540098;
        Thu, 14 Aug 2025 04:05:40 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4683722179sm9624755a12.13.2025.08.14.04.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:05:39 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	alvinga@andestech.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 8/8] lib: sbi_domain_context: preserve firmware PMP entries during domain context switch
Date: Thu, 14 Aug 2025 19:05:22 +0800
Message-ID: <20250814110522.18809-9-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250814110522.18809-1-peter.lin@sifive.com>
References: <20250814110522.18809-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_040541_246601_5215A3E1 
X-CRM114-Status: GOOD (  12.48  )
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

V2hlbiBTbWVQTVAgaXMgZW5hYmxlZCwgY2xlYXJpbmcgZmlybXdhcmUgUE1QIGVudHJpZXMgZHVy
aW5nIGEgZG9tYWluCmNvbnRleHQgc3dpdGNoIGNhbiB0ZW1wb3JhcmlseSByZXZva2UgYWNjZXNz
IHRvIE9wZW5TQknigJlzIG93biBjb2RlIGFuZApkYXRhLCBsZWFkaW5nIHRvIGZhdWx0cy4KCktl
ZXAgZmlybXdhcmUgUE1QIGVudHJpZXMgZW5hYmxlZCBhY3Jvc3Mgc3dpdGNoZXMgc28gZmlybXdh
cmUgcmVnaW9ucwpyZW1haW4gYWNjZXNzaWJsZSBhbmQgZXhlY3V0YWJsZS4KClNpZ25lZC1vZmYt
Ynk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+Ci0tLQogbGliL3Ni
aS9zYmlfZG9tYWluX2NvbnRleHQuYyB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9s
aWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQu
YwppbmRleCAxODEyYzdjOS4uNGVlNTBhYzMgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2RvbWFp
bl9jb250ZXh0LmMKKysrIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwpAQCAtODUsNiAr
ODUsNDUgQEAgc3RhdGljIHZvaWQgaGFydF9jb250ZXh0X3NldChzdHJ1Y3Qgc2JpX2RvbWFpbiAq
ZG9tLCB1MzIgaGFydGluZGV4LAogCWhhcnRfY29udGV4dF9nZXQoc2JpX2RvbWFpbl90aGlzaGFy
dF9wdHIoKSwJCQlcCiAJCQkgY3VycmVudF9oYXJ0aW5kZXgoKSkKIAorLyoqCisgKiBEZXRlcm1p
bmUgd2hldGhlciBhIFBNUCBlbnRyeSBwcm90ZWN0cyBmaXJtd2FyZSBtZW1vcnkgcmVnaW9ucwor
ICoKKyAqIEBwYXJhbSBuIFBNUCBlbnRyeSBpbmRleAorICogQHBhcmFtIGRvbSBjdXJyZW50IGRv
bWFpbgorICovCitzdGF0aWMgYm9vbCBwbXBfaXNfZndfcmVnaW9uKHVuc2lnbmVkIGludCBuLCBz
dHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKQoreworCXN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCA9
IHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpOworCXVuc2lnbmVkIGludCBwbXBfY291bnQgPSBz
YmlfaGFydF9wbXBfY291bnQoc2NyYXRjaCk7CisJc3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9u
ICpyZWc7CisJdW5zaWduZWQgbG9uZyBhZGRyLCBsb2cybGVuOworCXVuc2lnbmVkIGxvbmcgcHJv
dCwgZndfZmxhZzsKKwlpbnQgcmM7CisKKwlpZiAoIWRvbSB8fCAobiA+PSBwbXBfY291bnQpKQor
CQlyZXR1cm4gZmFsc2U7CisKKwkvKiBEZWNvZGUgdGhlIHBtcGNmZyBhbmQgcG1wYWRkciAqLwor
CXJjID0gcG1wX2dldChuLCAmcHJvdCwgJmFkZHIsICZsb2cybGVuKTsKKwlpZiAocmMpCisJCXJl
dHVybiBmYWxzZTsKKworCXNiaV9kb21haW5fZm9yX2VhY2hfbWVtcmVnaW9uKGRvbSwgcmVnKSB7
CisJCWlmICgocmVnLT5mbGFncyAmIFNCSV9ET01BSU5fTUVNUkVHSU9OX0ZXKSA9PSAwKQorCQkJ
Y29udGludWU7CisKKwkJLyogRm91bmQgYSBmaXJtd2FyZSByZWdpb24sIGFzc3VtZSBpdCBpcyBh
bHdheXMgTkFQT1QgbW9kZSAqLworCQlmd19mbGFnID0gc2JpX2RvbWFpbl9nZXRfc21lcG1wX2Zs
YWdzKHJlZykgfCBQTVBfQV9OQVBPVDsKKwkJaWYgKChyZWctPmJhc2UgPT0gYWRkcikgJiYKKwkJ
ICAgIChyZWctPm9yZGVyID09IGxvZzJsZW4pICYmCisJCSAgICAoZndfZmxhZyA9PSBwcm90KSkg
eworCQkJcmV0dXJuIHRydWU7CisJCX0KKwl9CisKKwlyZXR1cm4gZmFsc2U7Cit9CisKIC8qKgog
ICogU3dpdGNoZXMgdGhlIEhBUlQgY29udGV4dCBmcm9tIHRoZSBjdXJyZW50IGRvbWFpbiB0byB0
aGUgdGFyZ2V0IGRvbWFpbi4KICAqIFRoaXMgaW5jbHVkZXMgY2hhbmdpbmcgZG9tYWluIGFzc2ln
bm1lbnRzIGFuZCByZWNvbmZpZ3VyaW5nIFBNUCwgYXMgd2VsbApAQCAtMTIxLDYgKzE2MCwxMCBA
QCBzdGF0aWMgdm9pZCBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dChzdHJ1Y3QgaGFydF9j
b250ZXh0ICpjdHgsCiAJCSAgICAoaSA9PSBTQklfU01FUE1QX1JFU1ZfRU5UUlkpKSB7CiAJCQlj
b250aW51ZTsKIAkJfQorCisJCWlmIChwbXBfaXNfZndfcmVnaW9uKGksIGN1cnJlbnRfZG9tKSkK
KwkJCWNvbnRpbnVlOworCiAJCXNiaV9wbGF0Zm9ybV9wbXBfZGlzYWJsZShzYmlfcGxhdGZvcm1f
dGhpc2hhcnRfcHRyKCksIGkpOwogCQlwbXBfZGlzYWJsZShpKTsKIAl9Ci0tIAoyLjM5LjMKCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
