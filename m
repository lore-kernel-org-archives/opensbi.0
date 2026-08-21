Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FECC5DF87
	for <opensbi@archiver.kernel.org>; Fri, 21 Aug 2026 01:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L9bqdfy4xOMScmgsJI8DKW91IAn9D379YMfyQNAAb4=; b=UFB/RNXNcyRO7SZDFaxQvPsL8V
	dYKTDov8FrTkezXRZ0w89tHpWL2PBOtE+P0sTTAIaW0BJnqinXIetKYd9OY7vWiC8YLg7lbNyiQ23
	0njzIBX7XhIVKD1It69d7o5wTq0wJa3wIppxKXvH4Jted9vz3bR4yqyAeFOnqw0wafrp/XIUD48vH
	/gZBWmWOlqMmiLER/Nu3CutCI/9el4wz8OBe6jmetZ0ryplPMCbFMf7Xopt42m7TMepMhCogGRS64
	QH74nDFByYnUpDAlJ3CTji04AHTkoiCSHeqfXalqVYQiOVnMpbt9ihDDzzcWgYPfOZhhFB0ZkMAFA
	B0PeTkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxDup-0000000CPVD-25vf;
	Fri, 21 Aug 2026 01:19:27 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxDuj-0000000CPRj-018T
	for opensbi@lists.infradead.org;
	Fri, 21 Aug 2026 01:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787275130;
	bh=dz76RgLCkFRUAsGyjvYmBgBLIeh4upznty6/cxOYbxM=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=OH3cvZEd/aqWvObQY1m1Ktl4CZRuV6+weLvyeHkq9csUg07zLh2viIVNi1A0w0cvz
	 ZZdgeHAPmwukX0HFNu9vOdMz/vuJvhUMgDXlNXbggub7iWp7NX0ttyIRKMFKXNprCp
	 /BKtilqWrx9cpUXanpIH4Cx/Z9x5cqejJlv8wgBo=
X-QQ-mid: zesmtpsz4t1787275128t499e588f
X-QQ-Originating-IP: jpm85C4KGTz3hp37Qi/EIY6m9UCIpoG+XS0RsqFhxV8=
Received: from = ( [112.92.69.33])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 21 Aug 2026 09:18:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9585624052206586286
EX-QQ-RecipientCnt: 5
Mime-Version: 1.0
Date: Fri, 21 Aug 2026 09:18:44 +0800
Message-Id: <DKU85LD7UDZB.1IQH1DZ35KKQO@linux.spacemit.com>
Cc: "Xianbin Zhu" <xianbin.zhu@linux.spacemit.com>, "Anup Patel"
 <anup@brainfault.org>
Subject: Re: [PATCH v2 0/5] platform: generic: spacemit: add K3 platform
 support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Bo Gan" <ganboing@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, <opensbi@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818-spacemit-k3-v2-0-84cb7773a481@linux.spacemit.com>
 <df177995-1c44-420d-8138-2bbc7a4861bd@gmail.com>
