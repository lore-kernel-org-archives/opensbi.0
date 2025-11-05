Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8CDCCFA0D
	for <opensbi@archiver.kernel.org>; Wed,  5 Nov 2025 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rB1biKn3hFxymPgUpgHjmM/OhcXv4cxkMb0mwCkRQJM=; b=VVOlb+eOa2upkX
	X+g0wbLkjXHyrCXyAk8HKohbrg1WAW7AQ0Clo6O82bkSYJRBTOBlbpvyt7CEEA2wXvNvjP0RSGBY+
	5B/GL/ZFpFc74XGCp4vy10aUeq8Mg1VeZxULM5puzLyJiEG5n9sqCZTY2W4jA5d3lmH5mPN5juM/9
	/wZL7SHvzTBIHvtH96eGEaSNuZYhtDt9RXvAtcN0e5rKD9etWI4INL8KPPTUxP1BAdf0UeshRC0CU
	6cqH3c0JxjmVQI6irm15XxC8ddRc1/jSWrb/23D1bd7ZbGh1S2yedFo/pL3Uvg9OMCkf62PoEELwT
	JsoIPKLtNyasxIwWTSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg4I-0000000E1kX-0sjL;
	Wed, 05 Nov 2025 16:09:06 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGg4F-0000000E1k4-1tT7
	for opensbi@lists.infradead.org;
	Wed, 05 Nov 2025 16:09:04 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-43321629a25so44057745ab.3
        for <opensbi@lists.infradead.org>; Wed, 05 Nov 2025 08:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762358942; x=1762963742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7EPy87Dc3HfGF4IEcZ/irG3JdjwaIMaMIxlKGFbj7E=;
        b=KvjBJZHU2uBomi8h6DwTUIfynEV0q1qBQH28h+xP0KZ9Sz+GylIpmZlWu5a2bcNXQH
         Dx06oKqTHf1eHjc0TVIbNSF7ZdgqMzU2sKamnJ9Du6v8MZleO3JZ5j3BZ6Lq26Zyeyqf
         Mr6ZzlVstxQMnsNuXzJZpIctAo3R5Hm739Rqb1Y+gkWnRTe3SC/gY+61kF9DqQNJ4cxP
         NZxbjFJiizWa9CPj6QiaYCQQSDqzZVyMXUk+9nDO9wBVK+D19rW8J5ZldsbapfPIe6cL
         8U16jjbpD4JDZEW1xgyLMqyoQpPFEXyHJ0GeMWzhVD0HweURXxlCf48IxGh3cdapQBLz
         Q93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358942; x=1762963742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7EPy87Dc3HfGF4IEcZ/irG3JdjwaIMaMIxlKGFbj7E=;
        b=p7ZfP/cPZn92qf4eOXHT0ruoMQ9Am7khpPDduldo38/eLlrJOGZgwCu9EtQc8OwlGp
         NETpNBnEfvn6EGaxR6ExZmaMoT+j/ARLBJPCZakOrcMNX0DPFO+4ET8wHY9G7aLkY8Lv
         2lAaU5/Cu+C2TN4+Dvt1Y3OnHlh7JRmEDE2jnFX27D/Wf77Vp6oCPBBjE1aI09Wm9boj
         CqRLShaY0BJyKgvHHgaWOqstU5y0uqkyAXBmeznrmGOe4hOSrbHcruxX6CHBbYsiuvzJ
         GhXsn0ZJpUMD2ToD7mms9r7X7litG9sifk2xa1tYJOg1WVMDqid3u5jL3TArEQ98T+og
         m5IQ==
X-Gm-Message-State: AOJu0Yz47/Qkl16e32/dpuKrcXsUdU23TKCAI0uN3Z+qamLkFp+X1/6P
	j78GXiFcqS4bICSS2KsO7X4st0LSSHlD8doI2kd81JrbudT+ri9jz7udFe0IQwlEX3CYzq2lQnJ
	Ein0yr0tBVOwvoYb4SwwZg8cSa29pcBFM2Ws9aJ2Idw==
