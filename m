Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76148CD4F3C
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ShRM1aOXbapCPIOKZnoZ5kACcx1mJ+IMChICQyobSo=; b=mWvm95m2Z8RBf1
	iUm7uOi/IWXeErYH/AdTqo530EcXboZ3EA7uKN0tVGo/2FE124tm6acrbP2JuGPEycV9sTH+jabk/
	peBqN3M9WhJbXBO60s+SB3ajbFd8CwTVpQBr9G3drWXSHn6uwbWF8YR4F5L/GyTFuK2bzMwPbijpp
	/aExflrvTtt0zKWLvh+1pNg/mAxmmiyiU+5oY7QWMAUlMnbeH9humqZiIzn3BS0ICv6L4BLU95nA0
	GM9Mp3Cn5M7jVACXJRuZEdAZezGpGNGggDMs7n3+cpmDQpZQ0HCFlIucciSdiECvqHuoUqChTyhYD
	eMBLQPy4OiX5qqWtLUKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxVC-0000000FiUo-1p3B;
	Mon, 18 May 2026 12:55:22 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxV9-0000000FiRu-1Bma
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 12:55:20 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-47c941f7213so1449172b6e.1
        for <opensbi@lists.infradead.org>; Mon, 18 May 2026 05:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779108918; cv=none;
        d=google.com; s=arc-20240605;
        b=gbrOMYND8yxzKws1pg21gsIHt0Uj1LlDuzbK8kysEyA+h3zhJmtcVyEfuYE5tX3BV3
         tc/x81ELohw5Yui3LwKAOjIp1O2XRsYd5DnMrsqM0lYshPHgaNWkOl1pUFrEOuWzz+tf
         xcCX2OZmFDljIWylwemblttNxFfAGyxis0Qf4EoKN8nnCvqBtkVD7wlBTxEL6MHVzWvb
         7vv3Be56tsActU8yE2Q8qLwgiI/RNiBdl8/kK+bnNDHShZoXUDLV0QN2sFO45V2jDBy2
         ka4qhEqC/qIiwdcYLCVvuQLNKoJ7jpvnKhFMVKXgS3UZdLUJiYmOPnalWc5enJdCo/Ne
         e7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Zi1njekv+HxCZk+SETHxOiEt9/MyOpx8CRR4751YgA=;
        fh=1CCt9UJmt40SlRo459PKEWIuUxZQ2Zn4py42z4BZDhE=;
        b=bSoe2y19v6vHtPXhubiPI3Xul1DCQ/qdfzmQcGXKyCp6UFgIBnyY0yp2GDZ4qEWFit
         uvLgz0uX5+bxOHZyFw0zFoGhnMlyMDgXExmWyvBq7puOvKsGk5H74GFv5gW0aLRM+4Lt
         ei7Yzjz66NNcAsbqaThAVXu+Pk1SlaHJrm2PMiyckeT1xmgwhn9mPO1zmwd7LuUk0oh9
         NgKX7bDsyIZTtogPq4bBhdJtmnmLqvrYJsuuVfKzT7Qn7a21HSI57Z0cR7EsOaMi2i9o
         23Rn79gtafTEQY5kPRIhgP6LCrBSvBS8UTP3RkKUQz7J4cN85Ifoj4gven+lu1lZBrj5
         ifNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779108918; x=1779713718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Zi1njekv+HxCZk+SETHxOiEt9/MyOpx8CRR4751YgA=;
        b=PERRyJYWCg30kX4UcAakfpgXiDuTsMLvArjly3Sz+g6tp72JDY3lY9qAkMQG7BOBuB
         HF+9tlhcK+tyoghSDt8Ni33ipHj1QrO+alsXs8EXFDzptQacUaPqXXZaRVP8l1Q0MIcv
         /D769r1kSGxEnLHRRvc5gtq04EQ2q7xQu5lRSI0sOlyZocnePPzc2jC3idmi7qJRbKGn
         6RTDaH1Bmkh4sUwzgSYYWWSIt9M66nyEw7upNG4LHoCq4ygydxjD+M9DgJS1IN84Z04f
         roGye64ueor3QLXAnMkTxLi4IC+oDjGteylWn4ZjG291HYiO4wICm6YSiFxqoC1tJh22
         j7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108918; x=1779713718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Zi1njekv+HxCZk+SETHxOiEt9/MyOpx8CRR4751YgA=;
        b=HwbH5WjHVidQDw3PPL+MJumBNMB/KtvO51PISJX2d9moFUoo+mVadcGgk0B9lvKHzE
         400H0uhB2EzPKRyRyTHx9+/DQxMRUpTniKIxMeQYaKWNmbT/+72SfV63upP5Q6SIF6L/
         IfBa3I83yMRcHMXow8xCzjTNHAnlFeMIvQKK3DPWLm+DLT7ZfiY5nE8tL5v+1T69KwOn
         k32vORNCT6EDNCv2GnkTi6OIyntiH75nE6AhkefuP44xOaNfdo/KppuAN7JMLaPvl2L0
         bIj7mrerxL6y2qb3Fa2GMMRoFU4pomLJCzZvszwcjaoyU+galPX522eIwqaU/rMwIvnZ
         rMYA==
