Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE4DCD8CA8
	for <opensbi@archiver.kernel.org>; Fri, 12 Jun 2026 12:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vt+eLDBNYXfHK9kLXF8ITjZFKz5XWrR0LTD8r7/k4Kc=; b=tnPNd3/wpL9Wd5
	VzaDg63wKaDSnoC5jY62w1rPcKx3C5T1QpwSF3MBIAYWcK24haMiQl0RTk1Re/Dw4prBP+QxkMdgY
	5nBT+Ti9SpoxntmUXLlid17toXnhA1yNmfoAsT2SxRDn5vSlfNMB9boCW0g5DxmtYRPakx+ijsxi1
	6SRwG5QzVwhzilXz31rRV5V5RLcKAfmxnCyMpz4+WuSQRep02D4hKSzfnfRtuywA8VCaY6HK1jjtu
	AH+OCO+RbpGdrJZ0KBg2KyMuuX15Snny5sEJLicxH3jOW0leI0/oS1GWzSDQKa+LWQX1rQwi8HG1x
	i1CMsOOgwnW4y3ILo05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY13p-0000000Arwx-3rKA;
	Fri, 12 Jun 2026 12:32:33 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY13n-0000000Arw9-2khX
	for opensbi@lists.infradead.org;
	Fri, 12 Jun 2026 12:32:32 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-43d3454f643so439313fac.0
        for <opensbi@lists.infradead.org>; Fri, 12 Jun 2026 05:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781267551; cv=none;
        d=google.com; s=arc-20240605;
        b=DNsjCGGbG2q9U5+giJiqf+7LxZ35sU+VVtdjPnuN5SSIukbTOWDdsAZl/mrQJkFJLh
         5zpnrwXlyi/cDfNyNR+1WziK4CFw+S7dajRpP11OJ9L8j0dy9TEBVWZODjVd0klONcxR
         6st9LdFZEOp1O1hZRfMwnm+WzUuPnVpuQ6EBiluWiPluVtKRN0uph+qQDYyFEN/Iagef
         fR3ZKIWRUwXSum3NSVT0GPmvHcE6OM5rAPCUwVrFk18eH+XukoCla9nrdz+Wng1f7U8Z
         Xepiqjj/DNOke7F9oGx4P9qbewrP6pv2x6wXY3k3PHulfz3e92Fa2qxmamd2CHIpGNWs
         YGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vxoSmvisv/LrOUiLxf+EBcA3Vzfvbhrn+fB+Nzq0zI4=;
        fh=a3yG9IVNasXXFzFZXuoJ6qWNxNr/yHvnMjWzp0jjz4A=;
        b=PDQIpktdd2yG3ODP+QBWwXrPtIVf+IsgLgIr0TDUK3Esh/C0pGdfBR6wKPHL+V2KdE
         mQeCUr7UG2w6EcNHXhhRUggFvg8ZGR+iB1gJN0muwEjZo9qjyRunUSKue82xyjkQjEIm
         lHTdXFoDuYW0E2NNAP4nFK19y8TPrrZUZStCmGbjtNsAn9EeMkUGYbDeys10pCuk9OBI
         RA4Bggg7iscmQLza73pxHuAlwSr75dFdg8NAKMVx+ewZ0a3gSgc8vm1zeNWXsIjEXYSH
         8ae5K/WzrBCnRJIghzap2KNrbJswpoNc7bI5kQXjaCO96jmqeLZe1+ziU5TWVArds9+A
         KUPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781267551; x=1781872351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxoSmvisv/LrOUiLxf+EBcA3Vzfvbhrn+fB+Nzq0zI4=;
        b=v79i3r9Wc+RMC+kqxG3LS4RAyWoD0Bni7G3TOlo1nicUSQ9yzPu5Vxa4sEugB3V8G/
         ZjRut7SE7iVPZE77AFqx2RH2JaPvP6tqF74hP7StRFK/al8AOh7/UWAs5xKrF5ncsUF7
         uR+XWZavJWOw7GtIaPwVI1lUffUkyypeRRpfKBWj7Jp6jiJcTzYqMDDaq0jFIl4RZ0YB
         YRnQypjspo1PVbZ4hFMbPO9tXxArvgY//WK/XLos5kafZK94F1vk9bee6RtryBb5JyD+
         PDk9u6d2+u5T1m/mu9+K3ze94mwmHPIuEusA8ZR0VFk0a6nnb/PeNZ3Y6QriGLiN35bK
         0DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781267551; x=1781872351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vxoSmvisv/LrOUiLxf+EBcA3Vzfvbhrn+fB+Nzq0zI4=;
        b=Idz3F181dRWLTD9lnI1w6jlfjOmgINZ/OYhh+Ltwho9Zx2yF5TH7GXWiL09k9w7z+s
         sGmSZFa91MGl91I7rSpQX0cbTyRtujOs+OkEMn87agVRtzn+Vzwke/OCF2ax2JClUz9c
         UCiQFTbGK64DWz+vlfMZmCQz5OCs006wsC0xTR4f/VeXGSQmXy4QVMczAT84eCYkslR4
         4vxguFX1bytVzjqHuPnQbvy4u+ep51Qg9LXZ8QYci3Gk4SjjLVMTn/qRvz47gKSHiULV
         naN0mdLqUM3t4Gt4H1DfVZUJ9K7b+h4MUhh7SeLYjlJ6wh7CDBT7kmFtNlPYLFYX9eNH
         Aryg==
