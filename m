Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42766D21688
	for <opensbi@archiver.kernel.org>; Thu,  4 Dec 2025 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/bGDy+qXkYsrCZmx5nkAEkaJju8+KlvJiGy3kVxnd88=; b=w1H1lzeT1Kk3Q3
	QISrWnr314R/HLUkCqxm/P9QJpgcicazPxmD3Jxfiaz2JtUHJehYZrNle/ZY4dghbxTYhYSskrbl5
	7RAMZPlJkG8x+YFEYf0kRExa2kWGLGljfcAv7Yh5r0pMqB876r5oJAMeOq2h19wxNUAa55C7vWPL7
	draIH48+pyRq7P9rEcz9obUM9n/IxRw5gK2GGs580rfkUemXGQFhmPfKoSK54gH/9Y5bEef1AxHAD
	P0gJ2Vh6z/8HkYoWLKso4yuqF0Wf9N+lyuiXuyITgMOq+tohii0V0ouyw0z0h57iqG36jO3Ckl2Vp
	tF+Z1xTcBHd658NzxjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAna-00000008AG9-3kSx;
	Thu, 04 Dec 2025 14:59:14 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRAnX-00000008AF1-355Y
	for opensbi@lists.infradead.org;
	Thu, 04 Dec 2025 14:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Dt
	84JpZb/TWQYn/6orasFUI7USv/+I/VCgHfOQ1y4L0=; b=GUu0/P6dGb/OWuekbk
	cd1tlBqsn/bGA2AAT08L9b3skJB5BCZusEriLFonizA32wWgaC542CZvW87DT5w1
	q0Ern2tUCuPRPfyrQO/ZUbDZjpyIdYVMjrwJJcwtMTPpS0EeHS5gDCplEQCgK60A
	w7BtUyFORn4m5wRjZhISdsfG8=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3pwu4oTFpKmb+AA--.24795S2;
	Thu, 04 Dec 2025 22:59:04 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	peter.lin@sifive.com
Subject: [PATCH 0/2] Restore platform specific CSRs when suspend
Date: Thu,  4 Dec 2025 22:58:50 +0800
Message-ID: <20251204145901.411369-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: _____wD3pwu4oTFpKmb+AA--.24795S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRZNVyDUUUU
X-Originating-IP: [2408:823c:b211:2949:db98:1913:e9e:6e1a]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1wQaOmkxmUBbXQAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_065912_160041_291A6B82 
X-CRM114-Status: UNSURE (   4.15  )
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

When HART enters suspend mode, some platforms require specific CSRs
to be saved for recovery.

Xiang W (2):
  lib: sbi: restore platform CSR when suspend
  platform: thead: restore platform CSR when suspend

 include/sbi/sbi_platform.h                    | 60 +++++++++++++++++++
 lib/sbi/sbi_hsm.c                             | 12 +++-
 .../generic/include/thead/c9xx_encoding.h     |  1 +
 platform/generic/thead/thead-generic.c        | 53 ++++++++++++++++
 4 files changed, 125 insertions(+), 1 deletion(-)

-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
