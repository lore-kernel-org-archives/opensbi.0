Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF5AFD45F9
	for <opensbi@archiver.kernel.org>; Thu, 26 Feb 2026 00:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qyeBLaDoVpOPr6TJK6LSLFefzIhwmvblw28VtkxCct8=; b=CIKojBlL9/Be8o
	xaNBoMpePb1Upn5l140yIu7f3R9LTLU7JOHe2vWnP/qbU/aAo5eszswLjaXl72IFfOAEpGpErSFaH
	nML16kieR/nDz+0QF/FhPAqPMYPlfi6PNal6m9VS9D83Yvv7hELmJedOIkBNwilQck5dUnhad+nVQ
	dNLwWxcxdU1/1/zIdAmuvy0vDCM7Kl/2u4sTHYGwKBLC3GYdb85hV3f9mH3y9EFTCXtnf7Cuf936j
	jCqff3avKRcKer07hrByYMrFM+lHAqbxosbffSwdZWbDU18egjOAQPLT98rwctuOmEz+0S7l7slSz
	QfiEz4/qdahRpqSJ74eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvPNy-000000059RF-4BtJ;
	Thu, 26 Feb 2026 00:37:47 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvPNw-000000059Qu-1NR4
	for opensbi@lists.infradead.org;
	Thu, 26 Feb 2026 00:37:45 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2b4520f6b32so354117eec.0
        for <opensbi@lists.infradead.org>; Wed, 25 Feb 2026 16:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772066263; x=1772671063; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P/Z66QGpfYR0Ha+oo8GHjF7w99JQVklmHK72cxL7L2U=;
        b=V22IK4+LYGB/Na1LSRqsXVun+jmqIE1vghrno9ixNvIQUB1nNiDgl23NBta3ukKs2H
         4RvNvXLfx7vSLxOEkhrReJTiblvzivoYIxkP4ON2AGPgpqXohIh3O4W2PJ00jP8nDzK/
         gyOjxuM0+BBFocUfZIo3pJUI/zbn9+43dEG2CAZhuXKxTHwwRrLZWu5QAwjSRVuL47x/
         oViYTXWWhuU17y70fG/ZdsObwmsvhkSblx53i6Elk1BI6flF7E5ZHJqxIeO92Xj0/jk6
         iSm1KkHc499aTuof5r1Nl1h6v/9vCyK4O/ovry1of/9nRbBYxDDdRG2La5kI6h27U+sz
         /MtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772066263; x=1772671063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P/Z66QGpfYR0Ha+oo8GHjF7w99JQVklmHK72cxL7L2U=;
        b=HZ9/c2MW/f7CEqDvf6RIvUHDANmxzSsgmTWT5SYlIVfNl0D5y9/nYoOrsuIs3vxjsX
         KElG0YzPKWFBT7RJ0R9BC/4Xrc+jbjruWbIo8WGc0/PTe4QGlHWPJV0QenQmvydN2k5s
         Wcub6PqY6XrTLyDKOM2/BrPAW8c1ghXIxqQRJUAJ7/Bi1XPICc1C42C5CDKT94Acm44p
         OvXVDolJ4E1fDYIdZWXaDO/nB5v/hg1dMSLiYUqH0n7/g/q8x5KJHPpzMlFRyHD5mCbK
         xhaPWIpUJ0mCRsr8F/cwF+Y9a/rcLgPW8xE0lhNY0Bfzm22jr+7WnmrCoI3UWR8S25EQ
         ktOg==
X-Gm-Message-State: AOJu0YwNGTWI2JMiVbTVuD5OJXtkrTWASqctdqPOpmfGmp37RavkZ7tx
	5NWzHc5ezLnj0dWioQik4Bo7Ij07zOVN9neD75MPbZEcdMTI1939owet
