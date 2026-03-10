Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DC4FCC9AF
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 04:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQFnvZ/Q+pV0ElATVsBvGTxc1YCPUE9IVzBoM8I8JtE=; b=Piwuetzksm5TvC
	gO/5775koLWDJBi8sYTV8TuktYd/yMnOkSPylCIcc4GjqJY05urUj0iQ19KqLdQwgk/EwsBIQ+pqF
	p/2Dw7mL9k/KHi3vib88wHcObxrJeSHKpzGKDDl7mQcuLlxLAppuDRPdYg+4PfzEhlz8yeTEamV2c
	i0ZsVNKm3ymUIFe3oTW4Hbg2vcbzFHZy39r3yU3//o3FZZAgUv/DeYvkKM/mlZpBYkzp9JFPEqEro
	hsom5ykmojafqfHuo0RZSu3joxYAB97KT5/jFf/FPy56P75f3qnYlXgtSFz/bVKeLYx5LnBztw9sw
	ke+/C+ngijgT0vU9bGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzoSX-00000008h9Y-1LqT;
	Tue, 10 Mar 2026 04:12:41 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzoSU-00000008h8r-3ltA
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 04:12:40 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-67bb19ac35aso1518712eaf.1
        for <opensbi@lists.infradead.org>; Mon, 09 Mar 2026 21:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773115957; cv=none;
        d=google.com; s=arc-20240605;
        b=eOHksGKDdFMvNGPesLlil2/vxrjGzMf6U0u1wDXmPBkYsvA3WRiFyGADh7BZYkQraN
         AHlP8XBGY7xqnyrBrBuZgxEywhI50ZEPSfEGPhA2XAy1ybLB+1IZViOnPlv5Lzlr8ZT5
         r39QB2ZX/fmXGygXvpJCjx2zLN8W9wIe2KkoSvFBnSo7FvTfDOVFyrbwtR1qTrjmrqoF
         wDelG21UC0lEeJ4oB51/G2IKCfSfUsDdxg05BkUm+/nD+hROjslculVC5E90dJZ+gyW9
         ShW6lRej0koZ5wUuHZ90vD5GZFZaLbu0pxI9aywPjBAYTf+Drs4TOLqEov29161qP8lQ
         JJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hd9WITGTfZMmF50vVhRRIlc8xfNwmhxO8/IloUAk6b8=;
        fh=CLLtyn0Cwtbw9pjEIcAmLoUhHR+fghvDdcYbrfYdgkI=;
        b=Y3nImOz6g2YcsiMsfJnT2px7PKIH7R3LfO4vkbkovWyQk4GnGU331vvXcDVW+To8E+
         Y80mh40H73FnH12jcODV9me2nuCYIbI+ks6t4zhi35wXEHSF1ooQ1mNyASUmbdkBEsZf
         LVnjSFUc7kCV5/RVyS0l/NOJV9geB0acDCk0zoxOpWs/o3UPEnYKtYAwbUGW78tBq9LP
         ULpqaciAd7Ecslx77uIta13sMXU0PLW4kncV6Vjht9kfMRSTKtz0RbcSoKVfGWSNqUvj
         gSg0F+fBFXcoArM695ELbh1y4zJYicAWpucFDvAJ6BY/DpxMoUrruzxrOQ8ekTWHakNM
         Pg3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773115957; x=1773720757; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd9WITGTfZMmF50vVhRRIlc8xfNwmhxO8/IloUAk6b8=;
        b=CZb/l0vI76QAlpv5ojoQW6OMe5/z5eHGRbyOld2whKhs2wdXGHWGgoSfYChBEEClpj
         4mJbhs2l+jf5TXk9s2o22JQWP3abdJ6N1JMnhpMcFXMS5/u2eLRUmdorhHDVXM79HVbl
         lYwrG3wry48YaQ+I6VUhxvmGB0y3mVpWVVmik3FwlHD4sFG2ASYkYrlHuqO6ccDs535G
         LWACjjsZD/zecBT4mT6jwGech7Cea6k5dXxo0N05VzqXd8FOXEmWParCWIEPbeohSqA7
         VTXXtB7f6A0FTIr1WDGKUz6WnKSQl4Y2XqtQJq73ccgi7X3K40Ou1xxTP2YTkYmG4lu+
         dGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773115957; x=1773720757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hd9WITGTfZMmF50vVhRRIlc8xfNwmhxO8/IloUAk6b8=;
        b=QhelNKdWKtuISecGHPB3zu/PWy7U5O4wQzMgb1JXOFLCMz+C0nKCFlVP3W7ue8f0zc
         ZPCBUnHdH4QuoJq8fTPxAg2p9id7cT2O7kG9NqoH/treSn4r2G5tYsPLoT/zXPkveMMc
         GuSb9T1ewxX0H28EBI4fzWfLBSJgeQOdGB6lI9xPJjLHcRq2+k4k2yilmNAsuE21qd3d
         GYpcGg3IG27ZxHNK0NoZ24A/vmL3FXK432sR/RqD/VddR7CnOt44M65it1EHNRwvZHCQ
         1SjWx24Cla6jT16l5qfGYrYnlBK315IrISnepil4ycBTSF1nTOHO5wVM1FhhtgLnpTJD
         z3pw==
