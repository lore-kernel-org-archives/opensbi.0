Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C05D58E7F
	for <opensbi@archiver.kernel.org>; Mon,  2 Mar 2026 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r3Vcc8oAwXNPxu3am2VYN/Vr2V9JIUuxFcp1+UdL4G4=; b=u5zcqlhLNuB4zT
	FwXUHAS4Nl689uLFnme4NpeLjYUZz+ARb1rnqV0EqENgqDk3Mq8OcfmMvy+Xeo+7pom8wmx+nGaZz
	Mu4eE8bjo+aCa+W0fmsyzK4UlC7ALuGpy5Dn7JZfOKpxH30fOzno9jgoTumvvtSKep+FmVfsN/qhk
	F9yjv6lZn0h4TFUVxJDu6M7dZPtkKuPniK71fuaOPzxXGygl83pZa8dfG7iQLNT2GxNwjnqpj8UYM
	dnr5DurKXmsnh61e249vZIS5MjLw0N8rgZdSI1EMzK4AW90L985NZLwX98pFZLaLBmGgbFSj9JSIX
	tGhE/0Qa/hF6RGI6Pj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyrK-0000000CXAr-3mXC;
	Mon, 02 Mar 2026 08:42:34 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyrI-0000000CX9G-3vul
	for opensbi@lists.infradead.org;
	Mon, 02 Mar 2026 08:42:34 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8cb7edbcde6so539203385a.3
        for <opensbi@lists.infradead.org>; Mon, 02 Mar 2026 00:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772440951; x=1773045751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RWPySDT5EBd0fO8MtG8FyQG7HWFiLSqSLvZeQBkkpok=;
        b=b3wHbTT3U8wxcb1tTW6UgWchMSaAJTEEVG7drw5+TTKKmANqpQf0Nuz5ssefp5Di6V
         JosR4t9K/t/aK/3qt2S7384NyBxDlA5g3RZVycLrFIsdlVjzN5b4C8AFJUn/ak+uffij
         NO/9QwcBqKZM7dvXjykfuOhSlky2Q76OrvTOLIxSn9eCsgQxBYvPJPR1roSQyaWl62/b
         vZflKFbXtJpJLiH7OX5/cANs5H06JYU1oCbrteqbICkXqcm6VdOYoAd5UVVukqlKcnaD
         Q33EIT/qaA5LFfNCJmVKcbcf7c6RMa6wy1w5tfjSrkIKHQBKBZ5QUmB1EE0BKTITLyw9
         1rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440951; x=1773045751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWPySDT5EBd0fO8MtG8FyQG7HWFiLSqSLvZeQBkkpok=;
        b=JkPTvaf+knw/L4xj1Pl4vLO8BdzrXlrpNCv9BvUYTMekbtpk63X1NoQ8AvYGTk0KEL
         fFXnix+bUzhPQOqQtnEQXChsILPvY3rBgada9LQ9N1Z4HU4kQ8ysqzDldNMnVLZpMko5
         n1ZzUhDu017SaRA2dNbPN6C+e9Tn8ek5xO/n71kjy/pmRAlrbJ6nK5KG1TwnFQiIQSmv
         B9N3FMz42Q31sVF5EOjQxVOwu/Yz4+cHyKTG+Rb1EeR4doWZgQgMK6OQBpRQ2lcIkD9v
         FjPUNyKpYl8a7uk38YTcqjl+xz2hiYVrhRC7DfZnT3hTt8z8jT5J+PBF9xsv2ee5NZ0O
         rW8Q==
X-Gm-Message-State: AOJu0YwbtFSTBTLdzl/4PEUmqhItkEXsVfWDpoJQYNkDdpKs1RFCWBKr
	dxha/GYrMp9rei9tpaYHHrVrWe9CPf4ivDYRcUWx4VdL1fPeXnjln3IT8V2miw==
X-Gm-Gg: ATEYQzy/aCIr6Aux6S70/wgm8dfaX0iFrJ9lNbMvsFK1tzGV2kGnXVZnXnlYGyVlLKK
	nSFp5wtUIXb0udZ6r1FHhQb63iHHXw0mt7oZNKxoCOZ9vawFp0YZejGMyCDD4KpYsWBj53qFWr9
	J6bK9Z+9Pis+076AJTGLRuBg+WvJWY1Y114+eV/VtCDeZEvnJd2QASNQWX7vtFeVFtmm6LIENmk
	LQyLhoxrJgt9A5LiXfoUKnfETSYMeaz7hAuYpa6j46ImIifibD6jT50qmTmlWvLtXMkoUaAHMK6
	uAI0z/QumeuuROCIp+DUDGfqPSWY2HorIaDb23VgQeXmda+Pa9PZHjVcpUDj3fphSWgyJyfX5FU
	3APbkXQEMy8J55SPkwzGYcriatjR5pLQztRoNBVQzsRuupgjyGW18barsXtqbDY+YUd4xh/xiDj
	EaxYgPZJyf5Q3Qu0o9YhPCBXgq
X-Received: by 2002:a05:620a:28c2:b0:8c7:b99:cf3 with SMTP id af79cd13be357-8cbc8e55d3cmr1473487785a.6.1772440950677;
        Mon, 02 Mar 2026 00:42:30 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf746fc5sm1106370485a.51.2026.03.02.00.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:42:30 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: nick.hu@sifive.com,
	linmin@eswincomputing.com,
	gaohan@iscas.ac.cn,
	me@ziyao.cc
Subject: Add eic770x_hsm and fix warm
Date: Mon,  2 Mar 2026 00:40:27 -0800
Message-Id: <20260302084029.428-1-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004232_979716_930CAFF3 
X-CRM114-Status: UNSURE (   6.76  )
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

Use the CEASE instruction as documented in the SoC datasheet to fix
the warm reset issue observed on my EIC7700/Hifive P550. Refer to
PATCH 2/2 for a more detailed description.

Bo Gan (2):
  include: utils/hsm: Add __noreturn attribute for sifive_cease
  platform: generic: eswin: Add eic770x_hsm and fix warm reset issues

 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h |   3 +-
 platform/generic/eswin/eic770x.c            | 105 ++++++++++++++++++--
 platform/generic/eswin/hfp.c                |   4 +-
 platform/generic/include/eswin/eic770x.h    |  20 +++-
 4 files changed, 115 insertions(+), 17 deletions(-)

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
