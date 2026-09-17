Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E817C982D2
	for <opensbi@archiver.kernel.org>; Thu, 17 Sep 2026 17:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LkIyiRQLZPJAVAtIYYDMrFUVQf8zeiAI0zb2C1R+78=; b=bl4fTqN88T37hw
	qzCDx+CHegajw2W0irf8ztmLX/WW3Sb60XMxT0TQhBlcwNjjSUmj9G8DTMsMYJc5HEO35YvenxcEC
	Jh1S8Dq7k4gja1b79gNcpJNhXqJ6jF9U+46K0K+P1Snqm+jvS5cgAv7BmsX6r9Krjwx43sDmhA93b
	QYhP2kKFA94ws2c0pLen67MNbm/VQ9WTZydOclp6iyejdFFWrd7ueE7avToGeZZKafuuzykcxzvLA
	nky5FLROJLXPHeU3GFlHx6jN2TjDpFKe9iuFzbQyhbV8cQ9yyIxRfGyL/u9mfl+4N/aO1NMufBLIV
	DJiSlJoH5CmU97gqIi4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G2U-0000000C6CC-0jos;
	Thu, 17 Sep 2026 17:36:50 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G2Q-0000000C6Au-34lV
	for opensbi@lists.infradead.org;
	Thu, 17 Sep 2026 17:36:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789666598; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XwRSd9XdI+QxefoB8BhotiaPzvIhorgyjdPcxn5yMXHIVykNkmxB6YeYeIdFb6rsjD3EjH8RDUZt0PwqJGfWUZ9MeXFZPH/830FxSKQcTGwhWzxJPFjFYyrI0Z5VkmAz4Vs+vBzegl10N1DD6395krgGG9zVy1h5AnlzZ17TJbk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789666598; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=K4TH4OK+KthKW5Me7Z5ubEhlTUxE4zKw7j6XCx9xIU8=; 
	b=ey/mWNne8rWp/DCwvg/0ME2qTRdj0yTHbyb0UCYTbVr3rKUcTWTlw6MINvuswdbXCrbrMs9b8Xlm3mzYLzfTEVnMNvtt4m2WTEJOjfiG71ruJ8QbeyxsaCgr+ZRjYu0u90fWTkau9C0POCpzpnBpMO0iAiip0aQDNzU+ue6vcjU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789666598;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=K4TH4OK+KthKW5Me7Z5ubEhlTUxE4zKw7j6XCx9xIU8=;
	b=V09F+DCJx6rY0XlFO81Am5FQhk/gO6VMT8bo5I45CT6fObuBBGU0ZZMmLmVZFeZq
	W0NlJii6u0gnX5JBbclfo+VY25ThCA3iN0SQ6pprOsrVhBBPJG/ToiB0SmDgmVBJyBD
	LnVtGORe1bVz4+hmuW3hSnsdJVmJuNU8TjpHD73Y=
Received: by smtp.zohomail.com with SMTPS id 1789666597258193.1577882790748;
	Thu, 17 Sep 2026 10:36:37 -0700 (PDT)
Date: Thu, 17 Sep 2026 17:36:32 +0000
From: Yao Zi <me@ziyao.cc>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Yao Zi <me@ziyao.cc>
Cc: Drew Fustini <drew@pdp7.com>, guoren@kernel.org, wefu@redhat.com,
	inochiama@gmail.com, opensbi@lists.infradead.org
Subject: Re: TH1520: broken CPU count detection
Message-ID: <aqwlIK3ly-Ct4z0L@pie>
References: <873b32a7-2e17-41dd-be7a-f97d5b768177@rootcommit.com>
 <aqrG3uRzSjV58d8R@pie>
 <5e67bae3-753c-4f39-bdb2-b912ff2f62e8@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e67bae3-753c-4f39-bdb2-b912ff2f62e8@rootcommit.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.661.40
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_103646_831263_A626732D 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, Sep 17, 2026 at 12:54:49PM +0200, Michael Opdenacker wrote:
> Hi Yao
> =

> On 9/16/26 6:42 PM, Yao Zi wrote:
> > On Tue, Sep 15, 2026 at 09:31:01AM +0200, Michael Opdenacker wrote:
> > > Greetings,
> > > =

> > > For the Yocto meta-riscv layer, we're trying to replace the downstream
> > > opensbi (called opensbi-revyos) by mainline opensbi:
> > > https://github.com/riscv/meta-riscv/pull/685/
> > > =

> > > The board boots fine, but unfortunately, only 1 CPU core is detected.=
 This
> > > surfaces in the Linux kernel log:
> > > =

> > > [=A0 =A0 0.089851] smp: Bringing up secondary CPUs ...
> > > [=A0 =A010.165542] CPU1 failed to report alive state
> > > [=A0 =A020.241632] CPU2 failed to report alive state
> > > [=A0 =A030.316980] CPU3 failed to report alive state
> > What Linux kernel are you using?
> I'm using mainline Linux 7.2.x.
> Is this something Linux can manage?

Okay, I guess I should have more sleep when writing this reply. I was
meant to ask the U-Boot you're using.

The problem is that, mainline OpenSBI doesn't have the ability to bring
CPU cores out of reset, while T-Head's original vendor U-Boot doesn't,
either, and relies on OpenSBI to do the stuff (iirc through a devicetree
node called "reset-sample" or similar).

So if you're working with T-Head's original U-Boot but with mainline
OpenSBI, then there's no one bringing secondary cores up.

RevyOS' fork of T-Head's U-Boot[1] implements bringing up logic, too, so
it works with mainline OpenSBI. So does mainline U-Boot.

> Thanks
> Michael

[1]: https://github.com/revyos/th1520-vendor-uboot/blob/th1520/arch/riscv/l=
ib/bootm.c

-- =

opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
