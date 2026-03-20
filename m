Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811ECFB5EA9
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 04:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvWqVCMO+8KoTmEn5LDoRsjOs8kDAwf3bSkeXiuXhaU=; b=fg1+NZw58OnIDx
	6QrBz0UwGQm6uMFrAtz0hcBUpRFzNPAp85dYCbXOhP2v5rD2fmFSE7gAD7zIHLCBygA85Q/9oWQKc
	8wPKg/K+Rg8Tp6fSUpqRjBIZNJuu63q318m06rvWG1s28eRBUycL5TN/SFQSm3swEKXpRJ30F6WzU
	csqYMthvg3pt/glh6nVRaRy9+DTghqoLAPQLrlvaQFhZ/Ew0iLlohfHp8zMpsW2dkvyiwrgCW290d
	e08qyVkdzFbLFvDvXGomdb6bE2K0cTVw8h1+fH4vbcN4OkYek92yEg/o3mLcp0J7y1NHPy6VH2iNX
	WPxezN52kb3EvqVIPFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3RfD-0000000C4Nk-0Cbx;
	Fri, 20 Mar 2026 04:40:47 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3RfA-0000000C4Mt-1gSi
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 04:40:46 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-67ba58c0220so1621912eaf.0
        for <opensbi@lists.infradead.org>; Thu, 19 Mar 2026 21:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773981642; cv=none;
        d=google.com; s=arc-20240605;
        b=Clal6u9gBITkGAmz9qDnEBgN0aqqbK5ExG0tdYiLCtY5uZVM54A1X+aaGNmSDeetlF
         MXM0FAVnBkHBnmZ2goZ+BC9Himr0YmXeJoIZ+w19r5hcZfM6wCxt3yvwMVtH8CRqvPn2
         9pSKirpGHEhBQ7AmG9POWOjAfkzrDCh2NBVElgVin44fu8lg6+jde3KDgUir8BwPYK08
         4aITSJ6gdDLXr+/s/KTPzSWt9SgZbWq+1Oe74XC1PhHfncSm+oe0raRV4EbAi/e8EQfh
         6fVtyLnu3T7A4zjng7SvDL4EfbtzSoO0ybGgTe4mjPSAU3cXd4pQJ1t+FJkFzoul1hJt
         fzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y4yhdjOAzAAwXsQuuuVms2JSTrsdYltCSDhftSd+VkY=;
        fh=ZvUNVdBUaw9ITe6WhmV5AcAsi7vmvtm+VWe7OnyYmG8=;
        b=DSbZqpwSEbLRjcrcGo+IbeIm8ciDep/XZrkGhOySs1UrhKb3JhU6DC45GiQgNxKCFi
         Lu5UCe1BOaAmX8Ge0PL6HitnCBUWyzpjGYHGsQVB6Tmz9Qx/4TZDJ1o4tNF+sSomGt/d
         DHFervXp3bOcVQLwxirNt3YrPFmjMAYMTV9fdD7Re8ATh7O2nIQqCF2khzx9SLkBdU6c
         SGBo4WMuUNN5y6YHXYVv09UIrynAHfChXTjCz0e495KfW8hAmQeHkv7OPykMEj0ImdJP
         8oeigiPmNs2cDAKw9hZMoB8OXIRiioGDJW2DX49QZrUiQSVyXupcoSZAeRnDRZiH+Buy
         NogQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773981642; x=1774586442; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4yhdjOAzAAwXsQuuuVms2JSTrsdYltCSDhftSd+VkY=;
        b=DAu0hnXfagCnG7/FLaw+JmT3hZO73LhDmxaoHKDz7UoKK1dhwgAw8pfywLcDoLNjah
         4nGewLbo/Vi5RjFScILbrbRcuHAcjokUhFS3c/FK7PZm5ZKSIIrI5DIHpRbMpRnkPpRX
         c+/+5PyB9CVzNYN/ygfS+zI7p4S7QwNDVzeLJ2rf6z4EKmf5SsFKn4DvRwdT5JvdBr8D
         gk5QxufKrg1CcbOA60/+/vOzY085wMLBUhxiXQnGku3J+J0l6w1EvgcNf+DrNV21b6xY
         Tg8MFt0xPJiSjyf7C3+H4H22Ub1z0GWbU43JZYll1x6xfDLPFlaP9ulikv04B2ZJxZ1D
         OXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773981642; x=1774586442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4yhdjOAzAAwXsQuuuVms2JSTrsdYltCSDhftSd+VkY=;
        b=NnAAF8mC3aBs1jns+CmW+wL0LG0O3S63KJYLOrQA/TWfMu1dMmqTUVzMjRPKlPwBUu
         6O308Q4AlZkYxrqLEMP6Sr4j1ZqJi++SUXveDazSUSAj+LZ8peWzGWFoQgsr+ezCWOGX
         ziYIGh3z/69ZWfMTH0VibLUevsB5WOBBQjJVAuBuZ0DpAztsfuyURgpPLu1ZvnYMRbQ1
         OZ6E5swixI9Tcc0kR8T/vkw56lf/pkg4vu0iTwhy0rvLZs+fzxiebs43GefSiauoJ5mK
         VX0Ko9RrWQb64DhBilnOgo366V1IkbJVmhGJjFyX7E6DLiEwfWWIiowXRZoXAyjxo1QI
         jvbg==
