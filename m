Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5E5CCF2D3
	for <opensbi@archiver.kernel.org>; Mon, 19 Oct 2026 05:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ9WsEH19RpbKB+kJjW44kIp6cO19HBuKYU2qdcLwTM=; b=y511hJezar2KXz
	X2ZgY70gP15F4SleIn462bzxR+G7v9yCP7IMngHeBNdTe2jR9cl/avIIjwoWU436RKYLSmNZxSjk0
	yLitfBbR6C/+dYoSfQnbezULEK6+aNRB5p96yixxSMabSLIF3ctfYt8QGqnlgTge1VD0e7DM7bD90
	EXXsCGQaymB4cr2zpw6DK2u+Svp2z4e6DrFWZqmxZK9P8+CpNSmmAfBYxxAoioXbnAUoxJSN7tDGq
	voH3VP1VvJKWA5+XDulAmv/KjVQ8k+Ef0u2jq/OLgq3wegAr6AhQhJcpnKnL5yILhVU8edqWUcMNL
	yhWkL2cbZC5N6VZqTcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgF7-00000006emO-2TlF;
	Mon, 19 Oct 2026 05:49:05 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgEw-00000006ekl-2Bpj
	for opensbi@lists.infradead.org;
	Mon, 19 Oct 2026 05:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792388920;
	bh=zdRaa5ZWxeSEVtodjQEMbSRnto7kVZoWxJSGUAmxt5E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=i9f/FJUBlGEjXFbqelsl9bU93HvigCqQ4qWTxyOuj3pYCXMnLHW6lxZAHB19CcqLR
	 R8MvyZeIv6//Cqkoi2Iph8MN8fcs8tTjibuLvKxCd+snNmpZwiV4l1jmwimj/gucYy
	 eebCObtM35jEioS6C3fYPDXfXHHzr4DEvcxCt9Hs=
X-QQ-mid: esmtpgz14t1792388919t12dce0ef
X-QQ-Originating-IP: uvckAKW1jD/XQ7cmUEB+gG5KY401g+HtG6Mt1GSq9TA=
Received: from LT-WUHUAMAO.dc.com ( [123.158.48.41])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Oct 2026 13:48:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10135495343581998043
From: Huamao Wu <huamao.wu@linux.spacemit.com>
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>,
 Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>,
 Huamao Wu <huamao.wu@spacemit.com>, lufei.zheng@spacemit.com
Subject: Re: [RFC PATCH v5 0/4] Add Smsdid and Smmpt supervisor domain protection
Date: Mon, 19 Oct 2026 13:48:36 +0800
Message-ID: <6701264D162D4F00+179238891654.72905.12844513368292585993@linux.spacemit.com>
In-Reply-To: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
References: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: Mpz5OzLmVFcJwMWrbU6rUo3a2F3HOoLl3YyC/ztGkvPjqTFBqBsFXdPy
	uL/JB6sgRFjw2nP5VPkBtlcozv82V2/T5IFHoOYuemz0A1DbrlPbkgZoXi7qScsSq6DfAOp
	u8bE+rkjKRZXPjUgw9S5nE7cCP3lh4BjbBVPNH4eJypx9Q+LqWKo2+0/kmqnGDbmNfJ4SaI
	nYZzD/HEju4EeIva0E6qM1lepmjOCdZHLyIqmgw2xSkyeLm/5CYEdZmbYt5bmjrvaqBzWgC
	O/jVTH1bn6QywHHplLQji30yAXEiFtgZA7YCtGkQCLZ9k9QR7cdEf1HAbe0EeiVH3iGtNgY
	Rs55JBkOF3sPG8Wz0GrcFHM7slSpEPOLz/fXJ1L3QDyud31sdZGGslutwDWJ59pV9Ml7din
	jz78rjo11PNGZk45QorEVcLezVMAr4Q2bI1K5Wvh/ThB4Jv8e2leXja8+6srD877WvxuKp/
	YtS/A1eu612sCQ/joKu/5wRH4zaXEFG9xjzS/K9+rW/3d1XiQczRow/yo9PSLagJyNxfdJ8
	mzIcVyuWg5JhGpZnr3lNHW72oaKgQQMLvFgtQjuwH7H4jExF98sj9p7AQ0pe6auX4OGk+0Q
	hYvS5+g2SlfVQ2VF8RpTIztj26kX/iPZhcY7693+KKZk9SObM/ddWEpV5pI7Hha9hWqXylv
	a9FMNK20CvlPio3LwDsmteZgvZSyTYTljMcDbxjA+AK7zDtsyWfMNKuMGrhrcNUWj7w1KMq
	j+fW7HCDGT23Hs9X1axPLtgG0AYmz8spBKC9v/zpwVIIVWLDiDE3H548rK6s/wAKEgUBE9s
	cM4zNXnXIsxEDdrElz39DuyggEatkq4DzY8oV3G8kXBu/nytU2/pj+RVRH5MvUncqgPn/dD
	rE431g2VlvvlCcBU7I1UjeMK2GX8w+pTqXJd6F8fadVEWXh/+duUWcsLcoR4mpYpX2IoRMz
	Vzbi0JMvflB81wgwkY/c6lk7xucGcqnrqsEQ0keNpwKZRMUt/mAtp6wLC/8MzWC8XFx9sA5
	foBjCpuRP9BWbdiaX2i9L1TIKZ/k8/Y4I0cjND2iQ7QhvGTiH6sP624mr8nNMlNgVYa3SRL
	dWWN8Wo4gYR
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_224855_390740_27F619C3 
X-CRM114-Status: GOOD (  11.02  )
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
Reply-To: Huamao Wu <huamao.wu@linux.spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Hi Rahul,

