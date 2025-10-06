Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D7FCCA471
	for <opensbi@archiver.kernel.org>; Mon,  6 Oct 2025 08:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpevSgkZojVJNnDvIum9jHmFS3sY9RHt+ZLFP7gz58o=; b=x5giA8CT/Asqqt
	x31coGIrn7NrpfS+n1gdWWD9W6BEhmVi0EckS8g/e6bP94Qy0lBx1TbhAu9y55Hz1FnsCJ48nw4A4
	+xxPSAOb/8LO0QPcjPKr3cgjvm8cO0uQ37WEXT9dhWWDafL7FFE6zv6GuXtnOchonwuAWk+VTY7ml
	yk9dAIOjy352aKYJopSAo+sr0sHqB2xUEG5213utXVuj23aRywj+oX5Yuk+nNYWuhxlQr5yTAoYnZ
	SCqjNNtKRBarqupuxgsRDU0QilrvCqXCT6/JfdwmxICvrGZASxqQjfaA1Buez+vgEtjQ+FHqqThq0
	w2zI5A/UeXOOydjHlYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5gCO-0000000H9i4-0ulK;
	Mon, 06 Oct 2025 08:04:00 +0000
Received: from m16.mail.126.com ([220.197.31.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5gCK-0000000H9hf-1Qei
	for opensbi@lists.infradead.org;
	Mon, 06 Oct 2025 08:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Subject:From:To:Date:Content-Type:
	MIME-Version; bh=VOmI5qCOMZm6skfnBIhMvuTFMTXVQNMwpEI3K4uO7Oo=;
	b=UVYWcNsPu/OVArrOeuk8n9Yuq1Ym6tzihD0WRuIz9CQg8UGeWMo0105ZOhSDCh
	fNExZQCuZ9PaembIkJztYLOoLf3BQ1eEpG3qjfifCrbawzIsXvReNQ3g8eTvCRkF
	XB1SZN6Lrk6YoYOJTudX/3i8Fsla2UJye3lUP2XQYPsUw=
Received: from [127.0.0.1] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDn79_bd+NoXw2cAQ--.60459S2;
	Mon, 06 Oct 2025 16:03:40 +0800 (CST)
Message-ID: <330f2eb8d65ea7abfb4442ecdffef308855aed73.camel@126.com>
Subject: firmware: Initialize stack guard via Zkr
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, Xiang W <wxjstz@126.com>
Date: Mon, 06 Oct 2025 16:03:39 +0800
In-Reply-To: <20250930022728.887069-1-wxjstz@126.com>
References: <20250930022728.887069-1-wxjstz@126.com>
Autocrypt: addr=wxjstz@126.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CM-TRANSID: PikvCgDn79_bd+NoXw2cAQ--.60459S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry8Jw45XrWkuFWUXry5Jwb_yoWDtwcEya
	1fCas7ur1YvFWUXFyfuFyxCrZ5Gw48Xw1v9Fn8Cw12q3WSg3y8WryDCr1Dtr17Wr17Kr1Y
	y3WDZrsag3sa9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRAcTm5UUUUU==
X-Originating-IP: [153.35.241.51]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1xveOmjjcs08YwAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_010356_872612_C9339064 
X-CRM114-Status: UNSURE (   4.27  )
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

Try to initialize stack protection guard via the zkr extension.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 firmware/fw_base.S | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 5300ecf2..953fba95 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -107,6 +107,30 @@ _bss_zero:
 	add	s4, s4, __SIZEOF_POINTER__
 	blt	s4, s5, _bss_zero
 
+	/* Trying to initialize the stack guard via the Zkr extension */
+	lla	t0, __stack_chk_guard_done
+	csrw	CSR_MTVEC, t0
+	li	t0, 0
+	li	t3, 2
+	li	t4, 0xffff
+	li	t5, __SIZEOF_POINTER__
+__stack_chk_guard_loop:
+	csrrw	t1, CSR_SEED, x0
+	srli	t2, t1, 30
+	andi	t2, t2, 3
+	bgt	t2, t3, __stack_chk_guard_done
+	blt	t2, t3, __stack_chk_guard_loop
+	and	t1, t1, t4
+	slli	t0, t0, 16
+	or	t0, t0, t1
+	addi	t5, t5, -2
+	bgtz	t5, __stack_chk_guard_loop
+	lla	t1, __stack_chk_guard
+	REG_S	t0, 0(t1)
+	j	__stack_chk_guard_done
+	.align 3
+__stack_chk_guard_done:
+
 	/* Setup temporary trap handler */
 	lla	s4, _start_hang
 	csrw	CSR_MTVEC, s4
-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
