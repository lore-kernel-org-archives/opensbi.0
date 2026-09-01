Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEE3C61DE4
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 05:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pkyb3sLZu6/xaNZmcK6GWLNOSjlk7KljwqaNYx6SDU=; b=zMp30+MS8z75fO1FGfhI0O7pPm
	IA7Koe7/SZZiPouolIrUWDvInRMO6TfypWHwex/mUMoTRXuTolA9s/5Ko8DvtTjTLL/sqHYjTd/Fy
	79d5PEGtd2iVNaKya17LEuCEbstOk4W29tMFeK/A2UPtPIhXY9FdN32wyzS6FeA6uFd+1IErx9u4t
	5oLZv/02XcwS8IDzhVk8yOAJX0Zj64niwTNbv44A/1AdJ8H9lXWJ3/WcWGI1DPJ8MjhNYtMsDdDzz
	s1CzW+Nevkoc+CcRTV3RFIRnK5778T/RiYfDvKe5LukVkmZjRftsM2SZY3IDgvfb5gvKLl8g4vGKP
	RwNB2W1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1HMV-0000000B25H-2tNR;
	Tue, 01 Sep 2026 05:48:47 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1HMT-0000000B23k-07Yr
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 05:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788241693;
	bh=q1/ZexpAxv2eq5FVF1lvO77CEYwLdU8hFvYeIgRC90A=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=TVKZ47raEj/IkedqUw/kDhsZlX3l8/bg36S/mVM2Rfko5Z9Ls0C4bT6CA6EmNF2/9
	 jjW0TqfIYI7lgOK4ZaTVJI8kfkJIEl0+7QE+5Eo/gIkrLOki4hRy37QEL6FwA/Lica
	 g6u2zsfEnftx1JXWqc7xpFK3pWXI2LMyLYBF9Wyk=
X-QQ-mid: esmtpsz19t1788241688t438a0df3
X-QQ-Originating-IP: e1s7SAvYAubT3EXI6GYLFqGoAUnCKvUS+l2OhrBWHD4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 01 Sep 2026 13:48:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13828917441579793452
EX-QQ-RecipientCnt: 8
Mime-Version: 1.0
Date: Tue, 01 Sep 2026 13:48:03 +0800
Message-Id: <DL3QRSFAH67P.3K76LXQO2VWBC@linux.spacemit.com>
Cc: <opensbi@lists.infradead.org>, <troy.mitchell@linux.spacemit.com>,
 "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Anup Patel"
 <anup@brainfault.org>, "Bo Gan" <ganboing@gmail.com>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 0/3] platform: generic: spacemit: k3: follow-up fixes
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Valentin Haudiquet" <valentin.haudiquet@canonical.com>
In-Reply-To: <20260831200832.404000-1-valentin.haudiquet@canonical.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
	<20260831200832.404000-1-valentin.haudiquet@canonical.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mb1BOhWcNIRMoGPB0MvQT1Mk7nwby+zylLJdgk0dPs/AlR+twz/CFeY5
	hxzYtj0U9r+zVG24jevinNXnWqHK2rdY2nsBBtahvK2ZcvDPctHQhhWRBNUhU+e4noOPRp6
	pcrthTfXxeel+qPBLqyN+oXIEenMPmgF4KBNy2FCYo+UEtv07e+5WRRbSD4eU6VaxRXGzmM
	bxhLbOmxYRWmYe86W7xpRywZ+2p+gCN9kR1Vbxl8PWgYaAzXEKrOHQOCHY5t+B70verRW8s
	IC/5Rnj+FjDaVdb1O52Y+Kp/cPtO6+sN6+8WsoAZKPBw3Fkp0KxXW+W5WAnOTivPwC6NqfH
	Dsibfku5TX6dE8bAs9UCxxRQjWXz3UUJcCSZZuJcjdwGDIxHxqPCeLo3zG2xtiOI0MC91oV
	Tx9uAnnFcpQ4pFUyIin/CONDbtVg70QZyYrEbtfwxwZTmg60XZ8NbuHEdITuVxa6MitdbWM
	mR2Nzn0prztCJKoAy4UGEdxZBEQRjqv8/LZ6mv8EMMi+vMiFMlKraL5lMQpDfk2YeiJFDFu
	s5pu87y525qct+5ws6krZyU4rvUHmTpe9dIy+RNxUNOEGrubT9jjUmsXcgEtMRJP/DR8M58
	h9PkwNPVCxyYorqgDSR9aaQribSZq1DH/e2FG4yx789ZH9iFm4F7WLaKikBa+mHqV6baI63
	BuYMd+6SQpCFzvd98k0TQElZj1WabwUcrbpY2XgByCi7VDvzNG9STxpzqM3V680raK4Bu6M
	P937GBhRaPVwtBNtwHG2QUyliNNv2nw7Dr3DzzB9HyR9qYQ6f8l7W0VpuCOc4MRXcSNi3HQ
	aFkgkccS80sCzaPYd5jxrvBukbtoW2OwUR5HuY+m8gCJe7Q5aK72p4PXjs+5FiD05A3R9Dw
	rnItvD3DdbwD84f0WAgQW141w8FhvPLb27SFls8v4AADe0pgta7BFpHMxzbHEyBwjhLp8YT
	Dtbj0nuH8buBwG3BMZ2CfQWAqOmzBuizd3AxiSMriSVhzw+/1HVi7GIwsH4nFpnCBHIG0Ti
	y93DzAdbxlXv7l5aZ3v7Vs62j9ppPPQYJoXuN0JiUfUzer+DMObp9wu8KgJZlfZLcqgBZEN
	wgyz6MYBzFe/sHAc5Eb4P7YQPRPNJD/jg+7jART3Vo0MpQ7Fe/OKfCZR1J+ufa9Ol3IJxXp
	yu34
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_224845_424257_7083DED3 
X-CRM114-Status: GOOD (  15.03  )
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
Content-Type: multipart/mixed; boundary="===============2625718415041342269=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============2625718415041342269==
Content-Type: multipart/signed;
 boundary=2d598a6cf152f391aab3201a0e3aa2fcaf428cd32eab88f4ef96509d4ae6;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--2d598a6cf152f391aab3201a0e3aa2fcaf428cd32eab88f4ef96509d4ae6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2026 at 10:07 PM +0200, Valentin Haudiquet wrote:
