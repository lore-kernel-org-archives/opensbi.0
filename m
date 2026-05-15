Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0FCCD4F42
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 05:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gmHSek59de7/qRgkekzwFrH7ERlBOJkgUdxwZYOTbKM=; b=acoHSmdbdsF4Xe
	KSkA5+/vk5CoW7fMWA4C7uonUiCRcjMjr5RH/vepFDE7CO4pEuzhbiC5vvYhHJVaytRfAs126G1ss
	AAQB5lkZSZlMu81joc4E7NyS71J7uKfcQM0dg6lTTh+QVO2Qzkwsx4/9YaFo/k1M6caVUI5b3qjit
	i95HYhz9y0/VOmHV6TRxMI+S3KIWh7k0VBpV0xYksWsyPnI0Yid9QNHSgtUagRO2A2S1XiWhpQje5
	gVllHvf6/+kgYyoC09ZAaCn+/QncQawueNrAVhLS+0KpR/ijPQGzRjHYb+4/Aw72JQ5O1UNwysF1j
	dyAEcVVR2nICdPnhc0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlJQ-00000007QoM-34UA;
	Fri, 15 May 2026 05:42:16 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNlJO-00000007Qmn-0HRw
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 05:42:15 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so296651f8f.0
        for <opensbi@lists.infradead.org>; Thu, 14 May 2026 22:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778823731; x=1779428531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WjB/rEHt+Ria9vnkMJEFv9kd372qrhmGenep8jzat4=;
        b=CNZW2jY40pCVMa9+VVY8OOLaGLeBIJ0rSdn/CnEB9nKIj6q8iLx9WdBMjQ2F65GwDh
         b7oZ0aX8pg+CEfCZhSZ9d92Cu6rqq+39nXlkJzbyRoHq1ZQYY+NB1SjRcL3djkGutmnX
         7NbY7XevAc3hEcrZzumXV1tY3CGXRuJlx+Bd+AMsbWF3SYbwkWpYb20HO7NApwrDPpo7
         989HHbK4Cx/4fqFe+DP78rWBbqkjr/1OibbbIzRB0mwDj6Az4ybGHYq6zG7lScTxzUqy
         RuOgdjRmQa4o3OWTc40b4heDbjZerp32fNKME7Y08i3M+TTY2H/2Ec8KfETlXOZQD9aL
         B+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778823731; x=1779428531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WjB/rEHt+Ria9vnkMJEFv9kd372qrhmGenep8jzat4=;
        b=W9WFYfiT1Is9eHKdR6fY3AyGcc2BDfLbM+KPBo5U+FTBptxsuA3skIKhzB+hBFRW7B
         ZUzP+5lS5w7JDgZ7n4UpzUdHrLuTFcfiHwlT1RehsDo5A/7kbwF+XrhBvB/JwjSV/J4/
         ojjclDcB/uE1Dq8Y2caytxbMNT/5ajk0WJfnhgfkUNbasPpJMj+NSxz6GLYW+CN7HQgK
         WnHT5qk5AQ37QwT58mQ8Lm4HuSGH1RF2Jc9Rh/DyaFJI1KFp6I8ShFlDjeU/iOXUt/k6
         jEOn+XK9F8KE5kkb2WRft3K6y0moTaAc0/0C/o/FuSonIaeSTbjldd4vTaQ9KsS8AG7F
         IwKw==
X-Forwarded-Encrypted: i=1; AFNElJ9TGdcYtj2tasb7YMbQKANvUAdBU+d2TRavnTFacBmOo+fKpsBkxHOPJhnP9xUJmypIZWRMbE/y@lists.infradead.org
X-Gm-Message-State: AOJu0YwdGHuLo8tQzXwKtxJO1c2ACBlCwg4tKJ+LDAV2Rb3v8UJbCq48
	/mId2rqBbBosDCxaE1BirfdE/6CE5QK1T9HO9qqDdQsHOKw+MJ7O/ropptyCODyaqYI=
X-Gm-Gg: Acq92OG6OaIFeHoTlVjd+Hod73lb6qIrZPFrZuSqPRLBCmEI/7+3ybQ9N2ZrR2f4Xsu
	riS3XtAVbt/2cMrXA0c/LX4teiwvHmqaQOH1cYGSiXv96Otkm8uMzB1jEshyQ2e96erGd+vf+T1
	T+5XiIBCyN8kyskEA8W+n5Fz/75yXi/aTSxdheD4LTIeg8AhFkqwmWAnK4ghDyHvkB6ssRFFAd+
	5qTRIEXdyOE7JrSkkqbQ1wGpNtcz53CRcQmrSJpIMhinhRZfss1CFuM9yC/jOswg5obxkPDCf0g
	xr0zFofR69ztrePIeoDx5H68VI2blVnwfvMjKHepVI66yi/O7+ymrW+DUtUGZPJD949dxQeptR1
	bXbO9DFIX3bxaqvTzSqQ5JBEZqweooWgizjm2YnJDLDSv4XsFho+s/UdZCtU3SPBmlXJhbRiEvo
	u0y+bd5BM1SRUpMAnMJT8YWS7fUPtBJBu2pp+0z5PlYK7yWuQ7TN4RDyJNnK5TlqUVM2c=
X-Received: by 2002:a05:6000:41cf:b0:450:b422:8647 with SMTP id ffacd0b85a97d-45d9288ebc2mr9654699f8f.19.1778823731564;
        Thu, 14 May 2026 22:42:11 -0700 (PDT)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6449sm11456536f8f.37.2026.05.14.22.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:42:11 -0700 (PDT)
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
Subject: [PATCH v5 0/3] Add eager FP and RISC-V vector context switching support
Date: Fri, 15 May 2026 06:42:04 +0100
Message-ID: <20260515054208.151045-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_224214_360624_D56003C0 
X-CRM114-Status: UNSURE (   6.54  )
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

Hi Anup,
        Thank you for taking out time and reviewing the patches.
I have added new patch to add Extension V, F and D and their checks before
context swtich

The changes include:
	- Alter sbi_vector.c to use csr_read and csr_write
	- Added another patch for Extension check.

I have covered all your comments, please can you have a look and let me know.

Thanks and Regards,
Dave

Signed-off-by: Dave Patel <dave.patel@riscstar.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
