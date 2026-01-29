Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39427D358DC
	for <opensbi@archiver.kernel.org>; Thu, 29 Jan 2026 08:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z2HM1moBBdOxDlwzWljdqVNT+4sR5cWYg+WM7hH2Uys=; b=DpK/d8P7uERO8V
	U1/2YucwEhD0ogyNnFovWHjyBO3NRsw9kPI5yzOZh11YDkBwXZp5fMvHVkHKeYTuUYhDpBPg2be/a
	7HRG68nSTtPeOCTmC7+pvDr+W0KvpwI3udoVNBGUsZxd3UUkf8GbRgg9BGsjxHmGBg+qLhV9wPqVs
	1yIxVdQxSkf5OsJeuwce+E0FNtHY2OFNGzrq35bftqwZtYPWxT4G+Co1FUZXsPkAEydndurwuqCsD
	0FxXHj4VRtsMHrVDJx2yz9FQvBhau4uicuS7Wy/2yZs/NKYCUhJh6YkPVGmsGsW6k6v1PI3oHkP6E
	ga4u2Qvzt+skZ84HkHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNA6-0000000HQor-46Gq;
	Thu, 29 Jan 2026 08:13:58 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNA4-0000000HQnp-0lY3
	for opensbi@lists.infradead.org;
	Thu, 29 Jan 2026 08:13:57 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-124a1b4dd40so1777674c88.0
        for <opensbi@lists.infradead.org>; Thu, 29 Jan 2026 00:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1769674434; x=1770279234; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJ9DNYhUxwGtmLBZ+59B0aIEHEDM8j8xnZ+Is4YjeEE=;
        b=kRLTpstyWO838HW5xwTvXiz/KSC96bC1SbsPfurbMs1CBdHjPrdHmasSIy6WspHY+j
         gnlw3+cRei+vn4O55C3HWNUq4e2x+eWUwIFc1/Kgc4wx7pn4LLoop7ItfRfufa68idwk
         s5+KWp0R4MluuGAP9+tA5Jy4PD94ZsZYkJI1zx38Y4ol0MIFG399TzQqpgoH9Jv+xH6R
         mxVja0Y7NdbED8gOCGxET9MZ5/C0JRbxkvg4XyIKaVOhmoGpCZS66y7ZMZIROb+qxxsJ
         PcKZigQ6S+RzlWgjAWHNn7u3XUEgIHh5F5FKsaJjlEN6sPNlg6SYuVolA+YVm1fgdJIo
         bJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674434; x=1770279234;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ9DNYhUxwGtmLBZ+59B0aIEHEDM8j8xnZ+Is4YjeEE=;
        b=Rx1Y1XF6Z7TcuGnoC/npuul0mUzeMzi65yn2/qU+aLaLoNmaces4y6bBCJ2Cfv/Vpj
         DdiZ2npUIdCycsuQTcIgLZx9Pr/u9Qq7HAybI1EvzHBEF38KJ21ZYT15eopYnXO/sH1i
         EJbi81QSaKNmhoeWU0kk6Yz7erRmGE4SOh1+EMb+HJSseSK6IEJoNrVMIUFoEMe2HJ9u
         AiW+G1MtjpEnJ2OFgmk6zbaH4iijEimepNL2RTfqwZjAnNcReP5AX2EG7cXCq+pGe1oF
         OPVfZkPsSD7X2zKIpkSCpeCaYlb8lUDfy0PjKsJK3EAWnNQAztVoq+qPf1kiB/pyRZUr
         xxaQ==
X-Gm-Message-State: AOJu0Yy/T5EcHx8KqjzQqrR+bSUPo2jRsaw25+39SPiya9uP9JVUYFm0
	T0WbezAATighF0hHE6UsCoILX6vicWgaBTpOgLmxch6Seo+KBOvqPMLmlq213dWzDVHAgUaW8rw
	bptFw3AmNtTHZrtTpgvc4YGKGzMZmdIl2nGHuQKfjIaghAat6J839sPlY6cKUbHsPP9aYPqE52S
	hklKIm5KfFJrMVpxZ2MX0v5RHUQ4vc8pzBXE3COqmVWCZ03C45RQ==
