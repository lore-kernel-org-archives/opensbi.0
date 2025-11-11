Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81020CCFA18
	for <opensbi@archiver.kernel.org>; Tue, 11 Nov 2025 03:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7iUfE/GhuiHhMKP6grUpBuEc54Eh3vFw4SNn+4khrw0=; b=PHr97pNcK/u1OE
	6I8K+gLYuUMtP3J6sGgtaoAr933PcjZZmGIm4/1Omhaf0Ol000aGekJldClCUF4UvoSW3kB7eiI1O
	9og+bZ2d0NhvmYWzxFZvxYXAWOUB2Mzf1HbwkFivBAHZOU+Dj+a5xmB6o15IFJtZk21w+bZeFYwt5
	utek2oKK658Q3R8y2tBCZw6KFyBuCs1vyNhZwP5UHoFttP7Ky3+8vCxN+jTv38ieLoHzb+AyWjMW/
	QF43/e0JOpWYlrwzFoPlKb2A5Qn9heveEqPkB1b1ml2lRDIODozeWg7Dt50Rgh/O+AyOXf3YMBTk2
	e8nBOe+Q7FPq9bBBz/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfHJ-00000006SNm-2qvn;
	Tue, 11 Nov 2025 03:42:45 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfHG-00000006SMK-3Trq
	for opensbi@lists.infradead.org;
	Tue, 11 Nov 2025 03:42:44 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3436a328bbbso3695576a91.2
        for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 19:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762832561; x=1763437361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BcY7ZzOoUU4MUtH1KVa3ImiH3FlKtJul/SXuc9ejLk=;
        b=E5ZvE3rh2IywlmjBaNjBsHIPWNlzvxU7thcjJPtesl/Xo78Afnjd2xVKxE0qhcaL3c
         V/ursTEvgPKLCRmwlMvdgQRXf9WC2ULY+1jdf/CbiBrrLTbh6V4S3W95tFz3EICKATmK
         Eml7MdZAV9z2f9T4mPoRqUyu8h6Cgi8xRR13lyRlW+hsEbyYiJsLcKc1gtrnRxIawb1i
         DeR9GSQ6xRoZ7OIAynS1BoX48Iz8lQ8NFZX4TkjVKpOrg9gVfzvLqP+0j3wK1XTL26c3
         HQ1LbH2wgvNraUUIuHYEwiSfMBLeGvEvZYqDgZ2MoGRIyS82WxRrEqwRDHzcZx7XAw6X
         ViMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762832561; x=1763437361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BcY7ZzOoUU4MUtH1KVa3ImiH3FlKtJul/SXuc9ejLk=;
        b=e4jvE+9D7w2OjZ9ongscr2rDzlKB0djc2/h6hUaJUX/n/YvN3Bjqbi47KSvKN/8deA
         e6XyUwMWOQpbGVkcwkbjQlg6gzDy6BL99YO5XTP9iwxKjjVk5OJtzGUJUpY63tFx/YD5
         SZTvloctgtEDXgDl661kS3pUi+GtXB6SO/xZfhOkkJA2h0m4i/6qPqCy4Nu5GeqO7gC+
         xjl8UxDIwJ6V/vNHxVUY/QdxPrKZw5gTK+8UmfDA0dz63JhRBraOcj1OSWCfB4AV4ULO
         bNjaXWx0D18hjcwDYt2N+zACC6IxB9y0YnDGX966lO/tjoWUccDtO3DMEZRtO9C+BXr2
         Y+Qg==
X-Gm-Message-State: AOJu0Yy7fZn852DvDRYm98oKLooBeDL786quLOWY7zX+xTpeg/U1MKxs
	tlzLUQaLkAkh143wXQ/Fk9mutbfXQ7aB8i55qdDi5ncUWVpn7KenARnvd8Sp3g==
