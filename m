Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6267E606A31C
	for <opensbi@archiver.kernel.org>; Thu, 12 Nov 2026 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AaINaLXm;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NONQ5PHJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V9eyRFf5dGAOPjhlvIdoj32fs5UZZso97pSzl2Cwasg=; b=AaINaLXmzHLmEZjBU+3d1l4c2u
	MbD7VzP77/OFjxim8mLBk/Zpk9N9LvmRvr7nJOI1KtH1SCCCCFrBMfyqEcJKcIMdkdHFYiK/I+I8H
	4CF3nB1GW0MqgVnLDywrHrV5aSclo3JQDUIaGokKVlA/9oGrnrF5i6we/fyUxLt2FEOVXgEZHqYNZ
	deCVIVCjKKCQLFze/qX5Z3ArxzTXcHDtoZm+X/qqOSaX/8AtoMlr7H1utGbXcGLoD27VdQ6EsfAbs
	5+2GgT7nMG1KLi5faeBmz0GqZJvtJImtyiDue8nEpjNiTIFQ6xSHFHXzEHXssi4sQHzYZA0I/QlW2
	cztR+qwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRW0q-0000000AIq3-0gjI;
	Thu, 12 Nov 2026 14:42:52 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRW0k-0000000AImt-128T
	for opensbi@lists.infradead.org;
	Thu, 12 Nov 2026 14:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794494545;
	bh=izpG6GdX4ONAsRLhktGZCElk9ZbTt5RUuO4cQdY86b0=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=NONQ5PHJVXGuTrHAqyAEcKLMZyMpCWq83TcwsNFwGAshkj5qJ6WaUJF8Avc1L2Hmp
	 oeqsl5c7rGekB4bxLgG5tkJ0ZR4uf6Iqao1UYB9qIXoQoPi8jKrSE0s+K/LQ69/Vml
	 w31eXJm18wKdnPEb7hgd3aHFcOwhm8Qw0XSD8lpw=
X-QQ-mid: esmtpgz16t1794494541t153a7ec0
X-QQ-Originating-IP: WKuEaBiqh1XR07rwTNn8HEmWDjeOrRHOG5eYrbXauhw=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 12 Nov 2026 22:42:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4574130496544528901
EX-QQ-RecipientCnt: 7
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 12 Nov 2026 14:42:19 +0000
Message-Id: <DMTB82JMZZAU.33S91ICSKQJA@linux.spacemit.com>
Cc: <gaohan@iscas.ac.cn>, <troy.mitchell@linux.spacemit.com>,
 <xianbin.zhu@linux.spacemit.com>, <anup@brainfault.org>
Subject: Re: [PATCH] platform: generic: spacemit: k3: deny S-mode access to
 the reset vectors
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "liutong" <liutong@iscas.ac.cn>, <opensbi@lists.infradead.org>, "Xiang
 W" <wxjstz@126.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261103094415.3007814-1-liutong@iscas.ac.cn>
 <ed4015c1beede6efeb899735ce1006cd51ab7269.camel@126.com>
 <20261112091316.4067761-1-liutong@iscas.ac.cn>
In-Reply-To: <20261112091316.4067761-1-liutong@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MVrgqrYyvdm9WKi5tz5kUfcK2kx3zRyR6bMo4nj9MQ7U5ExHeGBF6wbi
	2QHfeP3tab0w4EF0y8ZyUhsMLwWcWeAH9uWQa6BOlAVVBea9tRyFMizf6kW3BsCpbKgRTC6
	ZJYNt6nCmjfyi+Y9Y9/tHoo+DV317Yuckt1VW3/Bd9W9ntExZ20xywAoWBJ3sT1Xj0iHnmo
	vPOI0MWLyz1iuAJK3Rkzc8P6cdztmH5jRHwHM0FWqpkGHFEqNF3H1ME3wYlVA2g7ZwpwjSs
	6GCGXvJHNGt+5eizkYKIkwjemRBcQJ0WTuaRxpGdxm4Snm1Ha31s4Yk7kNRSxkmcxXzatLc
	SjX0f9TQFSkcbqYRg0m9sZvz/lkZP0mUYvg5nlLa41FaRnNtoNXrKAzazNTicbLahaSzLHD
	POaPJqwmHnKKE/bx2pq7Uh56s/3YRABV92hh5EgBTSRVAgKXIvZXEaJqG+s/fvHymC4grjQ
	5y2GafcNSt/ypvrFL+ekozG0oMiR/gGsikYQLCNYPB0/TUn3S1ipW8XzWcwwMaAKRVmuA69
	pViP12os6fWraXIVD+V8uzDFW60JyGkQnHt1HxT3kZTcFLEaKy1ciYjkF4wgbNBYI2BWPeu
	OCR0vlAotncj1PLOyBE+83JuFFNah9e8kK+T7wGA4AEA7iZPt+7O3zcsy3532WeS0RM737Q
	SznBSh3XTX7yChqXxQ1ePSq/7vg0OFECdbK++tRmtzkzbg8zbiupo1UWusp8F5dUkQwo3qz
	KloIqnwa9+McWNlflTn49PwxhgkIm20pZbSMeOxwgUG5OoYebUgJ8S/Y7JJJ5hIYb9K3rhK
	fyV8zzctQfw1+rwFcxwWAaorjNaDB09j81OzLBqum2dGe0oASyyeX2r5feRUizwlbiocZrL
	jxKPIr7QElh6oJoS1u6y0JBxfcUGyaQoEbY8IxsULI/6WBZ6brYEw1+SInmtgauGbrEoMOH
	CgtWNOD6nnYjfDyS6l7ZyvlcsF+YmObS+HzbsJB5uIHq9qx5VS2qp5QRmu9kdc+Q5RzIH7R
	aTnm0yT/3bna8IbEAl6K8LcgLVswsJ/YJ6LCKMTPbWqk9vFasNDiT06ays2KWf7j7NPtHrV
	jIezCvzosXC4zNaXxt+O5VRuK2LLl608nUIAskrsc2KeqPEjlqxriljudzSY1Crqg==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_064246_951676_98C96251 
