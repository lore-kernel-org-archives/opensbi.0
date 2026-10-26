Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B111E606A31A
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 06:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=15J6SqQA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=v4jbisVk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4AagyFm76Bu7JMLzv/Kd/oeyEzwptReUCTxWuJbDezs=; b=15J6SqQAzhQ5uC8SoEuRAzh5By
	nWIcAwr+O7HO36kgNJfkJ0R9QwT62YloLobMZ/ut+2secJPFpvx2IArCGj17aqHJzHTmMu5x4k98X
	6J+0kB0Zh1GPbc00K+EY753OERTuVfVvsFCvK1KqcGmgdOdxU8LTMo1CPjViu4WKqbmmWJ5vYzHv8
	CAn3sFXpBuYBMSdOlBXOKiSIqPYjfat4Nc1nCnZXZh4DdsNaFeHOoV4Hcj8FzfwUBnlEeZ1cumL8D
	aFrN44L0kHnO+lJFp7DDNij5rPlL/iKfNbqhKzMd+6J3PWUeX0aJOTVVds/X4YhjN8t/Ms3rFd/It
	N4ERjLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLEfj-00000001oj6-2GJ4;
	Mon, 26 Oct 2026 06:59:07 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLEff-00000001oiA-2ZbZ
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 06:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792997931;
	bh=4MtZqlZQ7GGmKCJqkIuJ888K5qcalVyxpG9+F4T2Yq4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=v4jbisVkMNW6J8HBkX67RtcyFjDWGS0mZgWw9IOy3ygjf9rTMApkrL102/Euj1rZG
	 IEBFtid3mdeawZ3GqsxdWznoZ9GdRZ4IwLWCH0yX56XLVzE8lDCinNkwIptDI7ossK
	 +5RTuLRiXkQD9ZOaLCr6EfVTzGmVoeJ/QiQjNgKc=
X-QQ-mid: esmtpgz10t1792997930t9f3ea943
X-QQ-Originating-IP: 0pboDGgqolt9ELKaMdv6Oyg484SswQ/xCyrR+XlgoM4=
Received: from LT-WUHUAMAO.dc.com ( [101.70.125.129])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Oct 2026 14:58:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2340601674227610625
From: Huamao Wu <huamao.wu@linux.spacemit.com>
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>,
 Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>,
 Huamao Wu <huamao.wu@spacemit.com>, lufei.zheng@spacemit.com
Subject: Re: [RFC PATCH v5 0/4] Add Smsdid and Smmpt supervisor domain protection
Date: Mon, 26 Oct 2026 14:58:47 +0800
Message-ID: <8A0577AD97FB8F43+179299792743.101634.17380907132485094149@linux.spacemit.com>
In-Reply-To: <CAFR3w35wL+7hCQ_CCkC+M01G6bAZM_iMqFUBs6jti+Xk0ATW5g@mail.gmail.com>
References: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
 <CAFR3w35wL+7hCQ_CCkC+M01G6bAZM_iMqFUBs6jti+Xk0ATW5g@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NBUSIVIw0bNzwMy8qBh4PLyBlvAT4wWdtD+oBLQk+UWegEaYP7zGh+DZ
	DQRtu0dWHeUVX2s4zNJujwkiPoHPxdBRp+ATiVON384hcMYPlhalmhOG0e7yhkVF4jD0ox1
	3dLIQ8VIBBKGtZNpzTHzYSIFMpPmAKgcD/h0OzIXprgn05pHJwmMbkiqj5rlWUUrh/xLfJ+
	FJIhR1n8r8Hg+34p9BBenxHzCEIFUT7EewNOEflJV9oNGt36j2EmUn5fNaiAf/PXJYlDJhm
	DP6ydyYonfayyLfs3GOtC6e9JZ5NnC3ijE6+JidkHMjY7H3U4F6pAt98z3q1UyNKUaTAAZT
	dhKzHgQg0NmsS09GBRD0Kp25z9qNRcNIIbaDF/l2nDvMOv/7W+W8vEhxvYR8eTVV77/Za8x
	hd4j6/0VKVeQejMAGbC+VCNavQuwurILYnnNMnqNbSxy+8TLiHOXeATuXjL9zOw2OxKtNBe
	ZobhnK7Ckfyi58+ltgW4++osi9AJmz9TVOra3Vwk/AGoBpgzmI6ykPSEukylhZYMupRgGet
	VfjJjcPTpAIchkO3KFuAdDACn2LT2O+t+epsKS2YijniBOzRxdBc+i4PxxHc/NlLOzgNxyV
	OL4ogzcDAhK67/A1FaewXT6ZZZqUhIhER3DqZVCmzdoy8WthdKhV8Gf/rUgaRAu8ivVBFcu
	5i5GzySwCVuPhURUDYi5w2EEB4uxdvxLvabkPJb49xSZPVEEnOzZOyvMDVDdqg/nLa3Og3v
	kiTB8WT6hQQur/3Ntb/BXBbDUAlJy0YU1msqiOFc6uphRBWTI6FtXXhpkLrNAc1VubnkYk4
	tDMupSbidTUaYHjc1YCqNQvL6O+KcPc+KYLLYfnE1bTl27PdKvFCpHbjqVhshsuSFneyF5X
	kjzQ4Vq6ymVN/HS0ndMssV3T1jPFblqYcQcZX9m06mMAiGZPNKLsv+j44wyWNayvD74//pe
	XoK97+6GJYaLTNVm70lRy99PMbNGt0aeOZfFuG5Sxy1SqKXIj6mb2gRa/QCqTWMhgvQpLLp
	d6lN4f3NvDzdQW0G5onMQ2aNRebMrUg1J2Id18VjVjvyROrldnu4z/uRNLhQ0=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_235904_494719_425D6852 
