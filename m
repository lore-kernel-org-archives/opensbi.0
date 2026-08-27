Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3685AC61DBD
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54EF+NWlM1F6lP/Pl0kj0ciWjHX3O4CYt6eKdScE8Qs=; b=T1iqCT+ssf3SHSFmrcJ5ctwp7P
	hFV2Qgu0JskXdh97eLkPrM+1WFbVbUTh4gtcMWqxj1698I9Fa6i6M3M7BHLQb+Ilz7KfpOWp3lirQ
	+5FlBCWbh6an/DY752zV771lHMbAQvfyqzusD6uV3kIMxMRWumFNMlYvReuruC8eUWaraZNEVjSYp
	Rq99ntKmc1hhWU1eCmLDap3SBN21fAUDhgvLWljwvNRbp9tayhe7TdkKYsDVMi1/4a/iO2FjazCBg
	misCmuHrfL2n/LEOYPwmldNUd8jxcLTnOHoeOPkZU8WYtrZn9iVjL0xD3VxU2o41c5dcD5f3RQo98
	bDEF7eDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQDJ-00000003KZo-08Jr;
	Thu, 27 Aug 2026 02:51:37 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQDF-00000003KZ9-3dC3
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 02:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787799063;
	bh=a1PrTVvr5an2g/ga5fD9AoH9he5hovvDFi5a7vkoTLw=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=irjN3qqX7SCu9Z88K0aCUJ64j/J0z433Cr6lieN24nvyYnnX6x6MjOmG4Hu06NEFr
	 8uKQC9jInm8CPo7oosUZtUlnJnZYXAbnkBy106K9Z547oAE7booQSs/8Yo3x8KLfob
	 dJG439XTjAzyvVATTl7FJ/YLwtaQCRfNfYux27BQ=
X-QQ-mid: zesmtpsz4t1787799058tc328be44
X-QQ-Originating-IP: xAVRfTDvXQhyuBWmT6sNJD7cO4vJ8VlZM5HIVYOvf9U=
Received: from = ( [58.254.68.207])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 10:50:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7777583855665845820
EX-QQ-RecipientCnt: 6
Mime-Version: 1.0
Date: Thu, 27 Aug 2026 10:50:54 +0800
Message-Id: <DKZDVFC52TYA.1IO9RZU933V60@linux.spacemit.com>
Cc: "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Anup Patel"
 <anup@brainfault.org>, "Bo Gan" <ganboing@gmail.com>,
 <opensbi@lists.infradead.org>
Subject: Re: [PATCH v2 0/5] platform: generic: spacemit: add K3 platform
 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
 <81df96b6-8c0e-4a02-8139-33305393c9ce@canonical.com>
