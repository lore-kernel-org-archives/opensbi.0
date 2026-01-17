Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13072C98327
	for <opensbi@archiver.kernel.org>; Sat, 17 Jan 2026 12:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=81Sr3QLir7SDbiDZNTljJraXbRwJK8x0HXPSaim/jAg=; b=mYBJXpAPQXpdgK
	HRbCPr4mgMsoxlzH9vOPuybsDdwT5H/W+Yvhv5svRE6Gx+s5L//oGmH9lG/j63k6oYaYe3zXa3WwA
	tcgZkTdVNAMl37ZDr4biFhmVh2zrICtSPYF0smRjbmtmf9mfH1CvrmeNyDhJITN94wlWTmh7sXLfR
	QOkb38GGpeu5T3yk/X+sXwhxDLMpabSZICJsHP/o+3iU1bHgx1gcZZzbghhpnsV1DHbDyuCZBwxvy
	Es8dvWHUm+aa11ALpiTYBjhnAzEDhph6GtcnsEY9KAv2FTBrJJuC9RfBLjZiczQUsTB8mNwqBsCR2
	YZWkzDJqXQXZ4UGzAVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh5lO-0000000FY2G-2xjN;
	Sat, 17 Jan 2026 12:50:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh5lN-0000000FY1s-0YUd
	for opensbi@lists.infradead.org;
	Sat, 17 Jan 2026 12:50:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0ac29fca1so18438355ad.2
        for <opensbi@lists.infradead.org>; Sat, 17 Jan 2026 04:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768654243; x=1769259043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hul/wnBzDqqF6fbUx7p2Z1HBX8tsA5JUfB1P2HwETsQ=;
        b=Nvzy13n3XpFcNOtUZqjHwlkK43XPXtApS3g8q/1OepzOQcAhqx0AmdLRydcRrvjyBd
         cueNF+HsGE2dPVLyOIivc8oX7QeFDoZcGa5tGDNJOIX2KVOTUDApvt7pjrs1KC4YiwcZ
         hHOuLqroU8/WixIXnlzbwK/YR8HN3+gAcdEkeUsEjuRC1uO8JEWzfIuCqWjWOCnkKqal
         aORhI7NAPgwYhEVmyHPRb23sE+WGaVHOEocTtc4714Mj1JUTT1NCN6OK2XZInoUzlkuS
         p4rR6Ok/IfmU6gqDUbcTNeGxxpeUEfE/oinv7pCrTLnmLFEkNhqIguPbQFj0e5uLPKEs
         aDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768654243; x=1769259043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hul/wnBzDqqF6fbUx7p2Z1HBX8tsA5JUfB1P2HwETsQ=;
        b=QViW9NcH3EHF+mQUpe20lpimnxRjRI1TF7jEWlNYLT3tNOvWl1i8BYtUCRhe/5yXUk
         VbsO//u7NRiyK4VikotKaUYJDq7VtfgJesAXP0uWw2JXpB6yahzhuv3z6MMoLub//Vf/
         w9IWWgkoC3+SyCaCAt2AYB35/G+XHSHQhkILUneD4yR8I9JnBZC+DlR1OefcBWkd1T/a
         kd6WJcT3tfqCiskqB09StW/YJtV70iw4VjcGEn/obqPmCgcdXyF7RaZlVNbgeC7aY0aw
         kBfK7TWjn9/bxjr9VffZMPGOVWPR78h65LU7PNebyc72BZtg6jrAljx8PkyihEI0v4Hf
         VkHA==
X-Gm-Message-State: AOJu0YyV6MSSybypES/xdflPgbnyb/YEYbn57h421rOXeZhOWSSeGJH8
	z/j9Ik2pNHsoZ3Rx2WvfMoy5kSGoumBn6gzV7ILTOady6BC9D5+VdozFn0N6+A==