X-CRM114-Status: GOOD (  40.40  )
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
Reply-To: Huamao Wu <huamao.wu@linux.spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rahul,

Thanks, agreed on making the SDID shortage diagnosable and on moving SDID
into the DT node. Comments inline.

On Sun, Oct 25, 2026 at 10:36 AM Rahul Pathak <rahul.pathak@oss.qualcomm.com> wrote:

> Hi,
>
> Thanks for the feedback, I have comments inline
>
> On Mon, Oct 19, 2026 at 11:19 AM Huamao Wu <huamao.wu@linux.spacemit.com> wrote:
> >
> > Hi Rahul,
> >
> > One design point on the SDID assignment.
> >
> > mpt_state_setup() currently allocates one SDID per SBI domain, at domain
> > registration time, taking the first free bit:
> >
> >     for (sdid = 0; sdid < ctrl->max_domains; sdid++)
> >             if (bitmap_test(ctrl->sdid_bitmap, sdid))
> >                     break;
> >     if (sdid >= ctrl->max_domains)
> >             return SBI_ENOSPC;
> >
> > SDIDLEN is implementation defined and may be as small as 1, i.e. two SDIDs in
> > total. OpenSBI domains are also used for purposes unrelated to MPT (per-hart
> > PMP partitioning, per-domain MPXY channels, IPI grouping), so a platform can
> > easily have more domains than SDIDs while only one or two of them actually
> > need a separate MPT. On such hardware the current binding turns a
> > configuration choice into a boot failure: SBI_ENOSPC propagates from
> > mpt_state_setup() to sbi_domain_finalize() and sbi_init() ends up calling
> > sbi_hart_hang(). Note that sbi_mpt_init() already treats missing Smmpt
> > hardware as non-fatal (returns SBI_ENODEV and sbi_hart_init() ignores it), so
> > "not enough SDIDs" is handled more strictly than "no Smmpt at all".
>
> A sensible hardware designed with SMMPT will need to make sure that
> there are sufficient SDIDLEN to support the use cases for which that
> hardware is meant for. It is exactly like having a system with 0 PMP entries
> though its allowed but the RISC-V ISA.
>
> The current design keeps 1:1 mapping between the SBI domain and the MPT domain.
> Which means each SBI domain will have a MPT domain along with a SDID assigned.
> From a memory-isolation standpoint, a SBI domain is the software construct that
> SMMPT enforces in hardware.

