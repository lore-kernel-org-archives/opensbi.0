Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2F8D185F3
	for <opensbi@archiver.kernel.org>; Thu,  8 Jan 2026 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1+AzHV5QjjEpD7vhDEQ5gcAPE8V3Zy6aNa95e+3m59w=; b=4Im
	T0EkZvmPaA4aRcarPZgkQZE9Z+5Qr7Cf4kBdP5tcGed0ajaIHBij7QBmS7/nzyg1Mki3rY7UiDov2
	cfGMTQ+P8Mf8KIqTr5ZRrNom4WAedk5fTxN0UVoo7fR7S9NjIuh7vXxLrRfdoCvS2JlmGihxpKX+8
	yg4xUT1e2NB5AfYgzXokokdFUZ5Qt2rDkor2LuZRffgbXIU0D1Z0ZBXGbFiCSweAhVqP2KJk8cUZV
	NPfMFaQ/HNZ5mxp5tDWywCilFct7BF4QdE2v/hJPtH0yy5yHAY8zh2b7rzlpmUPg3t6HjysCXE3uo
	M0yokXKPCb3vcjEAITVY5jdMi1rhsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq6H-0000000HAUb-0bKo;
	Thu, 08 Jan 2026 13:30:53 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq69-0000000HASz-2Yjb
	for opensbi@lists.infradead.org;
	Thu, 08 Jan 2026 13:30:51 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-65d132240b5so1828724eaf.2
        for <opensbi@lists.infradead.org>; Thu, 08 Jan 2026 05:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767879044; x=1768483844; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GcNocJCo2Sbatk4SNAvVng3d2WRhv4CVp0CFornrrAY=;
        b=xjeNpEw1EycHxCu7ngtCAc5Vb3IH3p9WAzeYKHRCJaWH48ItFs5RjtvP9X5HNLfrYY
         VGa/JhbgqQO9pRozRLN7jD0Ao72ARxZfZGFNnm6AErlr+20kcuKfmqj+sM8cRHB7c2jD
         YHno6TQ9kJnEGX+Tyg5nJNWkFptvZ9gKZAw3GqRTdwecpw9lvv5OkrJk5w46LuKIubGi
         nDIFPNQtDW7+pqy2ATYIju/2qeqDbMSFTSseKOAEre5d4dJzcP8eUH0DYh1y7bG8qL8L
         MB0DcevB32UY9tl7k9akM/eHYOwSixkDQkswzuhLLQgq+gjbftZA6vpLyv+dwq2WDu5V
         945A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879044; x=1768483844;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcNocJCo2Sbatk4SNAvVng3d2WRhv4CVp0CFornrrAY=;
        b=GL0WuAuh38R6Ksd+fsVuwM6wIHgQroTIYXhukscrvp1jBVq9YShXyz3BS/00uSiFD/
         j6A6cT7k6cKtFqQtuli/l9XcePDPjml7CivLHg2DRMxU0gWYVoB9AIYdW7Shlu+jmLeS
         Nj16lbflndHyeWiS1b8O7hdeyyntgdZNy9DkPqg2YuCzwyUG7dRX/ZdqGR+nnyX9iaAm
         RMj8xY9pX/v9rRfmhep+0AfdKao1wbQbiW9yl2v2laB22JEt3gedO9ds4vxkfLeM4AZD
         qozLLpMAl4z8oPEGer6WoQztf/GxRsXK/J+zMxL1gm8cvZtOfsriiGlJ2WJm3dKgVp2r
         a1Kw==
X-Gm-Message-State: AOJu0YwdoCOAltOWAHM1rU0S9MlJGIHFQ6Y7vnVFqMepn6AP+jTXtcaC
	C7vMLhMsxjyHUHvrhJhKFz1pIcc88iccO2uz+9+O1pr4lzrXmXUVd+ZMD9U0mL5dugekVrbGnyq
	MWFTUbcrAUld/Udkb1dvhjluW0stJutTzp+Ocm3rEnY/mD5b3VDnxT2wKug==
X-Gm-Gg: AY/fxX41+50ErA6wN1WFJBkoE58fk94vFsUMSgL9SsdS4Ic+zymdNrO2ZUvzbXY3x4L
	EctY2o3MGph6knW39LP4pUT9PxZ5CxfekWO4AlJYl1jakDqKpfCfkuioslrGDkUnwGXnh74uStR
	bpXfy/kAXblG16GYbJAFMEUZos0XCtYi+Ct0c0uRrM7eDxlBmZ3c11epqfkj1BKIbyn08Hm1cqM
	+bGKa4XMG8U/wj3qjGWvl1tLg0MGcAdC54Sz8gZRH9XZtT68iSCT2JKDvEdaOa1LUBvkCF4ne4c
	PLgmTknJuW3NPQmG17oxcsP1m0My/0Zk1eMQszKehISaqwoiDLJdDk2X9A==
X-Google-Smtp-Source: AGHT+IHdGcfmzTh6u+cqtQsYM7KjOuJI9OeBq1wNdz5dZ85XHKpBkzx7n1fTgt4hvRA5w1hoXfPkMGezBXn74KgxUn4=
X-Received: by 2002:a05:6820:1628:b0:65d:ef:b937 with SMTP id
 006d021491bc7-65f54f0d747mr2405115eaf.33.1767879043933; Thu, 08 Jan 2026
 05:30:43 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 Jan 2026 19:00:32 +0530
X-Gm-Features: AQt7F2qXrNABphcGNGBVxrbIn89DFPZ3BQNfUFnU_HlPKLbf32U8bhtxWhVs_sU
Message-ID: <CAAhSdy2j=cQxMpUMxwv7LzAn38bQDOPwuJecw-s+TymLRjwKhA@mail.gmail.com>
Subject: OpenSBI v1.8.1 Released
To: OpenSBI <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_053047_596507_93B26BAE 
X-CRM114-Status: UNSURE (   3.49  )
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

Hi All,

The OpenSBI v1.8.1 is now available on GitHub at:
https://github.com/riscv-software-src/opensbi/releases

This intermediate release has following fixes:

* Typo fix in comments of sbi_hartindex_to_hartid()
* Fix hart protection abstraction for platforms without PMP

Many thanks to everyone who has contributed to this release.

Best Regards,
Anup Patel

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