In-Reply-To: <81df96b6-8c0e-4a02-8139-33305393c9ce@canonical.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MPs12nfZS/hN8O7/k7kUip0H4PNACJJAoJUbCe733QN2IMVJNCcr9zV+
	KR6rHdnrxosYImljhz8HNPl6ftdFvxQW4jXWlr1kxPNiULMmaJamczPhWAlDKg4q0Brerhu
	YUuQt4F/KYv9xoei50Ehu557WpfnDatayqWf1/VpzHL8h4FeXouAVnycxM+VyDwHDMUUXYP
	G9Iv3e02odx8sFamsoZDT2ibRLB+srN3TUNVQQOCTqH6+UzYQF/DlvM1Bb8klqkaz5C5pTN
	YgeyS/Mv4KOYBeCUvGfgNuc76zUnOn4Ovi0TMg80RF5at1v0vijBRwP0wjtk5t2XVQHJ56i
	K2bBtEtyC2dgvxuen4R+Of741Oy3lJBSorxrtEXgmQV9+nzMGzCt4yrMbdd5F8tItRCH3oj
	eoJefRBVR9gaNRzZnEnCX6YP8qtElhhHPdD1bfdl68VWety2r6zX6FMhBra7wDXhKJ7l4xM
	gAN8h/qs9Cq8br7Dat6zMfStglHVgJNIAKC/kEjo9Yfzg/yXW3nwfbNX+y3aFQCQWVN48JM
	EeJY0n9upd2+dM5Ax5php42b1quDNj2B7baAI7mEusFXbYqIAu/aZo6oyg9CUf7O1fmbZsA
	JtTa2HRPhLxe3TpqLYHSU2xV9pTh6GjLhSxZLrO8ZpBiPVW6jGJGfjQbJTn2cp6Q92y9oIT
	QDL7oj7JQ8UnqoRU/Ca2f+J8tNx6xey1/j6kAMaqE8oFMSko/2nvXqXM8/0fw17kGomaNF3
	dm84ZdlaTDobOso1pB8VlgLad0+ZJ0bRjncluk8dt9D0YUXity5RUnWn8XR+H/DwLOJn5eU
	qejYQzmd4W4w/KD+ZsmmCRkbKGCYDyy3S/p7JlZNpdrvxvCy/GhwvRqCmtv6YY9ZbINkgqE
	S2HWwudTBehsTg4p7mvQI/g/sVyhJZQGBM4/Es0fGZ8YshIbj24SRanCv+Fz1/z+v1asNTN
	w9JKI3viYvekFXpbT5fuePWWSam2TVEFY1N+AKWoNiBdfn/Gl1t2cEEA7fEjxl34avx0FEL
	Fz6JssXJ1s4MxFkWh9IaOQ/eNOP+3qhGG9RcHB2rHVxxvhyX8HGzkOp7U46EIK3x5k+lUeI
	3/9LNdrbTcOwKzZJNr55D0=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_195134_611779_EA515EF9 
X-CRM114-Status: GOOD (  15.94  )
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
Content-Type: multipart/mixed; boundary="===============6698134897843493998=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============6698134897843493998==
Content-Type: multipart/signed;
 boundary=f1d28fe9af8988741c87ebf7a563e6f8b968f4d28832d411b66014d0b77a;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--f1d28fe9af8988741c87ebf7a563e6f8b968f4d28832d411b66014d0b77a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Aug 21, 2026 at 10:33 PM +08, Heinrich Schuchardt wrote:
