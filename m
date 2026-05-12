Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7771CD4F26
	for <opensbi@archiver.kernel.org>; Tue, 12 May 2026 08:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzUc/WW2L1S+tAdoZg2mEJ+bCplrL0/uW52ttki4e7M=; b=BZbEEE5jhidx39
	AtjsEKjHSvFe9MtvoCtf4OMmV2CUmqY+AKfgL5XMWcbfgKwv/Qp3w3QvtF0aJeEJWnXuMWrpGoI7w
	NOOD98exTurPb0OCVSzXk9IevHKFnn/Z9hA2F2R5VG018nZl62qRcO+ganM3bM7byLF/qeuClHF5x
	kMhrcSXnGKmnHMHt5QWpHUaYopa5GQCNO4AUea9k8hNe5mxnJLqCtrhIHEaOaEZdiH3lSeK+TFmTu
	NyYfPj4jT9RgouXhiuL7knOe7gocSwgOyuuud4BJW/oSitKQXUFKAMUsTU44SJQRLAivsSd8+5G0e
	Mwrwdivabum3jDmryMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiPH-0000000G4Mx-2dCJ;
	Tue, 12 May 2026 08:23:59 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiPE-0000000G4MT-3wSe
	for opensbi@lists.infradead.org;
	Tue, 12 May 2026 08:23:58 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-366be8040a9so1784688a91.3
        for <opensbi@lists.infradead.org>; Tue, 12 May 2026 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778574235; x=1779179035; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D1jqSbFlpblcGbF+5Ge5ZNaanAc+CiWyEW4wS8zLqAc=;
        b=lEOwKsnxGrkrvDooGz8k+OvDn4xBTFAV+2tcsI90EXwmCZuy6+m84O9s68NDOkAFim
         SKXyTbHzVUvmL9vKut7se2xXn50Q0K9txlXXbX8Eo6uNcif2xz/naRbxUCiRJ8WQFCHY
         0tSmD8Qy0ZuuubYsClc95H4dOf8/jShwyd4M2zgr7ieQvvq28mVl7aFgXVk3PHEwnDgc
         0VUDVgNL8h818PYErlf8c2An1jHmDhZ+cB++sQKi3epx4lfk9pWFAXP2CcQ29CCuZuWd
         mq4Vnhc5eMtLcGxVc1OFXZfelKNMh753xFEdm5zk53disQsD19LYkg6DhTHbLwb6yU2o
         JG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574235; x=1779179035;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1jqSbFlpblcGbF+5Ge5ZNaanAc+CiWyEW4wS8zLqAc=;
        b=dbHLg4fegXrypT+RJSomHNnpc4UWZQq5MgvaDCmTrOz58nW8w8PQDicUdn5galbNti
         yaYC7IOYxupW9N+BfBEXzx8Cm0/BI8v7lOIxrqOkMY3tTh2J8vrj1imC4NLL5e6SDz4d
         sXppXzlu7C2iZ15Av+6LvcQYOKp79gX4XoZHk7DwE4zrmM/7v5O2oq7hDZ69bktzTmJ+
         D+2i6wLCUNHwvD+L2c8Ysm2UFvK3MhLntzLEDcIk7bWU9QOrs/xBH5xYfm/P0gXM2wzh
         yH+wFMdWsNuXC+VOch6NLQw6ktYoNI5ifNMjOjnZMqOOvC1HsnEOFHF9sZ1C2Tbr9aw5
         af3w==
X-Gm-Message-State: AOJu0YzyYlecdm9HLortZs1Ztdhw87HxSpfz5azjwemfiDi66t4ZPwI0
	xUO5sVsv6HjamhyzLQSIjMnDW8FVVpdbQ+vmSSeaewFnYEYQKVRe3J7N5CxHQYOoLkM=
X-Gm-Gg: Acq92OG8Q6kj2HtekYAqThaTBUfgSVRWal/WJKkNLmwlLS8Ls4InZMFtn21LVu+a8Na
	ranANhfoyDYpXCR6gZRjXL9UzALuzmBEdF/yY8joreQjuGUeZYfu7/GUobTHp8qD1k5ZG8ji9Sl
	1UWOiijgTpUACeQr5rC9pL+3gfkcvnibviN6rM7dGmag5dpOTdcB0P+73mzqYuJzFQFB5FuW76j
	wcCX+fUecVc1m90jPrR1iywU/l5w7o2d+ru4Bk9eLXyAjlTNcZ3fp/RO1QbUtRJR5qrufjhR5Oi
	WJ8kn3gcI3IZU8fRXjK3ko7rY8SO20jai2ZsdUVZyu0ou8+T5gfDeaehwrejmBL77j0gUrtop8S
	p6wZf8wDPCy0e4K//wsGUpM+ZoV0dCykB/m6TLjDDjA0AM646nkJLFKCIgQu0Fj4z2tqbJiw1/v
	KYpBpqK9GrxXDS+kAWbNXwrg==
X-Received: by 2002:a17:90b:3d50:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-368b269e663mr2299825a91.16.1778574235557;
        Tue, 12 May 2026 01:23:55 -0700 (PDT)
