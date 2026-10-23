Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DB3606A31B
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GvkUYSgi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=HqslFtUn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7IThQ6Ot1p8T5ZnUgsPCc5CPHO6JSckmqz6nYHOZ7MM=; b=GvkUYSgiGJU9Bo46/yzLqFEJSE
	aIjDQMVFwVvA2O3P4UHluryY+2DAjwSdf+ojdAtJMLvYUJb5rDfAjdEONKzjI1xfD3IoezivCHJYM
	yC8C9hCHSo1QaZGoX2Snrhw+nhmyOJ2OexIj6vpBjYtp94MNnscGNw06gty5YAphBk/e+Ps9VZ6FD
	G6FKlb5GGqppzZL2RsRAWwnDYv2IcVFt+2crtN4DhCczCwMMP9dZKL1KTORWWukhpiZv5rNtqb5nr
	mLBRYfugLo/4gyE4La6A16dZGhEMK5RgoJYKXJFHevZIdtPMQnnuru0mjwE4/3+Uqu2+mQezkKi2l
	Arak3KxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAdQ-0000000Fvhx-3rif;
	Fri, 23 Oct 2026 08:28:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAdN-0000000FvhO-01nN
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 08:28:18 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so328761f8f.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 01:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792744095; cv=none;
        d=google.com; s=arc-20260327;
        b=QdapoNzpR0xODoXRSAPm57/W0op3s8j0deZPMFCHA6KLpPDshs0I4V9Y2TADu+4/Dr
         g5vvCm/vtCQQorV6AeCajA4NaYsaLgJEpi61Ts6zpfUFa6PVE1LvKapVnlBqQw4iUXUt
         zONaYEtAm+9dtgCTTdrxWNMaSXdBG+LS6op20mdmzpwQE4JzFHN54iwsLHiBrGK4FPsm
         b0Hj552twMXo2vZRF7GhQnfOyNu3qNw0ptgRLaoiZwaURYD9rLdAOrs11m32oHSfAxMZ
         Qpb8Us4PLvC4EfIX8oK2194K0YTQB5vcEvR4JZ/QjrOECejVQJjBjJaCUG96+7kfcvSc
         TMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UGHN0VRfgGwCuL4xYd8T5ex92mVatZU8obqiLTbDm/0=;
        fh=5emmNB3U4r8n1Y/QVKLi4HS/ZKMZuXCzE/w4Z/e30OU=;
        b=OoPd7dFN30//5RSdJVWdtzH9RHLWZ+c2DshxmF59Sayt6PTx79l2LrN/qJR/rL5FXW
         GYEat3FB64UEDjfKMGX+r2eqNKEB3FM8+cX6cmU1rW73fxLrCe4IEDlxwFGdm/Sfa2uT
         qR/yJ8DFpLDXv4Wv7BTaUi1rWDcfVADCWkGDSR9CfgtKU/8TeFFxqYrvQhhrQ9v+BllZ
         7VfzlOzHJb70aM9VXwWhc1eS1DNrSv36dHuIl8rZFi5w48FkK7xCTcosTt3b2gVH/+Q3
         ssE3Jlge5EwfxGdfTpcLufeiNSAUAo8apDpWKc6gr8TLM2UDYP3nC4wSPKUNEfo4ioq/
         /jEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792744095; x=1793348895; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UGHN0VRfgGwCuL4xYd8T5ex92mVatZU8obqiLTbDm/0=;
        b=HqslFtUn14xo1XfO82CNZjZNCHm1rVjkdpG0JfJEt5lqrhBXu+RPMoyePCRtjy/Mn5
         ZG+cEfXywqRajdFyCyol+6+qkdNaHKlUE0gW0D4mLCWP3rIBNW8pHg/pwQI4SLVFo/Cg
         S/i2/ByDdr4ztkhaPpoRBCLLvN6fb0hjtZs2CcYDyIkKYhGAWghrzMYz0oxmn5qM5lC3
         /I39bbi2rDK6S1PWcaRNmO1eFvkwMpZ2iIHhAzA3QVBFVIsiBokXF0IoGfLoTw+WHJM/
         M+iBdMQb6AXxyNhIPst8+7MYRna2+w9GEGgG8ZUJt4pqxan/LpNvIqbJ5lokMR/ehgQG
         YrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744095; x=1793348895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGHN0VRfgGwCuL4xYd8T5ex92mVatZU8obqiLTbDm/0=;
        b=AX97nMlyP3Hd/hWdY94kvlXra+BoBPuVGmYDnQ8pLrpTbWbrAYpRamuyRKEgYfDAo0
         6R7aNHW//O2liGRco4ZjkZ/RD0dDXX46F6nlayktOsgzQorLntQyy7dvHg667hkuKxx0
         UAA1K9BbXFj4DrPOqvJXFBRuhP4p65pwKeVjsopbe9OE1TXlUAOLc9yJf65vPUtcyA+G
         gDVdm2oZJIF4HEIOQxnv3lgzUsVfqkB2K4TPq50y6rsTPs+Q+L9u5xL1X0YC7oi70jOP
         GHiNdY32g+yx6ocukk/TgjCl73PoM6TTmb0+yFk62yFEhyuVZ+SL54rgyDkzvg7Pe0vN
         AfRw==
