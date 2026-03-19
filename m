Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4D81090223
	for <opensbi@archiver.kernel.org>; Thu, 19 Mar 2026 13:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h4FnO/aWF/fszVqGaGnP6nX5Ie7FqIfvnW9jRbPD4Ck=; b=SDKN4JPryKxucu
	hunVxyzusGdTE9J1msapfcN7UZN8Fi9QRYJn2ZwBST6tbBBA9VGflp7P2xbr/5+PEh3IHyF2U+uoQ
	wCRalkh+dIfwhSPPnovZLHtSdAF9wDkRYGRY12uxnKqQPRFMFnm8SogSf42Y2xWrLR3G3+AygMXzD
	4BWKC2qH0jIbIM17FwVcZqEL70Z1sw8NTGpt0I9RTQCg+R92uwYf0iQCSnYbR0Q/X8V1W/MgptApi
	uN8OcvIB1jEOi7m20F9xv4dcVv6Qv1+2ljSMrk5AF3+QYD9pbS2O/38we5yHw+ilY+sGf6HER3Z0u
	nwO3j7RBLuPEIRqBsEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DKh-0000000AgPW-1UC5;
	Thu, 19 Mar 2026 13:22:39 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DKe-0000000AgPC-3Vg0
	for opensbi@lists.infradead.org;
	Thu, 19 Mar 2026 13:22:37 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-358dff8447cso93904a91.0
        for <opensbi@lists.infradead.org>; Thu, 19 Mar 2026 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773926555; x=1774531355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQV4Qxf7JcVqvazdEZA1WNkk/8W6XiHElFzIS03hGOk=;
        b=eA3KWSKNCoPNlQWRV+BvdiZ4Lw+Wj6Fl+RNTKz/1lD2/FqIJtlQQJPJ1/wvxRWJn4W
         cajJzTlm1we9k5BMvwM/TCcoTX1pWLK9cI/+IjAvhO/IdnxsJ2XGFb2aUZ+afvqtV/Zy
         UUDn60bWJXPP/01WU3OqmOOXBPId0Y8gn4SyST69c3qhzAh7uAJM1HdHM4SqVC5eERm5
         ClOQ97Q9oFFPUd4qcA+SEfzN+C2g8CE/9JUCLO32qZGlKgPSQYPne1ToZD2m0UU/PTn6
         +DPCiE8sg6ESJ9qhBZsuj3sBxzOYQ/F65alJtyjugIWXHi5QFBKoZ2GLnD0Xx0H7PfLc
         mzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773926555; x=1774531355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQV4Qxf7JcVqvazdEZA1WNkk/8W6XiHElFzIS03hGOk=;
        b=UebpkvSqwFR+VlhN1L2Tht0Fqh3RvmLEMKGwPhp5C5Eeyix9/9Ov0W/UaEdwjsg/ry
         iQ299PJzdwKoPmqRGM3xkjG+WRaTDlMHB27yAb6KbBjnsvoiF9+tLXbm0lZD0udTIKY5
         XzGLQLp3L8P82HTUeQPIfK2qiiQjzvJk3zXA6Blpg89NhyAWS/UltIAT8xoTRRm1CheG
         Iz3NJritnzdbyUSuZuF3OQtZOUqiTr52KxgYJCsD8qDBRjpX+E/kFaPBP2DnqtMft1by
         2gHdI6VO4XB6G6ff018fDPDrVBUsHwE390PkCsCenALFF/0oZ6oMjwKRdYRmQxDr/3cF
         usVA==
X-Gm-Message-State: AOJu0Yw4HYQK7bGwtKu7aBpYZLcLpVVwcoUWflUeLG61Z80LGNc0vWyK
	lRA2oJVmhxf0gOGKCpYyHV97sYSlrzcdD/AXBUdlv8qyr6F9wNet0Qw/B9cu4lR9
X-Gm-Gg: ATEYQzzweDkymoBHP0zc/V3D758qO14hkYIbtxzbZBTHQbTVkdiGBT1cPz8Bos0yIe4
	goqJoNQ/tAMduh0Dka2py8JHwACK9yZejikq4GGipAC+aZNZcJ9kk3xBhi2FSCk3TwMd4FcSk7/
	eqPOw7vCZjsKqXupw7ANJF9S95681G8LWclkwZ2MA5EMFbOT91qmJwr3ObMGR3FTbycivYF3kBr
	tdstwXWqWmyMvcqcUMxO6o+R9hwk5nomqFHmHibL6FNqBIR9xGa9QHgYLR7gfb6K3Oa4tcEURM9
	oXfxkFsJrAZnK0nv1phDFWx8COlPKUuyv3hSNFJvuohSsvbGSYuVynQUFeMmcjGJGWT5wyv/XPO
	N86B0MPyN2tJdBsv6seMoIer/OxJMBOSKvAReRAq2TkYOPQpIxGQkBaYzqgoX/HCKhblQLOXGkU
	ZHp04ezkc5b316w5fpMk2zLDeqglElnjqMLYodWOIRtE5f+G3GrIY=
X-Received: by 2002:a17:90b:2886:b0:35b:91ab:148d with SMTP id 98e67ed59e1d1-35bb9f4cdb3mr3937514a91.6.1773926555025;
        Thu, 19 Mar 2026 06:22:35 -0700 (PDT)
Received: from localhost.localdomain ([150.91.169.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e543579sm5306617a12.16.2026.03.19.06.22.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Mar 2026 06:22:34 -0700 (PDT)
From: Takumi Hara <takumihara1226@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	Takumi Hara <takumihara1226@gmail.com>
Subject: [PATCH] lib: sbi_domain: reject overflowing address range in check_addr_range()
Date: Thu, 19 Mar 2026 22:22:32 +0900
Message-ID: <20260319132232.51572-1-takumihara1226@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_062236_893595_148BA585 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

sbi_domain_check_addr_range() computes `max = addr + size` without
checking for integer overflow. When a caller passes a size large enough
to wrap around (e.g. addr=0x80000000, size=0xFFFFFFFF80000000), max
becomes less than addr, causing the while(addr < max) validation loop
to be skipped entirely. The function then returns true without
performing any permission checks.

This allows an S-mode caller to bypass domain memory protection and
access M-mode memory through SBI extensions that use address range
validation (e.g. DBCN console write/read).

Add an overflow check after computing max: if size is non-zero and
max wrapped to a value <= addr, reject the request.

Signed-off-by: Takumi Hara <takumihara1226@gmail.com>
---
 lib/sbi/sbi_domain.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 7030848..3df521f 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -505,6 +505,9 @@ bool sbi_domain_check_addr_range(const struct sbi_domain *dom,
 	if (!dom)
 		return false;
 
+	if (size && max <= addr)
+		return false;
+
 	while (addr < max) {
 		reg = find_region(dom, addr);
 		if (!reg)
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
