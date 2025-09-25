Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973F7CAC5B0
	for <opensbi@archiver.kernel.org>; Thu, 25 Sep 2025 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0r0bH/ZSJurtPrFMCeEpt2K/7wxBCGsyOgYOX0UrwDw=; b=G2qUxoYa/iu3va
	onUcg0Sb9dRtACUWMuxnmYRA1qER/ayNiXQCOq/BOj12CtzURQdf2jePd1zTmWtQGr0yzkQBzUlLQ
	U7tkTgsp/ss2RhJt+mUJmpuTg/VmmXJ1CpcqBTVypVlUxoyhepiQ7yuz3PG8PCrRtaj0eZfHR4r/n
	bO5jtWk34Y8mibJu2HLEE1k0EisQ/5nlHSqWdqrCYDfBCRNknjUxKCMC/uFLU96WBZlPJK15+Vj3/
	eYPEf1OdOIkkyOIBcRJxEslkG10emlyEQCqQvJCLkTDDVsf7PHNeEFb3ug8H+KqXpGmEdmpqcBqwE
	asTjKYMs747UuTZ3TccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iba-00000007nUt-27TC;
	Thu, 25 Sep 2025 09:49:38 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ibX-00000007nH2-0t8h
	for opensbi@lists.infradead.org;
	Thu, 25 Sep 2025 09:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758793752;
	bh=C9AHTCGXh3y6yhBLcqU6we0kFrUNJptTTqZT58x4DNs=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=i6avoWebEalHZfe0t4DmaeW+ykRFI5oHqjTzNo54ly9FXZryQ2HmL/7AnQlwcA49r
	 pYsj64GPL8Gtt9kJO+sgLBmSc7X3NYINi/17kHOitWmTibrBSCkdxo3zbB0tqwlNhs
	 mombTUukwbPLmnU6h3BMqxfz/Azum5hFqMn207uk=
X-QQ-mid: zesmtpgz9t1758793751t3ee2e771
X-QQ-Originating-IP: BcSZUP/MjjRxMA2VvAyWruSwp4nIGLs93yrU/cq3n3U=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 17:49:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16978658429168907444
EX-QQ-RecipientCnt: 3
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 17:48:57 +0800
Subject: [PATCH v3 3/3] platform: generic: Add SpacemiT K1 platform support
MIME-Version: 1.0
Message-Id: <20250925-smt-k1-8-cores-v3-3-0885a8a70f8e@linux.spacemit.com>
References: <20250925-smt-k1-8-cores-v3-0-0885a8a70f8e@linux.spacemit.com>
In-Reply-To: <20250925-smt-k1-8-cores-v3-0-0885a8a70f8e@linux.spacemit.com>
To: opensbi@lists.infradead.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758793743; l=1466;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=6mdXnIcgVULQSdwhwghzu5m8XhEkreTEqdSA1jYDaXY=;
 b=8qq7dCyno8sHv7YKj69NHqLYfIixfYeHFUepajqF6iFSRA9FN1hLC3F64b/XX69Az8QvWk2xZ
 GlhGiEmFavHDc1xQIfQbImOXlD68A9FZJXSxtjgZGWKE57bcAc3GVZh
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NBUSIVIw0bNzPGxa+ZadxzV5UIJU7i3MFi7GnE/zbAOhwHgz/5Wav1ZK
	LLVDEP52q0npB02rzK15aXy0cT+HCTmnPmXKz+G5a8Aekr/pJV28DFlxWSW44tIn2InO23q
	EAB1bQWVuBf1f/9Q2il90lPB5KCUADWyOOTpn43mvWWiBfg0aMHWkRSU1qZOhv8vohFSuWR
	RAE9oD38Tw/mQ5EeIr3a/7u+Edry/eiI2NCacPwLpfROYWOB94BCHDhUGHeFVqIQrE9I3ij
	CpCTfScBkRnaSrIMt2VEq6mlaI0ZbC4IeQsrMI8tWzOMDIx62xFDXooAhSrftAJf1zXzzKQ
	26HYdeQ+MTRQwY9pMq26NbyxEw1ZW0ri4o2eEKZgwENkMcLL6a482sXSZ1qMMd1/NzpOS1h
	ZEQs2H6S1jfAp2BoDusM6Gf6D1N/j9S5PUvW242ejPR5cS9PN/ITdVHFgkl/h07jIyQYpYs
	MI5nuu3TLim1CPC+BxjPgGjw8DZERZeIcTY2JVdh+I0X44r0VzwhJEcvIOGcgjw5Grt8sZz
	U4fpG0RhhuokVcNNjCD6K82es06LMEYyuKn5YN+JWmKWPcmGiv1khuFAIx2r0nl/vqGWkVq
	uD1JK3d2wJ6GO4+QygKKFol8mILlCyeHOq0GgWYNFSqOCe7KNIErWZpCS5ioO2r4AS2ZjIR
	4kb56Po+VrxpNvAb1cZb2IpJ2ndts7MUjGktQ6iFXNx3wxZndbLMxoNUnl3v15Kxc7MoCe/
	uXLIOPFQPJcrVGyTUeEcOBNc7qx7x4pJBCb9UzxtrSHb7ecHlTmd2Pb/Od1rOsOf9xIWitS
	gnkw3wtA2rLCMVr/mMfj/WMGB8ZW/TnHNnoCHnoGulO5tghaRVC0kVClNagnyA09mpK6a5v
	J2l0Gi7jUXamEJPjfKbOdTdielgUraHJo3e8cAiat2cvOovISH0k+etBwzWEEbTD3u1tu+1
	Lw+WCp+9joNR/X8eM5jTSDLvzFbuFnFgk/5xeZvleZL/NEQuXM55vcuLR2WyLh27zdhANHB
	6w0ZMCuuWLlUrqopQYaxwdZ0ZumZ9p4b5S26f4n80ra39u+hWO2tP30MES7P1eW4o5A4ki0
	2wjiHXzGTrSgAzeEQ+ZbuILbJ6g6bE0cw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_024935_729651_C0FD6D9F 
