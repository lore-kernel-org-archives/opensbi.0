Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C578C61DFD
	for <opensbi@archiver.kernel.org>; Wed,  2 Sep 2026 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8qob77F3ezgsqNd88UCgdOGIrKCUPe68Ae7+8lgA6k=; b=W/alvCe+4QHX2b8fOTN4JzxeQ4
	yxMzap7tyQSfcNz4FO1jtGPO0aQE7H45WNTUtra6Vs5JRHwjYipVjj/nKKj63jPcZQG4f4RN2r7nn
	fmBVjgX6j5RdRxJMEMRFJ0uVszjR8uK5SYQ+n/jIpjZ14HlvF9/4Bdjp1mW/5k6nVLKCqkPQApHuu
	NDp0Lef+G9hcqXrGH8CoevaxBN1JvUOt9t57m1upAJGpOeZAchz/ehELw0vwosM2d4dmalZ2cIlio
	zkSUfi3rRy8Jzdd+w0YmWSFAkLIERYLTYTnq3LjocwQpngpZ9d0UR7Jcqcq1DGchuOJd2Y7LPh61H
	JHISrnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hQo-0000000EEzy-1lk9;
	Wed, 02 Sep 2026 09:38:58 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hQl-0000000EExg-05Bc
	for opensbi@lists.infradead.org;
	Wed, 02 Sep 2026 09:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788341893;
	bh=BkAvESoC/vKLvQgamaZu3dm6WTvyS4YGaU7k+z3H5RI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=azzA4yi37yyACm0TlYSQJXqx3nyOtE2k8PJJbx4DbLGrAlQ3nHgrvM75Wvl2s6nBb
	 Psvm4ERwO9aThDPR3m2l7tz6C7dGpAqAtMx8b4vcGrJ1A2Z2f4Y24T+bOwTnPHgaXo
	 OaWv3WyuA2oDQRQB4isgtDR/BkFirFjrxDOmX8SM=
X-QQ-mid: zesmtpgz9t1788341888t23336aa8
X-QQ-Originating-IP: +yUBTXITC5pFBv2lGmNida5yMXXi1me4v5xjQSA7Zzg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 02 Sep 2026 17:38:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4263174612460420731
EX-QQ-RecipientCnt: 8
Mime-Version: 1.0
Date: Wed, 02 Sep 2026 17:38:03 +0800
Message-Id: <DL4QAFEBOHOQ.DSF67YYWU9N4@linux.spacemit.com>
Cc: <opensbi@lists.infradead.org>, "Xianbin Zhu"
 <xianbin.zhu@linux.spacemit.com>, "Anup Patel" <anup@brainfault.org>,
 "Samuel Holland" <samuel.holland@sifive.com>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 0/3] platform: generic: spacemit: k3: follow-up fixes
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Bo Gan" <ganboing@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Valentin Haudiquet"
 <valentin.haudiquet@canonical.com>
In-Reply-To: <a2f37394-2cce-4168-9d84-df51aade028b@gmail.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
	<20260831200832.404000-1-valentin.haudiquet@canonical.com>
	<DL3QRSFAH67P.3K76LXQO2VWBC@linux.spacemit.com>
	<a2f37394-2cce-4168-9d84-df51aade028b@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mcbsrq6aJHkIK/w0uubbUhoxMn8c/DEJ2gH1Cd1011azHWu9dmj3R7LQ
	K6h26wJM15IV55TP6SV2cwXA0yUrFqq12HNSckKblmKrh9pwW+U/EdSwJCqi3ebDF6h96/v
	/wB+1v9xqVdhWmBHxYza6DtnbZclYdxOG3VFGNQKk5jZru5KBcVf7cotPvr3sqH+x0nwAVr
	p0/dfFRRdE3dtwQq/3h3IAn4P5ABqvIuLXq8MjIHNGu7mjdA8gIJo7HSNR1F2enY1SM6FDv
	dgXhAlEcRdtIP9UI4T36kN6r3Tyf6FoXR/L246B/E2kd54eEYiqvwgj/fTz5Tts/VRkD/FB
	kBxVhHZwa+ARiYTDk0CMe4FjJ1ixBYdup8iLfeyikcHi0Ai0dSsk7l5VMXlwgEt+qW8/vJz
	aDbIc8+q1c3Hqb2epDeD6+4u208iskTA4qMUFNGqZCeeIophfldyWjPhwdnmX3jJWxHbt9j
	a4XtJyPbJhEknH8qIqD6LAoNfTdWpTUY7cchqpdRzUZqMb0F/ICcix7cY7MwkTqMOJtVFrQ
	x5jd9WGNgJlB17PJ/wa1xDaWyhOt/OZUA4I97tM3buv9sQj1XsPgG7NK95OvRfrYekn2mYZ
	UEZz4p0zAa/wSk+4uuEEAYivWKk1ctIBiRofQqT9foTDIHkY9iPmmQT4YSOCiSOy7ddD0SB
	hyDuzAS6ptQUWFOzzE73vZhFy6Br5Bg5h4MDqIYD+QpHkN1VT3VgBZx378yJeG0Lu3jLRy+
	TOOVaxOS4Fcyxf4yaAHCshMfO/YhtLtTyw5fDpIKc5PMjvw03YwVJdT6wb6MO9R3vwXaqMa
	p+kN7nKeq4GL7i3cemKMYCpggYIdNe/ZMHs4g0z8pcnOmXj2GLDqVlGDTYTU4rzoaEaKJoo
	IZfevp2RLi6Hdf0HujLR9gY6GS0Q0DW+V4r5/7dnYs+BP4st+A7vBL4dJWnJLT4Oa1Wqt9j
	orVaXW0bu+pZ3XUOjQgHOC2QUpA3EjgApNucGH1gHWl2oYA3Zno8ZJuMzjaBaBElmSgaaXB
	IuCadqqmaLPHZbFWS0VIgMlKeWTSdDa2HSvC+ZNVuoDl9CwZQK/HVKSudoID8ev/YwGY/7a
	gs1OXpKa6LUw9H0Fd20TY49FL0t8j2AirAbPdwIrPfZg+aZtHVR0mo=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_023855_732753_21107735 