X-CRM114-Status: GOOD (  30.95  )
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
Content-Type: multipart/mixed; boundary="===============1154190550941122693=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1154190550941122693==
Content-Type: multipart/signed;
 boundary=6699d6df6755ff7133efaa68643e535e90c13e0a47ab98401c9ba0b46eeb;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--6699d6df6755ff7133efaa68643e535e90c13e0a47ab98401c9ba0b46eeb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 12, 2026 at 9:13 AM GMT, liutong wrote:
> On Thu, 12 Nov 2026 07:59:32 +0000, Xiang W wrote:
>> The PMP granularity on K3 is 4 KiB, so a mapping size smaller than
>> that will be ignored.
>>
>> Could you clarify how this case should be handled?
>
> Thanks, and thanks to Han Gao for putting it on hardware. You are
> right.
>
> The region order comes out of sbi_domain_memregion_init() without
> reference to the PMP granularity, and both protection backends then
> drop a region whose order is below it:
>
> 	if (pmp_log2gran <=3D reg->order && pmp_addr < pmp_addr_max)
> 		...program the entry...
> 	else
> 		sbi_printf("Can not configure pmp for domain %s ...
>
> (lib/sbi/sbi_hart_pmp.c:209 and :390). So with a 4 KiB granularity the
> 1 KiB region in my patch is never programmed and the firmware boots on
> with one line printed. The patch was a no-op on your board. I had only
> tested on qemu virt, where the granularity is 4 bytes and any size
> passes.
>
> Rounding up to the page is not a fix either, and this is the part I had
> wrong. The page at 0xd4282000 also holds the APMU block, which upstream
> Linux drives directly from S-mode:
>
> 	syscon_apmu: system-controller@d4282800 {
> 		compatible =3D "spacemit,k3-syscon-apmu";
> 		reg =3D <0x0 0xd4282800 0x0 0x400>;
> 		#clock-cells =3D <1>;
> 		#power-domain-cells =3D <1>;
> 	};
>
> (arch/riscv/boot/dts/spacemit/k3.dtsi, with drivers/clk/spacemit/ccu-k3.c
> behind it). Denying S-mode the page on its own would take out the clock,
> reset and power domain provider for the whole board.
>
> SpaceMit's k3-br-v1.0.y does not only register the region. It also
> installs emulate_load and emulate_store, which translate the faulting
> S-mode address and perform the access in M-mode, except for an
> m_only_ranges list that it refuses to emulate - and that list is exactly
> the four RVBADDR pairs plus the PMU CAP and CX idle and wakeup
> registers. The comment on the barriers in that emulator names the kernel
> CCU driver's recalc_rate loop, so the S-mode traffic is expected there by
> design. Upstream already has the hooks for that
> (sbi_platform_operations.emulate_load and emulate_store), although no
> in-tree platform uses them yet.
>
> That two part shape is what makes the protection safe on that branch,
> and my patch carried over only the first part. I am dropping it rather
> than sending a v2 that would break clocks.
>
> Troy, Xianbin: would you be interested in upstreaming that protection
> from k3-br-v1.0.y?

Yes, I'd be happy to take this over.

Anup and Xiang, would you be open to this approach (using emulate_load or
emulate_store for the shared page)? If so, I can send out an RFC first
to get your feedback.
>
> One smaller thing this exposed, separate from K3: a region below the PMP
> granularity is dropped with a single printf and boot continues, so a
> platform author gets no signal that the protection they registered is
> not in effect. That is how I missed it. Whether it should be louder, or
> rounded up, looks like its own discussion and I did not want to fold it
> into this thread.
>
> Thanks again for catching this before it went in.
>
> liutong


--=20
Troy Mitchell


--6699d6df6755ff7133efaa68643e535e90c13e0a47ab98401c9ba0b46eeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavXQSyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+66QEAuO2KhjxkoNcq
Lgsp3z2v1RogVEb8HJS530TlpOpae94A/jNSMYtnTMY03iW/pEV1yHoxl4NlXubt
9Rtjf4viyuYD
=81pB
-----END PGP SIGNATURE-----

--6699d6df6755ff7133efaa68643e535e90c13e0a47ab98401c9ba0b46eeb--


--===============1154190550941122693==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============1154190550941122693==--