> On 8/18/26 03:14, Troy Mitchell wrote:
>> Add initial OpenSBI platform support for the SpacemiT K3 SoC. K3 has
>> 16 harts split across four clusters: eight X100 harts in C0/C1 and
>> eight A100 harts in C2/C3.
>>=20
>> The main upstream integration constraint is that K3 is heterogeneous at
>> the ISA level. The CPU device tree used for testing exposes the same
>> non-H standard extensions for X100 and A100. X100 additionally exposes H
>> and the related Sha, Shcounterenw, Shgatpa, Shtvala, Shvsatpa,
>> Shvstvala, and Shvstvecd extensions. X100 has a 256-bit VLEN, while
>> A100 has a 1024-bit VLEN. A100 also implements the vendor-specific
>> SpacemiT IME and FP8 AI extensions, which OpenSBI does not inspect or
>> use.
>>=20
>> At the base of this series, OpenSBI selects the expected-trap handler
>> once from the cold-boot hart and reuses it globally. An X100 cold-boot
>> hart would therefore make an A100 hart use the H-aware handler, which
>> accesses mtval2 and mtinst even though A100 does not implement H. Select
>> the handler from the current hart instead. An audit of the remaining
>> extension-dependent paths found that ISA extensions and detected CSR
>> features are stored per-hart, the generic FDT parser visits every hart,
>> and vector code reads the current hart's VLENB. The K3 CPU device tree
>> also exposes the same counter and timer extensions on both core types.
>> No other cold-boot-hart-derived ISA selection was found.
>>=20
>> K1 and K3 share vendor cache-control CSRs, PMU idle fields, cluster
>> sizing, and the CCI-550 programming sequence, but their CCI topology,
>> boot flow, and HSM support differ. Factor only the common definitions an=
d
>> CCI helper so K3 does not depend on K1 and the K1 encoded values and
>> behavior remain unchanged. Run per-hart register setup from
>> nascent_init() rather than the policy-only cold_boot_allowed() hook.
>>=20
>> On K3, the cold-boot hart programs the four cluster warm-boot vectors,
>> enables CCI snoop and DVM requests, prevents WFI from powering down core=
s
>> or clusters, and wakes the secondary harts. A bounded wait prevents a
>> non-responsive secondary hart from stalling boot indefinitely. Each hart
>> programs its own PMA, cache, snooping, and prefetch state, with X100 har=
ts
>> also enabling H. The warm-boot entry establishes cache coherency before
>> entering common code so secondary harts can observe state published by
>> the cold-boot hart.
>>=20
>> Runtime validation used the SpacemiT K3 SDK. The UART at 115200 baud
>> showed OpenSBI and U-Boot starting successfully, followed by Linux
>> bringing all 16 harts online. The series has also been build-tested with=
:
>>=20
>>    - the generic default configuration
>>    - a K1 configuration with K3 disabled and the SpacemiT HSM driver
>>    - a K3 configuration with K1 and the SpacemiT HSM driver disabled
>>=20
>> To reproduce the runtime test, build this OpenSBI tree at the address
>> where the SDK loads it, then copy the resulting firmware into the SDK
>> output directory:
>>=20
>>    K3_SDK_DIR=3D/path/to/k3-sdk
>>    make O=3Dbuild-k3 CROSS_COMPILE=3Driscv64-linux-gnu- PLATFORM=3Dgener=
ic \
>>         FW_TEXT_START=3D0x100000000
>>    cp build-k3/platform/generic/firmware/fw_dynamic.bin \
>>       "$K3_SDK_DIR/output/fw_dynamic.bin"
>>=20
>> Before rebuilding U-Boot, update the UART0 node in the K3 board DT
>> selected by SPL and passed to OpenSBI. The SDK describes it only as
>> "ns16550", so upstream OpenSBI initializes it without UART_CAP_UUE and
>> writes 0x00 to UART_IER. The K3 UART requires UART_IER_UUE (bit 6).
>> Change the node in uboot-2022.10/arch/riscv/dts/k3.dtsi to:
>>=20
>>    uart0: uart@d4017000 {
>>            ...
>>            compatible =3D "spacemit,k1-uart", "intel,xscale-uart",
>>                         "ns16550";
>>            ...
>>    };
>>=20
>> The compatible order is significant. Upstream OpenSBI skips the vendor
>> string, then matches "intel,xscale-uart", which selects UART_CAP_UUE and
>> writes 0x40 to UART_IER. The final "ns16550" remains a generic fallback.
>> This is the DT used for the successful boot test.
>>=20
>> With output/fw_dynamic.bin already present, rebuild U-Boot. The SDK
>> preserves that OpenSBI binary and packages it with U-Boot:
>>=20
>>    make -C "$K3_SDK_DIR" uboot
>
> The SpacemiT firmware is developing fast. Please, indicate the exact=20
> version by commit hash and repo url for buildroot, U-Boot, esos, EDK II,=
=20
> Linux or any other repos that are needed for testing.
Will add the exact commit hashes in the next revision.

--=20
Troy Mitchell


--f1d28fe9af8988741c87ebf7a563e6f8b968f4d28832d411b66014d0b77a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCao+mDg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvHoYBAKlOJmXF63VaEuCgIFx02YdT9yH/gbndmboOasLz
CL4EAQCCxK/ja3QvFxQMGCOzqlD4KYuvBQETJdphMH9UDX2yAQ==
=PpTk
-----END PGP SIGNATURE-----

--f1d28fe9af8988741c87ebf7a563e6f8b968f4d28832d411b66014d0b77a--


--===============6698134897843493998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============6698134897843493998==--

