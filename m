Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6018C79F9F
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 14:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxqf4u9SwZt/Noaj0G5iVYGgAXAjPWGZYdNjl4E7JGw=; b=wuKf3hxbOXryIz
	HN/me0zL8gxy/yIry0DqcyTkifPX8h4iTqxkdsh8roEZrGuEyqmDNk4fcKz9jX1QMZpqcSA7pNQEZ
	Bd+daHKtaqggtTIzWO4t2FZA2z0T7Wzb6TolUzK5JYCmRt5dczs+yN8JdpnWynRnmNwUY+zfM5AiZ
	Xr8u3X1kkc3FsK6x4RUvEoz3w61FdSwhRZ9L/wvNIy4V6b2ma9kfmVvWwHXduTXWU1tCVXhWQ1F8C
	F/XGPhxCoJS4kWooKNelnHaT0Xi9hx1CEUJnfGQm2w9aKaWq9AwCyZ4rWdDNZNchT/rhe2QK6GcC3
	RXTik0rfk8pEnEPp9JrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fMN-0000000EY6y-1IwD;
	Thu, 10 Sep 2026 14:02:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fML-0000000EY5X-3TEk
	for opensbi@bombadil.infradead.org;
	Thu, 10 Sep 2026 14:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gZhUlOtx+40vljDnWa3grPFjDvNRaXAjawL7GTfVGN8=; b=Ez3xcvlWhKI/QBGEheq5Sa0Zem
	Vslp4+KCulpxVXKOQaYPTWr3SBw3e/tj9ER/psNhKN1FJ+WeahDxgIwm0n3SRS7zT+PBoyTYELrPS
	IgPMuqO3gd7EakmLhorE40beXKdHFdFbRtMTpfKygeaHbcdI4xLviLzfRLiC2ehcqEPUgjZyYQsBO
	FfSwtrG7w5oFnRDS9EVpsto/xE9jvd3GyXZ9etChSZVErOLrxH1mQTk0bSL74A+zOi7J7MIaUEmat
	7k9DFOscGxLRs/3EhSskqsDEOK0hWhgT00AWfohtWUJqzCP0QVAQGJfzusXlKiO2GwlfZfyBPeUEp
	0eDDzW7g==;
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4fME-00000002Zf1-4A6d
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 14:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789048901;
	bh=gZhUlOtx+40vljDnWa3grPFjDvNRaXAjawL7GTfVGN8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=M9QTDF+8FZEWxan/d1Bk0lyk2GrCpkVMugshpuNl957rXhgs30vPaD+d5V389wZvI
	 8ZeJrdY5i45c0sB/hNClh2iZQwin8trX7/+9obCJZDJ+e7hIM6YK0mEFqpeM6Bk0Lk
	 0BsHyceMnVCtFhS6ecqGGfpmjRK4sUy3Ww3L/u7k=
X-QQ-mid: zesmtpgz9t1789048896t456ad76d
X-QQ-Originating-IP: jNkFu2tnnVgJG00Ey4RtxgyxFhdwOkRzH/0rb1Ui7e4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 22:01:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1565772268795733855
EX-QQ-RecipientCnt: 8
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 10 Sep 2026 22:00:04 +0800
Subject: [PATCH v4 3/6] platform: generic: spacemit: k1: move hart init to
 nascent hook