X-Gm-Message-State: AOJu0YwTpBh3546ozWvyGTM0OvrbrONgir7uH1B4R4djOym01qzMFvdB
	Lm8T2CRx9AX9uJOwESkr/yFqh54AgFxyZLATcSSJXAUHX2JjO0+Nk1eka2n0J42o3xiK5Kp6kJ7
	4YSq+6PTk5cMH1xzqzSPBD54c6lWtzN/0/sAGGhoaVA==
X-Gm-Gg: Acq92OE2w6Qmzxhilm9wVT1+IG+kHD6LNoEppaAXWA/yw5fmYWbg2nnuGBWVxUAUvV/
	2ADFBFRb21EuYlvRdr76hP3+P1iBJ8Qx1H8nS3jM4K14sG4qglE1qe8gzMUcXf6VhojfOwojeDp
	jr+G0Y2ShColWPk7bmy6J53PlgZXmuD0yuirokjKU7wkXuNWFhrsyDG2j/WFGxSN+UAAuSTLPL2
	1sr/wfeSIrzg0OCpo4o7iwR5MhvfLL/Salgy48HwAuayfb47siPJtEHhe8nFMLR1R5amwCdq9u6
	hjgAvC0L6yHkczeefnzPmwiLxp4eXjEP+NH5OA7KeEhGaZ8LtiMtFisrl9FwFrJHUxn6XFpdrwT
	+yt1nmCvgDpmihe3JFZltvZyAuQQJB0xZtmXV0Low2xAICgQ=
X-Received: by 2002:a05:6820:81c7:b0:69b:8c73:e921 with SMTP id
 006d021491bc7-69c942ef1femr9153540eaf.20.1779108918073; Mon, 18 May 2026
 05:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260516072906.1427203-1-peter.lin@sifive.com>
In-Reply-To: <20260516072906.1427203-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 May 2026 18:25:04 +0530
X-Gm-Features: AVHnY4KmQu4_ajKPP0_gX82u25XoO8NJIr6RH1ajA1gTyJ6LUE0h3HB6fJzEn2s
Message-ID: <CAAhSdy0m7pkgLNyE_k3ybQmhicZjkyqYJGFwevtx6zk94kHx1A@mail.gmail.com>
Subject: Re: [PATCH v3] lib: utils: fdt_domain: add root-regions-inheritance policy
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_055519_587344_C9A298A1 
X-CRM114-Status: GOOD (  25.26  )
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

