Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F23C982C1
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 05:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9xWRoeyUM6CH7reRJBYuPDuk32thmocR29nE8m48rAU=; b=xdcbnVC5EII2Nk
	+oH4rU1xmKjLkvvi+uX25A2E393KvEuneCRMJTGmJ3QCuYUz5uty3//vereAza0QHnN9h39saJTGt
	lvhsaq6py34FRgWrM5qbSS2iWTtrkuFvwEEhG68eMm6E3hS6ITLH+LfqQO/A9+AsqGXoy3VRzMIwt
	KE9ghkgyOYA5En13fKrUCYvxdnh5FzSmtdYQhTIHfAtah0vEs4GLe4fkV+eXvUwPEQ1wZfF6q6ljN
	6bRquiYv0uBBIJQTN+Oc45uHS31lKW+bmu5ARf4DdXFyQyRHlnvGjnsvx2cXFKGfi4CH0/7tcGEmH
	LeFWkRiOrOVIfFdwIf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6idf-00000008Qf9-15k3;
	Wed, 16 Sep 2026 05:56:59 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6idY-00000008QdE-1mjx
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 05:56:56 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469e211a3so413907b3a.2
        for <opensbi@lists.infradead.org>; Tue, 15 Sep 2026 22:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789538211; x=1790143011; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cA4naszIO367kaWgrQQVOsGsNu8rx5bEPZmcwItfCVQ=;
        b=LzTqqOncA0F+YbF+w74623Asf8inMtBgX/gB1Q7sBTmNi13jjidGQBZQ1ddAezJqJo
         lBs1nXy10leObOZV3cqfndt4zbr2gceDUPCdyrByR4aVvfaxVl1TwDBAg/4r6mkdUhsC
         vQfWy2YgGs66eJvK5TKs317Qx7dII57E1+a/5K6QAHspGAFBw4URTMBFl9VpuGFWE2tc
         Z38UVzNmA8BjBJuAuoecwh4FRAQOj3nO4XGvUkiaLhxPOhdi8q7/Jo/HDjkZetZ7fUYP
         C4mr0YeUA+NA5GdSsy/wdJKni818Qoid5QDiyK3Acs+n+BDADYIvzgRsXfUkYS5OU+BU
         7zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538211; x=1790143011;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cA4naszIO367kaWgrQQVOsGsNu8rx5bEPZmcwItfCVQ=;
        b=Hief3O6bIiAXcBpEt34E+6Hhkzrja6t2DVV7WfDosOcCPa0y5tlZ4J19yMLT2bXaSa
         QRKAhXxVe8lXbxpNmEDbHyv/PxqsqQFay4dQbRVh+xddnK2QlhJGIIs98D2BbL+uZ8UN
         u4roGLPJcIH1hWT1/iQm1ewoQuIRzybySI9K1zI+9Ejac4cXHfvxrSJuj/djHMvn1j3d
         B6LLgZ+AUi1B+ON9zgUZCMDpwYYHiSQQAmxwkpx7Rup9yenjgeM4cExSat4bjylWnOV8
         dlN9rK7dw9Okgjqyr5/cDHpCALWGibhNDQrxAlXaPYh8AhCQHsjrBoJGMQZ3jSZUTbd4
         QFZw==
X-Gm-Message-State: AFuF++n4kexiC4xtvrGSvS3IAfANO2uO7wh3kF3hblIortgjyaj+32zw
	zs73lqUcUQix5Hbk5mdnpnMDt+QMTJ/XM9JFipSv36IPJWk/JMrAT5+yteGZiwVQXN5RoDiCKf4
	bu7UIdiV0AR7J2Coz1lxV64yo7KXr8DM4bCWPRQVtyBsxD59upNOqNOXa7wZTsc/9AQMDono1Un
	afAsd0Uh+jB8POLPnf0D9BBdLgI4iVH3cGal6WfEXpoTqVjnI=
X-Gm-Gg: AYBFou0VfnYtm4xO8AtobjdiIqeipXyE5b8hxRVSKgtPJStq+o8Bp8d1mGEHQX8OuHP
	7AAKhr6sXSC/oLntoMmmaaPkzJiAYJ9NCGQHmsPKBKHlQT30lIbC+HgbR+AjsHwiiar9pkwh1AR
	kmnYMOl5f6I3y5HQCltxXxylka7SYYhUbxv/Z5MmKjKjbyg3rp7Q35QxYFcyTHIqNVnWgrwElMp
	ySek2Qr2qdQ6I+uknoMTc92QNxQkk6w6ok+xTmgdEAQ8BfGI5ycmDglyqdKDEQAZ1hqm5JwVmWs
	OPpWa6ehmU2WHqvpfKuv4ZaTq+ulhTDVvOaEco7dB5LIrR2FgfT+BGbCHuX5iIhKPnWDM9IJbnu
	dkdm98kO5/dkayZWkds4TaXzN8CEk0ndYy6hjSbHI1P1moNOmKerl65J1OHyGZyVlgmhUroyUsH
	T6wMF0unBflA6X6Zz+G1slMcy/je44xjfV8PHV9rpNPQKx+12lu8UP4GnbMVQnTf5AGRKQSKAdU
	L+Qs8sIlrU=
X-Received: by 2002:a05:6a20:6f0e:b0:3d1:e510:905f with SMTP id adf61e73a8af0-3dd5f3c26dfmr3492683637.1.1789538211182;
        Tue, 15 Sep 2026 22:56:51 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm3550521c88.11.2026.09.15.22.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:56:50 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Subject: [PATCH v3 0/3] lib: sbi: Fix Smrnmi resume init and optional
 platform callback
