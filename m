Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136F2CAC592
	for <opensbi@archiver.kernel.org>; Mon, 22 Sep 2025 03:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGqrEnV6bu2cMJSH3iqRoyVYnkr0KYY9dvkCkSIcfIg=; b=XZnh2k8BGWBmEy
	bAoAsM2PunNpn8690ZR8W4gzUj/PpiEUrSE9oJc8vF7Hp9HNd4k84qVzNJU3lJTcPsVsDtAT2LIRX
	/AS4rJWvBLlvZ1d025EnW5cONlvy0sUJW/6bMhOLPrtcl7yjpa6iaehANPzQ3oNO5MwRf4ULi0d7K
	4Ei+EX1GAiBhU79iuiNTYbSXPERIPs+LLUKlQz9gkQJc7x25kraMoBsvG5yAi6DvMBa8KwL4LuXlO
	7tNjhfGS/Bb5E0Y1jn7e71xtU02z+5Kj7ui6guw7sHtY3lAINgJrUe6BZ7ugNR+o6LqPfpTeU8wq1
	s7cxMwmxBPB+6XESjkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XfL-00000008js3-0L86;
	Mon, 22 Sep 2025 03:56:39 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XfG-00000008jmq-3hRt
	for opensbi@lists.infradead.org;
	Mon, 22 Sep 2025 03:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758513371;
	bh=f43Hk8NarDzMxHYR4kBzlwaAWcqAVqN6HXxF8UM49xw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=WB0JWscAq1xeb+nSTPiHFQfFw18vmkkfvgprB3GJ49lRB+re6QEuWrkFys5tHs/dr
	 eL8yo2xmzYGaW/BufNy93V8wqisWBViY4y/di/ixLHZT01MZFYRtPPepuio88dy/Ck
	 kXfoW2cnHM03wjA45Npg62f2oCnl4je3Dnt0hX3c=
