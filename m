Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAE0CED24E
	for <opensbi@archiver.kernel.org>; Tue, 18 Nov 2025 09:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdAPhMESGx8kiwABqgAIb6xvUl76yhhMhct2/nFWvtI=; b=cm+N+f9xJAvMTP
	4kx2X80o/Tv4Wl7INb7oQ8cZQNOHDAlbSjzkFwvo28zCD2/53zefCO38J0C+uGduhL+2iYuIujULG
	A2V/gsintz2SCePr2yCEGP2S96XOpWODNRA/oTeLYKB6AaoQgyDyVmc9//NYzs5EJ8CWklYnH9J4N
	931F7I5EYAnHGgAiXoOu0ZbO0jxTq80IONR6Q675nuRV3H6wMYLXYAzn4QYho2t3P3aRLenpTn64m
	H+NPXx85rLBd6HgTfBlyfPUoC+YWRICRVuyyEPf5KHjtUiNEMCul67htrs9xfMkSZt8oB4nD884Vx
	VYrGnXKRvi+nCCLeC8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHxc-000000009jB-3u8Q;
	Tue, 18 Nov 2025 09:25:16 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHxZ-000000009h4-2Icd
	for opensbi@lists.infradead.org;
	Tue, 18 Nov 2025 09:25:14 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 0631D1FD81;
	Tue, 18 Nov 2025 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763457910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VMea6DxbwHoaZJ9PRuEQyattOJsj9MIgoxp9nNEKdVY=;
	b=MYN9ypjtMmN3XxRXTzwElRqh8THEeTu2lEo3bTmAjg6S897ZVo6sNw9/veRB5z8YVIZhrY
	qAl1DkCNxYR4QQiP9iiQ35Q5HOe59UTnxcuM27J31oBMcqfqGkqwF+yBMn4/1HjtgICJJI
	Ner///tNOCqTPVb4BFWjGMmtTgf+NgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763457910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VMea6DxbwHoaZJ9PRuEQyattOJsj9MIgoxp9nNEKdVY=;
	b=Kvdflfw+Xv+0s805uBk7SXRZw1Ast4s4AMpDT4QcGIyqu75rlZ4s0jlDWk90A+aPI00TgJ
	s8W7ZAK9tZJDVlBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763457910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VMea6DxbwHoaZJ9PRuEQyattOJsj9MIgoxp9nNEKdVY=;
	b=MYN9ypjtMmN3XxRXTzwElRqh8THEeTu2lEo3bTmAjg6S897ZVo6sNw9/veRB5z8YVIZhrY
	qAl1DkCNxYR4QQiP9iiQ35Q5HOe59UTnxcuM27J31oBMcqfqGkqwF+yBMn4/1HjtgICJJI
	Ner///tNOCqTPVb4BFWjGMmtTgf+NgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763457910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VMea6DxbwHoaZJ9PRuEQyattOJsj9MIgoxp9nNEKdVY=;
	b=Kvdflfw+Xv+0s805uBk7SXRZw1Ast4s4AMpDT4QcGIyqu75rlZ4s0jlDWk90A+aPI00TgJ
	s8W7ZAK9tZJDVlBg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id EBFD14A03D3; Tue, 18 Nov 2025 10:25:09 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Bo Gan <ganboing@gmail.com>
Cc: Xiang W <wxjstz@126.com>,  opensbi@lists.infradead.org,  Xiang W
 <wangxiang@iscas.ac.cn>
Subject: Re: [PATCH] lib: sbi: Add runtime stack overrun detection
In-Reply-To: <97960cc7-8d37-4105-abe5-681ec5bbe334@gmail.com> (Bo Gan's
	message of "Tue, 18 Nov 2025 00:43:24 -0800")
References: <20251118041948.1331562-1-wxjstz@126.com>
	<97960cc7-8d37-4105-abe5-681ec5bbe334@gmail.com>
Date: Tue, 18 Nov 2025 10:25:09 +0100
Message-ID: <mvmfrab4rre.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[126.com,lists.infradead.org,iscas.ac.cn];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_012513_753783_4D541854 
X-CRM114-Status: GOOD (  11.51  )
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

On Nov 18 2025, Bo Gan wrote:

> Hi Xiang,
>
> On 11/17/25 20:19, Xiang W wrote:
>> +	if (sp < stack_start || sp > stack_end) {
>> +		/* Reset SP to output error messages */
>> +		asm volatile("mv sp, %0"::"r"(stack_end));
>
> I don't think it's safe to switch stack in C function. I know you want
> to avoid re-entrant, but do it in C function is way too risky. Better
> have an asm wapper over this function and do it before invoking the C
> portion.

The GCC docs makes this explicitly undefined:

     Another restriction is that the clobber list should not contain the
    stack pointer register.  This is because the compiler requires the value
    of the stack pointer to be the same after an 'asm' statement as it was
    on entry to the statement.  However, previous versions of GCC did not
    enforce this rule and allowed the stack pointer to appear in the list,
    with unclear semantics.  This behavior is deprecated and listing the
    stack pointer may become an error in future versions of GCC.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
