Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49174C43602
	for <opensbi@archiver.kernel.org>; Thu,  2 Jul 2026 15:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4mxFpXqm0hFrcyQrSC/9TuIgE1UPQyk03iBgurlYoQ=; b=ccJSfV0mM9c96l
	Z1HIVInVcaKLYdJ5yDSAsaINVpMZ+qG/m6Non+6ILA4zYM02ad101rVx8pMdunALw4Kv2/+O/kIM9
	eLANvjmwzCZK58ZHgNbqt5ctPdTs5b01byYFBlnm2+7Wxcj1QGvvFHZJVAbu0WccPWeAnkE2h48TD
	a5EqZYWR2HADxqppsYzmQiVxUniHqma9cPyOVzx/R3q+Lm/qABaRCFPR/GjNOmujAXx7NeP6L8bvi
	cpg+3A/kyzO4I7Z1xEVNq7nQJOutZBqm5RjC6n4bYC+9r3f6iWZ0JVvx1do2np4Mug+2l3ZtnS1DE
	sW2Ys2Gn5MYi+zlox9QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ5k-00000004lpY-1W3f;
	Thu, 02 Jul 2026 15:12:40 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ5i-00000004lo0-0Kgf
	for opensbi@lists.infradead.org;
	Thu, 02 Jul 2026 15:12:39 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-809b19a7f25so27532157b3.3
        for <opensbi@lists.infradead.org>; Thu, 02 Jul 2026 08:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783005156; cv=none;
        d=google.com; s=arc-20260327;
        b=N29lGV1A0SReX2DMkI5MZSyXWmMiSzIG+b7nkR402a+kf4x77clB4Liq4F8dbF+0XV
         sHHc8w1vAl5DTXY0m/rxcl+qe5u1v4JAlYFaQ5ILlvu237YdmJpcGQVh0EJl2o1b/Pfh
         9DkWWukKASy2G/Wnm6FhI2WdVn/1+d07fiwAtmn5J1VBFG+al/2EQnJ7e+If+b3rEC5d
         a04StQJdADSvvxB67UjmGywFTxn42cOFd8TeaRfQw40wBARE3Yoxtq9c06eDhwZ/r9Hp
         VdVB5L5oTdFx+u/hWcOp98bW/suwzg0ZdR0p6Croa62sMe0PjnU39kT1Q3QF2lDylb+b
         SrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=55VKZ1Jn1fpCsphTCJyVkEfaamZ9LCEdgpN8arnfRzU=;
        fh=ptzNB7g9a30gS3iMdXy8hchchj5+04tEpHu43QD535Q=;
        b=cFUVxF79C/ASmNz5LKSybHaqREfxGIzyZ8WywqDq4bsFdMvp/E7m4dlfE1Dttz82JZ
         jwDbM5yJjkZZ4uPk8uYanHXGcLJyQMHObu1XM7Ahwi6saP9k3ljX1aoME1v7mjCAMHNt
         b1SfX3j5XRQBmbWLZ2VE7TD3VHMZpfxaq+wLdnRq489EJ5CJ6hLk8nV1PDkkHGukWE7d
         MT7fiWhqLFUl3wIt4wdHUBxOQZmTtV5vgpc3smDsKUZcnyMJbtEeqeEz2GJj3EvQB15o
         TIOClWxsbPjixfdvj+bzh6hjWnH73klmwAJSis40qpyaTMWFgfem1vHujrTYXU5HSbII
         YkHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations-net.20251104.gappssmtp.com; s=20251104; t=1783005156; x=1783609956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55VKZ1Jn1fpCsphTCJyVkEfaamZ9LCEdgpN8arnfRzU=;
        b=Iha79XzUGTG5ODB+X0QEIxGvPJcsfkRfGJmdCYi96EJezurwBk12ywJO6mfMQe/6xM
         NcQvqVxgxZ9JffKFt0/Exx5nyWmrseAq0KEXzzDOX+83q1Z7zLV5tSsIKjp2hgMXOc0A
         OMvQo+xRv4z6y3lEX2R/Atq9tbg/IeyMLBGkCv6P+OAR9nKAF+IqFbNdrXu01AimoD9/
         ZgriP6kmxiItTOcP/R/BhCt8ZKTzgCTo3pCPSWv12a0Rs6Nty1T0cYMRyK9H/fC+6b+/
         TQGCKQTgQvwAesXSH6WJ4R4k6ekjeSRbOJrzPxRlfWNfZ/8Z/Aroehyu8H53/FJIZvUf
         7GNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005156; x=1783609956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=55VKZ1Jn1fpCsphTCJyVkEfaamZ9LCEdgpN8arnfRzU=;
        b=Wrnu+haO0nNuKjShzoErbiaYg4apCN+RQ7Gof+VV0b4caQiY1BUr3zl4RjXSkosuVl
         p/b5x3jnnJaNgqpl2ukG7GankChL0NRvZ9zBXUiFxOwxdxBggYDnecqIXafF7wnQmKJ3
         XnrB+ED6PaykJY4gmSpc34qAadUfFTeK30FxrJRQUVnPwo/nzg2RogkHK3qccsISypJx
         S5jWmXdXt/RGnPd/0Y4UvZvQZOTZ9wQa9ffO9bXW3+067sl2kIiPkkG1Pq7AZJ1J7kLY
         B5WJ/+YDtr41UZy0KGQlh4FhENdeERpaIPDk/z90ST/se6Vcu4RjbWYUou+TSmewP4mp
         4hSw==
