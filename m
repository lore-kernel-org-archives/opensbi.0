Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE848C61DBD
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 02:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFr6Hlx4Dem9O12rX6zqsWEeZGGt6nNBh1E7pyutHtU=; b=tZjbER5a4Hoka1M6PVFAWtj+kD
	YA1ShwKpWL3u0T4MUxQWVCP3SiuoHNKUfu6K00ZhKd/mPFvZCtMnPKnvPWiMu/ZtTkhw0hsb0rF1l
	ZkN5EEi3bo/iOs7h4qwupwDwM6eDmLak2Yq05VQPV87v3+dAkbSx2U5IVFsvjTVU1lc95LtSAvDp3
	vKQOtE5Uqv7tAFKn5DDa0M/+Rao3jEMW5xBckH67fv64XWMAsAP8lLdPmcinAinM/SB/z9tKdUovh
	xiAvmC1hq8BRtIinL5SIVyL51mT2QJCxNbSdSoAsbi2yIxEey8dCvIobd/IKRSq1qdmcWtTiYFRNY
	CeSAtoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQFz-00000003Kft-1B4J;
	Thu, 27 Aug 2026 02:54:23 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQFw-00000003Kf7-2gAI
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 02:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787799235;
	bh=LuNV+tzqQVBaMCXJ1RI2pSX8TeDcJXMOx4My83y6abo=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=xZ8FeS1F5FKWOp3y0l57hgGopoFkMO9zaLwxdJXd5BZMT8TG2sLC1IbkI1jMuQK96
	 vvbZAl2u3wnalPg8Oh/eMXTjAgd1KqJiVjfn33oKnFj6Le+bxVJWPSkgXNssuyAWg8
	 OdF6yNMe5a6Qnx+h10f/8+4gancS03rH4b5CkTkI=
X-QQ-mid: zesmtpsz7t1787799231t7b40505a
X-QQ-Originating-IP: giH95Tl/Vsnx4FlJkbnMjzF7HoNK18IWyVhhrMugffU=
Received: from = ( [58.254.68.207])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 10:53:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10223287379056251843
EX-QQ-RecipientCnt: 6
Mime-Version: 1.0
Date: Thu, 27 Aug 2026 10:53:47 +0800
Message-Id: <DKZDXMRLBZNF.1KHCLNNO3MO7J@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Xianbin Zhu"
 <xianbin.zhu@linux.spacemit.com>
Cc: "Anup Patel" <anup@brainfault.org>, "Bo Gan" <ganboing@gmail.com>,
 <opensbi@lists.infradead.org>
Subject: Re: [PATCH v2 5/5] platform: generic: spacemit: k3: add platform
 support
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
 <20260818-spacemit-k3-v2-5-84cb7773a481@linux.spacemit.com>
 <2df8921e-a562-47c0-ba49-452a2860a830@canonical.com>
In-Reply-To: <2df8921e-a562-47c0-ba49-452a2860a830@canonical.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MOuEXcjulCr6G6Xw1hS4v7D2QjhK+jwIFmIzuNoAXaU2ivfEbpDkkUiN
	WVYPHv8pXNwZ4d6IYP1woAcijIK+DPulv6q/2KJKphQPgKrpnFnuvs65+vyf033I450Ksmq
	v4nFG5D5rhwprW8tssv0KumYa4APakIrP48OO3ugHCmq+8/OkLayPgMZW3DrfYrEFPwIW0O
	Pgbt6C26xWETwhA+n0wVzdPyNAqGWbyS5pTj1uLtGTkI8fKkNmUU3dWsqLVF5X2aqgGwTII
	kLQQ3p78pvS/K0LfJqza8iYLw1CrZWPvtBJNilqCrop6KBbpkreUVafsnHBDo+nx80qBXRX
	UQyXXgB5VmMm4oksWBEy2gL2DFcN946lhXbuDWUDMIBd04aKgyak6Oxx8uhk5gbBTWzcTTG
	ThAiP6FdR4hrsntha4+2qyPZY0gL8FwlketngvP+R4x4VFvd5iDe7vruRsfZkDDlDvIUeiP
	fbB+bdqbYdBEWeJsQhJDud7CvPN8QJNJFHU0YubSLpZ8L/Er3Hn7Cp6M3yNSroUpZ8Hc0OX
	r/oJfNg5BFV5RjL8HCkxwYhlIhYvH4tPTgqt9BLz6XN5B2NgcUQQTrTkZqJZOeH09bfVFJA
	Dx4wyqEPsg3iU/prjB+6OJqfX467n13BLhtljpaJG5GakczUN1Wj4S8kkvvumZNIJ5/GuT6
	3bFL1yiQlVK/kmuPM8DdmwA6hPW7Z0uAS8jaUgdHhSSuvsThzriWkr8YN0WRxLsUSDZz/h9
	pxHMyDcazi3jtbulc7ZZkipnAbWZchtsVrXKwkyGNggbz/A6i4fbPG4m96bJDcGP2nwTLUK
	XTVQ+NMg6IScDe4Ih6ClG2LwQCwAuWGcw8K4xB5OxFVwy/fLafv/7j44F5oCNJFPMa7hlJ+
	uBloBeuoc7lkdhf+3GEwx0n3A9A3416y73VUdMynqw4Gj6o42vBmVmno2wy2FLLUGyiVm4d
	Cy8xPdI//sM2zMPL1qTyIsgbIpjc+/eboEJi/euSUVWWsx5iJqDv56/8Qep8cKz15Xa0Kjz
	G8S0PfDwvn1ztT9ur4MI2MOc+jlEBdXSjgjzKcQHEXzUFagRhlmJ1q6ZEwL/fp9J5lNUv9E
	SkTQYr6v4F7G+tXx24cHlIHgwyZ9TKvDO25EgKRVpG8CwHilyq9wwcjam9uQD+KfQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_195421_037518_EE682106 
