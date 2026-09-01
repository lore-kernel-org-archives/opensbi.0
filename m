Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BF3C61DE4
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 05:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JHUoByI1q8K8gqCZd5/0p8mGVsEMmrCZ2mt0RMwE0M=; b=e77AabzAvNRc+pNMZlCFgCs0z2
	aDqThMmdf+Iepypi6K1YEQGQii2B6fUS3olMCoVS0Y6Mtj6HS/Aks1PjFHZU2ggvhzbmoJ8L3B/v6
	I4BUofWa4pDOs268HSqWBAad5/JLu74fX/ZftnNGyO2wVdySBkx6DRd0M5DpM8JUAAQWB1MANxwVi
	uADjACmdFFeY5ozOLTigppH0DUgS+3QfSUG7HxcFP+cEcktPcS0x5FTvA72WnAP0CFK/GY/0ntenI
	5wJ15D/g7dttASWczxkPSQm/OOSin7ySEmdQDw94DfaxzLtC/V/18o1wlWkX3/qs5MImRNedAoSJQ
	BinM2S6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1HJy-0000000B1oJ-0HEl;
	Tue, 01 Sep 2026 05:46:10 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1HJv-0000000B1mW-30BR
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 05:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788241535;
	bh=Yymgb1wxnm+g63nA0vkBUnkC2qboFilcwwuqt15Vhoc=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=gUJIhFwrQGhyMEFJkvK81Yj1dIsU8rKOoru28IoKhTfkbsLp68HYZoQPG9pBNqntH
	 gVmc7EUCt3BBLHQQREsk4rzB7V8xNXEo9fbYt2M9M0AHZ+XxOYdR29AENw2aMVMNqv
	 6XAyYh0c6c38Z8V5rwexqIf+596cE03i59KW5Xd8=
