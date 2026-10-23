Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB12606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 02:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rdqDdfAG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=U/q6ILsG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DA5VfJ6pE078mFTQvuBw/TW2Q0CCHJv/kqs2vvxnq1I=; b=rdqDdfAGdapmfEVJU65iphTT8s
	iCkE/XpF/2ZIR/PjjkJ7Z5N8NDsvreY2aFm+7skXcDE95jDdImuKo/pdqVIEdR7c72dQY6cA6bm+U
	NLoZs5NHPd5g63uGrB+GaRXldvesdHqkcXnRTSM+tZZTFefbKk9C9HiNsusFiPJPzmP4xRNDGlcmb
	utJh0tYfYxfIeoMRNt0KA4bxW1H/C6trYxR0LcDoHKzdRxzdsRX2+Ggh/PeScP/8ASa5Fysc9Mpr8
	ZeJZfSjeITsT4oLW28PM3pWJZAbO5bqwE8QDaQgCovQBDqn7hkYel+0i/BO0zf9DRt8YorrQ4hlOO
	iGZaAxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5FI-0000000FKr6-46lf;
	Fri, 23 Oct 2026 02:43:04 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5FF-0000000FKqP-2vaL
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 02:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792723326;
	bh=o5MUFMJNSG/otsrWNqCl925dHDvR51OoyPmUodP/Yow=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=U/q6ILsGY8kN6D17X9JuB7UJNOYyiF7u3F95QtgSz5Q6/pm/vHb/rVR/54/r9FQRk
	 zWOj46blc2Wtrk4bIVER5xYNGqH7P4hm5jBVdnpzEqgu6RWHCmYmz5osIrl0xb0sPL
	 mA5QqyWSoY1/GjkimmTKP9CXLKgRTKPVbm8E7hN4=
X-QQ-mid: zesmtpgz6t1792723325t10449701
X-QQ-Originating-IP: XXR+WjcHIHJobxAp0KF7QNMR86y56qZku6lNRdb6ZQs=
Received: from = ( [183.48.246.89])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 10:42:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11974774756849050768
EX-QQ-RecipientCnt: 11
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 23 Oct 2026 10:42:00 +0800
Message-Id: <DMBVDO4HXQW4.667LHQKG8GJ1@linux.spacemit.com>
Subject: Re: [PATCH v4 0/6] platform: generic: spacemit: add K3 platform
 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "E Shattow" <e@freeshell.de>, <opensbi@lists.infradead.org>
Cc: "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Anup Patel"
 <anup@brainfault.org>, "Bo Gan" <ganboing@gmail.com>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>, "Kevin Zhang"
 <zhangmeng.kevin@linux.spacemit.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Alvin Chang" <alvinga@andestech.com>,
 "Valentin Haudiquet" <valentin.haudiquet@canonical.com>
In-Reply-To: <c4480699-3a81-4530-be59-064b8642343a@freeshell.de>
References: <20260910-spacemit-k3-v4-0-0793b62329f6@linux.spacemit.com>
 <c4480699-3a81-4530-be59-064b8642343a@freeshell.de>
