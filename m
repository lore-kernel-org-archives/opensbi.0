Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD38CD343F
	for <opensbi@archiver.kernel.org>; Tue, 12 May 2026 16:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1F0LZP+09X450NKx9gOgsvu+hnaiW1zKOcxqZcFrEok=; b=GtSHMslGevNJGd
	2m0gsET5OMzzf3Bly9BEugP4Aa48tFFtXlvyo8KqEJ/90Rh1Ggr3fwIJLeSz63cNOiLqSuS1zk+sa
	xo5NkEVIlhWaastxUYGWcF3RnzmyeSiI9xvFytyXjQyz03sFB5j+c/sk3QCrarcF+UM+UVZs0WUi6
	UtmLns6u5FaIUB6os+Yl2NIGeZQ2+mPmHSjCRmBPfXz4OciKr/BeZadbBOhBS29Ddzc/h3eP9LRh3
	SVdDNp4z6O95QlaKCVCzhuVSo43wLyUk4cc9keFDO9MUlDn91MRBcYmLFk6qFtN5kpBtKOnD7/qrT
	z5v6m8i+e49Qd/1WhorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqQE-0000000HSMK-13Y0;
	Tue, 12 May 2026 16:57:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqQD-0000000HSLs-1d9h
	for opensbi@bombadil.infradead.org;
	Tue, 12 May 2026 16:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GalM1T5wSCXoeRl/b8tY1Y/E6GIWsmmWWhX0vKg0yYw=; b=GaSDF69a/IikPD5GOyOdErYUqv
	f46kyfbXh4YYrb56GrAt2M6iLRR+reshK0yq1QC0lSO0JTGLdpZGw+9Q9Seyxmo6djgnDkko7rroD
	B6rQ0hn8RwFv9F88Xs+knzGlItqNcEICpnmWcOZgLD90QjV5mEqixyLLedOid49UphktEkxsdB/+f
	zg1n/MswBN6CEaoB2kbI3ad/NqFWU7cJscRPkSD+4wB5m7tLSrskAMvDpH6790sLWLDcGTPrjpiPG
	4jUgyJiZ8tj4C5800LvEczvwxhyE2ndbt4tnFu7hWlajoDQpS1CR3AN+o2WWM/kGepyvqJiintsma
	xE1LDxAQ==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpbZ-0000000FG17-1jKf
	for opensbi@lists.infradead.org;
	Tue, 12 May 2026 16:05:11 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7dcd689829eso5090561a34.3
        for <opensbi@lists.infradead.org>; Tue, 12 May 2026 09:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778601907; cv=none;
        d=google.com; s=arc-20240605;
        b=eu5Rd8ixbKoffCbNxe9bwwRszOy5awLB5YU5aaamRDngIKYGIk48ogqHNg3eJ5FzTj
         4JCLmdJRqbrxUAkDAibYX8S1ASDLrZPDLKZsVcX4LHTuAFqmM624QgjAtUgxMHwfRWs0
         NkF8zp7gTHRaG4meksLyJX7PSaTLOSL+lRAvXHRxpAbpgKTHrYElOMbKHgO9yV5eEq/1
         bm50gLjvP73z92AEIewP5nCq/OjjDfDE5a3GFMPiNaDDWNcxdKdECr9ROwXWdpjN+gOl
         s7WOGOvk4Syg6joHs12YXx7dg6dkwVuGMO74e3sSYIpNYYEPTsL2rkJscJkAioq7RpLI
         D+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GalM1T5wSCXoeRl/b8tY1Y/E6GIWsmmWWhX0vKg0yYw=;
        fh=1CCt9UJmt40SlRo459PKEWIuUxZQ2Zn4py42z4BZDhE=;
        b=Fs6qXLguhdxAzgdTypJ65NwDNPn2rVBzZjukOw7byV9p9jmlkPGbOKflL1iSEu94wR
         oYMCTHmBtrdMK/ADkQemA6XoRo7UaaXKjTBRJM/n6yLxMMiDF+5OcN58i9ylOPkz135m
         L1oTFGjglt+QrDxA8mMsZEe1UxSO29ocjQqP/JHa2vjFwBTb/3B8wtCLsjza3Sk9STfq
         Sf+Hbd+rYSHvLZSEEJHUdM8Kp5Zsr7gvqASj/3JKhOE9r1qCcHG/q6vDTMLRr1ZsAr7m
         ilbmYKdBBKJDPW47qdHDFNurdpifGDvGAfiU5KFNdRoLCe7rAdA8gwZDyD+tqh/dAVIU
         O8Og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778601907; x=1779206707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GalM1T5wSCXoeRl/b8tY1Y/E6GIWsmmWWhX0vKg0yYw=;
        b=J+VVjOX04VhyKj+ZBkj7S7/9AjFmI2jJeb1km2SopK0EJWNyjNY6Jaz6rQ06Ci1Ot5
         n5LUFmjHdpPN5ICLFzD94AalDZtrsQNh4BTr6ma8N/7dpUEDA2rvnuO85v4UfVUnQIFW
         Z6HO3ru5SnUsB0rwdhzJS/e/3TyERUxxS713hjXfwybFfr9C0dHTYXnxbsYTt88qLGf5
         lEFyIYIFhGGRFfvRZKadkZjeywmoAVVkdsPsttX+WkouP0nZDkBjW+8Eh+5B+IbU1goA
         zDorCJRC7Ep5djmYKrVtJRMX2rchEBirJRimxC/6qxbzPCGa/pCmvZNKtNpZKiMd879l
         9Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601907; x=1779206707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GalM1T5wSCXoeRl/b8tY1Y/E6GIWsmmWWhX0vKg0yYw=;
        b=o5iYDiJT8UMG1T6A4ufCJ8wbmIRv+gX4DOa1g2gl0SXLgWK2zEeBEoI0EdG3YknIk3
         eQie8oiYLjI5fccjhQt3f7ZQ+zy/PDsk7GUH1sIWwpe1MMNGCmrIAv1Q0aJuK7gMlV1L
         HzUf9SkB/ZUpGXdkgqnq8Xt7FBrwYWPrihMFmaJWIZ1JuYJTrJnPZWHsQo7Cf6F6cjb1
         KcmZTiXOo0nr5+CTI8GYdVkaU51mRheOU9nb49t56njM6BNzEISoiNNDvUwnIixqZL2m
         9zo9twYzWqTwCa4vsa2CnTzBAhKRM/Jg5zkcJ8Hg+0kGEQzz+e0BTSTK4EDMN3sBoKp7
         A/6w==