X-QQ-mid: zesmtpsz6t1788241529te33f6bd0
X-QQ-Originating-IP: VBFzFqV4ktXOPq3bDpFO50ZdgQfj6u+6Loao+VL31uQ=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 01 Sep 2026 13:45:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5932685198137254403
EX-QQ-RecipientCnt: 8
Mime-Version: 1.0
Date: Tue, 01 Sep 2026 13:45:25 +0800
Message-Id: <DL3QPRN6R9FQ.IBAFD0U5JTOZ@linux.spacemit.com>
To: "Valentin Haudiquet" <valentin.haudiquet@canonical.com>
Cc: <opensbi@lists.infradead.org>, <troy.mitchell@linux.spacemit.com>,
 "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Anup Patel"
 <anup@brainfault.org>, "Bo Gan" <ganboing@gmail.com>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 2/3] platform: generic: spacemit: k3: override
 cold_boot_allowed for hart 0 only
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
In-Reply-To: <20260831200832.404000-3-valentin.haudiquet@canonical.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
	<20260831200832.404000-1-valentin.haudiquet@canonical.com>
	<20260831200832.404000-3-valentin.haudiquet@canonical.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M+2PnUZU3GJTm/5ttxL0DFHo0TLg0WsTL3PwC7tDF+FLmDN5LuSz1MtN
	vEGP9Xp2hf6nJxipc/bb8feazsVdKZISTsb+GeYXZLlINpXwOtYEiEOpIWCjdYSp7BF+EBC
	EjiOWnPcpCNR2TlUrbzKGhqZX6JnLxa/3CQgK/NeoTnxiYyoxj+w/q3lKolt9JxHjgH1eDh
	CEB1vhVi3MU8gPe/htb/XgacnPZs8MOSIm00oBBH7NY4EWVD5p/p94+4deJAuiDiOg+AZVO
	z/OHojiAVyBLzHpYTaFyzyyT6d7afmHe6JMIiEbYiNhYV90gKTm4NqT09VTAyHsLJ28rWGG
	5lLxM/DjdfHkRpLqcAmEiV2EhZExK+hZnz1t4jKHcRZNBsuF7yN4dQZ4IL1wpK/F56IGx4w
	gHuyhvEL4GX/uj5gIL7RmPSeZG1UyaUeoeEc5JOJWbUNNeQH9cefDdfzHi3D4cVkaZYEO/6
	chGNecBnJf1u6mDG8yzPiDykMQQC5eNkDjQhVlLZthobQyhOBlMr+upevh2IaecU5crMQeG
	XRdOiQW6nPtSGtfTYC6ma9COGE8L/4QgJe12/OJwtnzdB7ZL46lL05nUPDGawXk5JnCVa9t
	eX+KlxFRmkPPMD8CjUs1wH7hXpBe/XB7JcoTydnEvjtfYTixzMKvm4VoCmEy3kZNh7p/Ihm
	zb1HGiC6J1HRrsAn+KNsUHRQOQ+unRkGhNWRCoR5G514zOnYNrHyNXOaSA81UHu8oT0mHcH
	GkEbC/eI3KRyahfLdELLpKRtrzlVyGc46qNZbQSTsypy0iG5o9X9gZPDIelW7MMjPXpuS+2
	c00DaZEixN8/2XYxlUt0zmvRBqrBulctNCcbVdq2JFX0gb9y65BexemJs+mlUpDYkxkfyvf
	sAdKr/dEPfNxnTxDUkyXPFp4yvT4pJ9lqorFBgrdyeZ7Yi+Ue/OEmtwAOTMYG8DGOAnQYxM
	7XPQfv3FVL2yEefXyMpMGSqo6si7OaAInl/NU4egd1AhZUbfwVGRA/LBl0Omet8lAIEO31g
	VKSz1QK5SjypgTxL25zr/KEE1eMQBqsLxBDKtLFD+NcioIvILORFJl/3RIDaFl+manJAgqH
	Uwsah+7ftP15t9Te3BEdqAer0ZMAfKhlX5fjMaQ3ZWk
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_224608_108747_C5D4CE96 
X-CRM114-Status: GOOD (  10.18  )
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
Content-Type: multipart/mixed; boundary="===============7552926830550428393=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============7552926830550428393==
Content-Type: multipart/signed;
 boundary=9f270b5e023918e81a27a462bb98d6848a042410fb1f944b2e5ed7253f37;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--9f270b5e023918e81a27a462bb98d6848a042410fb1f944b2e5ed7253f37
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2026 at 10:07 PM +0200, Valentin Haudiquet wrote:
> Only hart 0 is powered at reset on K3.  Without overriding
> cold_boot_allowed, the generic default checks a DTB hart mask which may
> allow non-hart-0 harts to attempt cold boot, breaking the coldboot
> lottery on a platform where only one hart is running.
>
> Add spacemit_k3_cold_boot_allowed() returning true only for hart 0,
> matching K1's pattern.
>
> +static bool spacemit_k3_cold_boot_allowed(u32 hartid)
> +{
> +	return !hartid;
> +}

This matches the K3 boot contract and the vendor OpenSBI behavior. Only
hart 0 should participate in the cold-boot lottery; this does not affect
starting secondary harts later through HSM.

As you mentioned in the cover letter that I could take these patches, I
will include this patch in the next revision of my series, retaining your
authorship and Signed-off-by.

                                            - Troy

--9f270b5e023918e81a27a462bb98d6848a042410fb1f944b2e5ed7253f37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapZmdQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvW4MA/iSonoCGP1PnZA3FQ1Ydj7PA5wLg1Ar4IX1TBebC
Fab1AP0dJgRPs2gchHHPWPVuWl2Is1Y8AkSyxEeMgoEt1x6aCQ==
=HAuK
-----END PGP SIGNATURE-----

--9f270b5e023918e81a27a462bb98d6848a042410fb1f944b2e5ed7253f37--


--===============7552926830550428393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============7552926830550428393==--