In-Reply-To: <df177995-1c44-420d-8138-2bbc7a4861bd@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MokxBf7CFy2KLn06G4AcJ65WEwi3v57d4B9TyXa/ndM7Y//PNS2P3tKl
	W/YFYPMEvmGLC+RD8VEdloylyr6aOO7BatIsuYdWYEqphlivICwwdf2udF7vruRAwlqNi5w
	nbxsCUiAf/wUUZ3LiPqeFJz0gxwgPo6VLxxNPHlVonhwgwQn/VSGzwBoc+hoooKKPfyxtnR
	3w1Jrn0vanVWaVBpxLocrCbDjlCeWOapcV0ABCS7/6J+GIyzvRpV2a35RLzXEDYcWuvuGAo
	+30VrJO6JLFhV12iqN2XTUKzcIkziWWC236ou/I32pj20h0L7wpoocle798kQy4xSX7WRdw
	MFunEi2TWmkrU/N4gQgSJGRb8nfs4pX21ZABPGqnMbYoSO1A6AkB5sQmBEto44l5Y22L8+p
	pno5Ra8DapPo3Uh2w6GI31ClOeURFdEhXDG0lod6RYaLlpQ+9NYErRQEatJcfMOZ83lmWPp
	Ut1KuC97w3pEMyX+yL9EAbiBj4j4dE4pgtnXgUIAI4RDfR8SFyOF7tXZ6IPM7UHclHlQISM
	Yyt1TO9FC842woc6VOZR+KOYXMwHbXws0ya6K53F8Ddh5NqCtwm66Fcp/gS61e28KvIA4Ex
	LU2roLwi/9l3Mn1lsZBHPmYxBt7eihZJ7eG4KAno5IDnyqvLt1AZEZaaKCFDn6P/9F2Od8F
	u98+jYhYjqf94sfGjaak3lscSALnGevhGfYAoxXBRa6q3I7pAsdgQx0nFtPd6Y5cmosJJO/
	2prtyKIBLmZrARw6comvg+9oTrFQzs8kqqFTPwzNML+KNZVhCbog+y0QjufcfBY4zNxof9L
	sjvWmnHWLu2Uw4wer5ezc1stRKki/U4eE0mNYkF/tHuRfc3qtHO6HhCr7W+vkP8uF+Fyrfg
	DvR4wvaNo1xlAPbjvKcevQgJ3i3Z8SJ4fTkGHk7/O1N44UizHLk8PLB9r8KUjDNVOtb+WD0
	JW80YyWWPVNhOXy31J3e1Y+90ORH2ySGaeR31w8oza5wTGjS7nkKjB6/zirGsNcVBFvY8Vj
	aBe+scHMoGPclR3zYmOQ0yyreNBZunB7qhHuJeG2Y/gSU9eapg7jTHwMrhRLyT8H/putGIx
	WBbz0WaJJac0xoyjzODZEBAPsXB99WFajx7JMp9k8OeKcuI5SRy/InxjNl3FwgHdKVWmR6f
	vCc8m7R9cKenfNA=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_181921_845713_6D056022 
X-CRM114-Status: GOOD (  13.82  )
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
Content-Type: multipart/mixed; boundary="===============9087847447887349738=="
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

--===============9087847447887349738==
Content-Type: multipart/signed;
 boundary=ae85d0fbff21b00ddfe967424358b95b749885af026abae7835d58cbc073;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--ae85d0fbff21b00ddfe967424358b95b749885af026abae7835d58cbc073
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 20, 2026 at 5:26 PM +08, Bo Gan wrote:
> Hi Troy, Xianbin,
>
> I got my com260 delivered just days ago, and I'm able to review and test
> this series. I just sent out some review feedbacks. One more high-level
> question is regarding rpmi. I see the vendor opensbi utilize the services
> provided by esos running on the small cores. What's the plan here?=20
The RPMI interface between OpenSBI and ESOS is mainly used for
suspend/resume, power-button handling, and enabling or disabling
regulators. In our upstream Linux implementation, regulator control
is already handled by Linux. We also plan to move power-button and
suspend/resume handling into Linux, although we do not yet have a
concrete implementation plan.
>
> Is it
> (this patch series) suppose to work with the esos currently shipped?
This series is clearly compatible with the current version of ESOS,
since it only removes the RPMI-related code.
>
> Also you mentioned "K3 SDK" many times, but I couldn't find any pointers.
> What is that exactly?
I apologize for forgetting to include the link. However, it is readily
available from the official source [1].

Link: https://www.spacemit.com/community/document/info?lang=3Den&nodepath=
=3Dsoftware/SDK/buildroot/k3_buildroot/source.md [1]

--=20
Troy Mitchell


--ae85d0fbff21b00ddfe967424358b95b749885af026abae7835d58cbc073
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCaoendA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvHCsBAJITcTIJ8GRF9cxEvo71qPb0IrmElbfZ7h9GwL1e
K1QoAP9WaHE/l/veBxknxlM+58u8dcojwa24PZk+J69PnPzMCg==
=f+sJ
-----END PGP SIGNATURE-----

--ae85d0fbff21b00ddfe967424358b95b749885af026abae7835d58cbc073--


--===============9087847447887349738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi

--===============9087847447887349738==--

