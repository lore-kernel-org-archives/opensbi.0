Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D07C79F9F
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 18:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KYEepD1k5PuSueTyWZwrdDEXvc2TaDQVVk72PLaTGTU=; b=S+auEPePVzx1eE
	sqn7Gmbs1yypDk/26Nw/cr9ZuOB3Oul4de4VR1oQdT0Fa9kgYtCQOp45lFkqxmlHkLTOWN2R7+33i
	p09KkqEsAYTghY9SEkTlenZOM05abipwyZQlo6mzp9oMWfurCqkafoUAhadDKDJX+nPdtj/FrqZJQ
	60nVKau4G4F5NiN7Z0pYUVK7RMv4FupzerhLFxzD8KimGGNQW85Ff4kr0gYzeVc4x9dhlOePyyrUt
	vn+U5XpQGjWmubzWbQcj/GfBQLHZXNAe6bxTFc0Wc8hwZd1lS9eWovM8qYzkLIM0dtEcqojtEMwie
	JM1Cl9ovu7oYopWVhnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jOF-0000000F8ri-24eL;
	Thu, 10 Sep 2026 18:20:51 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jOD-0000000F8rI-2zy0
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 18:20:50 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so97851e87.3
        for <opensbi@lists.infradead.org>; Thu, 10 Sep 2026 11:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789064447; x=1789669247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9sap1iUWRtW26dKOK5oJDcrrfj2BY1aFjvQkL5aMBWM=;
        b=ReN5LmvvDxVMSl3i9tMm+frLThib6ycKiR6+G3xSzSp5jACpSxqbf0WsmufSrK0T2j
         5Tx6hZkhoVFkxwXvZcJQxmwQFJhKJpsDcXujuTpariFTLzOckom3m6/aP7IXIkGrRRro
         D9A4IwMHSkYtLQo13QuGZo1mFMh/LxxRmoFfcCaM301A3E0Ly0tGTE62UFApiQcSV3D0
         /VIiSjyDzIM/JA/WJs+KUHzuW/CK7aJ+Tjc4sQTbrbLBOWZLGeTe8qOjiKu/dChFOnnZ
         IV9ZxtSkrBaDETnQm/TQSCcT7dRQ2TMWKuW3hunCa6nCWns7ErDKIGGQXfQXVQ/KKmWD
         zp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789064447; x=1789669247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sap1iUWRtW26dKOK5oJDcrrfj2BY1aFjvQkL5aMBWM=;
        b=bfAa9rLLGNfIVqWLbUtnZhNqrIhOo07WjgR6sXDsRwnCsganhuQ7D5Wmq0PRy7Dxkf
         H/ayj1vZaZzDlHRjYcDs6p5AElMVjBWpNFB5/D/mhzG4FoE+7y0HPFKZo/IF6lHZkYd2
         RhPjgzRbhhaPQQObMwoypKT3d1eklX4dMrmQJQTk6Dkt8CSmXUDPoRN3wo5pSYbZHfcM
         EuP0VqOyoJg8nXhBWwnfxvyd5n2DrLtxlYB/fsQJYFUJgV9/uN5Wbh22dIHPcMgj1vLc
         aBwWmVHAQuKspEn8CPlA5n1LxjtT2IqiY01mY76wseRUINbVtCHxyyAz5vHhTeuslwh6
         V3pA==
X-Gm-Message-State: AFuF++l1mO8m7E7iDw8hzUrmA0o32xM9irx+Y3t7Xy6Kibs0sg09LLUk
	H7S1Az2E/gq1CiKyul1MHn/lectzpuEM88Exeo+DAc8MsRsUAwDLuV3J76HD8Kat
X-Gm-Gg: AYBFou0xGEEpRlcdhpfMTcGn8Wr+i8cky/ek/U41mg/dgr+seHmzt53T2VmNqRfZfRF
	nzt1aoqcVCvQZGreH9Rvu01XgAIYJVXL1byW3lpqzlrkUhNm0oKuDg7/m/oBC3gt+6MJwzAaa+Y
	ZMrCAIAT1yQEVVCKM/KTZ1iqrJ90V56aX+2f0XaiJjTiE8FNOrn87kxzfyuL7iPiDj2MLK0jjHN
	xlzMnopq22swX3DjQGgxT1l75WlUv8/sPL0Vi+tmlEsk5M29DEDUs76pftJ5iXkXes7Bku6H53p
	JuCF/gH6H1YDP3KLlYtbUmRgR51KecEQmbnbjGdbDmPHwq9Yf+U//Fj/9Pl+3xtxyR54JroE2su
	SFASoAMm4LtptJ80h0IiEhBFahpr8K4oFOYg6aepyM7rjfgaZCO6aUDvP9E/qMAprUixk4F5Bgz
	9bWEhZXpZm9eB17ER6yPUtEvig1br4f9D13wYSMMhf5+8TIBiTDiBYzk/IKGqy9fShS/YEgvoy8
	Cvoi+vKAwImuWMBvtq/E8HBzq2gjA4DKg/qWpCpGjljPLAM2GAiiGaoEIYAo789AA==
X-Received: by 2002:a05:6512:3ba3:b0:5b7:58c6:d808 with SMTP id 2adb3069b0e04-5b8a030450cmr147670e87.35.1789064446984;
        Thu, 10 Sep 2026 11:20:46 -0700 (PDT)
Received: from localhost.localdomain (46-138-31-164.dynamic.spd-mgts.ru. [46.138.31.164])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a045726fsm56364e87.20.2026.09.10.11.20.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 11:20:46 -0700 (PDT)
From: Evgenii Prokopiev <eestelle0626@gmail.com>
To: opensbi@lists.infradead.org
Cc: Evgenii Prokopiev <eestelle0626@gmail.com>
Subject: [RFC PATCH] lib: sbi_hart: Retrun zero lenght of mhpmcounter when probing failed
Date: Thu, 10 Sep 2026 21:20:26 +0300
Message-ID: <20260910182026.6776-1-eestelle0626@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_112049_764604_45EB5D98 
X-CRM114-Status: GOOD (  10.48  )
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

If writing access is not allowed, it will raise a trap, but we increase
the number of allowed bits to 32 in this approach, which isn't right.
There must be a write of 0.

Move the operation of increasing allowed bits into the 'if' condition.

Signed-off-by: Evgenii Prokopiev <eestelle0626@gmail.com>
---
 lib/sbi/sbi_hart.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..3a9b6c8f 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -450,16 +450,18 @@ static int hart_mhpm_get_allowed_bits(void)
 		val = csr_read_allowed(CSR_MHPMCOUNTER3, &trap);
 		if (trap.cause)
 			return 0;
+
+		num_bits = sbi_fls(val) + 1;
 	}
-	num_bits = sbi_fls(val) + 1;
 #if __riscv_xlen == 32
 	csr_write_allowed(CSR_MHPMCOUNTER3H, &trap, val);
 	if (!trap.cause) {
 		val = csr_read_allowed(CSR_MHPMCOUNTER3H, &trap);
 		if (trap.cause)
 			return num_bits;
+
+		num_bits += sbi_fls(val) + 1;
 	}
-	num_bits += sbi_fls(val) + 1;
 
 #endif
 
-- 
2.50.1 (Apple Git-155)


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