T24gU2F0LCBNYXkgMTYsIDIwMjYgYXQgMTI6NTnigK9QTSBZdS1DaGllbiBQZXRlciBMaW4KPHBl
dGVyLmxpbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEludHJvZHVjZSByb290LXJlZ2lvbnMtaW5o
ZXJpdGFuY2UgRFQgcHJvcGVydHkgdG8gY29udHJvbAo+IGNvcHlpbmcgb2Ygcm9vdCBkb21haW4g
bWVtcmVnaW9ucy4gU3VwcG9ydCAnYWxsJyBhbmQgJ20tb25seScKPiBtb2RlcywgYWx3YXlzIGlu
aGVyaXRpbmcgZmlybXdhcmUgYW5kIE0tb25seSByZWdpb25zOyBiZWhhdmlvcgo+IG1hdGNoZXMg
bS1vbmx5IHBvbGljeSB3aGVuIHByb3BlcnR5IGlzIGFic2VudC4KPgo+IFNpZ25lZC1vZmYtYnk6
IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+CgpMR1RNLgoKUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0
Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiBDaGFu
Z2VzIHYxLT52MjoKPiAtIEFkZHJlc3NlZCBmZWVkYmFjayBmcm9tIEFudXA6IGh0dHBzOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvb3BlbnNiaS8yMDI2LU1heS8wMDk4NTAuaHRtbAo+
IENoYW5nZXMgdjItPnYzOgo+IC0gRmFpbCBlYXJseSB3aGVuIHVuc3VwcG9ydGVkIHZhbHVlIGlz
IGZvdW5kCj4gLS0tCj4gIGRvY3MvZG9tYWluX3N1cHBvcnQubWQgICAgIHwgIDcgKysrKysKPiAg
bGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMgfCA1MyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDEzIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RvY3MvZG9tYWluX3N1cHBvcnQubWQgYi9kb2Nz
L2RvbWFpbl9zdXBwb3J0Lm1kCj4gaW5kZXggOTMxODZjNGEuLjc3MTIyMzMwIDEwMDY0NAo+IC0t
LSBhL2RvY3MvZG9tYWluX3N1cHBvcnQubWQKPiArKysgYi9kb2NzL2RvbWFpbl9zdXBwb3J0Lm1k
Cj4gQEAgLTE1OSw2ICsxNTksMTMgQEAgVGhlIERUIHByb3BlcnRpZXMgb2YgYSBkb21haW4gaW5z
dGFuY2UgRFQgbm9kZSBhcmUgYXMgZm9sbG93czoKPiAgKiAqKnBvc3NpYmxlLWhhcnRzKiogKE9w
dGlvbmFsKSAtIFRoZSBsaXN0IG9mIENQVSBEVCBub2RlIHBoYW5kbGVzIGZvciB0aGUKPiAgICB0
aGUgZG9tYWluIGluc3RhbmNlLiBUaGlzIGxpc3QgcmVwcmVzZW50cyB0aGUgcG9zc2libGUgSEFS
VHMgb2YgdGhlCj4gICAgZG9tYWluIGluc3RhbmNlLgo+ICsqICoqcm9vdC1yZWdpb25zLWluaGVy
aXRhbmNlKiogKE9wdGlvbmFsKSAtIEEgc3RyaW5nIHByb3BlcnR5IGNvbnRyb2xsaW5nCj4gKyAg
aG93IG1lbW9yeSByZWdpb25zIGFyZSBpbmhlcml0ZWQgZnJvbSAqKnRoZSBST09UIGRvbWFpbioq
LCB3aGljaCBhcmUgdGhlbgo+ICsgIG92ZXJsYWlkIHdpdGggcmVnaW9ucyBzcGVjaWZpZWQgaW4g
dGhlICoqcmVnaW9ucyoqIHByb3BlcnR5IGZvciBhZGRpdGlvbmFsCj4gKyAgcmVzdHJpY3Rpb25z
LiBUaGUgYWxsb3dlZCB2YWx1ZXMgYXJlOgo+ICsgICogImFsbCIgLSBpbmhlcml0IGFsbCBtZW1v
cnkgcmVnaW9ucyBmcm9tICoqdGhlIFJPT1QgZG9tYWluKioKPiArICAqICJtLW9ubHkiIC0gaW5o
ZXJpdCBNLW1vZGUgb25seSBtZW1vcnkgcmVnaW9ucyBmcm9tICoqdGhlIFJPT1QgZG9tYWluKioK
PiArICBJZiB0aGlzIERUIHByb3BlcnR5IGlzIGFic2VudCwgYmVoYXZpb3IgaXMgdGhlIHNhbWUg
YXMgIm0tb25seSIuCj4gICogKipyZWdpb25zKiogKE9wdGlvbmFsKSAtIFRoZSBsaXN0IG9mIGRv
bWFpbiBtZW1vcnkgcmVnaW9uIERUIG5vZGUgcGhhbmRsZQo+ICAgIGFuZCBhY2Nlc3MgcGVybWlz
c2lvbnMgZm9yIHRoZSBkb21haW4gaW5zdGFuY2UuIEVhY2ggbGlzdCBlbnRyeSBpcyBhIHBhaXIK
PiAgICBvZiBEVCBub2RlIHBoYW5kbGUgYW5kIGFjY2VzcyBwZXJtaXNzaW9ucy4gVGhlIGFjY2Vz
cyBwZXJtaXNzaW9ucyBhcmUKPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWlu
LmMgYi9saWIvdXRpbHMvZmR0L2ZkdF9kb21haW4uYwo+IGluZGV4IGIyZmE4NjMzLi5iMzEyNTRh
ZiAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvZmR0L2ZkdF9kb21haW4uYwo+ICsrKyBiL2xpYi91
dGlscy9mZHQvZmR0X2RvbWFpbi5jCj4gQEAgLTEwLDYgKzEwLDcgQEAKPgo+ICAjaW5jbHVkZSA8
bGliZmR0Lmg+Cj4gICNpbmNsdWRlIDxsaWJmZHRfZW52Lmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2Jp
X2NvbnNvbGUuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4gICNpbmNsdWRlIDxz
Ymkvc2JpX2Vycm9yLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2hhcnRtYXNrLmg+Cj4gQEAgLTIz
Nyw3ICsyMzgsOSBAQCBza2lwX2RldmljZV9kaXNhYmxlOgo+ICAgICAgICAgZmR0X25vcF9ub2Rl
KGZkdCwgcG9mZnNldCk7Cj4gIH0KPgo+IC0jZGVmaW5lIEZEVF9ET01BSU5fUkVHSU9OX01BWF9D
T1VOVCAgICAxNgo+ICsjZGVmaW5lIEZEVF9ET01BSU5fUkVHSU9OX01BWF9DT1VOVCAgICAgICAg
ICAgIDE2Cj4gKyNkZWZpbmUgRkRUX1JPT1RfUkVHSU9OX0lOSEVSSVRfTV9PTkxZICAgICAgICAg
MAo+ICsjZGVmaW5lIEZEVF9ST09UX1JFR0lPTl9JTkhFUklUX0FMTCAgICAgICAgICAgIDEKPgo+
ICBzdHJ1Y3QgcGFyc2VfcmVnaW9uX2RhdGEgewo+ICAgICAgICAgc3RydWN0IHNiaV9kb21haW4g
KmRvbTsKPiBAQCAtMzA5LDEyICszMTIsMTQgQEAgc3RhdGljIGludCBfX2ZkdF9wYXJzZV9kb21h
aW4oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNldCwgdm9pZCAqb3BhcXVlKQo+ICAg
ICAgICAgdTMyIHZhbDMyOwo+ICAgICAgICAgdTY0IHZhbDY0Owo+ICAgICAgICAgY29uc3QgdTMy
ICp2YWw7Cj4gKyAgICAgICBjb25zdCBjaGFyICppbmhlcml0Owo+ICAgICAgICAgc3RydWN0IHNi
aV9kb21haW4gKmRvbTsKPiAgICAgICAgIHN0cnVjdCBzYmlfaGFydG1hc2sgKm1hc2s7Cj4gICAg
ICAgICBzdHJ1Y3Qgc2JpX2hhcnRtYXNrIGFzc2lnbl9tYXNrOwo+ICAgICAgICAgc3RydWN0IHBh
cnNlX3JlZ2lvbl9kYXRhIHByZWc7Cj4gICAgICAgICBpbnQgKmNvbGRfZG9tYWluX29mZnNldCA9
IG9wYXF1ZTsKPiAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluX21lbXJlZ2lvbiAqcmVnOwo+ICsg
ICAgICAgaW50IGluaGVyaXRhbmNlX21vZGUgPSBGRFRfUk9PVF9SRUdJT05fSU5IRVJJVF9NX09O
TFk7Cj4gICAgICAgICBpbnQgaSwgZXJyID0gMCwgbGVuLCBjcHVzX29mZnNldCwgY3B1X29mZnNl
dCwgZG9mZnNldDsKPgo+ICAgICAgICAgZG9tID0gc2JpX3phbGxvYyhzaXplb2YoKmRvbSkpOwo+
IEBAIC0zNzMsMjAgKzM3OCw0MiBAQCBzdGF0aWMgaW50IF9fZmR0X3BhcnNlX2RvbWFpbihjb25z
dCB2b2lkICpmZHQsIGludCBkb21haW5fb2Zmc2V0LCB2b2lkICpvcGFxdWUpCj4gICAgICAgICBp
ZiAoZXJyKQo+ICAgICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9hbGw7Cj4KPiAtICAgICAg
IC8qCj4gLSAgICAgICAgKiBDb3B5IG92ZXIgcm9vdCBkb21haW4gbWVtcmVnaW9ucyB3aGljaCBk
b24ndCBhbGxvdwo+IC0gICAgICAgICogcmVhZCwgd3JpdGUgYW5kIGV4ZWN1dGUgZnJvbSBsb3dl
ciBwcml2aWxlZ2UgbW9kZXMuCj4gLSAgICAgICAgKgo+IC0gICAgICAgICogVGhlc2Ugcm9vdCBk
b21haW4gbWVtcmVnaW9ucyB3aXRob3V0IHJlYWQsIHdyaXRlLAo+IC0gICAgICAgICogYW5kIGV4
ZWN1dGUgcGVybWlzc2lvbnMgaW5jbHVkZToKPiAtICAgICAgICAqIDEpIGZpcm13YXJlIHJlZ2lv
biBwcm90ZWN0aW5nIHRoZSBmaXJtd2FyZSBtZW1vcnkKPiAtICAgICAgICAqIDIpIG1taW8gcmVn
aW9ucyBwcm90ZWN0aW5nIE0tbW9kZSBvbmx5IG1taW8gZGV2aWNlcwo+IC0gICAgICAgICovCj4g
KyAgICAgICAvKiBEZXRlcm1pbmUgcm9vdCBkb21haW4gcmVnaW9ucyBpbmhlcml0YW5jZSBiZWhh
dmlvci4gKi8KPiArICAgICAgIGluaGVyaXQgPSBmZHRfZ2V0cHJvcChmZHQsIGRvbWFpbl9vZmZz
ZXQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyb290LXJlZ2lvbnMtaW5oZXJp
dGFuY2UiLCAmbGVuKTsKPiArICAgICAgIGlmIChpbmhlcml0ICYmIGxlbiA+IDApIHsKPiArICAg
ICAgICAgICAgICAgaWYgKCFzdHJjbXAoaW5oZXJpdCwgImFsbCIpKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGluaGVyaXRhbmNlX21vZGUgPSBGRFRfUk9PVF9SRUdJT05fSU5IRVJJVF9BTEw7
Cj4gKyAgICAgICAgICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoaW5oZXJpdCwgIm0tb25seSIpKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGluaGVyaXRhbmNlX21vZGUgPSBGRFRfUk9PVF9SRUdJ
T05fSU5IRVJJVF9NX09OTFk7Cj4gKyAgICAgICAgICAgICAgIGVsc2Ugewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBkb21haW4gXCIlc1wiIGhhcyB1bnN1cHBvcnRl
ZCAiCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicm9vdC1yZWdpb25zLWlu
aGVyaXRhbmNlPVwiJXNcIlxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF9fZnVuY19fLCBkb20tPm5hbWUsIGluaGVyaXQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGVyciA9IFNCSV9FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBmYWlsX2Zy
ZWVfYWxsOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgLyog
Q29weSBvdmVyIHJvb3QgZG9tYWluIG1lbXJlZ2lvbnMgYWNjb3JkaW5nIHRvIGluaGVyaXRhbmNl
X21vZGUuICovCj4gICAgICAgICBzYmlfZG9tYWluX2Zvcl9lYWNoX21lbXJlZ2lvbigmcm9vdCwg
cmVnKSB7Cj4gLSAgICAgICAgICAgICAgIGlmICgocmVnLT5mbGFncyAmIFNCSV9ET01BSU5fTUVN
UkVHSU9OX1NVX1JFQURBQkxFKSB8fAo+IC0gICAgICAgICAgICAgICAgICAgKHJlZy0+ZmxhZ3Mg
JiBTQklfRE9NQUlOX01FTVJFR0lPTl9TVV9XUklUQUJMRSkgfHwKPiAtICAgICAgICAgICAgICAg
ICAgIChyZWctPmZsYWdzICYgU0JJX0RPTUFJTl9NRU1SRUdJT05fU1VfRVhFQ1VUQUJMRSkpCj4g
KyAgICAgICAgICAgICAgIGJvb2wgY29weSA9IGZhbHNlOwo+ICsKPiArICAgICAgICAgICAgICAg
c3dpdGNoIChpbmhlcml0YW5jZV9tb2RlKSB7Cj4gKyAgICAgICAgICAgICAgIGNhc2UgRkRUX1JP
T1RfUkVHSU9OX0lOSEVSSVRfQUxMOgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvcHkgPSB0
cnVlOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAgICBj
YXNlIEZEVF9ST09UX1JFR0lPTl9JTkhFUklUX01fT05MWToKPiArICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoU0JJX0RPTUFJTl9NRU1SRUdJT05fSVNfRklSTVdBUkUocmVnLT5mbGFncykgfHwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9PTkxZ
X0FDQ0VTUyhyZWctPmZsYWdzKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29weSA9IHRydWU7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAg
ICBpZiAoIWNvcHkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICAg
ICAgICAgICAgICAgICBpZiAocHJlZy5tYXhfcmVnaW9ucyA8PSBwcmVnLnJlZ2lvbl9jb3VudCkg
ewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IFNCSV9FSU5WQUw7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfYWxsOwo+IC0tCj4gMi40My43Cj4KCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
