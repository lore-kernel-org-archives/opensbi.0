Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA645C54ED1
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sG8cu8zNGmPG4RXCMSnKRXHwRX7hoMmxZNgWBgaC5A=; b=bDMwaOdNVsnT/4
	zw2zm5CdF/pac+AhfGxsvANW+9Eyszszrv91Gwehsten9D19IGuvzNft+dkc8pftMfQ6+Djhnm8Fu
	0nTWV8x0UbJdsUxizFhdjWHp8//vWJ9b/zMETLycAaSnjy6A+/ccTUvRCBFbZ8npcyIrfgMIal3fw
	AgaV4C4nVsmBpCn/fJIlVIRmWVgROUMTzFatfOUw62Ht/fq/FtUuIB5nBTKCji4A3qMUOTDi7fNbY
	diNPQ9EwcEvQhUgwrv8c6F42R1LOqD44aQ+j9gxny11G5CC2MTMugTLPSDnXiqHXzQrN4R81enUkm
	ZPNPi2GlBOEWpBdhwaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3e3-00000000mQZ-44Lf;
	Thu, 22 May 2025 10:59:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI3c8-00000000m81-29rI
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 10:57:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso3667895e9.2
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 03:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747911446; x=1748516246; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlF/N3unfypiGbRUxTkLuKSNLW8LeuEX5der0dwJnGw=;
        b=Ypwwu5D4D6Vi3NlYLrQ/sPtNMat+/sVS8hAQb2GacCGkuezaV+2BNa1U6gca4liO0Y
         64Gw3a92Q3ud9mu7XwPTEOV5AU/5DY4w3hUwc3ZaoFGkWbkm4SC0Xm45MdVUAM88Y2sy
         SW1VB3jwuDklseix/66uGQkZHvbb+la38G7C8NQL6ME3D557i3vNyOnRMDMbkkQVOWo6
         wGMZwtitm4W7O0lBthvfgkFtAfNIZxdM7nUaPMm34SwoF0pcqK5E00dGnyyJ6aKkxUpR
         PfoOT3LL0Qy/4hMpg+PydQ9ez32Uo3WbsjgKba7P1z2wIcFVsR2iZlrnd5SrBA26ZUpl
         MyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747911446; x=1748516246;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RlF/N3unfypiGbRUxTkLuKSNLW8LeuEX5der0dwJnGw=;
        b=bc+wXdE9K4lF9+GFop6mmxCWc0co1VBPPOjoQURXgUFSiWln7bLOT6l9KDFBU/SnZO
         qsaWIgVnctGhCfesavugcFhg3SZgosfjxS4oeOrSuiiKTvf+J2x9DXC3ySkIkBe5b5Ft
         zfjZ2XJiXrNByTsx+b9nt8ZyGZTunixJUB2tOaFqDGY8G5+e8IL3jeX/IYmgo5HQ3eEE
         tRbt5dq0+1R2ecKJ++8cBUI4reoorueTK6/9xE76hBDNkjvCuZJQ3Eh1W/YV6OXeeyUg
         6ADKmI4omyMQ3RCgU8vZAqj8G6drL+FSmMw5KApQklZi7fDc3w5VOLtfw3YTNGq2dZe+
         7Q9w==
X-Forwarded-Encrypted: i=1; AJvYcCU05ppZRRxQUv3fe6tjNJ6htMoTbZa6cJ3oNJxDbmfeZyyUwH/QHitzXCZVi2C9JUtOyYgj+LwF@lists.infradead.org
X-Gm-Message-State: AOJu0YwubTbYlY/lq8lurUCisBR2rq0ZX/9Cj8O0iBzqgPti/WpJdgD2
	5OqJ7vw1k45OFAFHkh7xRHxYbSzaogMLhsupwl713HhVVtsidAGw83S2liES+Yka/Oj+jtzwjHm
	XDtVJ
X-Gm-Gg: ASbGncu6l5vYDoyI773A+nC5BIp2VARxzrOj8lW2Fkhav/fkGRhhBpNkMOyhufw7vKM
	MtabVassdgMXYij16NA8jBYruOmVtnEz8b1FyAecSGvloE5mUqv9n3gYvNI+Auc5/OztC3k6xEJ
	LxkzpwMkomdjchpjcyx5C46N9Bw9UYJqwPOIcPLZJM5SalPVN34ODr3QSJcw56ZmZftzF1a+sYH
	/mc55P4eqWbId/wRCfSmz85jL9q+/Vlq6S1/87OnULde5aGS4NzB5ZaV3T2k2zUjwSlF+QW0Oaf
	Pjoe0E8vsgs2PwjFYL4KyRD+qlqsIlBkV4745hPhHvlDcboi84HOGDNpm38=
X-Google-Smtp-Source: AGHT+IHCAKCXhsnZ2XlcV0NXtGiVUQCcKyuqZKOvuUniIND8LZJ9KIRu9MYRmkmfSbgi1hJwRW/j0w==
X-Received: by 2002:a05:600c:5305:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-442fda14a10mr87303955e9.4.1747911446474;
        Thu, 22 May 2025 03:57:26 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:9e41:edc7:2f00:1554])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8cf66sm22239944f8f.87.2025.05.22.03.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 03:57:26 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 22 May 2025 12:57:25 +0200
Message-Id: <DA2MW8UOB6FT.27DUWP4PXH5LS@ventanamicro.com>
Subject: Re: [PATCH] lib: sbi: fwft: Use only the provided PMLEN value
Cc: "opensbi" <opensbi-bounces@lists.infradead.org>
To: "Samuel Holland" <samuel.holland@sifive.com>,
 <opensbi@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250522013503.2556053-1-samuel.holland@sifive.com>
In-Reply-To: <20250522013503.2556053-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_035728_560968_7FCA0DEF 
X-CRM114-Status: UNSURE (   5.80  )
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

MjAyNS0wNS0yMVQxODozNDozMy0wNzowMCwgU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5k
QHNpZml2ZS5jb20+Ogo+IEFzIG9mIHJpc2N2LXNiaS1kb2MgY29tbWl0IGM3ZDNkMWY3ZGNhYSAo
ImV4dC1md2Z0OiB1c2UgdGhlIHByb3ZpZGVkCj4gdmFsdWUgaW4gZndmdF9zZXQoUE9JTlRFUl9N
QVNLSU5HX1BNTEVOKSIpLCB0aGUgU0JJIGltcGxlbWVudGF0aW9uIG11c3QKPiB1c2Ugb25seSB0
aGUgcHJvdmlkZWQgUE1MRU4gdmFsdWUgb3IgZWxzZSBmYWlsLiBJdCBtYXkgbm90IGZhbGwgYmFj
ayB0bwo+IGEgbGFyZ2VyIFBNTEVOIHZhbHVlLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhv
bGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCgpJIGRpZG4ndCByZWFsaXpl
IHdlIGFscmVhZHkgaW1wbGVtZW50ZWQgdGhlIG5vbi1yYXRpZmllZCBzcGVjLCB0aGFua3MsCgpS
ZXZpZXdlZC1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Cgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
