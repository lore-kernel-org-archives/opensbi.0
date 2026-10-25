Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53148606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RIAMyeKp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=sObGoqdq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IU3MUl6exUIcxL3yKdvrja0G3gbT3I/BZ1rDN41IgbI=; b=RIAMyeKpF3qmm0ah8Mu3BqNy7O
	wMghFtr9fkliJJNYwM1XDPTN7by8OMyvzxF61LOPe0042bGBEpMa86zEwo0y3JzUU69G3oQATu0QD
	e5V4t2Zwrn1OQiUMyMQ0rB0swHULKSGGcgG6vR7lEs+zsBJXfa/Y2GqXAHGfaSMsmenxJI3p60Drr
	ovJ72hSpmlgD/6OXnfjNvOphylWyzCbPEtW9ZDLjY6y44dJtwEBivR7Jj0UXJCrbfOyk7rChLyhBD
	IkWNZiSqauoECeC780vz/D47DOSYBZMACXqJ30GfBCvxM3SPfU365LCwtzekK4Xcd7noORzzyQyik
	c4T3tp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKulP-00000000voV-1ExP;
	Sun, 25 Oct 2026 09:43:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKulM-00000000vo8-0FCx
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 09:43:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1794985f8f.2
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 02:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792921414; cv=none;
        d=google.com; s=arc-20260327;
        b=ZEjCkUhMqidm4n16uID6hSlNyu0AVra7UGAchcH0zZ6SYrBTpWgsH9URp3gRas9cwe
         ghPAJv52Fi7tEtwsCbAjQ41NXDIlPNmnR03Q6cREa4YXtaw02iPMzj6NI7RsJOLkgSzV
         5JPFY0jQ0OZGtdYdYcaQBcgc3u7ACRlISAxPAwzwk3qnpPXR7YFqX8UPmr0sE00uLtUH
         ebixfexPH6UwzN1iKOVdllqqYSAigCHHbJx7R0NS5iWJp10tOFOohA/raU0atqGwQVBe
         /T0BDVqMrmoTpiMhD/L9rb48uhyQNWRuxT3ufpLbeKe1LfQY/QI8KiHQw/TCc0EmNCKB
         y89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mKBbvxRv4wOdpBTo+K64VzUSyTQinQrsVovJVT1xHgc=;
        fh=O33DxoIMc3R2Vo4h7LJov11Wyim3nXRVvLoN3eL5+GI=;
        b=rDL90Ih6a5ooMuorII8WLLz3M62UfxJGT+3VXIo53H+fe733koiv8TNsLCM/c2cSMD
         tg2EwB3m9HTrTW4c/o+gLT25tVL5fV8/baAF8Vy2l1jABkSu0FLKFyVXNzEFPIfm5LLM
         VuMNQpozAjbGiytvrEjO6n0j8FQMOwEXEGBYVb9k2m4KOQZQMqcC8BWYWzQoY2zae09+
         FAHjOnWRpyo5gAtwjfaSk+OpG6gcNTm3GT9YOXyGDiudISWkWiOSwdjYYpYMxUrRWwyM
         1oly2S+l96Eng2DwihU1Aytn+I221NqlGz3kAjbWL8l8srRDPixTAcVt7geSIrNkYICP
         y1NQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792921414; x=1793526214; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mKBbvxRv4wOdpBTo+K64VzUSyTQinQrsVovJVT1xHgc=;
        b=sObGoqdq9MFE2uRuk/wGGauQdaeO7H7aHBT/d0XXnHMiMiBKjTKqIGIAB0v7nvD/hU
         Xeoljx6A9FmADGqMcAeIQPDHISTOBcN0MQ9JSoicwHUoQx9FaQQ4uGZRm70d93ktEfIy
         yepyNsMoGTCsUL4fMAh+uqLt/S+UioZlnZdZiZaNEnhS8Qa01XlRYD3kolUCgW0zRD4p
         5LQeEaqL9urB3Cuw3RmjPQ6n4dPDcgAFpSD6A1VQqBqe6mtmU0y7bbCuO/8Wnf3bOxid
         90ig5zi5qdjG8U1ihS2bf31vN0UxQid4b6amDlVugSZkjo+CZxw3y455i/iRFZ7Fswud
         MghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792921414; x=1793526214;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKBbvxRv4wOdpBTo+K64VzUSyTQinQrsVovJVT1xHgc=;
        b=bUmaLU91kakRDq3DWtUt4rFjz9VkljDykUts43LbEiXaI+ZqIpc0JpZh78aO0m0zVp
         3aqNZMjVAYR64hRVwxHgViQyC2IM9e3wUqHfRoPEveySFzBSa6QnD6aYPFtaG7myTPPT
         pZ2DZ1E6rQoGHN5x0d9mDtHRsRARuOeUwtnfUVSXi6X2iRLJ2a1r+2jfkIElzPT5/Vg8
         G56QUkMcwvA71sB71vf+lrpslkIF23A7YRD8Nbl/BNsGuqGG/KUrHAEYLkNA+BJEpE5Z
         XdbJebZYDuBu+ggFo2VUCjdHstSmQ+rw+mY1rKvKY6f2HW0HCMHsuKVd8g6TdY+DDaQg
         2E1w==
