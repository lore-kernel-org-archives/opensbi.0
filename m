Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEF2CD8C9F
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSBUTVlVzXvAbL8q4Lqu5wjDKu+hyMjz7cRXGJoBSGY=; b=jfDLaqgW1Q0ziX
	cdyvQ/bEr46A16o7+ExsfVUxrHIS1XkERz0X6C5WcJkbkNLHlwqnl3cgLsxuRvaVAKTK7/77TrwpZ
	FiweiyPf1AAB7p9rCjNLlb/RYpEW1Gc5wrf2wR2UX0GQlisAsDm1CT2sQ6Bf1fC3vxENQble4B8dm
	gaKnT2l79crsbAAizKFHpI5gmP89AwaZsLU6mKEoD71sx7zda/KiES2elPKD50C0yU1Tv2mxVFMac
	ybB/Atir10NRE90S1/0lGwdkaG9kEuv4P/i8ugWiQC8OV4/XrjAnFHji7rgjfRoRriPlf9zmI3wy8
	voNFHbMzAKBITs/B+a3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVtE-000000038UW-2Qvw;
	Mon, 08 Jun 2026 09:03:24 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVt7-000000038P9-3v95
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 09:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1780909380;
	bh=locM5kC3aBM11UgBn/Q8XbvxBtaVRcyOWs/IQwDkmCI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=mv7zE7xeD1y8Wq/kEA9Uj+ZUNTCAT/KO15n+uUM81xVFZtAdGAkXQCR4okcIPoWmz
	 55UgMqCvqR8rn/jebl0Zmnp3X7+IiNgO4BrPqv7yvS+OSKA3eBIfWcnNeIzBfx/bOa
	 +yxgPYVM0pV92iqGcWPFMHkolHt6YKQzH4exgtwc=
X-QQ-mid: zesmtpgz4t1780909379te163717e
X-QQ-Originating-IP: SDY8ZTRihGmJOA4YjhjUL4iiKRwSTIijeL7yUJSdnLk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Jun 2026 17:02:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15551332291604849722
EX-QQ-RecipientCnt: 3
Date: Mon, 8 Jun 2026 17:02:58 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: liutong <liutong@iscas.ac.cn>, opensbi@lists.infradead.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH] lib: sbi_domain: reject zero-size and overflowing ranges
 in sbi_domain_check_addr_range
Message-ID: <CFCC169760AE8259+aiaFQp9WQJuQPU3Z@kernel.org>
References: <20260422151750.3794520-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260422151750.3794520-1-liutong@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MyS1wUKzV5inBH3QslSN0xBKfjMUG35C52kbX/aEdxZOExjUn6Mbn5Yz
	HIHZZS+cFqxvntNOdRQBpMnOi5YKzMloLNXKgvVBLjP+0vZjol4klakS8jujzl42wQpkN3p
	rwN7QoYJqViUWXHMCy3qfSDkG02e0agUP8gEyKRBwKvgssNei1rtGWk0+6DjAUXCLortqhn
	q6xEGZTr8EprvCGEAYk1XPUmFX6LocnrhmW6FAYx/6vRvdwo9h9dxvPFDJpspXsc7Mz86en
	1XpdmVdLKHIpTEWFV5UuMhgsyPZNUeQJz8rcUk4jV+9yZMlc4WD0fWWql5CP/KjXw+qhpcf
	9wQfMkrhBoP/u/UkPmwSYpugwcyOx7aXq35Bhy+wuU2ynCJ/Rt0FcLd3tFq7bdt+U4hxwgH
	YEu+arUUbVuLa4zP2FMLkQpBFTc8INcNrCIk6j/Sy0A4cnnD7LQcIqE93SrM64Zqx4iLLZk
	0g1lkqdC91mxUB1fPWLrRy8cTy5HTLUsBZfh1koeBo5JyThqUSyI99oE60363JxJpHOLrQe
	vztyRCysQel26v4dyXGZvshuMBg9VZytvooCpjtx07f00tjK7ZrQiw4GIs8bdblL/L5on2B
	G9EHJyyhde13C79XDuR2qjgGjwYrrYkuFocmWq7WzzCh8E8LCnf016SjQ1Nrly1M6sui6pw
	RvmvW+nbECaFKbDDyIN0VG3BWzI53R5RVsAHu901UyZ0VrLh94hVt2Mwwi+hCXrRihzsM6/
	LxZYooB8ITxL7sJLvzUUY7dGQexUSliClq9nmyd8blY22iofmY02P9yu5ro7MD0Xv3aZyi4
	M0n3BZETUlEC2rWzpK/6yuJQuQ/m2H88CrgFNS70Ip3G1DtCVFyO4imeKgxpCIbMWXc8Ecu
	ekwhe87tl3/b3VJqQRcDwKmyAORCMaaFG94v35jSE179dF0Gmr63kulaAYb/V7xklZDLmG+
	OepIYsypvO8GeEaCg/WF3crwj4dw3sgQauGodO1HMyybh+jZkGMKbcUqv9pxwhvqtjgvdKf
	hHlI2+whHKQChcAU30263ZuzfyTYxfKr+MIBDAYuYSkjGILtNI
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_020318_959074_62FC85F1 
X-CRM114-Status: UNSURE (   6.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

On Wed, Apr 22, 2026 at 23:17:50 CST, liutong wrote:
> `max = addr + size` is computed without overflow detection, and a
> size of zero is not rejected. In both cases the `while (addr < max)`
> loop executes zero times and the function falls through to
> `return true` without actually checking any region against the
> domain configuration.
> 
> Reject size == 0 and detect unsigned overflow of addr + size before
> entering the loop.
> 
> Fixes: eab48c33a12d ("lib: sbi: Add sbi_domain_check_addr_range() function")
> Signed-off-by: liutong <liutong@iscas.ac.cn>
Thanks.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
