Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254AE606A321
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 03:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qiMN6ohE;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=LKdIWW8R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BgpLruIrq60ucRhLITwYPNVMVGp+ysnHPiD3VkjSHT8=; b=qiMN6ohEzbfqP+8+s3p/rdGktG
	1Ndpk6He6d9F0KeRb95Ci7B0qfr1OIoQqzB8zbaLJyx7J0HRmK7wFVJKMOGMowMl5VgJ143U2JO6c
	ntXtGciMyRCTKn5wQQrng93VGbH+KqcZmBc5TlgFHrWahOgUwZpHz/m9fneGfyjIdc9TKzw0Wzgdh
	AgOOuauDaZ2CDJxvEcYt6VMQ9IAovfCQDrMA+Rhp+JmUX7cfIW239G4hhkijm+AdkZ2EntXoaa6bF
	7LOXsWwVQRgHrZvwrzLVnEtILrzY6GE4u7fUnGLPAK9glXSYu+CWikD79DUNyNEImFukEYWpeUKuP
	ut0goZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcwl-0000000Ahzw-1Yco;
	Fri, 30 Oct 2026 03:06:27 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcwf-0000000Ahxa-3hEh
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 03:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793329579; bh=MRAyhQz9dY8IXmKHA5jOyJJrfSOlRuoeOXMf33wFMQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LKdIWW8R4d2sQ3nDJMN0X3gz499xuqx7B4AB+XbPg3UK32QmbhKrQPWyEfhXrk5oN
	 gXZ6oc4WAt3jQzUPgANx18qtAoCRWG8GqRALAmQKuiOyb/xFVJcw0Sug1Teyujjfwr
	 pM1VG17ESjnNv3HbK1uvGrOra4e4Gqepmb7bbd7o=
Received: from zs-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([202.120.37.188])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 18F8DE4F; Fri, 30 Oct 2026 11:06:15 +0800
X-QQ-mid: xmsmtpt1793329577t5ns564ad
Message-ID: <tencent_0AEA017ACBF88617D801E8E95B3D04AC000A@qq.com>
X-QQ-XMAILINFO: NOGjjKUrN7vhk1cu9WcJAS+ODxK1crH60erCx1w5Vv9RpWXBeP2Shqjn6qQkOS
	 UrfApwg/x+CqgNV2x1kZl3HiSS8w+I3kvJ0E1MNvM/AZ5SLBqpPoUOvRmTv+edTZliUTBZt/+KQa
	 bklJyqBHrwkRIpniTrtHHIp1lVv6KiPwKlhzz0O304sbz6Ke6R6dD2026LBg+gNf05nxiiBGk8mt
	 e08JNDxdDGYxiqZF0SdpFtC84WiTNn4nLbaBpLfH2x+Eip2DEy4w6wS64YgMkJo1WoUSPnqnvG0f
	 1xeubP2lLWywHBLrHQohrF0PWzyF8Znym2xfNI9IjlB7vIk7S/iFaEoG5gIxOCAF7JEn4xPmemFo
	 vdMdLnU+Ae3kTbqFHauN+0f5wrOWWTn8CTxC+XtX4+hQnZs9PWu2mVz0/7YxQTFmnnbSxZxDAypW
	 quX6d6GZg4cY4ieSuliKF5vn7Qr8Im5MVzttQdnPbuwGYfZjmeOc1h4PmXcUFcv2FiYB0bXQ3CUl
	 SUZOMSeZnZOscOwWTkibWo+qUISETzeQuxPkGK2RCLzi0vWG1tpwgpIRiH5q2kOOW+YwF28qh7cZ
	 md7poPkRTGz+hN+nNb7V5Lh15DRBCfDtvU6ACZ9hV3KBEdnctT6ZnPb9m1/m79W1hUX4MzdkLMmM
	 GimYbP+Jvjmixi6vSurqYBGr45/3EGjxl0VZeRbFMahEN16vb49tYetayAxZN8eo9jW5zH0VOEnP
	 pkrjDg76F3ZjoAFXm2yYngPU8SC98lUdD65WXVj1scPVlljyzTHPn/iD/2og3V2fQJUinKeI/d/d
	 yFT87diSuqli6fgMn1z2THdRH0ttAVM5oKZAfZU3ziFAI52BKE8ITtiNXs4lGgD4/F6gPWaoVhnl
	 nL20Vsj4we2MVPeIX1tE9YNN/4PzTYHZDbFOtZfUpvyfHI9EQFaK/UTf7oXd7VWobFiyRAUWMINh
	 t4J4Q3Rdxk+LD+e2YF3ZWF7umdFwfDMNQ2krLPPEn24zdX34XqfvuVorCGE+YO61O0y7TlQBo5O8
	 V7toZdDtua8I6OH1epWxI0+J7fpmpsBNqIRFs+V7BtkiGDw3CRTKwGkFf+PnQ=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Shibo Zhu <3499129952@qq.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	atish.patra@linux.dev,
	Shibo Zhu <3499129952@qq.com>
Subject: [PATCH v2 1/2] lib: sbi_ecall_hsm: Reject oversized hart IDs
Date: Fri, 30 Oct 2026 11:05:02 +0800
X-OQ-MSGID: <20261030030503.334740-2-3499129952@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030030503.334740-1-3499129952@qq.com>
References: <20261030030503.334740-1-3499129952@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_200622_278148_3F985769 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The HSM SBI interface passes hart IDs in XLEN-wide registers, while
OpenSBI's internal HSM APIs use u32 hart IDs. On RV64, values with upper
32 bits set are truncated before validation and can alias a valid hart.

Reject oversized target hart IDs at the ecall boundary for HART_START and
HART_GET_STATUS. RV32 behavior is unchanged.

Fixes: e3f69fc1e934 ("lib: Implement Hart State Management (HSM) SBI extension")
Signed-off-by: Shibo Zhu <3499129952@qq.com>
---
 lib/sbi/sbi_ecall_hsm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/sbi/sbi_ecall_hsm.c b/lib/sbi/sbi_ecall_hsm.c
index a6e83b05..404555ef 100644
--- a/lib/sbi/sbi_ecall_hsm.c
+++ b/lib/sbi/sbi_ecall_hsm.c
@@ -25,6 +25,11 @@ static int sbi_ecall_hsm_handler(unsigned long extid, unsigned long funcid,
 	ulong smode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >>
 			MSTATUS_MPP_SHIFT;
 
+	if ((funcid == SBI_EXT_HSM_HART_START ||
+	     funcid == SBI_EXT_HSM_HART_GET_STATUS) &&
+	    (((u32)-1U) < ((u64)regs->a0)))
+		return SBI_EINVAL;
+
 	switch (funcid) {
 	case SBI_EXT_HSM_HART_START:
 		ret = sbi_hsm_hart_start(scratch, sbi_domain_thishart_ptr(),
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
