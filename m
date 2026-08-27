Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6936DC61DBE
	for <opensbi@archiver.kernel.org>; Thu, 27 Aug 2026 03:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HueLLaHCi3iqWV00ug+541TBXgGgGIMMcstPIOPytus=; b=Q0jfB9Pc7GsEcFCNvc5YWG91Tg
	bv5ansVxc5E8/C/eoUuwxIE8YIfnmXONauJCz8qdd9nY7kukey/06PF0UA5dinYFWCoRLUszmHMjU
	/t8H5WTDIUBEFP3Ob1FODO7c2ec7dmq5XgkYINZzGT98593UET5H1+34qBb37nSzNIrhal+pwfKym
	XU7+AVAWumTDg/t4UPEEVOvedee39q/aFNBIP2TEYrlfbD0vas2PrXUOCT4swB8mMxF57f9zAn7Cf
	KWQuTSw0/5T5IhGQhPJOMQPt9+ctY4s4w4DsVIZxI/0cIy95W7kczve2qpJ6s7Ed2JCOPT/g6CXTd
	kqSGnInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQhJ-00000003MAl-20fo;
	Thu, 27 Aug 2026 03:22:37 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzQhG-00000003MA4-1l9i
	for opensbi@lists.infradead.org;
	Thu, 27 Aug 2026 03:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787800921;
	bh=2/ey1Pwp2B2XRTrM91Vl6w6+70vaU64Yl7iSdeCxcIg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=hB6eBzMz36L8jF8XWikf4r3wDrsYQ7ZBIn6xKw8C4mybFXy3fTIVTxW9H5vZQ8f+w
	 LJ7J9eYfuscIjsznMtVQZokC1MX+SaMydyLq15r979Qqs45jDMdcpiReNB/r0yStM5
	 C/E6DsoX7mMsFZT/2KvW2PQKe2rnqP2IeZHBfO4M=
X-QQ-mid: zesmtpgz1t1787800920t91d6c30d
X-QQ-Originating-IP: PanVx42pj4LyjJF24kxdhUO3/DZP9ILZQNIM1UJb7mo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 11:21:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2295028509624058362
EX-QQ-RecipientCnt: 5
Mime-Version: 1.0
Date: Thu, 27 Aug 2026 11:21:55 +0800
Message-Id: <DKZEJ6J0K4DV.3UNRNYKYUHO3A@linux.spacemit.com>
Cc: "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Anup Patel"
 <anup@brainfault.org>
Subject: Re: [PATCH v2 5/5] platform: generic: spacemit: k3: add platform
 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Bo Gan" <ganboing@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, <opensbi@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
 <20260818-spacemit-k3-v2-5-84cb7773a481@linux.spacemit.com>
 <f7342f0e-f4ee-43d5-a2f6-b670b43074b4@gmail.com>
In-Reply-To: <f7342f0e-f4ee-43d5-a2f6-b670b43074b4@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OFoxpGAeFNQVdKIvPbc1CHArF4jjEkMGhqjE0dj7yRD3h+v6GoF90m62
	Z0uaMEtAcJ0gzl4re8ul9BYnFZchzoI13P+j5+OjBUQaQi6MX+RZ6RnSwL+ydl4cs753R8l
	gtGsQrP3cD82JumPOqdMG0C7PP+IJr4gQ9r45yPSx9G/DUYkLA2uGsWarmmEmZWU2y3rDtY
	B3gFsT/x/cteHOntrUvLkltbgonMkKL7Ko9FyWsKYSFXlojIg2yYop4JZA2bcZKHQ5FIu5D
	1Tci8Irx5go4U5PQfiEcBzcEVL6K4J73jZzgqdTOvHW2vv3ZBD1KExoTChXX4otgQv3yS4Z
	/JqH2ioR0og/Bi+LW10TCxXUT9dVrSt2CcgFlwqI3Y3HT0nHBBuUvzCcooqi+CsdqqCUIX5
	J8Mew1Rv+gRpmVxWIKzM6k7LSk2H5iWTPJ82HaO/0cnSMJzgD0GZ0ulqMVvd3hrJlZsL2F9
	qjT2y8DPnk+UgHpSVSdnkF5rOLufHb4XMGTWqbrxnHao89yBxjhafUh0eZ2o6OuGhvHramW
	uO8qwZIkRhNiZJ8WcG+5+99+ZHjGzlkkwotqrGn8YftN2LeVCEPiaM9buZDZbX4KEToE8QI
	V46ZN1EnGX41iZy0f+BxHmFDQoUUffixv4k3yfatkO4/X8+UoqT+HGm0OPgwrymHrCcrZjR
	HpvclEBq0zhfeBjZI9UOx/OCU+CijsB6Bxy1S+uHasValJrc/12RCcurIozCVhq5uuhu/+/
	Gt+3bR5xNzMxGquE7rycNCfgy3SLprijJ7bpL/1Lhjtp1912OsmcIdXFw/4nW9h+ID+cMuq
	XhLOC2HNp9Ko0vcV9kn3AOT6JDC5oYmXdP9OUOoSnfllJyNP/TfkP/EiGVMiDtcP0jxtGAD
	M+gu7O24ZsUkuyT6JnnNeJs3n5RN9loKEqwfLL/dD/H6wz5nM+9Ha67mIYY2Lw8JGQDLG+Y
	M2T8EDtHsfMDu4OqNb52jXNhTrnkKliafIg84mPwxmr590oHZFElUhavHXycQtt/jTjA1Ze
	QVzoGV0NBCPQJMNSQkNKysGoJJfVP5gC4TBkxXK2EH60QgBAkLf6xP6gggefDSsBPbkPQUa
	x90v1/aR0OJRnsFxCxWUZJrDX8tqRJ55w==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_202235_163657_83FC58F1 
X-CRM114-Status: UNSURE (   6.25  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7194094409623327973=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============7194094409623327973==
Content-Type: multipart/signed;
 boundary=109ffc995fec0c39972e37a962e50e62e4d383179e3e1105278679d1ac75;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--109ffc995fec0c39972e37a962e50e62e4d383179e3e1105278679d1ac75
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi, Bo

On Thu Aug 20, 2026 at 5:18 PM +08, Bo Gan wrote:
> Hi Troy, Xianbin,
>
> See my comments below:
>
Thanks for the review. I will address all of your comments in v3.

--=20
Troy Mitchell


--109ffc995fec0c39972e37a962e50e62e4d383179e3e1105278679d1ac75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCao+tUw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvaN8A/0Df5KD194QRXddhI7IXzwEt9QtLEQRh3uGAYwP2
NIfCAQD5PnvxeqTWs/EYZFXfVjOxx7b5MOj+8wifQdVg3ge9Dg==
=eHqk
-----END PGP SIGNATURE-----

--109ffc995fec0c39972e37a962e50e62e4d383179e3e1105278679d1ac75--


--===============7194094409623327973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============7194094409623327973==--