The tree is a function of the memregions alone. mpt_state_finalize() builds
it from the domain's memregions plus "index == 0" for the firmware deny, and
never reads the assigned HARTs, so two domains declared with one memory view
map the same ranges at the same XWR. They remain two SBI domains by every
other measure - separate next-addr, next-arg1, PMP entries, MPXY channels -
and one MPT describes both of them exactly. Sharing the SDID between them is
not a weaker isolation model; it is the same enforcement with one tree.
>
> This keeps the design and isolation model simple and avoids all sorts
> of problems
> which you have highlighted.
>
> The current error handling is the result of design assumptions plus
> what spec states-
>
> - If the SMMPT + SMSDID both are not present then the system can
> function without it
> and SBI domain backed by PMP/ePMP will work.
>
> - If the SMMPT + SMSDID are present then any error in the
> initialization which also
> includes not having sufficient SDIDs should result in a fatal error. Otherwise
> SBI domain backed by (PMP/ePMP + MPT) will be the enforcer.
>
> The cost of sharing SDID is huge which involves a system wide mfence resulting
> in performance issues. If two domains share an SDID but have different
> MPT tables
> then the SDID tagged MPT/TLB caching forces a mfence of that SDID on every
> domain switch between them which discards the optimization the SDID tag exists
> for and making the switch slower.

If two domains do share an SDID, neither condition of that paragraph is met
when their memory view is identical: the tree never differs, so a switch
rewrites mmpt with the same encoding and there is no new MPT to make
visible. The fence is paid either way - sbi_mpt_hart_activate() writes mmpt
and fences the SDID on every domain switch - so sharing adds no fence that
1:1 does not already have. Two SDIDs on one tree would not help either: it
saves the table but not the SDID, which is the scarce resource, and the code
cannot express it - mpt_state_finalize() allocates a root unconditionally
per domain, and sbi_mpt_share_region() copies region entries into the second
tree rather than pointing the second SDID at the first.
>
> I will change the current handling of caase where SDIDs are not sufficient
> and make it diagnosable instead of making is fatal silently rather than
> make SDID assignment opt-in. I will also make SDID part of the DT nodes
> for SBI domains.

Then the binding has to say what an absent sdid means, since that decides
whether "more domains than SDIDs" is describable at all:

  a) derived from the domain index, so 1:1 holds for every DT and a
     too-small SDIDLEN stays an intended fatal error;
  b) the domain owns no MPT and relies on PMP/ePMP.

Under (a) the property only picks a number and that platform stays
undescribable; under (b) it becomes describable, while a DT that sets sdid
for every domain behaves exactly as today. Either way please document the
property as optional. And where two domains may share an sdid, require their
memregion sets to be equal, EINVAL otherwise - sanitize_domain() has already
sorted each set and dropped covered regions, so it is a count and array
compare. There is no sdid property today, so the check has to arrive with the
property, not after it.
>
> >
> > Proposal: make the SDID assignment opt-in per domain instead of implicit for
> > every domain.
> >
> >  - Add an optional u32 property "sdid" to the opensbi,domain,instance node.
> >    When absent, the domain runs under SDID 0, i.e. under the root domain's
> >    MPT, and relies on PMP for its own isolation.
> >  - The MPT of SDID N is built from the memregions of the domain that owns N.
> >    SDID 0 is always owned by the root domain and its tree is built once.
> >    Domains aliasing to an already-owned SDID do not get a tree of their own.
> >  - An explicit "sdid" must be < 2^SDIDLEN and unique across domains.
> >  - A domain aliasing to SDID N must still program mmpt explicitly on
> >    activation. Right now sbi_mpt_hart_activate_for_domain() returns 0 when
> >    !sd->valid and sbi_mpt_hart_deactivate() is empty, so a hart switched away
> >    from an MPT-backed domain keeps the previous SDID in mmpt and would run
> >    under the previous domain's MPT. Today every domain has a valid tree so
> >    this is not reachable, but with opt-in assignment it becomes the normal
> >    path.
> >  - When SDIDLEN is smaller than the number of explicitly requested SDIDs,
> >    report it and continue with the domains that fit rather than hanging.
> >
> > This keeps the common case (PMP-only platform, Smmpt capable hart) working
> > without any MPT memory, and lets a platform with SDIDLEN=1 run root plus one
> > protected domain.
> >
> > The assumption behind defaulting to SDID 0 is that PMP/ePMP remains the
> > primary memory protection for domains without their own SDID; Smmpt is
> > layered on top (sbi_hart_protection_configure() applies the TYPE_MEMORY
> > protection and the TYPE_ID protections independently, so the effective
> > permission of such a domain is its PMP entry set intersected with the SDID 0
> > MPT). If the intent is for Smmpt to replace PMP on some platforms, then
> > sharing SDID 0 is not safe and this proposal does not apply.
> >
> > Regards,
> > Huamao Wu

Regards,
Huamao Wu

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
