Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDE2C624CE
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 02:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aD399X02jN3M2bzCLomKxXC/HLS3vkSA6d3aGr+jmsQ=; b=LnRJnLAf7aU8vIYT0GYASkxWNh
	7G6SAyFgICBdE0UZMfXiJig2C9l/nUfYNaUmpDbZyn3g9mIJcLp+yOht2QlDNL4EaZbwwJ+vMTvI0
	BfAiNoe0JT5ILmMBO32g7/VFJuL8pPO3ffzWw3fzSMl6WH4npcq0tLIkzK5p7HLkwR047/GI7Rpa4
	Ey5+bE1j6IezYpv6xJhciHC4Ebf9eEHuVH5r6TfeNh3ydXB6DXWXuvvixribrEj9NXO5J2cDnXB14
	qNkM3ewHzbiw6oELTX+aSJbxJEAZUcX00IgZbIEvh59euql8I/fje8+6WZi0oaua1tFQlaCQ7SaiT
	55m5Vjfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ECK-0000000AsFr-229I;
	Tue, 01 Sep 2026 02:26:04 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ECE-0000000AsD1-2C8q
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 02:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788229526;
	bh=QBOYdPDhHkKdILdkRmrXdAZrmJfc+vHO52EE5Px+jAE=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=lmS5iJ3kbWSazpbok0MnNdT5OtQMhOCa6ITy/3JTritePSm+vaUgvkhEdXle4nsV9
	 UduHWG02TlsS1+NtTuFuDGJSOvtGyGR/WwbfZex6MzBIXo00BAg3HDWzNPoZmVkX3V
	 tgGusxAZ+GmrC2FyniTArqR+WtJcA/7ARmS+EtAg=
X-QQ-mid: esmtpgz11t1788229520t1f30fd7d
X-QQ-Originating-IP: Jvq7d2Am2wdqYmy5yr4stLmuwWFBi1bqBWKkfx2w0vo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 01 Sep 2026 10:25:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6546792657000385099
EX-QQ-RecipientCnt: 8
Mime-Version: 1.0
Date: Tue, 01 Sep 2026 10:25:16 +0800
Message-Id: <DL3MGIY12GHW.1W3S0MLQIOM5@linux.spacemit.com>
Cc: <opensbi@lists.infradead.org>, <troy.mitchell@linux.spacemit.com>,
 "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Anup Patel"
 <anup@brainfault.org>, "Bo Gan" <ganboing@gmail.com>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 3/3] platform: generic: spacemit: k3: wake A100 core 8
 for ESOS/RPMI services
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Valentin Haudiquet" <valentin.haudiquet@canonical.com>
In-Reply-To: <20260831200832.404000-4-valentin.haudiquet@canonical.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
	<20260831200832.404000-1-valentin.haudiquet@canonical.com>
	<20260831200832.404000-4-valentin.haudiquet@canonical.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MUkkTe8efE32dwp5vaPWQlfNW4KfPf1GU5X7pEgc5qk9Ol6ECStEh7bt
	f4hpHL5nXf+aJVAkmoKiDMlxdjXkEChRD10f3lNlqSnXuFsPHtc6U+Egu9qu1yHABfW2PSG
	kA4wxRUOKk+T5LHyBxUKt4Xw8GX1iuZlhSqp9xbakb/s+n0Fqhh99Fq+SYIZLJpShbKCR2P
	hoNcXUgRhsNU/MD01WKLcOnxvrIVCib2pHWBi1ubBVrF5tBeV3bfUCLtfyLnEu4uqSh0DRa
	xcJ/M2BZv5CRFD6xyz3S8mcqeXM+KDAd9B8GWf8YxHnAvO33FxmzVcV/YUKEhnB4xyLt4yr
	AtFvaHH0PFPlorwIqmcMlB2bMPsNI3LOUSCpEFD8TkGLhUq7Kp+oTXv0RNrJnq2QpZ9BJzN
	YEz43fREa2J4JDvbpXwq+Pq5Xlce4AWvWIoENDfxNqQl2SXgBoKETdA0vn9bZPGxtbnGjst
	Z0U2oM0JJOgBwZBS2lSgs2NKnROB7J3juNIL9tqXn32n+O7VJmmlIWb7o9t8hPoMLWz5PbF
	kvQtQTwIJDeIsC/oo/c1zgjcPxTcjY0pAJIKDadosZmq+bW8CTShTZXGBJJTjOVv6VEYFz7
	B5JW+absfpLvoaleqjKlUWOXsw26+Wlz4ii7YK1om606uu5/6/7I1JCxite9vPa7jQ59pzd
	TfXl2yiEH+ThmUjZTDe7anOND0Q75TF9EHKKzJUwjX7mePmYsERJxQCKS4o5l+qWdMSrlGd
	HtyI6veZP1FAkVpMD4HlV6szLjdJFar9ajO70MASC76MMv7o1XbuCx4kf67CK250SgLxIC0
	wuSpPFKk17ETlu6tqVrp7Q7s3qiKC8b4RqWRXgcucFHosa606z9cigFHfjWhT//gGOZsdBD
	aQLB4Gz2Qxu5WwV0m9sHRk/HCnWO2evZ8i36o40OG4b3/N/JHSk10e5WUwHC4AZGRXNkT6t
	rymvEeekhloB0j/xFZtcT28TXjc0JqZyZnm9b5Jkn/+5B/ISQi13WH4ylkoiGTlfJJ//++U
	4MrooCltfbvEdeDCXHJJdvfTAD4EQ9fiBPh/nJWUoAg30cE/IwlbhuFs+qP4BR4XtHbh/A/
	SKynDHRTcr/3gLvdqNw0UMB/JKs13B240vOgIWdk+KO
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_192559_038227_5BA44476 
X-CRM114-Status: GOOD (  12.23  )
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
Content-Type: multipart/mixed; boundary="===============2387940198243029906=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============2387940198243029906==
Content-Type: multipart/signed;
 boundary=4169e9f9f5d68e33e4a47f1daad6c0ffa4ac5a2df9992bbc0be7d11063ab;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--4169e9f9f5d68e33e4a47f1daad6c0ffa4ac5a2df9992bbc0be7d11063ab
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2026 at 10:07 PM +0200, Valentin Haudiquet wrote:
> The K3 SoC has two asymmetric CPU complexes: X100 (harts 0-7) and A100
> (harts 8-15).  ESOS -- the rcpu-side firmware already loaded in SPI NOR -=
-
> runs on A100 core 8 and provides RPMI services (clock, voltage, device
> power, system reset, suspend) that the X100 side depends on during boot.
>
> Without waking core 8, all RPMI mailbox transactions time out and the
> system hangs early during Linux boot (at basic.target or
> cryptsetup.target, depending on which earlier fixes are present).

