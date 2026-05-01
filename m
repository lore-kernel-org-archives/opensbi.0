Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B4FFF885A
	for <opensbi@archiver.kernel.org>; Fri,  1 May 2026 03:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9I/pR/BM/7oDOIdB763hxSns35sjJgtolh9iPfz0Hpw=; b=U/YipFWaN7RLh2
	9VyF3nAff98iepAOWgr2yra5RNAb4pYRtLjwkqHa5C242QBgpJxLybnyrUCWGOT+CgPPuEIkq3DcH
	SFhENQTa9+sql6vtg9wL0YUHEts0cAY6dqvMOVIbxxoogSn3wAkzXXIBrqzEi8CpSQc1RmK8Asov0
	3R58VqQ+sxbPbc0Re+eRphWzEkcAhSSXQU0/FZlxAxZspyyNDuz2xCwYu1Bb32mXH79JY3htTkeaZ
	DgFs6lMUnWhVo2LMi28XAssoA3L7u0n/cpZU9zfgpvma14xVeJJNAQ+TSwJeoCWHHM7tBkt+yU+th
	w4I1XA/XyUbAKoZ0/EfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIefD-00000006INf-2jfN;
	Fri, 01 May 2026 03:35:39 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIefA-00000006IMz-20hj
	for opensbi@lists.infradead.org;
	Fri, 01 May 2026 03:35:37 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a40b2d268bso1188584e87.3
        for <opensbi@lists.infradead.org>; Thu, 30 Apr 2026 20:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777606533; cv=none;
        d=google.com; s=arc-20240605;
        b=gfBILPNnfY4xv609U/qaCL5zf+JshOu6apJXLW2wEMJgf2+FLjSktB8NI0icD73vX5
         2zrBnuxzQW0r0b6BRRwdTUDU2NHAR9wN+lcEE39bykJqMMQfe/HDgNUeSI+pErfnJ9XE
         vGFz+aplVax9mKlgl0pHtKG6BUHsNPu4xBY3gdPSiSEINT41Iw4L3sZrs6AG6EK4pbcL
         kyh9kSszigVOkqZOgn21aK3c85Aolpg5vmFc35+33SmBk8RKQILZg71mOAGCmxbieFjy
         57cf+JdWHsjMeZqa09kM50Hvgjvj4hE9erFMH2UsPCNibDD5OAWJzt8hE2ozNHLfBv2G
         +KNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qupTa8kgZUBCtGuXMPhDgM6kv+o1/9ulGs3qhetEmEU=;
        fh=e0TzurSEBtDlSMXWW/YDuWnxF4MUEr9usuwgLlh51cE=;
        b=SaEswa7Hid4ligfQ/bTBNmwbKoG+dTxy+tDFBw6RzSvriJbjTv/WwuQ83SOou2ULJi
         e/MIFYgc76/tLirvaTuGvj3n+62BRX6VDRDQrZw4CquW5YBmboXkKclbmpKHIQIOIa4E
         Sb2ERauPmBl1TvOG2x6I5FHZugQYc21mPB2XrWbgJnWae1bAUqBpwhd9L/fDwDyzFPfp
         2gFXroN43+p9Y3IWbVLx07X1DidR3vVV6lEvdGj2q0KoW3iOm3dyWB41RFG1/tn81EN4
         8+72YylIH03oSs9xVWevFzv1gQaUUH7wLG4y5ADpjbdz0SDvSvrgcadqRrBH5x7wjELo
         rXhA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1777606533; x=1778211333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qupTa8kgZUBCtGuXMPhDgM6kv+o1/9ulGs3qhetEmEU=;
        b=NtV1mwJOS6Ju2yEJWajozNy/e1Qtjp4u++3oU97YKNOS+HiQ1K6vDkB667oAX2arNz
         TBWmxmeAWjvsT4NvyAZCkCz53tRgF+NYUyp3opbDhiIzdGsMMfgf8F+jHZY5Y6XK7m+s
         qgIhm2t8F5VYSHZnOcW8wZGOysf5oYD1NT2NUjYCzKJzPrd0zX2+hKTj0uU8KTH7M3WY
         azYRBiYprK3uky63GImhwM5F3BFaTTVpm6ihHTMnHV8ZrSa/A2oJbBLBnKZle51OGes8
         TbNrixOIyorpne9Wm5myCYc8jjOsjEtJVPpfJirvg0QnDixiB0WLa1Qu/kuT3h48b77y
         6lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777606533; x=1778211333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qupTa8kgZUBCtGuXMPhDgM6kv+o1/9ulGs3qhetEmEU=;
        b=Eo7HlCGGHbxOIJOPjd/ki6p2yrbOyiqT75UA50rD6ArFaFpPQ2KXdZ9T1anxmSZTAS
         B7Wm4foUy2QpZ7VFZ8nd/ml8BKsDBgyKf+xUkgxwyxt6GBHauKMISgBRSqblNt9GtiHL
         Py/sQmHpTIClaL38X7GcuKg2+viZReYP0pM5E3myb3e4D1LxlNualwWXzPF5yDGhqTqk
         BkvaGmKgwlMjKcBSmDCJ/9EyOI4UsCd8f1Ngp4q60vob/BDmQENY9t8a9lEP9ALI99i3
         mJXcSzqdKQ4zjPRuxSVilWbATeIi5GYBKJHZUSVabuuCayeLk0skGpTo1TwB3y1em77k
         UeNQ==
