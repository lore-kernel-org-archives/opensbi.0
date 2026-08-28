Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A4CC61DBD
	for <opensbi@archiver.kernel.org>; Fri, 28 Aug 2026 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ga8nvEIb67Qz4zDA60MtPsfXQ/0t7othvwv0/PVvvHA=; b=SnH1FD/OxUil9d
	K3EIIM8maCYITwbLkLy8FZeTRuWEdmlsylWCxgtV4xBLd1MI6eggILAJclMXQCJWf/5G69BIFqWGd
	3ArI6/hT5qofFYHC1WWHjkaYTImL/m3WhO4rFS1HELN/kmw+faOHW4Ij48EMybamXOg+8Csisu8rE
	gH81ToR1dfJTxE88SQJfYhEer9IUbnjv0E9sgS3tf9i0eAKG78HjP5i9zWdC4HazYvzcO9GX/ZFCa
	itO749bgg95sTSEqa6C1E345KS8YRe1CLWLA4/hUGxDLU5KpMQ+rmlrB4urxm5goS1nf2WSd27Zvt
	G4vREV45wihjvuF15HsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00MZ-00000006GN0-1bsk;
	Fri, 28 Aug 2026 17:27:35 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00MV-00000006GME-3I7L
	for opensbi@lists.infradead.org;
	Fri, 28 Aug 2026 17:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787938043; bh=8d6C+GlaC2ROTm03f6Un3qUh+HUNOjskCSWy2ryj2Zs=;
	h=From:To:Cc:Subject:Date;
	b=dG+SHaienR4wx4yGTz/tbtdWMdrHLOpsJHciH3DuvET7/RH6u7maYhYHKAnyVYvsN
	 o+Er8pnPcKTQC/lxTrEqJLBuso6Pmp0SuA1rjFztkilot5WjyVzETHKqbdICVF8vx0
	 EgBLL69kMpB4cIds/ZIUhof4M+omOtfa7WhFRfkU=
Received: from zs-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.. ([124.79.168.208])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 6D5BCEBD; Sat, 29 Aug 2026 01:27:21 +0800
X-QQ-mid: xmsmtpt1787938041t36ms3zjs
Message-ID: <tencent_41D845E8A5581104FC008200CAC9C484770A@qq.com>
X-QQ-XMAILINFO: MeukCuWaRbQl1J9IWM3d+suHBJ3VJRP5ZqJvUUbCL0D4w+XkCdVNDbxFArlMk7
	 jfb4o/S8QkEN9wRJjILYScRlrSlRWi3gL0rH0be7ebJ38/4EVIXgkUSesSApaoyW6cMNYRSg/lRT
	 ukR0GHGvAN6ID0lfk4bLn9SddwaBiahBDTEMXU67mTyTQ8/l6TVLm3WH5ac7p+k0IaFdZAYqbaOI
	 IvyMNIqwoGLjJl61hEcaxtOo5A7P27sfyG+s65bWqEuV0aB2IQkgBGG9vQ8k1pub48+WQWfV1+3m
	 L0/L/1w+Txtfzox2LfvFcgl36nNnv9dqw6sQKnhoaKGQZSP2Q3hcrMOrC34Rg5G9UqB45F/LHGQa
	 h1zkEjVuMQYuqTXZSyARUPrqoPxuooDG4Vr0bT5iopgjT6JoV/q+UrryalmOF86pwrnxyfiyWqRI
	 wch1FJlcqCbDpuJVeDKlvenAHq5VZf/XmgsXE316IEYro/thAKlSNUOaiuQXfFi/XCneWYLqnVz+
	 bGJPwE90JhAJ0IpdChr2s6XcQHCZRTMdxK5AAEeCveqGy+2C7uF0MC5n9olNiJIgZe7C9J/BNVNa
	 PAZaCxrvgs5RLN5jTS3aWlADVgudGjLq6I32aQgn0fgJwlVz/dSqqCMqbmxfjTXPX7dAsNMDQap9
	 8kQg73ELRpp8ONeReu0NqUgvsbnsuDb+nmghsS8zIE9jp79CXcL/VjoijQ+fz+5M6A2DcG3Tfxzv
	 wdelBTPHqivXlTkZdFNKZLpEE1dxBKPjpUMuIund8b3Prv95rnpLFIgmGaZqTjjLEUhPb25nTo/J
	 4xrWddl+ccsPqHnV//rDQzTt3SouGGupGq7FJww6GbH5v1GQLZ0WaZpJS3nVV/Vxz87FyfnXdc/V
	 OIC0aOL12CRxeSrcleDebQq2iG+AtWoOSjK0UbfrrBBdUonNMsMSsWfI1V82gO81YjrzaR3RIoDY
	 qIcnn78+Goo+nfO6799Ah7cPjeqOSk/yD/2NXKQPBhkSxGNnxnXoujgK6WnhvrpEEAiXXpwAw=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Shibo Zhu <3499129952@qq.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Subject: [Question] HSM START_PENDING when hart_start request never completes
Date: Sat, 29 Aug 2026 01:27:17 +0800
X-OQ-MSGID: <20260828172717.175148-1-3499129952@qq.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_102732_291035_6F018D83 
X-CRM114-Status: UNSURE (   7.89  )
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

Hi OpenSBI maintainers,

I have a question about the failure semantics of
sbi_hsm_hart_start() when a start backend reports success but the
target hart never makes progress.

The relevant generic HSM flow appears to be:

STOPPED
   |
   | sbi_hsm_hart_start()
   v
START_PENDING
   |
   | issue wake/start request
   v
backend returns success

For the generic path, OpenSBI may use an IPI to wake the target hart.

After the wake/start backend reports success, sbi_hsm_hart_start()
returns SBI_SUCCESS while the target remains in START_PENDING.

Normally, the target hart later enters the OpenSBI warm-start path and
eventually calls sbi_hsm_hart_start_finish(), which performs:

START_PENDING -> STARTED

and releases the start ticket.

The case I am interested in is when the backend reports success, but
the target hart never responds and therefore never reaches
sbi_hsm_hart_start_finish().

In that case, the state appears to remain:

state        = START_PENDING
start_ticket = held

indefinitely.

A later hart_start() request for the same hart cannot proceed because
the previous start request still owns the start ticket.

What makes this case interesting to me is the distinction between a
wake/start backend reporting success and knowing that the target hart
will actually execute.

For example, an IPI implementation may successfully perform its
send-side operation, but that does not necessarily establish that the
target hart received the interrupt, started executing, or will
eventually complete the HSM startup sequence.

Once the backend has returned success, I do not see a generic path
that can later determine that the outstanding start request has failed
and safely transition:

START_PENDING -> STOPPED

The target hart itself normally owns the successful completion path,
while the requesting hart has already returned from
sbi_hsm_hart_start().

I would like to understand the intended contract here.

When the generic IPI path or a platform HSM hart_start() backend
returns success, is it expected to guarantee that the target hart
will eventually reach the HSM startup completion path?
If the backend reports success but the target hart never responds,
is an indefinitely START_PENDING hart considered an expected
consequence of a platform/backend failure, or is there intended to
be a recovery mechanism at the generic HSM layer?
Is it intentional that generic HSM only handles synchronous backend
failures, while failures discovered after a successful backend
return are outside the generic HSM failure model?
More generally, what is the intended ownership of an outstanding
START_PENDING request after sbi_hsm_hart_start() has returned
SBI_SUCCESS but before the target reaches
sbi_hsm_hart_start_finish()?

I am mainly trying to understand the intended HSM state-machine and
backend contract here. I am not proposing a code change at this point.

Thanks,
Shibo Zhu


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