X-Gm-Message-State: AFq9FYKD+5kXHQ98VD4HJlZYE+ZQtSsBhtBZm2TaSqxOlO1sfMiOolJ3
	J/oIPwQxjzT+ut8TkXCLUCGRWpKqPx3YgmGY+ZQ1QlHJM5K5N+Y+wM/mZp8BW3yTYqtmUYa/bWP
	7zJVRrviYll43E90cgPkOsHuPp2EiBeB8mPmOEF4n4w==
X-Gm-Gg: AYBFou176SFfVolCK6cTZIycVvz/dhFEXZ16IV3kT4g2koPL8gyRNxv2Vpq7AYJlVTK
	3tUB8ZGJ56pDnIBiNf1/EHYFA7aVJWJ/NRAMW9jMj8FFbv56CVwg2Iy3B871r6K0kBOyW0q4uRD
	iH5LBBaHHeay95KD1S7eob5H+n3VWoJH9C9mlS1SjjESEzPoLNWQtUI9yBtVKv02EzuOSmIIBDA
	hJiT0UD9mFEoHMuYOnmoA/ukdVai61GmKWs2Upnb+5uZXz5TSY31ndDbQ3S4Evy+3Syy1o1SIH9
	DtdLe4/bMyLDQ6AUElDeoT+fCaxPKTjb8uEUMkmtS0dJpRlm4rBM7QL7oMC0fOuigju42Tf1sRP
	jb2hJqTX0Rb03Gdx7XZMngL7H0vwEDnBg9beHLUmJz36qewuLo7aDSHgwTlK9Lqg3OY5KYaQ3M1
	iBLUQLEo+t/kYs9g+0HZxF0H4HgxgbGOdKMe++2hfS/BlP0mnUsvYq6CA=
X-Received: by 2002:a05:6000:4211:b0:48e:d7c:4bc3 with SMTP id
 ffacd0b85a97d-48e2d269fe6mr9376718f8f.21.1792744094834; Fri, 23 Oct 2026
 01:28:14 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260831130641.54100-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260831130641.54100-1-pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 13:58:03 +0530
X-Gm-Features: AclHuK-ej9LcJfstVNI9zoIzwy6e3fipGTm8QoOrF7rLCr_Da3rD7OK_6Upinsg
Message-ID: <CAAhSdy0pmSVk+LR8nGp7mNSsR--ftgCoRT_FeXXp=CGqdNSEhw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_timer: Restart events from the restart list
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>, 
	Nicholas Piggin <npiggin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_012817_090171_2C5EFD39 
X-CRM114-Status: GOOD (  19.52  )
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

