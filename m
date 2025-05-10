Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B273C3ABC9
	for <opensbi@archiver.kernel.org>; Sat, 10 May 2025 19:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bxn42INW1MCtLHBnAcvoxy1WezvGRub8EgfYGODeeP0=; b=EGBlPkya+Yzv/o
	+aDoJmZEulXuwshqPDm9TTqnApCaE7LoYJudnxmQc2RtQZRfps2stu18VGC5Qhe89sa/MCE/Qx58r
	rlrGKlfMg7oUKvxO1hpcWD0YaxJps4ebrpy0uF76yXA5rCCHmaHLZX5VppoRjMB3InWuYv1vUMiR7
	5/c1T0jusmrMdA/j6M5ZTtQdOzP4sZBYnRpKVP9bMbdaWOMJqUTLV37Gu/Zf9LILYsRb2siQ65Ycr
	024v0pEfxbnWdeecis1Wg4XcZp4I9sC25N/QI00sbsPNiGugg8SW2bVctPazBc1nyefJZModXQ34R
	T4fkUckhPVHKeLnss9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDpgB-00000006ITL-2hEX;
	Sat, 10 May 2025 19:16:11 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDpg5-00000006ISm-3Q2C
	for opensbi@lists.infradead.org;
	Sat, 10 May 2025 19:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1746904561; x=1747509361; i=b.freisen@gmx.net;
	bh=HPDsFtd4cTp5KBDr+l9y/wcQJtlaNmRjuKE8QSbeDpQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=chVUX2TvDbBjBo/Soaufw9qNpakK5bsXXj12J43gOPiIqOzZ81Aiy0ekPU4wK06Q
	 fLefCDTIFNqjcuYXrazQ3zdjoobDntBd3nlmzVssPo+fQYGxrgLmaSezHjNQRez3s
	 slL5nYhDGIGTd2eLstNesXjEScBy2IZRfDm4JZ8N2/RWfN/C+3oYRIAg/yCkgydoF
	 TalxqfPC+edg9hsOCgN196BND/TzeVI8mP3GdoUjVcNj8ciAXrgio1kg1rq0oyDwm
	 t/ilFP6jss158wKIbPzniLYXaDHaHNfexxyQFCxLuzyBlYHtZ8hQn6I3bKHQf2+4q
	 s224mv+D+acS7kEDeQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.215] ([95.223.79.143]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQvD5-1uPBn41tpf-00LZs3 for
 <opensbi@lists.infradead.org>; Sat, 10 May 2025 21:16:01 +0200
Message-ID: <490da502-c2e1-462c-93d7-d9b5d82add82@gmx.net>
Date: Sat, 10 May 2025 21:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: opensbi@lists.infradead.org
From: Benedikt Freisen <b.freisen@gmx.net>
Subject: Experimental OpenSBI fork for trap-based ISA extension emulation
X-Provags-ID: V03:K1:9Xp9j4Mkl/WxxtWkdodUMBliXaqjMxUII+PRwRhOhTfNb1Z6ZDU
 UBsBskfgv8eSomHQrn4Gln1+ACsrVOIMhYce53ic7cTimEzJxussg5GSmk5p6CYltrdchM5
 xBdYfgry+zRCLmyNNCE0eKtCJGY9k+drlsPBG3yhHnp4v/gSjzhRkqHpo+6YevxgplmgmJ3
 D+ccaugJR0EG9Z3gtSTTQ==
UI-OutboundReport: notjunk:1;M01:P0:oRVOlzZ8Xf4=;AMh8Nb6cdKYXsvrvW25vSBKSk/y
 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
 VPTzzemQs8yZ2YLmCasXF0IYmVb+470Sk1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_121606_248174_E2C8641A 
X-CRM114-Status: UNSURE (   4.44  )
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

Good evening everyone!

With the European RISC-V Summit quickly approaching, I have decided to 
make my recent experiments involving trap-based emulation of ISA 
extensions relevant to RVA22, RVB23 and RVA23 publicly available.

Since they add quite a bit of code that would hardly be relevant to the 
average OpenSBI use case, I have uploaded everything as a fork on 
GitHub, named opensbi-isa-ext-emu*.

It currently fully emulates the ISA extensions Zba, Zbb, Zbs, Zfhmin, 
Zicond, Zimop, Zcmop, Zcb and Zfa, whereas the implementations of the 
cache-related extensions Zcbom, Zcboz and Zawrs are currently stubs.

Please be aware that this ISA extension emulation is highly experimental 
and expect bugs, because the code is still quite new and there has only 
been rudimentary testing in Qemu.

Your feedback and opinions are welcome.

Greetings,
Benedikt

*) https://github.com/roybaer/opensbi-isa-ext-emu


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