X-CRM114-Status: UNSURE (   7.68  )
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

From: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>

Enable CONFIG_PLATFORM_SPACEMIT_K1 in the defconfig for SpacemiT K1 SoC.

Co-authored-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
---
 platform/generic/configs/defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/platform/generic/configs/defconfig b/platform/generic/configs/defconfig
index 4b93d0bc55233f83a907ff81234c78540e33d828..86e7bb9e3d859dcf72e7775fae0844ff066be0f8 100644
--- a/platform/generic/configs/defconfig
+++ b/platform/generic/configs/defconfig
@@ -1,5 +1,6 @@
 CONFIG_PLATFORM_ALLWINNER_D1=y
 CONFIG_PLATFORM_ANDES_AE350=y
+CONFIG_PLATFORM_OPENHWGROUP_OPENPITON=y
 CONFIG_PLATFORM_RENESAS_RZFIVE=y
 CONFIG_PLATFORM_SIFIVE_FU540=y
 CONFIG_PLATFORM_SIFIVE_FU740=y
@@ -7,7 +8,7 @@ CONFIG_PLATFORM_SOPHGO_SG2042=y
 CONFIG_PLATFORM_STARFIVE_JH7110=y
 CONFIG_PLATFORM_THEAD=y
 CONFIG_PLATFORM_MIPS_P8700=y
-CONFIG_PLATFORM_OPENHWGROUP_OPENPITON=y
+CONFIG_PLATFORM_SPACEMIT_K1=y
 CONFIG_FDT_CPPC=y
 CONFIG_FDT_CPPC_RPMI=y
 CONFIG_FDT_GPIO=y
@@ -36,8 +37,8 @@ CONFIG_FDT_RESET_ATCWDT200=y
 CONFIG_FDT_RESET_GPIO=y
 CONFIG_FDT_RESET_HTIF=y
 CONFIG_FDT_RESET_RPMI=y
-CONFIG_FDT_RESET_SUNXI_WDT=y
 CONFIG_FDT_RESET_SG2042_HWMON_MCU=y
+CONFIG_FDT_RESET_SUNXI_WDT=y
 CONFIG_FDT_RESET_SYSCON=y
 CONFIG_FDT_SERIAL=y
 CONFIG_FDT_SERIAL_CADENCE=y

-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
