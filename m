Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33C2FD3770
	for <opensbi@archiver.kernel.org>; Wed, 25 Feb 2026 16:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgRx/1ye30HbRS1sUgLBZhl9g/nnXzJHKVdHL1PT/vQ=; b=3UpFUzNpmDF28bCHTGgmk06exg
	6NdnlESG10L8xfefMhRfgDIOizfTHGo3tU0ikzpF+C8JQohN8m0Gxt1YsNqlfp1+xToF52LpQM9iq
	h8etoUF85X+lHt+WvaY9jH7IPa9YL1ljS3Aeo0+tW+bYm4eFqRdNQXapyuElcjWFvLIkZtOVDWGWz
	/f35Eh4Y+6LR1B4EIL7zv/dZmQYol8i/XYJP1AMzQ0HYsHh3xpuWX2fIUKO4NUHMckvZeoVucQGIA
	Uc5izvxEDA3ApxRkm1MZ/6SfkVuKAfNxkjMiFjMknsnAGNW4CA/lPasBrQiu2E5UNFN5lBp7C5yqV
	4VMy+M2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHTC-00000004SUn-2zMH;
	Wed, 25 Feb 2026 16:10:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHT9-00000004SUI-3ini
	for opensbi@lists.infradead.org;
	Wed, 25 Feb 2026 16:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07B1160126;
	Wed, 25 Feb 2026 16:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941ECC19421;
	Wed, 25 Feb 2026 16:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035834;
	bh=ejNYr7KWkM4DMc0Zye6rGzDTEuKD5Sv0tcT5dmqaWkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=du6G3/e6y2EWNeNGqwbZgX67I6u6e0yT1jMWY1bnKr1ORXIsriN5IsBXMdJ8Sp1GX
	 iF+VBhTh7Ex90LiKf7s0cYJhBn2L4h5MkSlXR+j0J14dN3sf7TVD/NRlnwWGoqu227
	 MUDcojk6bsJj9Tw+F6tmsA81m1ds52Pje8tSlR7WO72+8DD+TZV92k1+epqwdTytOw
	 wSulypABNpY4qdfbxetDUkRHhaeVqzxE31ZxRh++PpTnWaWO4duQpr0oIKQgNfNx0f
	 njLvU4xDWZ1MkyglKCnelgqX45S9K8rrOVdsdg6pTtyF0Dkdv7v6yWLgM+Pm3wNrf5
	 pZVui5newL5vQ==
Date: Wed, 25 Feb 2026 16:10:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: anup@brainfault.org, benoit.monin@bootlin.com, cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: Re: [PATCH v3 10/23] platform: generic: mips: add P8700 based
 "eyeq7h" and "boston"
Message-ID: <20260225-untying-tapeless-5652a2b62925@spud>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
 <20260223-for-upstream-eyeq7h-v3-10-621d004d1a21@mobileye.com>
MIME-Version: 1.0
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-10-621d004d1a21@mobileye.com>
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
Content-Type: multipart/mixed; boundary="===============7891600659714142477=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org


--===============7891600659714142477==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M6kfNSCPtAXtwpqK"
Content-Disposition: inline


--M6kfNSCPtAXtwpqK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 04:54:49PM +0200, Vladimir Kondratiev wrote:
> Refactor MIPS P8700 support, convert P8700 into a "CPU" and add
> 2 platforms using this CPU:
> - "boston" - FPGA platform developed by MIPS
> - "eyeq7h" - automotive platform by Mobileye
>=20
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

> +config CPU_MIPS_P8700
> +	bool
> +	default n
> +
> +config PLATFORM_MIPS_P8700_EYEQ7H
> +	select CPU_MIPS_P8700
> +	bool "EyeQ7H"
> +
> +config PLATFORM_MIPS_P8700_BOSTON
> +	select CPU_MIPS_P8700
> +	bool "Boston"

> +static const struct fdt_match boston_match[] =3D {
> +	{ .compatible =3D "mips,p8700", .data =3D &boston_cm_info },

I'm not really too familiar with OpenSBI internals, but this looks wrong
to me. Why is a soc being matched on a cpu compatible? Shouldn't this be
something like "mips,boston"?

If this is a cpu, then I'd be expecting mips,m8700 to appear in cpu
nodes, and not in the board compatible entry at all.

> +static const struct fdt_match eyeq7h_match[] =3D {
> +	{ .compatible =3D "mobileye,eyeq7h", .data =3D &eyeq7h_cm_info },
> +	{ },
> +};

--M6kfNSCPtAXtwpqK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ8e9wAKCRB4tDGHoIJi
0o+UAPsEnX2+5o+y2ZSleL7SgnNfInXTppF56vS/XMZnlhF8awEA5LMTGNZD4JWl
cZ3ErHdgr2WPq8SUUmiUH7RUIf15Kwc=
=fS41
-----END PGP SIGNATURE-----

--M6kfNSCPtAXtwpqK--


--===============7891600659714142477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============7891600659714142477==--

