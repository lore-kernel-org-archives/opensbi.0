Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A626DD3B7EA
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WZWgHUWNs96FX5jNlen2dD39YzzhCDGUT4l2rpFCSu4=; b=HboNLETG4SbzDl
	jnHhslgMzcekH+4kUaB9yTNn3I12WoMp5JrzUAcmXAt0fgZRqJxV/amNoFsbosf4hCoo7ib4bh4OT
	CdPVk9PTXbZqwWwQjgV/yo4pVgpOuHkhhy+oa7jvb0UKR9Vc8FIAks3Hb4T2yVvPLdpoMSyrPje0x
	W2mID7TVagRY1RIaoKfcWmz369ofmwqnrhvdgY68ihQ0BbJGYkYjUoZ9WFDS4StikhRM4mQSIIDiK
	01IWLemScmxPawuA10gWaBT26lhWsyUcdCdkUm76VUbVNUmzrocFfJgKZ1eNM3NCVcV8K6pGUcywG
	gttKXAjkQwtoRuHYcbSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy94-0000000ELXF-2qTA;
	Tue, 09 Dec 2025 13:52:50 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSy91-0000000ELWt-4Bcv
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 13:52:49 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7df022360aeso3209608b3a.1
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 05:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1765288367; x=1765893167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=clR+ePn0E4TCQlTdg0EKkGXmksngLqGHF4ypuk5A/eo=;
        b=kzWKDh1knPcZyTfgaaD3YrQgjpPHnNhhPrbvvgPU8mAZd0WtG4ndYx0RRwZ4PMfOvV
         vQ1q6XYiR60NcpxRnOnZUnGPhtui7TU9ZzJ/fQEm1JgHff53osqM/acab+loCPq3jmm0
         mH9ybhWxKZdGsQuJTR8oA4RV+mF8Lne9rFd7m7bUyyMywcftUMul2kwVNLTJ1AAGOKja
         3vf/+OZZH/jCUfYdEuwCWHhC2FE5weS88x0Luq9FBsTUQf3hBz3KxCkWWidzs2sBiedQ
         FKCT81uc7dg3pGLNT6r7nlLLCA3je/t4MhrcbxLkbpvUggr/QG7C5avORgzrJnb3CSMD
         QH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288367; x=1765893167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clR+ePn0E4TCQlTdg0EKkGXmksngLqGHF4ypuk5A/eo=;
        b=Ubw9HADYn5A49QWb7oqyLKxOHvORL/IXJC6VTcNvGEnHrQztFEy0vKMIsY6E2y+hz5
         5GgL038cYu+1ymEJSnXNugFApiGyX3f8/+1HSDA6N8/rstwrVvSeG7DCmOeFGA3xZT08
         om6GKantu82DwjLAYORlIJ8mWxudfzrzVqHxZkAqU3Y181tvU/k9vs1axPvpiDp6Xzqu
         vapeai6VAtHLyjdByrM8nN/mphH/0MgDj+/LOH5LLBLrGxM+B2GTYmIN+MlsjHgUs91K
         2eTsK6YenY9J3N9775k3OQR/uXH03QeitAqElATWs9Utbm0f5OC98M3iusMZX4tXfAp3
         bHdg==
X-Forwarded-Encrypted: i=1; AJvYcCV65VCyh8Vsb/hmGQZGUvljWg/vf5mbkodzXYEkF9SxR2HuqFfPeFzef9z7uUfuR2eJXPpFO5De@lists.infradead.org
X-Gm-Message-State: AOJu0YyhV6+/m9N2JEm8S1smmrEMlgz/i5rokPtWcSqK5IK8Oe0fzHMI
	Kynvyb+3wYQ/n8h6CjdNO82zPpk4RIQlISul9/4Cw8ZNXujeUyj70kjLhx6/ahKJEWI=
