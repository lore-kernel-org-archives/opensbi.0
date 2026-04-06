Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EDEF46C69
	for <opensbi@archiver.kernel.org>; Mon,  6 Apr 2026 19:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dIjUJXrp69h4QSNPQvuf9BiSAKbztULu8RC9gmLW9Cg=; b=O5+h5lSrHfciqk
	t0CtBtlcJAqCQ/hmIB/9b5Uh7XtJVjxfPuhhpsTfSmqIpJzvHXQCUTAfPzJr747buq9jrQIUVpqRy
	LX0v5Xt79EFfORYkx/VQsagrScUkz+/Byxf329sfW+PtsOvxuPdfZgwYbgAtqUSdmYZMTFjyWVm0H
	+BovRF2HrRtH2S35o38Pd3VaLWRio8FB+xsO71gQ0r56aH3kCANjVYMqXZIkNnV8JszUSLo27IELz
	Hnwp8hjijQfO10rssoo7aqIAMvCVv0qWiCTsj5JY7JMesw0I0/9aj4kNZHOBBY1dFa2DIko8UeLPu
	432zazIeXS5Aheuc2SCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9pfi-00000005SNK-3IKG;
	Mon, 06 Apr 2026 19:31:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9pfg-00000005SMC-2NQy
	for opensbi@lists.infradead.org;
	Mon, 06 Apr 2026 19:31:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so20581815e9.2
        for <opensbi@lists.infradead.org>; Mon, 06 Apr 2026 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1775503898; x=1776108698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7KLSEVQtuxPgb+5MSlirFZ8S1WkdSVkUQZ7+FEvkHvQ=;
        b=lNFPitqhdq/4EkvujC46cqBYy6cfCixjxpxbYRjt/nqkAonBGF0UdvTougI4/qPTiw
         25M9DKir9TOj45SUwLYHI8o7JvHq/Wmi0ws6Wh0vs0FgVMwI8qjhjwFpxJVmLGTl4LgU
         7TedKhX/Nj/LoAdJ5+St77bw9+sakqg2UkInmL73gxgmSNsqpkeNXgGuaD5IFR/T845z
         lPu1DfrVmOoMRTl5QuuZxU8Vh8hOwbuWH3ylCK/jvxz+XcVllYOV7JWyGOjoF+bCDCAc
         3q3WgJbjH0HlIJbzGYWKlFUs75XZ+EZlypj4LvqyO4fEoxOvE7jKi3agOThb+W2kqcpa
         W7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503898; x=1776108698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KLSEVQtuxPgb+5MSlirFZ8S1WkdSVkUQZ7+FEvkHvQ=;
        b=ezEntbeMIakpgpR2s2dbKvk1LjRPjNJHb9RxcSWcPHlgWEWeNot5zgw7q7AeSTkE9x
         RaUhL0xYuIR3gjXaiQ1aO/SW9vi+N97g55iqa6RgOQu1LXwnuAPGfRQ4S6RTsv21dWA+
         FbhBMNFBNWT57wEC58OYzS0yKiANNor7zWz0WUyKcHNkTBpo72j5+J3iryyZYWz+2MSN
         IIjRJ+Idqp5UukF5HCgCTSPH+SUdwrO0aVYOpzz2Ar/TQ6Ld5Htwx0aeGGzBQQpncT47
         kmD9jQSdtGpeFXZ4WSI9T/oqksBhTH3G/WM1WS4mWitMAKCxqMkc4uFCwLdq7299zv5i
         zifA==
X-Forwarded-Encrypted: i=1; AJvYcCU1WBOLEkZX7O971/jSdDb98XhMOq/sAySwcwGb6AIYVS6v7WZoRG33Hhz7jqNonhN/r+t6U2Ov@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp0NZtvCVEfg2euKbXelB37fiLk5D2gmU9Y1R0VbLOy1GGKBbF
	UyqBxmb99xpQHfQfNrw/U7ceKcMpeos/7btsj6AsJcByYD/5F5pvfk6WutL1+uezdf8=
X-Gm-Gg: AeBDiesZIkFbuR9ZVOtEw7JBDm78OBpLvnnKzXCeJhV/nooXl5Z3Ypjy3hk7jBALlh6
	9nnrvshEWc9r9PhknlVGRIvR5UVapMY7NL137bZwu4RKjr89LZAU1p4161dfdR7kX7B6COmB+og
	ORKA7qzl2GgM8Q0EUuRnQEIxR4k5NI05XSbap36J2TIUMx9mvLhERax/fOdv6qbyuVydsb1VlaK
	m6U5D1Gw7pG9Wl8oC0MSFyyqenx+7iOLtYIdZDnLfljFOiTIJpsFHTJSdmPWrIhXVfMOGN2cy4l
	I8sv8Na0FO81x59uD9dMHOfaviclzfM9Eh3QqvDFta8fRWCn7RLNroIPyi0Pm2VBmPsqD6lFXwE
	RQZ0r497osUOeC82WH68XAqtwkkCQiPQZVXoGhhJP+ba5ow7HPsuSb0ncv7DYNzdQQtygR57TaW
	CcEg3MpRQz+mow5rOEJQfJUM7rGkkx8MrxZPMk7fD8tHBWl5Dk8lYdOs6ebYiDvm/1Xy4nI7CGK
	sNgeg==
X-Received: by 2002:a05:600c:8a6:b0:488:9db9:5235 with SMTP id 5b1f17b1804b1-4889db954c3mr101968805e9.22.1775503898054;
        Mon, 06 Apr 2026 12:31:38 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm511130155e9.7.2026.04.06.12.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:31:37 -0700 (PDT)
From: dave.patel@riscstar.com
To: radim.krcmar@oss.qualcomm.com,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Scott Bambrough <scott@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>,
	opensbi@lists.infradead.org
Subject: [PATCH v4 0/3] Add eager FP and RISC-V vector context switching support
Date: Mon,  6 Apr 2026 20:31:30 +0100
Message-ID: <20260406193133.658066-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_123140_737923_B9FBF2EA 
X-CRM114-Status: UNSURE (   5.73  )
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


Hi Radim, Samuel,
                Thank you for taking out time and reviewing the patches,
has been some insightful comment and appreciate your inputs and feedback.

I have covered all your comments, please can you have a look and let me know.

I have tested this across the 2 s-mode domains doing context switch and both
floating point and vector retains the values across the context.

Thanks and Regards,
Dave

Signed-off-by: Dave Patel <dave.patel@riscstar.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
