Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1E9606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 06:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cUDeZTJ5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=hwN5/yLx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1UVMZblfGMZfK4c8TBLoFZZ0zwLtJuB1Ok6ZrAydM0o=; b=cUDeZTJ58J74g0BflhMAfA4yL/
	m8An9w1VWW+YlFMOUvQyhw7/5MOtI7JpjrGwpFc0PsO26bFQ/5LwMnxwackVO265Je1PgfX0V+7YB
	+3iiqFhFCkH0IH7/9/jYqH7HCnKVF6rdx2MivaIhec4k6m373EPyyT3DNZasDfT3TvKXoYzdkQ3b7
	3iw+9rQtM9FpbGqlwTyZYrP/ClxcIMvE4kX9E+xObu1USSP2sH8479W+22v/X124R6Y1iKGpe2kye
	869k7aaFhagE78cFZj2bRh9MC4Qbb6paRZImOoiRodGg19Qic0cGc4R+jiMxOnNYGMQbQM4ZL3KAR
	DyZta1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8YH-0000000FZ4c-0Gwr;
	Fri, 23 Oct 2026 06:14:53 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8YE-0000000FZ4A-0IG9
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 06:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792736052;
	bh=ZAhoahi4+PHY2FY67qd2R2XnwYdxOaVPQgyTBZCj6PY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=hwN5/yLxVnsLjhv+uX/2y+NFqKu4Pli3nVZuZtwXikyk2l3QoDZTNgtgZ6fRakcDo
	 wmNH5TGfmNvo0YJjxZl2XX4peM+VkhCT9W7yGWgI24dzBcnlU3/utb3wBlent+8gKW
	 k+giTp2833MpMcJq2A9YnXIe4gstTdIrU13BH5Uw=
X-QQ-mid: esmtpgz12t1792736047td104d1c8
X-QQ-Originating-IP: jK99wWXE9cQNH/JMJJIpF/vYtVV2E9M33mBKRxE44vs=
Received: from = ( [183.48.246.89])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 14:14:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7620198943578285727
EX-QQ-RecipientCnt: 10
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 23 Oct 2026 14:14:02 +0800
Message-Id: <DMBZW0LZ8UPA.281J6KS3ZCIOM@linux.spacemit.com>
Cc: "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Bo Gan"
 <ganboing@gmail.com>, "Samuel Holland" <samuel.holland@sifive.com>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Kevin Zhang"
 <zhangmeng.kevin@linux.spacemit.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Alvin Chang" <alvinga@andestech.com>,
 "E Shattow" <e@freeshell.de>