X-Gm-Gg: AY/fxX58xAZ1KGiz53IQ9e3/JBhvdObA/KiCEQRq0LLAo0dJBXS74w3jOWgHHQQnVDG
	kzGZb5Vpc5NDm8wSKt/OcPtiKVVMyDH0B81L3AJccJEfCQKl2zueCQzVg4RPOF216J9wUojZIIe
	3KNZb2Z2jniiY9hB6Lu1COkO7Kaj/s5yrCaahysgduFG8Qz+Pab6g4og8RKzFGDL4NH/im2df/l
	fJg6BEuzA5PhOBs3o4slRq0RzROpB7iNlQmGfpH+5H8UTQ4bUjesoHfK/ANJvZJ1DElDkCUNZvk
	uw/ewTuW8fF34G850xFtrJNpSB+aLKhRO+qQ8OFy3YBkzXcyMdtf41x8tJaF6B7BaTuzh1+tdnk
	d2I5UMZcT5FQisHN3/bcmRLxi1BxoQIaYxQkHkMsnLCwz5mNzpwmohsxe4FJjWuvyU0x1nFCVKx
	3TpyqPuP1RRQL3X9DucVr4o+ogts7y6yldiF4+ZYw91gXQhFsgm0EcLLfsptoY
X-Received: by 2002:a17:903:384d:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a7175a5dacmr56599775ad.32.1768654243376;
        Sat, 17 Jan 2026 04:50:43 -0800 (PST)
Received: from JRT-PC.. (bb121-7-149-229.singnet.com.sg. [121.7.149.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab964sm47307535ad.17.2026.01.17.04.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:50:42 -0800 (PST)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [PATCH] lib: sbi_pmu: Add FW counter index validation when reading high bits on RV64
Date: Sat, 17 Jan 2026 20:50:31 +0800
Message-ID: <20260117125031.56031-1-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_045045_210420_B60D4E6F 
X-CRM114-Status: GOOD (  11.43  )
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

Currently, when we attempt to read the upper 32 bits of a firmware
counter on RV64 or higher, we just set `sbiret.value` to 0 without
validating the counter index. The SBI specification requires us to set
`sbiret.error` to `SBI_ERR_INVALID_PARAM` if the counter index points to
a hardware counter or an invalid counter. Add a validation check to
ensure compliance with the specification on RV64 or higher.

Fixes: 51951d9e9af8 ("lib: sbi_pmu: Implement sbi_pmu_counter_fw_read_hi")
Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 include/sbi/sbi_pmu.h   | 2 ++
 lib/sbi/sbi_ecall_pmu.c | 1 +
 lib/sbi/sbi_pmu.c       | 8 ++++++++
 3 files changed, 11 insertions(+)

diff --git a/include/sbi/sbi_pmu.h b/include/sbi/sbi_pmu.h
index c0e25f5a..51d4a345 100644
--- a/include/sbi/sbi_pmu.h
+++ b/include/sbi/sbi_pmu.h
@@ -138,6 +138,8 @@ int sbi_pmu_add_raw_event_counter_map(uint64_t select, uint64_t select_mask, u32
 
 int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval);
 
+int sbi_pmu_is_fw_ctr_idx(uint32_t cidx);
+
 int sbi_pmu_ctr_stop(unsigned long cidx_base, unsigned long cidx_mask,
 		     unsigned long flag);
 
diff --git a/lib/sbi/sbi_ecall_pmu.c b/lib/sbi/sbi_ecall_pmu.c
index 868e8665..0765d959 100644
--- a/lib/sbi/sbi_ecall_pmu.c
+++ b/lib/sbi/sbi_ecall_pmu.c
@@ -58,6 +58,7 @@ static int sbi_ecall_pmu_handler(unsigned long extid, unsigned long funcid,
 		ret = sbi_pmu_ctr_fw_read(regs->a0, &temp);
 		out->value = temp >> 32;
 #else
+		ret = sbi_pmu_is_fw_ctr_idx(regs->a0);
 		out->value = 0;
 #endif
 		break;
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e084005d..d7ebe4e2 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -227,6 +227,14 @@ static bool pmu_ctr_idx_validate(unsigned long cbase, unsigned long cmask)
 	return cmask && cbase + sbi_fls(cmask) < total_ctrs;
 }
 
+int sbi_pmu_is_fw_ctr_idx(uint32_t cidx)
+{
+	if (cidx < num_hw_ctrs || cidx >= total_ctrs)
+		return SBI_EINVAL;
+
+	return 0;
+}
+
 int sbi_pmu_ctr_fw_read(uint32_t cidx, uint64_t *cval)
 {
 	int event_idx_type;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