MIME-Version: 1.0
Message-Id: <20260910-spacemit-k3-v4-3-0793b62329f6@linux.spacemit.com>
References: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
In-Reply-To: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Bo Gan <ganboing@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=bLvPHNeA9VO+U4Hb6Myt/OCxjtrEsU6YOtleOY/qizk=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmLduioP6rds25hRd3jdUd6D6/4cv9PMD/zvygp32jd2
 +cLNGZ/7ihlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZjIiw5Ghgc7CnY4nXoU/mXr
 +QKH7wdj6tnnbSpp+9zLkHguVKb9/V9GhhvhZT6hQkUlEy6v/TdPmLOpp8Pjz9uInirDd5NN73X
 P5wMA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mhs5Z8154Fj0K3bct+lf4sKVOY5REhBcjAHkpxokUjcGh+Rg8+8V/3L7
	hG8yit4ilAx/owDIg+nOgzgKj+oaRSy/XWq2lu8YSkb9NxaHGM3xnk+yWmf4F9ZvMxtFihw
	V5ZSK8qWRxqIqQXQVblKtZ8eyg6jxW8n78gLwiU3ZKDGcJLZHC5Nw26Oo36vP6dIx1DTLr3
	pmaNtlBrjptUdV9M9mMX/Zu89/8adZeTs9qfwfG11Av+mukfzsj7mVYIIvO3FQPO8GafZej
	ES7O77MRPbPAVa80CQElcRg0kWFHeDrgBggjbyxFNMC7yOo3okm+RNp4TOUutkv1VK5lgdL
	ZZrJDSkNR+7E51BtHcSeQS50XpU+t//qiRwwd8qpO1rRclb1awUYGi4ra069SotRHBmC+6K
	LtIc2UHed7oQrXNHSV9Mcu+Wg7ZcTP1DnJ8rBMrlGwYoMtYyivrfZSbyZLuMuop/QdHimt/
	QTTufdjKTmqGs3agC6xr4YsGCKBHVbiSolsyzqjzt3GVZXVRqa/gNKsjYB78InvEtXAkFFw
	gSLHrv0zxaAyFFtKSLkMeAmDAi38G0KQraj1YcvTuJAN0MdmpWr7drNjXbwbaNZJNqXaq3e
	r5oVSrbXHmKbyKTwv2imS4AhWRejXxKO871j7RqVHcCqKaIn+DqmNB4SlmLCwnB2ul5t/eZ
	SDc1h5LYZKTDQuYvL1KBoMUeNcYKE1mhvkpDDwExcX8AfRCByd71zRKSUFcF2ipS8TLYaDH
	1Zn3McEAJmLK55+P8bL1QGmltktWbDyOVsBhVKqC2ajCs29zUMc9vmghF3UsITWFquNpHKw
	OJme6kydFGhnLiKTrGNhbvRuvSIqpX9X4xBiAmYYc/keKiZhug4lOay2o9qGzIo5KVXRPWB
	YbJTWjQ5v0/aFdsRAGOecDfGhYF9XH8qdks4JCnMTXgJ8kGZbP+QNFGmAvBGJMqmDvNlwQX
	iXjlH2YV5cSD3Vx961lZedZMym46cG63X+3xDckxRS2CC8LAUewJGXLGxw3Rkd4WPvMKHMx
	X6An0bXOy+0+5L7e1UIaBx8ozvp0+AtKeHQbMcI5MkcD09R2jtTWDDyYKvygbAYK34r61ix
	4P7t+1RVqMICeU4PaHnW9ekNouimrkt+7V/MInGtOymkSLadz5/MU3GmIdfO/2fPH+o1QCY
	147or7uxPA+ZZi+P16aSNuoIhVxorY2IujLV
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_150232_270341_93B48C6B 
X-CRM114-Status: UNSURE (   9.11  )
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

cold_boot_allowed() is a policy query and should not modify per-hart
state. The K1 callback currently programs ML2SETUP as a side effect.

Move the ML2SETUP programming to nascent_init(), which runs on every
hart before common initialization. Chain generic_nascent_init() to keep
the generic per-hart setup intact.

Fixes: 1f84ec2ac22e ("platform: generic: spacemit: add K1")
Reported-by: Bo Gan <ganboing@gmail.com>
Link: https://lore.kernel.org/r/56220293-88e3-451f-833e-8251656a83d9@gmail.com
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Bo Gan <ganboing@gmail.com>
---
 platform/generic/spacemit/k1.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/platform/generic/spacemit/k1.c b/platform/generic/spacemit/k1.c
index 7ee5f17a..19a9b27c 100644
--- a/platform/generic/spacemit/k1.c
+++ b/platform/generic/spacemit/k1.c
@@ -8,6 +8,7 @@
  */
 
 #include <platform_override.h>
+#include <sbi/riscv_asm.h>
 #include <sbi/riscv_io.h>
 #include <sbi/sbi_hsm.h>
 #include <spacemit/k1.h>
@@ -86,16 +87,23 @@ static int spacemit_k1_early_init(bool cold_boot)
 	return 0;
 }
 
-static bool spacemit_cold_boot_allowed(u32 hartid)
+static int spacemit_k1_nascent_init(void)
 {
-	csr_set(CSR_ML2SETUP, 1 << (hartid % PLATFORM_MAX_CPUS_PER_CLUSTER));
+	csr_set(CSR_ML2SETUP,
+		1 << (current_hartid() % PLATFORM_MAX_CPUS_PER_CLUSTER));
+
+	return generic_nascent_init();
+}
 
+static bool spacemit_cold_boot_allowed(u32 hartid)
+{
 	return !hartid;
 }
 
 static int spacemit_k1_platform_init(const void *fdt, int nodeoff,
 				     const struct fdt_match *match)
 {
+	generic_platform_ops.nascent_init = spacemit_k1_nascent_init;
 	generic_platform_ops.early_init = spacemit_k1_early_init;
 	generic_platform_ops.cold_boot_allowed = spacemit_cold_boot_allowed;
 

-- 
2.55.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