X-Gm-Message-State: AOJu0YwKH0vFp03jJO2aO5fZS+8hA/5mgCFNlVMX7tSXFklU5rh2cQJb
	zYPCXOoQkGID4gcPnEEAx+Ku+rlxLd2Q1mHgrWqZprqlP9s9sXkOTMqSCPqT2aS4fjk002N1+tE
	y+/178/2L3jIc32s3pH59xfKObFPhQjA5r3xKofWr0w==
X-Gm-Gg: Acq92OHgMnGUOgsXcjgB6efBFvDvGn33OU1yCMvxpksunzHS2OLE+f0ELRgit+nHHWo
	BKJNeOFjbgdIJZ8l/jfGo4BXqWcXK93WZIkX0mQFqeO9PBwarErk9YF5KePj0pO1dlBJrtbX7o1
	xmjJs8cBlflrMkuTfmsVhYtV7mbFOPk3xZCZ7hksGRKVo5cSFOfMFBYaxEgklpY8MeJuSRzDO6b
	rS3s9ihyQCWkomBBS2VczwtTiINlPJ/Nu5pwBZst0LDn0TBTmpUsQczMbwDyTPa0RRX75UPqHX7
	FZ2/j9inNL4aZCB1WYvCZ7rqrdd9MjV4j56fuJq6uV4oOu/Lkh/IcFMZjgBpk5qVhuwCTuc8yyb
	khQaVFCm74fMeJZluoYw2AksfxQ==