One design point on the SDID assignment.

mpt_state_setup() currently allocates one SDID per SBI domain, at domain
registration time, taking the first free bit:

    for (sdid = 0; sdid < ctrl->max_domains; sdid++)
            if (bitmap_test(ctrl->sdid_bitmap, sdid))
                    break;
    if (sdid >= ctrl->max_domains)
            return SBI_ENOSPC;

SDIDLEN is implementation defined and may be as small as 1, i.e. two SDIDs in
total. OpenSBI domains are also used for purposes unrelated to MPT (per-hart
PMP partitioning, per-domain MPXY channels, IPI grouping), so a platform can
easily have more domains than SDIDs while only one or two of them actually
need a separate MPT. On such hardware the current binding turns a
configuration choice into a boot failure: SBI_ENOSPC propagates from
mpt_state_setup() to sbi_domain_finalize() and sbi_init() ends up calling
sbi_hart_hang(). Note that sbi_mpt_init() already treats missing Smmpt
hardware as non-fatal (returns SBI_ENODEV and sbi_hart_init() ignores it), so
"not enough SDIDs" is handled more strictly than "no Smmpt at all".

Proposal: make the SDID assignment opt-in per domain instead of implicit for
every domain.

 - Add an optional u32 property "sdid" to the opensbi,domain,instance node.
   When absent, the domain runs under SDID 0, i.e. under the root domain's
   MPT, and relies on PMP for its own isolation.
 - The MPT of SDID N is built from the memregions of the domain that owns N.
   SDID 0 is always owned by the root domain and its tree is built once.
   Domains aliasing to an already-owned SDID do not get a tree of their own.
 - An explicit "sdid" must be < 2^SDIDLEN and unique across domains.
 - A domain aliasing to SDID N must still program mmpt explicitly on
   activation. Right now sbi_mpt_hart_activate_for_domain() returns 0 when
   !sd->valid and sbi_mpt_hart_deactivate() is empty, so a hart switched away
   from an MPT-backed domain keeps the previous SDID in mmpt and would run
   under the previous domain's MPT. Today every domain has a valid tree so
   this is not reachable, but with opt-in assignment it becomes the normal
   path.
 - When SDIDLEN is smaller than the number of explicitly requested SDIDs,
   report it and continue with the domains that fit rather than hanging.

This keeps the common case (PMP-only platform, Smmpt capable hart) working
without any MPT memory, and lets a platform with SDIDLEN=1 run root plus one
protected domain.

The assumption behind defaulting to SDID 0 is that PMP/ePMP remains the
primary memory protection for domains without their own SDID; Smmpt is
layered on top (sbi_hart_protection_configure() applies the TYPE_MEMORY
protection and the TYPE_ID protections independently, so the effective
permission of such a domain is its PMP entry set intersected with the SDID 0
MPT). If the intent is for Smmpt to replace PMP on some platforms, then
sharing SDID 0 is not safe and this proposal does not apply.

Regards,
Huamao Wu

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
