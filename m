Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1442CD4F52
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmqZPXbaHHhgwbkuY28JjczOAsRwlPpI8PK86EGWQso=; b=G4yBHYuddiCcmC
	5KQfzgYiwSjo4mvE6AVo6MjoVyB4gkLVzXEnmStnZ+HocITsaj6VAb7xlowVZXSTpXqzik0EjVXob
	3eC+fLu6h/m+apqhVPZd/pG/y6VKPMtaY/1kdVFNyIyjSD6qqxzv6uwIkh6Xt+RO8pLUxy+psrOen
	7osvPrpF3CtwYoSJCW+ign6UW6LjhB3DB74ZQdoM3/HOVdHxvINNmL6Mdsehx0E4datlGPB7OfD0P
	Ro2i05ehvuz6drHa1yBSgAKGPt5CFa/Djr6TdN0VfH7I2LOS4blv56HxsUqbxSCJCbPkjBGF2STuh
	n5zoJaizSCm+3U/bykvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtNz-0000000EocT-43Jh;
	Mon, 18 May 2026 08:31:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtNz-0000000Eobv-1kfV
	for opensbi@bombadil.infradead.org;
	Mon, 18 May 2026 08:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mRZCbdUA9cDW33SFZUUmo0/Fe2idJBXsjohyJ2QjPjM=; b=LH7Qkacdhf/MvyDWWhRO2PKnUo
	mdzzouytH85Lam3Gp3I75Wa+gMl8rqi4zXCRAf6Pt6zTJtzka68LJDy4F/xUImNCKNgg1GIbs0dhk
	Jj6jxqZyq3jGX4eXCeGmUh4NqvRhmJJMtZGfDz57zaU5oSnzOibVmrtB0vMyDfbDd2iAal11e7FqS
	ZZHtJn7YwbvI+tu1u1iiW6aUrsJ3pMugyZxNn93DgCeSsEtnFn/jth8mByOvlM5y5uMSUZ6KuSW/R
	PHtyX68JAx44FZ/gVQe+vqLbSTAygcFdYLcj6C5TB3esNKeRT4pzef2cJwlNMa6MsTj6472lT/9IL
	0g1EsiuA==;
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtNs-0000000ANtA-3n5m
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 08:31:38 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-479dd56d016so1661092b6e.3
        for <opensbi@lists.infradead.org>; Mon, 18 May 2026 01:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779093091; cv=none;
        d=google.com; s=arc-20240605;
        b=haqOsAEwvC8SyqRBbnyseFROF0rIjB/xQNKmtDBeKbhVZKpfYMY9w3LD7eNs+cxepJ
         lVsvKrVZlGaILAlPAT3Kxl7oqSwE+w3ma6RxyHz/lbNu4Hwly4OoZIhxsqU0I+IwHplP
         mhVi12hmfaKLOf3KVsxv9ocUn3GoGuIx30fnB5uky6wkUhRx3J+UMvUJREW85tgO9Aff
         xFqh/xApW8U524xsTObTN30olUGXU+xkHoNsCaINaaIQwndrs1FQ63EKiXGfB+A32ypy
         iPm4f4TaOwTy49SlJeuMhIFTR8F+WQk0YJqczq4KKg/TYASKF3b77tZ0EEY8suquwFPu
         XjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mRZCbdUA9cDW33SFZUUmo0/Fe2idJBXsjohyJ2QjPjM=;
        fh=cR/plmaG8soDyGYRgZwmz7TwllPokxi6wyx/jOfm1fs=;
        b=I9z8/mI5IEJCwL6Ax/Ypt9LcNIGwr1GkWy3StebniHBJDvxlUrVKKoHnjeiZHUF27A
         h7Q+a1ygY+ggT7DvXrHyI65woxVcPDEo6jR76mbeI5osi7UU2SQcEgrSWeHtY6s2m5GW
         5wcjBw+iPYVQ4cZaW+kRXO7a7+HKZJrimCGE4kAc2wovcM95m5/gxfR2Mk1EaB3odD4b
         oDBG0ZuxPP+QUuXoGdjNvT/gidUfVKsaKHhZYq4Ss4wUQx809EIn9U2F2nqlMjjsKCWE
         59ZxteMMyxw+pN2Mq8yhfZghwxsGiFF3Wrj1GTtNmQi4+dvv94Pn0Nc4I1vArdOGX/U4
         WOMg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779093091; x=1779697891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRZCbdUA9cDW33SFZUUmo0/Fe2idJBXsjohyJ2QjPjM=;
        b=o5XWA/PL/jWYRECt0g0xPqlpjYjoY8nkP5hXtQLACV96u41qW5GH583OX0F8Kbnhg2
         x1yn7EPACMiC6bXV67KgOTjxxo0w7F6d4vu7tMxghL1ZjxSnaidubT1h/UTuXYFYUeV6
         At3tB9fqlrMOqvFctvefAy9MrQB+pKG2iuxVUEdEaqqhGMiZek6RI4UdKDPBGKBKqM5w
         q70oYhD076lwHDnG7n1k9sZfhuaHwE7y4g+Fnnodv7tLsYqDBpDsw58lpSMNNLCfVJnV
         mHMlL/IiYF/pfz+Up6TbqglZ3rSuODNqkkPVap/cbi48VhFBbVPADfYIOtBmMlVy6R5U
         hpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779093091; x=1779697891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mRZCbdUA9cDW33SFZUUmo0/Fe2idJBXsjohyJ2QjPjM=;
        b=OfhTc0MV1nPe3+Lsl/eTGAl+NM3fPmm0EA5wn6UKTf5Sf7og5jiHYW3U8paZDGJwP6
         L9i4VzV72vtISkvUbsr8yaWfUlD0NQngLJCt3nKDYglv4sDJizk52oMajuc+Chly7zvD
         aH3eryNflWCpZDWAghVWLcYtwswi93pYMErp+X4Z1yRZBB0OPFc7X927V+qUTbSFCXiC
         k/7VEBSP1IYunUUjqxsLhhTbxEKhF/om+eec8a/X8001QYyyU6Lsrb8v/QrJI0Eg/9TO
         pR/UFHcRyT7dsjd0VYDkfB1+njTnefeR18+Y8fa32meNXUEU4oMI2Eqi9CAk83k+pkXz
         fQhQ==