X-Forwarded-Encrypted: i=1; AFNElJ8Bv9eJD8W3APfEaGE1ZfwdPfNQFp/4f/slFdHe/w+rxqKBVBLJDHEF97gW3j3g7VTdq1NBmtcq@lists.infradead.org
X-Gm-Message-State: AOJu0YxdsEqb3d+hjv+IYnKTjWfBJLXjpe6SjwwjT8upHp26kyQWQuEB
	PIs2/pEPFJEeGvM1VIViYUsriX8fWF1Pwrb6Ffqn7XiuOEyXCbJ6uEiiUnln7YNsc3UCgyAIGYJ
	jJ7NDp+bu3Bhq1HqJvcFX7pJpnrzsPlR1jInQhQIohA==
X-Gm-Gg: Acq92OFdOGMKU5mMu4qBxsvzZH01MwjXyF+ZPdpMsC3jzthE9uzQQ2iTqvPjEHUxehR
	EdBNNRLFKnGOgpOBOZv0Y1l9H8c4vXAtzbrJG34uVlhmcKwSavcnfHpfM2oVf2pqU/xrth7a/hq
	U4YMVnMVfEKPE4iyEFy1C2dJlIlkKAZCBPF6fS7HFrIs2bqy9ckpKcaM3HNTMIbZCD/xZk7ow6Z
	AlfKp4NDwOagLp1DAWoEEYo1Qn0DiLBGVQjxOmr1YVOvz8z85G8mcWf0rN1wLxHM+wXjFBuJRf2
	d1IDzkjfkGAPfhJP3ooDIL3t5fV1kF4A7HD2CacwpnJakIg4VkgLoE4n5JLXwdJtnJgzv7aZTNJ
	6AB3YYpnvjCcV1BlRxZHdS/tnJnc=
X-Received: by 2002:a4a:ee0b:0:b0:696:836e:ba2b with SMTP id
 006d021491bc7-69edc5c9d1cmr1699326eaf.11.1781267550641; Fri, 12 Jun 2026
 05:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260521082625.1520870-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260521082625.1520870-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 12 Jun 2026 18:02:17 +0530
X-Gm-Features: AVVi8CfugFPExbqJwZ8KPNQynPXEFnGIjcGpEKIyJpgYOEmxWEjTnAwD-p68zgc
Message-ID: <CAAhSdy09vTeHQvfwgHYHULoGUBmnzAQGbUG-k_EdBhZRpTzFkA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Minor improvement in FDT extension parsing
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_053231_702145_5A1BCF3D 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBNYXkgMjEsIDIwMjYgYXQgMTo1NuKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgRkRUIGV4dGVuc2lvbiBwYXJzaW5nIGNh
biBiZSBpbXByb3ZlZCBieSBwYXJzaW5nIElTQSBleHRlbnNpb25zCj4gb2YgYWxsIGhhcnRzIGlu
IHRoZSBjb2xkIGJvb3QgcGF0aC4gVGhpcyBhbHNvIHNhdmVzIHNvbWUgcGFydCBvZgo+IHNjcmF0
Y2ggc3BhY2Ugd2hpY2ggd2FzIHVzZWQgYnkgdGhlIGZkdF9pc2FfYml0bWFwLgo+Cj4gVGhlc2Ug
cGF0Y2hlcyBjYW4gYWxzbyBiZSBmb3VuZCBpbiBwbGF0Zm9ybV9leHRlbnNpb25zX2luaXRfdjEg
YnJhbmNoCj4gYXQ6IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL29wZW5zYmkuZ2l0Cj4KPiBB
bnVwIFBhdGVsICgyKToKPiAgIGxpYjogc2JpX2hhcnQ6IE5vIG5lZWQgdG8gY2xlYXIgZmVhdHVy
ZXMgaW4gaGFydF9kZXRlY3RfZmVhdHVyZXMoKQo+ICAgcGxhdGZvcm06IGdlbmVyaWM6IE9wdGlt
aXplIGV4dGVuc2lvbnNfaW5pdCgpIHRvIHBhcnNlIElTQSBleHRlbnNpb25zCj4gICAgIG9uY2UK
CkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywK
QW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