X-Gm-Message-State: AOJu0YypPBmDsdMuYOh/857by3XtCSIEz44MzRQqnS/iI+Z7DfS/vif/
	Bhh3GunDCwax7OuBBp0eyrchkCUswjq3JDBurfj8rhIT6bnRqAEZL0hhSW++IHlPYZXvHQwnQdM
	Yt62hmnGA2fCHPUzrtt7PNBon9YdlKnkUhUO9I1vQpA==
X-Gm-Gg: ATEYQzxz2/B7Wnn197wIoQCWsvy29HjUR/8tRcDyClB/EMEzaKyqxTZEvSlF/+hs3LN
	GxJKESHyCHtWJVMvhgB5vrirIaYnn8bcJ0wnZXO7IsM4cJQtQYfvrmPCMcqgXZxeVYeFEUzd5m5
	FK97/4Mk4dcPaogLa/q8XvkHnWh4Z0mNaRsHwSAGlAchHNgldh+uhLPlY5bsbHtHs1bBa4PT3+9
	pHiD6I0Bk7uWQwS6E39UQW0jfhoxRfbN48Fl58vUA1vq96kPS2BUG+Ycda7sonO99gdLALYYxul
	Prnp6iiQm6js4j9oVX2LmSwdzppQUHHH9xEzNZgj2fCxlUHEVuLwMhklUVMR12sVfwrfk6CN9tg
	8cNhMALcFo1D/pa9xSzw8yU256FgUrSlIS2ww
X-Received: by 2002:a05:6820:f036:b0:67b:a483:e583 with SMTP id
 006d021491bc7-67c183ab583mr3925443eaf.13.1773981642556; Thu, 19 Mar 2026
 21:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260210094044.72591-1-ganboing@gmail.com> <20260210094044.72591-2-ganboing@gmail.com>
In-Reply-To: <20260210094044.72591-2-ganboing@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Mar 2026 10:10:31 +0530
X-Gm-Features: AaiRm51ljOl_OcpRWvBp2d8tSbFBG2WsM9QOUPH__7gGhi1G_yimKMIF6AIIKFw
Message-ID: <CAAhSdy39Pxt0a3SHq-Cqtm1qK3OJc1sMVrmu70UEN6CvjdO=cw@mail.gmail.com>
Subject: Re: [PATCH 1/7] include: sbi: Add more mstatus and instruction encoding
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, dramforever@live.com, 
	anup.patel@oss.qualcomm.com, cleger@rivosinc.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_214044_701759_BA04C651 
X-CRM114-Status: GOOD (  12.51  )
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