X-Received: by 2002:a05:6830:3592:b0:7d7:c985:3a30 with SMTP id
 46e09a7af769-7e3662b7c27mr13565154a34.11.1778601907284; Tue, 12 May 2026
 09:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260327043357.3452008-1-peter.lin@sifive.com>
 <CAAhSdy2P4D41w5fM=gYwn8ObRjUW3D5p_rdc8EMB7qFa_n-U4w@mail.gmail.com>
 <agLjlvK9ZQYrvPjr@plin-1878> <CAAhSdy0QLe3jjtdAZDigyd9Lizk=AegU3r-pSstQsdFj_MmB4A@mail.gmail.com>
In-Reply-To: <CAAhSdy0QLe3jjtdAZDigyd9Lizk=AegU3r-pSstQsdFj_MmB4A@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 May 2026 21:34:55 +0530
X-Gm-Features: AVHnY4Ks_C241PswPttM6m4bCSV8xw7tEygf8DDpmzTJs2mms_RQ-JxhmqS5kCQ
Message-ID: <CAAhSdy13-otu5XskR1yHoSgh4m_RJqmfh=+06ZHYDm4OF1jPmQ@mail.gmail.com>
Subject: Re: [PATCH] lib: utils: fdt_domain: add support for root domain
 region inheritance
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_170510_080395_4F782871 
X-CRM114-Status: GOOD (  21.78  )
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

