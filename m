Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0618EC79FA1
	for <opensbi@archiver.kernel.org>; Fri, 11 Sep 2026 07:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9a8qHbqobcogJ9nsmP6pAxwhA3Q7OEQNtwxQ4iAd08=; b=QI3hwC82V9Sl/9
	5LS/6sF9cQQwebeVxdHZQBlu84iLDbwLfKvyIsOOuGJ+f9bp8wQbLyWjIJ6Rmg1A5+bfMAObthuYE
	dHuAb3N/87znfMab0n+5t5/UPWdS0L2Vi/bau0W8UIka9mYxfVykqHw8q/Cn+x3cn7iu84cYfAVpx
	DA0o2zKNoskvuXXK22JzF1P506eQiZjNSSQ1IpeCAha5dIw392jsNdXje8DwIZUHK5ZCuXik3E8Bm
	+qjQD3avUxgksXs3ezEeBNnmvpWlkz9pyIUZyqbdhSE82ZItxWUASWucs8JFFv+qIwGtFBSwF7SIC
	2baM6awAHLajZs6E1wbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vcv-0000000G12i-1xX1;
	Fri, 11 Sep 2026 07:24:49 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vct-0000000G11G-2l9p
	for opensbi@lists.infradead.org;
	Fri, 11 Sep 2026 07:24:48 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-5c83cec28f3so345765e0c.0
        for <opensbi@lists.infradead.org>; Fri, 11 Sep 2026 00:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789111486; cv=none;
        d=google.com; s=arc-20260327;
        b=Ii0mG0LDiVn4ZiM/kvAPFeLmW+m5cOW0f5ihK6aUCgPCfhqrSAW1+sUrHoASlp2VWu
         od5nuReHDqljOteh/h6g5Zf0RwtP7asPaQMg3krsioTkOe1UllQite+97aKhxNE2G9Dv
         rgGkoD82K3HpckmQise/dxNhHHQXvOJrox6ZiZFtXiN7dcg5d8RZdjHep2Or9gX0cP9N
         4GBS00rYFzw+MJrmlTYWggeXYLGvyM5od5CAvXqJLJYSLYBDnh6dptR2KdhsjiKji9/v
         zRROyfuTsIF442wQ9ooeBFwGIHF3JG3476/yT6N5WwaNdBr5FP77hCQmkJpPga61GPgR
         4Yqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cyZSXyfgFNOSWcggffOdbr6TqTOUmHybwU9wK4Mk03g=;
        fh=UeEtZRTkxKCY0dDrSlBwJELwBYPbryPqFzipvp9MKzg=;
        b=rqoiY+Pu0kbQtLjYXJ3c5KZOmBO9W9No6bK1zu0cSwxwYwA0e2NI1AYlhYYWtESLwr
         k4PKTkNxGi1+ulx7tz9TtiQ0UmlxmEUbtianHiAKfwpgHUJLYMVq5JR7KFMlF5J/lpcg
         wBkh9RsYeGT176gs7SetdlRPqIX2D/LPz5xSUd4QUsWBuEGnUbahDphfVoFR6YK7yTBr
         YCTkiWGuht4OzetU99SLVr41pTWl4iu34PWZAlxYWoyneHghP/E5g31M6dmgjAbMyWgK
         hwzV9b4fOv6vkAgt547JZmMnxSKpAB/ALIYt/2MMhwVKKOn/pgZzCOvNTxqfgB+Pc4lm
         Co8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789111486; x=1789716286; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cyZSXyfgFNOSWcggffOdbr6TqTOUmHybwU9wK4Mk03g=;
        b=ikDZo+XgUJnK39/HtzttybSRnpF7NOZcmeOqkvgkIQaG54pS3cB5PavBYOR1znzFaK
         Jn6bUOiyHL9QcRKn3r7I7cpoDecg6zSx//cytVMAP3KTX4imoCBTbndQRuumKf6riMjm
         iER6E5P48iNj52y0s6QVF9cGAc0UCycIIMAyJYTf7fLiI87wSG8XRBFhOFY7GOAQOOqa
         vkPEllFcM5moKKYMowosLhZ8vz7cyVztJaaFCb7+V+RnTcPAaVKwvfmkqwQJLE+ysFnX
         aabPPBbzVRK1EEc035FTlQdmmwOnNhrejl2k88IE5VK8y+dy3tfOCeVgadPklr5hDMDK
         DIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111486; x=1789716286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyZSXyfgFNOSWcggffOdbr6TqTOUmHybwU9wK4Mk03g=;
        b=ZAaPXC33aXlnCcqtq7wm3sKNsPkqJSq15YSp45txTZrutqMxwOOGoZpYnHV5fJH8iy
         KLE6vj/xA70e0r3MB9mh1iQ4c+cgeRVzwhEvCfd/piljWfnMcNmNUCDGzpeOr+uiHty0
         oDrFk2zn1jjPyqwTpK+yZrzr/zVbjfu8XKtxMm4ezeAK5x8a4RckBnK8mdAEzwfCtzVS
         rAb322TRWYDLf1bwJzum19tZaIMbQHWK68twX3t9LgkTFdGHsOhm7Tb4Xp0b6fMtRCQB
         8CdZVQyg0Wow5kZGmf939sKMEY9qhbgPQFYNV377uPH6vflrxwoPERn5BEZnNGFlXfQV
         e8Nw==
