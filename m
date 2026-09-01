Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59918C624CE
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 02:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hyv6NpJf7ah3yYuldNjrH3AmwzJUFUxTcp1tH1qNH2s=; b=teVZg0TzPeCox5UJBC9BPaa4uR
	O0z+Qk+bOsow8dmjWXFZRIOU8XO40e1atbz4uxJ+urlr/ObzOVrmWxgBOaVcRhX5+AkTtKiZiRa0q
	0XvTzTJB0I1XAgiBH4MyPeLYFN8qu+Ojh500xl87nUkz2Js3BTi1tn8fAGgzFdmqfn9O1B5iC/2bp
	V0CLQlhoEByRz2KxuFr9IPK8AnKtHVA79s396jEO0gchL57vkxzTn1GRg++HPK3iRhBEOEBvKgtW4
	zVztYcK4MR5TeBBl+nZThHKledDj4CEvnKLaBkjTJKTS3X9M1eY5TtoQPBOGEEmXQcv6GDrpSKa/1
	WWKxmywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ECD-0000000AsE5-0P0Z;
	Tue, 01 Sep 2026 02:25:57 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1EC9-0000000AsCf-27rr
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 02:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788229516;
	bh=peuth4QF6joWh9YhLJk3Ibwa0hP0S+PRuxGw5bmRZSc=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=Q2yZIAKcDmdgIdhri5vxZoJk0gco/1+rl+oAX9jxTgEEo+DloGQaZqObRYUdG9u0L
	 2BZFQtbqLzDrYWlAmt7nhWuggioRPu+tpHsqcftD1KAkoZa1F+NiyKCI3STG0FPunN
	 XyjeBaGAarXWzytyOQB7pBTKRT6TIGdiD6mkfCqc=
X-QQ-mid: zesmtpsz5t1788229507t4eeb1777
X-QQ-Originating-IP: hCQDJp7mdHBX10hu5LQh+cFVjvwFbSonemvRLy5YuaA=
Received: from = ( [58.254.68.189])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 01 Sep 2026 10:25:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11265462525577780332
EX-QQ-RecipientCnt: 8
Mime-Version: 1.0
Date: Tue, 01 Sep 2026 10:25:03 +0800
Message-Id: <DL3MGCWJZI62.27X6RBQ9HQZLB@linux.spacemit.com>
Cc: <opensbi@lists.infradead.org>, <troy.mitchell@linux.spacemit.com>,
 "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Anup Patel"
 <anup@brainfault.org>, "Bo Gan" <ganboing@gmail.com>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 1/3] platform: generic: spacemit: k3: de-vote cluster
 power-downs and ungate DMASYS before CCI enable
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Valentin Haudiquet" <valentin.haudiquet@canonical.com>
In-Reply-To: <20260831200832.404000-2-valentin.haudiquet@canonical.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
	<20260831200832.404000-1-valentin.haudiquet@canonical.com>
	<20260831200832.404000-2-valentin.haudiquet@canonical.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NchHDkd43sBthU/2Yz/5EtMk/jdZpSEXazXWPvvFAEMJP17KZ8u9Nwfp
	DdRI3n0ePoqIDQLjQY6aPguz3bei3v6nXnDMayp+vSoKZh6FDi5SI/j1B1xp33qE5g5XwmE
	LQ97EAfmKXEFq7qJg76AKwBpLRQwCYkgI7jGLgM5VViTEAbG51eWixJsyePtvoaOho5OJ82
	oo8ZgxGOUV47exEoV1TCo6vub+Kn5xUvJNOvyk2pk0K9rv4ZwGkk7l1Oo2O6mqGorpfENHs
	vWw4r4v1nQTbACgQ8UF3qlXFy3T0x0fkgTW4NVe/VCLjHOcRs4Wq1XnVgP3vom6kwK3y/jR
	bFGgeNrhv4jeURNMMe15sI1mfsbzhCU1431FMIyf+tH6NjInZB7chiyUzkONJaQCpLMq96A
	OUS4tQn1tYXEpmEY24XZ1ffo12cocbqTSv8BoCvV0h4kB5OikGOAJAM13kNp5GE2eFHeoQn
	XCdq//rOPwLpx2A64klkCmscU2IpJ0zuvj46iTUgLOfZzzuzeQwLCOFpqjq6Ra2SNs50ezW
	+kuSksQY2n7IPPQAGXsF9BKx4XnHcOEhZnUAyx7dg/MLuOKQRb699uDw9LuClcYTRxXYYFS
	elk1UMStDi1wz8c19kgCf8XOTcSizIdVHXE/I1mK/5T9FZNXBBJL8n89ANK21VEwqsQwqZj
	aMhR2zzWCVZDXAm9+v3liyDgay9wO27iQI9n60uWKjzM00JcObtTc4FriOfAaXMRTXTiZEY
	VGgeohujGFlU3SVW7dSeBi9ltRMB0c4ukS0xN6Jf8FT3jpVYahiU6EujzUmTPn874Tzzgja
	w6MYIH+4O4JsMWWxre/sJJo+NCPClk7yzEX7pDIgUTal3HDdcgslAgfsyxHRYb4c4pPgvQE
	DVD4SMp9wImI3ybGUQz1DbKWg4UwsHg3f8O1G284jyhSfxS4QKkvmMm4Y+OJRiCaSK3XUSw
	OT7tpc2uN/jgStCMrf15QcqF+HvuGlK+g5dWBXmIvDjKZBSlELAYPJZd1Tiwu00K7+SUIQh
	Ujs5lUQ0issOiMAYit9Lr8koYqswZv3eAxxKz66jvRoUd0xOhj+feAkCqFqu5lWhDT3s4Cs
	WZBd0rbKXVW6YtVXXIvdNo=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_192554_466106_3116C2AC 