X-Forwarded-Encrypted: i=1; AFNElJ99CezO3j3F66toEobAP1sseUx2S5CKqMWgVLuKl7rYrYmrrLeDAB9NCGtSdz65mW8b8pBuf6EB@lists.infradead.org
X-Gm-Message-State: AOJu0YwtyJdfbEStVvqCXpk+X3UdFUKwBi737KmOvyQBtiW4oi/PSQpq
	ebdHzQPTrWJn2iThrRaJ2vPQuGTO1dn9vKst8pGnxt0x6yoW9JRvFKEk1S1V8E4iFXFB411/uqD
	lrZ+OkJQLmCc21lkEyJAIVoKjn+1h0Km7jAFLxJ52WQ==
X-Gm-Gg: Acq92OFZtEeUwDll2tfg+AC6CxAVZJxysD8sNogAFyBNHjf6wDbJ651Iqj0iBMXff6J
	8X8rmYMNliayGyz6hRXtqjCz9zzfEc0arYaE2fk949JB5+tyJP8FFdYqHZ7vmPzTv0a8QO5n6BC
	vpOoU3swkPcPKhj7rWb03XHagwJ9dTphCRuo+xs2LrtQXt/vidiMPC3eL2iORBfBvqv6WWSX7bB
	MZewe0mA9awa4yf4J9ZuKtSaocmK9kYgsEgtRTcl6CJLCM/uyuB6wf46a43sjtzmS7D9MLKulDl
	3UHkyCSul5SSMT0sVlMXecVNRNs9AeLw52QdA6+JhL7lQHEEZi9TOfquJyDvglEoa+XBDYT3XW7
	Z+AA9j5m18XJbBOGIO/L7GPyTmQ==
X-Received: by 2002:a05:6820:1792:b0:696:6585:a4b with SMTP id
 006d021491bc7-69c942923fcmr9053320eaf.5.1779093090855; Mon, 18 May 2026
 01:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260518054219.58708-1-dave.patel@riscstar.com>