X-Gm-Message-State: AOJu0YwEmkbq/N7c+rhsTi4T8eyNKUPH+ReBuvyZPmpkKbNC/hDlh4Cr
	RSzxBqoUUGW4qSq8915MPiOH3FF9JpBEiTyyWynie93q2/alkBsEj87U5RY8swiKaVcm/01UYnl
	CJi8m/8iYdOsd33sohMzwytU1NWM4e+VvrVL6vfJOHkvBB6TdiS/AkQ6O
X-Gm-Gg: AfdE7cnwpJKYE9LYZa4hFpNL9kQ16/b2pa/EL2b3g4pTEiJMYZ6QvT3l35/lxTf0GPW
	QCGsRgyexUR6CRDDNv99mmi9JiAYhqHP3yTBDrMIrcvXVCcPh3w+bu+OguefFqygw1uDOob3CRD
	MjeSk6767osxubM66mEzORWO/fUJW4sUHpMQ8xgqIhU7Czi31e/axHiTHY10pN81f0pRq9U/GVq
	/yLwKrJWIbFsUnvCn2QjZg9t98L9QqKLNBgAENLLuMUgvyaWkCg6ZJ1QraLFr1bkzizscb3iRLa
	kH8IuUvSYRmsKF/PP+st8126l6QkRWyhmHX4Oej9qxFXT1uVdOhdumDNBSb+4g==
X-Received: by 2002:a05:690c:c4e2:b0:80c:3848:bdf0 with SMTP id
 00721157ae682-812eb66d839mr65531927b3.49.1783005156130; Thu, 02 Jul 2026
 08:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260628142715.370970-1-liutong@iscas.ac.cn>
In-Reply-To: <20260628142715.370970-1-liutong@iscas.ac.cn>
From: Rahul Pathak <rahul@summations.net>
Date: Thu, 2 Jul 2026 20:42:24 +0530
X-Gm-Features: AVVi8Cc_XPii41PxzLcx2JftNO1M0A2dc-ZbfcawcImPZOeypeQk5hDYc_phVWs
Message-ID: <CABdD5x==izS_hjx49xytTG+LMEiEO8PE25m-AyjmBeoi0RpsOQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_mpxy: fix integer overflow in attribute range endpoint
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_081238_378885_0AD01C6F 
X-CRM114-Status: GOOD (  13.33  )
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

T24gU3VuLCBKdW4gMjgsIDIwMjYgYXQgNzo1N+KAr1BNIGxpdXRvbmcgPGxpdXRvbmdAaXNjYXMu
YWMuY24+IHdyb3RlOgo+Cj4gc2JpX21weHlfcmVhZF9hdHRycygpIGFuZCBzYmlfbXB4eV93cml0
ZV9hdHRycygpIGNvbXB1dGUgdGhlIGF0dHJpYnV0ZQo+IHJhbmdlIGVuZHBvaW50IGFzOgo+Cj4g
ICB1MzIgZW5kX2lkID0gYmFzZV9hdHRyX2lkICsgYXR0cl9jb3VudCAtIDE7Cj4KPiBXaGVuIGJh
c2VfYXR0cl9pZCBpcyBjbG9zZSB0byBVSU5UMzJfTUFYIChlLmcuIDB4RkZGRkZGRkYgd2l0aAo+
IGF0dHJfY291bnQ9MikgdGhlIGFkZGl0aW9uIHdyYXBzIGFyb3VuZCB0byBhIHNtYWxsIHZhbHVl
LiBUaGUKPiBzdWJzZXF1ZW50IHJhbmdlIGNoZWNrIGZvciB0aGUgbWVzc2FnZSBwcm90b2NvbCBw
YXRoIGNvbXBhcmVzCj4gZW5kX2lkID4gU0JJX01QWFlfQVRUUl9NU0dQUk9UT19BVFRSX0VORCAo
MHhGRkZGRkZGRiksIHdoaWNoIGlzCj4gYWx3YXlzIGZhbHNlIGZvciBhIHUzMiB2YXJpYWJsZSBh
bmQgdGhlcmVmb3JlIGRlYWQgY29kZS4KPgo+IFRoZSB3cmFwcGVkIGVuZF9pZCB0aGVuIHBhc3Nl
cyB0aHJvdWdoIHRvIHRoZSBSUE1JIG1haWxib3ggcmVhZAo+IGNhbGxiYWNrLCB3aGVyZSBhdHRy
X2lkMmluZGV4KCkgY29tcHV0ZXMgYSBsYXJnZSBpbmRleAo+IChiYXNlX2F0dHJfaWQgLSAweDgw
MDAwMDAwKSwgY2F1c2luZyBhbiBvdXQtb2YtYm91bmRzIHJlYWQgZnJvbQo+IE0tbW9kZSBtZW1v
cnkgaW50byBTLW1vZGUgc2hhcmVkIG1lbW9yeS4KPgo+IEZpeCBieSB3aWRlbmluZyBlbmRfaWQg
dG8gdTY0IGJlZm9yZSB0aGUgYXJpdGhtZXRpYywgY29uc2lzdGVudCB3aXRoCj4gdGhlIGFwcHJv
YWNoIHVzZWQgaW4gc2JpX3NzZV9hdHRyX2NoZWNrKCkuIEFwcGx5IHRoZSBzYW1lIGZpeCB0byB0
aGUKPiBSUE1JIG1haWxib3ggY2FsbGJhY2tzIGZvciBkZWZlbnNlIGluIGRlcHRoLgo+Cj4gU2ln
bmVkLW9mZi1ieTogbGl1dG9uZyA8bGl1dG9uZ0Bpc2Nhcy5hYy5jbj4KPiAtLS0KCkl0IGRlc2Vy
dmVzIGEgRml4ZXMgdGFnLgoKUmV2aWV3ZWQtYnk6IFJhaHVsIFBhdGhhayA8cmFodWxAc3VtbWF0
aW9ucy5uZXQ+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
