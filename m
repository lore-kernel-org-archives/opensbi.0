Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3654C83F0F
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ebz9SWlijl7pS7ZwjyCLJmP7mjLd6jsDINK6josvrRY=; b=BtkBHPZ2axxVCj1wiVJuRuSXSm
	ME+Coi8MYLGAYbGuQ17EEIXseAkB0LCKlan2OCp1kcR77HF1JQZLtUhWDXYZxp5NVic2IHuT+itCJ
	4wV16PIT2HF8OtRN16oIotjH0IGUCxQ8mO87/p4g+YW9FsnGZKO/Q0trBjtzHk29QdxV/SufmFZ1h
	n73kPxS6NbDnq2ziJzH+Rlm/190BrImREcxmC3d8r6vjVte8Yj8bUI/K03mOJXOc3qn2X4cC937if
	xT1UxEm74E5X/mFKlANqka5Nq7okxaBQn3nK3mH8UD0lL0xOwnf3HCPN1aYpSyMyeclRzj1HPGSPS
	dMz/2Ukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Ea-00000004fRb-395n;
	Tue, 08 Jul 2025 07:59:24 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ35h-00000004dPX-1cBw
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 07:50:14 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6fada2dd785so62622366d6.2
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 00:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751961012; x=1752565812; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/q/SggIZrVmmm8A91IDs+DygwgJiblBxUZCHXjzVMMA=;
        b=EZGtZOJ8rNfDtWaH7CRxgQqiOvnQ7uwdxzSE4Qcj5yEaQQWHlWELOJJaLQnMzcp4pA
         GDbJcs2ZZheM20wwuM0YmJt/G/1IOvi4C5k4CUr8Ul70o0pwZc9XZ4Kv1cVgKwuYMgJb
         bO3Fy+jG/T1uAXrsanGKwu5FGOkMlbOYuZLlAbZv444wpWl/qCpGnw8tPGEl4uy4QanG
         nhOcBg1J86li6pehr1d9+SjmRAdaVe6tVbCKqowerOKbFd+4UbmAdaP9+d9ylMTiQs1V
         MDUBJhRE4m4hsK8YTFp2Sx+imJVTbDLjRy9QgKwMrAYiXTRX2HKmaLyrks0QjUCXkySk
         lH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751961012; x=1752565812;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/q/SggIZrVmmm8A91IDs+DygwgJiblBxUZCHXjzVMMA=;
        b=PdQUpO5FP8t+FZz2LhyXarAQzps7IHZ6+k3f0Vv8662qih4B4Ol1gcFprSatspBszE
         sDsLWAhF4i/LJfLgG/oI9rIhHbcRo8g9kex0oBKVc/8qUambpoLgtFp9unlvS/v+a6yU
         T8vZyPLdhMPEkALjLj0IzzoHChcYaHmBYR/WdAoQnJmIrFLCm5XJ+RXr6okXcqbohwGV
         MUslta29/BdICJOB6zOs3yXJ716kUjEzuQBX+24jRjb1joDhoszBa7PEwcal4EgU/d57
         vGulcDcztM087SrSTzl3FpCDcJUM6+nN0yCva2lftKXLgoMZ3wCJo4NY3MGVTIAyXgNq
         gYVA==
X-Gm-Message-State: AOJu0YwML5kXf4iyyo5VvvIzQpqHZMDAjefJ5KaGvRIYGWXJQg8kM3rE
	Rs0CAmkBg0is1SdQVPd/HtKiWKtav5KAI/TKdW++knqryYFGcodjXO/wLTp1jct1SkV7kVFDYOk
	QlT6kvhLVYLBQr7LlZj+bc/y8hhHQ/ZlCCqKNvlS32tQgSZawOWe4IXOAzjC2L9cGL8aGhU7xg4
	2cagMdyaGp2b3fNhrRHo/FKAg8ZIhlh/6VJ/IyslAiT8wC+g==
X-Gm-Gg: ASbGncuSDKv78TteQIgFGvBZwtzGZ8M08np3aiIC8bL0IQ+cZs3b1jluXFfoNlUmbQh
	upS8sVcy+qQGJWHVqwllxhkgdlGb7gU8yeAXvjxlaOiPGoi0AtnZhp3CJodiMqwj64MxF/HxYUb
	pFSRdoTZuAtL2MsWCoKTdl9q8fko/BC/i5MuzkhgnQjKBfJ5EAlcxw/Xunqu5km3TOwReHrKjSF
	iSPnkdJdndExCs+toD+gs5pcNGghuTXyYYiEVifiS8meSTRNmth5fj2tkwwA8xjupJLl8bfwGwz
	LLV6OMh5yUcuCNnnphG7EY7BbdPXw6DzZYRVVTJBOXqe72sNpKVJs1GD44Uwvz8bRv1aRwD6BKL
	TUctXD8Sc5kB3WrLa028=
X-Google-Smtp-Source: AGHT+IEop/Eq6T9PB2b8V+0Qq9nm7LZ8PzJe0xaGiZeNPi9QLZFZuZpIBzw7TfgIKyJxC+LUvgTgNA==
X-Received: by 2002:a05:620a:29ca:b0:7d2:1684:2429 with SMTP id af79cd13be357-7d5dccf4a7emr1817983185a.31.1751961011889;
        Tue, 08 Jul 2025 00:50:11 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a94dsm72382876d6.82.2025.07.08.00.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 00:50:11 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH v3 08/12] lib: utils/ipi: Exposing the ACLINT IPI device
Date: Tue,  8 Jul 2025 15:49:36 +0800
Message-Id: <20250708074940.10904-9-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250708074940.10904-1-nick.hu@sifive.com>
References: <20250708074940.10904-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_005013_421197_C6ED79F9 
X-CRM114-Status: UNSURE (   9.59  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org, Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Exposing the ACLINT IPI device so the other driver can send the CLINT
IPI on the platform with IMSIC.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
---
 include/sbi_utils/ipi/aclint_mswi.h | 1 +
 lib/utils/ipi/aclint_mswi.c         | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/sbi_utils/ipi/aclint_mswi.h b/include/sbi_utils/ipi/aclint_mswi.h
index 4b8249f2..311228eb 100644
--- a/include/sbi_utils/ipi/aclint_mswi.h
+++ b/include/sbi_utils/ipi/aclint_mswi.h
@@ -26,6 +26,7 @@ struct aclint_mswi_data {
 	u32 hart_count;
 };
 
+struct sbi_ipi_device *aclint_mswi_get(void);
 int aclint_mswi_cold_init(struct aclint_mswi_data *mswi);
 
 #endif
diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
index 9e55078a..a4173b7c 100644
--- a/lib/utils/ipi/aclint_mswi.c
+++ b/lib/utils/ipi/aclint_mswi.c
@@ -66,6 +66,11 @@ static struct sbi_ipi_device aclint_mswi = {
 	.ipi_clear = mswi_ipi_clear
 };
 
+struct sbi_ipi_device *aclint_mswi_get(void)
+{
+	return &aclint_mswi;
+}
+
 int aclint_mswi_cold_init(struct aclint_mswi_data *mswi)
 {
 	u32 i;
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