X-Gm-Gg: ASbGncviiItQ5DUAyept/7+jNhDf4cleu8VSULfnytlD4Xylv7rJDWAQ2/qL3CWE7ex
	zyX3vlcL4hZfDlZKkT+cMB2GuNYlIgn/dRDJgpGrveGZR45iFc5RkM3Y20SEeCb55nsqQF+KoG6
	/QpOYNpCWX+VjrnnDMjYQARmprnqgRYdcYZ25Zt45czcTxlCKQqpbIcaRIRJutKgxqT0foWOHWL
	cVAjR5TD3s7ogPgDnWzExH8DMEsF7iwl9i08zBQagQvdJmrCLJ0uqmlSoL5ILqhn0I2TTr5IFvd
	xp2SiGPGffuD9Xm8DJoxkSJH8LCvoh6yTsttdXENGZjD0UdryJOs5mdH5JUzPaqJmDVdFIVM9GS
	yR0YqKxttwVhJvXovMFivntAvhsxLF99ic0Y5kRIODod3aqhNWx1NfQS5kzQPwsquXoxc+a7viw
	3NWcdc/0lDjRvx
X-Google-Smtp-Source: AGHT+IEfryPo5AZvNN/TNnRhMlkCD4KV2Nd+OZ1cfvd+ZU3C1hmSFj+V7TZd9yqiYBmXB9lX3kyE4A==
X-Received: by 2002:a17:90a:7304:b0:343:6d82:9278 with SMTP id 98e67ed59e1d1-3436d8292f6mr9299462a91.30.1762832560602;
        Mon, 10 Nov 2025 19:42:40 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68bf37bsm19434060a91.7.2025.11.10.19.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 19:42:39 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org
Subject: [PATCH 0/3] Initial ESWIN/EIC7700 support
Date: Mon, 10 Nov 2025 19:41:08 -0800
Message-Id: <20251111034111.43973-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_194242_875546_E5B0867F 
X-CRM114-Status: GOOD (  13.25  )
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

EIC7700 is the SoC used in HiFive P550 and Milk-V Megrez. This SoC is
currently one of the only off-the-shelf board/chips that support H
extension, although it's v0.6.1. It also supports pre-ratified N-trace.
Add support for it so people can benefit from latest OpenSBI features.

The device-tree of HiFive P550 has been upstreamed to Linux:
https://lore.kernel.org/all/20250825132427.1618089-1-pinkesh.vaghela@einfochips.com/
However U-boot is not, and there are bugs in vendor U-boot device-tree,
and also inconsistencies between the two. Thus, this patch is coded with
the upstreamed device-tree as the reference, but tested with the patched
vendor U-boot device tree as `FW_FDT_PATH`. The patched vendor U-boot is
hosted here: https://github.com/ganboing/u-boot-eic7x/tree/eic7x-dt-fix
Refer to PATCH 3/3 for the instructions on building the firmware blob
and launch it through UART boot.

The major complication of this chip is that it requires certain memory
regions to be blocked with PMP entries to prevent speculative execution
or HW prefetcher from touching them to avoid bus errors. The logic of
handling PMP is therefore enhanced to support TOR entries and allow the
platform to override PMP configuration. The platform code then properly
set the SoC/Chip specific PMP entries alongside with the ones passed by
generic code in lib/.

Bo Gan (3):
  lib: sbi: allow platform to override PMP configuration
  lib: sbi: Add pmp_set_tor for setting TOR regions
  platform: generic: eswin: add EIC7700

 include/sbi/riscv_asm.h                  |   4 +
 include/sbi/sbi_hart.h                   |   9 ++
 include/sbi/sbi_platform.h               |  33 +++++
 lib/sbi/riscv_asm.c                      |  75 ++++++++---
 lib/sbi/sbi_hart.c                       |  27 ++--
 platform/generic/Kconfig                 |   5 +
 platform/generic/configs/defconfig       |   1 +
 platform/generic/eswin/Kconfig           |  29 ++++
 platform/generic/eswin/eic770x.c         | 165 +++++++++++++++++++++++
 platform/generic/eswin/objects.mk        |  11 ++
 platform/generic/include/eswin/eic770x.h |  49 +++++++
 11 files changed, 383 insertions(+), 25 deletions(-)
 create mode 100644 platform/generic/eswin/Kconfig
 create mode 100644 platform/generic/eswin/eic770x.c
 create mode 100644 platform/generic/eswin/objects.mk
 create mode 100644 platform/generic/include/eswin/eic770x.h

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
