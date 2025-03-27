Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B11AC36011
	for <opensbi@archiver.kernel.org>; Thu, 27 Mar 2025 17:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qIC+CSVrIzywYYNXmjwwWXCZUr1B68wLczKBf6ns5Dk=; b=Ztk2UDEuBzsGuo
	rFv6OEYFVwsPOz/LCpx/o2zaZD73kHShI1US5S7RE40ailULM6BejkcusgxcPAqb4kPBHG/YICtKy
	klI1cDd2DWefXgi5BU6oDKlQoefvLTbD2NiTV3sbCI1EXIjf74u09N0lMSiFEF/ooLSUxZi0Fww2z
	QVj+/pdAElIVWRiYUWh1HZQfmYw7gidEamLC8eezh9idHniE/TaCFN5AhkvRPSBf7E3vv+O2KK1Um
	xaWWY5vzaHliYG3yxVZnizBj0hAqTObZg4Tl4/HIaIKNtuZgeMjnMvQvQvuGzEm5TWKy1xQ2yk4eL
	7x1pEtRbKikAyNLkf1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txrH1-0000000BgI4-0PKq;
	Thu, 27 Mar 2025 17:44:11 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txrGy-0000000BgHA-1nd7
	for opensbi@lists.infradead.org;
	Thu, 27 Mar 2025 17:44:10 +0000
Message-ID: <3a38307d-c1e2-4527-9187-8ea4c72c985b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743097443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gwxL99DMiCt2IoZcXqufjBJ/RjgnLI0bmV+lhhjHah0=;
	b=oytmLao8AsELmtH2AVLLZ/NghtQvwE/8daS9f/iOfxAcqc81SfKprz14kTEDp0zfskzumx
	mQmjnC7/S+iaLyTEqJsacc2u1Ivy5ivzYWx5+5s1hwr7Z5I/i9rk2pYnnK7OnRiJ302cX8
	QtvY4ekMG71ckUO9wDJYJE6Gy5NPIvM=
Date: Thu, 27 Mar 2025 10:44:00 -0700
MIME-Version: 1.0
Content-Language: en-US
To: opensbi@lists.infradead.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
Subject: OpenSBI Archive Now Available on lore.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_104408_860174_984FA39E 
X-CRM114-Status: UNSURE (   3.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Hi All,

We are happy to announce that the OpenSBI archive is now available on 
lore.kernel.org, simplifying patch management and communication:

https://lore.kernel.org/opensbi/

Key benefits include:

  * Seamless patch management with b4.
  * Access to the OpenSBI newsgroup via lore NNTP.

We believe this move will enhance collaboration and efficiency within 
the OpenSBI community. Please inform us of any issues you find using lore.

Regards,
Atish & Anup


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
