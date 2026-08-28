Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6746C61DB9
	for <opensbi@archiver.kernel.org>; Fri, 28 Aug 2026 06:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pxTZpN6S5sOrcQwetTSRMtF2G4J955bBYx2D/EKqS2g=; b=Bkakh/Yv3Wdn4m
	9XcrmIjIMwo7VotZGmRsJxk77rctaM70F42R2cOS/OxZlaaXrNb4lVoNt6FTyzHt5amlyFn9zFHfY
	NAK4nBk5bUolvWDkm2JzS8WFEAjBV7ke2kynbLfGym90ZrNOUcKOTF5zXwvNur2nf4VDBlXa6TeA7
	ZYCxZBzbAMs6ZIYEMbejqnEbFwPI/FTbW025I3Rajgaad0SZNEsHV+4h1xqHzdP5ACu4sqdid9VU+
	MpE8xjTqRQNu+9A7g6Xq7JWxTVGCIQyW5I4ed+ljYmjTNt9vVFbxYHqYjhybda+eleVMsu8U+C8jV
	42pTXftVtEen0gLW8m9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpmV-00000005BPz-11cs;
	Fri, 28 Aug 2026 06:09:39 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpmS-00000005BOh-3OVX
	for opensbi@lists.infradead.org;
	Fri, 28 Aug 2026 06:09:38 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso519689a12.2
        for <opensbi@lists.infradead.org>; Thu, 27 Aug 2026 23:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787897375; x=1788502175; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bqVUyYyDGvBAbBmtXISQ7uBvdrlgpFIHHzUX6AzJl0I=;
        b=hL1/ZoZVXfQYNFQpgHOK1uWbi2TD14z9STxIsX+TlFzSoP29IUu+fVRcRCxIyDOyUc
         OvuFY3cu+ECTut9+TxcxRLwdmMkprJhqOpoF5MCHWYvI9fP9fIsruXncLx3P8DRWYPC+
         OA//D6USKVqIAbinxXWXidLFj/uqFYyRbUAHPr8lcugD1tUzGSvqOuww3oB3d8fimo7V
         4br+A460QkAQzPniVoh8NUusQ9fS5bPKwnJ24lB9YukCnhAq8j2Gdzfh0ck/T4vKxki+
         VTCl/7Br9rreDshkrJp775YX6nDiBG9xso210D6vmeI1dYnqdF1KIYMjPPWHoEVEvX1H
         a2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897375; x=1788502175;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bqVUyYyDGvBAbBmtXISQ7uBvdrlgpFIHHzUX6AzJl0I=;
        b=IwXj6koOJl1nk43gNASEHaWj0U8CYgiwYRdoXfzMXnJ1d/+RJM19p/QMFkkJ6G/VwS
         sqC/Jr22xVQVfnIvXtayrREpKIk0vgUTKdkl8ddmY9TuVwbqomlyF5zsNAjsxhXKDOix
         9AABN93ufBHllYEdiTlO/UNSum877boDkdbF8Fopxbn5BkRksGt8XaEIPte/gKCHKF1I
         qS2bbBsZzElw28gi+cXs6JkYeZ7VJMX/GbkLgEhS/aLqlYOOgl9S+AkC3jop/3Lmnk4D
         WvDBmmnR80f0oUX4KayYBh+/43wOqwbsq5gzYHqxxja73SLGrPxsi2YnZhnb9WeeP2ls
         kNEw==
X-Gm-Message-State: AFuF++n9LpXLq9f93h4P1tv0KNCl8k1n7+HueVYbGUWfjaTQUB0FV0Y+
	2scsg+kbdkkWbSyrtezu9ioYa7kAPeQ5HhKW2EUUucBHAa/YR3Pv8A6g7KezSTmoadP6SEEFpBl
	DjYGNwxDxQ4SGyEd4daoQZGVigAS/XT8I4X9fiLNC0wp64wGNY2my2M+QRYIta1yy4s+JyMB8cU
	W2XbygrRsfXGJ12HJ0XGfOkMbzu44UDgzzmfWq8Hq/syDSHFY=
X-Gm-Gg: AR+sD12cN//awKenm5HQQ86qE0PLrVx6LmYPHc5w+QctvgC90mZ4b6bTbJfsfFRIO/6
	WSWOTUKrPxfbcrzT1YsOssjxzn1f3mEu+zTFGXWtRU4u7REc/fxNvF6D95gpKlTGavY/TWVGFFy
	hovlaPMD0CkKKuPQW0oF+5BtNwwE37pab8c5pBycpiqEo9ystWGk2cxkMMRH/+Kei3fMMCdnYaT
	8Vn3NWS3DnAxMzI+lKk+l6Aiqh2TQDwGwwmvg9SDMq94Ots9Pm0EARFhXQdZ3t1B/ObyCXqLzX4
	qZ/fKsowIi9I1+gx1I5n2ovMgCqV4LWvl86upoehvJIm7Ep6Mhy3cA7s6jZEOh29kYt41dfWmqb
	sfRU/TxJnEjdLnNSovFp+CeS6CkzqN3mS8HocGAtwGIPPLhwGEo016wmOcaAY2Fs2QYB0UFlpF+
	ZcmkEB5uNXpRI69H+9VFOckV+DHs+SjbK4tGeFqVVrBtp3WCPrsGtlaD5efkh1KtkBdL6kHXw=