X-QQ-mid: esmtpgz15t1758513369t86f4c402
X-QQ-Originating-IP: mOA2dAeHgwLW5v3h+pP7N4lbgu6ggaRgCpfvTIUPf6s=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Sep 2025 11:56:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14290756295532244700
EX-QQ-RecipientCnt: 4
Date: Mon, 22 Sep 2025 11:56:08 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Xiang W <wxjstz@126.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
Subject: Re: [PATCH v2] platform: generic: spacemit: add K1
Message-ID: <82810A90980EC618+aNDI2O-cr3cDQegc@LT-Guozexi>
References: <20250922-smt-k1-8-cores-v2-1-dceae56f36d9@linux.spacemit.com>
 <f0c1518a30987cd6c8d3c2acfcb53fdea2e1f8ea.camel@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0c1518a30987cd6c8d3c2acfcb53fdea2e1f8ea.camel@126.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N5QY31Sum2QwjbjNeNmVejFckLqw/WwPSnz+frXMrlQxSoeep8HYp01R
	kpSfn0Hljc9wjwCFxSzzhEeDO88wy82fai7PDVY6LXVBamx5rHh3lfrk5PUuuaWXWOiysvU
	/Rs7Nr0/h7JK7vSj9l/EG00c9ENtwu2BfKVJjrF2Ny0k6/VzqlTpktoVi7+TWA6tMbNxcEL
	RLZh6ENyl2rcTQT3px5MPZHR8jeznwErxiR6cgU0UotyM9yro8IcZvZO3uSS/ZmZnwRviY1
	W5AlQHg32Tuo147lvqV+mhBnm6c/1ZSc8/IU9CL3FO+UuhmPYYn2HLL8LKIDT2Zz3Q63O4/
	BzBcckRPsl9crydQ1C6JArR7zYN2GAPSi4qnDmyoWYULu25n1/JZZ7ooYx2/hXrdgz2lzwv
	6Q4p8SFKJFxm0OwN59anLYCHNr/Nb52yXo3cYDqURBIia5fuIaJ400Ut6ZSlTgf0f/EVF8I
	zj8++Nb0dgF+K34y+JlzYxGM7TswC1klWWiu7Fj7e/we6N2qaxhr/Et9qXJsv7+Hh23QFZy
	TfYI9CaZAbgghpga6OTICkvXQbucVZDDLmm6AXj0pBRhucGUJzefGZ071x5WMPU9zBd5eQn
	4RtD+p4KFVQaYakQtcmZ1ZC7qmXXNRnVvG8M+Hh39q7jEL2j6E+BtdpIBEDKoS6peHt70TS
	BaTwQgMbuWP2wmfC1siCXgOZSehurCyiN0bOTAcOW+q6gr3+BcJ/UlICMygKYoFCf6d5uDj
	X1O7rU0YtdMyRh5Y29ObubKV4I51wzrQUbpmjVV7g8KzSfFVEPE5hicjIJe3RyadfapZZNx
	emk4IWk03hyo62NBoquPPgYMxWAHLn2vnGk/fZ4rQG3yUfWagE/iOmp5s4+eqVkPEnLhp+f
	3GuwUCYVURfjYsQV4rZXzxKcnjB/Q+haP22geqqez4rGMpqAoGir0k0oazfwVqo84MuXev/
	d1Mw3gJSRqAvXlsLRLQsYR7clNvFFWWUr2ee/W3rKWxNq77P6ODtAuYLcpzN3Q8JBLl7qmG
	w5gaHOMlbfmJx47wwMM+8LRi6Ebq4S+GiSv/LWazifhsSwbw5at07ox7fL9yUZ0+O86PiEv
	a66h4drbVDN
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_205635_758354_875D06C7 
X-CRM114-Status: GOOD (  28.03  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Hi Xing W, Thanks for you reviewing.

> > +static void spacemit_k1_pre_init(void)
> > +{
> > +	unsigned int hartid, clusterid, cluster_enabled =3D 0;
> > +	unsigned int cur_hartid =3D current_hartid();
> > +	struct sbi_scratch *scratch;
> > +	int i;
> > +
> > +	scratch =3D sbi_hartid_to_scratch(cur_hartid);
> =

> s/sbi_hartid_to_scratch(cur_hartid)/sbi_scratch_thishart_ptr()/
> =

> sbi_hartid_to_scratch can not access before sbi_scratch_init.
Uh, I have double checked the sbi source code,
and I think I can call sbi_hartid_to_scratch() here.

in lib/sbi/sbi_init.c +281:
```
static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 harti=
d)
{
	int rc;
	unsigned long *count;
	const struct sbi_platform *plat =3D sbi_platform_ptr(scratch);

	/* Note: This has to be first thing in coldboot init sequence */
	rc =3D sbi_scratch_init(scratch);
	if (rc)
		sbi_hart_hang();

  ...

  rc =3D sbi_platform_early_init(plat, true);
	if (rc)
		sbi_hart_hang();
  ...
}
```

and k1_pre_init() is called by k1_early_init() after
sbi_scratch_init().

If I'm missing something, please let me know.

But I have checked the API what you mentioned.
That's a right API and I'll use it in the next version.

But I really wanna know if sbi_hartid_to_scratch() can be called here.

                - Troy


> =

> Regards,
> Xiang W
> =

> > +
> > +	writel(scratch->warmboot_addr, (unsigned int *)C0_RVBADDR_LO_ADDR);
> > +	writel(scratch->warmboot_addr >> 32, (unsigned int *)C0_RVBADDR_HI_AD=
DR);
> > +
> > +	writel(scratch->warmboot_addr, (unsigned int *)C1_RVBADDR_LO_ADDR);
> > +	writel(scratch->warmboot_addr >> 32, (unsigned int *)C1_RVBADDR_HI_AD=
DR);
> > +
> > +	for (i =3D 0; i < platform.hart_count; i++) {
> > +		hartid =3D platform.hart_index2id[i];
> > +		clusterid =3D CPU_TO_CLUSTER(hartid);
> > +
> > +		if (!(cluster_enabled & (1 << clusterid))) {
> > +			cluster_enabled |=3D 1 << clusterid;
> > +			cci_enable_snoop_dvm_reqs(clusterid);
> > +		}
> > +	}
> > +}
> > +
> > +/* Start (or power-up) the given hart */
> > +static int spacemit_hart_start(unsigned int hartid, unsigned long sadd=
r)
> > +{
> > +	spacemit_wakeup_cpu(hartid);
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Stop (or power-down) the current hart from running. This call
> > + * doesn't expect to return if success.
> > + */
> > +static int spacemit_hart_stop(void)
> > +{
> > +	csr_write(CSR_STIMECMP, GENMASK_ULL(63, 0));
> > +	csr_clear(CSR_MIE, MIP_SSIP | MIP_MSIP | MIP_STIP | MIP_MTIP | MIP_SE=
IP | MIP_MEIP);
> > +
> > +	/* disable data preftch */
> > +	csr_clear(CSR_MSETUP, MSETUP_PFE);
> > +	asm volatile ("fence iorw, iorw");
> > +
> > +	/* flush local dcache */
> > +	csr_write(CSR_MRAOP, MRAOP_ICACHE_INVALID);
> > +	asm volatile ("fence iorw, iorw");
> > +
> > +	/* disable dcache */
> > +	csr_clear(CSR_MSETUP, MSETUP_DE);
> > +	asm volatile ("fence iorw, iorw");
> > +
> > +	/*
> > +	 * Core4-7 do not have dedicated bits in ML2SETUP;
> > +	 * instead, they reuse the same bits as core0-3.
> > +	 *
> > +	 * Therefore, use modulo with PLATFORM_MAX_CPUS_PER_CLUSTER
> > +	 * to select the proper bit.
> > +	 */
> > +	csr_clear(CSR_ML2SETUP, 1 << (current_hartid() % PLATFORM_MAX_CPUS_PE=
R_CLUSTER));
> > +	asm volatile ("fence iorw, iorw");
> > +
> > +	spacemit_assert_cpu();
> > +
> > +	wfi();
> > +
> > +	return SBI_ENOTSUPP;
> > +}
> > +
> > +static const struct sbi_hsm_device spacemit_hsm_ops =3D {
> > +	.name		=3D "spacemit-hsm",
> > +	.hart_start	=3D spacemit_hart_start,
> > +	.hart_stop	=3D spacemit_hart_stop,
> > +};
> > +
> > +/*
> > + * Platform early initialization.
> > + */
> > +static int spacemit_k1_early_init(bool cold_boot)
> > +{
> > +	int rc;
> > +
> > +	rc =3D generic_early_init(cold_boot);
> > +	if (rc)
> > +		return rc;
> > +
> > +	csr_set(CSR_MSETUP, MSETUP_DE | MSETUP_IE | MSETUP_BPE |
> > +		MSETUP_PFE | MSETUP_MME | MSETUP_ECCE);
> > +
> > +	if (cold_boot)
> > +		spacemit_k1_pre_init();
> > +	else
> > +		spacemit_deassert_cpu();
> > +
> > +	return 0;
> > +}
> > +
> > +static int spacemit_k1_final_init(bool cold_boot)
> > +{
> > +	if (cold_boot)
> > +		sbi_hsm_set_device(&spacemit_hsm_ops);
> > +
> > +	return generic_final_init(cold_boot);
> > +}
> > +
> > +static bool spacemit_cold_boot_allowed(u32 hartid)
> > +{
> > +	csr_set(CSR_ML2SETUP, 1 << (hartid % PLATFORM_MAX_CPUS_PER_CLUSTER));
> > +
> > +	return !hartid;
> > +}
> > +
> > +static int spacemit_k1_platform_init(const void *fdt, int nodeoff,
> > +				=A0=A0=A0=A0 const struct fdt_match *match)
> > +{
> > +	generic_platform_ops.early_init =3D spacemit_k1_early_init;
> > +	generic_platform_ops.final_init =3D spacemit_k1_final_init;
> > +	generic_platform_ops.cold_boot_allowed =3D spacemit_cold_boot_allowed;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct fdt_match spacemit_k1_match[] =3D {
> > +	{ .compatible =3D "spacemit,k1" },
> > +	{ /* sentinel */ }
> > +};
> > +
> > +const struct fdt_driver spacemit_k1 =3D {
> > +	.match_table =3D spacemit_k1_match,
> > +	.init =3D spacemit_k1_platform_init,
> > +};
> > diff --git a/platform/generic/spacemit/objects.mk b/platform/generic/sp=
acemit/objects.mk
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..4bf973aab1ba749b59cfdc1=
4a572226d54c3ff15
> > --- /dev/null
> > +++ b/platform/generic/spacemit/objects.mk
> > @@ -0,0 +1,7 @@
> > +#
> > +# SPDX-License-Identifier: BSD-2-Clause
> > +#
> > +# Copyright (c) 2025 SpacemiT
> > +
> > +carray-platform_override_modules-$(CONFIG_PLATFORM_SPACEMIT_K1) +=3D s=
pacemit_k1
> > +platform-objs-$(CONFIG_PLATFORM_SPACEMIT_K1) +=3D spacemit/k1.o
> > =

> > ---
> > base-commit: 153cdeea5350837c1206a2d2b6189fd0ba06d1f2
> > change-id: 20250911-smt-k1-8-cores-8985c5f40c5f
> > =

> > Best regards,
> > -- =

> > Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > =

> =

> =


-- =

opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