In-Reply-To: <20260518054219.58708-1-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 May 2026 14:01:19 +0530
X-Gm-Features: AVHnY4LHFitucEv3s4pZIB0V6wbEScK77XNnxHdrBX1oqissA7Ui2KxzVyHwOoE
Message-ID: <CAAhSdy37VLs8oXgkWvGfGn8irWgNU7+pgO0S-J4oOnbWZvikAQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Add eager FP and RISC-V vector context switching support
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_093133_332099_1DC85922 
X-CRM114-Status: GOOD (  19.62  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTE6MTLigK9BTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+
Cj4KPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHByb3BlciBzdXBwb3J0IGZvciBwZXItZG9tYWlu
IGZsb2F0aW5nLXBvaW50IChGUCkgYW5kCj4gdmVjdG9yIChWKSBjb250ZXh0cyBpbiB0aGUgZG9t
YWluIGNvbnRleHQgc3dpdGNoIGxvZ2ljLiBFYWNoIGRvbWFpbgo+IG5vdyBtYWludGFpbnMgaXRz
IG93biBGUCBhbmQgdmVjdG9yIHN0YXRlLCB3aGljaCBpcyBzYXZlZCBhbmQgcmVzdG9yZWQKPiBk
dXJpbmcgZG9tYWluIHN3aXRjaGVzLgo+Cj4gQ29uZGl0aW9uYWxpemUgRlAgYW5kIFZlY3RvciBz
YXZlL3Jlc3RvcmUgYmFzZWQgb24gZXh0ZW5zaW9ucywgdW5jb25kaXRpb25hbAo+IHNhdmUgYW5k
IHJlc3RvcmUgb2YgZmxvYXRpbmctcG9pbnQgKEZQKSBhbmQgVmVjdG9yIHJlZ2lzdGVycyBmYWls
cyBvbgo+IGdlbmVyaWMgcGxhdGZvcm0gZmlybXdhcmUuIFRoaXMgZmlybXdhcmUgbXVzdCBydW4g
b24gbXVsdGlwbGUgcGxhdGZvcm1zCj4gdGhhdCBtYXkgbGFjayB0aGVzZSBleHRlbnNpb25zLgo+
Cj4gQWRkcmVzcyB0aGlzIGJ5IGNvbmRpdGlvbmFsbHkgZXhlY3V0aW5nIEZQIHNhdmUvcmVzdG9y
ZSBvbmx5IGlmIHRoZSB1bmRlcmx5aW5nCj4gaGFydCBzdXBwb3J0cyB0aGUgRiBvciBEIGV4dGVu
c2lvbnMuIFNpbWlsYXJseSwgcGVyZm9ybSBWZWN0b3Igc2F2ZS9yZXN0b3JlCj4gb25seSBpZiB0
aGUgaGFydCBzdXBwb3J0cyB0aGUgVmVjdG9yIGV4dGVuc2lvbi4KPgo+IENoYW5nZXMgaW5jbHVk
ZToKPgo+IC0gQWRkIFZlY3RvciBzYXZlIGFuZCByZXN0b3JlIGZ1bmN0aW9uYWxpdHkKPiAtIEFk
ZCBGbG9hdGluZyBQb2ludCBzYXZlIGFuZCByZXN0b3JlIGZ1bmN0aW9hbmxpdHkKPiAtIEFkZGVk
IGBmcF9jdHhgIGFuZCBgdmVjX2N0eGAgbWVtYmVycyB0byBgc3RydWN0IGhhcnRfY29udGV4dGAu
Cj4gLSBJbnRyb2R1Y2VkIGR5bmFtaWMgdmVjdG9yIHN0cnVjdCBhbGxvY2F0aW9uIGZvciB2bGVu
YiBpbiAnc3RydWN0IGhhcnRfY29udGV4dCcKPiAgIHRvIGFsbG9jYXRlIGFuZCBmcmVlIHBlci1k
b21haW4gRlAgYW5kIHZlY3RvciBjb250ZXh0Lgo+IC0gTW9kaWZpZWQgYHNiaV9kb21haW5fcmVn
aXN0ZXIoKWAgdG8gaW5pdGlhbGl6ZSBGUC9WZWN0b3IgY29udGV4dCBwZXIgZG9tYWluLgo+IC0g
VXBkYXRlZCBgc3dpdGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQoKWAgdG8gc2F2ZS9yZXN0b3Jl
IEZQIGFuZCB2ZWN0b3IKPiAgIGNvbnRleHRzIHNhZmVseToKPiAgICAgLSBFbnN1cmVzIEZTL1ZT
IGZpZWxkcyBpbiBgbXN0YXR1c2AgYXJlIGVuYWJsZWQgKHNldCB0byBJbml0aWFsKSBvbmx5IGlm
IE9mZi4KPiAtIEFkZGVkIHJ1bnRpbWUgY2hlY2tzIGZvciBGUCBhbmQgdmVjdG9yIGV4dGVuc2lv
bnMgd2hlcmUgbmVlZGVkLgo+IC0gQWRkZWQgU0JJX0hBUlRfRVhUX0YsIFNCSV9IQVJUX0VYVF9E
LCBTQklfSEFSVF9FWFRfViB0byBlbnVtCj4gICBzYmlfaGFydF9leHRlbnNpb25zIGFuZCB0aGUg
c2JpX2hhcnRfZXh0W10gYXJyYXkuIFVzZSBzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKCkKPiAgIHRv
IGNoZWNrIGZvciB0aGVzZSBjYXBhYmlsaXRpZXMgYmVmb3JlIHBlcmZvcm1pbmcgdGhlIGNvbnRl
eHQgc3dpdGNoZXMKPgo+IFRoaXMgaW1wcm92ZXMgc3VwcG9ydCBmb3IgbXVsdGktZG9tYWluIHN5
c3RlbXMgd2l0aCBGUCBhbmQgVmVjdG9yCj4gZXh0ZW5zaW9ucywgYW5kIHByZXZlbnRzIGNvcnJ1
cHRpb24gb2YgRlAvVmVjdG9yIHN0YXRlIGR1cmluZyBkb21haW4KPiBzd2l0Y2hlcy4KPgo+IERh
dmUgUGF0ZWwgKDMpOgo+ICAgbGliOiBzYmk6IEFkZCBSSVNDLVYgdmVjdG9yIGNvbnRleHQgc2F2
ZS9yZXN0b3JlIHN1cHBvcnQKPiAgIGxpYjogc2JpOiBBZGQgZmxvYXRpbmctcG9pbnQgY29udGV4
dCBzYXZlL3Jlc3RvcmUgc3VwcG9ydC4KPiAgIGxpYjogc2JpOiBkb21haW4gRlAvVmVjdG9yIGNv
bnRleHQgc3VwcG9ydCBmb3IgY29udGV4dCBzd2l0Y2gKPgo+ICBpbmNsdWRlL3NiaS9zYmlfZnAu
aCAgICAgICAgIHwgIDI2ICsrKysrCj4gIGluY2x1ZGUvc2JpL3NiaV9oYXJ0LmggICAgICAgfCAg
IDYgKwo+ICBpbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmggICAgIHwgIDI4ICsrKysrCj4gIGxpYi9z
Ymkvb2JqZWN0cy5tayAgICAgICAgICAgfCAgIDIgKwo+ICBsaWIvc2JpL3NiaV9kb21haW5fY29u
dGV4dC5jIHwgIDM2ICsrKysrKwo+ICBsaWIvc2JpL3NiaV9mcC5jICAgICAgICAgICAgIHwgMjA3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGxpYi9zYmkvc2JpX2hhcnQu
YyAgICAgICAgICAgfCAgIDMgKwo+ICBsaWIvc2JpL3NiaV92ZWN0b3IuYyAgICAgICAgIHwgMTE4
ICsrKysrKysrKysrKysrKysrKysrCj4gIDggZmlsZXMgY2hhbmdlZCwgNDI2IGluc2VydGlvbnMo
KykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV9mcC5oCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGxpYi9zYmkvc2JpX2ZwLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9zYmkvc2JpX3ZlY3Rv
ci5jCj4KPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCgpJIGhhdmUgc2VuZC1vdXQgdjggdG8gYWRkcmVzcyBteSBv
d24gY29tbWVudHMuCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
