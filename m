Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8631EEDF17D
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=df82o/7I+gEF+7TBkrnJnkM6xtceHyymOCUTzZdc/DU=; b=nxVInQ8bhRVixq
	G1ekMeTt7eHN5Om4l/595b28pQpPPPtkLrzgFVDTZ0D7i9FnJz2advwVbVHzlbHrU7zIj5n60ArMc
	+rpwfq/irY8vfIpySG7kHreIvxJUcXIlomzQCWXMCmklXaVNmazXYc2o20iv3UB7EGHkvPenM2rhQ
	FGquEZ6KRKyuKotZ6DmiA77Dwwismhu3VM+62kaxWjLF7H/PDNCQThVl8VwIwSPIh0HdOhR9lgUtF
	XZGGD5muztdA5fSKwLBx9Ped42fT+HUsjruQBJJ57niOOGvlSWVwdpPSzXANgF3/JtpofWfogdRDu
	ny5oIwzOwobauE9lga+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwjQ-00000003jA5-49yk;
	Fri, 13 Feb 2026 17:13:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwjO-00000003j9k-24r4
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 17:13:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-483487335c2so10663395e9.2
        for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 09:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1771002804; x=1771607604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9YD7ncWEPh+4bqB5wQVX0N5WEwpCNyX2DmxxTjzTjw=;
        b=0TR6arNFRAP1TuCn0Kk2gMgrpHGMnvblqhKxprLe9PF+rRRzYwVVRKmrAhMJrJrJbQ
         GT6rHFGNcArxkkrvpzGJWv/hhdtHRi6Yr7Li+bXv4RJpxrnWYKVRaFX0xUzKc4y+Z9db
         HNiMnNu0AtHQ6BavcP14EGOfZ79E1r8mn0YItQf6jJgincMoZEtJVUvOgAtjiVqqwxXo
         kEnowBsN8UOHKAGyI4+2bquCYE+WCfRCjBw778Fj/87qfLR1KHNsZQM6pSNsd+Vw2Y1Q
         Kpv0ENfB/K/GaHX8JEIFMBBwHcT5IspOeBY0YqsdLYR8YSuYIdznQ7dla8QIrOWW2Ekw
         pe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771002804; x=1771607604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9YD7ncWEPh+4bqB5wQVX0N5WEwpCNyX2DmxxTjzTjw=;
        b=nd8TptYrUgFhoFbtsVXuRuSDV9QPUeHzOl6Z+fHWwRohBY1+w7ZSh5Y4YoRx7BpiAw
         wgbBUsg6FUyzJiHmMMLHo1nukoQ0oWJir5Vi2xv2s1C+VeRvtOjGbMjdAso7F7yqSIRH
         hT32+5WhFe+wIOjfORTeWHNElBhgS3ZqWigeMUlV3gclveOhT9LcTlAXC0j6xqQnEFzS
         BiWrZxlFr4y9466zD70IjiiDnmiNKlcYo+h9g9F/4noR6rJlKWF0vFvaM7rdPc1875/N
         bcxyjUeMNh7eP4WMMwqhhBBFJcHyE6b5/IaCG0C7a/4OxMuBL7bzG4KrvD64ZJhDnk/1
         A7FQ==
X-Gm-Message-State: AOJu0Yw57JPkCuaP6Cys3KASwcww6RkZaY62v3uw4FS6dNgZ538v+dOg
	1QIw8TPgUj6kmVo9qvbwxlZxZgBHTYIXKjAluXUipj6OzXZFG+HX7DiOb53NcA0MWuUXQ61WXIB
	24URdBPg=
X-Gm-Gg: AZuq6aJ64m+qceeLZ9KrjjvKi5Tn5VQ6DNPIxUrZ+CJxNcYDOHpOek0QcbvQZ/ZPkVb
	1zkA22AtWZAx3ykEt0oYS6CNhRrbaNojfNE1ePQobYiqpRiHw7FMqhbVDqeYfMGYWD4YK+5lSFD
	wEeXAYV5LGSP5Qu/DrDsMmhicAIGY6/ucxNNLNOmukXInTOolkSYOR7vhlVdkdgnX0DYZJ42wBH
	7B5vJBKZvjWH2MIZMHjzcAkKOsQ+RbV6iGcf5Cb4mjR1M7zi+MTlaXLGzWU8qPeQQ0qx3RK+lu3
	bTSTnyCpd32T9bC7442Tot6Mg9ur7C/dOO3q2vXzyZ4GtMb1noj8YOB36tIVHn2CQDKCJm/3kje
	efaMMWuUrXpjYiUmbpmX+sf8oDR4d0LR3BIfq7BhzxMWfE6rQAzboUfCSYxegnoVVFtetFUH2zR
	9WlsyAZdCu4/qmNNlei9UmtLrAgCQPcNT+fr9+9I2Mr/4NPHGil5My1LcF8bzlyHF3VW4=
X-Received: by 2002:a05:600c:6989:b0:480:3a71:92b2 with SMTP id 5b1f17b1804b1-48373a44055mr42739905e9.26.1771002804149;
        Fri, 13 Feb 2026 09:13:24 -0800 (PST)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836cd7af87sm112223445e9.1.2026.02.13.09.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:13:23 -0800 (PST)
From: dave.patel@riscstar.com
To: opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>
Subject: [RFC] Ecall based Emulate support in OpenSBI
Date: Fri, 13 Feb 2026 17:13:22 +0000
Message-ID: <20260213171322.244015-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_091326_805307_E8DB09E8 
X-CRM114-Status: UNSURE (   4.06  )
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

Subject: [RFC] Trap and Emulate support in OpenSBI


Hi all,

This email is to propose an RFC for 'Trap and Emulate'

This is an alternate ecall solution which was discussed.

The goal is to provide alternate solution while we await proposed solution of RPMI System MSI over SBI MPXY.

Motivation
The design is done based on ecall ext to handle the trap.

Regards,
Dave

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