This does not match the SDK firmware layout. ESOS runs on the two RT24
RCPUs; the FIT contains rt24_os0_rcpu.elf and rt24_os1_rcpu.elf. A100
hart 8 is not the processor executing ESOS.

Please clarify what hardware dependency is satisfied by waking hart 8, and
provide the exact kernel, DTB, FSBL/U-Boot and ESOS versions used for the
test, along with the RPMI request that times out.

> +	/* Restore C2 RVBADDR to the normal warm-boot entry. */
> +	lla	t0, _spacemit_k3_warm_start
> +	li	t1, C2_RVBADDR_LO_ADDR
> +	sw	t0, 0(t1)
> +	li	t1, C2_RVBADDR_HI_ADDR
> +	srli	t0, t0, 32
> +	sw	t0, 0(t1)
> +
> +	/* Enter WFI until the HSM starts this hart. */
> +1:	wfi
> +	j	1b

The vendor OpenSBI path powers hart 8 back down and flushes and disables
its caches and snooping before entering WFI. This code instead leaves
hart 8 running in a private WFI loop. Reprogramming C2_RVBADDR does not
by itself transfer an already-running hart to _spacemit_k3_warm_start,
so a later HSM start is not guaranteed to work.

If this sequence is required by the SDK firmware ABI, it should be a
separate, DT-described compatibility path and must preserve the normal HSM
lifecycle.

                                            - Troy

--4169e9f9f5d68e33e4a47f1daad6c0ffa4ac5a2df9992bbc0be7d11063ab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapY3jA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvL7ABAOVeg3qvciIEkBYRKLnUtBNKO4jRHtjBJTAbkN3D
REBGAP9oyAki3jnKV9mJKVVcFB3YAmOAjKjRF37vBdWe3dvoCw==
=pmv8
-----END PGP SIGNATURE-----

--4169e9f9f5d68e33e4a47f1daad6c0ffa4ac5a2df9992bbc0be7d11063ab--


--===============2387940198243029906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============2387940198243029906==--

