Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1D110BA421
	for <opensbi@archiver.kernel.org>; Fri, 27 Mar 2026 03:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDB93RO4i3fRNBUWXDo+h+s1AufneVZpvsyEy3ZRlQg=; b=tGDskxC3SE8K26
	C4Em3cCUu+Y0rnFqe6HOpBWbUKJgqQi67HPTn8BwmUKqSLBoQ23qq6BubNkypXi9wpAkld5ULHCr5
	Sjutt17hLeDABstH6FIjX+lWOKthYD+jp5wz4O0a/nXho2kq2U+k6N6RxJb56y1l2jMtk/RpwNNy5
	OqHOc5xUgivr7LBGj6ev3XrNgS7E0/sMKlKLoNnxfi8R/9VBtZzX8yhetIcNWkfqlXRmUBxLXIN0o
	pteKDLmxnvbfTzGOzkz1Pk186SDoydP6sU40B4d16AmQUC9/YlMJi6XgrVGvEcBhi2+0+utYMiv2T
	2KQp8V8HdXtbu4h/HYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5yBS-00000006dFA-34c2;
	Fri, 27 Mar 2026 03:48:30 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5yBQ-00000006dEm-12Q2
	for opensbi@lists.infradead.org;
	Fri, 27 Mar 2026 03:48:29 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3597822d6d8so368552a91.3
        for <opensbi@lists.infradead.org>; Thu, 26 Mar 2026 20:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774583306; x=1775188106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6fEDdpVoC2YtFQ6I42mdeyKh3OoyEH0MmMs63UvJOQ=;
        b=VLqx28IA/T2g0mgUhYPJ3NML/LESExR8NVZ15euEOUufh4YDPAUDDy9AnF4W6yqWD8
         TDEmTQkuW4cJ5/n2qJy5bq7FqRVRraCnr07DusT3GJWiCDyPjLxsngx4WsW65iKgcMFK
         f6LWsbGfRmYuyz+5hlfY7mjKFBjKKr32wRE9cAsj9ep/dPh6L6JiAy0CY0zpAxRrjKdt
         6GwYF5xETWuitZlcK5JK/kQ5tnSACXxl8M04SFAoqDsJ/iRAxjjIL67dQ/+dYfj9/Q/Z
         LknRsGr6jMGv74/AvpJkhEBkpP1y8Jk/uWFpVODfm5fbPMwbMPC9EAIFgpy4HG6TORpY
         5HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774583306; x=1775188106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j6fEDdpVoC2YtFQ6I42mdeyKh3OoyEH0MmMs63UvJOQ=;
        b=poDafChXiemsFdfW2WbbEeq79pKB8xJrS1e7dZnxfR9rQaLjUBAtjzmKidZdb37Taw
         hDlmgYJMZOlk0Y5VNI/5AU33bgrGsEIwxRitLK4ip4xRKwSjQ4OQ+teb5b1qhGXN54CN
         0+L0xM7Ku0qHpY2YN0vvg7zd8atLYrroz2DRpxT0vjxs5FTy57fmPTlAImMe9jbS92UK
         a2ou8gUVZBV99rlySvaIx2k3nQd2rD/FQj90v1L/eXrloOkh6p6g+jZaJY5MOe6BxAkY
         LjkG+8uKK2ogZbCmBzBRSlfVN+GUajHT3xpTAR7+4zAAD9MmXQHU9PTUoqHVrkTyBZKd
         GTYQ==
X-Gm-Message-State: AOJu0YzLmwFTtUdyTbIOgVbcjtmR9IJ3Y8BTbBs01B3Z9lYBwxhoB+tt
	NxB2Mv3sQxsTgt7oetT4gPSAqMkDUc0+Y9Z2aPfTB9LiHHeO31y4c7n7Xzn34qwl
X-Gm-Gg: ATEYQzxCZYv/BbDZRr5mOGsPOLGtFWRhrD0QUH70kzF31JkoP3HfAuFYj0aCtWT7k2g
	qCuLBLzK58y3RL4oZZOYQlNztMhPBzF35E6mugjG5wTXizthiqw40onlfR61mRKOFdA5dFbIZir
	kqTZhDvMbZ9XC0KI74rmcEGKJoR0hd/V9K0pIugeFJlvcb3UCVyQx0ITHN903ebYp16dYf18XRJ
	CDHyzO3DEPaJNjiIROI+OzYe9hir2MziwfN93e9RDQ5J76139xGiGTTyM1xHBIurVvbmzhtUq0v
	4+uic99qN+/PzZ2VRAHXHHmoUJHaojwoiw4bNz1lghIYCc+0eczdFjNTboFn/yDCYKyWu+LBvP7
	dgrZf7zkWAXGc6lC8LHmBM4USwwIBjDu0StkvmhsHv2EM+RNTvXEb+eC7p4ZtLJzjUIT8EPusnZ
	gyrSyPwJreXzLbxpzEAxi0trnQuWdE8AE6rjZV5neu0vQR3cVhFOU=
X-Received: by 2002:a17:90b:3fcb:b0:359:8988:38c2 with SMTP id 98e67ed59e1d1-35c2ffa9732mr710840a91.2.1774583306332;
        Thu, 26 Mar 2026 20:48:26 -0700 (PDT)
Received: from localhost.localdomain ([150.91.169.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2db0a951sm355721a91.5.2026.03.26.20.48.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Mar 2026 20:48:25 -0700 (PDT)
From: Takumi Hara <takumihara1226@gmail.com>
To: opensbi@lists.infradead.org
Cc: rahul@summations.net,
	anup@brainfault.org
Subject: Re: [PATCH] lib: sbi_domain: reject overflowing address range in check_addr_range()
Date: Fri, 27 Mar 2026 12:48:22 +0900
Message-ID: <20260327034822.39371-1-takumihara1226@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CABdD5xnMzGjyF_ssKBED_0c4=aByL8tkMGdTcRXKoivAPGitDQ@mail.gmail.com>
References: <20260319132232.51572-1-takumihara1226@gmail.com> <CABdD5xnMzGjyF_ssKBED_0c4=aByL8tkMGdTcRXKoivAPGitDQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_204828_289005_F02A362B 
X-CRM114-Status: UNSURE (   6.30  )
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

Thanks for the review, Rahul.

When size == 0, max == addr, so the overflow guard is skipped
(it's not an overflow), and the while(addr < max) loop is also
skipped since addr == max. The function returns true.

This is the existing behavior and is intentional -- a zero-length
range has no bytes to validate, so returning true is correct.

This patch only targets the overflow case where a non-zero size
wraps max around to <= addr, which silently skips all permission
checks on a range that actually covers memory.

Best regards,
Takumi Hara

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