X-Unsent: 1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MXxOvBTX870HAAlxOphto3xdHWn5M7TaKLJqusDL6fp30zQmFoOZAzJA
	2w2eDgpzJAhaMBkQIzr04l6yO326xYvjPaDEEaxYsvFLYgpH+RrC68eXnx0mCgExp+BHTTA
	RztDUmyVcbLfRmc4T2XVA5F6sRwWpY9lzbwMOWy1g3bHOuzlt+3XR2Qrz2WO8WLS1arKouo
	eJILmP3AGSgE7kTK1gyi/CzbSpaD574qVuz9XpftzUnfbaPuK5E6HgiDrarVvn3kkwwbQgv
	DYJq1urLClwM/v9QuSkxRXXP8zig8NLfrkoWRB41VV9Ol9TrnASLt97KmT14BsMdPk48RtZ
	l3Tnd8RKULBhB7kXA/+/DNW/O5GihgobMn4sfyGKIATPFFPdQ4yKKDIHQOkdcGXBKUU5D0J
	hTh5DYpPu6XxMSvPbZ0OgNho/RQJg7BmPWHEf+sXdG4MXF/HU2Q8Y5jCEjaMiEA6flVphy0
	yKHOAQWqXqSIG9NviKrwQY2KqFsT5oleI7dQma6qU+voCEbmyDezBvRovpFrQYMACCXVOXM
	RAflMvmL2roMq15+eHO1u3kPqDvbxnE5Gp8RFGtlbMsUdxU3lm9WUQsFLrZMTrCXsMRLDJ5
	vFo/n9Shx0gMpMxGsuQ4P8o+DejAWZ7liSCStMXOSWz43WJynAOkeOS+cjJ4NO5YlYSNJEt
	rxO4+SpJjs03UcibEDX1t917uoroCzVbeVgdI5IcFFDwaZN/W7fFv1spGBMdXibmStMUDyz
	ZVUH1Ek3mwYfc3hN/ecyRofPOhg3UuIvb62moWPcrP7GYpEt5bd1l9ADI83Dj1VIS+zlF0B
	G2IowCviWC77AYwoZg96LgjpiZONuOCP5oqBdqy6D9+zCUZP3j3k6tbaOGZntn5usqIjr0u
	t6kWxpSRVcksdz/7X3lJlwT7MuZk57d9FjZPjQ2l/Giq42dwOPisAnLk5IyOb97xEY42PUa
	XrsjsLYuX2CKiFsIFq9u/fp7t9IB1UONHgVqvNgVMVEYKwH8ue/BOdDvob9rFf/v8Iu3k7X
	GxuYXBGx5ivGjmlK8lU4uuUgaOBMXxZuM1eeR4O/sn/ezuxWhPJSoEYFpLwVHn8OPR5pQPg
	wRtdyhGHzVhmVAP6Z8aHoC2yB6DwSyAbQXH0r97o63xHpfYqHrQwluUL61hA8gYnA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_194302_321452_F65509D4 
X-CRM114-Status: GOOD (  18.69  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7325896500757463009=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7325896500757463009==
Content-Type: multipart/signed;
 boundary=bf1698f05c4e8dea55e16fa858667c4a500a3ae0ff930af9bfb4b50b7028;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--bf1698f05c4e8dea55e16fa858667c4a500a3ae0ff930af9bfb4b50b7028
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 07, 2026 at 05:28:31PM -0700, E Shattow wrote:
> I did suggest the change to be included by the vendor as a pull request:
>
> https://github.com/spacemit-com/uboot-2022.10/pull/5
>
> However I do not expect this to be considered, as the vendor uses their
> own fork of OpenSBI.

I've already passed your PR to the team responsible for our U-Boot tree
for review.

> [...]
>
> Although I was unable boot a Linux userland from vendor 'FSBL.bin' plus
> the mainline in-development 'u-boot.itb' the Linux kernel appears mostly
> functional and does output some messages up to the point of 'init'.
> There is no dependency on any SPI NOR flash content at all, it can be
> fully erased and the 'esos' 'FSBL' 'opensbi' 'uboot' NOR flash regions
> are not involved in testing when loading in-development for mainline
> U-Boot (including mainline OpenSBI fw_dynamic.bin) 'u-boot.itb' and
> whatever SPL (currently the vendor SDK/BSP 'FSBL.bin' SPL) is required
> by that.

My COM260 test reached a shell with the SDK U-Boot and a minimal
initramfs. Could you share the full boot log, U-Boot and kernel
revisions, and the DT and kernel command line you used?

> [...]
>
> I did read through all the patches in this series for any obvious style
> problems. For the series with no endorsement of suitability for what the
> code does or how it does so, okay to apply my R-by tag (and/or
> Tested-by) and with or without any trivial style corrections as requested=
.

I've dropped the redundant cache-flush comment in patch 2 and used BIT()
in the K1 nascent hook in patch 3.

Thanks for the review, testing and tags.

--=20
Troy Mitchell

--bf1698f05c4e8dea55e16fa858667c4a500a3ae0ff930af9bfb4b50b7028
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCatrJeAAKCRCYCe+A+TM0
L1tmAQDVMFl60terVf3W75tKHRWyuJXWVK1VkK/AGpEc8fc5zwD6Av1VMdyUypfY
djZWn/QM6VD+ucC96SnwPneTlmbIfAk=
=g5Ya
-----END PGP SIGNATURE-----

--bf1698f05c4e8dea55e16fa858667c4a500a3ae0ff930af9bfb4b50b7028--


--===============7325896500757463009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============7325896500757463009==--