X-Gm-Message-State: AOJu0YwCi/hj1avlc6nA5PArWdozsP2Aogv/BWCVK9mUhPP38+hmlpYu
	KRdSnxD35zwOH7Gh9fBmhDPbyl5+SrsozXZ2+ghtpMLsQffZlbIr/Yp+X/yNuvgfI3Shjy7DdQg
	nXBOk/hZoF55krlrtQLBj13HFW/N+1cwfLdGxm+icHg==
X-Gm-Gg: AeBDiet4WmHIqpvk3w/QazT4X4P+st7xIDCnfJEAZaKMbNKS5837ICcfkiKSzzbBbtc
	yFPxoNYoOYhuqFYiWfHLMAjsoqQv0scx5wtINpcGvmyAEpT+Pi+40HBFKHNWHQLYKfyh8jPLDRV
	IfAJhrotMMb7aT4R+KVkClwx/AZGn9RQXtt4oigSmWhjKESXRNtmxupA/WWEBaTc1kOBEgiSyw4
	CDMYuJ4QVRk0jSEoO1GEwmQSFRxnLhm18paLrnDLA3ilHMM/sRZTYZgZy77rfnsKBp7ntbRzAI0
	PgT2qdrwOP4iZ3WPjqVQwkJ40WC0kva2Jru31oFL0DcP8frY0sp0b0wo6BAhYg==
X-Received: by 2002:a05:6512:138a:b0:5a3:ff48:f7db with SMTP id
 2adb3069b0e04-5a85aeb0e7cmr430474e87.34.1777606532617; Thu, 30 Apr 2026
 20:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260430102313.95249-1-zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20260430102313.95249-1-zhangzhanpeng.jasper@bytedance.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 1 May 2026 09:05:20 +0530
X-Gm-Features: AVHnY4J0TJIVthOvBrl4vSUn9WJuNoV3Bv249S35nX_As5EIAgF9eKHNU2mBxgo
Message-ID: <CAK9=C2W2hMgfsGVpLDxqfiZOz2y3eeAAovSv1Xj8ZdJvBn=4Uw@mail.gmail.com>
Subject: Re: [PATCH 0/2] lib: sbi: sse: fix interrupted context corruption
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: opensbi@lists.infradead.org, cleger@rivosinc.com, anup@brainfault.org, 
	atishp@atishpatra.org, cuiyunhui@bytedance.com, yuanzhu@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_203536_575878_0312FD12 
X-CRM114-Status: GOOD (  22.67  )
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

