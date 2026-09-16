Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EF0C982CC
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtfwYaVEgpCXXkBSDuLOfXOWhaj9iZHCjVErDsPoszE=; b=D/QSh4uNPF2oso
	Lv0XIdeif/wKMz24XGqLwETpp+JaeoahiH3PAeFIlbOwYEbvpHL+49pXLKsO1zXWU+ZryIoiON+Ak
	tLisSPvhdpEtPCmQUBdLPZvQ3f340KB4dT47WQDs8BkUQM5jZm7um3dBXy7CGRO213Lo8wql8RdrC
	AXaSPa53C9576wWT/U/uo09RL+3H1UEUDtmMCWGxU8P0CwqX7gQPv2k4SVbAgedpHDKMuqnJCnDqm
	amNz69Hep0Hjo4bKBd9iYT3/8tlFLJ5Nbozdade6tRtjOSbQNcWQ6b9Y3mm8WAFcqBmGaYrlFZg5E
	cq0qe/BjtkkfscPVxkwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6siD-00000009loB-373h;
	Wed, 16 Sep 2026 16:42:21 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6siB-00000009lnF-18ke
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 16:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789576933; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m0x4wZpZPKlsCZ7vGBrXkan1IfyUHqTpSPZWcxbi8rgFICfm9Oiq8taoYS8H6tkH9HToDQ0DuY2uwT0mY3t7zcQBf8rMikWDa7dc9JaGHgjvy3rmCt3M0GHB+p/AZwS7mM8wPpbSu4HkTRa/dRU7KA+dBDVdzQXAh28eOkk0RoU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789576933; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BIiYCrlcMFSTRpaU2QLkXhCt2ZRYOzV3cOP3IM5W/s0=; 
	b=ZvcQzcn3DJEDgjO5CXbYyjEmEfxmZO0dTiXKNwAHngzGozGnBgoXBHN1rj8Dye+A+VbeYas5o+LxFWbwii53NPFuDFsU6RJ3x1FABKD1VH+lAxD1fQJdBjZt+v0UcKEDFYEvWLwmboJwo+gzPafnVerR//fn8Mxj3wZ4lKdjMcI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789576933;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=BIiYCrlcMFSTRpaU2QLkXhCt2ZRYOzV3cOP3IM5W/s0=;
	b=mjRfyadOxHyOmyBJyEYJgpGoEre4zf34cfquLhYn7fWPe0izHv/u/fGfsK99lxCX
	aN6GZYrTHYRN2um5iSEHs0Usc4R2XE/a3aARYEcQzt6webqbqEBIMJWSzcqWWwWvq+/
	DrmhPaNXldazr2gem12ww7WNNP6DTeodHSqhZSYQ=
Received: by mx.zohomail.com with SMTPS id 1789576932172897.0576172292817;
	Wed, 16 Sep 2026 09:42:12 -0700 (PDT)
Date: Wed, 16 Sep 2026 16:42:06 +0000
From: Yao Zi <me@ziyao.cc>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	opensbi@lists.infradead.org
Cc: Drew Fustini <drew@pdp7.com>, guoren@kernel.org, wefu@redhat.com,
	inochiama@gmail.com, Yao Zi <me@ziyao.cc>
Subject: Re: TH1520: broken CPU count detection
Message-ID: <aqrG3uRzSjV58d8R@pie>
References: <873b32a7-2e17-41dd-be7a-f97d5b768177@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <873b32a7-2e17-41dd-be7a-f97d5b768177@rootcommit.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.567.80
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_094219_384741_F554A9A0 
X-CRM114-Status: GOOD (  11.98  )
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

On Tue, Sep 15, 2026 at 09:31:01AM +0200, Michael Opdenacker wrote:
> Greetings,
> =

> For the Yocto meta-riscv layer, we're trying to replace the downstream
> opensbi (called opensbi-revyos) by mainline opensbi:
> https://github.com/riscv/meta-riscv/pull/685/
> =

> The board boots fine, but unfortunately, only 1 CPU core is detected. This
> surfaces in the Linux kernel log:
> =

> [=A0 =A0 0.089851] smp: Bringing up secondary CPUs ...
> [=A0 =A010.165542] CPU1 failed to report alive state
> [=A0 =A020.241632] CPU2 failed to report alive state
> [=A0 =A030.316980] CPU3 failed to report alive state

What Linux kernel are you using?

> Any tips for solving this issue?
> Thanks in advance
> Cheers
> Michael
> =

> =

> -- =

> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

-- =

opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
