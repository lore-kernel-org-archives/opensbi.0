Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDF2D29C32
	for <opensbi@archiver.kernel.org>; Mon, 19 Jan 2026 17:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Dq7e9KAw7EKAlyeM/90XfQEzja14f+6rsVFGwsBuGc=; b=jMWVYoZz0mNtms
	mKsIFVkYs1/9b7GjTY0anvfKULZ1n5oqJTcH/yU5TkN4s3BPLkai2g2IxQMnXedltORV2+eTbH5Yo
	c1sGcyjcg3k96xp6jW4GsGem192BPZVcYkj8/wxXzG+Bspoi2ecAzutFXjRr33y1Gh6i6j7w8HS/F
	x/pAOf1MzQxhf8G5/gTwqZplFReN2GvNdrCzqtdq8YIzKeDQVG5Rq13mkWW5bayM3uYCaGYsnRWdt
	ciaw2aci/pnwE5JVxW9DJuwqIjK3YeX6wgcvC1ryuOZCzgW6G4TDtUZmGyhY4a3OfjCFTjmDqAvC6
	Pq0qbVd/KvcY1lVqM9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vht8G-00000002eby-0zhx;
	Mon, 19 Jan 2026 17:33:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vht8A-00000002eaa-1bv2
	for opensbi@lists.infradead.org;
	Mon, 19 Jan 2026 17:33:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b87dba51442so177889066b.1
        for <opensbi@lists.infradead.org>; Mon, 19 Jan 2026 09:33:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768844012; cv=none;
        d=google.com; s=arc-20240605;
        b=XPmsLSd7Gq20BAIZtpmapArjEIOwz/xnrfy82pikbA7RjxWt5b4A8X+6+sqmlDGzX7
         5uJrxQtibm8rtceF6jnw4Zhm8mu0ZeJuxGTZdqGvI5Go2LSPCKrc+WEOtCRTfKrl+A19
         m9zgd3E+MD7UIT+u9GPUOGXSL8Ad/MCTrDLNneCPLFYuzP18msLbDqRHjKKpwQAC/0nr
         vsQHbiR3UZ7G7guEeoboem0sWihOoR/X7GbzLLcgaLwfxxeiIau86nii7WuQJWbPlCxh
         t4YX9VnzyDBkSHy4KUY1cc+mTY4BSGxq7uUJr3nla0UAtBVpW1nsZqlwrxJQoBbAnF9b
         VjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QJf4ieZeAo0u6DUn0Jx9H6SLr4IvTP1LzIMZ8NPV5uA=;
        fh=9rLICmLJkWhHj2oGpu5wfdQG6Y35lTniRRoOEGQpizg=;
        b=KEYVZ8Xzhm4CFt3oA4LPdpY4byTD50PR9ugNI4rSIVm5XdUm39tlhajWacGTbAncgf
         5XUj5+ZU1ygzJZNpxJ5Jl9s6JgcDf7MprAyJ/QTKKPEZnIpVYarzkg2nacX5eMbBU/yB
         9+hg7Up022NJRzhSMTjn5Ia6dSnE/dSts1Kx8Ga8sYNa8acDQsdce2E0BEgiCJpCAnvx
         TgisWPENk0fWqqAJsHgZlUl9uYosLTlJfliQB440/2fD0StlfVF5YBpLKXbLquJIah06
         /iF+/SGht/4J1YdINJZFZBN3llm5wQJT7pEyBwVBSNbQ/u7HGJRiD0juYTRWzAtGYpLp
         Xazw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768844012; x=1769448812; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJf4ieZeAo0u6DUn0Jx9H6SLr4IvTP1LzIMZ8NPV5uA=;
        b=hTD6EClkIvwDt1JI1q08dxHc+okvLXvfepew74GY2I8t43wfeKZCVIaTVhyoYelF60
         ka67IZVblqM4bIJ+2YcRyqncNEwPc4/fZM6mv2be0A9YQWZjVH4jUjndCH5asHkNwhhS
         ejdNkjkH4IwruTyEBrs93GCb/O+9l3F6pZR8lfOFTwZ+1BnKVgIK0yaq+EBivzlnFctS
         hzlGRFqYy8D/57aLNDKld8JJVuMmGV+99ydwU/PvSldk3crAcjzL67lYmyk1aXt/wnwk
         KM6S9KICq+Cu3YfAM9vocUyuOFM+O81JbFJepaJs8xSQxEExcRf9yNRgxiHcAwZu4wcK
         G3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768844012; x=1769448812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QJf4ieZeAo0u6DUn0Jx9H6SLr4IvTP1LzIMZ8NPV5uA=;
        b=myeSKaue80VbZFJM4yV8R2tCUeTDAIg847Yo8rn12OGSYRmF6m1GV1VN7nSTSwh8BM
         XSrhnZeS16yZpVeTORijjsBfzU9N/ucUfGT9SWmxLmkaiQn+iy5VUbcD1nrhC+gH1Ip9
         djaZ74xtNjYsxr7rPRHiTNDz1cwIMpybXPf6lW5gp/mtxd0ydG5tKR1Yhc0HkJsEQFpD
         q0iPUFVCaWwKDqcs4dlIa568RefKO3BUwsK9hAUyJN5dFEX4fMHEgQG23BgWNuuiTQoI
         1bOeBmY6pk4KJkjc2Yq8cxcoF4kIAybMNTrXb/N5l79iZyA40a+UQZ8+L39suxVCZJXW
         C1IA==