X-Forwarded-Encrypted: i=1; AJvYcCWnpkhf1u2aIWIDPNW+J/SkJHOhS+RoseABh6JIeWUPU4WZQQ4btU3XM5aOI0E98cd+V6tcVnSI@lists.infradead.org
X-Gm-Message-State: AOJu0YzfkNMZzSF0dvfK0aLbdD3E47AoHoAkUE19BlYovBIGCGPzlYH9
	0SU603JFnYw6GKTv1xI0E7dgt+tC80upVxuIAZvG7REyY/NwCKsV8YGrBI+jl2bIEFY8UOHPlsV
	P6yE8xC26EL4Q8uksT0UBdMDgWcPekSR5ZXvshaICtQ==
X-Gm-Gg: ATEYQzz1Jjz7kR9iTuUDXmIXdWegqRjNwin8ov6fqi+99AVa05/RXcFuzshCfw9kylx
	WmwIlPhdtZhPambbAIbKRjW5VrqKULqe/QPWknr/kpS2SFG6UXi2wv7uCeeybHVWFKF1PsyYJDf
	EYQFoQMcZyEWD54TqN1RUmN9G/iESh//6FDa+I+AUiXghDlt+aHLmkQFNgznJunOn9Sh6pTa9tS
	qWXsSCx8bEWcAvmQsP+BP1S80HxMHCVd8wxJptOpfuk9yiSY8BnZgmvP6pfbQmQzP2MtU3zVLEB
	jKpAq0mAgS4cF2ONdIEF/QiPHkLc9rV89HCIiwEUX34Up6rshwsJuoZxzXy/KzXP5yEp0S8c0+n
	GFc/HFCquh17OXiaNN6+OmmEOAg==
X-Received: by 2002:a05:6820:814:b0:67b:bb3c:c8a with SMTP id
 006d021491bc7-67bbb3c126amr1689417eaf.36.1773115957207; Mon, 09 Mar 2026
 21:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
 <20260129-smrnmi-v3-v1-2-5d297d3e2027@sifive.com> <DG4KXRI812NK.1R8OG8O0MZ5A2@qti.qualcomm.com>
 <ajsifrry25y4ogzupvkl4bplklqppquexfw4erorqsn3nlmtpy@b3qqdlrgd3kd>
In-Reply-To: <ajsifrry25y4ogzupvkl4bplklqppquexfw4erorqsn3nlmtpy@b3qqdlrgd3kd>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Mar 2026 09:42:26 +0530
X-Gm-Features: AaiRm50BlFhGkbJsc7r59Z6KGWhNi59_JK2ZRX5NuzvSksAiP7c62gCkkL574lY
Message-ID: <CAAhSdy0A+uvKypXifa9rr2Y9NXAayg8UWbcKOXErh_r-7xtjZQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] lib: sbi: Enable Smrnmi extension handler
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Radim Krcmar <rkrcmar@qti.qualcomm.com>, Nylon Chen <nylon.chen@sifive.com>, 
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, Zong Li <zong.li@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, opensbi <opensbi-bounces@lists.infradead.org>, 
	Evgeny Voevodin <evvoevod@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_211239_086746_C217ACA9 
