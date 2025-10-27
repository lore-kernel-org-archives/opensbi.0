Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291F3CCF9E0
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 11:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uPwJvVebLXZMZYm9cLz26RAlIfzPSNyfVS4ZYdlRvA=; b=GTZeNmDuFjt81+O/607LzqOLW6
	S/l9NfRlE8URbhmfaJX94tzDIOhzHz1hhzlnDARhMa7Yayza/Q0EMkJ588UlqpQhjRhgOmt3G0v7Q
	mRKrmwB8eGZhCiUt5JkL2NQtEvMxQHAqFsdWn053DUyyXJ31VEZ/0KaYoO0ntbq9pyN3WaZLetJN7
	D+fHyr0I+rkGiPtqRq683hD/UHx4UKttFfmv0B8mlAbnHqj4DCMdV8UrIYA3tPdvnpQKlaPmqhszg
	g/5irQQAMGRGnR7q2baPCXNJ6lAuVeQhtTMn5R9C+qskmgPzeE4cIogCp0ujKNjLcmKps6I720lMi
	LMP7nU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDL6y-0000000DjLf-1LTw;
	Mon, 27 Oct 2025 11:10:04 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDL6v-0000000DjKk-2hVD
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 11:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761563399; x=1762168199; i=b.freisen@gmx.net;
	bh=jIvTbbc/Sk8idAmM7GesDq/UlA5wCiCmE1UjLSJ9yBs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ficyq0QAb+q5ALHnJMIi3KO9beAgWky0r0Cr9UoHu6bBBuZ7MkJzRkDzEHGFYYGX
	 3SZzBvU6k2EibpDMhZXyjylsXvoN6FblxoSx6LM1Kn8oWqHHeonzh/NwK+6R306XG
	 iXwNFp8i5br1W32lMSFv98Wl0KopMnG4K6p2DCGgOtFFpmve8T4T2qUdzAduKPQZw
	 AZUC3bQYOSrbXOPfEnXig6iIKBVMZQcPMul5e9zJ1P9gtPGYqpi69pnb0be/tLlGg
	 PnFsDAaZy7koLCht9INTXDAkaIhxo1DmzL5LTARobJuIQRb+LRBV/2gjp7MW9A4p1
	 nMRMHtphuoMYU8JogA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.215] ([95.223.79.155]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHQh-1uT30g0Z0T-00pDi4 for
 <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 12:09:59 +0100
Message-ID: <42506640-9b61-4887-9027-27a6342cc93b@gmx.net>
Date: Mon, 27 Oct 2025 12:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add trap-based ISA extension emulation
To: opensbi@lists.infradead.org
References: <20251026202416.23550-1-b.freisen@gmx.net>
 <3003220bcebd3decdf6d9455c1e55df7aeeccd1b.camel@iscas.ac.cn>
Content-Language: en-US
From: Benedikt Freisen <b.freisen@gmx.net>
In-Reply-To: <3003220bcebd3decdf6d9455c1e55df7aeeccd1b.camel@iscas.ac.cn>
X-Provags-ID: V03:K1:yhWv9C+NAbqCS+KfM6Q/DJdT3c6cf9diU40IRGHszgKrtS/U6ao
 iUfW9PhbWm2PGy5jKZCcwGnT2Ra2nerdiH/YR7rSR1mkceskDwaJXvrSK9jyhlvPeP/MXff
 gAqub/Wjqogpx1WpmQ72inJIq2TEJOobP+AGIeMkC5kDzXx4NUGKgUcMREoH0z67MDLr2n0
 3waVc2ydg7WzLRiV/wGjA==
UI-OutboundReport: notjunk:1;M01:P0:VgxqlRkmxWE=;OpJUFfMNTplGqibHa340oP9icwN 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 HUF76uPOttLEqPx0sHpURuRlRaOabfXA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_041002_058147_9A52ACCF 
X-CRM114-Status: UNSURE (   4.31  )
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

Am 27.10.25 um 11:02 schrieb Xiang W:
> PATCH4 missing
>
> Regards,
> Xiang W

PATCH4 is currently stuck in moderation, because the mailing list 
apparently imposes a 100 kilobyte limit, which PATCH4 narrowly exceeds. 
I will take note and split it up for a future version.

Greetings,
Benedikt Freisen


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