X-Forwarded-Encrypted: i=1; AJvYcCUhozdIayEWeAFU6nZmrn3jVYHTKYT/9R5B+YH/K6UI0lDKGG0eUOOpX3W/tNUSBadTaGmqAr9b@lists.infradead.org
X-Gm-Message-State: AOJu0YxbDrd58HDEpoVUnsdbJjloY/AJDYbgjBlNzAQ220d3cYCC2QZw
	MOVkcgHecVQkva0TKpKr/shH5gSo9S0HZ5X74WNXeNCbsamJM0ftAW7fyidpOa/nchoFYzsoTtW
	tI0/zzVbtilJzcv7vYITh6ROA7PPbl2s=
X-Gm-Gg: AY/fxX6zJmk7DXtEeQvyysXGnuvaJ8zzWkAJbFoL7lEGNglLtbs2AshhcVne3qHpuPF
	2YOaZK/nN2aXoYz9AouSLzjtLJunMS1Z+TbFr5JAgYj0trsFQzc8k7Xyqw/VlJ1Z84GmeLTwrOU
	EUkYNp0mA5AP1FojcmnQoeNRD8I51ljXUlwBRy6AqB0GfyCSX91yU5wVa4L0kE0NpBAGXib3GPs
	I/F2E8q8g0yJjcEHBeOjAWRyY5ZDC/6oZFia4guyITe8OJDLx0SIAWjp2ERhMm/3H4AGLbAuopk
	2DhWsw==
X-Received: by 2002:a17:907:6d2a:b0:b87:2410:5956 with SMTP id
 a640c23a62f3a-b8793035670mr1194017966b.47.1768844011678; Mon, 19 Jan 2026
 09:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20260117125031.56031-1-jamestiotio@gmail.com> <DFSJPWHEF293.2Z6H79QH3IDXR@oss.qualcomm.com>
In-Reply-To: <DFSJPWHEF293.2Z6H79QH3IDXR@oss.qualcomm.com>
From: James R T <jamestiotio@gmail.com>
Date: Tue, 20 Jan 2026 01:32:54 +0800
X-Gm-Features: AZwV_QiDk9pq-XobThtChCiwpB4SG0R5XOv4r7YOBwVR1Gifd_jyvDYoHcIIoU4
Message-ID: <CAA_Li+u6p1WSwYEW_EVyfQYrZ+yvFjdHbHZh8=wuJVAkuKfy6Q@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: Add FW counter index validation when
 reading high bits on RV64
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev, atishp@rivosinc.com, 
	opensbi <opensbi-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_093334_441103_FE4A339A 