> I believe one of the issues is that the v3 HSM wakes A100 core 8 only
> when Linux onlines CPU 8. The vendor kernel onlines all 16 CPUs
> so ESOS starts and RPMI works. Mainline uses only the X100 complex
> (harts 0-7), so CPU 8 is never onlined, core 8 is never woken,
> ESOS never runs, and RPMI mailbox transactions time out.
> Patch 3/3 wakes core 8 in OpenSBI pre_init so ESOS is available
> regardless of which CPUs Linux uses.
>
> [...]
>
> I have adapted those patches from the Spacemit OpenSBI 1.6 vendor tree
> logic, through a lot of trial and error. I'm not sure I deeply understand
> the hardware-specific details at play, so any comments would be appreciat=
ed.
>
> Feel free to take this in as part of the patchseries and modify it if nee=
ded,
> or send review comments and I can also improve them.

The original scope of this series is the K3 platform initialization and
HSM support needed to bring up the X100 and A100 harts. It is not
intended to reproduce the vendor SDK firmware ABI in the initial series.

In the mainline K3 DT, regulators are managed directly by Linux through
the P1 PMIC driver. It contains no K3 RPMI regulator or power-domain
interface, so this boot path does not depend on ESOS.

Your changes appear to additionally target compatibility with the vendor
SDK stack. That may be useful, but it is outside the scope of this initial
series. Support for the vendor SDK stack can be considered separately in
the future if needed.

                                            - Troy

--2d598a6cf152f391aab3201a0e3aa2fcaf428cd32eab88f4ef96509d4ae6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapZnEw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvjaoBAJO4iDgUaTPhuIN2K3tUekSGXIs0FX/+cCDRJ7mH
qs8QAP9uhz4cD83YcDXiFO0DqM1Ihm9ZMdBxmeFsQduF/lxWAw==
=lbHZ
-----END PGP SIGNATURE-----

--2d598a6cf152f391aab3201a0e3aa2fcaf428cd32eab88f4ef96509d4ae6--


--===============2625718415041342269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============2625718415041342269==--