X-Gm-Gg: ATEYQzwRsVl9qdkhCPECVfeeci5/z7NLY+1IVesEnApEV4wKPkhBrlB6cVDHAaaDdMg
	xUDmV18yfAWkIdG3nDqxKOZp7wUX2Im0BT++QcUwjO8K5dtTMPjXJN0/y76XGO34nMPucbbrpHA
	AeIN9G5b6e0rKFNs2neTMoWgPyxqjaO+MU2CReP3k8NDV62AolUtMwx0mBuyN+8u9kTbPZdUmCY
	rOKO5df9AOF9XVBxOvuFgBk2WzJOCu1l5rdI/FpUVjsVWnaBoeMAEdrQO13LHqJP4PB3vx52IxF
	+91vdi/wNfPAutUOKFwPdAYwrtYtT+Vfs6zwffem99/jx8LWFWKVb6DEzZgbgm9gQmDvEcHjElg
	uDXbVuDm/gSH2j2YQN83mmxlkUAEas+g+vZ89hiZyKq3o3Trm6zVV7aaEuynFpkpMrT/SZUhoUw
	q8CJh1QTWynH2YL8mNYjR9kHk=
X-Received: by 2002:a05:693c:3018:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2bdd2f316c0mr222853eec.14.1772066263229;
        Wed, 25 Feb 2026 16:37:43 -0800 (PST)
Received: from charlie ([2601:647:6700:64d0::1071])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1bcea4esm526058eec.5.2026.02.25.16.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 16:37:42 -0800 (PST)
Date: Wed, 25 Feb 2026 16:37:40 -0800
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, weidongwd <weidong.wd@bytedance.com>
Subject: Re: [PATCH] lib: sbi: Use SBI_SSE_EVENT_LOCAL_UNKNOWN_NMI with
 unknown interrupts
Message-ID: <20260226003740.GA538838@charlie>
References: <20260217-nmi-v1-1-eb4b4b3ad70e@gmail.com>
 <CA+Ht8=YMejcSnkA+8ODbzD0pUYaDbh0YkmqLmq1FiQEY_R=nBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Ht8=YMejcSnkA+8ODbzD0pUYaDbh0YkmqLmq1FiQEY_R=nBA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_163744_369521_FE43C691 
X-CRM114-Status: GOOD (  14.36  )
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

T24gVGh1LCBGZWIgMTksIDIwMjYgYXQgMTI6MjM6MjNQTSArMDUzMCwgSGltYW5zaHUgQ2hhdWhh
biB3cm90ZToKPiBIaSwKPiAKPiBPbiBXZWQsIEZlYiAxOCwgMjAyNiBhdCA3OjU44oCvQU0gQ2hh
cmxpZSBKZW5raW5zIHZpYSBCNCBSZWxheQo+IDxkZXZudWxsK3RoZWNoYXJsZXNqZW5raW5zLmdt
YWlsLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBDaGFybGllIEplbmtpbnMg
PHRoZWNoYXJsZXNqZW5raW5zQGdtYWlsLmNvbT4KPiA+Cj4gPiBBbiBtY2F1c2Ugb2YgMCBtZWFu
cyAidW5rbm93biBjYXVzZSIgYWNjb3JkaW5nIHRvIHRoZSByaXNjdiBwcml2aWxlZ2VkCj4gPiBz
cGVjLiBXaGVuIHRoaXMgb2NjdXJzLCB0aGUgaW50ZXJydXB0IHNob3VsZCBiZSBmb3J3YXJkZWQg
dG8gUy1tb2RlCj4gPiBzb2Z0d2FyZSB2aWEgU0JJX1NTRV9FVkVOVF9HTE9CQUxfVU5LTk9XTl9O
TUkgaWYgU1NFIGlzIGVuYWJsZWQuCj4gPgo+IAo+IFRoaXMgaXMgYW4gaW5jb3JyZWN0IGludGVy
cHJldGF0aW9uIG9mIHRoZSBzcGVjLiBUaGUgc3BlY2lmaWNhdGlvbiBoYXMKPiAicmVzZXJ2ZWQi
IHRoZSBtY2F1c2UgZXhjZXB0aW9uIGNvZGUgMCBvZiBpbnRlcnJ1cHRzLgo+IElNSE8sIGEgcmVz
ZXJ2ZWQgaW50ZXJydXB0LCBpZiBvY2N1cnMsIHNob3VsZG4ndCBiZSBmb3J3YXJkZWQgdG8KPiBz
dXBlcnZpc29yIHNvZnR3YXJlLgoKWWVhaCB0aGF0IHdhcyBhIG1pc2luZm9ybWVkIGludGVycHJl
dGF0aW9uLCB0aGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2suCgotIENoYXJsaWUKCj4gCj4gUmVn
YXJkcwo+IEhpbWFuc2h1Cj4gCj4gLS0gCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