X-Received: by 2002:a17:90b:3c47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-396d0e27e11mr9760296a91.1.1787897375145;
        Thu, 27 Aug 2026 23:09:35 -0700 (PDT)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm1995864eec.17.2026.08.27.23.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:09:34 -0700 (PDT)
From: Nia Su <nia.su@sifive.com>
Subject: [PATCH 0/2] lib: sbi: Fix Smrnmi/RNMI trap handling issues
Date: Thu, 27 Aug 2026 23:09:30 -0700
Message-Id: <20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABomkWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMz3aK83EzdkqLEAt20zIrUYl1LQ2MT8yRT4ySDlBQloK6ColSwBFB
 TdGxtLQBVmajKYQAAAA==
X-Change-ID: 20260826-rnmi-trap-fixes-91347b53b0dd
To: opensbi@lists.infradead.org
Cc: Nia Su <nia.su@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
 Nylon Chen <nylon.chen@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=nia.su@sifive.com;
 h=from:subject:message-id; bh=bD7LtOpMKR8pjZ9QbsZRzkpO/DajgxJQVSTsM03wEu8=;
 b=owEBbQKS/ZANAwAIAYihNJa3+YfgAcsmYgBqkSYevU2xaOdfIZNGhfht1/EwuDPGLcoEubQB7
 laRCwRcOhaJAjMEAAEIAB0WIQThGl/T4FqBBU9NhIeIoTSWt/mH4AUCapEmHgAKCRCIoTSWt/mH
 4DSCD/4yK5aWZ+lIANlPDs+mp4ABdhPF7qkHp0raZY+BtfkVfow060zhipgy981O6lcZLRlTxL1
 OlBYv/aksPLoPt32LoTVNVqreOR0mu/9LxdNJqkAv8gZSKpxdjuEVzsGHTJDkDJ1Pt5y9Se3Cy0
 WsShy89GCTim3HFtDXu4iHOD6f3QdmUoDPkxYXiRJqHoWlpi7wmXIzY2Z8UOW3wwotdVEiBX/wE
 8KrAJT9SAPuCFmcokdjAfzxA3cfT4TZApsPOA4RnVpozzfeAi4flVVzpTu1LWp0DRRGEbzLMrpo
 Oo3zuQBaOxx87k+3DkNN0x/mveBuTgc55Wqhs+sVDT+1gt/iUhW7tXx0fXuEL+iP9RJ8QuxhDvF
 08OlWBYKxDbVU1z9suzbAoXf5Ovl7I2g/7QcxDN1c3GFsAOU1qJ72y1hVCRPZ1JJPwx9XdhiAx8
 5uOh6UH1jOBLu4MYfL6aXbeBBM0M7FNwIly9/sKdXEO0K2HKIZEtSWmusoBik8q2YGLCWYMIxHn
 RgXasB3WstxSf5fobR8H6k+E9P6/0ddsp2/O+TdbMiiXFRqTJ1gp95g206sT+7kfG9BqVT99hiD
 F6EL38blB+DRifoG6wVul3NKX2b9s1eNeepq7bIhNXiUOCE9uu5hx0C/yEX/T42A7FqxQjYJpa6
 xMXagqmzhPK7Ahw==
X-Developer-Key: i=nia.su@sifive.com; a=openpgp;
 fpr=55235C875092ACC578EFCE6CD1699E646B29B1AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_230936_876396_8B570F24 
X-CRM114-Status: UNSURE (   7.80  )
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

This series fixes two issues in the Smrnmi extension and RNMI trap
handling code:

Patch 1 moves the Smrnmi CSR setup into a dedicated
sbi_smrnmi_hart_init() helper so it also runs on the non-retentive
suspend resume path (sbi_hart_reinit()), and relaxes
smrnmi_handlers_init to allow a NULL callback and to report failure
via an int return value instead of void.

Patch 2 fixes sbi_trap_rnmi_handler(), which never updates
prev_context and can inherit a stale value from an earlier trap
that reused the same M-mode exception-stack slot. This can make
sbi_trap_error() loop indefinitely instead of printing diagnostics.
The fix maintains the trap-context pointer the same way
sbi_trap_handler() does, so nested contexts always link correctly.

Signed-off-by: Nia Su <nia.su@sifive.com>
---
Nia Su (1):
      lib: sbi: Fix stale prev_context in RNMI handler

Nylon Chen (1):
      lib: sbi: Fix Smrnmi init and non-retentive suspend handling

 include/sbi/sbi_hart.h     |  1 +
 include/sbi/sbi_platform.h |  2 +-
 lib/sbi/sbi_hart.c         | 55 +++++++++++++++++++++++++++++-----------------
 lib/sbi/sbi_trap.c         | 10 +++++++--
 4 files changed, 45 insertions(+), 23 deletions(-)
---
base-commit: 4e79fd7de59f1b2899092c1a84ce68c8ebc68f93
change-id: 20260826-rnmi-trap-fixes-91347b53b0dd

--


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