X-Gm-Message-State: AFq9FYLJ5wzs4JFEkpwJ5yWFHVGX8Ksby4wdvmYk6sYTBCJBUHREgLKV
	3slrD64libeBItxIEWm7JA5bpEwahNUUCq1lSuArvboD2TMnhOKoDI4ZMWT/Sqg2qz8+sKV24jA
	b+eM0px0jEqLCCQdv/x64CR/4QdO7pf5zQOqUsyBkxA==
X-Gm-Gg: AYBFou2zmpWbPjeuVLRfavaxzePpNKS1QpoQvUyzZGgldgHMVuYv5JyNlz6vPmgBfKS
	6JEW4fPpalh47nKPX6tBBPZZTa4vaqjzBabvNNa3SVdkkkAH/MKYIoPL9e8hFsWvgimghQWn81G
	9FP/HbMkAQusUYgPPQOVQgw5/pi7cfgNLQVd3Sqayk7tP7xCFOzW9qSZknvUeCLt8oJkEk08S8M
	jQezUaVp4gzfqGyujN6ZGMyyw9MuVuPcGQt+lsFpJj6ncYVSwOcdt/anu+tvnmJJhT9B4Kg0QuN
	lBHahptBAH9gwOTaFtKzty0MEIxA8hVVAuk8zq8yTyMtLrr3B/z9Y6IoXMNQ3SOm1o38SXNX3Th
	sNlg/QTWlw8vqpnQehnrH4FMIO8rmwWfhLWxzKNIypeJ9B3Lyt6E5wB/vVwbVjkYGcYsGdD3tBi
	XFNcj0gCbfDPJN0C8qQqbFILZKrNJIVFCPJv4XxKT03djosp2/Q3RTaKAk
X-Received: by 2002:a5d:5f06:0:b0:48d:ed0a:e064 with SMTP id
 ffacd0b85a97d-48e3eba0cacmr5779067f8f.24.1792921414163; Sun, 25 Oct 2026
 02:43:34 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261011222412.769530-1-nickolai@csail.mit.edu>
