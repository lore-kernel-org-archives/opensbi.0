Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1352FC79FB9
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 14:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TRA5ufRHwdR9/aJ+XoV2Cs0xQWSSrpZNFRo3Blh6iA=; b=yv58SXzl1HEE72
	bcAfgiYXPq18aOFl+IzmDG1F4Msn+wo+iLqY76MEgLwYDM2cHUvg5idfXC/0148q1/LQ5/jB+zSau
	GGyXpQe2Q6j4gYXRdgtc3S0FqZdZSPRSNPIjdaXq7Aq0AqEotBsV9tq0Hn3O8WMp1d+h+EMF7PphX
	Q1DVqCE+SPteRUDDmP35NwaSspLbYn6R7+n1Hrbh1Jp+pU9PrhCqpa/YG+pRPihtedhJL2cZ1WUES
	D3VB3cyLtTst56hV/U/ABbEdTjLDTWTt0FzhgvN8/eldNESqNg8fh3n8z5AEt/lGnHCQY33zWrEHu
	uPk8kIEKWIaMklEruRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fMO-0000000EY7q-1h8O;
	Thu, 10 Sep 2026 14:02:40 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fML-0000000EY0x-27YD
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 14:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789048913;
	bh=EFZAn0wUviN/yPc6SQFCz1OzqKF7ZJkEzdY9Nco7xRc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=NKsZI3nRPHmIcLdEZ2YwY2pMtNTctHxTF6CJFlRqqDY1USmsZvPyybt+gnJLcevfw
	 1IZZG36taBgNjz6IZJ/l7vwjpNU79echlxtHetxe1DW5AJYgO3ZBczS7+nOTgxZwuZ
	 hdoU81xWR5M58cnVi2tcrbo7sr5VLM14ytqp+h78=
X-QQ-mid: zesmtpgz3t1789048908tb1c65aea
X-QQ-Originating-IP: nULfZeQCMAu2vvVFfpxFHS6B9RSA1qYmYDOOcZHlBEY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 22:01:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17377836830275896916
EX-QQ-RecipientCnt: 9
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 10 Sep 2026 22:00:07 +0800
Subject: [PATCH v4 6/6] platform: generic: spacemit: k3: override
 cold_boot_allowed for hart 0 only
MIME-Version: 1.0
Message-Id: <20260910-spacemit-k3-v4-6-0793b62329f6@linux.spacemit.com>
References: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
In-Reply-To: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=vIkOFmPPJAWYjaHzSlnfe/ds0On3A82bMNJd2spPzaA=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmLdhiIxewu/Ps95sI1Ox1HEwudI3+WPZ2R83KLkxjfQ
 t4Cr5x/HaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABN5eYvhf2yPVMmC68tPpH6a
 IPLxlsnkNxOWh3/k/zpX5lTSLZ7NW+IZfrM2x9zwWb9uges83sXGS2eb9cZua09aNXXn2wtX18S
 V7WYEAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MnDLfP0IFnF4+P2ietP8ZGVx2Jrz0FZszx/l/y6ELp7Quuh+ijrplbm/
	kBlxPsFgiz4XWH581xgpLZRk0KLjq2wnXxna5ryN38tRkoyLvC7zKXs9TeDHzFCZPTkIF7W
	uZzacSjkTBLRgcSup8yu4ZABuASt9nwMIIW2PwataSlKHhBLTTpEj/W93035VVJcSsrsy5U
	dN+B5gbR8ZvGJf3Q73DqxvS5LDHbnUQWpMH4oRHrJDWvM75KskpscquyhrfeNq6qyMBf9Ym
	p7xHoTE/7TivoYYZo+2G59+RugV0UIcvLIdfnX8255UljvEh6z0OgMytmc/uHnRoY/Ff9sM
	Uxnkoq5ylSljLpvJAwFf+aDD4xAIEJScT9vU/LsMQvQBgwQ/wrlSZvgMjJljhgn//lAjJDO
	mXCMxdo/1viiRoXZDxRmeQZPjsjpMvof93OFqHmzg91y1TtgINP7H0iTXzJ3DvdwejvBFhp
	Z/sjWhQGzjvwp3ZRzLmlJ9AWSpTIVeeNAh4CkliUbzA3gqiSca4+3Upkv+GS1CATM7rJ9r3
	YSzW1PK2vE0lSBOGsx6b4oryheeiArquh1MOUmjoqb6lLHbtBXfAVRsU7ATsve7NDLdn9N3
	TKIvX7+1FE9mtVSiujVi90rv7vU9yAf6H504S3pJrR+AsUZLT5te5tEskQIm7LZwDNaLcEW
	RC7Fed6oh91AU07zBWh9/BQtmNk+rKY4mLE04lDVguUHqXSr3s16uXcVVq2b5Xe2zyjzUHP
	+ls069qLLcT3ba+z92ZRBJZTGbHBxJsYz6Wse0lKhQWDvGhiekgulO9i4DbtOhTIYSc5Qv2
	TETl8+s6/MGhnbnPZlJiV0p9jmsE0k80hug/2rk/B6Gx0AQvWF0LAfCwM9rQWAE+5G2h/PM
	zqdtffblYR1/rm6qvDrPukj3KKQjt0Mww/xLygi4iuwjXYk9i5DYxgak+ZWQt3GRfzJGLW3
	IHeMemNwtUW4QJ5kn4tYhuBvBnnhjMXhjaMNRagMe3Fg+ygdit2k0J5GbJdZE+k4FapLnnt
	sb2xzc3VVNTym9iPQOUcN8HFsqSrJJKTlOwHcjmZgVF6t0TtgSb5SZ/ugV4uDtr6Utc6Npz
	+J2JTPjTnNOG3sRYgra1i/+7Pdf4qsjIWWY35mDAH2yZ819clysiKnl+nVNBR0Y/57rlr7B
	vT8NY3IyJ+fZd/E=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_070238_408121_17500CD0 
X-CRM114-Status: UNSURE (   8.95  )
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

From: Valentin Haudiquet <valentin.haudiquet@canonical.com>

Only hart 0 is powered at reset on K3; secondary harts are started later
through HSM. Restrict cold-boot eligibility to hart 0 instead of using
the generic DT-configured hart mask, matching K1.

Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 platform/generic/spacemit/k3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/platform/generic/spacemit/k3.c b/platform/generic/spacemit/k3.c
index 967d09bf..7922ab11 100644
--- a/platform/generic/spacemit/k3.c
+++ b/platform/generic/spacemit/k3.c
@@ -102,11 +102,17 @@ static int spacemit_k3_early_init(bool cold_boot)
 	return generic_early_init(cold_boot);
 }
 
+static bool spacemit_k3_cold_boot_allowed(u32 hartid)
+{
+	return !hartid;
+}
+
 static int spacemit_k3_platform_init(const void *fdt, int nodeoff,
 				     const struct fdt_match *match)
 {
 	spacemit_k3_hart_init(current_hartid());
 	generic_platform_ops.early_init = spacemit_k3_early_init;
+	generic_platform_ops.cold_boot_allowed = spacemit_k3_cold_boot_allowed;
 
 	return 0;
 }

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