Subject: Re: [PATCH v5 1/6] lib: sbi: select expected trap handler per hart
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Anup Patel" <anup@brainfault.org>, <opensbi@lists.infradead.org>
In-Reply-To: <CAAhSdy1fLZ1W+d05v_CXRwRq7Uz__UL5CaHfgpRQ1xHsxBm6Eg@mail.gmail.com>
References: <20261023-spacemit-k3-v5-0-c5ddfc72caa4@linux.spacemit.com>
 <20261023-spacemit-k3-v5-1-c5ddfc72caa4@linux.spacemit.com>
 <CAAhSdy1fLZ1W+d05v_CXRwRq7Uz__UL5CaHfgpRQ1xHsxBm6Eg@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OMKoEOXJzL+HjBC53IIa5iiqo5EZDC6a6a2ISKqnQp2Kp1lcGw+8/0Rf
	IFA3gXvbJMtKsAaSfZQgt0LU87eVhNEFgg2iraz5j8rC9vnbbS3XV8ZDtaV87spALl1D/72
	9LlEMrQ6DGnfNkshgrQjHL5fKFhPYMISdMbtS8Muynjbl2XVTw3ole9Eg0OiYgHnJ89WS+f
	JABY2GQnAuUbaLH+16QVn9CeLDGUr5RKahngm2EQOsFK0Nq4q4mkyV2U8zKDihKm4Udxtkt
	jSdmzn6i9/lhBwJxiAeC492+s0r85ivBJozhfHijjO3hSevlSi7MuK5zgWKgflVk9j78fiq
	6VQ4w7Ggda00IFIVdhZg8klxee9fCIFPwj4CUHK6gERHBDYfcr+wta0ShJJePg9xbVaERjg
	ly/GuC1iVyRr7fdLQJ5c161o6OBnYYDdbsDfudCEAZB9RnKbhSJBvCphi2Mxl25NlCjqH0v
	TD3WV/MF3isbg+zlox1wVoCCB4jexdumBXLBeUQTFAbrEzvDgyMG5BAmDCTKJ5WclcTR/Qq
	VEGIdb1wfkBtOPPyhD0/xPyhc0ktuWj4NHBf10kGX2Mpzg+GNp/KTEZuYKCFyxyWbQKySzz
	czT22Rs5EcUKMgYIMKQ/pU6yrX55Oq41i9FDeDfLgRffDthWz3Src08JCzZbMXSv3gAurbQ
	Dp4BgUsDFmL81EVTLG9Yak8COBpzNKxT7ozRqMdACFOV/Y6nhJK9a5CcgBA3A/AV2mayVwF
	UUTu1u1il+P08T5xN+VdP540fK2CALJmKjPgid2MJIUWyPNAVkT+CbwoyMsiP4eoPp2AZPl
	F5mV6WTYELNN34anbjMr/nPs+IRLuB/01C9MXmFdjBQzEVlr/t1ar1/s7tZA12O6FgQtPKJ
	fbOm6y4M+h2FQLbNl+bS1GLBn5RpsvuFCPomLhlCuOw+TYJutP37yeOLMYA4mYLnIGLmZB+
	460wyi7djCQyScM5fVWv1qH9HLsqLUXw9O675dylngFAZUl7Lb1+Ri3N8rQTOjVlhy09OZ0
	d6GKa3UMGtE5gj4opOQW2UyHjCgzmQB7akDVVI5BBJQXyU6bJVdwGH468QQBrWUpTVll6NH
	8ThKDdUKEn7yRmir2nv7IfcVRTrExGsu6jLI5VjmJbMiNCjJSOL8UBFcb1BSExirHZ5YA9f
	ASHHX7awN1FD9eI+Q8AekDIkBw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_231450_744176_584FC026 
X-CRM114-Status: GOOD (  12.62  )
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
Content-Type: multipart/mixed; boundary="===============4932229742669347597=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4932229742669347597==
Content-Type: multipart/signed;
 boundary=346ede819dc7045d45574d6a1522522c0ea65803d8f0b90d54b8f765965f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--346ede819dc7045d45574d6a1522522c0ea65803d8f0b90d54b8f765965f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Anup,

On Fri, Oct 23, 2026 at 09:38:29AM +0530, Anup Patel wrote:
> > diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> > index 06097c8a..20e7dcd0 100644
> > --- a/include/sbi/sbi_scratch.h
> > +++ b/include/sbi/sbi_scratch.h
> > [...]
> > @@ -91,6 +93,8 @@ struct sbi_scratch {
> >         unsigned long options;
> >         /** Index of the hart */
> >         unsigned long hartindex;
> > +       /** Address of the expected trap handler for this HART */
> > +       unsigned long expected_trap;
>
> Instead of adding in struct sbi_scratch please add this to
> struct sbi_hart_features.
>
> Typically, we add stuff to struct sbi_scratch only when we
> expect it to be accessed by low-level assembly entry/exit
> routines.

Thanks!

I'll move the handler into struct sbi_hart_features in v6 and drop the
scratch layout and allocator changes

--=20
Troy Mitchell



--346ede819dc7045d45574d6a1522522c0ea65803d8f0b90d54b8f765965f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCatr7KwAKCRCYCe+A+TM0
L+4HAP48GFESdeT7JCniGfYAtKo9Wq1DhCVSi6LUi4AL1Mkx5AD/bIGC/jxjyJ2X
F3+klsiYNfCEPtaFM3pESgjNEK1wrgY=
=JzqP
-----END PGP SIGNATURE-----

--346ede819dc7045d45574d6a1522522c0ea65803d8f0b90d54b8f765965f--


--===============4932229742669347597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============4932229742669347597==--