T24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgMzoxMuKAr1BNIEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwu
Y29tPiB3cm90ZToKPgo+IC0gQWRkIE1YTCBlbmNvZGluZyBmb3IgY2FsY3VsYXRpbmcgWExFTi4K
PiAtIEFkZCBpbnN0cnVjdGlvbiBlbmNvZGluZyBmb3IgYy5sYnUvYy5zYiwKPiAgIGFuZCBpbW0g
ZW5jb2RpbmcgZm9yIG11bHRpcGxlIFJWQyBpbnNuLgo+Cj4gU2lnbmVkLW9mZi1ieTogQm8gR2Fu
IDxnYW5ib2luZ0BnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9y
aXNjdl9lbmNvZGluZy5oIHwgMjAgKysrKysrKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCBiL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgK
PiBpbmRleCBiNWE0Y2U4MS4uOGFiNTlhYmUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvcmlz
Y3ZfZW5jb2RpbmcuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiBAQCAt
MzYsOCArMzYsMTAgQEAKPiAgI2RlZmluZSBNU1RBVFVTX1NEVCAgICAgICAgICAgICAgICAgICAg
X1VMKDB4MDEwMDAwMDApCj4gICNkZWZpbmUgTVNUQVRVUzMyX1NEICAgICAgICAgICAgICAgICAg
IF9VTCgweDgwMDAwMDAwKQo+ICAjaWYgX19yaXNjdl94bGVuID09IDY0Cj4gLSNkZWZpbmUgTVNU
QVRVU19VWEwgICAgICAgICAgICAgICAgICAgIF9VTEwoMHgwMDAwMDAwMzAwMDAwMDAwKQo+IC0j
ZGVmaW5lIE1TVEFUVVNfU1hMICAgICAgICAgICAgICAgICAgICBfVUxMKDB4MDAwMDAwMEMwMDAw
MDAwMCkKPiArI2RlZmluZSBNU1RBVFVTX1VYTF9TSElGVCAgICAgICAgICAgICAgMzIKPiArI2Rl
ZmluZSBNU1RBVFVTX1VYTCAgICAgICAgICAgICAgICAgICAgKF9VTEwoMykgPDwgTVNUQVRVU19V
WExfU0hJRlQpCj4gKyNkZWZpbmUgTVNUQVRVU19TWExfU0hJRlQgICAgICAgICAgICAgIDM0Cj4g
KyNkZWZpbmUgTVNUQVRVU19TWEwgICAgICAgICAgICAgICAgICAgIChfVUxMKDMpIDw8IE1TVEFU
VVNfU1hMX1NISUZUKQo+ICAjZGVmaW5lIE1TVEFUVVNfU0JFICAgICAgICAgICAgICAgICAgICBf
VUxMKDB4MDAwMDAwMTAwMDAwMDAwMCkKPiAgI2RlZmluZSBNU1RBVFVTX01CRSAgICAgICAgICAg
ICAgICAgICAgX1VMTCgweDAwMDAwMDIwMDAwMDAwMDApCj4gICNkZWZpbmUgTVNUQVRVU19HVkEg
ICAgICAgICAgICAgICAgICAgIF9VTEwoMHgwMDAwMDA0MDAwMDAwMDAwKQo+IEBAIC01Niw2ICs1
OCw5IEBACj4gICNlbmRpZgo+ICAjZGVmaW5lIE1TVEFUVVMzMl9TRCAgICAgICAgICAgICAgICAg
ICBfVUwoMHg4MDAwMDAwMCkKPiAgI2RlZmluZSBNU1RBVFVTNjRfU0QgICAgICAgICAgICAgICAg
ICAgX1VMTCgweDgwMDAwMDAwMDAwMDAwMDApCj4gKyNkZWZpbmUgTVhMX1hMRU5fMzIgICAgICAg
ICAgICAgICAgICAgIDEKPiArI2RlZmluZSBNWExfWExFTl82NCAgICAgICAgICAgICAgICAgICAg
Mgo+ICsjZGVmaW5lIE1YTF9UT19YTEVOKHgpICAgICAgICAgICAgICAgICAoMVUgPDwgKHggKyA0
KSkKPgo+ICAjZGVmaW5lIFNTVEFUVVNfU0lFICAgICAgICAgICAgICAgICAgICBNU1RBVFVTX1NJ
RQo+ICAjZGVmaW5lIFNTVEFUVVNfU1BJRV9TSElGVCAgICAgICAgICAgICBNU1RBVFVTX1NQSUVf
U0hJRlQKPiBAQCAtOTM5LDYgKzk0NCwxMCBAQAo+ICAjZGVmaW5lIElOU05fTUFUQ0hfQ19GU1dT
UCAgICAgICAgICAgICAweGUwMDIKPiAgI2RlZmluZSBJTlNOX01BU0tfQ19GU1dTUCAgICAgICAg
ICAgICAgMHhlMDAzCj4KPiArI2RlZmluZSBJTlNOX01BVENIX0NfTEJVICAgICAgICAgICAgICAg
MHg4MDAwCj4gKyNkZWZpbmUgSU5TTl9NQVNLX0NfTEJVICAgICAgICAgICAgICAgICAgICAgICAg
MHhmYzAzCj4gKyNkZWZpbmUgSU5TTl9NQVRDSF9DX1NCICAgICAgICAgICAgICAgICAgICAgICAg
MHg4ODAwCj4gKyNkZWZpbmUgSU5TTl9NQVNLX0NfU0IgICAgICAgICAgICAgICAgIDB4ZmMwMwo+
ICAjZGVmaW5lIElOU05fTUFUQ0hfQ19MSFUgICAgICAgICAgICAgICAweDg0MDAKPiAgI2RlZmlu
ZSBJTlNOX01BU0tfQ19MSFUgICAgICAgICAgICAgICAgICAgICAgICAweGZjNDMKPiAgI2RlZmlu
ZSBJTlNOX01BVENIX0NfTEggICAgICAgICAgICAgICAgICAgICAgICAweDg0NDAKPiBAQCAtMTM2
OCw2ICsxMzc3LDkgQEAKPiAgI2RlZmluZSBTSF9SUzJDICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAyCj4KPiAgI2RlZmluZSBSVl9YKHgsIHMsIG4pICAgICAgICAgICAgICAgICAgKCgo
eCkgPj4gKHMpKSAmICgoMSA8PCAobikpIC0gMSkpCj4gKyNkZWZpbmUgUlZDX0xCX0lNTSh4KSAg
ICAgICAgICAgICAgICAgICgoUlZfWCh4LCA2LCAxKSA8PCAwKSB8IFwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIChSVl9YKHgsIDUsIDEpIDw8IDEpKQo+ICsjZGVm
aW5lIFJWQ19MSF9JTU0oeCkgICAgICAgICAgICAgICAgICAgKFJWX1goeCwgNSwgMSkgPDwgMSkK
PiAgI2RlZmluZSBSVkNfTFdfSU1NKHgpICAgICAgICAgICAgICAgICAgKChSVl9YKHgsIDYsIDEp
IDw8IDIpIHwgXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKFJW
X1goeCwgMTAsIDMpIDw8IDMpIHwgXAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKFJWX1goeCwgNSwgMSkgPDwgNikpCj4gQEAgLTEzNzksNiArMTM5MSwxMCBAQAo+
ICAjZGVmaW5lIFJWQ19MRFNQX0lNTSh4KSAgICAgICAgICAgICAgICAgICAgICAgICgoUlZfWCh4
LCA1LCAyKSA8PCAzKSB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIChSVl9YKHgsIDEyLCAxKSA8PCA1KSB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIChSVl9YKHgsIDIsIDMpIDw8IDYpKQo+ICsjZGVmaW5lIFJWQ19TQl9J
TU0oeCkgICAgICAgICAgICAgICAgICBSVkNfTEJfSU1NKHgpCj4gKyNkZWZpbmUgUlZDX1NIX0lN
TSh4KSAgICAgICAgICAgICAgICAgIFJWQ19MSF9JTU0oeCkKPiArI2RlZmluZSBSVkNfU1dfSU1N
KHgpICAgICAgICAgICAgICAgICAgUlZDX0xXX0lNTSh4KQo+ICsjZGVmaW5lIFJWQ19TRF9JTU0o
eCkgICAgICAgICAgICAgICAgICBSVkNfTERfSU1NKHgpCj4gICNkZWZpbmUgUlZDX1NXU1BfSU1N
KHgpICAgICAgICAgICAgICAgICAgICAgICAgKChSVl9YKHgsIDksIDQpIDw8IDIpIHwgXAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKFJWX1goeCwgNywgMikgPDwg
NikpCj4gICNkZWZpbmUgUlZDX1NEU1BfSU1NKHgpICAgICAgICAgICAgICAgICAgICAgICAgKChS
Vl9YKHgsIDEwLCAzKSA8PCAzKSB8IFwKPiAtLQo+IDIuMzQuMQo+CgotLSAKb3BlbnNiaSBtYWls
aW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
