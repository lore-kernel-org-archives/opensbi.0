Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60753CFD313
	for <opensbi@archiver.kernel.org>; Mon, 24 Nov 2025 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y17EFB73nWke1s4LRJz0phJV1zo9ZipsA0CRHtcCFEc=; b=UGo7C374PbACiZ
	Rmfq2MsOmO6YMdSJ2e9BzoA04ZVkphvfzbvI7dlYPWz/g78DkpzJmmAdsQQgVPRoGQJ4cJ74aMT62
	HPi1Xbu6e3uHyk41A/kdA36UqqYpHCYxUyErYfoTh+K8CVk0uJiIHUb4AFLplYb/DO2gtsapVGMnL
	lkiXSMwVn2NzURM7fE1vQ6pR5S7bpVHWGYTRmjZv0BWAZ17+px508ptptmHab9r/S/fcaYkKB3KVv
	rig+x6WoaYdV0nGxnwPbJ1OpK+JFpOmGtcdJ8E6TSGKWTEK5O72IHwUl0urNoacu4IubIcNRfqT0N
	6WSQHcsUIanrFOkQA8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUls-0000000BYqM-1xTI;
	Mon, 24 Nov 2025 11:30:16 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUlo-0000000BYnz-0w1X
	for opensbi@lists.infradead.org;
	Mon, 24 Nov 2025 11:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763983777;
	bh=hAWwl45Wdpi6H1FkYhrQMC5Rki82zAkbyIyxhMkT/Jo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=DjhJ/Pg5t7341/qh0wUJyAGeVYszSgVTGezVtW61hWnEdu8mXFqi4TQsSkvmVS+HW
	 kQLLQ7oyP945CawpPJbeJZuKyLPBSUFCyVyIRSG3OZXlO/igJOpZDJaLMSGqsBpdCl
	 DpE/6VIGMeGUuxi7EcfhGO4FjyjG11uC5Y4rGspw=
X-QQ-mid: esmtpsz17t1763983772t94d24c3f
X-QQ-Originating-IP: fZ0jTGd4WyWVTGFqd1o5pG99je12tx6wkLj0jgyqLMc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 24 Nov 2025 19:29:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11626773636746068601
EX-QQ-RecipientCnt: 6
Date: Mon, 24 Nov 2025 19:29:30 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, opensbi@lists.infradead.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
	Anup Patel <anup@brainfault.org>, spacemit@lists.linux.dev
Subject: Re: [PATCH] platform: generic: spacemit: add missing objects.mk
Message-ID: <03A15D6686A3A9AE+aSRBmpkBhccbZlYJ@kernel.org>
References: <20251124-k1-fix-v1-1-8d7e7a29379e@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251124-k1-fix-v1-1-8d7e7a29379e@pigmoral.tech>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NXAazXCEWOjYMpjkewyUuza1e177MacYmeU9Zu9ewLIYCBAxJSWYyE5S
	vPbQlTZnaFAs/74W7pDPzvseIU9+mkkMvvrrHvD0LmWxaYTDO5A4iJHbVzAij7UD6QC0WuB
	0GmF8dNWagPB+SJ8BhQXrDbiXZ3V3c6YOCToU/EPsq7YGb/kGX00Tiqm9/9N/2O+i2sLeXv
	LcDZPFBy/GyW5pDPKF4kAGdkc5/aQoOkkdz7Pg/VuLq4JxzzEU1BmsUbm7U6bajNVuEbJ+u
	D+/w3PTdGN2uNw95A4XJQ2flcxE4nNWRMX1uhvkO/LRKJzP1auV4dUaU4/0wOhgYpIKuAuY
	2YNXDjDz9kNyq33Ynh7v4shPnoAcRzqRrY/YxEOygbJesdwPO1QNbGdPf76Dv8AEVSZ25ol
	LToegXXJFNjd7J746ZC4aULid21+13ZMkowH0e3CaGTlktr9p8SyJcHb5ILoTgAjyC/J1Ts
	PmQluXSU6HORBsJ9dqYW8CWfIXVXrLMJfgk6dhMoe4eWus97k/E5TNhzogtG71sAACCrhHe
	ZOo9xzltjfY5AfiXjk4rfvcnqN1FtTyvDGnHwc3fHLW/cIelsaNfB1RVzTi9oYGK/Vv0hbF
	hJkHhvVNQLZZzX55nRBNajN6461tisx1DcIDudU1zL6IKOn0nuLmYezIPN5TcidCVcxmKkn
	6zoIaiEGiSjbYNw+47XbXl+hXjhGcoZHMrKCXhUgNrl8UK2+xjo5KV2NaF2kLj/Ez8DLuU1
	s+gXtv3QbFzQfxMwqEiFOdfrIx42kD0rtC4fzyjkq0FKmPe6B2Lg07mzJuC9ioMrG2Eu5Qy
	LEWXHbngsfWVyzVJmlnExj4trruOF9fD3X6sU1yTl2LEplffvcfSAqaMuXIS44AnHtrptGY
	IaWur6tI3jBFQwqhxDy5qRjgBEAgWKXhuMlnkfq82bKsX2E5kpLrYEnKbSYiFyKXRXC7BEl
	RdfhrDptDqeS1c5kEEiXeJ/+lQOvykJFSd5KNeKfLJX1HmPuYG/plBmw4lDpj7UgCsy3eY0
	FHQSW5z/qTj3ZGnL4AcLnQ1n0pkChlf4BvHvoqo9vdthiHTokcPSM4Bxp2JeORwUkSd8OxS
	g==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_033014_118323_5DF6CDDC 
X-CRM114-Status: GOOD (  14.07  )
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

On Mon, Nov 24, 2025 at 07:16:32PM +0800, Junhui Liu wrote:
> Add the missing objects.mk for the SpacemiT platform, required for the
> K1 platform to be included in the build.
> 
> Fixes: 1f84ec2a ("platform: generic: spacemit: add K1")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  platform/generic/spacemit/objects.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/platform/generic/spacemit/objects.mk b/platform/generic/spacemit/objects.mk
> new file mode 100644
> index 0000000000000000000000000000000000000000..dcb37867aa661dfc559088f926cd1465bc0f7e8d
> --- /dev/null
> +++ b/platform/generic/spacemit/objects.mk
> @@ -0,0 +1,6 @@
> +#
> +# SPDX-License-Identifier: BSD-2-Clause
> +#
> +
> +carray-platform_override_modules-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit_k1
> +platform-objs-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit/k1.o
It might be that we forgot to clear temporary files during testing.
Thanks for your fix!
I'll give a TB tag after test it.

Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> ---
> base-commit: fade4399d2a47a3ff9c5ecd5dd4c3cba7a4eace7
> change-id: 20251124-k1-fix-433af01a7aa9
> 
> Best regards,
> -- 
> Junhui Liu <junhui.liu@pigmoral.tech>
> 
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
