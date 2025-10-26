Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C434CCF9ED
	for <opensbi@archiver.kernel.org>; Sun, 26 Oct 2025 20:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+oF/XtrrMRQCUVYfOMHPTqi7uTAw4AsUSPpTzOhDFT0=; b=EdhDo/IauDWSF4
	Y0OYtfrEgnuyyT6OPSAVjp30P6vXUn18TnnoJld0X6yWf94EMjO3776COr1bZEVnSVRpLt3m48cAy
	JMSwRrzA+/EJSqwsN5Nm1fdMTELlWPHuMfZj/lWLTbAcKJ+oY/QuAfTjbgXfGlvWuXuhLW6ItY3BC
	hqS03GM1KVfOYOS/HbqdKl/wrMpLTfLAuxekn0Ks72Xt8FiBLjWQCZydddTc94yYKd6vfBaO9LHXO
	/PV/ZFrqwtR5Cj4onIkMg+JSI3P7rZzYVYY0dYvZm0Hn31xymtpyzpe6hRsTidNT6MHOjmLpqyBHC
	bcYkSlOQ8P0x1Cjnn8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7I3-0000000CiWN-3fyo;
	Sun, 26 Oct 2025 20:24:35 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7I1-0000000CiVT-1ICX
	for opensbi@lists.infradead.org;
	Sun, 26 Oct 2025 20:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761510268; x=1762115068; i=b.freisen@gmx.net;
	bh=b0UsYkOqP5uSl8NoJTiwRIVF0DU4r7yy1uYl6G6x6Rc=;
	h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fJG5B/o0lizLry8C2UQcgVVIx0gyS4nRSEiNNiKUwYeWDCS8YUdZDYV3rZypw5F0
	 9UXkCvOmVY4RU9A0WTTPORBnIasUzwazxaAq+ZPNj61IwdmK9Tu67fs2bheFs1n7T
	 BeLZWpqI3IoF/UZrIY3NCYvxyX8sOiBXaosA+YGS7V07jlsNxXXnTvwoU5RvvhqjR
	 AM0Tr4gKmc4AmKzzF/uGUPSagRBKTIwkqQB/sdW4Hi3xmQF75uNxbSLuB3IkH5Zmb
	 H0B72AGVN02c53JuLjFl4UIGBUT35Ln89/vIVV3B8ASkVxR/eKwTCbXp/D4mK3vmK
	 GhznV1BP2ntBS85h6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.155]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42nY-1vD7Hw2kt6-001SCi for
 <opensbi@lists.infradead.org>; Sun, 26 Oct 2025 21:24:28 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Subject: [PATCH] Add trap-based ISA extension emulation
Date: Sun, 26 Oct 2025 21:21:54 +0100
Message-ID: <20251026202416.23550-1-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Lhu0Ip8iljjOSmvB2ILyKn9YbZQaFGd0t5z58M6tTUDqK2NChbq
 ZLtXBh/U4Jy1spDB0IAlVzZ6JFcvdnyePmY3YjgOP4q+vIHgYKd4DgGodzDVnmFDClNid8j
 cQ3jvWlaS6XN+7qOv14xT3GNlRZFOHulpstTo0oFFZJu5Sc9XaMPWT+U/ScSca6JtCfPIat
 1FbMGqxlvGBPMtZFmqbtg==
UI-OutboundReport: notjunk:1;M01:P0:13yHWGm6YwU=;Ku/uYFuLLJi+MGZeTzIT6oPlp5O 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_132433_627056_AF656663 
X-CRM114-Status: GOOD (  10.23  )
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

This patch series seeks to add trap-based emulation functionality for various ISA extensions relevant to RVA22, RVB23 and RVA23.
The emulation functionality contained herein has been demonstrated to e.g. allow the VisionFive 2's JH7110 to run software using the RVA22U64 and RVB23U64 profiles, allow the Orange Pi RV2's Ky X1 (a SpacemiT K1 derivative) to run Ubuntu 25.10 (RVA23U64) in a docker container, and allow the Tenstorrent Blackhole's SiFive X280 (Gen. 1) to boot into Ubuntu 25.10.

The first patch merely fixes the tab alignment in riscv_encoding.h.

The second patch adds workarounds for decoder bugs in the C906 and C910, where FENCE and FENCE.I instructions with nonzero reserved fields are mistakenly treated as illegal instructions.

The third patch corrects the typedef of "s8" from "char" to "signed char", because "char" is implicitly unsigned on RISC-V.

To me, personally, these three look like uncontroversial improvements.

The fourth patch, the big one, adds the actual ISA extension emulation code.
For initial consideration, I am hereby submitting it "as-is", mainly to see whether there is even interest in having this kind of functionality in mainline OpenSBI.
If that turns out to be the case, this patch will need further iterations that, aside from incorporating your feedback, e.g. add configuration options for conditional compilation.

The fifth patch is included for documentary purposes only, not for merging.
It contains the section of my fork's README file that explains which extensions can be emulated. The information therein could also go somewhere else.


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
