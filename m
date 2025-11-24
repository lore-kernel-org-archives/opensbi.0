Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B17CFD356
	for <opensbi@archiver.kernel.org>; Mon, 24 Nov 2025 22:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TL0GA2Lq+lG61QH5H2gvEKRGOBE9zv5l5JRanOvGmWk=; b=kn1gxxOWQCVgH1
	YZIz8fIQUec1chV0Zbo3avLGIAra4r8N1+xEkPYMP0gqrO1EpCdNLKZQYQk6zhfG2phQ08E9ehVox
	+ATHxX6VrXHk+Q8xC7Ma8EFsCFDyjhGussFehRop3R3dgS8HQFOcLfgmRHLe55U9flfgx9KrTqHFH
	3pW1ZmkmgYdA+/62MXbKoYptQ8z7A6c3M+xdElqK7ZiF83o4wqJUKt9LqXS5Gu2//600ke274HlPk
	/oKaQlmKWZDB3+Y1DbxdZVgkKk0ZfQ2tCNyL6k8QvyUdX9lVpUuCcFxUP9/b32keq40oy5Wd6XNws
	ZkKNjuv00tTF69A4NvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeex-0000000CNe7-1NAc;
	Mon, 24 Nov 2025 22:03:47 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeev-0000000CNdm-2OoJ
	for opensbi@lists.infradead.org;
	Mon, 24 Nov 2025 22:03:46 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-11b6bc976d6so5979911c88.0
        for <opensbi@lists.infradead.org>; Mon, 24 Nov 2025 14:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764021824; x=1764626624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ds2dIqrPiBEF+UbyzjDBuJgpM0YPE21h1X0hJSuuAmA=;
        b=dLvhiVe2ldw8ntMQiXuuA8DpmGU7j+8IlibX6NXIDD/uV+89wktc8ZdXcWp76FVb3v
         cyrjzjCe0yPhpnxufcCZv7NWTNQhR4Oyi0opLzeZtZXvS5SV+2X63w83j9g03fIFqmtB
         PUYtqYPUrd7fA3yBX2HcFcOXXVH7ZlmDKcFzNaRjXLefxgV1REVLtaCi5LlsT0slEV5C
         yerXxp1JoeM60nnteDjo1Y/NYnRttcNcW+4beAPah57+3oi/Sw6EGxF/i//NyQ75R1Sc
         JRTxsjuwK2OOyNhZblJXjowlTGXQMLyxUjs2TnKp+cA5zmoeL8r343W2gDJYiWlj2XpX
         1D4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764021824; x=1764626624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds2dIqrPiBEF+UbyzjDBuJgpM0YPE21h1X0hJSuuAmA=;
        b=uvJiSpEcKWlxPUAZoRDDS2v0sZhFePk9nur/vUDDLB7K2tGpCg035vcOYuf+hUKEZb
         756S5Rx88kjsMSZahHFMSO+STt00v16vleBKbry5O33YdHPvFZxVRUQDZsUZZbziQoo9
         pIsGETGC8+rw5Ypm47xulgB9EPe38aacRIRUvbh5UEXk7hKQuFGILomHmA9hH6uVruBX
         ar7e4UPS8ZHUsbLA1vDEtDaIU0t2nWMyJwde+KseIdVBYCA8m/83I3q5U/rkTg6L6fYD
         1MfqTIFok6V9/+hTGDJq4HIxj2YBHZ7IybQB00JI2SxQ11nrYw0AqgeK2bVt+0ik+0qK
         wDEw==
X-Gm-Message-State: AOJu0YxFswnJaLMvIifb/WoKCoxTekt5leG+DYD+hoMB41n0pSTNgLLO
	N+nQunLKeab++tBDMedmQDARDBLQ+hQlgcz56OqQ6aOUFMMuvsy4BRWUNJq4ISZF4/IoLC0yPfN
	SJNK6
X-Gm-Gg: ASbGnctEDupjATIwFBm1+eK8q25kxq4E56cxGou7/g2mnkOXo/N64WY9INT/ah08lev
	KscFSfoFb5ftUVfoSKlcyvauIaia7vD1Y2AhODLPe9esFQRZR5ew9jfKvP29Pl3ojPorLevj6q7
	A1+MRGv45FSP/tyZFp4s3OGwhQyJSg0VWMmex09EkrZ+0cN55TaclOZ7a7I6GDpscTYvQPRQDfy
	BUdNAZmMcUY3IqbxfgD6M3d6RXFDEY/vHyFBcUAWp/cxz4WnhGgo1lk0VR2hTsMmY3zPsILFlWL
	AzlSsp89AZK75+PAMpufXruDQofLgz8yTmfADiMLOI+2gWbXWoZ7UgQwjnTN5B1X7/B4O5rWHZU
	ynVzzcYISeOsRNJdy3dafBliaE4W743c4heti7w2wSDr5SROuzX/BQuRfQPKiQFWHsfHPe7haWq
	rdX8yhcdVXXnNZS+aPp79bo0IbZlFATJU=
X-Google-Smtp-Source: AGHT+IFxFjWdppddnilbSW+W73kcpxI/f7m+d6y0jewSlcL8abkoo95Zuudi7A63/yMvb617v2ixUg==
X-Received: by 2002:a05:7022:1e14:b0:119:e569:f86d with SMTP id a92af1059eb24-11c9ca96a9cmr5522559c88.10.1764021823928;
        Mon, 24 Nov 2025 14:03:43 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11cc631c236sm1598168c88.7.2025.11.24.14.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 14:03:43 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH] lib: sbi: expected trap must always clear MPRV
Date: Mon, 24 Nov 2025 14:03:39 -0800
Message-ID: <20251124220339.3695940-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_140345_690892_6D894D0A 
X-CRM114-Status: UNSURE (   7.03  )
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

Expected trap must always clear MPRV. Currently it doesn't. There is a
security issue here where if firmware was doing ld/st with MPRV=1 and
since there would be a expected trap, opensbi will continue to run as
MPRV=1. Security impact is DoS where opensbi will just keep trapping.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 lib/sbi/sbi_expected_trap.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/sbi_expected_trap.S b/lib/sbi/sbi_expected_trap.S
index 99dede5f..8fbd2cb2 100644
--- a/lib/sbi/sbi_expected_trap.S
+++ b/lib/sbi/sbi_expected_trap.S
@@ -23,6 +23,8 @@
 	.global __sbi_expected_trap
 __sbi_expected_trap:
 	/* Without H-extension so, MTVAL2 and MTINST CSRs and GVA not available */
+	lui	a4, 0x20 /* MSTATUS_MPRV */
+	csrc	CSR_MSTATUS, a4
 	csrr	a4, CSR_MCAUSE
 	REG_S	a4, SBI_TRAP_INFO_OFFSET(cause)(a3)
 	csrr	a4, CSR_MTVAL
@@ -39,6 +41,8 @@ __sbi_expected_trap:
 	.global __sbi_expected_trap_hext
 __sbi_expected_trap_hext:
 	/* With H-extension so, MTVAL2 and MTINST CSRs and GVA available */
+	lui	a4, 0x20 /* MSTATUS_MPRV */
+	csrc	CSR_MSTATUS, a4
 	csrr	a4, CSR_MCAUSE
 	REG_S	a4, SBI_TRAP_INFO_OFFSET(cause)(a3)
 	csrr	a4, CSR_MTVAL
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