X-CRM114-Status: GOOD (  14.78  )
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
Content-Type: multipart/mixed; boundary="===============8869790856909858935=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============8869790856909858935==
Content-Type: multipart/signed;
 boundary=85af88e759ee7a5092d0aa335bd330c325036da76bbf7bea31f446e1c16a;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--85af88e759ee7a5092d0aa335bd330c325036da76bbf7bea31f446e1c16a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2026 at 10:07 PM +0200, Valentin Haudiquet wrote:
> De-vote power-down for all four clusters and the boot hart's core
> BEFORE enabling CCI.  Also deassert DMASYS reset and enable its clock
> before CCI: the DMA engine sits behind the AIDMA CCI slave interface,
> and if DMASYS is held in reset the CCI busy-wait hangs when enabling
> snoop/DVM on that interface.
>
> @@ -88,10 +113,21 @@ static void spacemit_k3_pre_init(void)
>  	writel((u32)entry, (void *)(unsigned long)C3_RVBADDR_LO_ADDR);
>  	writel((u32)(entry >> 32), (void *)(unsigned long)C3_RVBADDR_HI_ADDR);
> =20
> +	/* De-vote all cluster power-downs BEFORE CCI enable. */
> +	spacemit_k3_keep_all_clusters_powered();
> +	spacemit_k3_keep_boot_hart_powered();
> +
> +	/*
> +	 * Deassert DMASYS reset and enable its clock before CCI: the DMA
> +	 * engine sits behind the AIDMA CCI slave interface.  If DMASYS is
> +	 * held in reset or its clock is gated, the CCI busy-wait hangs when
> +	 * enabling snoop/DVM on that interface.
> +	 */
> +	writel(DMASYS_RESET_DEASSERT, (void *)(unsigned long)DMASYS_RESET);
> +	writel(DMASYS_CLK_EN_BIT, (void *)(unsigned long)DMASYS_CLK_EN);
> +
>  	for (i =3D 0; i < array_size(cci_map); i++)
>  		cci_enable_snoop_dvm_reqs(cci_map, i);
> -
> -	spacemit_k3_keep_boot_hart_powered();

This ordering does not match the vendor OpenSBI implementation we have. It
enables CCI interfaces 0 through 6 before de-voting the cluster power-down
bits, and ungates DMASYS only after CCI setup.

Which slave interface remains change-pending, and what register state did
you observe before these writes? Please also specify the boot firmware and
DT combination used for the test. Since cluster de-voting and DMASYS
ungating are independent changes, they should be tested and justified
separately.

The patch also leaves every cluster de-voted after CCI setup. Is that
required, or should the previous power-down state be restored?

                                            - Troy

--85af88e759ee7a5092d0aa335bd330c325036da76bbf7bea31f446e1c16a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapY3fw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv/mYBAKldNM9441xd8pA++NV7Vr+csvzM9xrYM5ueChvp
XMVuAPsElI+SuiG4HU2kKLk+8XRHVXHuBRyLRHnNfOdOlAdmAg==
=AXgO
-----END PGP SIGNATURE-----

--85af88e759ee7a5092d0aa335bd330c325036da76bbf7bea31f446e1c16a--


--===============8869790856909858935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============8869790856909858935==--