X-Gm-Gg: AZuq6aI+pJN3r9ceBsBRKeCb05+FpiFECnw03vDndB+HVRyYFuXzzFHexOgJJVNNF/6
	B19SjUMYOaB8IrDQw0N+76CsqWLnSAaDDZhkf1K99rqHIoQIsV8njClGWDuqZEbL+35OuiI22q6
	OZXvd2StDp7xMX557rcR4OyN/4/2YoFaQSAlT07ywTp7vq2JZT3gLdO5GfeyDfM+p3tllec/Rvt
	L6v0rXKFbaedLApSX/f3/7xdb8vrIHc2ePutGrG5W1DSs1VRfwvQcDcXDnU1TShYtN2R+mEUlXa
	00qXbiJaaUV7c+fGg7tivVsyvV5WUq585rrU3ENrHc35Cv+gsaFygMgEYgh+lajsdTh69kF5ubH
	VRXkChO0+Poedc+l9l9Z167Gfz7U4oTAJawa9oVt4PnCdjB+vghiKTRlg9GqFeHKoDzEzmFKGGn
	Drmz+pMPbp/YvJhOZ+4kPTZ+IYiTs=
X-Received: by 2002:a05:7300:ad09:b0:2b7:2f29:648c with SMTP id 5a478bee46e88-2b78d8cbaffmr4472775eec.8.1769674434285;
        Thu, 29 Jan 2026 00:13:54 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add664sm6042480eec.26.2026.01.29.00.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:13:54 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH 0/3] Subject: [PATCH v3] lib: sbi: Add RISC-V Smrnmi
 extension support
Date: Thu, 29 Jan 2026 00:13:40 -0800
Message-Id: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALcWe2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3eLcorzcTN0yY12LlCRDg6RkI5OUNEsloPqCotS0zAqwWdGxtbU
 A5l57OlsAAAA=
X-Change-ID: 20260128-smrnmi-v3-8db10bc24df9
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nylon Chen <nylon.chen@sifive.com>, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001356_247100_8928AC72 
X-CRM114-Status: GOOD (  10.16  )
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

This patch series adds support for the RISC-V Smrnmi (Resumable
Non-Maskable Interrupts) extension to OpenSBI

1. PATCH 1/3: Add Smrnmi extension detection
   - Defines Smrnmi CSR registers and MNSTATUS bit definitions
   - Registers the Smrnmi extension in hart extension enumeration

2. PATCH 2/3: Enable Smrnmi extension handler
   - Implements sbi_rnmi_vector_init() to allocate per-HART RNMI context
   - Adds platform operation set_rnmi_trap_vector() for trap vector programming
   - Adds suspend/resume support for RNMI CSRs

3. PATCH 3/3: Add common NMI trap handler
   - Implements sbi_rnmi_vector assembly entry point in fw_base.S
   - Implements default sbi_rnmi_trap_handler() in C
   - Enables RNMI via MNSTATUS.NMIE after trap handler is set up

Changes in v3:
 - Split single patch into three-patch series per Anup's feedback:
  * PATCH 1: Add Smrnmi extension detection (without enabling NMI)
  * PATCH 2: Add common NMI trap handler in fw_base.S
  * PATCH 3: Enable NMI handling with proper infrastructure
- Added platform abstraction via set_rnmi_trap_vector() callback
- Added per-HART RNMI context allocation
- Added suspend/resume support for RNMI CSRs

Changes in v2:
 - Remove hart_smrnmi_get_allowed() and use sbi_hart_has_extension() for Smrnmi detection.

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Nick Hu <nick.hu@sifive.com>
Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
Nylon Chen (3):
      lib: sbi: Add Smrnmi extension detection
      lib: sbi: Enable Smrnmi extension handler
      firmware: fw_base.S: Add common NMI trap handler

 firmware/fw_base.S           | 64 ++++++++++++++++++++++++++++++++++++++++++++
 include/sbi/riscv_encoding.h | 11 ++++++++
 include/sbi/sbi_hart.h       |  3 +++
 include/sbi/sbi_platform.h   |  9 +++++++
 include/sbi/sbi_trap.h       | 12 +++++++--
 lib/sbi/sbi_hart.c           | 52 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hsm.c            | 10 +++++++
 lib/sbi/sbi_init.c           |  8 ++++++
 lib/sbi/sbi_trap.c           | 16 +++++++++++
 9 files changed, 183 insertions(+), 2 deletions(-)
---
base-commit: 74434f255873d74e56cc50aa762d1caf24c099f8
change-id: 20260128-smrnmi-v3-8db10bc24df9

Best regards,
-- 
Nylon Chen <nylon.chen@sifive.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