X-CRM114-Status: GOOD (  17.88  )
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
Content-Type: multipart/mixed; boundary="===============7528070105672286951=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============7528070105672286951==
Content-Type: multipart/signed;
 boundary=ec4715875c630cd67acc119c5b246afcfd044e56e10985f09997482e20bb;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--ec4715875c630cd67acc119c5b246afcfd044e56e10985f09997482e20bb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Aug 21, 2026 at 9:28 PM +08, Heinrich Schuchardt wrote:
> On 8/18/26 03:14, Troy Mitchell wrote:
>> From: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
>>=20
>> Add initial OpenSBI platform support for the SpacemiT K3 SoC, which has
>> 16 harts: eight X100 harts in clusters C0/C1 and eight A100 harts in
>> C2/C3.
>>=20
>> During cold boot, the boot hart sets warm-boot entry vectors for all
>> four clusters, enables CCI snooping, clears PMU power-down vote bits for
>> all harts so WFI does not trigger power-down, and wakes all non-boot
>> harts (1-15). Wait up to 100 ms for each secondary hart to enter WFI,
>> then warn and continue so one failed hart cannot stall boot indefinitely=
.
>>=20
>> Run per-hart initialization from the nascent hook on both cold- and
>> warm-boot paths. Program PMA attributes, enable the D-cache and I-cache
>> through MSETUP, set smpen[x] in ML2SETUP to enable L1 D-cache snooping
>> and prefetch, and enable the H extension in MISA for X100 harts. MISA.H
>> is writable on K3 X100 cores, and M-mode must set it explicitly to
>> activate hypervisor support.
>>=20
>> Start secondary harts through an assembly stub that enables caches and
>> sets smpen[x] before entering common warm-boot code. This lets them
>> observe shared-data writes made by the boot hart during cold-boot
>> initialization. Enable global CCI-550 snoop and DVM requests on the boot
>> hart before waking the secondary harts.
>>=20
>> Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
>> Co-developed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>   platform/generic/Kconfig                   |   5 +
>>   platform/generic/configs/defconfig         |   1 +
>>   platform/generic/include/spacemit/common.h |   4 +-
>>   platform/generic/include/spacemit/k3.h     | 144 ++++++++++++++++
>>   platform/generic/include/spacemit/k3_asm.h |  16 ++
>>   platform/generic/spacemit/k3.c             | 266 +++++++++++++++++++++=
++++++++
>>   platform/generic/spacemit/k3_asm.S         |  33 ++++
>>   platform/generic/spacemit/objects.mk       |   2 +
>>   8 files changed, 470 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/platform/generic/spacemit/objects.mk b/platform/generic/spa=
cemit/objects.mk
>> index 8309ad1f..282543b5 100644
>> --- a/platform/generic/spacemit/objects.mk
>> +++ b/platform/generic/spacemit/objects.mk
>> @@ -5,3 +5,5 @@
>
> With this patch applied
>
> CROSS_COMPILE=3Driscv64-linux-gnu- \
> make PLATFORM_RISCV_XLEN=3D32 PLATFORM=3Dgeneric
>
> fails with errors like
>
> platform/generic/spacemit/k3.c:134:19: error: left shift count >=3D width=
=20
> of type [-Werror=3Dshift-count-overflow]
>    134 |                   << PMACFG0_AUDIO_BUF_FIELD_SHIFT);
>
> Please, ensure that the SpacemiT K3 and K1 platforms are not built in=20
> the 32bit case. Unfortunately PLATFORM_RISCV_XLEN is not a configuration=
=20
> variable.
>
> Other platforms use
>
> ifeq ($(PLATFORM_RISCV_XLEN), 64)
>
> at the start of the *.mk file.
Confirmed. K1 and K3 are RV64-only. I will add the XLEN guard to
platform/generic/spacemit/objects.mk as suggested.


--=20
Troy Mitchell


--ec4715875c630cd67acc119c5b246afcfd044e56e10985f09997482e20bb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCao+muw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv5KEBAI1UW1WpbOUVYcQ/RHDvjjbySmCD6HHQ+3qJlCo1
V4jkAP4y51Fc+zE+Z5k36+XIVmndCznWcpHprdnIGwRWyW4WCg==
=cB2N
-----END PGP SIGNATURE-----

--ec4715875c630cd67acc119c5b246afcfd044e56e10985f09997482e20bb--


--===============7528070105672286951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============7528070105672286951==--

