Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ABDC5DF81
	for <opensbi@archiver.kernel.org>; Fri, 21 Aug 2026 01:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70CRnAv4YTPronuwg/VtCBTi5abaitYiMAch1ketUIY=; b=CGTZJ/6tV+PX6sJ+j6a4vWi3js
	mHsTiUHhoIaOdoy1QeGJpBqKgpgBEtTYKQyHMr/gTl4j1A1nhKTijzMgvuZqF8Dq3Jcu5HNyMsb3R
	HletUwz9I1cdqK/RaucbRIuZqxBAIL/+9E1cSgmRqK7LPku0LTeRq5pDATnUuXepQeDSQBWfrtWEb
	b9q6D01YRcVbMLnBfbqj5wyRqQZ3+mKUom0HIT5rna50L8JBUUQWbq5I1+NgrNdex4ka7NqLjkKdz
	FP790kPfNp3OnTZRALyWtDZRnD1m2x1ofiCQ4IjyTN3KyaZi4O1GP2R2SVeOmNgZf2LKlyEM1G8/7
	bbbxKvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxEUI-0000000CR3c-2sf3;
	Fri, 21 Aug 2026 01:56:06 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxEUE-0000000CR33-2Gyp
	for opensbi@lists.infradead.org;
	Fri, 21 Aug 2026 01:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787277334;
	bh=tf+so7ewTDWl14p6tjeEnV0A0aTy8H6Us9uJCFRh0Q4=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=iSHJtTu0LutebjqmehGJYzEe5jcXlPS6ls7/giZXOG9RfrLRPoTOpd2E4d13v5IkM
	 sDlGwNsRB1Z5sLjbt/Wcfp4dmA4rY4yprJKWxN0z8xGgPRZTKzM7kNlI44IJADvb4u
	 cVaN279r3Lz+CFxIr7vMkeREbQygZOsRduZqbSHI=
X-QQ-mid: zesmtpsz6t1787277329t866aa147
X-QQ-Originating-IP: Dawo4aB+c/HnAcs7+OA8NPKbZj9UJQS+I1DS/jqFKx4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 21 Aug 2026 09:55:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17261610495691387026
EX-QQ-RecipientCnt: 6
Mime-Version: 1.0
Date: Fri, 21 Aug 2026 09:55:25 +0800
Message-Id: <DKU8XOF2Z3GT.3HYZYL8V7VCF9@linux.spacemit.com>
Cc: "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Anup Patel"
 <anup@brainfault.org>, "Bo Gan" <ganboing@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2 5/5] platform: generic: spacemit: k3: add platform
 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Samuel Holland" <samuel.holland@sifive.com>,
 <opensbi@lists.infradead.org>
In-Reply-To: <d3217c02-1dc6-4bcf-a5eb-da30c9a9860d@sifive.com>
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
	<20260818-spacemit-k3-v2-5-84cb7773a481@linux.spacemit.com>
	<d3217c02-1dc6-4bcf-a5eb-da30c9a9860d@sifive.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MQaSltTJPhII83MOXGxGO1tJL5DXuoaVI94++MTfG9VQSzhmGYnCZ9RY
	0Uqve8M/eBSSdBqniexiYWzEgGj1D6ZqJSR4GeQaYF8WY8LKnso9GNlMfhOGOS2mTlqR8AT
	bEG2E7faJi0XMpUTpM1cXWquA8ACmfBPaHAHolg4OXxraj0xF45jzouifL8ess3JA19bmoC
	TyH5Y3wxh5gVEw3lTVU20YBS+/B0LYgQwc6uLkAGcga08czqXp5C6FDhrSi+kbvH72PpPM7
	WP5TNJpXh6CZ+r1xDJEd4avuadB3ldgwEoALr5DP/5i7TH05LzFou19oMP6TnI5nAA467Yq
	AXf+PKt97ffpaU4n+GTFYIFZUo4GBRgIRc4hRavaSilCb+pd+jUCYQEZcgsvQKDVRiE/OFT
	zFTqMo4h3U1wo/vlQwbsutAycnqnmZEAi2QCdMeWDwWBIkvy1CpQcEI64Q3Lth/WhDBE+Fy
	3b9BUkOQUGhYOwjZjVgoX3NoFfToWOMj0gEWMUXhY9ACaIugV8S1tnmLt5nIGmAr8IouSUi
	gHqX9aXVdybwV4pYGQ17SAD61/A5ym8Jj0jVJlWDAR9nbzM/lereAF4DTsnt36J8l1UHAjq
	Zh/MYcJJrh4dnYtfaqz9uqtKrLb3344sOWKTymP12QjZrKcTKlFnDx2Ou1O9h5NqR7FJHDp
	Ye5n24KTiJFL37ywQjxU6ZfkPG/mmlO664lonrBskRdzvVzUhexgvaO8O9AJAj9GWcVtTq0
	DgOoJhLoz9fylK2b6jCyFoZkmvYcqDTR2rUplPlsAnYTQgvrHK4quZTF+MWXGJFn8j8sPQ4
	SNb2fJwHcwxhDZGlLP6bgbfVNn8l2yR6cn0ErsgaUjprruYDJgL3VNcGbKMXycWM1bwWBiU
	3gfRTUYVYYnH25BLsVu7d68qjDm8PT3kAy4IoHJrYBxccVu8Kf3s1lVqDettsjKPNNLIAfr
	d+ufybLn7GSgMJd9zDO53iRXuaBbksrBsUK4m44RolkjkTzMZIQyo2Hy7qRbiWbcHg6NsYD
	fu+rs/+NA+PGdV9ojS0zwHfN2v8makYmh7PguCfHaZdN1lnvAzYe1kODmQkZn++DBslCkfv
	a3WRdAXdmMpnCRGkQmhkJCUU7gF4zOdOQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_185603_488397_5BDDADC9 
