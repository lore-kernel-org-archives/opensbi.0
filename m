Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE3D106FD7D
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLDMHl6mpQZTk1Zn5+VDXR6bTryqu68E3C/NxtyQUMY=; b=rv5fijReYE0N7z
	TS+gASkKNqEfsC0MM9IWGbMNVhZZu0J0vH6FTUsM/p9kXPcZe5WR1BmwqcbCaBfz0Ha9Cb1vqSpja
	RJ32bdZd1+LgBW79AYJ64rOsl69Enwp7/5Y/OqijCu2lUDaielsbzpphVUilJah/ucrPLTTzNobct
	28JLbtFUtIpnvNuvASsvFe7cw8hOqUSdE4MYguiI8uhX8OLMDQ5AlaZ7uYwO8Zv3fVwdsmIvga+Ib
	r25HxuPPGUcTLy0G3IwoDihCQq/bQmI0XxKUBpelmOslQyJh45yq+Z+p2vy7RVuqcux7oZCXX0D+S
	9aiFnZQFIpyFk8eGhZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwq-0000000Gc4R-2j5g;
	Fri, 13 Mar 2026 05:20:32 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwl-0000000Gc2f-3bTx
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:29 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so1745019a91.1
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379226; x=1773984026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT4Pa0ZwzxRktPRl4Hslme6abpfJ7CsB2xDpj2vnLBk=;
        b=gPN1f4CewYo4NXCUtnp1iU95JeostJgNgPwOolt6z/dT6bRA3UkMcH8LQCu5v0NDy1
         ByrMUDktyPdvhKZth0iOLjMJilKTT54K9hzxCCWLsEWyak3KccAa3sFSoJo+W/dQzHTa
         x7e7iSbPm2MQubFNLbfSTODQLuL0C8n/CfyLElXdgRGpzGsbMtWzqFMA7G78kuWS0v3J
         cRq/Iwrr3d3mIuEXrHxYWsDjv57GLqixTvRPxe2ltwXGOg1awJT2QEeDtTaskecJMn61
         j3H3/MekRHTmAYFmrcdh60oblLJ+13c7bgaCbX89RkO0M1naz2ExeY+N97h3MFz4ahuZ
         fpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379226; x=1773984026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dT4Pa0ZwzxRktPRl4Hslme6abpfJ7CsB2xDpj2vnLBk=;
        b=C1AEMWo9DxQvOUnSfP5hyHazxin8TaUj1CShuKtvAw4oeqomd3k3moVVucxmwU+ed2
         kWxjmTWvktcVzM/GkdVIiHiqp46WETF1JXfEn9KgtTDuxCUtjMDya/ommadMnCZyg8hS
         zgYjuEyvaxXOCjiXU/Sr6SdJdXNCKohWi+6pspvt/5nMbqYn83H5hmvZR50VIJPro/cm
         uoyJIhmcM7a4sb4Spc2UdZxDDzOPZxw+XFOCXalkhvtrKu4IPv5rFJT4nisJkKlZ3Jwz
         edjhM8WJzsJO17SyZ1ESyLJW+eHRqPvD4UMAWcNwNkKE4SqjHdqYlFukj1I1Grp6TN4J
         bdUg==
X-Gm-Message-State: AOJu0Yxr14GUvfxVSIQsGx/v70Z/kGZBcGb4pP7CDRNI1HiAn4z9zswF
	qom+DiL+9uEJ27TrMSpoeg+gicu+V7giu4k25n6TR5LevUNsolSD2whWUYJTOQ==
X-Gm-Gg: ATEYQzwC9w/G9KTFgjmYig34ILA8/WbqGtcT8V34u/aUc7+9ELPYz1RBl8jnY2b91ic
	zt7ycD0jwqQ9FzGs3Kp/E0DIBceLQc2/USPDjIx/7I6yE00KuFBSVEDxKCRDvCSKhHrX/NDyoKA
	K1Y5rjqQkBig5EL+cNTe3ACC8amdZJhiEHwcBi0Z74TSS0VW1Ybah9hneRJcvMe8iyGH5PG/Xzm
	AC7AIgwgr3XZD7efKyFP5c6C1g0o4fMthI36+ipy0NAkKYgTBPQ3UP+MYFDdHXacPPhb5VwmQoj
	KAdz/ZAXRmlukyCwgABCSQU0ODXqFcjMZD14cI2zQqLB4mBPBggoW/wz1125efTc+JFbXLUfxFo
	cFep5psH+lCyedImi2GBZCt+bpJI949RoHQk3/LdSMqG4M7kO37ruQYSpMePeCfeDWkIALUlGzb
	8DCRcsVl9Ie7cz8u7l/TWPKQk7+ljZ/6xvJHXmCdaHQViF7xwoq1Spcqz88fJ5VY6xVdrvKaB9V
	25a9Xk=
X-Received: by 2002:a17:90b:4a0b:b0:359:8d95:4a4f with SMTP id 98e67ed59e1d1-35a220b8202mr1854613a91.32.1773379226520;
        Thu, 12 Mar 2026 22:20:26 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 04/18] dbtr: Return correct error on install not supported
Date: Fri, 13 Mar 2026 15:19:33 +1000
Message-ID: <20260313051948.4017134-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222027_896664_54EE4D8E 
X-CRM114-Status: UNSURE (   9.39  )
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

Return SBI_ERR_NOT_SUPPORTED if a trigger is valid but not
supported.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 10ed6b3e..65c3b2df 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -617,7 +617,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 			*out = _idx;
 			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
-			return SBI_ERR_FAILED;
+			return SBI_ERR_NOT_SUPPORTED;
 		}
 
 		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1)) {
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