Received: from plin-1878 ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d629f3b5sm10298367a91.8.2026.05.12.01.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:23:54 -0700 (PDT)
Date: Tue, 12 May 2026 16:23:50 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com
Subject: Re: [PATCH] lib: utils: fdt_domain: add support for root domain
 region inheritance
Message-ID: <agLjlvK9ZQYrvPjr@plin-1878>
References: <20260327043357.3452008-1-peter.lin@sifive.com>
 <CAAhSdy2P4D41w5fM=gYwn8ObRjUW3D5p_rdc8EMB7qFa_n-U4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2P4D41w5fM=gYwn8ObRjUW3D5p_rdc8EMB7qFa_n-U4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_012356_995230_B46E9748 
X-CRM114-Status: GOOD (  14.85  )
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

SGkgQW51cCwKClRoYW5rcyBmb3Igc3VnZ2V0aW9uLCBJJ2QgbGlrZSB0byBkb3VibGUtY2hlY2sg
YmVmb3JlCnNlbmRpbmcgdjIgcGF0Y2guCgpPbiBTdW4sIE1heSAxMCwgMjAyNiBhdCAxMTozNDo0
OUFNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIEZyaSwgTWFyIDI3LCAyMDI2IGF0IDEw
OjA04oCvQU0gWXUtQ2hpZW4gUGV0ZXIgTGluCj4gPHBldGVyLmxpbkBzaWZpdmUuY29tPiB3cm90
ZToKPiA+Cj4gPiBBZGQgdGhlICJyb290LXJlZ2lvbnMiIHByb3BlcnR5IGluIGRvbWFpbiBkZXZp
Y2UtdHJlZSBub2RlcyB0bwo+ID4gYWxsb3cgZG9tYWlucyB0byBpbmhlcml0IGFsbCByZWdpb25z
IGZyb20gdGhlIHJvb3QgZG9tYWluLiBUaGlzCj4gPiBzaW1wbGlmaWVzIGNvbmZpZ3VyYXRpb24g
Zm9yIGRvbWFpbnMgdGhhdCBuZWVkIGFjY2VzcyB0byBtb3N0Cj4gPiByb290IGRvbWFpbiByZWdp
b25zIHdpdGggb25seSBtaW5vciBleGNsdXNpb25zIG9yIGFkZGl0aW9ucy4KPiAKPiBPdmVyYWxs
LCB0aGlzIGlzIGEgZ29vZCBhcHByb2FjaCBidXQgSSBzdWdnZXN0IHJlbmFtaW5nIHRoaXMgcHJv
cGVydHkKPiB0byAicm9vdC1yZWdpb25zLWluaGVyaXRhbmNlIiB3aGljaCB0YWtlcyB0aGUgZm9s
bG93aW5nIHBvc3NpYmxlIHZhbHVlczoKPiAKPiAxKSAiYWxsIiA6IEluaGVyaXQgYWxsIHJlZ2lv
bnMgZnJvbSB0aGUgcm9vdCBkb21haW4KPiAyKSAic3Utb25seSI6IEluaGVyaXQgcmVnaW9ucyBh
Y2Nlc3NpYmxlIHRvIFMtbW9kZSBvciBVLW1vZGUgZnJvbSB0aGUKPiByb290IGRvbWFpbgoKMS4g
RG8geW91IG1lYW46CiAgIGEpIGFueSByb290IHJlZ2lvbnMgdGhhdCBoYXZlIGFueSBTVSBwZXJt
aXNzaW9uIGJpdHMgc2V0IHJlZ2FyZGxlc3Mgb2YgdGhlCiAgICAgIE3igJFtb2RlIHBlcm1pc3Np
b24gYml0cywgb3IKICAgYikgb25seSByZWdpb25zIHRoYXQgc2F0aXNmeSBTQklfRE9NQUlOX01F
TVJFR0lPTl9TVV9PTkxZX0FDQ0VTUyhmbGFncyk/CjIuIEZvciBmaXJtd2FyZSByZWdpb25zIG1h
cmtlZCB3aXRoIFNCSV9ET01BSU5fTUVNUkVHSU9OX0ZXLCBzaG91bGQgdGhvc2UgYWx3YXlzCiAg
IGJlIGluaGVyaXRlZCwgZXZlbiB3aGVuICJyb290LXJlZ2lvbnMtaW5oZXJpdGFuY2UiIGlzICJu
b25lIiBvciAic3Utb25seSI/CgpUaGFua3MsClBldGVyIExpbgoKCj4gMykgIm5vbmUiOiBJbmhl
cml0IG5vIHJlZ2lvbnMgZnJvbSB0aGUgcm9vdCBkb21haW4KPiAKPiBGcm9tIHRoZSBhYm92ZSwg
aWYgInJvb3QtcmVnaW9ucy1pbmhlcml0YW5jZSIgaXMgbm90IHNldCB0aGVuIGl0IGlzCj4gYXNz
dW1lZCB0byBiZSAic3Utb25seSIuCj4gCj4gUmVnYXJkcywKPiBBbnVwCgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
