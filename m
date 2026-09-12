Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D1EC88E53
	for <opensbi@archiver.kernel.org>; Sat, 12 Sep 2026 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTIlBBjMl4i3FWN2uCl/4/GSQOq8r+g85581eWQ0lJI=; b=SoQX7BTQuOn9RgzFaR76z5MQ9i
	pQ9+N+caKZnZxfQRoRh8VeGV/fBWr11B29BM3wX6MOWcH/RJybAtirZzTOf26z93H/CxfVnRWTZZM
	31SP2QVKklv7auz+1DNmHCjeI/R73aLyw0KtUAZ4YqfD66oIVPrJw7MVoQN2FbjVYZn0lMHs3Ho45
	dJtfJv9wK0/vbcSLooVlOYirsmU6NT25uS+ylkvcihqx6QzhLzqjB/LvW+OcFEzq3te9E840BdnTG
	myQNdPdBFiX5t6faHG6+B3nFU6FWO+IuyqnPEh9hzB1rphfyl107Vv8P4J39lJGyCwoJydsCw+kt6
	CgAsb2eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Jjw-00000000j98-1yZk;
	Sat, 12 Sep 2026 09:09:40 +0000
Received: from out-65.mta0.migadu.com ([2001:41d0:1004:224b::41] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Jjs-00000000j8m-1cqk
	for opensbi@lists.infradead.org;
	Sat, 12 Sep 2026 09:09:39 +0000
X-Envelope-To: opensbi@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=l4M+eQ/6ohubebH4UQwrOq1NqT91xiTiiPnAg2yfR4w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789204172; v=1; x=1789808972;
 b=TAmX3gVfp+FOQ4qTwg0ChNbNgE+40M3hnAQCty7nxheI2QaZ6B14OoJH1mzuV+5SRAJZHMJm
 ZkG0r+oC1aOR+DLDp0s6ldsyFafrkYEOKGpTmmb6zV05yDk4iNhSGnNFd/7yjEEm57yftOMRHvO
 YxUVwj8ohYICJzP5+ZwuF3NM=
X-Envelope-To: opensbi@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 448cdfedcfa12e9a;
	Sat, 12 Sep 2026 09:09:22 +0000
X-Mizu-Trace-ID: 448cdfedcfa12e9a
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Sat, 12 Sep 2026 17:09:12 +0800
Message-Id: <DLD7XSBJKOJ2.3FFDZAGATV2LX@linux.dev>
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Bo Gan" <ganboing@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.dev>, <opensbi@lists.infradead.org>
Cc: "Anup Patel" <anup@brainfault.org>, "Nick Hu" <nick.hu@sifive.com>,
 "Kevin Zhang" <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH] lib: sbi: Clear all IPI devices when processing an IPI
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260908-ipi-clear-all-v1-1-b1bd5d016eb6@linux.dev>
 <6cd2145e-b2fb-4f11-ba24-0c9b56554b40@gmail.com>
In-Reply-To: <6cd2145e-b2fb-4f11-ba24-0c9b56554b40@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_020937_315518_87EC8F0B 
X-CRM114-Status: GOOD (  21.23  )
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
Content-Type: multipart/mixed; boundary="===============9048182869942624488=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============9048182869942624488==
Content-Type: multipart/signed;
 boundary=72e669f49a76f1a752868c467da1d28adc209b79f4c27a5d30338c5ca814;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--72e669f49a76f1a752868c467da1d28adc209b79f4c27a5d30338c5ca814
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Bo,

On Fri Sep 11, 2026 at 5:32 PM +08, Bo Gan wrote:
> Hi Troy,
>
> On 9/8/26 06:00, Troy Mitchell wrote:
>> Hart start sends wake-up IPIs through all registered IPI devices, but
>> sbi_ipi_process() only clears the preferred device. A notification from
>> another device can arrive after warm initialization has cleared it.
>>=20
>> With both IMSIC and ACLINT MSWI, IMSIC is preferred and has no ipi_clear
>> callback: its interrupts are acknowledged through MTOPEI. A late ACLINT
>> notification therefore leaves MSIP asserted, trapping the hart in the
>> machine-mode interrupt handler and potentially timing out Linux CPU
>> bring-up.
>>=20
>> Clear all registered IPI devices before consuming the software IPI event
>> bits so that late wake-up notifications are acknowledged too.
>>=20
>> Fixes: 94f0f8465622 ("lib: sbi: Extends sbi_ipi_raw_send() to use all av=
ailable IPI devices")
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>> ---
>>   lib/sbi/sbi_ipi.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
>> index b04a5877..683d559d 100644
>> --- a/lib/sbi/sbi_ipi.c
>> +++ b/lib/sbi/sbi_ipi.c
>> @@ -263,7 +263,12 @@ void sbi_ipi_process(void)
>>   			sbi_scratch_offset_ptr(scratch, ipi_data_off);
>>  =20
>>   	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_RECVD);
>> -	sbi_ipi_raw_clear(false);
>> +	/*
>> +	 * A wake-up IPI is sent through all devices. A notification from a
>> +	 * non-preferred device can arrive after warm-boot initialization
>> +	 * cleared it, so acknowledge all devices when processing the IPI.
>> +	 */
>> +	sbi_ipi_raw_clear(true);
>
> I feel like this is not the proper way to fix the issue. It introduces
> unnecessary overhead for *every* IPI processing, because you need to call
> clear on all IPI devices, even the non-preferred, inactive ones.
>
> IMO, the "int sbi_ipi_raw_send(u32 hartindex, bool all_devices)"
> interface is a bad idea. It opened the door for such issues. AFAIK, the
> only reason such interface exists is that sometimes, some platform
> requires the use of a different IPI device during HSM kicking. E.g.,
> some Sifive cores can't use imsic, but only aclint. Why not introduce
> another interface "int sbi_ipi_raw_send_safe(u32 hartindex)" just for thi=
s
> purpose? Then we can have a separate rating on how safe that IPI device
> could be for cold startup, and pick the right one in the function. E.g.,
> favor clint over imsic for sbi_ipi_raw_send_safe.
>
> In this way, we ensure that only 1 IPI is active at any given time, and
> ipi_process can still use sbi_ipi_raw_clear(false) to clear the preferred
> IPI device, and HSM/init code still does sbi_ipi_raw_clear(true). There'd
> be no more cases like Troy encountered, where IPI from another device
> arrives late, and you have no ideal way of dealing with it other than wha=
t
> Troy was proposing.
>
> Let me test with this approach and prepare a patchset.
Ok. wait for your feedback.

--=20
Troy Mitchell


--72e669f49a76f1a752868c467da1d28adc209b79f4c27a5d30338c5ca814
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaqUWuCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8pCQD/UeAsQrR2Vass
rCigN34vCe8agAuSY677/LxC91dpr3sBAKeCN2Mb1MlKkl8KXHA39U1PuX5SJcPO
MQZce/rE1ecG
=q+pb
-----END PGP SIGNATURE-----

--72e669f49a76f1a752868c467da1d28adc209b79f4c27a5d30338c5ca814--


--===============9048182869942624488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============9048182869942624488==--

