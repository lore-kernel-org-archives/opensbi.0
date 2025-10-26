Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBDECCF9EE
	for <opensbi@archiver.kernel.org>; Sun, 26 Oct 2025 20:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxMJk+9z3PDElclQzTHOMiqeeMJiXwp5VkoHOfEq5PU=; b=FmnQTE88vZKoVm
	0UnO5f5LS9/efgIi4t0E9lp0aiQ9I+j1hNQ5VWYjF1QfzskwzVC6YGdzPfTFo7TvFsQp5kfQ5Flsd
	iqDt2ywvZRai/UEvVDWnLg/4GQjEQAQSwuIH7eZEM59o43cQYvnoUPLfG//QHaOxTg90ajsBr0EK9
	Ywce5o4bG6da9KDON+yf1wA7CmqgUww7Y7ePrmjGBVU5z16tnLzrR1BbppJ3QszNUVmznCTtzXXar
	tkU1JINXhdDYGzFiU2ZkliiasR6G6jPP3DNb+rvWPZZnjaCImIPe/vl1HxxZYZOmnrubQasODisfI
	NksOilqlX1XyiN08JCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7IA-0000000CiZe-1BLx;
	Sun, 26 Oct 2025 20:24:42 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7I6-0000000CiXJ-3PPa
	for opensbi@lists.infradead.org;
	Sun, 26 Oct 2025 20:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761510277; x=1762115077; i=b.freisen@gmx.net;
	bh=H865ZT53vq9eewIQQekVf+Zt8OsZsoe1bLKyMCz0pSA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=F3GjaFFVZQ8iorFkok2Uj7LHTkzrjaGWV98ErXjx7hFoE1U+/J+JPaL+xLYEtiqM
	 3sDdKhK1NQXo04cISBHWUqIlbUHVkp9GrAmpKCAz/m/E4zV7d3BYL8/yF5DoPLtb+
	 1OVDWQPWvcJEiO6tMaIeL0mGc2ra7WSUHSIB/nxDEiczdlkcYAt9EhyLaFhOUSeZw
	 rBEs5YIPS2NAa0jl3MDpQHRTi9leBHw2q6X4YWoXIQKOOI5J6aZKOr5qN7a172vaX
	 K2rXnbT5ZcMPUDpyIm/wDHz9w2aMKqR7MKu44Y8FLCtxEo8D5dJrTBpq2vOTxKxxv
	 CmeVQdVbJy68+W5Miw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.155]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MyKHc-1uEa7c47iu-00xpdw; Sun, 26
 Oct 2025 21:24:37 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH 5/5] doc: Add isa-ext-emu documentation block to README.
Date: Sun, 26 Oct 2025 21:21:59 +0100
Message-ID: <20251026202416.23550-6-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026202416.23550-1-b.freisen@gmx.net>
References: <20251026202416.23550-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:va8ZS+2b+UguRq+1jWamTZa/y/7eNJiy3ybCgbNFwFgEFosFJJx
 6DFzPj9QVPsxyxTFT9/ql2WJBvmeVNp+oVsXLMS36N8zbIngOdcDhWb/gv254STrHOhcmK8
 aPeJXfT5LAzKlqt21OXnizMlXAhPZaM0YG9ExQzGxnrtbLt86PQBLVi3nSOziWrhKMU9nCE
 72aV6lsLDuz3yvhLDq2Dg==
UI-OutboundReport: notjunk:1;M01:P0:1YceRhjqC9U=;J564sNcp2zFuRmyq5pjtvAYSmxy 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 W8onA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_132439_153741_64FE5EB9 
X-CRM114-Status: GOOD (  10.01  )
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

---
 README.md | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/README.md b/README.md
index fd40be0..73bbb44 100644
--- a/README.md
+++ b/README.md
@@ -1,6 +1,63 @@
 RISC-V Open Source Supervisor Binary Interface (OpenSBI)
 ========================================================
 
+**NOTE:**
+
+This fork (opensbi-isa-ext-emu) provides experimental trap-based emulation
+routines for various ISA extensions that are relevant to RVA22, RVB23 and RVA23.
+
+The main goal is to bridge gaps between an existing hardware implementation's
+RISC-V ISA support and a more recent ISA profile.
+
+More specifically, the design goals for nominal feature completeness are
+
+* RVA22U64 and RVB23U64 compatibility on JH7110 platforms
+* RVA23U64 compatibility on SpacemiT K1/M1 / Ky X1 platforms
+
+CAUTION: The `isa-ext-emu` feature branch follows `upstream/master` via `rebase`!
+Its purpose is to provide a clean patch set rather than a history of all changes.
+
+The following ISA extensions are currently supported:
+
+| ISA extension | Required by  | Status
+|:--------------|:-------------|:------------------------------------------
+| Zba           | RVA22        | fully implemented
+| Zbb           | RVA22        | fully implemented
+| Zbs           | RVA22        | fully implemented
+| Zicbom        | RVA22        | fully implemented<sup>1</sup>
+| Zicboz        | RVA22        | fully implemented
+| Zfhmin        | RVA22        | fully implemented
+| Zicond        | RVB23, RVA23 | fully implemented
+| Zimop         | RVB23, RVA23 | fully implemented
+| Zcmop         | RVB23, RVA23 | fully implemented
+| Zcb           | RVB23, RVA23 | fully implemented
+| Zfa           | RVB23, RVA23 | fully implemented
+| Zawrs         | RVB23, RVA23 | fully implemented<sup>2</sup>
+| Zbc           | RVB23, RVA23 | fully implemented<sup>3</sup>
+| Zvbb          | RVA23        | fully implemented<sup>4</sup>
+| H             | RVA23        | no independent plans<sup>5</sup>
+| Supm          | RVA23        | implemented<sup>6</sup>
+
+Footnotes:
+
+1. Zicbom emulation depends on SiFive or XuanTie vendor extensions.
+2. Loops containing WRS.STO or WRS.NTO will degrade to busy waiting.
+3. Zbc is listed as an expansion option, i.e. is not actually required.
+4. Zvbb emulation relies on RVV 1.0 and Zbb hardware support.
+5. Note that the H extension is required in RVA23S64, but not in RVA23U64.
+   See [opensbi-h](https://github.com/dramforever/opensbi-h) for a fork that
+   already provides a software-emulated hypervisor extension.
+6. Pointer masking needs to be set up via SBI and relies on page faults.
+
+Nominally, the design goals mentioned above have been reached for JH7110.
+For the SpacemiT K1/M1 / Ky X1, they have been reached in the `k1-isa-ext-emu`
+branch, which is based on the `k1-opensbi` branch, an updated fork of earlier
+OpenSBI versions of the same name.
+
+**END OF NOTE**
+
+---
+
 ![RISC-V OpenSBI](docs/riscv_opensbi_logo_final_color.png)
 
 Copyright and License
-- 
2.51.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
