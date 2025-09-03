Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34601CA1011
	for <opensbi@archiver.kernel.org>; Wed,  3 Sep 2025 04:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BNQYVxPLbLf9loA6RV133jJ5jByNKCuUmMBKS1I/m58=; b=5BBPXG+cwOycIu
	iSuQhPiDUFvdFX9OlzNQSPJZLSAsytllrkuy8nZOfWFM1m+jTp+PSPJPDsQ/m4oF5wlwSMVfNaPig
	zZevIK9QsqGcGcrXgLbPB7iREEtR9/hDzMo1CMguXqORTEDzQ5JlRKQza/ERE/soJ149b8ivrSBGC
	eAsYoTgG5Owzv7IohkDz+S7TwnaGPbhRgPWk8QajNOA1h5TOl52PDB9Ub3+J5FFrvZJ7nAu1C1xoz
	Brex1Y1C8ZyHirMaXOBX1WVnXDGRAgqBMeLhHAIKFNWM5VAmTxfFsXhci525Mjl1tllvblRtO79sa
	1wsc50ZEVOdrdw3ZWdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfOP-00000003way-0u3D;
	Wed, 03 Sep 2025 04:46:45 +0000
Received: from m16.mail.126.com ([117.135.210.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utfOM-00000003wXr-0Hkx
	for opensbi@lists.infradead.org;
	Wed, 03 Sep 2025 04:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vm
	BQktrVbcJh4jTRI5W24Q9OX44to7qJobh+0H83lPg=; b=RUXoR2rYwPf7jHz8yt
	JcrL2Y6vQmG1/X6tSdJHBDgxqx63+9XYM1/DhAD2Z+bzw6cJatRX0VfEvvW0svCA
	6nD/CWEJCnHFOIRmp+mLs9nZVoZgI7L36zwlPWwqovlu/4NMbWAjupVczdWEbmn2
	cgZrQ1sgiSAKa0F+leKwpq2UY=
Received: from T490.lan (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgDX_5AdyLdoha5eCQ--.15985S2;
	Wed, 03 Sep 2025 12:46:22 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 0/3] Some updates about domain context
Date: Wed,  3 Sep 2025 12:46:01 +0800
Message-ID: <20250903044619.394019-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: PykvCgDX_5AdyLdoha5eCQ--.15985S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RXXo2UUUUU
X-Originating-IP: [2408:823c:b211:2a61:ded2:c9ec:9c16:bbca]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5Am9Omi3twjrFwAAs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_214642_450625_FB48BFA2 
X-CRM114-Status: UNSURE (   5.06  )
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, Anup Patel <anup@brainfault.org>, Chao-ying Fu <cfu@mips.com>, Qingyu Shang <2931013282@sjtu.edu.cn>, Alvin Chang <alvinga@andestech.com>, Xiang W <wxjstz@126.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

- Add code to sbi_domain_context_enter to allocate the domain context 
  for all the domain on the current HART.
- Add error handling

Xiang W (3):
  lib: sbi: Add error handling to switch_to_next_domain_context
  lib: sbi: Add hart context init when first call enter
  lib: sbi: Prevent target domain same as the current

 lib/sbi/sbi_domain_context.c | 82 ++++++++++++++++++++++++++----------
 1 file changed, 59 insertions(+), 23 deletions(-)

-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