X-CRM114-Status: GOOD (  30.78  )
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

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgNzo1OOKAr0FNIE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dp
bkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgMDIsIDIwMjYgYXQgMDM6MjY6MzNQ
TSArMDAwMCwgUmFkaW0gS3JjbWFyIHdyb3RlOgo+ID4gMjAyNi0wMS0yOVQwMDoxMzo0Mi0wODow
MCwgTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPjoKPiA+ID4gRW5hYmxlIHRoZSBT
bXJubWkgZXh0ZW5zaW9uIGJ5Ogo+ID4gPiAxLiBBZGRpbmcgc2JpX3JubWlfdmVjdG9yX2luaXQo
KSB0byBhbGxvY2F0ZSBwZXItSEFSVCBSTk1JIGNvbnRleHQgYW5kIGVuYWJsZSBSTk1JIHZpYSBN
TlNUQVRVUy5OTUlFCj4gPiA+IDIuIFNhdmluZyBhbmQgcmVzdG9yaW5nIENTUl9NTlNDUkFUQ0gg
YW5kIENTUl9NTlNUQVRVUyBhY3Jvc3Mgbm9uLXJldGVudGl2ZSBzdXNwZW5kL3Jlc3VtZQo+ID4g
PiAzLiBDYWxsaW5nIHNiaV9ybm1pX3ZlY3Rvcl9pbml0KCkgZnJvbSB0aGUgY29sZCBhbmQgd2Fy
bSBpbml0IHBhdGhzCj4gPiA+Cj4gPiA+IENvLWRldmVsb3BlZC1ieTogWm9uZyBMaSA8em9uZy5s
aUBzaWZpdmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+
ID4gPiBTdWdnZXN0ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUu
Y29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5j
b20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNp
Zml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX3Bs
YXRmb3JtLmggYi9pbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaAo+ID4gPiBAQCAtMTQ5LDYgKzE0
OSwxNSBAQCBzdHJ1Y3Qgc2JpX3BsYXRmb3JtX29wZXJhdGlvbnMgewo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbG9nMmxlbik7Cj4gPiA+ICAgICAvKiogcGxhdGZvcm0g
c3BlY2lmaWMgcG1wIGRpc2FibGUgb24gY3VycmVudCBIQVJUICovCj4gPiA+ICAgICB2b2lkICgq
cG1wX2Rpc2FibGUpKHVuc2lnbmVkIGludCBuKTsKPiA+ID4gKyAgIC8qKgo+ID4gPiArICAgICog
UGxhdGZvcm0tc3BlY2lmaWMgaGVscGVyIHRvIHByb2dyYW0gdGhlIFJOTUkgdHJhcCB2ZWN0b3Iu
Cj4gPiA+ICsgICAgKgo+ID4gPiArICAgICogVGhlIGNvcmUgd2lsbCBjYWxsIHRoaXMgZnJvbSBz
Ymlfcm5taV92ZWN0b3JfaW5pdCgpIHdpdGggdGhlCj4gPiA+ICsgICAgKiBmaXJtd2FyZSBSTk1J
IGhhbmRsZXIgZW50cnkgYWRkcmVzcyAocm5taV9oYW5kbGVyKSBhbmQgdGhlCj4gPiA+ICsgICAg
KiBjb2xkX2Jvb3QgZmxhZy4gUGxhdGZvcm1zIHRoYXQgc3VwcG9ydCBTbXJubWkgc2hvdWxkIGlt
cGxlbWVudAo+ID4gPiArICAgICogdGhpczsgb3RoZXJzIGNhbiBsZWF2ZSBpdCBOVUxMLgo+ID4g
PiArICAgICovCj4gPgo+ID4gSWYgdGhlIGhhcnQgc3VwcG9ydHMgU21ybm1pLCB0aGVuIGl0IGJl
Z2lucyB3aXRoIG5tc3RhdHVzLk5NSUU9MCwgd2hpY2gKPiA+IG1lYW5zIHRoYXQgYW55IGV4Y2Vw
dGlvbiBpcyBnb2luZyB0byBlbnRlciBhIGNyaXRpY2FsIHN0YXRlLgo+ID4gVGhlIHBsYXRmb3Jt
IG11c3Qgc29tZWhvdyBzdXBwb3J0IFNtcm5taSB0byBiZSB1c2VmdWwsIGFuZCBJIHRoaW5rIGl0
Cj4gPiB3b3VsZCBiZSBiZXR0ZXIgbm90IHRvIGRvIGl0IGJlaGluZCBvcGVuc2JpJ3MgYmFjay4K
PiA+Cj4gPiBJZiB0aGUgcGxhdGZvcm0gd2FudHMgdG8gaGFuZGxlIFNtcm5taSBpdHNlbGYsIGl0
IGNhbiBoaWRlIFNtcm5taSBmcm9tCj4gPiBvcGVuc2JpLCBzbyBJIHRoaW5rIHRoZSByZXF1aXJl
bWVudCBoZXJlIHdvdWxkIGJlIGJldHRlciBhcyBNVVNULgo+ID4KPiA+ID4gKyAgIGludCAoKnNl
dF9ybm1pX3RyYXBfdmVjdG9yKSh1aW50cHRyX3QgaGFuZGxlcl9hZGRyLCBib29sIGNvbGRfYm9v
dCk7Cj4gPiA+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9pbml0LmMgYi9saWIvc2JpL3NiaV9p
bml0LmMKPiA+ID4gQEAgLTI3Myw2ICsyNzMsMTAgQEAgc3RhdGljIHZvaWQgX19ub3JldHVybiBp
bml0X2NvbGRib290KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgdTMyIGhhcnRpZCkKPiA+
ID4gICAgIGlmIChyYykKPiA+ID4gICAgICAgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+ID4gPgo+
ID4gPiArICAgcmMgPSBzYmlfcm5taV92ZWN0b3JfaW5pdChzY3JhdGNoLCB0cnVlKTsKPiA+Cj4g
PiBBcmUgd2Ugc3VyZSB0aGF0IGVhcmxpZXIgb3BlbnNiaSBjb2RlIHdvbid0IHRyeSB0byB0cmln
Z2VyIGEgdHJhcCBiZWZvcmUKPiA+IHRoaXMgcG9pbnQ/ICBPcGVuU0JJIHdvdWxkIGZhaWwgdG8g
Ym9vdCBpZiBpdCBkaWQuLi4KPgo+IFRoaXMgYXBwZWFycyB0byBjb21lIHJpZ2h0IGFmdGVyIHNi
aV9oYXJ0X2luaXQoKSB3aGljaCBkb2VzIGEgYnVuY2ggb2YKPiBDU1IgZGV0ZWN0aW9uIHVzaW5n
IHRyYXBzLCBzbyBJJ20gbm90IHN1cmUgaWYgaXQgY2FuIHdvcmsuCgpXaHkgbm90ID8KCj4KPiBF
dmdlbnkgKCtjYykgaGFzIGJlZW4gZG9pbmcgYSBsb3Qgb2Ygd29yayB0byBlbmFibGUgU21ybm1p
IG9uIEFzY2Fsb24KPiBhbmQgdW5mb3J0dW5hdGVseSB3ZSBkaWQgbm90IHNlZSB0aGVyZSBpcyB0
aGlzIGR1cGxpY2F0ZSB3b3JrIGhhcHBlbmluZwo+IHVwc3RyZWFtLiBIaXMgY2hhbmdlcyBhbHNv
IGhhcyBhIGZldyBvdGhlciB0aGluZ3Mgc3VjaCBhcyBSTk1JIGV4Y2VwdGlvbgo+IHZlY3RvciBz
ZXR0aW5nLCBwZXJtaXRzIGEgcGxhdGZvcm0gc3BlY2lmaWMgaGFuZGxlciwgYW5kIGhhcyBhbiBB
c2NhbG9uCj4gcGxhdGZvcm0gaW1wbGVtZW50YXRpb24uCgpUaGlzIGlzIGV4YWN0bHkgd2h5IHVw
c3RyZWFtaW5nIHNob3VsZCBiZSBwcmlvcml0aXplZCBzbyB0aGF0IHBlb3BsZQpjYW4gbGV2ZXJh
Z2UgZWFjaCBvdGhlcnMgd29yay4KCj4KPiBTbyBJIGFza2VkIGhpbSB0byBwb3N0IHdoYXQgaGUg
aGFzLiBUaGUgaW50ZW50aW9uIGlzIG5vdCB0byBkaXNyZWdhcmQKPiB0aGlzIHNlcmllcywgYnV0
IHRvIGp1c3Qgc2hvdyB3aGF0IGhlIGhhcy4gSG9wZWZ1bGx5IHRoZSBiZXN0IG9mIGJvdGgKPiBj
YW4gYmUgdXNlZC4KPgo+IFRoYW5rcywKPiBOaWNrCj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBs
aXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
