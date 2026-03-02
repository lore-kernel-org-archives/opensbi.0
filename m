Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C987BD58E7D
	for <opensbi@archiver.kernel.org>; Mon,  2 Mar 2026 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPsKGrI+dzigYcJMiloAmPomTt8iOG2I9m6t4MwevYQ=; b=T7qiIk8wyejj1i
	5D+JRtDcdHMaBHZFYMoYd5eTTQyTUuyoL5rem7yrJOurxyqi0DCNoFhMF9RKQdbfU2FKE2nXQl57g
	VdzqL1JJa8OpHc8HTvrRl1kQq59gUVLiLyyKEXGe6KmsvnYqQGNKEPMCCU6DVo6Ne0pQW1LGgGEtS
	S0IofpFaIUTs5ch8KcURx0pl7PDm9TAYWRVtSaYzxnpqIo1rPJsiriaIbGmZlKPhz36jQVf50UKr2
	62U3aanUMry6i8/8SX+AU8GZ+PHdNE6KzO0BgIFqxA+g6vRUXMKVk2q7kx3bfsz6pjaIQte65hym9
	v+47R5RrTEX/eByDFCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyrM-0000000CXBe-0NSw;
	Mon, 02 Mar 2026 08:42:36 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyrJ-0000000CX9x-3JH5
	for opensbi@lists.infradead.org;
	Mon, 02 Mar 2026 08:42:34 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8cb4097794dso411281885a.3
        for <opensbi@lists.infradead.org>; Mon, 02 Mar 2026 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772440952; x=1773045752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4aItUS4veGbie46W42tIMQg+z6aR+PPe6UQTvPu04s=;
        b=HqyZ/3kD82pC8S1acq9hJPEbwC1PaGclS+F1l72zG1GLPc1CENLs35wHKBiKu5YRak
         FxhYW4mdfkuCb05IyigwlepsNN1ddL4A04be9CN6iTZdVEu/G6co6XPn6i6rBdketkGK
         xxZc+3o782CIhZiSdBq4VZ209MM/HhLLHQb9+ps407g46gHsyAvQweK2qDut9/bk44oE
         2nWCBLsCIvUbr0ENKQLnwTCO2diNFBGwVNitZPglibRUP9IYXhx+Mpe7et0Q8QhOA68Q
         e8pcV5RlubOTe6XhB5m/PzpMtLyR0h6SmuaOKKtZYs9h62STxdf10heJoEkdRer2ku5i
         NQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440952; x=1773045752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4aItUS4veGbie46W42tIMQg+z6aR+PPe6UQTvPu04s=;
        b=Mo4q1PqzBwPzct5E7vwwBzsuHTxJj1ILlW4vBTSyS92zy7v2p9P14aXAbyi5NaqdER
         z6q7IbsubJWEd1CG/F5U5RGY04ZVpnpnZrrNAyjcIXCy7L5nWhxTTu6tXJtkrBDtInV7
         KSsly2Rh5BFlP3bCbn8nhtMGtII1B5Xi2sBvU18BIlwm7f8QsmSzefLKXbW0647ddciN
         Bp1/4Kh6eblc1PogOpWeUduyP3XgEt0CXt1DVqx1ikw5TxXS1k1TGrVMgkSaLIE8EEMF
         3oUpWFm7DkWjC4Lokl/f3KOvm3KdZJ+al/hb/2JQZmqpEBhZgaE9uIpMLGOBl80PBKPP
         qQ8g==
X-Gm-Message-State: AOJu0YwvNWeEtNjp6M/W6a/8pCKC0j90bne+/FnFW2qWyomsNdS5H8X3
	gAQr4O/MiXx8y+cviBeA4jseQF/mCAhce4LllHznyt2Zkc1Nr0RSz6ealFvaJg==
X-Gm-Gg: ATEYQzztxHjD72afJGfcgLwYw2ygrAqG3cAL1enXAuN8GmiHFHJqU5SqDhhcZHBSw00
	qOo1hGG8xw9Ug5+0vYUHvj9SJ5VG9wzAZU+Diqfs4KXOja3Vb3aO9VoEFDqkEYYB3t7VJCnGZrs
	jrjBO9EFDAi9xMHydVSk2G59Gs55eDN3fTayumzQvxdLIxK5BfP5WDD8cSc/OtOPzGBXzHuaH3v
	oV1t+OcvTNMnFQosT4mpOZP0KlyOnrGfa0LoE7MKMK7S6k6g4KTE745qJMGlXaSFaDo2ybBO4Rx
	Cne5fGtObTtRvqpT++KfmXlg3F2WmZdeSTStmpZLbD3GG/3IQTr4SlHeyuF0RxnscSVcj2k2rQG
	fX1FWAWo4duJ+tM2cRPGx8ICSMRyWrRlN0aCCIAbzp7uex+CMB6BmVjOIKnZqrfmicMIZTk1kjb
	H9CxAxbPz1md1FTgPpDYDucEvW
X-Received: by 2002:a05:620a:29c9:b0:8cb:4cc2:c5d3 with SMTP id af79cd13be357-8cbc8e19a98mr1391141085a.73.1772440951982;
        Mon, 02 Mar 2026 00:42:31 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf746fc5sm1106370485a.51.2026.03.02.00.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:42:31 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: nick.hu@sifive.com,
	linmin@eswincomputing.com,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Subject: [PATCH 1/2] include: utils/hsm: Add __noreturn attribute for sifive_cease
Date: Mon,  2 Mar 2026 00:40:28 -0800
Message-Id: <20260302084029.428-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302084029.428-1-ganboing@gmail.com>
References: <20260302084029.428-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004233_867851_608039F7 
X-CRM114-Status: UNSURE (   8.72  )
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

Decorate the sifive_cease to allow more compiler optimizations

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
index 7e9180ea..8de853ed 100644
--- a/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
+++ b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
@@ -7,9 +7,10 @@
 #ifndef __FDT_HSM_SIFIVE_INST_H__
 #define __FDT_HSM_SIFIVE_INST_H__
 
-static inline void sifive_cease(void)
+static inline void __noreturn sifive_cease(void)
 {
 	__asm__ __volatile__(".word 0x30500073" ::: "memory");
+	__builtin_unreachable();
 }
 
 static inline void sifive_cflush(void)
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