X-CRM114-Status: GOOD (  14.54  )
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
Content-Type: multipart/mixed; boundary="===============7159765597351506378=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============7159765597351506378==
Content-Type: multipart/signed;
 boundary=6c5187a0d406d7c70382a93f56309ddd9d0b2e18b5968736f66cb397f9f1;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--6c5187a0d406d7c70382a93f56309ddd9d0b2e18b5968736f66cb397f9f1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> +       /* Clear core and cluster power-down votes so WFI does not trigge=
r power-down. */
> +       for (i =3D 0; i < PLATFORM_MAX_CPUS; i++)
> +               spacemit_disable_pwrdown_core(i);
>
> [...]
>
> +       for (i =3D 1; i < array_size(core_wakeup_reg); i++)
> +               writel(1 << i, (void *)(unsigned long)core_wakeup_reg[i])=
;
>
> [...]
>
> +       for (i =3D 1; i < PLATFORM_MAX_CPUS; i++) {
> +               u64 deadline =3D sbi_timer_value_after_msecs(HART_WFI_TIM=
EOUT_MS);
> +
> +               while (!(readl((void *)(unsigned long)wfi_status_reg[i]) =
&
> +                        wfi_status_mask[i])) {
> +                       /* ... */
> +               }
> +       }
>
> The operations in these loops should be in a .hart_start function of an H=
SM
> driver, not run in a loop at cold boot. You will need to do this anyway t=
o
> support power management, and it makes cold boot faster.

Agreed. I will add a K3 HSM .hart_start callback which clears the target
hart's core and cluster power-down votes and wakes only that hart. The
cold-boot path will retain the one-time boot-vector and CCI setup, but
will no longer wake all secondary harts or wait for them to enter WFI.
This also removes the WFI status tables and timeout.

> +static bool spacemit_cold_boot_allowed(u32 hartid)
> +{
> +       return !hartid;
> +}
>
> If harts 1-15 are not powered on until spacemit_k3_pre_init(), this callb=
ack
> won't do anything, because hart 0 is the only hart running at this point.

Right. Since only hart 0 is running before platform early init, the
callback is redundant. I will remove it and its assignment.

                                            - Troy

--6c5187a0d406d7c70382a93f56309ddd9d0b2e18b5968736f66cb397f9f1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaoewDQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvMVQBAK9PYXl0dwizYLfTGxWYlhC7Zzjvn1gXOGCPGHmC
qdRUAP0SLoAp44RhDvEeImMMomrrtv3ayUXmy4w2+Mpe08EWCg==
=5cdv
-----END PGP SIGNATURE-----

--6c5187a0d406d7c70382a93f56309ddd9d0b2e18b5968736f66cb397f9f1--


--===============7159765597351506378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============7159765597351506378==--