X-Gm-Gg: ASbGnctMRGHcgklGtOpmSB/64++pLgYB2XJH+LbYm9GeG/O1o8KXlwUw1anBcmcQ1iv
	nfaIqLpT1B9Cjbf4uNbAV7xkGi2V5Va8d4qQY2En4ivpWmtFuQYXSXm/tuhfjpsYFJGq4XxE0Ou
	MaR5eTgU+5gHGGopd7Magg2eMbr+QXkVBoPWYF58o2XvMMaqRLcFT0T1OZ0Y6OxsU2JULsmLU+3
	BGR1/PiAjeVLd3YBn5en70sifHRElwQzodqHGdfYJYujbMURo+BK5HNbjc41quCXDE831Eu
X-Google-Smtp-Source: AGHT+IErYucTSMEwvS6tuAjI0RFrwYLsE8+23IyFnijcgfUb1ciEMEuKIPILVcTPqUloFfDD9BA33+3OccWhIT378Eg=
X-Received: by 2002:a05:6e02:2486:b0:433:2d93:5a36 with SMTP id
 e9e14a558f8ab-433407d4ce3mr57445845ab.26.1762358942415; Wed, 05 Nov 2025
 08:09:02 -0800 (PST)
MIME-Version: 1.0
References: <20251027-p8700-aclint-v2-0-f10cbfb66e92@bootlin.com> <20251027-p8700-aclint-v2-1-f10cbfb66e92@bootlin.com>
In-Reply-To: <20251027-p8700-aclint-v2-1-f10cbfb66e92@bootlin.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 5 Nov 2025 21:38:51 +0530
X-Gm-Features: AWmQ_bmM6egXa6r3teiHqrCYeTjqpc1cCE-FiEI64e1eB2opKgdc9Mp6uA4-qR0
Message-ID: <CAAhSdy35C86_Ub+77yC0AQi7WGYfoT4iNQVTWfGXzEqmwEiE8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] lib: utils/ipi: mswi: add MIPS P8700 compatible
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: opensbi@lists.infradead.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_080903_496676_98EA65A8 
X-CRM114-Status: GOOD (  15.12  )
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

T24gTW9uLCBPY3QgMjcsIDIwMjUgYXQgNjo0MuKAr1BNIEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5t
b25pbkBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBUaGUgTVNXSSBwcmVzZW50IGluIHRoZSBNSVBT
IFA4NzAwIGlzIGNvbXBsaWFudCB3aXRoIHRoZSBBQ0xJTlQKPiBzcGVjaWZpY2F0aW9uLCBzbyBh
ZGQgYSBkZWRpY2F0ZWQgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGl0Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29tPgoKTEdUTS4KClJldmll
d2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBh
dGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGxp
Yi91dGlscy9pcGkvZmR0X2lwaV9tc3dpLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL2lwaS9mZHRfaXBpX21zd2kuYyBi
L2xpYi91dGlscy9pcGkvZmR0X2lwaV9tc3dpLmMKPiBpbmRleCAyMGY2ZmJjLi42ZDhmNmJmIDEw
MDY0NAo+IC0tLSBhL2xpYi91dGlscy9pcGkvZmR0X2lwaV9tc3dpLmMKPiArKysgYi9saWIvdXRp
bHMvaXBpL2ZkdF9pcGlfbXN3aS5jCj4gQEAgLTU3LDYgKzU3LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBmZHRfbWF0Y2ggaXBpX21zd2lfbWF0Y2hbXSA9IHsKPiAgICAgICAgIHsgLmNvbXBhdGli
bGUgPSAic2lmaXZlLGNsaW50MCIsIC5kYXRhID0gJmNsaW50X29mZnNldCB9LAo+ICAgICAgICAg
eyAuY29tcGF0aWJsZSA9ICJ0aGVhZCxjOTAwLWNsaW50IiwgLmRhdGEgPSAmY2xpbnRfb2Zmc2V0
IH0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gInRoZWFkLGM5MDAtYWNsaW50LW1zd2kiIH0s
Cj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1pcHMscDg3MDAtYWNsaW50LW1zd2kiIH0sCj4g
ICAgICAgICB7IC5jb21wYXRpYmxlID0gInJpc2N2LGFjbGludC1tc3dpIiB9LAo+ICAgICAgICAg
eyB9LAo+ICB9Owo+Cj4gLS0KPiAyLjUxLjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlz
dAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
