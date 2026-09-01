Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B52C61DD6
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 05:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmVxm/ER+dmmwFhOS2ZvR8Ep/1NL1B6enY1Ws/KK44I=; b=L1eYeO24IRGN3XW5uCUK9TFr12
	PNGUNkoH/UnVREEWNs6N0yME+mNGOZmI4wf0bXUu00QobBXme3u40zxsIO44pMkiiSY+6K0fgt/9C
	tj1wjXnZ7tgRaF/WD+vNOaN5gZFjGF2M8naa+JWdwQmwkZDEsHLi+yWwSFekj2+2gmX7nQI+6yuTE
	e0QUKan305M83WSERTf6uKW/+5kV9tywP96QGgzm5Vh+f2f8kpbBVo8xYIsUGdU7MTAtj7e9F4TDs
	Sx98/Nf/JPgkkA3rJyq3mvZ0fzy8uJdrrMGEd8bW3pCf2n4YXNG+Jju3mzMNfyc2gZQmMmPwMn/t8
	N4NefRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1HJk-0000000B1mt-42pp;
	Tue, 01 Sep 2026 05:45:56 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1HJh-0000000B1mP-2hLV
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 05:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788241511;
	bh=6zIcgJlcGjb6qmK5DewBN3y7x+SRZ8kTdFkvcgeIsrY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=iqXbxODbdknoD+Gt5ZxKzFON40PGWZvvrRcRy0bzpCbgofbSKLe/Y4+yd0S0wBYKh
	 0eCR7UDLI4dgxCMntO54b4AONIaNM+HBzxbsNZTusdmJ01G8RMnHXfWMkcnVTGG4np
	 36nNmiXcJVeF7CNv4fWyYLoQG54AAT/7D707/mO0=
X-QQ-mid: esmtpgz16t1788241510t06e28318
X-QQ-Originating-IP: 5ubXT63jCYLyc0PL9TNhIqHySkGSAm2tHSccMxn47xU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 01 Sep 2026 13:45:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13839564555195023762
EX-QQ-RecipientCnt: 8
Mime-Version: 1.0
Date: Tue, 01 Sep 2026 13:45:05 +0800
Message-Id: <DL3QPISZDL01.36F0N37XBPA54@linux.spacemit.com>
Cc: <opensbi@lists.infradead.org>, <troy.mitchell@linux.spacemit.com>,
 "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Anup Patel"
 <anup@brainfault.org>, "Bo Gan" <ganboing@gmail.com>, "Samuel Holland"
 <samuel.holland@sifive.com>, "Heinrich Schuchardt"
 <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH v3 1/5] lib: sbi: select expected trap handler per hart
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Alvin Chang" <alvinga@andestech.com>
In-Reply-To: <20260831022156.2060561-1-alvinga@andestech.com>
References: <20260827-spacemit-k3-v3-0-5d8dbb68539d@linux.spacemit.com>
	<20260827-spacemit-k3-v3-1-5d8dbb68539d@linux.spacemit.com>
	<20260831022156.2060561-1-alvinga@andestech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NLIGCJzX3QmePQd8d/rUGn2t/sjKK4wT6odIakVysJNmXJgeg+utxPji
	CJtr2M6xu/if9KzWoU7TIG3I4mH0NUAPw2f9Vm85CfI49C2+zBC3rPL8kPbXvBSQGn2Kopz
	XZwIYtTFrNvOE4YQ5qgfbRL/fJMj+gziQ3PhzF85MjRfJn5WiF0ycVlgsBAhhEFwbLiLu1Z
	MUSBLMxQqlIpfynOdGNhit6Lsd9N8bgfBWSNEfaZguePzg4jyFRF68E5HiuGBQcrlopDLlq
	/MezmVKhQAELJPUx+iH6qdFb57D9mvby+57pjAdA7kN7j0s1fy4AKalNmfZUJyKyJFdOHZe
	tbowyWZ37gMXJDlCyYecLYT0PK/00GufGnBYBbyW27fPrJ5H5AdAvsyIQcywMF6xn6Rype+
	Ep+wY3ktZ1kcVsTxr01v57R63O7N6uD3CLYlfvYPZItMvACFKcsP4M1Sk9VpV46fRJCf+WK
	/cI/1LUOzDIfmmNA40OHYt2V9DVDR8JhgfEuhvRqlozSetj6DSc5c52YIVl3IaXngIani6L
	OgkIK4IrxRHSdGpCz28tficL+et5462CttQDZQGX9y8hUv9nqvgfct2AQa3Vl9EwWbElreq
	4MV49NeNAsjMIKyhghzmBaouO3svOvoYtZnojk3nXri5vlIYej7M+T8mV0Qi4dBAq9znslj
	9bSrVeHiLSS8FcE55P62gVNdgU6BIbEDNLAVEykENci34swOAWSKetU4HtrLSfL0y9JQeiL
	+6XS7n3g4HAfQctydNGZ8jncfH46gjk1hPVR4FiDg3flEQfRIH0/rlAge+77rf+LUGMDQlC
	mBcBI005xIr/j5pVk5mvkHrzbSrrbtC98ZX1QehPnzvtQ8mm8IXDAqDwyjsyODWVF3q3imC
	yK/IOBF56iPykAHRjvjdDeOrpCQqSZKMHyAewYTLn38EdAFdm/8YpPL5mdtkH2Arn1ID6gI
	0QC1gcGcAXsOKPQh8gAmZ7GBYUjw1CJ/C9HRFm3NFnkh6bbDcFEbjEkdz9VZsXgARi4AIaG
	nnQTSxWqv3xkh8EtY6Agfp+dKL5Ayg5xT8UkMsWDmC0gLxZlca9pB3lG94RJAo5pha3JxaL
	DVW+J+1ySRHBsI9ZEveBVUEmeXvlGbotvgxJ9viSqmkWlYR31vrbIs/DCarUtv56A==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_224554_562297_A04FD277 
X-CRM114-Status: UNSURE (   8.89  )
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
Content-Type: multipart/mixed; boundary="===============4978428815269154878=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============4978428815269154878==
Content-Type: multipart/signed;
 boundary=c2703f510ad6c3f2aed1f755850671c9bba9a0c2b756627972e418af10fe;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--c2703f510ad6c3f2aed1f755850671c9bba9a0c2b756627972e418af10fe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2026 at 10:21 AM +0800, Alvin Chang wrote:
> Have you tried stack protector?
>
> I changed them to use extern symbol directly because they break stack
> protector.
> Please check my patchset sent last year:
> https://lore.kernel.org/all/20250703151957.2545958-1-alvinga@andestech.co=
m/

I had not tested this version with stack protector enabled. I have now
built and booted it under QEMU with CONFIG_STACK_PROTECTOR_ALL. It boots,
but the generated code confirms that the accessor itself is instrumented
and introduces an out-of-line call in this low-level path.

I will replace it with a per-hart handler address stored in scratch and
loaded directly at each use, then test it on K3 with stack protector
enabled.

                                            - Troy

--c2703f510ad6c3f2aed1f755850671c9bba9a0c2b756627972e418af10fe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapZmYQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvFRAA/AuT39D2XnhDV3/IMHf2PvM0GZSLaD8bmsTjebUJ
h3ZVAQDfNbq3nQ++pHGv5JSawO7VTE13Dwf1QG/o4h7VuW97Dg==
=GnDw
-----END PGP SIGNATURE-----

--c2703f510ad6c3f2aed1f755850671c9bba9a0c2b756627972e418af10fe--


--===============4978428815269154878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============4978428815269154878==--

