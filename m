Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C78FD0057
	for <opensbi@archiver.kernel.org>; Sun,  1 Mar 2026 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vQYnQvMLu576tB1tNXNqNARZJjQS2QzKahfhDTZegg=; b=DO0DZi7VBPeRkIgG76BDJB8nNV
	tjTmhJ1R9KNZMG6EnOhuxTSu3cUehzFB3Zo67Zi+ZHSn8E7t1SSQ+bzOVJouoanq6Y9X1atSlIOGa
	0bChmf+srZgQ5bUiDGTTp0rCMvARG/ErqXdFQaaJCZKqMNbsNWh8G6SHJrhWNNTD49o5LvZOIocSP
	MshFDCDk9kC+BUG3WjEpZNe/uV6ae1SXi9sdvG9ETDc/0KmDZfTzo6Yq7Qdkq0kQroy5QpCme2ba3
	KSpJERvhLbEuX4QmzvUKHg+fmU+qx2g9GjSGfE6P48U093Ln2Lqd973be047Ez236zjkVqQEQqPf0
	4opvVMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhas-0000000BZNb-0RYm;
	Sun, 01 Mar 2026 14:16:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwhaq-0000000BZNO-2Fcr
	for opensbi@lists.infradead.org;
	Sun, 01 Mar 2026 14:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 850BA60008;
	Sun,  1 Mar 2026 14:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463A9C116C6;
	Sun,  1 Mar 2026 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772374583;
	bh=MeRa4Wb3j8i3I1giPLGsVE15BLaamtPFBq4h0OZKVrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bcm9bgoaOl1iAfQtTgCpw/FNJWSllp/oCzsv8Uz2vvsCXOXtS3Jpj1EMwzM4cr3/V
	 1dhQ/GHeETN2ugMUUa2vilftTGUVOR0fpaDnsqKRUbxCgKd3fG/mHzlvFWw+7Ssg31
	 oOtYWx+ehEKbeddCzxIm8XUp3naGswJ+i1aFX9XrTEYlk+kw8aK8zRi8fEAkqqNPyX
	 x5U3SMOQwg6USOTgynE4rks69kr3gI9/swlpCP7sLN2hZgvwsCzFuEEYQIj9BAY+7W
	 J2TDTuD430UJo/f1DxOyw1l7T5kpa+YMrGAHKsjQpbKnG4gVMV5U9ZzVQJpw97Uzpg
	 CeitOBP8Rj5WA==
Date: Sun, 1 Mar 2026 14:16:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Anup Patel <anup@brainfault.org>, chao-ying.fu@globalfoundries.com,
	opensbi@lists.infradead.org
Subject: Re: [PATCH] platform: generic: mips boston: update "compatible"
Message-ID: <20260301-embellish-aorta-a2ed332d2303@spud>
References: <20260301141332.2941601-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
In-Reply-To: <20260301141332.2941601-1-vladimir.kondratiev@mobileye.com>
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
Content-Type: multipart/mixed; boundary="===============2066813559178701526=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org


--===============2066813559178701526==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iAn9yokEKZXg3VHi"
Content-Disposition: inline


--iAn9yokEKZXg3VHi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 01, 2026 at 04:13:32PM +0200, Vladimir Kondratiev wrote:
> Use a platform-specific compatible to avoid clashing
> with CPU compatible
>=20
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--iAn9yokEKZXg3VHi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaRKMwAKCRB4tDGHoIJi
0gt1AQDrA23NFnjv0At/s60o2Cq90LQbCjxsSaAoUi/oJLJhTwD/f0kFYwZOyQ1e
aX1siYkygeU4y9QK+hRjWo3w9HrD0QY=
=TqiJ
-----END PGP SIGNATURE-----

--iAn9yokEKZXg3VHi--


--===============2066813559178701526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============2066813559178701526==--