X-Gm-Message-State: AFuF++mgLQYJREAYrozC0aPxbB8UF72bdTvIbFrcFZ/uUhv0CZJT0v7b
	A3bvr9TyjX5QaFCZ7Cv4XuMUsYRHGLf0xH2GYn0tADq1kjYpmTLO9L/9KmHia7musNZX+jpX8vo
	T6Peor/hX07gY6FrXUehoGHPKgdSNzk0EftGQU9wUeg==
X-Gm-Gg: AYBFou1231qbyqyRoT2sc2indXx0zzjPOFZvRQmuzpW4ez5E4PisxZuTFY3YClX4geQ
	gHi2aZ1fXQwQmsebXNgXTiydx4CzRHdVGeAXBHGu9NQL6VjyLhVO2R975q4v2BN57H6GyXTtEm3
	RV5Tb3XqUMhqbkPZuTmY7y180a7qiz65ymmxxFGCqa2PdvUwrXGWqHpxULOV4SIWle/6IBVvOk+
	/gYfyXiSsdLU78W/+RJ45zbnxWLniowtIQLCkLAVnlwkqxxdG+Jn/8q8k7cLm4obVgPnW3ciqsP
	6smLflhnPOHEZsLXCVRADszLxNM0HH3TQ/FKTWspQsZPqlceNc1ZixjTcA==
X-Received: by 2002:a05:6122:794:b0:5bd:af82:fd9e with SMTP id
 71dfb90a1353d-5c84632bb1dmr3788120e0c.8.1789111486415; Fri, 11 Sep 2026
 00:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260903-smrnmi-context-restore-v2-0-10b17506d257@sifive.com> <20260910185840.12169-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260910185840.12169-1-evvoevod@tenstorrent.com>