T24gTW9uLCBBdWcgMzEsIDIwMjYgYXQgNjozNuKAr1BNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGltZXIgY2FsbGJhY2tzIGNhbiByZXF1ZXN0IHRoYXQg
YW4gZXhwaXJlZCBldmVudCBiZSByZXN0YXJ0ZWQuIFN1Y2gKPiBldmVudHMgYXJlIG1vdmVkIHRv
IGEgbG9jYWwgcmVzdGFydF9saXN0LCBidXQgdGhlIHJlc3RhcnQgbG9vcCB0ZXN0cyB0aGF0Cj4g
bGlzdCB3aGlsZSByZWFkaW5nIGl0cyBmaXJzdCBlbnRyeSBmcm9tIHRzdGF0ZS0+ZXZlbnRfbGlz
dC4KPgo+IElmIHRoZSBtYWluIGV2ZW50IGxpc3QgaXMgZW1wdHksIHRoZSBsb29wIHRyZWF0cyBp
dHMgbGlzdCBoZWFkIGFzIGEgdGltZXIKPiBldmVudC4gT3RoZXJ3aXNlIGl0IHJlcGVhdGVkbHkg
cmVtb3ZlcyBhbmQgcmVpbnNlcnRzIHRoZSB3cm9uZyBldmVudAo+IHdoaWxlIHJlc3RhcnRfbGlz
dCByZW1haW5zIG5vbmVtcHR5LCBzbyB0aW1lciBwcm9jZXNzaW5nIGNhbm5vdAo+IGNvbXBsZXRl
Lgo+Cj4gTm8gaW4tdHJlZSBjYWxsYmFjayBjdXJyZW50bHkgcmVxdWVzdHMgYSByZXN0YXJ0LCBi
dXQgdGhlIHRpbWVyLWV2ZW50Cj4gY2FsbGJhY2sgaW50ZXJmYWNlIGV4cG9zZXMgdGhpcyBwYXRo
IHRvIE9wZW5TQkkgbGlicmFyeSBhbmQgcGxhdGZvcm0KPiB1c2Vycy4KPgo+IFJlYWQgdGhlIGV2
ZW50IGZyb20gcmVzdGFydF9saXN0LCBtYXRjaGluZyB0aGUgbG9vcCBjb25kaXRpb24gYW5kIHRo
ZQo+IGxpc3QgdGhhdCBvd25zIHRoZSBlbnRyeS4KPgo+IEZpeGVzOiBiN2ZhOGEyNDZjYmEgKCJs
aWI6IHNiaV90aW1lcjogQWRkIHN1cHBvcnQgZm9yIHRpbWVyIGV2ZW50cyIpCj4gU2lnbmVkLW9m
Zi1ieTogUGVuZ3BlbmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkxHVE0uCgpSZXZpZXdl
ZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRj
aCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBsaWIv
c2JpL3NiaV90aW1lci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV90aW1lci5jIGIvbGli
L3NiaS9zYmlfdGltZXIuYwo+IGluZGV4IDhhYmI1ZTdiLi5iYTYwYTRlNSAxMDA2NDQKPiAtLS0g
YS9saWIvc2JpL3NiaV90aW1lci5jCj4gKysrIGIvbGliL3NiaS9zYmlfdGltZXIuYwo+IEBAIC0z
MjQsNyArMzI0LDcgQEAgdm9pZCBzYmlfdGltZXJfcHJvY2Vzcyh2b2lkKQo+ICAgICAgICAgfQo+
Cj4gICAgICAgICB3aGlsZSAoIXNiaV9saXN0X2VtcHR5KCZyZXN0YXJ0X2xpc3QpKSB7Cj4gLSAg
ICAgICAgICAgICAgIGV2ID0gc2JpX2xpc3RfZmlyc3RfZW50cnkoJnRzdGF0ZS0+ZXZlbnRfbGlz
dCwgc3RydWN0IHNiaV90aW1lcl9ldmVudCwgaGVhZCk7Cj4gKyAgICAgICAgICAgICAgIGV2ID0g
c2JpX2xpc3RfZmlyc3RfZW50cnkoJnJlc3RhcnRfbGlzdCwgc3RydWN0IHNiaV90aW1lcl9ldmVu
dCwgaGVhZCk7Cj4gICAgICAgICAgICAgICAgIHNiaV9saXN0X2RlbCgmZXYtPmhlYWQpOwo+ICAg
ICAgICAgICAgICAgICBfX3NiaV90aW1lcl9ldmVudF9zdGFydCh0c3RhdGUsIGV2LCBldi0+dGlt
ZV9zdGFtcCk7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjUwLjEgKEFwcGxlIEdpdC0xNTUpCj4KPgo+
IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
