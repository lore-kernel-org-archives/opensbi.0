Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3598ECDE013
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zl+VdKYKNbXQYkMurtgFiroB44jkxbPse9PfwbHjpYQ=; b=fbPOZ+dId6GNdQ
	lbe6weQq9Aune1Yy4u9EDCe7HRTBUidNt88F4foVSRx/wsUuha+3TbhrimNT3zFHG4ugd81gr4pyS
	14xuBZuXV48VZiRoHyR+k7lmM5d+KW+n01h3+W/RiF2CTXPcOe20W5354I1pjK3bX5PR1vt/73tLP
	9S+Yhy8PkGRTvyFvE+s1y64JkOI1QgSBoF0XVM+xiuooMhX+X+11k7pabeIBamQzmI0XkaknyF2Ya
	uv3+mp7AvfKBGWM7+3Ddq8caynhCkCmzrEYiqKAxFOlHiXF1IzL3o6OQdhMdbA4T9tDQjvxUS5jq/
	B47BQGavqXFTz+dVSLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cX-0000000B4jV-1iP9;
	Fri, 26 Jun 2026 10:17:13 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cR-0000000B4cH-22Uz
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:17:12 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c858014845aso245110a12.1
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782469026; x=1783073826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VSaC60MEnG+NzTzx6XTv9XHF+2KhqlJ57UhCbUWyi0=;
        b=S8AcWc5SPyHGXYcYYe2r1eY0HuVzXnKMXwPt9KWoP8BY2q1gRPBNnH/mj5WubhBssc
         ofOlqtDJjboTMxpkZZO6QsJAJFOz5fDikcC7Y91pGKjlw68cbI3o2iVW7jnLpQx5w8iE
         hlDz6US9EO+RupsV6HQzIOQC1nV38aIwyDgFmrw7lHAF1pV5HPzp3VHyL8PlxSszBgkD
         yzFYjIRWRN/YjMHS33fZSaV47Q1392RXOXLVVIEp9okKG7o+RwcEmLOnU1aKvCs48lA4
         49VZ600N79YLPMc/Sk6z7xZpq/u+m4xz9b5s/KgcKlVIIYeVLyPEMEwA1Q5Z+Jdbw29e
         DOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469026; x=1783073826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VSaC60MEnG+NzTzx6XTv9XHF+2KhqlJ57UhCbUWyi0=;
        b=KOUltaHAVs5WBaWY0OMXXako843YQfwgrNu6jcxBzpj1ScPhNTzf5CgtfZ5lKwH1ev
         OhA+GFNIvh6HcZqsYrX1BbMk8xLlT8VppCUwwn8q7LjYsS45D7RBbbaRV1gwpcAn/2a/
         FbeEvX2joTqbgvuuhl/WMqZJuBSv/TDDHhn9O8FADba7EHbf59gj9oFuw8/PxXlzfdOs
         Gr7ejtiaf0wZa9ckBHjW7/Kxq8nval8IeC1kOPR5EpFBhKy2qM0w9AVw6C5LEEGgtV2J
         Q1DkiKvDyPlH0Vj1Ri7CxfbH+oIMlzqMxkFnwNvxv03t7Acfca2zUmAJIzgCbgAvghJl
         RHwA==
X-Gm-Message-State: AOJu0YxEUVuq4pILBMaW1RJCE9PIHI/WeFJlwOK5p6vtMU5/h6vqgfy/
	4Wn/CsCDsc1uOURoeV+b5pWSM8upQ2TlOclQudFedWl5FvT+W+z0twPP3EUmVZhizENwrrcBB/h
	95A9rsUA1tAjr+c2v2UPBkw2q5MS+sPWaSpVDjYJTTAyg1pg5vGgvccE43KFyxbFJhPQ+owb1en
	QH0WVbU1tj7Qk9exAy0/rfvFfW+jP9EMR4CZCLdsA7Tg16oeRQ88c=
X-Gm-Gg: AfdE7cnEOUljxjIfHGz7lWO5SI3Osxhbw2h3PDv4kpVxOitPKwAn9g7bdDCRO0JdM40
	e8x3QQDO18bbNwagZ246CWpxHDpcd3nAaDUqaqjDaXJo9I7GUubDWtuSOy7T/JZia2UN65HxR+1
	1JG38vZwxrwiCvN7vp33lfXtkJo10U7FX/x33dDygdt0kwhEVHEFJoyb6kUGvh1Y3buHLhSdpOE
	Uwr9cpYod5Bnz+1c8DU2O+6ni0hDJn0gD7P33y8aif1VYTYGZ5TwS3pDLth0POlTE78RX80MNjS
	COwnHX/IadeBo7KAQr1SZZfb64h1IlCzReIq7MEfnCn+g8JuyDMWJS3HB67d91T6cHQsemjnEsy
	2KJkiaZYX6JtVln+DmYZnwa3IY9Uu4m1SSXrSqLNmVQMfJh5/tGBCQOu98OK9X6klCF/UWGGbIr
	dWu3qrWce4EntSu+b+TqsZsXLTe8+FEkb/aMKQ
X-Received: by 2002:a05:6a00:1ca3:b0:842:994:939e with SMTP id d2e1a72fcca58-84591d20e8emr14726019b3a.35.1782469026075;
        Fri, 26 Jun 2026 03:17:06 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:17:05 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 10/12] lib: utils: fdt_domain: parse per-domain WID properties
Date: Fri, 26 Jun 2026 18:14:31 +0800
Message-ID: <20260626101433.3133466-11-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031707_557307_1C55FF4E 
X-CRM114-Status: UNSURE (   7.55  )
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

Extends __fdt_parse_domain() to parse next-wid (32-bit WID) and
next-widlist (64-bit delegation mask) from domain DT nodes. Enables
per-domain World ID configuration. Stores in sbi_domain structure
for mlwid/mwiddeleg CSR programming during domain context switches.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/utils/fdt/fdt_domain.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
index 61627db3..0849c4d0 100644
--- a/lib/utils/fdt/fdt_domain.c
+++ b/lib/utils/fdt/fdt_domain.c
@@ -469,6 +469,21 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
 	}
 	dom->next_mode = val32;
 
+	/* Read "next-wid" DT property */
+	val = fdt_getprop(fdt, domain_offset, "next-wid", &len);
+	if (val && len == sizeof(fdt32_t)) {
+		dom->next_wid = fdt32_to_cpu(val[0]);
+		dom->has_next_wid = true;
+	}
+
+	/* Read "next-widlist" DT property */
+	val = fdt_getprop(fdt, domain_offset, "next-widlist", &len);
+	if (val && (len == (2 * sizeof(fdt32_t)))) {
+		val64 = fdt32_to_cpu(val[0]);
+		val64 = (val64 << 32) | fdt32_to_cpu(val[1]);
+		dom->next_widlist = val64;
+	}
+
 	/* Read "system-reset-allowed" DT property */
 	if (fdt_get_property(fdt, domain_offset,
 			     "system-reset-allowed", NULL))
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
