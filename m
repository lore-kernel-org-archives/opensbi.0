Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8984DD5B149
	for <opensbi@archiver.kernel.org>; Sat, 13 Dec 2025 10:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ku+AsI3ADCwBzHiMLH22SFYrZMwUYrsX8TVjjVSm6/0=; b=qJhHwa/J4DOtpz
	FAbxf4V/jQKp7TiWK2+UfFFBEnZbLWsgqKbGw5lD+EJ2veIFYp5UOgTXu7MD5Z8UebNDeO6+CHJBK
	S4DqpxW/0dXIiPv19vwANMvd1zzjxi0/9D8j4Wh5QWGr2YLkt273nAs9SjrIKtDzlMrcrEWPuvh0o
	DAbi72wGsNegh//W0rpo8JSXDV6TXIQEMkjUVQp/Xmyxc93FoKOR7Ft1xItgfzoDockLDLD/qmb51
	+zKoGGK3NlS9ewAlQadIm4cnWikOPWSEYBjmEQ1ElkwD3R4tihzyHUsPt0H1h71EjMrSxD211o4uv
	MG/fl5eruQGwx/lTY62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUN4W-00000001as4-41xm;
	Sat, 13 Dec 2025 10:41:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUN4V-00000001are-0JOf
	for opensbi@lists.infradead.org;
	Sat, 13 Dec 2025 10:41:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so2265305ad.3
        for <opensbi@lists.infradead.org>; Sat, 13 Dec 2025 02:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765622513; x=1766227313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rnhr9PX56GwU/1BnFqy+Hp80Lnj3/UE+zWypi5qGJA=;
        b=DHDPhMUlkLeruO49tll/ZPFMCOXwLX7Gmj44EMe/z20GWdhiGYFkGkdTU29hWIV0CK
         hb/zqdLk955DVksa1aGKkrO0av8Jn+YJ/k9Rs4Usz504poLTr134sc3qVNqUc6kVqdVJ
         IEMH/zrjR8hz8ilhXH+Wq4QgRRcpW1UciRq6Cs7SXgeVzoXUZ2MrgAtmFHY7bDNdYB5r
         vDNNlHR0knTILCcsY4UzifS+FeqHd5E2huqwotH4bKfft2B/oRrC00fyre3c0HyGaEKC
         aSUZBGInUQ/mcZcbIFz792rNPjN5jy93GjXxGdG64l5bbujZEqN4R/2RF0jbRw9CTPyY
         wl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765622513; x=1766227313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rnhr9PX56GwU/1BnFqy+Hp80Lnj3/UE+zWypi5qGJA=;
        b=xTLMx0Plos+Bgo1GDX1Dxh2qLQMMWjXeDMz7+Z82Rutpbwi/0wdcCbAptsssBq5si/
         VKcfoKxPVa2DH5uUZ8ay8ctDRisBp5qosWMjEIbANFczJMY4iHaAJ7lhELL8gIUE7vnD
         X9aUUPlebZx6RUTDXnwTl/x8XrAotcljhedvFEFvbt7FBUjMba4n9AYGu5v/fdR+zrQY
         5MEur535znllkgBqN6j8dXkTyLPdnX+FQpzp190Bf7YAcEfvNLIa3hxFLLPz7phOSDAp
         +adrsGSoYw6iHf2hdIdMc6B25kjffOr1YIYR/Iz8KPlrqS7CGyQFJ5cAk3/gbYM8kdle
         x+0w==
X-Gm-Message-State: AOJu0YxZKfGw2U+goFRTCDYWGqB/UgqR8Gk3RSxntRplQTeepsmk7UrS
	ULHKrefGmQUZCsBSn7Xes5mmnuVXGLI6gdM0LZw7febh8PsLWRLJoRO6NFB8a92T
X-Gm-Gg: AY/fxX61glFPD3neQwiYOyI2MsSC6qrUTrT3nVyfdpTmUhPGKrqmnHJLhnNBXuZwQdp
	k8IPkmFX/VjaOz2B4Ts2BJdrAQrDhklnPUUernf+D+DDfuiXBTlFtMEDTsactQv0sCQYD2wqwOp
	H9FdpFjxeYvAl3iHjYX3YNS0W99KGn9Ig2SIr66MrGOclH0hXPmR/AyuAmAL+OGGmnJ41CLm8CK
	6UcIIe+dLWE9UBwoHEwNnn2fA2arafDq3FjtdOMqcJ0dzoIPnvaGaiUSqYSjkColNXsDe/EhFW/
	mFv4e50f0DBHqPyR8onsHkf29Jgc+d6oP3pob+GcireFbYx8d/zhPNwpcKuSpU9NHXRaXNviYmX
	FeEEG0QBY4u9fCfxNBEVIsIwSREfnBXnd3S6Sc6dLEGcFZFusv7xrvUzLRH2PE/i5aREiOJ4FHD
	3m17U4OMq7eZfHvT85Zw==
X-Google-Smtp-Source: AGHT+IGfztYSVHsyk+7PmZRCC418j2Z5ytdNIW6OjrqL8wBX3jPmHA4GjtS2WiyRag6ngwwSNlaJTg==
X-Received: by 2002:a17:903:4b47:b0:2a0:acf6:3de9 with SMTP id d9443c01a7336-2a0acf64436mr1635775ad.58.1765622513024;
        Sat, 13 Dec 2025 02:41:53 -0800 (PST)
Received: from JRT-PC.. ([111.94.147.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea0169dfsm79620505ad.51.2025.12.13.02.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:41:52 -0800 (PST)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [PATCH] lib: sbi: sbi_pmu: Fix multiple start and stop operations of FW counters
Date: Sat, 13 Dec 2025 18:41:46 +0800
Message-ID: <20251213104146.422972-1-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_024155_116038_359C0AE7 
X-CRM114-Status: UNSURE (   8.43  )
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

Currently, OpenSBI returns SBI_ERR_ALREADY_STARTED when attempting to
start a HW counter that is already started and SBI_ERR_ALREADY_STOPPED
when attempting to stop a HW counter that is already stopped. However,
this is not yet implemented for FW counters.

Add the necessary checks to return the same error codes when attempting
the same actions on FW counters.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/sbi/sbi_pmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e24e485d..0218c921 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -468,6 +468,9 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
 						 cidx - num_hw_ctrs,
 						 event_data);
 	} else {
+		if (phs->fw_counters_started & BIT(cidx - num_hw_ctrs))
+			return SBI_EALREADY_STARTED;
+
 		if (ival_update)
 			phs->fw_counters_data[cidx - num_hw_ctrs] = ival;
 	}
@@ -629,6 +632,9 @@ static int pmu_ctr_stop_fw(struct sbi_pmu_hart_state *phs,
 			return ret;
 	}
 
+	if (!(phs->fw_counters_started & BIT(cidx - num_hw_ctrs)))
+			return SBI_EALREADY_STOPPED;
+
 	phs->fw_counters_started &= ~BIT(cidx - num_hw_ctrs);
 
 	return 0;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
