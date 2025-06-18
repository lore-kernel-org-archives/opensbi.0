Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07531C71157
	for <opensbi@archiver.kernel.org>; Wed, 18 Jun 2025 05:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaSD1DmPafu21xhvStxX+xm4h7X1HllApMXEbW5RD8E=; b=aenNgLeXbPIR/u
	DLwhepuqFzWt0UIdjsQKRm/pM0xs6afKrVwMJk8e+gCG4HuJT865mwcghkCVRwoNkkftL71NrGevA
	OT2zYnd1rhlu+I2OUNO/yPtDliS1FPi7WeG7EDdPdv3aeBnfgwaCTvR4C9zAnrMJ1JjQnsMBrE5eW
	HpRX32IHBU1s8fABSsMNfu+hCdNUkSJC1yjtzglSK5pYEsXRpc6Eqx/6Qh5twatcr3pxcBr9bkIXC
	DCmGSOr0sluVK9SaVQ+T4GbM2yfppE+H4HGnUXAHAYI8JGn7k1bjgmNqepZqmQDsYoXCpmU8dowiJ
	pWMAWmXHiVzVbk0eVw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRlW1-000000096Gc-482N;
	Wed, 18 Jun 2025 05:39:17 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRlVz-000000096Fc-2YDJ
	for opensbi@lists.infradead.org;
	Wed, 18 Jun 2025 05:39:16 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b31c6c9959cso779953a12.1
        for <opensbi@lists.infradead.org>; Tue, 17 Jun 2025 22:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750225155; x=1750829955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YkTqfHd2BlKwPZ+djoI7rS0sW5hrNgjp2fQacIOxis=;
        b=BEPO1xk/1ZaoAl89UGj0hv7esixiqkJSk4NnB1MD53luX9hW2ctoldwMS/sxgtW9qm
         1OpXi+iSMXnKcji6d1vXep6nCxI+bEp9ag8i17CGkqSs9nKqi8h1LwxmAL+1PQLJ3UuW
         8ueK9U0UwKhqF9G2jAAPPeoxxXiYG39IPLVWvz0+iZKT/Q0nv62XK8dZoFdbEdXfQv5k
         t/hr0TyLC9z4V1PRpQ09svGpMk4txKREJKTEUMwGE0kxShmnTgrdJBeSZg/9rJOdJb02
         HyuEDLagY01URNm3XpfYhhxl2vJJBYqYuhOqzEhTom5Y1suI9VabQ0uIyibgiSwthIE5
         HtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750225155; x=1750829955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YkTqfHd2BlKwPZ+djoI7rS0sW5hrNgjp2fQacIOxis=;
        b=K8C5HHXNRcGd+o8w9L2WUOKWz/l/7pVSksyB3mmkLSurV+09RTd4+cvc8l5xee7TLj
         kHFo+B7uztK+EMFp5p+5ElujLavjoh9JK1tKuEKf8jxyf0VdVPM7ErAr5m3thy2Pr8oP
         r5kLRrp2K5NSvYXd4AnTbiv8HE7hsaTQI9bbNLpsxLElWjarw/GRntryb5xxfgeKKOWy
         yoS7vWr1GklFMzIqcq87hTCgJAS/IQOBdXtnq33jaAIRwA50LIOkxIqipbN+P9fcddgL
         YqgpKC/b4KYEavuD+6T7O74XZYVrQ21UkPVena1iB5PhyGNDz+OLiHucYVm5gKj8PL9U
         92zg==
X-Gm-Message-State: AOJu0YyFMK5i8C1qWntKekpY9f4x3VOOen7PtFq3euX1/O2rVmFSwZMX
	vCb1T6W3n90YnSy1x4k8xqb5lC4U471Uf3paoynckz4fu3xPRBnq1muaco5k31oarHJGbF5Yy5f
	LgINqhPQ=
X-Gm-Gg: ASbGncueGd6oRroZeQGO/pQawDXfLD666jqhfynrBmunsgbj2/x7JgqW3APaNOlxxO1
	Xa1qV+istspM5qCTOj14zQoGGKcXdwTBNElLYcoyNgzkdE3dWfjJ7j6tQaWTbjY/pZA725Rm7+6
	+7OY0HEFFMErEj0bcRRNBOffC8pxi9tg+YKR41FZFVF2tmxxqLqUBkotP6c3Mqp5ymiybcD9IC6
	IVTdvp96/F4Df34uzVIVYfDYcv06Tz/RKN4wHyXB/cQ0ejcsLAOaLdFbcqsGbih9CRkeihHWN3B
	NoRiC3T5FTzEmscO3kpi+NiF2fK+68EQqonHJ72a4j/OmaqWT4wJ7A9TKNHaZHl3BTzRSH6fC6t
	o6jGUuz0slks=
X-Google-Smtp-Source: AGHT+IGZxPLN6J1DtyE0MDGPwR8BQZBUFUDvgXrYBCe5wtaXK0ohZpmKqCed7I5qYmQFYMT9qXnpWg==
X-Received: by 2002:a17:90b:380c:b0:312:639:a064 with SMTP id 98e67ed59e1d1-313f1e2b0a3mr25072983a91.28.1750225154592;
        Tue, 17 Jun 2025 22:39:14 -0700 (PDT)