In-Reply-To: <20261011222412.769530-1-nickolai@csail.mit.edu>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 15:13:22 +0530
X-Gm-Features: AclHuK_u1FQ_ESAfAYZBZ18UHzihoKA_AqyBDQN6kMrfvpfYdiTav3XPbGo-1aw
Message-ID: <CAAhSdy1nZMKJSMnY2AVYXMcR-TrTg23aofogTnz6ptTNgp+Spw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_timer: Insert timer event before the later event
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: opensbi@lists.infradead.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_024336_132886_DF15C9F4 
X-CRM114-Status: GOOD (  36.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMzo1NOKAr0FNIE5pY2tvbGFpIFplbGRvdmljaAo8bmlj
a29sYWlAY3NhaWwubWl0LmVkdT4gd3JvdGU6Cj4KPiBUaGUgcGVyLUhBUlQgZXZlbnQgbGlzdCBp
cyBrZXB0IHNvcnRlZCBieSBleHBpcnkgdGltZTogdGhlIGhlYWQgaXMgdGhlCj4gZXZlbnQgcHJv
Z3JhbW1lZCBpbnRvIHRoZSB0aW1lciBkZXZpY2UgYnkgX19zYmlfdGltZXJfdXBkYXRlX2Rldmlj
ZSgpLAo+IGFuZCBzYmlfdGltZXJfcHJvY2VzcygpIHN0b3BzIGF0IHRoZSBmaXJzdCB1bmV4cGly
ZWQgZW50cnkuCj4KPiBfX3NiaV90aW1lcl9ldmVudF9zdGFydCgpIGZpbmRzIHRoZSBmaXJzdCBl
dmVudCB0aGF0IGV4cGlyZXMgYWZ0ZXIgdGhlCj4gbmV3IG9uZSwgYnV0IHRoZW4gaW5zZXJ0cyB0
aGUgbmV3IGV2ZW50IHdpdGggc2JpX2xpc3RfYWRkKCksIGkuZS4gYWZ0ZXIKPiB0aGF0IGV2ZW50
IGluc3RlYWQgb2YgYmVmb3JlIGl0LiAgU3RhcnRpbmcgYW4gZXZlbnQgYXQgdGltZSA1MCB3aGls
ZSBhbgo+IGV2ZW50IGF0IHRpbWUgMTAwMCBpcyBwZW5kaW5nIHlpZWxkcyB0aGUgbGlzdCBbMTAw
MCwgNTBdOiB0aGUgZGV2aWNlIGlzCj4gcHJvZ3JhbW1lZCBmb3IgMTAwMCBhbmQgdGhlIGVhcmxp
ZXIgZXZlbnQgZmlyZXMgOTUwIHRpY2tzIGxhdGUuCj4KPiBUb2RheSBlYWNoIEhBUlQgb25seSBl
dmVyIGhhcyBpdHMgUy1tb2RlIHRpbWVyIGV2ZW50IG9uIHRoZSBsaXN0LCBzbwo+IHRoZSBtaXNv
cmRlcmluZyBuZWVkcyBhIHNlY29uZCB0aW1lciBldmVudCB1c2VyIHRvIHNob3cgdXAuICBPbmNl
IHRoZXJlCj4gaXMgb25lLCBvbiBIQVJUcyB3aXRob3V0IFNzdGMgYW4gUy1tb2RlIHRpbWVyIHBy
b2dyYW1tZWQgd2hpbGUgYSBsYXRlcgo+IE0tbW9kZSBldmVudCBpcyBwZW5kaW5nIGlzIGRlbGl2
ZXJlZCBvbmx5IHdoZW4gdGhhdCBsYXRlciBldmVudAo+IGV4cGlyZXMuCj4KPiBVc2Ugc2JpX2xp
c3RfYWRkX3RhaWwoKSBzbyB0aGUgbmV3IGV2ZW50IGdvZXMgaW4gZnJvbnQgb2YgbmV4dF9ldi4K
Pgo+IEZpeGVzOiBiN2ZhOGEyNDZjYmEgKCJsaWI6IHNiaV90aW1lcjogQWRkIHN1cHBvcnQgZm9y
IHRpbWVyIGV2ZW50cyIpCj4gU2lnbmVkLW9mZi1ieTogTmlja29sYWkgWmVsZG92aWNoIDxuaWNr
b2xhaUBjc2FpbC5taXQuZWR1Pgo+IENvLUF1dGhvcmVkLUJ5OiBDbGF1ZGUgRmFibGUgNS4xIDxu
b3JlcGx5QGFudGhyb3BpYy5jb20+CgpVc2UgQXNzaXN0ZWQtYnkgaW5zdGVhZCBvZiBDby1BdXRo
b3JlZC1CeSB0byBhY2tub3dsZWRnZSBMTE1zLgpJIHdpbGwgdXBkYXRlIHRoaXMgYXQgdGhlIHRp
bWUgb2YgbWVyZ2luZy4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBv
LgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IFRoaXMgYnVnIHdhcyBmb3VuZCBpbiB0aGUgcHJvY2Vz
cyBvZiBmb3JtYWxseSB2ZXJpZnlpbmcgdGhlIGNvcnJlY3RuZXNzCj4gb2YgT3BlblNCSSBvbiB0
b3Agb2YgdGhlIFNhaWwgUklTQy1WIHNlbWFudGljcyB1c2luZyBMZWFuLgo+Cj4gX19zYmlfdGlt
ZXJfZXZlbnRfc3RhcnQoKSB3YWxrcyBldmVudF9saXN0IGZvciB0aGUgZmlyc3QgdGV2IHdpdGgK
PiBuZXh0X2V2ZW50IDwgdGV2LT50aW1lX3N0YW1wIGFuZCB0aGVuIGNhbGxzCj4gc2JpX2xpc3Rf
YWRkKCZldi0+aGVhZCwgJm5leHRfZXYtPmhlYWQpLCB3aGljaCBsaW5rcyBldiBhZnRlciBuZXh0
X2V2Cj4gKF9fc2JpX2xpc3RfYWRkKG5ldywgaGVhZCwgaGVhZC0+bmV4dCkpLiAgRXZlcnkgbGF0
ZXIgY29uc3VtZXIgYXNzdW1lcwo+IHRoZSBsaXN0IGlzIHNvcnRlZDogX19zYmlfdGltZXJfdXBk
YXRlX2RldmljZSgpIHByb2dyYW1zIHRoZSBoZWFkJ3MKPiB0aW1lX3N0YW1wIGFuZCBzYmlfdGlt
ZXJfcHJvY2VzcygpIGJyZWFrcyBhdCB0aGUgZmlyc3QgdW5leHBpcmVkIGhlYWQuCj4gV2l0aCBb
QUAxMDAwXSBwZW5kaW5nLCBzdGFydGluZyBCQDUwIGdpdmVzIFtBQDEwMDAsIEJANTBdLCBzbyBC
IGZpcmVzCj4gYXQgMTAwMC4gIEluc2VydGluZyBhdCB0aGUgdGFpbCB3aGVuIG5vIGxhdGVyIGV2
ZW50IGV4aXN0cyB3YXMgYWxyZWFkeQo+IGNvcnJlY3QuCj4KPiBJbi10cmVlIGVhY2ggSEFSVCBo
YXMgb25seSBzbW9kZV9ldiBvbiBpdHMgbGlzdCAoYW5kCj4gc2JpX3RpbWVyX2V2ZW50X3N0YXJ0
KCkgdW5saW5rcyBhbiBldmVudCBiZWZvcmUgcmUtaW5zZXJ0aW5nIGl0KSwgc28KPiB0aGUgbGlz
dCBuZXZlciBoYXMgdHdvIGVudHJpZXMgdG9kYXkuICBUaGUgcHJvcG9zZWQgU0JJIHdhdGNoZG9n
Cj4gZXh0ZW5zaW9uIChQcmFqd2FsIE4sICJbUEFUQ0ggMy80XSBsaWI6IHNiaTogQWRkIFNCSSB3
YXRjaGRvZwo+IGZyYW1ld29yayIsIDIwMjYtMTAtMDIpIGFkZHMgdHdvIG1vcmUgcGVyLUhBUlQg
ZXZlbnRzOyBvbiBhIEhBUlQKPiB3aXRob3V0IFNzdGMsIGFuIFMtbW9kZSB0aW1lciBzZXQgd2hp
bGUgdGhlIHdhdGNoZG9nIGV2ZW50IGlzIHBlbmRpbmcKPiB3b3VsZCB0aGVuIGJlIGRlbGF5ZWQg
dW50aWwgdGhlIHdhdGNoZG9nIGV2ZW50IGV4cGlyZXMuCj4KPiBUaGlzIGlzIGluZGVwZW5kZW50
IG9mIFBlbmdwZW5nIEhvdSdzIHBlbmRpbmcgImxpYjogc2JpX3RpbWVyOiBSZXN0YXJ0Cj4gZXZl
bnRzIGZyb20gdGhlIHJlc3RhcnQgbGlzdCIgKDIwMjYtMDgtMzEpLCB3aGljaCBmaXhlcyB0aGUg
cmVzdGFydAo+IGxvb3AgaW4gc2JpX3RpbWVyX3Byb2Nlc3MoKTsgdGhlIHR3byBwYXRjaGVzIHRv
dWNoIGRpZmZlcmVudCBodW5rcyBhbmQKPiBhcHBseSBpbiBlaXRoZXIgb3JkZXIuICBSZS1hcm1l
ZCBldmVudHMgZ28gdGhyb3VnaCB0aGUgc2FtZSBpbnNlcnRpb24sCj4gc28gdGhleSBuZWVkIGJv
dGguCj4KPiBUZXN0aW5nOgo+IC0gbWFrZSBQTEFURk9STT1nZW5lcmljIExMVk09MSBQTEFURk9S
TV9SSVNDVl9YTEVOPTY0OiBidWlsZHMsIG5vCj4gICB3YXJuaW5ncyAoYWxzbyB3aXRoIFBlbmdw
ZW5nIEhvdSdzIHBhdGNoIGFwcGxpZWQgb24gdG9wKS4KPiAtIFBMQVRGT1JNX1JJU0NWX1hMRU49
MzIgKHJ2MzJpbWFjX3ppY3NyX3ppZmVuY2VpL2lscDMyKTogc2JpX3RpbWVyLm8KPiAgIGJ1aWxk
cyB3aXRob3V0IHdhcm5pbmdzOyB0aGUgZnVsbCBydjMyIGJ1aWxkIHN0b3BzIGluCj4gICBsaWIv
c2JpL3NiaV90cmFwX2xkc3QuYyAoLVdzb21ldGltZXMtdW5pbml0aWFsaXplZCBvbiAndmFsJyks
IHdoaWNoCj4gICBmYWlscyB0aGUgc2FtZSB3YXkgb24gdW5wYXRjaGVkIG1hc3Rlci4KPiAtIFVz
ZXJzcGFjZSBoYXJuZXNzOiBpbmNsdWRlL3NiaS9zYmlfbGlzdC5oIHBsdXMgY29waWVzIG9mCj4g
ICBfX3NiaV90aW1lcl9ldmVudF9zdGFydCgpLCBfX3NiaV90aW1lcl9ldmVudF9zdG9wKCkgYW5k
Cj4gICBzYmlfdGltZXJfcHJvY2VzcygpIHdpdGggc3R1YnMuICBTdGFydGluZyA1MCB3aGlsZSAx
MDAwIGlzIHBlbmRpbmc6Cj4gICBtYXN0ZXIgZ2l2ZXMgWzEwMDAsIDUwXSwgcGF0Y2hlZCBnaXZl
cyBbNTAsIDEwMDBdLiAgQSBjYWxsYmFjawo+ICAgcmUtYXJtaW5nIGF0IDExMCB3aXRoIGFuIGV2
ZW50IHBlbmRpbmcgYXQgMTAwMDogd2l0aCBvbmx5IHRoZQo+ICAgcmVzdGFydC1saXN0IGZpeCB0
aGUgcmVzdWx0IGlzIFsxMDAwLCAxMTBdLCB3aXRoIGJvdGggWzExMCwgMTAwMF0uCj4gLSBOb3Qg
cnVuIG9uIFFFTVUgb3IgaGFyZHdhcmUuICBUbyBzZWUgaXQgdGhlcmUsIHN0YXJ0IHR3byBNLW1v
ZGUgdGltZXIKPiAgIGV2ZW50cyBvbiBvbmUgSEFSVCwgdGhlIGxhdGVyIG9uZSBmaXJzdCwgZS5n
LiBmcm9tIGEgcGxhdGZvcm0KPiAgIGZpbmFsX2luaXQgb24gYSBub24tU3N0YyBDUFUgKHFlbXUt
c3lzdGVtLXJpc2N2NjQgLU0gdmlydAo+ICAgLWNwdSBydjY0LHNzdGM9b2ZmKTogc2JpX3RpbWVy
X2V2ZW50X3N0YXJ0KCZhLCBub3cgKyAxMCAqIGZyZXEpOwo+ICAgc2JpX3RpbWVyX2V2ZW50X3N0
YXJ0KCZiLCBub3cgKyBmcmVxKTsgYidzIGNhbGxiYWNrIHJ1bnMgYWZ0ZXIgMTAgcwo+ICAgb24g
bWFzdGVyIGFuZCBhZnRlciAxIHMgd2l0aCB0aGlzIHBhdGNoLgo+Cj4gIGxpYi9zYmkvc2JpX3Rp
bWVyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3RpbWVyLmMgYi9saWIvc2JpL3NiaV90
aW1lci5jCj4gaW5kZXggNzhhYWEzMmUuLjFmMTNhM2IxIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkv
c2JpX3RpbWVyLmMKPiArKysgYi9saWIvc2JpL3NiaV90aW1lci5jCj4gQEAgLTIwNSw3ICsyMDUs
NyBAQCBzdGF0aWMgdm9pZCBfX3NiaV90aW1lcl9ldmVudF9zdGFydChzdHJ1Y3QgdGltZXJfc3Rh
dGUgKnRzdGF0ZSwKPiAgICAgICAgIGV2LT5oYXJ0X2luZGV4ID0gY3VycmVudF9oYXJ0aW5kZXgo
KTsKPiAgICAgICAgIGV2LT50aW1lX3N0YW1wID0gbmV4dF9ldmVudDsKPiAgICAgICAgIGlmIChu
ZXh0X2V2KQo+IC0gICAgICAgICAgICAgICBzYmlfbGlzdF9hZGQoJmV2LT5oZWFkLCAmbmV4dF9l
di0+aGVhZCk7Cj4gKyAgICAgICAgICAgICAgIHNiaV9saXN0X2FkZF90YWlsKCZldi0+aGVhZCwg
Jm5leHRfZXYtPmhlYWQpOwo+ICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICBzYmlfbGlz
dF9hZGRfdGFpbCgmZXYtPmhlYWQsICZ0c3RhdGUtPmV2ZW50X2xpc3QpOwo+ICB9Cj4KPiBiYXNl
LWNvbW1pdDogNmFkMjQ2YTE0OTQ4MDdlZTkxZTM2ZmZjZjYwZTRjMzBiYjMwOWQ0NQo+IC0tCj4g
Mi41My4wCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
