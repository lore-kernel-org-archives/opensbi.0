Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DFFC5AE49
	for <opensbi@archiver.kernel.org>; Mon, 10 Aug 2026 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSO/pnSam6ocj9nDj/bVuWKKOP64sXXWP9nYsqrj73M=; b=pdXtKPz3ybt6i9
	lIAUrPktw9o93EEnJ1Ewk5GbpO5fdECWCUiuCyh4FPHeS/du9NVtbRTtTiwY5XHaef/0Axu58+Hy7
	yBekJ3zR7chk6dDhneoIu6K7E+mzO3Ozk09sKAKq/QfnSZb8eJ8rCGHuERsWyGMpbKwVSyKodLNTE
	PQvH925+adbkcCqWNnSECWmm2CA1Lat0vU4+SCke8syvbCujqP1zgPjunskqmHJHRquUFguvQTYmb
	DeaQMr9+1pSIm7fVTS2bGf0mrAMsKAf7Jg++Lpd+ZebkcRuKhfpgb37HWIahmCRfwHBWuW+bv/IUe
	PtO1Psj491NQKscG4mew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPsj-0000000Bt8E-0SAO;
	Mon, 10 Aug 2026 13:17:33 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPsg-0000000Bt70-2qZz
	for opensbi@lists.infradead.org;
	Mon, 10 Aug 2026 13:17:31 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1250075a91.3
        for <opensbi@lists.infradead.org>; Mon, 10 Aug 2026 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786367849; x=1786972649; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eIoD6YTmlrIe4m9C0PBaLycOv9pmj/LfM4eubuXCy2Q=;
        b=VwWMNbe7LQkQ6q38mgVhI35P9d1Gh+E9mxmXgfNWANVd2WxqjX1ckPN1f/MADyauSn
         9kNpDBmwYHhFv9wQZeDeebFR1AOqdDt3vJ80/Jd3qOvcDnyGANK4+f67sh5Cr0M1b4iu
         4U8YkWzSXDIWuhirUvF4+Kah3ti+usa6ZrCQk/RNFWcC4uera6r7ZFh+ze23OW89LTl5
         Qst+fNsTxdHtWLn0TRReY3F7d2lRWZ/B1ygdQDjz2VZOS5k8qDp73Cgg8oVTZjyK0ySP
         jw1IaR1tU8KeivRssTxRwzBhA0CYfMhahZI/ELMDhtCCB/cBkh+0PAOSDXMzWoBF2rGh
         bD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367849; x=1786972649;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIoD6YTmlrIe4m9C0PBaLycOv9pmj/LfM4eubuXCy2Q=;
        b=AuJrzz15dcaH/yFTHbfOc6hjVFW8ngSue07AzZ7x1CiebbU5aHmIMnzRDf2hjgNRAH
         +lra5e9OIGHvWkSeBryS5CIDOzA4xwsfKAuHheGFbo55jgbuIiP1vu+oudCkaLTK6zSe
         QSQEZcWHiPJrBi7bj2DIEDX3poc4vr6Yz8h0U20WQmB2hGjHBat6MUKOzYUS9hxuIjlz
         tR/dUxn1aPlkdO6WM25Q3xUl9WJExUsPp/iBupZM7Ca5h+xpj7tkWmX65/jk/Ne6NuUV
         6qKVZSXaIDIXVouQFQ97TxTo/glePDvtEc/BqJRdF6HpACnD3XCgjjbJ3TtXWMfSibKS
         jAbQ==
X-Gm-Message-State: AOJu0YwkLYyn/wQ2wYsQAKZPDabeUmHuu2pFZWf+ncGi0e8tQl2gBuND
	Jr/DiyUhYIW55D8xuTzojfKxZL0dlFueUeiK6j/6/Y8ouFP6E0mQWF74aE4+vWsJGUg=
X-Gm-Gg: AR+sD107GntU1UTU+BRrY1tKFHnoj0yCJ1HMhT+yqdoX9KeEi6QHtJGwsl8ltkqqMgw
	UF5YcmfbEgZIAu3mCubFlLBHYnKdBmhdp3I6C+BX5j3VB/29j8ZHnFhSFtY3MQvj+elaIMvaXOo
	Cl+J93BB0QMW5Q2pLyMkVPE9IAPtVgejumf+kk77saiTqb5fQ3igdfOEFwobQXbRhCHeQTONsvP
	jRFF7uvNLo3LStkfJxp5OQSecqkCxBeXxFHOXJc445oGE9X8oQlmQFdA/2izXb+tuC3YRWfzLbc
	6+B3QzwaE9TxDUk7Ts2QpqO1FbxSCU6+/dXQgkn5oMwKyoI8h+OJcCA/+nyZBAE1/2HWeXe9Uv+
	LUfkxmTh7ekF8SByBltSfLdEaHpAuNWhgvl+yJ61BKcUNjv4liwT92UDHxyM4Z6u3AF8gcdA5as
	GqceHn/bA542297muOKo0iNn8w6F62Zzq//AWA0F1qfS2L3e46YFvjbD5x58w=
X-Received: by 2002:a17:90b:2dc5:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-3909d79f314mr33392505a91.4.1786367849084;
        Mon, 10 Aug 2026 06:17:29 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd957cesm12907590a91.6.2026.08.10.06.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:17:28 -0700 (PDT)
Date: Mon, 10 Aug 2026 21:17:22 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	anup.patel@qti.qualcomm.com, anuppate@qti.qualcomm.com,
	anup@brainfault.org, dhaval@rivosinc.com, jim.shu@sifive.com,
	zong.li@sifive.com
Subject: Re: [PATCH v2 0/4] Add WorldGuard support with wgchecker2
Message-ID: <annPYjSvMVMlG7hn@plin-1878>
References: <20260725023821.3795618-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260725023821.3795618-1-raymondmaoca@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_061730_754179_A55DA7DC 
X-CRM114-Status: UNSURE (   6.72  )
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

Hi All,

As discussed with Raymond today, the ISA part of this
series will be addressed in my next version of
[RFC,00/12] Add RISC-V Worlds ISA support to OpenSBI [1]
series, and wgChecker driver will also need to align with
the new version of DT bindings.

Given these changes, let's skip reviewing this series for now.

Thanks,
Peter Lin

[1] https://patchwork.ozlabs.org/project/opensbi/cover/20260626101433.3133466-1-peter.lin@sifive.com/

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