T24gVHVlLCBNYXkgMTIsIDIwMjYgYXQgOToyMOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMTIsIDIwMjYgYXQgMTo1M+KAr1BNIFl1
LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IEhp
IEFudXAsCj4gPgo+ID4gVGhhbmtzIGZvciBzdWdnZXRpb24sIEknZCBsaWtlIHRvIGRvdWJsZS1j
aGVjayBiZWZvcmUKPiA+IHNlbmRpbmcgdjIgcGF0Y2guCj4gPgo+ID4gT24gU3VuLCBNYXkgMTAs
IDIwMjYgYXQgMTE6MzQ6NDlBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gT24gRnJp
LCBNYXIgMjcsIDIwMjYgYXQgMTA6MDTigK9BTSBZdS1DaGllbiBQZXRlciBMaW4KPiA+ID4gPHBl
dGVyLmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEFkZCB0aGUgInJvb3Qt
cmVnaW9ucyIgcHJvcGVydHkgaW4gZG9tYWluIGRldmljZS10cmVlIG5vZGVzIHRvCj4gPiA+ID4g
YWxsb3cgZG9tYWlucyB0byBpbmhlcml0IGFsbCByZWdpb25zIGZyb20gdGhlIHJvb3QgZG9tYWlu
LiBUaGlzCj4gPiA+ID4gc2ltcGxpZmllcyBjb25maWd1cmF0aW9uIGZvciBkb21haW5zIHRoYXQg
bmVlZCBhY2Nlc3MgdG8gbW9zdAo+ID4gPiA+IHJvb3QgZG9tYWluIHJlZ2lvbnMgd2l0aCBvbmx5
IG1pbm9yIGV4Y2x1c2lvbnMgb3IgYWRkaXRpb25zLgo+ID4gPgo+ID4gPiBPdmVyYWxsLCB0aGlz
IGlzIGEgZ29vZCBhcHByb2FjaCBidXQgSSBzdWdnZXN0IHJlbmFtaW5nIHRoaXMgcHJvcGVydHkK
PiA+ID4gdG8gInJvb3QtcmVnaW9ucy1pbmhlcml0YW5jZSIgd2hpY2ggdGFrZXMgdGhlIGZvbGxv
d2luZyBwb3NzaWJsZSB2YWx1ZXM6Cj4gPiA+Cj4gPiA+IDEpICJhbGwiIDogSW5oZXJpdCBhbGwg
cmVnaW9ucyBmcm9tIHRoZSByb290IGRvbWFpbgo+ID4gPiAyKSAic3Utb25seSI6IEluaGVyaXQg
cmVnaW9ucyBhY2Nlc3NpYmxlIHRvIFMtbW9kZSBvciBVLW1vZGUgZnJvbSB0aGUKPiA+ID4gcm9v
dCBkb21haW4KPiA+Cj4gPiAxLiBEbyB5b3UgbWVhbjoKPiA+ICAgIGEpIGFueSByb290IHJlZ2lv
bnMgdGhhdCBoYXZlIGFueSBTVSBwZXJtaXNzaW9uIGJpdHMgc2V0IHJlZ2FyZGxlc3Mgb2YgdGhl
Cj4gPiAgICAgICBN4oCRbW9kZSBwZXJtaXNzaW9uIGJpdHMsIG9yCj4gPiAgICBiKSBvbmx5IHJl
Z2lvbnMgdGhhdCBzYXRpc2Z5IFNCSV9ET01BSU5fTUVNUkVHSU9OX1NVX09OTFlfQUNDRVNTKGZs
YWdzKT8KPgo+IEFjdHVhbGx5LCBub25lIG9mIHRoZXNlLiBBcG9sb2dpZXMgZm9yIHRoZSBjb25m
dXNpb24uCj4KPiBJIG1lYW50IHRoZSBjdXJyZW50IHBvbGljeSBvZiBjb3B5aW5nIHNlbGVjdCBy
ZWdpb25zIGZyb20KPiByb290IGRvbWFpbiB0byBub24tcm9vdCBkb21haW4gd2hpY2ggaXMgb25s
eSBjb3B5IHJlZ2lvbnMKPiB3aGljaCBoYXZlIG5vIFNVIHBlcm1pc3Npb25zIHNldC4KPgo+IFRo
aXMgbWVhbnMgdGhlIGZvbGxvd2luZyBwb3NzaWJsZSB2YWx1ZXM6Cj4KPiAxKSAiYWxsIiA6IElu
aGVyaXQgYWxsIHJlZ2lvbnMgZnJvbSB0aGUgcm9vdCBkb21haW4KPiAyKSAibS1vbmx5IjogSW5o
ZXJpdCByZWdpb25zIG9mIHJvb3QgZG9tYWluIG5vdCBoYXZpbmcKPiBhbnkgU1UgcGVybWlzc2lv
bnMgc2V0IChjdXJyZW50IHBvbGljeSkgd2hpY2ggYWxzbwo+IGNvdmVycyBmaXJtd2FyZSByZWdp
b25zLgo+IDMpICJub25lIjogSW5oZXJpdCBubyByZWdpb25zIGZyb20gdGhlIHJvb3QgZG9tYWlu
Cj4KPiA+IDIuIEZvciBmaXJtd2FyZSByZWdpb25zIG1hcmtlZCB3aXRoIFNCSV9ET01BSU5fTUVN
UkVHSU9OX0ZXLCBzaG91bGQgdGhvc2UgYWx3YXlzCj4gPiAgICBiZSBpbmhlcml0ZWQsIGV2ZW4g
d2hlbiAicm9vdC1yZWdpb25zLWluaGVyaXRhbmNlIiBpcyAibm9uZSIgb3IgInN1LW9ubHkiPwo+
Cj4gWWVzLCBGVyByZWdpb25zIHNob3VsZCBhbHdheXMgYmUgaW5oZXJpdGVkIGJlY2F1c2UgdGhl
c2UgYXJlIGZvcgo+IE9wZW5TQkkgaXRzZWxmIGFuZCBPcGVuU0JJIGlzIGFsd2F5cyByZXNpZGVu
dCBpbiBiYWNrZ3JvdW5kLgo+CgpUaGlua2luZyBhYm91dCB0aGlzIG1vcmUsIHRoZSAibm9uZSIg
b3B0aW9uIHNob3VsZCBub3QgYmUKdGhlcmUgYmVjYXVzZSBtLW9ubHkgcmVnaW9ucyAoaW5jbHVk
aW5nIGZ3IHJlZ2lvbnMpIGFyZQphbHdheXMgcmVxdWlyZWQgZm9yIHByb3BlciBmdW5jdGlvbmlu
ZyBvZiBPcGVuU0JJLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