T24gVGh1LCBBcHIgMzAsIDIwMjYgYXQgMzo1M+KAr1BNIFpoYW5wZW5nIFpoYW5nCjx6aGFuZ3po
YW5wZW5nLmphc3BlckBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IFNTRSBgaW5qZWN0YCBidWls
ZHMgYSBzeW50aGV0aWMgUy1tb2RlIGNvbnRleHQgdG8gZW50ZXIgdGhlIHJlZ2lzdGVyZWQKPiBT
LW1vZGUgaGFuZGxlci4gQWZ0ZXIgdGhlIGhhbmRsZXIgY2FsbHMgYGNvbXBsZXRlYCwgT3BlblNC
SSByZXN1bWVzIHRoZQo+IGNvbnRleHQgdGhhdCB3YXMgaW50ZXJydXB0ZWQgYnkgdGhlIFNTRSBl
dmVudC4gVGhhdCBtYWtlcyB0aGUgU1NFCj4gZW50cnkvY29tcGxldGlvbiBwYXRoIGRpZmZlcmVu
dCBmcm9tIGEgbm9ybWFsIGludGVycnVwdCBwYXRoOiB0aGUgc3RhdGUKPiB2aXNpYmxlIHdoaWxl
IHRoZSBoYW5kbGVyIGlzIHJ1bm5pbmcgaXMgbm90IG5lY2Vzc2FyaWx5IHRoZSBzdGF0ZSB0aGF0
Cj4gc2hvdWxkIGJlIHJlc3RvcmVkIHdoZW4gdGhlIGhhbmRsZXIgY29tcGxldGVzLgoKSWYgdGhl
IGhhbmRsZXIgd2FudHMgdG8gcmVzdW1lIHNvbWV3aGVyZSBlbHNlIHRoZW4gaXQgY2FuIGRpcmVj
dGx5CnVwZGF0ZSB2YXJpb3VzIEdQUnMsIHNzdGF0dXMsIGhzdGF0dXMsIGFuZCBldmVudCBhdHRy
aWJ1dGVzLiBUaGUKU0JJIGltcGxlbWVudGF0aW9uIGlzIG5vdCByZXF1aXJlZCB0byBoaWRkZW4g
c3RhdGUuCgo+Cj4gVGhlIGN1cnJlbnQgY29kZSByZWNvbnN0cnVjdHMgcGFydCBvZiB0aGUgaW50
ZXJydXB0ZWQgc3RhdGUgZnJvbSB0aGUKPiBoYW5kbGVyLXZpc2libGUgdHJhcCBzdGF0ZSBhbmQg
ZnJvbSB0aGUgQUJJLXZpc2libGUgaW50ZXJydXB0ZWQgZmxhZ3MuCj4gVGhhdCBleHBvc2VzIHR3
byBidWdzOgo+Cj4gICAtIEtWTSBDb250ZXh0IENvcnJ1cHRpb24KPgo+ICAgICBJZiBTU0UgaW50
ZXJydXB0cyBLVk0gZ3Vlc3QgZXhlY3V0aW9uLCBPcGVuU0JJIG11c3QgcmVzdG9yZSB0aGUKPiAg
ICAgdmlydHVhbGl6YXRpb24gc3RhdGUgdGhhdCB3YXMgYWN0aXZlIGJlZm9yZSBpdCBlbnRlcmVk
IHRoZSBTLW1vZGUKPiAgICAgaGFuZGxlciBjb250ZXh0LiBSZXN0b3Jpbmcgb25seSBoc3RhdHVz
IFNQVi9TUFZQIGlzIGluc3VmZmljaWVudCBvbgo+ICAgICBhIHZpcnR1YWxpemF0aW9uLWVuYWJs
ZWQgc3lzdGVtIGJlY2F1c2UgaHN0YXR1cyBjYXJyaWVzIG1vcmUgSC1tb2RlCj4gICAgIHN0YXRl
LiBMaWtld2lzZSwgTVBWIG11c3QgY29tZSBmcm9tIHRoZSBzdGF0ZSBjYXB0dXJlZCBiZWZvcmUK
PiAgICAgT3BlblNCSSByZXdyaXRlcyB0aGUgdHJhcCBzdGF0ZSBmb3IgaGFuZGxlciBlbnRyeS4g
UmVjb25zdHJ1Y3RpbmcKPiAgICAgdGhlc2UgdmFsdWVzIGZyb20gaGFuZGxlci12aXNpYmxlIHN0
YXRlIGNhbiBjb3JydXB0IHRoZSBLVk0gcmVzdW1lCj4gICAgIGNvbnRleHQuCgpUaGUgU0JJIFNF
RSBzcGVjIGludGVudGlvbmFsbHkgZXhwb3NlcyBwcmV2aW91cyB2aXJ0IHN0YXRlIHZpYQpoc3Rh
dHVzLlNQViBhbmQgcmVzdG9yZXMgaXQgZnJvbSB0aGUgc2FtZSBiaXQuIFRoaXMgYWxsb3dzIHN1
cGVydmlzb3IKc29mdHdhcmUgdG8gcmVzdW1lIGluIG5vbi12aXJ0IHN0YXRlIGFmdGVyIHRha2lu
ZyBTRUUgaW4gaG9zdCBmcm9tCnZpcnQgc3RhdGUuCgo+ICAgICBUaGlzIGZvbGxvd3MgdGhlIGVh
cmxpZXIgZGlzY3Vzc2lvbiBbMV0uCj4KPiAgIC0gU1NFIEhhbmRsZXIncyBTU1RBVFVTIExlYWth
Z2UKPgo+ICAgICBTU0UgY2FuIGludGVycnVwdCBrZXJuZWwgZXhlY3V0aW9uIGF0IGFueSBwb2lu
dCBhbmQgcnVuIGEgY29tcGxleAo+ICAgICBoYW5kbGVyLiBQTVUtU1NFIGlzIGEgcmVhbC13b3Js
ZCBleGFtcGxlOiB3aXRoIFBNVS1TU0UKPiAgICAgZW5hYmxlZCwgYHBlcmYgdG9wYCByZXBlYXRl
ZGx5IGVudGVycyB0aGUgU1NFIGhhbmRsZXIgYW5kIGNvbXBsZXRpb24KPiAgICAgcGF0aHMgYXQg
YSBoaWdoIGZyZXF1ZW5jeS4gQW55IHN5bnRoZXRpYyBoYW5kbGVyIFNJRS9TUElFL1NQUCBzdGF0
ZQo+ICAgICB0aGF0IGxlYWtzIGludG8gdGhlIFNTRS1pbnRlcnJ1cHRlZCBjb250ZXh0IGlzIHF1
aWNrbHkgZXhwb3NlZC4gV2l0aAo+ICAgICB0aGUgcHJldmlvdXMgdmVyc2lvbiwgdGhpcyBjb3Vs
ZCByZXN1bWUgd2l0aCBtaXNtYXRjaGVkIHByaXZpbGVnZSBhbmQKPiAgICAgaW50ZXJydXB0IHN0
YXRlIGFuZCBsZWFkIHRvIGFuICJlbnZpcm9ubWVudCBjYWxsIGZyb20gVS1tb2RlIiBwYW5pYy4K
Pgo+IEZpeCB0aGlzIGJ5IGFkZGluZyBPcGVuU0JJJ3MgcHJpdmF0ZSByZXN1bWUtc3RhdGUgdG8g
YHNiaV9zc2VfZXZlbnRgLgo+IFRoaXMgc3RhdGUgbXVzdCBwZXJzaXN0IGZyb20gYGluamVjdGAg
dG8gYGNvbXBsZXRlYCwgYnV0IGl0IG11c3Qgbm90IGJlCj4gc3RvcmVkIGluIHRoZSBTU0UgYXR0
cmlidXRlczogdGhlIGF0dHJpYnV0ZXMgYXJlIEFCSS12aXNpYmxlIGFuZCBjYW4gYmUKPiB1cGRh
dGVkIGJ5IHRoZSBTLW1vZGUgaGFuZGxlci4gUGF0Y2ggMSBzYXZlcyBhbmQgcmVzdG9yZXMgaHN0
YXR1cyBhbmQKPiB0aGUgaW50ZXJydXB0ZWQgdmlydHVhbGl6YXRpb24gc3RhdGUuIFBhdGNoIDIg
c2F2ZXMgYW5kIHJlc3RvcmVzIHRoZQo+IGludGVycnVwdGVkIFMtbW9kZSBTSUUvU1BJRS9TUFAg
Yml0cyBhcyBhIHVuaXQuCgpOQUNLLiBUaGUgT3BlblNCSSBpbXBsZW1lbnRhdGlvbiBpcyBzYXZp
bmcvcmVzdG9yaW5nIG1pbmltYWwKcG9zc2libGUgc3RhdGUgYXMgZGVmaW5lZCB0aGUgU0JJIFNT
RSBzcGVjLiBJdCBpcyBzdXBlcnZpc29yIHNvZnR3YXJlJ3MKcmVzcG9uc2libGl0eSB0byB1cGRh
dGUgdGhlIHN1cGVydmlzb3Igc3RhdGUgKGluY2x1ZGluZyBIUy1tb2RlKSBpZgppdCB3YW50cyB0
byByZXN1bWUgZnJvbSBzb21ld2hlcmUgZWxzZS4KCj4KPiBQQVRDSCAxIGlzIHRoZSBPcGVuU0JJ
IHNpZGUgb2YgdGhlIEtWTSBjb250ZXh0IGNvcnJ1cHRpb24gZml4LiBUaGUKPiByZWxhdGVkIExp
bnV4IHNpZGUgc2hvdWxkIHByZXNlcnZlIHRoZSBrZXJuZWwgc3R2ZWMgaW4gZG9fc3NlKCkgdG8g
aGVscAo+IHByb3RlY3QgdGhlIHZpcnR1YWxpemF0aW9uIGNvbnRleHQuIEkgd2lsbCBzZW5kIHRo
ZSByZWxldmFudCBMaW51eAo+IHBhdGNoc2V0IHVwZGF0ZXMgaW4gdGhlIG5lYXIgZnV0dXJlLgo+
Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvOTI5MGY1M2QtMzU0NS00Mjk5LTk3ODEt
YzFjNTU4ZjcxMTU4QHJpdm9zaW5jLmNvbQo+Cj4gWmhhbnBlbmcgWmhhbmcgKDIpOgo+ICAgbGli
OiBzYmk6IHNzZTogZml4IEtWTSBjb250ZXh0IGNvcnJ1cHRpb24KPiAgIGxpYjogc2JpOiBzc2U6
IGZpeCBTU0UgaGFuZGxlciBzc3RhdHVzIGxlYWthZ2UKPgo+ICBsaWIvc2JpL3NiaV9zc2UuYyB8
IDgwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQo+
CgpUaGlzIHNlcmllcyBpcyB0cnlpbmcgdG8gZml4IHRoZSBpc3N1ZSBhdCB3cm9uZyBwbGFjZSBz
byBOQUNLIGZyb20gbXlzaWRlLgpQbGVhc2UgY2FyZWZ1bGx5IHJlYWQgdGhlIFNCSSBTU0Ugc3Bl
Yy4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
