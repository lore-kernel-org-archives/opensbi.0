Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CD9C83F1A
	for <opensbi@archiver.kernel.org>; Tue, 22 Jul 2025 23:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UEGDMtD1pku+He93Eayr3gjSRzTpWJB5mbDJDg2/wFM=; b=wXEf5UdQyNrHHH
	5h67k+g80Xr4q+02Lc984aLklNTy4pgnyG+BWgQkIcYpNumMp0BG7I1pjS6EMqGf5AOIkaeZ3WZrV
	9BOe5wtDY8wHaljzzFqzOIeYzaw7aV+YUE/RG5v8m86zvBg/4hOaXwE2c5VJBuLlcUHmL9pshC01K
	KFtpNCoxzOulyntQLoPNHhtFeXCcoe68AO7iLnGMKsgF9f0sG+Di/OcrfnGZqAdOBxXpurCnfimVs
	dewSN5ohluLMcm59jMtTHVV9egOin3NtYOhkANWetzsmey+3XR5yVLML4z0zU1V7iY0FS2pSozG8j
	lXWo+Y/jr8Fhtkak5ZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueMa0-00000003gPc-3yWF;
	Tue, 22 Jul 2025 23:39:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueMZy-00000003gPF-0N2n
	for opensbi@lists.infradead.org;
	Tue, 22 Jul 2025 23:39:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-234b440afa7so56610175ad.0
        for <opensbi@lists.infradead.org>; Tue, 22 Jul 2025 16:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1753227565; x=1753832365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/Q7aOoV2Umhhbd3J5iDMC6MF99MLtzcDW+9wXDB928=;
        b=LPE6MSkk6G1GSc9EQPy51l7vPm7IEp42i8g94VPj12DTQEeH0mFYHfi1mM7qHBlRGb
         DTJopCLr5uK+Cka8Xet4lca/H9VV6C+hRkD9pV43qILH8D/QhgWXo2ra0zOL6K3PDey7
         4AwN5ORZhEHqicbS55yG6pvqhjw2zmDbWBtkd1WP110EnEPkboofbWxDmDyKx3QbEY37
         ZPPMILDRxASYMZTJE6sgeXCC7r7klDztmNPc6p2LmcQIFPhLsnDMGv/oOJMOaQCykJQU
         BTN7OFvOk2uDYa+BM9n+3Es11zQ57hx3hNkmqbyNTEPQIfcEFo3J8cC3GFNPATp6y1zj
         U6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753227565; x=1753832365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/Q7aOoV2Umhhbd3J5iDMC6MF99MLtzcDW+9wXDB928=;
        b=JqvtRqsgboj+4YoyFC9cYBRekZ9ViWMArRZMBLIhV4Y1F9kyxmdfjse3mZ985dvFsE
         B/3KTbFKOgwt6NOHIWb0txD0j+Op9dfovzZnCXQT5K86LYbXISc6Pgi7Ylmfg6lOydmQ
         mFTww8J8lhPJIy3IRJfpwElqQTWkU8Z+tXSHV6UIepVyfNFIN21Wf0aq4owW4e7uTy1P
         KnqUCLGmlZX368Y3s5sFTsFbG3cawvAhPeUO2zE/8yWvn3MKplVci/biLMbwE7xN3p1S
         zgbtxwb9R9uSG3a0K5MG9A0B8S2tlXZAZl1QZ8BFO6hpILZLyoYtG/5M0zatqM3o5+4t
         1dMw==
X-Gm-Message-State: AOJu0YzuM+QFxHYmuJrIjLY5m3yA9oBa/4kg9jyPZvFmMnOCBAMhVbAs
	femZK5c9yTxcMJ1c7S/zJr02XKxv3N5JnyX99qk8eVDxAUTsProtTrs7jAf4qCPixqMBUvJCt0l
	Yd+wiKWSG80v3d0sKkYLVgnxqh16euE2PtdJuKjVfe+UYsN75lwFRzUC9HRJpKylWRPfgn2bHgB
	GXJiGUyR+B+3Yi0YiudZfa6fXqViH0KsTgQ95HIgStq8ssKdqsTh/bx+c=
X-Gm-Gg: ASbGnct7hV2ziLBocnBzN1Qm7Sughid5Q91p+aJUxbN63ESGUwVv7PlfwXSOPntNx23
	y2u9LJj4RQ8OE5bvJT1wcg3Sp7QKRE+RJN4mV+asY1YT3snp62mH+b77bjFBQPYufhgzCqjmAMO
	IixNhMzEnSDP0V6GnQHfQGhF/zLstOqdYY+2YrQFKQaJOLdnmJjM5cV8OZVkKh2ugnb4BOXdiwa
	2v+345Yfq76g2MeoeE3t3To/pGjjL3aUf6zdtJDSB8CyGiz6PWIUKEGpEXH7AHKmqwFWjivfwWd
	QqfmPNOFVGO0321r9QiKLUOfhHQ+wrRGtvz8QDLuxvuSSRoFB+fLk9sLz1dWtm32olamXElyNwb
	0a3YuXdzyZ+53SY7h+gaYVLV+9wDrHu6cXMDiJWImEPJ8
X-Google-Smtp-Source: AGHT+IGNTxARZwY/C2F9URZtmbrBJlmSSQRHNKEHVC65Dy3BP9gVa5Qy5fJEZAv6LY2hquHYxudq9Q==
X-Received: by 2002:a17:903:174e:b0:235:866:9fac with SMTP id d9443c01a7336-23f9812b6d4mr13050995ad.2.1753227564768;
        Tue, 22 Jul 2025 16:39:24 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2d86sm84990805ad.3.2025.07.22.16.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 16:39:24 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH] platform: generic: Pack the FDT after applying fixups
Date: Tue, 22 Jul 2025 16:39:20 -0700
Message-ID: <20250722233923.1356605-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_163926_151063_9FF1FCBE 
X-CRM114-Status: UNSURE (   8.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

This minimizes the size that will be reserved by the OS for the FDT, and
it prevents the FDT buffer from containing uninitialized memory, which
can be important for some simulation platforms and for attestation.

Closes: https://github.com/riscv-software-src/opensbi/issues/388
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 platform/generic/platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index 47e771ad..889d6905 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -245,6 +245,8 @@ int generic_final_init(bool cold_boot)
 	fdt_fixups(fdt);
 	fdt_domain_fixup(fdt);
 
+	fdt_pack(fdt);
+
 	return 0;
 }
 
-- 
2.47.2

base-commit: cc546e1a06930c5ebaf6e90a9a28dca4218f1954
branch: up/fdt-pack

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