X-CRM114-Status: GOOD (  13.57  )
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
Content-Type: multipart/mixed; boundary="===============5576346156521448734=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============5576346156521448734==
Content-Type: multipart/signed;
 boundary=5414943da445e0c4a53519e6eb43d5cd93635a38a6dfbb5f802cd3bbd628;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--5414943da445e0c4a53519e6eb43d5cd93635a38a6dfbb5f802cd3bbd628
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 2, 2026 at 01:41:16AM -0700, Bo Gan wrote:
> Hi Troy,
>
> I missed this one earlier. So basically I need the latest upstream kernel
> to be able to test this patchset,

Yes, that is correct. I have only tested this series with the upstream
kernel, not the vendor kernel. Sorry for not pointing this out in the
cover letter.

>
> because all the rpmi backed devices in
> vendor kernel device-tree just won't work. Perhaps this should be called
> out in the cover letter, so I don't have to waste time debugging vendor
> stuff. IMO, leaving the rpmi stuff out is the right approach for initial
> work. I feel that path needs to be properly reviewed and make sure it
> fully conforms to the standard.

I will state this explicitly in the next cover letter. This series
only provides the basic K3 platform initialization and start-only HSM
support needed to bring up the X100 and A100 harts. It does not include
the vendor-specific OpenSBI RPMI support required by the vendor kernel
and DT.

The relevant public documentation is available here:

  CCI and PMA [1]
  HSM-related power management [2]
  Clock and reset [3]
  SoC address map [4]

We do not currently plan to publish additional K3 hardware details.
Before doing so, we would need to reorganize the documentation and review
which parts can be made public. This is a substantial amount of work and
is not currently scheduled.

Link: https://www.spacemit.com/community/document/info?lang=3Den&nodepath=
=3Dhardware/key_stone/k3/k3_docs/k3_usermanual/08_cpu.md [1]
Link: https://www.spacemit.com/community/document/info?lang=3Den&nodepath=
=3Dhardware/key_stone/k3/k3_docs/k3_usermanual/16_peripherals/power_managem=
ent.md [2]
Link: https://www.spacemit.com/community/document/info?lang=3Den&nodepath=
=3Dhardware/key_stone/k3/k3_docs/k3_usermanual/17_clock_reset.md [3]
Link: https://www.spacemit.com/community/document/info?lang=3Den&nodepath=
=3Dhardware/key_stone/k3/k3_docs/k3_usermanual/06_address_map.md [4]

                                            - Troy

--5414943da445e0c4a53519e6eb43d5cd93635a38a6dfbb5f802cd3bbd628
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapfuew0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvTMkA/2NpQ91eD0BQjMIPP26/l94l2uxr359FQQj8Nkhy
3vSNAQDv5hhVr+Pf+Hzl46MFHramj7kBmH6qKa7l6WQHR9ryCg==
=gaMR
-----END PGP SIGNATURE-----

--5414943da445e0c4a53519e6eb43d5cd93635a38a6dfbb5f802cd3bbd628--


--===============5576346156521448734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============5576346156521448734==--

