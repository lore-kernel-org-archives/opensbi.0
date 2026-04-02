Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90006D6AAF5
	for <opensbi@archiver.kernel.org>; Thu,  2 Apr 2026 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWD5rwKklXT1FuYz4kKdskPY4+AFf5ZhtRGMpihKZVY=; b=FOMYKr/h1quqzi
	VsuEY4f/Ypo7t/BqVe7QOtxshpMfwYe39An1W4ZSLFmN6FjC561lb9kuzrZwHqDozGKX5xbHzINBF
	iSxKfNbHUR2Xgnou0q2xSBTofeVrygMnLqyUPJM7jNU8HL15BNWF0tyn8p0VuzAM6AFk5QVBdy7i7
	UxrfBdVlcwmD7j2ZTBa8ADFbE9sqpTgyS5MzJJRNULvP31Ki/2iUChkhRklu0dwgGIakBm202TIFj
	KyETRCKwxTQT19pn3eGslORX9X2mLP02EdSCUXclSx17fbEAKNL/gPijh323s8YQ91knBc8UW60j+
	0JDWqQtQ2ZRnnBvBwaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LfX-00000000aOV-1LMA;
	Thu, 02 Apr 2026 17:17:23 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LfU-00000000aO3-2iBf
	for opensbi@lists.infradead.org;
	Thu, 02 Apr 2026 17:17:21 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2c3d815778eso96054eec.1
        for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1775150240; x=1775755040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=palrSEJsW3UE2Iu9xgxbhko1owq+UYeh8RCu8qzZh58=;
        b=I7szkuqSmJgxl1uLQFkq+sPfkoJTsLiDVLf6Epgij8p+lRAwEZ9pxj0VuTwL6mi8Ou
         xrr54qzUNadBo699WbHxkVQq8Y88rDNOtWsSHUtkfy78PIOFjw7D4pytfRbgAs9wU1Yw
         VacVwLqlzKhdLARnRVfNwri6INb4FWk/CqiZ5r1wFNMgVoaXXAXtAlw41kNyGSrBOPts
         Qt9Cq4xbogSVK8U+hydCcbwJS82dftzeFTe/x3/jNLEXjVG0WtrP8hoEsycL7bueNmMh
         8KzYShqduStjNfcupRdGVZ8ZH+I43umN5TfGZxYP7pZGFeSwTmyaomQvOIQHccnvYjdI
         lD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775150240; x=1775755040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=palrSEJsW3UE2Iu9xgxbhko1owq+UYeh8RCu8qzZh58=;
        b=PTj5RTkNEzbSxny01pM0SEUQLi0jbOCBV42B22+VoGPGGZuToyJG9CM67oP/XBnRg8
         FLHpj+f+EtReLTGPFJvSTdSl6PL0rJuRzfkpSNM9LZT+cVos00+1UXesnl/OcGq3Bo53
         +sauBc2VKDjcxvrODllPp7R3qRhiZLkJAsP9w4cxAMHCXf9JGI+QJA/nXN3zUkentkaZ
         cIsS9CMuUyEbygvS9QyeCR3FmFdHolnQ6go7dZGTtIkg11Mq950ACVdZMdVn9qLI1lGf
         I+myk1cuI19F3/uie0ow8OxxfXEmPIiN0uW3uA6PHROUhdieRYG2rATUmUZXtf803cEf
         N7Lw==
X-Gm-Message-State: AOJu0YzJatIVfdbqAWnTulVF2LH3VIWKuVDwtPnNt+YDrXiHCz0d6nxA
	cchOBpvo41CUKM5IPke90+4Q4Xd6hsifutSN3MHHO2Sbz35KOeCphqyy7J3KmBiB4Zn92a9cc69
	sfNa2uuo=
X-Gm-Gg: AeBDiesmKQKmFAp4COcIZ5vDyd3nxgpDkwnLXdXGJihJSLZ0cD9oh2f8Ncj+7QwCaL7
	GPJUDN+ubbMMwbPZdnByBD+MrRhKRCDruM3ScaqmQN7uLAjqkmdOlR328gXpon5NnEAzXq2YhEl
	WXsEqwnOqFOv+IXOuY0Ie7O0MD73xBKgoGxHn/oaOTxZL6FfMfelflLFzpVJMavX4/OiinM/qR+
	OYwUwxUi7HMlMWEndCEEcy8bcd61bHUcd37SocGcukvK9Y5Tqq+z9bzoQ3fRy+U5m+s4MG/9yQ6
	ZVtliUvmPgikO/fVKh4YOpWTF+ksqINmaRYVqHrzKO8TPIj5Zztz6xgU8VPydi3k+ZECVpOFl4o
	YMBgM3buD3bPHs0cAPDotmrog8UAK83vtBhbSPUgsVLtnvQj2cx5WLJRP9Sr+dHULINHBbhgU9i
	EddE8mTZmA+tujuzvHswD/oct9GXAeukP5eB7y9d3NQq0a5ZnR8g==
X-Received: by 2002:a05:7301:7c12:b0:2c4:acef:291a with SMTP id 5a478bee46e88-2c9325af281mr1972057eec.4.1775150239545;
        Thu, 02 Apr 2026 10:17:19 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca792f3f54sm2808687eec.7.2026.04.02.10.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:17:19 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: evvoevod@tenstorrent.com,
	zong.li@sifive.com,
	nick.hu@sifive.com,
	samuel.holland@sifive.com,
	yongxuan.wang@sifive.com,
	anup@brainfault.org,
	rkrcmar@qti.qualcomm.com,
	atishp@rivosinc.com,
	npiggin@gmail.com
Subject: Re: [PATCH 0/7] Add RISC-V Smrnmi extension support
Date: Thu,  2 Apr 2026 17:17:13 +0000
Message-ID: <20260402171713.143368-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_101720_684883_191B378C 
X-CRM114-Status: UNSURE (   5.92  )
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

In order to make it move faster, would it be more convenient if I send
a patch set which doesn't depend on Tenstorrent platform and only has
generic part of the Smrnmi support? Tenstorrent platform part can be
submitted later as a separate patch set.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