X-Gm-Gg: ASbGncuolDG0jfFocjWlu9cyax/jGyXN2yhhcsWEjiMlFUaUo6oAUx7AlsoMzkg2GfN
	GqtKp/zPn4S5OPBTAYRyVl0HbRIotr3WhBVq7j1k5VktrihIh+tCjtvDysOIXXut38b9ByEcxx7
	R3NJRiEv/sg+IKpAsfQR6eAPyP27UdT4IG4hDuMj2z0nI5h2jfvDTyRpsa/WDLcYDN/SPVwyNQ8
	02wqShhHwfgpNByzoB9GVsN5IfnSSXzoj2KhrsHXBQu6BmkvjnLPO9oPwuuP3+XBOcOzIfoCk6H
	B5SpX042MC6ecCUWrwFlxrxDKEnn4pb0KB1Xn3rImtDq2K+dvVDETSUGl4k9gRffERX57F+7vrJ
	3zw/WMXuf2WyYAIF0RfDgzBizkW1ruxzlF9BXo/T1mZ9eG7ZiIWk0wpaq9RVWYd5SR/4wwAguqR
	sdAtMtFT8w7qcQ5FCJs7xd8CJYQoykhD63ONDeGe9E1NARw22IE8hM+z1j88c=
X-Google-Smtp-Source: AGHT+IG0ISYAzNNvnrxy3n2d9vVThar/Gh3mirOA26KNwYeIJ6lkdriutbK+u6lI17fhnrepgCMmwg==
X-Received: by 2002:a05:6a20:7fa9:b0:366:14b0:4b17 with SMTP id adf61e73a8af0-366557d169fmr1506646637.34.1765288366987;
        Tue, 09 Dec 2025 05:52:46 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf681738a34sm15023827a12.4.2025.12.09.05.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:52:42 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	opensbi@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/5] OpenSBI hart protection abstraction
Date: Tue,  9 Dec 2025 19:22:30 +0530
Message-ID: <20251209135235.423391-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_055248_056697_C3BF0FBC 
X-CRM114-Status: GOOD (  10.26  )
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

Currently, PMP and ePMP are the only hart protection mechanisms
available in OpenSBI but new protection mechanisms (such as Smmpt)
will be added in the near future. This series adds hart protection
abstraction and related APIs for allowing multiple hart protection
mechanisms.

These patches can also found in hart_protection_v2 branch at:
https://github.com/avpatel/opensbi.git

Changes since v1:
 - Added documentation for function parameters in PATCH2
 - Dropped return value of sbi_hart_protection_unregister() in PATCH2
 - Register oldpmp hart protection only when Smepmp is not available
   in PATCH3

Anup Patel (5):
  lib: sbi: Introduce sbi_hart_pmp_unconfigure() function
  lib: sbi: Introduce hart protection abstraction
  lib: sbi: Implement hart protection for PMP and ePMP
  lib: sbi: Replace sbi_hart_pmp_xyz() and sbi_hart_map/unmap_addr()
  lib: sbi: Factor-out PMP programming into separate sources

 include/sbi/sbi_hart.h            |  25 +--
 include/sbi/sbi_hart_pmp.h        |  20 ++
 include/sbi/sbi_hart_protection.h | 100 +++++++++
 lib/sbi/objects.mk                |   2 +
 lib/sbi/sbi_dbtr.c                |  33 +--
 lib/sbi/sbi_domain_context.c      |  13 +-
 lib/sbi/sbi_ecall_dbcn.c          |   6 +-
 lib/sbi/sbi_hart.c                | 308 +-------------------------
 lib/sbi/sbi_hart_pmp.c            | 355 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart_protection.c     |  96 ++++++++
 lib/sbi/sbi_init.c                |  22 +-
 lib/sbi/sbi_mpxy.c                |  25 ++-
 lib/sbi/sbi_pmu.c                 |   5 +-
 lib/sbi/sbi_sse.c                 |   9 +-
 14 files changed, 645 insertions(+), 374 deletions(-)
 create mode 100644 include/sbi/sbi_hart_pmp.h
 create mode 100644 include/sbi/sbi_hart_protection.h
 create mode 100644 lib/sbi/sbi_hart_pmp.c
 create mode 100644 lib/sbi/sbi_hart_protection.c

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