X-CRM114-Status: GOOD (  26.66  )
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgNzo1N+KAr1BNIFJhZGltIEtyxI1tw6HFmQo8cmFkaW0u
a3JjbWFyQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gMjAyNi0wMS0xN1QyMDo1MDozMSsw
ODowMCwgSmFtZXMgUmFwaGFlbCBUaW92YWxlbiA8amFtZXN0aW90aW9AZ21haWwuY29tPjoKPiA+
IEN1cnJlbnRseSwgd2hlbiB3ZSBhdHRlbXB0IHRvIHJlYWQgdGhlIHVwcGVyIDMyIGJpdHMgb2Yg
YSBmaXJtd2FyZQo+ID4gY291bnRlciBvbiBSVjY0IG9yIGhpZ2hlciwgd2UganVzdCBzZXQgYHNi
aXJldC52YWx1ZWAgdG8gMCB3aXRob3V0Cj4gPiB2YWxpZGF0aW5nIHRoZSBjb3VudGVyIGluZGV4
LiBUaGUgU0JJIHNwZWNpZmljYXRpb24gcmVxdWlyZXMgdXMgdG8gc2V0Cj4gPiBgc2JpcmV0LmVy
cm9yYCB0byBgU0JJX0VSUl9JTlZBTElEX1BBUkFNYCBpZiB0aGUgY291bnRlciBpbmRleCBwb2lu
dHMgdG8KPiA+IGEgaGFyZHdhcmUgY291bnRlciBvciBhbiBpbnZhbGlkIGNvdW50ZXIuIEFkZCBh
IHZhbGlkYXRpb24gY2hlY2sgdG8KPiA+IGVuc3VyZSBjb21wbGlhbmNlIHdpdGggdGhlIHNwZWNp
ZmljYXRpb24gb24gUlY2NCBvciBoaWdoZXIuCj4gPgo+ID4gRml4ZXM6IDUxOTUxZDllOWFmOCAo
ImxpYjogc2JpX3BtdTogSW1wbGVtZW50IHNiaV9wbXVfY291bnRlcl9md19yZWFkX2hpIikKPiA+
IFNpZ25lZC1vZmYtYnk6IEphbWVzIFJhcGhhZWwgVGlvdmFsZW4gPGphbWVzdGlvdGlvQGdtYWls
LmNvbT4KPiA+IC0tLQo+Cj4gV2hpbGUgdGhlIGNhbGwgaXMgcG9vcmx5IHNwZWNpZmllZCBhbmQg
eW91ciBpbnRlcnByZXRhdGlvbiBpcyB2YWxpZCwKPiBJIHRoaW5rIHRoZSBpbnRlbnRpb24gaXMg
dG8gbWFrZSB0aGlzIGZ1bmN0aW9uIGRvIG5vdGhpbmcgZWxzZSB0aGFuCj4gcmV0dXJuIHtlcnIs
IDB9IG9uIFJWNjQgYXMgdGhlcmUgaXNuJ3QgbXVjaCByZWFzb24gdG8gY29tcGxpY2F0ZSB0aGUK
PiBpbXBsZW1lbnRhdGlvbi4KPgoKSSBkaXNjb3ZlcmVkIHRoaXMgd2hlbiBJIHdhcyB3cml0aW5n
IHNvbWUgUE1VIFNCSSB0ZXN0cyBmb3IKS1ZNLVVuaXQtVGVzdHMgYW5kLCBhdCBsZWFzdCB0byBt
ZSwgaXQgd2FzIHVuZXhwZWN0ZWQuIEkgdW5kZXJzdGFuZAp0aGUgaW50ZW50aW9uIGJlaGluZCBp
bXBsZW1lbnRpbmcgaXQgaW4gdGhlIHNpbXBsZXN0IHdheSBwb3NzaWJsZSwgYnV0Cml0IGRpZCBz
ZWVtIHRvIGRldmlhdGUgZnJvbSB0aGUgc3BlY2lmaWNhdGlvbiwgYXQgbGVhc3Qgd2l0aCBteSB3
YXkgb2YKcmVhZGluZyBpdC4KCj4gSSB0aGluayBhbHdheXMgcmV0dXJuaW5nIHtTQklfRUlOVkFM
LCAwfSB3b3VsZCBiZSBldmVuIGJldHRlciB0aGFuCj4gdGhlIGN1cnJlbnQge1NCSV9TVUNDRVNT
LCAwfSwgYnV0IGl0IGRvZXNuJ3QgbWF0dGVyIG11Y2ggc2luY2UKPiBsZWdpdGltYXRlIFJWNjQg
c29mdHdhcmUgc2hvdWxkbid0IGV2ZXIgaW52b2tlIHRoZSBlY2FsbC4KPgoKSWYgaXQgaXMgYmV0
dGVyIHRvIHJldHVybiB7U0JJX0VJTlZBTCwgMH0sIHRoZW4gbGV0J3MgZG8gaXQuIFRoYXQKc2Fp
ZCwgSSB0aGluayB3ZSBzaG91bGQgb25seSByZXR1cm4gdGhhdCBvbiBhbiBpbnZhbGlkIGNvdW50
ZXIgaW5kZXgsCm5vdCBhbHdheXMuCgo+ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3BtdS5j
IGIvbGliL3NiaS9zYmlfcG11LmMKPiA+IEBAIC0yMjcsNiArMjI3LDE0IEBAIHN0YXRpYyBib29s
IHBtdV9jdHJfaWR4X3ZhbGlkYXRlKHVuc2lnbmVkIGxvbmcgY2Jhc2UsIHVuc2lnbmVkIGxvbmcg
Y21hc2spCj4gPiAgICAgICByZXR1cm4gY21hc2sgJiYgY2Jhc2UgKyBzYmlfZmxzKGNtYXNrKSA8
IHRvdGFsX2N0cnM7Cj4gPiAgfQo+Cj4gSW4gY2FzZSBvZiBkaXNhZ3JlZW1lbnQgd2l0aCB0aGUg
YWJvdmU6Cj4KPiA+ICtpbnQgc2JpX3BtdV9pc19md19jdHJfaWR4KHVpbnQzMl90IGNpZHgpCj4g
PiArewo+Cj4gVGhpcyBmdW5jdGlvbnMgZ2V0cyBwYXNzZWQgcmVncy0+YTAsIHNvIGNpZHggc2hv
dWxkIGJlIGFuIHhsZW4gc2l6ZWQKPiB0eXBlLgo+IChJIHVuZGVyc3RhbmQgdHJ5aW5nIHRvIGJl
IGNvbnNpc3RlbnQsIGFzIHNiaV9wbXVfY3RyX2Z3X3JlYWQgaGFzIHRoZQo+ICBzYW1lIGJ1Zywg
YnV0IGJldHRlciBmaXggcmVsYXRlZCBjb2RlIHdoZW4gdG91Y2hpbmcgaXQuKQo+CgpTdXJlLCBJ
IHdpbGwgaW5jbHVkZSB0aGUgZml4IGZvciB0aGlzIGluIHYyIHRoZW4uCgo+ID4gKyAgICAgaWYg
KGNpZHggPCBudW1faHdfY3RycyB8fCBjaWR4ID49IHRvdGFsX2N0cnMpCj4gPiArICAgICAgICAg
ICAgIHJldHVybiBTQklfRUlOVkFMOwo+Cj4gUGxlYXNlIHJlZmFjdG9yIHRoZSBjaGVjayBpbiBz
YmlfcG11X2N0cl9md19yZWFkLCBhbmQgdXNlIGl0IGluc3RlYWQgb2YKPiBhZGRpbmcgbW9yZSBs
b2dpYy4KPgoKR290IGl0LiBXaWxsIGRvIHRoYXQgaW4gdjIuCgo+IFRoYW5rcy4KClRoYW5rIHlv
dS4KCkJlc3QgcmVnYXJkcywKSmFtZXMgUmFwaGFlbCBUaW92YWxlbgoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
