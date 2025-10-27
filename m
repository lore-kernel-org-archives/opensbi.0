Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975BBCCF9E5
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cj6PrlDtZ/kNlCqZa4Ja62mKMKi5WAnJekOPbOHt1ns=; b=DYAqwZ2Wpj6wuw
	UITXBAD+B5jh0BLrEwZZONGOLAk6WCQg/GqcE1qnIZLyfZEt2/XUlsnbM/J9v6UNds+OFZ9hwYNDu
	aVWNINJ1m4XL0rV9EDdC9cw0+vB7RpZohRkCeUXe6J30HzuHyxhyhPtZN3X8IWXv1O92Npkl6gJVR
	10JOjDjZAS9/VpgjNJHu/3YXfn3vKuMcWWz9MGsr4MOUZ+hmrx+qhhyuNs3N12xC1a67hdFyywqy1
	H8NHMXUjGzECH3dC+7pa+44/9QoChFhVPhvqux8TY0nbtvemPJlh9uAlYZp0J4B7m7Crzzcr4VwZr
	5+4v3u9rkTzk5U8dI3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDW3Z-0000000Etik-1sA4;
	Mon, 27 Oct 2025 22:51:17 +0000
Received: from mail.johndorf.com.ph ([104.219.42.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDW3W-0000000Ethx-3MsL
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 22:51:16 +0000
Received: from DESKTOP-67LN6J4 (static-23-234-93-238.cust.tzulo.com [23.234.93.238])
	by mail.johndorf.com.ph (Postfix) with ESMTPSA id AE2F41CB76C
	for <opensbi@lists.infradead.org>; Tue, 28 Oct 2025 06:36:47 +0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johndorf.com.ph;
	s=default; t=1761604608;
	bh=2NZwFFSlzgN7H+H/5RMBVzDR2//3KeY2yLlrY2pdyRY=; h=Subject:From:To;
	b=puMVwSTIkI2W6bs2tzD3/WyPs0B7xbTMEFid5NqkA7pJtSrxxH8t993d0LBlKGcvA
	 1cihEj2PDX9VwC1Q6KCfgQ38oB5c6/fJgQZIDVpUm91ldv1Qa0aATGT/DitB6kA8VF
	 /RhzWbudXNctb8Ti4ISmPuK3TVqSTtCCGzOAWFso=
Authentication-Results: mail.johndorf.com.ph;
        spf=pass (sender IP is 23.234.93.238) smtp.mailfrom=billingcdo@johndorf.com.ph smtp.helo=DESKTOP-67LN6J4
Received-SPF: pass (mail.johndorf.com.ph: connection is authenticated)
MIME-Version: 1.0
Date: Mon, 27 Oct 2025 15:51:07 -0700
Message-ID: <4A2AFE86B69DD5B0D2297AD2F154FA8AE9B7D762@DESKTOP067LN6J4>
X-Priority: 3 (Normal)
Subject: CONGRATULATIONS ON YOUR AMBASSADORIAL APPOINTMENT
From: UN <billingcdo@johndorf.com.ph>
To: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_155114_968734_5B10E375 
X-CRM114-Status: UNSURE (  -1.29  )
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
Reply-To: beatricewalter944@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

We are pleased to inform you that the United Nations Organization has received positive feedback about you from our various offices across Asia, Europe and the United States.

As a result, you have been appointed as a goodwill Ambassador of the United Nations. 

We look forward to a productive collaboration as you undertake the responsibilities associated with this role.

Please provide the following information for further communication:

Your Full Name:
Address:
Telephone Number:
Identification Card:
Email Address

We appreciate your cooperation.

Sincerely
Office of the UN High Representative for Foreign Affairs & Security Policy


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
