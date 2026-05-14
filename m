Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E90CD4F39
	for <opensbi@archiver.kernel.org>; Thu, 14 May 2026 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnEusob/ojkKw4QCd7DYggsRndnafh7Bq72DWWpjvuY=; b=XNjEuzf8vsxTCp
	UNMQbVMPBOlpVVIipUv+Ln4LunP981bro/E7GKLO2sKPXhj87gUGWLfSg1mEkzWQkpx+TWDSrnj4e
	ImspAYC/VXziodrz2BbWAsTL4OSbhfS2VvNEaoA2AEDnnAtom3K1N3EAT2yPl4Yv8yOvLSTIf+f8O
	uvScMo5Te0XpleR42sdkTNsYSQZ8x/IwJvAgTxOcdrwvxD4Y0HUMCfGxjESCq4C91tW/xXXVyFYal
	iW8maVXFW1Xv1/7L340L7bAw55lYdni7yd4CisRrNReWr8UvoXkO+Wxlmgs3SNGavkZ7Ipwm0Qzuw
	eci6SSLEhP7rrHGi/vKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0c-00000006m2c-1Ohy;
	Thu, 14 May 2026 22:58:26 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNf0Z-00000006lzR-2NG6
	for opensbi@lists.infradead.org;
	Thu, 14 May 2026 22:58:24 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50d87c138e1so81109281cf.1
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 15:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778799502; x=1779404302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EANHErgPNM6ePrS0vf/gVn/U+BkUBr4jYiKZ2myqfBg=;
        b=ajeOHmx4a1+sUM1L3UjIM0osb2UxlVn9FzHShb/vJKMrtJ+RzIZ1UvsY7OHRzcDGSq
         emk3wzSsh0kcBCCCF0n7tXzwF2lRwjnqbowx2hey+E7JiuGYeNMnHUiQm5BJ3uNJMlPd
         3ReKS/n0DwAhL3+yJPYqeE19VqcDIL7lldPzra6SkhILXmJmGGI+LLaeA8BX5z1lixyw
         KNxk+lbejZc1BDIikE/edu/FuAoGrVXwtPkdXb1KTHiuv0qkZgZW/mTl7f91yxbkcAve
         /Rpym1pynUJoWJ0D9wzhIC/w47yIFhE+Heritw28NxFNa16UiHUYEhvdbDUeDrKkj+IO
         FC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778799502; x=1779404302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EANHErgPNM6ePrS0vf/gVn/U+BkUBr4jYiKZ2myqfBg=;
        b=D1MRCVN3R1XCQ3UvIAlLmB//auSDJlmuEaM7GzYG9jo9Kb2vCs8UmsclvgUIAd86Hp
         mvWniz/yxo8l5s49biyZYFQlLexESQmhwKK5A4YMc3n7N1odNryMERZ8n7l06VrmAlST
         oqPMMPD1nTWnbRgrC9zHUCpy84nwL0cn5cL6sqoM80D1NSLi29C2Fg5R7TrH5Imwud7p
         vc3UKRTCk3gorl4tLhI87Esg2YxYzhXhkfLDQdlhxb5x2CzTdZrl29YNcFFaG/blyZEi
         d87bGa8slbi96UD/aCnXv1ol0jJgZl9msitbNTofgVO03R7SDVG5C29qh99OIfrEWU0n
         rG6Q==
X-Gm-Message-State: AOJu0Yyd2eEwvO36NtTzk6RyMeAmNbN3USgkyZlfnQl8jxzFAwd+yqKQ
	8SP2gS5I2XIO/nmcGuoOGsLDoJAVHAY1UWIrw3xf+KufAv8ilMPd1LKOK72oMw==
X-Gm-Gg: Acq92OHJYAfAK2qTjK+5cNq8T52brkxGr1kYHkF2ia5ICKMNYNIWrBd2ZSB1CuUZA9N
	Vz9NTZyMhnPzWLAN/pllww2qo/cTDE7fpvxdAz/b4Mbbw+L3L4B/73aG5z7GErZeLdFS5Lz1gBX
	ebzFzCVqLwGjE9uBDM50IMZ84nb80CsSIrAre/XkGOZZrQQl1SYOQ2B6yyRyTro2uygcncf9OVi
	k/psk8bNPqp4l5ysKHszgMcyvx2AlHwTxBNeAsR9v0lgedk4r1NHlgS9iGBXqhRBGQOQ01H6azC
	4cpLoHa4SPwTaKIEvrB4N5RyO11sebj2RgFzKOkB8+fx1Dhe30C9NhZHqqwUO+0gbztFA5T+Ksr
	/7gcCNwmqkHG/fnxhaCFgFakoMKQqwNiZK4H0DKlAY7Vwt1w9XicbQ2Au0T6jZKiYx/Ej3Vv2Qj
	BmpxIXU/Vb7WSreDE7iK4T0lRKxxFR4fzpLv/+0XdLAJVAQhQTtVW0zzPK2KXjZvZBQVtIXU9qF
	D4g2Uj1gbs=
X-Received: by 2002:a05:622a:354:b0:50e:a1ab:67eb with SMTP id d75a77b69052e-5165a0cca0fmr22237091cf.33.1778799502099;
        Thu, 14 May 2026 15:58:22 -0700 (PDT)
Received: from ubuntu.localdomain (172-97-209-197.cpe.distributel.net. [172.97.209.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c16366csm34974426d6.40.2026.05.14.15.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:58:21 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: scott@riscstar.com,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com,
	anuppate@qti.qualcomm.com,
	anup@brainfault.org,
	dhaval@rivosinc.com,
	peter.lin@sifive.com
Subject: [PATCH 05/10] lib: sbi: domain: add domain lookup by name
Date: Thu, 14 May 2026 18:57:51 -0400
Message-Id: <20260514225756.2255758-6-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514225756.2255758-1-raymondmaoca@gmail.com>
References: <20260514225756.2255758-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155823_665499_1E91960E 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Provide a helper to resolve a domain by its DT node name, used by
sysirq DT parsing.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_domain.h |  3 +++
 lib/sbi/sbi_domain.c     | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 7e288cd8..b7267da8 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -232,6 +232,9 @@ struct sbi_domain *sbi_hartindex_to_domain(u32 hartindex);
 /** Update HART local pointer to point to specified domain */
 void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom);
 
+/** Find domain by DT node name (domain name) */
+struct sbi_domain *sbi_domain_find_by_name(const char *name);
+
 /** Get pointer to sbi_domain for current HART */
 #define sbi_domain_thishart_ptr() \
 	sbi_hartindex_to_domain(current_hartindex())
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 2a846eea..c33f2b3c 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -60,6 +60,21 @@ void sbi_update_hartindex_to_domain(u32 hartindex, struct sbi_domain *dom)
 	sbi_scratch_write_type(scratch, void *, domain_hart_ptr_offset, dom);
 }
 
+struct sbi_domain *sbi_domain_find_by_name(const char *name)
+{
+	struct sbi_domain *dom;
+
+	if (!name)
+		return NULL;
+
+	sbi_domain_for_each(dom) {
+		if (!sbi_strncmp(dom->name, name, sizeof(dom->name)))
+			return dom;
+	}
+
+	return NULL;
+}
+
 bool sbi_domain_is_assigned_hart(const struct sbi_domain *dom, u32 hartindex)
 {
 	bool ret;
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
