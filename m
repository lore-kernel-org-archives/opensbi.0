Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E22CCF9E0
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3dAei6jvSy8CWTdfRNWQnD8DiehewaG/f1fEqTq1zN8=; b=41opBbcU01jW0N
	fgIcAx5oI2prhz9pdIMMrk/gayTmeY/Tzqrv+BDYWrA6QIxReR3qu+AwyHq+k/fqNNfTnPT/9dDwl
	iERJWBBW4C+kccRETlafNQ9G0bJd9dPQxnHPD//bAjQKVgaWqegJ9ZditcndmRFa3eBGiye1cspO8
	d4Arf0MhZxVTpPBXGMt8zhPTT+q48D37+MKlVLjmNmRoGLw77qHGo+l/aewMHeRLWeqBu7GIRr/CD
	YF+0WDEONSuPrWFjQTqUjhoNpAnnWIlZqQSTGpPa7nw367ky4K/WZuFs6FX8MT/rK2Tnw+6orViPZ
	Ya6YuuQkciEAG3rk0U8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLFk-0000000DktI-1JUN;
	Mon, 27 Oct 2025 11:19:08 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLFh-0000000DksO-3KkF
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 11:19:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-427054641f0so676294f8f.1
        for <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 04:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761563944; x=1762168744; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aiqi4gVPGlFgcDfAJROwdS/c3VD6CVv164S51ELSWkw=;
        b=Ye4sxaqYBSFv5OV69NQK8SBvWDlyeUsO/rcVPZvvhC6U0LPF6tnRZYVYkf0jcCPe5r
         bYsdwwpX1zgPuXHuSf3c8BYpBHyAk8g2nj+SSY/ftDTl4qzk8q9RXSnddF3uvHTsL3dQ
         tQu8UGb2jbzuf0BYsSMXa6qqvuf2vivuh+BokWDqlxvm3uoAvl42rkm3ckzFjTtrURUw
         Aapy0DzRyYKecYrNt0RkslXvpgFfkfLqa/KVSLEOfR3wvaBfQTDt4/9T+ucRNmdxBE+O
         q+RH3Ni2roedTRUxDYbTHY0/pFLdfOuktkjHjIULCY+5ihevot/1ds/0tqrH0DUutcmH
         4QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761563944; x=1762168744;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aiqi4gVPGlFgcDfAJROwdS/c3VD6CVv164S51ELSWkw=;
        b=GaPxNXgaYpBOPOrDOgsHGTlhpSmfLWy0lRPG5U3hQ7eIPbiIPZRgUzTNDy8rbYEl1x
         IC3cD94A0BETrb9iUHNhZZ7eO1jL1zpy/NQSMwupfZqD5sa3J7aK2KPoV8YNlCrUQFbf
         r5kZUitN9MmlHtov4bYoPWtn5TiVjuBNgNbAB06DNoMI/MY20T5/uy5A9LnUULdEHNRQ
         b5fObOhRevNrQo8CV5EzzERQj8QvCprFyIWMNoZdCyegOxgkylAseEUlJu7wj3vfzJFs
         OD9ulTdvamLIfOTWHtplyg+9SE/8WeEyyFRKrEuP8kKLLdHHhusNbALP2ZtrrWo84Fc6
         uANw==
X-Forwarded-Encrypted: i=1; AJvYcCUjtJ7fJ42cFjXRAj7I6iQ2hW4EC1vRGOgw0pMjFKOjqLqIhAfTrFGXmorKY4MZrbMWyg17GoIc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz+qI/ldy31zFcSljLHdfRih8Yaa+u/CIGoNFCueX3cQHnusxW
	1JsGCIxsNIQrQxo2qB+RiChS5x71jb9UK3+JYEVHfn29LAfTW770mLmLbk2usVvUSFQ=
X-Gm-Gg: ASbGncvvJXfRovEKXC6UGnYeQmkoI1W8ViW/fKnWIO1rF93m3G6HlLuP5dh1nw665KT
	2u7g2PMuzA2g3ExS8GFts/TU4zNwB38W72/ErPLplSyWVl7xUoLR87MxQzYPa8yvlwA3LCZXJ2G
	9kdKsFhTY5oWNsHhCVIvs1nj3d0JTrnC2t2rnOIypl5u2U5l36CmUru2MKLZ91CGrsuTfCsnclP
	TI3GzOMJTmRVA3QmmQOzrPXb7yaEtW2FQn1vvQ8MXkcP+fyKBJwF9rTaNoww4E9Ws9gUCsY5Ajm
	bh4llppGwqNG73YrL/H8c7f/d6/qkEapIt0BWDEy2VOab0FFHG0DYNAtw253SXG11U4zEhG+U50
	fg3YBvtmm1L1gj0A6u0hZZmEWecSqms5TC4jnQftGRl7gVkWQMmtlSKj4nrZhN4d4
X-Google-Smtp-Source: AGHT+IEe3pxFv3PmO+sPtSY94pNhOJd84umDiIbeifkDQgij4NwJ0i72mT67IWkt5Y8xsgH1o4nGww==
X-Received: by 2002:a5d:5d86:0:b0:3ec:7ff4:23bf with SMTP id ffacd0b85a97d-4284e56efcamr9340713f8f.9.1761563943479;
        Mon, 27 Oct 2025 04:19:03 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952d5773sm14585726f8f.27.2025.10.27.04.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:19:03 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 27 Oct 2025 12:18:57 +0100
Message-Id: <DDT2AT72ZB16.14KH51T5AMG0J@ventanamicro.com>
Subject: Re: [PATCH 3/5] include: sbi: Make "s8" actually signed.
Cc: "opensbi" <opensbi-bounces@lists.infradead.org>
To: "Benedikt Freisen" <b.freisen@gmx.net>, <opensbi@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251026202416.23550-1-b.freisen@gmx.net>
 <20251026202416.23550-4-b.freisen@gmx.net>
In-Reply-To: <20251026202416.23550-4-b.freisen@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_041905_860510_26696628 
X-CRM114-Status: UNSURE (   4.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

MjAyNS0xMC0yNlQyMToyMTo1NyswMTowMCwgQmVuZWRpa3QgRnJlaXNlbiA8Yi5mcmVpc2VuQGdt
eC5uZXQ+Ogo+IFNpbmNlIHBsYWluICJjaGFyIiBpcyBpbXBsaWNpdGx5IHVuc2lnbmVkIG9uIFJJ
U0MtViwgInM4IiBzaG91bGQgYmUgYW4gYWxpYXMgZm9yICJzaWduZWQgY2hhciIuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBCZW5lZGlrdCBGcmVpc2VuIDxiLmZyZWlzZW5AZ214Lm5ldD4KPiAtLS0KClJl
dmlld2VkLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