Received: from rpathak-ThinkPad-T490.. ([2402:e280:3e81:5eb:e7f2:d849:97c7:f37f])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313c19b84e5sm13272553a91.2.2025.06.17.22.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 22:39:14 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: rpathak@ventanamicro.com,
	rahul@summations.net
Subject: [PATCH 2/2] lib: rpmi: Make RPMI drivers as non-experimental
Date: Wed, 18 Jun 2025 11:08:54 +0530
Message-ID: <20250618053854.2577299-2-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250618053854.2577299-1-rpathak@ventanamicro.com>
References: <20250618053854.2577299-1-rpathak@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_223915_650695_E2BF9212 
X-CRM114-Status: UNSURE (   9.09  )
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

As RPMI v1.0 specification is frozen, disable the
experimental tag for such RPMI drivers.

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 lib/utils/cppc/fdt_cppc_rpmi.c             | 1 -
 lib/utils/hsm/fdt_hsm_rpmi.c               | 1 -
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 1 -
 lib/utils/mpxy/fdt_mpxy_rpmi_clock.c       | 1 -
 lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c      | 1 -
 lib/utils/reset/fdt_reset_rpmi.c           | 1 -
 lib/utils/suspend/fdt_suspend_rpmi.c       | 1 -
 7 files changed, 7 deletions(-)

diff --git a/lib/utils/cppc/fdt_cppc_rpmi.c b/lib/utils/cppc/fdt_cppc_rpmi.c
index efcea652f1d6..7bd3b0f90d6a 100644
--- a/lib/utils/cppc/fdt_cppc_rpmi.c
+++ b/lib/utils/cppc/fdt_cppc_rpmi.c
@@ -370,5 +370,4 @@ static const struct fdt_match rpmi_cppc_match[] = {
 const struct fdt_driver fdt_cppc_rpmi = {
 	.match_table = rpmi_cppc_match,
 	.init = rpmi_cppc_cold_init,
-	.experimental = true,
 };
diff --git a/lib/utils/hsm/fdt_hsm_rpmi.c b/lib/utils/hsm/fdt_hsm_rpmi.c
index cc78436f9a4a..06e4b17976aa 100644
--- a/lib/utils/hsm/fdt_hsm_rpmi.c
+++ b/lib/utils/hsm/fdt_hsm_rpmi.c
@@ -359,5 +359,4 @@ static const struct fdt_match rpmi_hsm_match[] = {
 const struct fdt_driver fdt_hsm_rpmi = {
 	.match_table = rpmi_hsm_match,
 	.init = rpmi_hsm_cold_init,
-	.experimental = true,
 };
diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index fdb04915ba70..521e06735873 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -819,7 +819,6 @@ struct fdt_mailbox fdt_mailbox_rpmi_shmem = {
 	.driver = {
 		.match_table = rpmi_shmem_mbox_match,
 		.init = rpmi_shmem_mbox_init,
-		.experimental = true,
 	},
 	.xlate = fdt_mailbox_simple_xlate,
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
index 7d2b4a20c934..585c2bf348d5 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_clock.c
@@ -83,5 +83,4 @@ static const struct fdt_match clock_match[] = {
 const struct fdt_driver fdt_mpxy_rpmi_clock = {
 	.match_table = clock_match,
 	.init = mpxy_rpmi_mbox_init,
-	.experimental = true,
 };
diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
index b4bab85aeb95..94a5af8cf04d 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_sysmsi.c
@@ -205,5 +205,4 @@ static const struct fdt_match sysmsi_match[] = {
 const struct fdt_driver fdt_mpxy_rpmi_sysmsi = {
 	.match_table = sysmsi_match,
 	.init = mpxy_rpmi_mbox_init,
-	.experimental = true,
 };
diff --git a/lib/utils/reset/fdt_reset_rpmi.c b/lib/utils/reset/fdt_reset_rpmi.c
index 81b21d0f5dd9..edc53932ccc0 100644
--- a/lib/utils/reset/fdt_reset_rpmi.c
+++ b/lib/utils/reset/fdt_reset_rpmi.c
@@ -138,5 +138,4 @@ static const struct fdt_match rpmi_reset_match[] = {
 const struct fdt_driver fdt_reset_rpmi = {
 	.match_table = rpmi_reset_match,
 	.init = rpmi_reset_init,
-	.experimental = true,
 };
diff --git a/lib/utils/suspend/fdt_suspend_rpmi.c b/lib/utils/suspend/fdt_suspend_rpmi.c
index f9baa23c9168..055ab2ff8bb2 100644
--- a/lib/utils/suspend/fdt_suspend_rpmi.c
+++ b/lib/utils/suspend/fdt_suspend_rpmi.c
@@ -135,5 +135,4 @@ static const struct fdt_match rpmi_suspend_match[] = {
 const struct fdt_driver fdt_suspend_rpmi = {
 	.match_table = rpmi_suspend_match,
 	.init = rpmi_suspend_init,
-	.experimental = true,
 };
-- 
2.48.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