Date: Tue, 15 Sep 2026 22:56:42 -0700
Message-Id: <20260915-smrnmi-context-restore-v3-0-e9dd31152515@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJovqmoC/3WNwQ6CMBBEf4Xs2TXtNoB68j8MB1sW2QOtaUmDI
 fy7hcSjxzeZebNC4iic4FatEDlLkuALmFMFbnz6F6P0hYEUNeqqNKYp+knQBT/zMmPkNIfIaI3
 VAxnLji5Qxu/IgyyH+NEVHmXvfY6fTHv6U5p/ykyoUCur21o1PdXtPckgmc8uTNBt2/YFrhST/
 b0AAAA=
X-Change-ID: 20260901-smrnmi-context-restore-b3b1f23bec28
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Zong Li <zong.li@sifive.com>, 
 Nylon Chen <nylon.chen@sifive.com>, 
 Evgeny Voevodin <evvoevod@tenstorrent.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2482; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=LE7xeHpjOFUww63q0rrCHrbtDds9dNW/HJtCOnSJq34=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqqi+i3QHBe4+/PhS5dAMBc7FtGNsNvuTt+JWnw
 FwvHWxPNjOJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCaqovogAKCRCIoTSWt/mH
 4L9fD/4pmfpMMWtKZ2vnpS1dOvjmViKFI6mBmJV6JlKSEamwaIPxA6erI0rnkvvzqTMuVSHz6h6
 ZdXBSU00A+4Wt1ubZJnLL5F925y2hb1XNSZ/158KExdgPetiWznS2LDoPcpMA5tLLRMLeu9wLZK
 iPzOd4HLShdh6zGYY8ACsQsanB+QmUKFX2AjkPi5fPMSWN3bxfun2kpze4DhewjgaGK8oTCr+yw
 ySqmDoOZX9VjCajqOv/RGsWlrtACvkKct9HsWLxuo/Ayd3v3IfU5Diu7Tc5anc11B7hqAcKYGll
 VhRfDOO7Bs3B4UFaxvPWEKYoP6Ev+E2rRhv4N5pnn50qdHxeA1bazelRISND7cvGNWp23AUaWWa
 lX9BbOQTI+eNVNoAl8DcfWrkwVh0cbEmgCChUGGYQqhA7d9j8XfOmUGA6F6khhAIq3J3/uFoZlV
 I89XgJMFYrSQwCkRx+2fE28u440kwfs4I8itG759nWkHdV8/XpBQcT2PfupOnFByiJFsnWZF7qi
 iz3XWt8TV1EIKINTOovcOv584H+E9MRJiQD5Ak8vhEW0qiBcbh6I28T5QmAxhnQ5A0Adlw0/zu0
 BScY9CP4Ro67dhFgO5rHgNe6X+r3+M1nc0+ZtAw0IjKQuDV0oa9Hgeesx+3Hm1daH2eYpM2qMM+
 vtdaW9XpToBFwIg==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_225652_688513_7ADAAE6F 
X-CRM114-Status: GOOD (  10.54  )
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

On non-retentive suspend resume, the hart never initializes the
Smrnmi CSRs the way hart_detect_features() does at boot, so a hart
waking from non-retentive suspend resumes with NMIs disabled and no
RNMI handler installed.

Patch 1 extracts the setup into sbi_smrnmi_hart_init() and calls it
from both hart_detect_features() and sbi_hart_reinit().

Patch 2 changes smrnmi_handlers_init to return int, so a failed
callback no longer gets ignored before NMIE is enabled anyway. It
also documents the SBI_OK/error return convention and aligns the
neighboring rnmi_handler comment to use SBI_OK as well.

Patch 3 allows a NULL smrnmi_handlers_init only when the platform
sets the new SBI_PLATFORM_HAS_FIXED_SMRNMI_VECTOR feature flag, so a
platform with a fixed or mtvec-based NMI vector can say so
explicitly instead of a bare NULL being indistinguishable from a
callback the platform simply forgot to set. It also reports the init
mode ("Platform" or "Default") in the boot HART banner.

Signed-off-by: Nia Su <nia.su@sifive.com>
---
Changes in v3:
- Patch 1: call sbi_smrnmi_hart_init() early in sbi_hart_reinit();
  document that smrnmi_handlers_init may run twice on cold boot.
- Patch 2: document SBI_OK/error return convention on
  smrnmi_handlers_init; align rnmi_handler comment to use SBI_OK too.
- Patch 3: gate NULL smrnmi_handlers_init behind new
  SBI_PLATFORM_HAS_FIXED_SMRNMI_VECTOR flag instead of accepting it
  unconditionally.
- Link to v2: https://lore.kernel.org/r/20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com

Changes in v2:
- Break v1's patch 1 into three smaller, self-contained patches for
  a clearer structure.
- Dropped v1's patch 2, which is unrelated to this fix and will be
  sent separately.
- Link to v1: https://lore.kernel.org/opensbi/20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com/

---
Nia Su (3):
      lib: sbi: extract sbi_smrnmi_hart_init() and call on non-retentive resume
      lib: sbi: report smrnmi_handlers_init failures instead of ignoring them
      lib: sbi: allow NULL smrnmi_handlers_init and report init mode at boot

 include/sbi/sbi_platform.h | 19 ++++++++++---
 lib/sbi/sbi_hart.c         | 68 ++++++++++++++++++++++++++++++----------------
 lib/sbi/sbi_init.c         |  9 ++++++
 3 files changed, 69 insertions(+), 27 deletions(-)
---
base-commit: 35511bc6ee1c9c17b6a89b44c52e2044bb51b979
change-id: 20260901-smrnmi-context-restore-b3b1f23bec28

--


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