From: Nia Su <nia.su@sifive.com>
Date: Fri, 11 Sep 2026 15:24:34 +0800
X-Gm-Features: AcwNN1U7BFPjRUOvleNSTFZw09tJMTPVIzAh8lMkYevIteYUPRL-hDhL8_kN2B8
Message-ID: <CACpYXwAACrdFcxTpNUgdsk6xGQ3yMRti6jFD_ui-EDH7WtyBaw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] lib: sbi: Fix Smrnmi resume init and optional
 platform callback
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_002447_727223_BE8F0FE5 
X-CRM114-Status: GOOD (  18.16  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMjo1OOKAr0FNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IFBhdGNoIDEvMywgdHdvIHRoaW5ncy4KPgo+
IC0gSSdkIHB1dCB0aGUgc2JpX3Ntcm5taV9oYXJ0X2luaXQoKSBjYWxsIGluIHRoZSBiZWdpbm5p
bmcgb2YKPiAgIHNiaV9oYXJ0X3JlaW5pdCgpIHRvIGluaXRpYWxpemUgdHJhcCBoYW5kbGVycyBl
YXJseS4KPgo+IC0gV29ydGggbm90aW5nIHRoYXQgYWZ0ZXIgdGhpcyBjaGFuZ2Ugd2UgaGF2ZSBz
Ymlfc21ybm1pX2hhcnRfaW5pdCgpCj4gICBjYWxsZWQgdHdpY2Ugb24gY29sZCBib290LCBvbmUg
ZnJvbSBoYXJ0X2RldGVjdF9mZWF0dXJlcygpIGFuZCBhbm90aGVyCj4gICBmcm9tIHNiaV9oYXJ0
X3JlaW5pdCgpIGF0IHRoZSBlbmQgb2Ygc2JpX2hhcnRfaW5pdCgpLiBBcyBsb25nIGFzCj4gICBw
bGF0Zm9ybSdzIHNtcm5taSBjb250ZXh0IGluaXRpYWxpemF0aW9uIGFsbG93cyBpdCwgdGhpcyBk
b2Vzbid0IGJpdGUuCj4gICBQbGVhc2UgbWVudGlvbiBpdCB3aGVyZSBzbXJubWlfaGFuZGxlcnNf
aW5pdCBpcyBkZWNsYXJlZCBpbgo+ICAgc2JpX3BsYXRmb3JtLmgsIHNvIGEgcGxhdGZvcm0ga25v
d3MgdGhlIGNhbGxiYWNrIGNhbiBiZSBjYWxsZWQgbW9yZQo+ICAgdGhhbiBvbmNlIG9uIHRoZSBz
YW1lIEhBUlQuCgpMb29rcyBnb29kLCBJJ2xsIGFkb3B0IHRoZSBhYm92ZS4KCj4gUGF0Y2ggMy8z
LCB0d28gdGhpbmdzLgo+Cj4gLSBHbG9iYWwgdmFyaWFibGUgaXMgcmFjeSBiZWNhdXNlIGV2ZXJ5
IGhhcnQgd3JpdGVzIHNtcm5taV9pbml0X21vZGUgYW5kCj4gICBib290IGhhcnQgcmVhZHMgaXQu
IEhvdyBhYm91dCBtYWtlIHRoZSBiYW5uZXIgc3RhdGVsZXNzOgo+Cj4gICAgICAgY29uc3Qgc3Ry
dWN0IHNiaV9wbGF0Zm9ybSAqcGxhdCA9IHNiaV9wbGF0Zm9ybV90aGlzaGFydF9wdHIoKTsKPgo+
ICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9T
TVJOTUkpKQo+ICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiQm9vdCBIQVJUIFNtcm5taSBJbml0
ICAgICAgIDogJXNcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHBsYXQgJiYgc2JpX3Bs
YXRmb3JtX29wcyhwbGF0KS0+c21ybm1pX2hhbmRsZXJzX2luaXQgPwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAiUGxhdGZvcm0iIDogIkRlZmF1bHQiKTsKPgo+ICAgYWxzbyB0aGlzIGlzIGxp
Z2h0d2VpZ2h0IGFuZCBjbGVhcmx5IGRlc2NyaWJlcyB0aGUgc3RhdHVzLiBUaGVuCj4gICBzbXJu
bWlfaW5pdF9tb2RlLCB0aGUgZW51bSBhbmQgc2JpX2hhcnRfZ2V0X3Ntcm5taV9zdGF0dXNfc3Ry
KCkgYXJlCj4gICBub3QgbmVlZGVkLgoKQ2hlY2tpbmcgc2JpX3BsYXRmb3JtX29wcyhwbGF0KS0+
c21ybm1pX2hhbmRsZXJzX2luaXQgb25seSB0ZWxscyB1cyBhCmNhbGxiYWNrIGV4aXN0cywgbm90
IHRoYXQgaXQgc3VjY2VlZGVkLiBUaGUgY3VycmVudCBjb2RlIG9ubHkgbWFya3MKIlBsYXRmb3Jt
IiBhZnRlciBpdCBhY3R1YWxseSByZXR1cm5zIHN1Y2Nlc3MuIFRvIGtlZXAgdGhhdCB3aXRob3V0
IGEgcmFjeQpnbG9iYWwsIEknZCBzdG9yZSB0aGUgc3RhdGUgcGVyLUhBUlQgaW5zdGVhZDoKCnN0
cnVjdCBzYmlfaGFydF9mZWF0dXJlcyB7CiAgICAgIC4uLgogICAgICBlbnVtIHNiaV9oYXJ0X3Nt
cm5taV9pbml0X21vZGUgc21ybm1pX2luaXRfbW9kZTsKfTsKCnN0YXRpYyBpbnQgc2JpX3Ntcm5t
aV9oYXJ0X2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQp7CiAgICAgIHN0cnVjdCBz
YmlfaGFydF9mZWF0dXJlcyAqaGZlYXR1cmVzID0gc2JpX2hhcnRfZmVhdHVyZXNfcHRyKHNjcmF0
Y2gpOwogICAgICAuLi4KICAgICAgaWYgKG9wcyAmJiBvcHMtPnNtcm5taV9oYW5kbGVyc19pbml0
KSB7CiAgICAgICAgICAgICAgcmV0ID0gb3BzLT5zbXJubWlfaGFuZGxlcnNfaW5pdCguLi4pOwog
ICAgICAgICAgICAgIGlmIChyZXQpCiAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owog
ICAgICAgICAgICAgIGhmZWF0dXJlcy0+c21ybm1pX2luaXRfbW9kZSA9IFNCSV9IQVJUX1NNUk5N
SV9JTklUX1BMQVRGT1JNOwogICAgICB9IGVsc2UgewogICAgICAgICAgICAgIGhmZWF0dXJlcy0+
c21ybm1pX2luaXRfbW9kZSA9IFNCSV9IQVJUX1NNUk5NSV9JTklUX0RFRkFVTFQ7CiAgICAgIH0K
ICAgICAgLi4uCiAgICAgIHJldHVybiAwOwp9Cgo+IC0gQWxzbywgSSBkaWRuJ3Qgc2VlIGEgcGxh
dGZvcm0gZmxhZyB0byBpbmRpY2F0ZSB0aGF0IGl0IGRvZXNuJ3QgbmVlZCB0bwo+ICAgaW5pdGlh
bGl6ZSBTbXJubWkgaGFuZGxlcnMgc28gdGhhdCBib290IGNvZGUgY2FuIHByb2NlZWQgd2l0aG91
dAo+ICAgc21ybm1pX2hhbmRsZXJzIGluc3RhbGxlZC4gRGlkIHlvdSBwbGFuIHRvIGFkZCBpdD8K
CkEgc2VwYXJhdGUgZmxhZyBpc24ndCBuZWVkZWQgaGVyZS4gV2l0aCB0aGlzIHBhdGNoLApzbXJu
bWlfaGFuZGxlcnNfaW5pdCA9PSBOVUxMIGFscmVhZHkgc2VydmVzIGFzIHRoYXQgc2lnbmFsLgpz
Ymlfc21ybm1pX2hhcnRfaW5pdCgpIG5vIGxvbmdlciBwYW5pY3Mgb24gYSBtaXNzaW5nIGNhbGxi
YWNrLAppdCBqdXN0IGZhbGxzIGJhY2sgdG8gdGhlIHBsYXRmb3JtJ3MgZml4ZWQvbXR2ZWMgTk1J
IHZlY3RvciBhbmQKY29udGludWVzIGJvb3QKClRoYW5rcywKTmlhCgo+ICAgVGhhbmtzLAo+ICAg
RXZnZW55CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
