Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DBFCD4851
	for <opensbi@archiver.kernel.org>; Sat, 16 May 2026 22:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LqVmpm7cCnAKap5DnGjDZipo8ry+SniIqSZ+zbcRsWI=; b=zgO8W2qHEHJrG0
	5FcrhaQqJ6xyEOol37Pjho3OnAX7T9gTdCc/eeOorPmgqCJyhNwWGyWryh1slKrzumJruGPoOEp6W
	ZjBWFc8h3aAa+PF7Caem6RxV06TPQNcdTE34VPr69FY2hAmjrm8NEPXZofAbqh22uKYI6ckPrOe14
	6sjyqy7APbeyRAHeaGYvUwT/K81Kw7+9lY6Fv+O0C55Ug9C/ecSSGtlc8BwrBfoyDKN5xw7k8kZx7
	5JR3cM2I8yqT0Y8ZjTiq8cHzArcsbqKKHSOqqIRauyBENyoUOjefFKIrp7Z3Swd6wPFMjbpaez6ZN
	6fsfowRw2F5wt4hWrGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wONOL-0000000BcQU-1oTF;
	Sat, 16 May 2026 22:21:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wONOI-0000000BcOj-0l7Q
	for opensbi@lists.infradead.org;
	Sat, 16 May 2026 22:21:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48d102471a4so6860775e9.2
        for <opensbi@lists.infradead.org>; Sat, 16 May 2026 15:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778970107; x=1779574907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anOIIhfJPbOIqLufY64EqjZHFmjWpJRryqfnc0s61Og=;
        b=fcdw9XOUg89foQJnzu9K2DJtbJThNjAHLLO2z0a2sLRJEoU2JvIcDu4chyl6GCVDXy
         e/dLDDz/OT3XncJv+lGeZ4agbjzPmNfdpyuXyP/j+Wypx8L3y1B0s2joj1w9qMKp2ya0
         PN4+3S22mNH98SbPQLGV2aStAZKa+U4i97iilGludjJ6awqFNDVbe/JU68RaQL4P3Nzb
         vcIOzQvF3JdK2G+PM6tMdcCJ1ADq7coE5OMzQl64mIYYJsXQbuS2xZ8RFZThIUEa0N53
         yUEv2Wh2lUd81MbMvsIWvNI6GxY1acu2sl/AMORJqWXmlydvmLVRMA52/7Pl+tPfKno/
         w5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970107; x=1779574907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anOIIhfJPbOIqLufY64EqjZHFmjWpJRryqfnc0s61Og=;
        b=pcai4rYY7ael47t4o+k9qIIKjr7+ag0QIW0dWexQH7jjaGS5bPeFhUE4IyEteRyyv5
         MVLeZ8CX8WhCV2pQbzEtmpLACuCUDjwszjr/60zaILpOApM5UwW9yCAJQLZPEouwgtZi
         D+wILQn2b9wVJKIqu0eyDnrCALswZJcwBr1q48KkxNALvqCZN8Nvg0wtSZFyo7FjU7us
         N/pTCgvDxTu6ZCiQnzCFxW8o/rnxg7qYsGT2BQ9RAzxm8+RLdRD3XSXRDIQEiq5s8D6m
         bPwxS9GKxtGiFwMK9R6Xj3UYxzarGhi7d6bcdJ9msq2w30352pkPlnlmCl56kpcvwi+K
         hKAg==
X-Forwarded-Encrypted: i=1; AFNElJ9mL8Z3fT8wtBnkaoyQNy/niCRRUSh8L2Nzk7KUg1xfGytn6pu8ikZUrO5dx3gnSvdHlCL5muiF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcpa18dJwNZlE1XZqAakZI9/wCkNvhsDv5EUN7iacw8uQZZv5L
	2aPNWgDlyTYQ7alFvXDqU16qlJ0g7MfXiDxfvprB4AQLotAebqdRJjdcJ5AmFQcOgiI=
X-Gm-Gg: Acq92OG4WVpBAvg2hkMuE1oDcqw+Sitft/VN7ABKvFilqDT4RPXKBpEjUSZX6osvgy4
	q/Nzbyob/lsUnOkVqcV9l4gOau6VQzNdWGyYeNyJBPq4xsJHx4FN10czNeWzj2EfkHwxiKoauYW
	2haEGXdUPKFjfjOdNqrRG5pvPLXROOmJYfLfRJS7cP7Q4zmzk1baT1fL7Zh6v46DGbAcTY+Db4X
	MK3w5mXFy7gi2NDKdqCzqKmHxQrmYulGV7/NR7TO5FmdgckKxiZL8F8k2m/g5ltV0RJ4WaJKCyY
	oM7Wr8cSCSbApsB7C6UEipmzJ1FL3TxYYFNzNoQUZsMNUMESrGAD1COjpNEsmSK7DkEq4zEYnMM
	vUKxZxOr5QTcDR0/R/8fZGVXln/V3hDLpBAg5oYwAD21caDWO84WnOCSAyTbsXDMAVx2M344SAF
	3HBSkLbTpdS99T2YCkCkkN9V/NW6uH44AZjS2oL/ieIbnPmL9ieTvQTcqsBcU9kKSElzzzSZqHL
	E4u
X-Received: by 2002:a05:600c:35c5:b0:48f:f64c:c314 with SMTP id 5b1f17b1804b1-48ff64cc4d1mr61777385e9.30.1778970107019;
        Sat, 16 May 2026 15:21:47 -0700 (PDT)
Received: from Dev-EliteBook.lan (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe58638sm43694305e9.17.2026.05.16.15.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:21:46 -0700 (PDT)
From: dave.patel@riscstar.com
To: Anup Patel <anup.patel@oss.qualcomm.com>,
	Anup Patel <anuppate@qti.qualcomm.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v6 0/3]i Add eager FP and RISC-V vector context switching support
Date: Sat, 16 May 2026 23:21:40 +0100
Message-ID: <20260516222143.23619-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_152150_478755_60E3BDF6 
X-CRM114-Status: UNSURE (   7.92  )
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

From: Dave Patel <dave.patel@riscstar.com>

1) Moving FS and VS check for MSTATUS inside save and restore of each functions.

Dave Patel (3):
  lib: sbi: Add RISC-V vector context save/restore support
  lib: sbi: Add floating-point context save/restore support.
  lib: sbi: domain FP/Vector context support for context switch

 include/sbi/sbi_fp.h         |  26 +++++
 include/sbi/sbi_hart.h       |   6 +
 include/sbi/sbi_vector.h     |  28 +++++
 lib/sbi/objects.mk           |   2 +
 lib/sbi/sbi_domain_context.c |  37 ++++++
 lib/sbi/sbi_fp.c             | 215 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |   3 +
 lib/sbi/sbi_vector.c         | 138 ++++++++++++++++++++++
 8 files changed, 455 insertions(+)
 create mode 100644 include/sbi/sbi_fp.h
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_fp.c
 create mode 100644 lib/sbi/sbi_vector.c

--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
