Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54783CD5BAB
	for <opensbi@archiver.kernel.org>; Sun, 24 May 2026 05:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OqMx+JnEYjxYbFy0TgToomVjaE7UyrWUkluMit9b0Gk=; b=gCVEXyN73EQSYJ
	SkZKbV1+pYuFnjXIY/nqSDh2GyGUW0fBoOKpEVuWgS1KL9JCg8ENctP3x8P3tnzeDQf5UjAhUNuWC
	IIltzgBOahRORYL/6m0Zvj1rIEyss//hE+9b4DfP5JVJxy9YyJS6yhIHSwqQCPQK/F9D76U+GXAkY
	Sjp+s48TT0poxn9JcRSHQg+z9yGbu40IJUfacNKmle8kqR5AFo58taGSWdQOw4CS+t9GAsBOzbFDx
	Gh54I6+DsEwc5PYbVyLKHNW8VGMv189wwdZ2yWWOc5+sYqAW4zdc7/2nlo449ZUWnHfZ1u/ZV2KXH
	NdOSoKyHOunvnlN2xOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1mP-0000000EWbg-18gq;
	Sun, 24 May 2026 05:53:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1mL-0000000EWar-25O7
	for opensbi@lists.infradead.org;
	Sun, 24 May 2026 05:53:40 +0000
Received: from [192.168.0.109] (unknown [123.118.218.47])
	by APP-05 (Coremail) with SMTP id zQCowACXKQ1ckhJqAvlMEQ--.18395S2;
	Sun, 24 May 2026 13:53:32 +0800 (CST)
Message-ID: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
Date: Sun, 24 May 2026 13:53:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
To: opensbi@lists.infradead.org
Cc: Michael Ellerman <mpe@kernel.org>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Bo Gan <ganboing@gmail.com>
Subject: [PATCH] include: sbi_platform: Increase default stack size
X-CM-TRANSID: zQCowACXKQ1ckhJqAvlMEQ--.18395S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4rZrWrWr1ftF48Jw1kKrg_yoW8GrW8pF
	srGF1xGayxKF1Iga4xC3W2vF48Wws0gry7Ga15Xr4UZa98Zr15Xrn0grW5J3W7ArnrG3y0
	vFn2vr17ZF1UuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
	JbIYCTnIWIevJa73UjIFyTuYvjxUgg_TUUUUU
X-Originating-IP: [123.118.218.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_225337_919846_A45822C5 
X-CRM114-Status: UNSURE (   9.16  )
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

sbi_misaligned_v_ld_emulator() has a local buffer (namely mask) which is
8192 bytes in size, so the default stack size is not enough. Double it
to 16384.

This stack overflow can be observed by any S-mode software and leads to
M-mode crash or unexpected behavior, as long as the S-mode software does
not enable FWFT misaligned delegation [1]. This may be considered a
temporary fix until further fixes are made to misaligned handling [2].

Link: https://lore.kernel.org/linux-riscv/nrvt74qnojaubiwjo37ums4lnclu466hovwrhmtbag6f5uhrql@q6msoe2oto4b # [1]
Link: https://lore.kernel.org/opensbi/20260210094044.72591-1-ganboing@gmail.com # [2]
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 include/sbi/sbi_platform.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index fe382b56..ec1e0f73 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -160,7 +160,7 @@ struct sbi_platform_operations {
 };
 
 /** Platform default per-HART stack size for exception/interrupt handling */
-#define SBI_PLATFORM_DEFAULT_HART_STACK_SIZE	8192
+#define SBI_PLATFORM_DEFAULT_HART_STACK_SIZE	16384
 
 /** Platform default heap size */
 #define SBI_PLATFORM_DEFAULT_HEAP_SIZE(__num_hart)	\
-- 
2.54.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
