Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FC8CD342F
	for <opensbi@archiver.kernel.org>; Fri,  8 May 2026 04:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHAaRD6RVYNTPNxfTHgb7P2NXHpTakN1bSXvp8ipW70=; b=lWtKrfNasc9Tbt
	tKe0q6+Jn6QXn0JdZFuIPdtfLwfpUmEZeApQD3/t5zUMQc/+QXRrXb9OSNaxgTubm8wW99B7KN/RG
	norqgfOy+lteKOEZ5KWzv6s9HHcuNzRtt48azIBg6qtnwE8CTooZl/FxWp1903656JrBsWxjmmznU
	MQtlF+IELyO/ZAvZLI/yiySTDFtQ08X/1Iiz7LGECzMcLxh/0L3OGg0LGX0k0cgTYSImZs63oM6hT
	oyQlr1Vj91Rng+Q4sfo/lmPdYzCem2wJ2JJER0pHEVn6AKUZHRtlC61KMU7z4UMY5+iZLmKf+Dywj
	u5CfaYlREX6fdL9tsBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLDDT-00000005ZEW-2Pif;
	Fri, 08 May 2026 04:53:35 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLDDQ-00000005ZDm-0yZ9
	for opensbi@lists.infradead.org;
	Fri, 08 May 2026 04:53:34 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7dca00c1591so552451a34.3
        for <opensbi@lists.infradead.org>; Thu, 07 May 2026 21:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778216009; cv=none;
        d=google.com; s=arc-20240605;
        b=ZWXsmtMz7QJW3Ebq/kVc8dDTKb/Usb2u8CiXKaAh77ChMJK/SnO2tnwzSDjcg8BIiR
         hr08ZWcu8KQIToOOYqCGRtFzhafNAZCNwBwVYQbezkvls6I0Fb3tKZMIP8YCiBZQr9oQ
         Hjo+V8nmt1HEJqFu1iankhY/hdDfaz0urDlOBAda1o7+OdUqcvVF2fOO9wB3xB9hl46R
         zhGUOP/WI78BElxlLNvSWVjoyxA90JOEXP+XN9HciDLa6iUd0ZjSXOm8QrgRLnVLorMB
         vsqECUr8Q9mQQCRQpPNFc/AYF+SEb5fPKPZS6JAoXuW7NyyRgxi/3bMSm+16k4M1eZKo
         Kw4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pscZMkx7CqThlkHvH6rlnBtEn+XjJQuqtT5pCRbVdbU=;
        fh=ZAtPgNT/mWeTZ6vNEkZRyB0hM0YzwkpsSL1tZLHA+mM=;
        b=jabtJBbNk1BzLj+wwHgdNihmmom5LhPyZQPvTuK1H9RvHDeSYsV0wR4Q6jDTlzSQCD
         JWUnh28/oBWVhAYRzpwZiRriefxawTks4xctgP4cY7B5KYMWk41gUn4pYZ1ajNBTIKHk
         5UI7rUj0xue8ntwLUE5LSJZEj3s1F8fd6LhRmY0VGbkvaUvwHZZ8IBvR7HLxdfxUv+wo
         xV4ZUk3ISRhg3W/tBuEv2zb9mwLlLXh2gJMnPMh7slFpQaHaFIGcYovWF04NRIbusNWg
         uT7dk/ixikpfRm8W2S9TxEZg1+2SNb0kwM4P1dVyOsumc/zyiPwjQt8fKZwPFRe5zVQo
         8UJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778216009; x=1778820809; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pscZMkx7CqThlkHvH6rlnBtEn+XjJQuqtT5pCRbVdbU=;
        b=OmNbTxBeLsSlGATX6RdzWJ66gklDFz9rvW7aHftvO81WHI6YqDuBCJne89upfstpgu
         eMhzHK/bAsz/jeo69IosGNjxkcnPxPq2bnf5RSbHwtN6UF5or6yxBUic3IxlwZDYpq9B
         zHX6ItbtL8p2fJuVoVzzXWzv3mznnTdROcysi1+WpE+TFZrl6p32Ngk/6x6+fNxnMAyU
         LLJK8vbujgaxZSZ482UhOHl0HZannX8zQFdCkiSkyWzdTWx5p8ZZLaNgzloLpzLocxRE
         wKLr2g9FiNCgcPGHhMSLKhKZ3YE+bwAcpTqZyTVFzPSrt1q7ryNkTpAPxy5YR/GrRKgS
         +N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778216009; x=1778820809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pscZMkx7CqThlkHvH6rlnBtEn+XjJQuqtT5pCRbVdbU=;
        b=I3WJ7A8Ybu414NylZxZtZdMVW3R5s8cKRb4ZKb/rhNo1jnjHlvD2j15wiC8hwPa5j2
         pvYldKVP7Khr5qNAcO2tbWJU+H8Hu0lBdGR1FHE7dM40GQhBMzfF12lp3ouZgOUOkM5k
         Mad3Npbth90+sTBtDt/nLeIxZBOj5RMekCZ+ODWRQWK4wtE0AZSQrvNIt7inSbqFnFe6
         ZLO/XWDh/iDoxxN+TQros0rl4IhMMNfAjZPyogiQis4sd7KUxROKeB9Wx4pj2DHvmi9K
         39jNgkCzG5Xn9I8yruOxFF6XvYG+YIsTVXIGdPgr40sACbcBmO34Z7VUyzLLy6msT3fl
         K0yw==
X-Gm-Message-State: AOJu0YwD/MvN80x+nwqeOPZBbbOC8MX3k09/PZBxqjSscJRA4bLTv4Vj
	cZASodaoUQVYcxlt3i3acE96uLtqMUBi0SHQjY/Rf6OzV5Faj1TNo6pOYrlgtyGGeeKTxkyzvwT
	M/qY5VJ9Cf1GHl8WtJmX0SFPpv3Vg3+78oXqlpFcQbw==
X-Gm-Gg: AeBDietg7svf6gBJzeMi5i7IQp4YwHLR1yt6J6H7CjdCaeVTpih0VztcYXB3gMIc9Ee
	MhgWoZeaJFIppa+aKEEJ6/uL41zP/w/ttqdDAMy0neVkmUi3qqRf6d//au7DiroJ2JaIsC1S+RF
	is2z+S6uZiSucskN3y74VuG4ycpoVPLgl+3A/qOqWoco65tXH42/8/LHrgZY3OC0dlqegQUtQWH
	JLCZa/vx25aVoTNoog7NxOaRjmxzXwvEw55aqFoOgPzAqO37c8AJyF0JQGJ0mh88eySrVpMBlj0
	zulsG9aKLx9dmuwHsl+uaPPDOuYl8NQEjh22BOXeNpNLoInb44lpuzXvApnoLlEHoqP2CZGBGvB
	fE75kUeLTKGEr/rE6+qYcTVetbZw=
X-Received: by 2002:a05:6820:1c91:b0:67e:42ca:bf0 with SMTP id
 006d021491bc7-69998d173d6mr6027730eaf.39.1778216008941; Thu, 07 May 2026
 21:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778176768.git.evvoevod@tenstorrent.com> <d066935990f12e1f4f21cd709eb20afba618b134.1778176768.git.evvoevod@tenstorrent.com>
In-Reply-To: <d066935990f12e1f4f21cd709eb20afba618b134.1778176768.git.evvoevod@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 May 2026 10:23:17 +0530
X-Gm-Features: AVHnY4Ig26R11jAv0GjgJbpz6YiHBOcGYKObRNJ_vKLsOuvXTUekpY4N-yP7Fm0
Message-ID: <CAAhSdy1A2PrMEQQOqV7y6_tBzXRwefu1r0Py0WA3fhUxq1KDaQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] lib: sbi: hart: Move device tree features
 detection before trap-based checks
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_215332_529482_8B4A8251 
X-CRM114-Status: GOOD (  17.02  )
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

T24gVGh1LCBNYXkgNywgMjAyNiBhdCAxMTozOOKAr1BNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IFNtcm5taSBkZXRlY3Rpb24gYW5kIGVuYWJs
ZW1lbnQgaW4gdGhlIGZvbGxvd2luZyBjb21taXRzIHdpbGwgaGFwcGVuCj4gYmVmb3JlIGFueSB0
cmFwLWJhc2VkIG1lY2hhbmlzbS4gQXMgaXQgcmVsaWVzIG9uIGRldmljZSB0cmVlLCBtb3ZlCj4g
c2JpX3BsYXRmb3JtX2V4dGVuc2lvbnNfaW5pdCgpIHRvIHRoZSBiZWdpbm5pbmcgb2YgaGFydF9k
ZXRlY3RfZmVhdHVyZXMoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEV2Z2VueSBWb2V2b2RpbiA8ZXZ2
b2V2b2RAdGVuc3RvcnJlbnQuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlf
aGFydC5jIHwgMTYgKysrKysrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0
LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCA0YWVmYjc1OS4uNzgxMTYxZTUgMTAwNjQ0
Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4g
QEAgLTUyMiw2ICs1MjIsMTYgQEAgc3RhdGljIGludCBoYXJ0X2RldGVjdF9mZWF0dXJlcyhzdHJ1
Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gICAgICAgICBoZmVhdHVyZXMtPm1ocG1fbWFzayA9
IDA7Cj4gICAgICAgICBoZmVhdHVyZXMtPnByaXZfdmVyc2lvbiA9IFNCSV9IQVJUX1BSSVZfVkVS
X1VOS05PV047Cj4KPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBQYXJzZSBkZXZpY2UgdHJlZSBl
eHRlbnNpb25zIGVhcmx5LCBiZWZvcmUgYW55IHRyYXAtYmFzZWQgY2hlY2tzLgo+ICsgICAgICAg
ICogTmVlZGVkIHRvIGRldGVjdCBTbXJubWkgYW5kIGluc3RhbGwgTk1JIGhhbmRsZXJzIGJlZm9y
ZSBDU1IgcHJvYmVzCj4gKyAgICAgICAgKiB0aGF0IG1heSB0cmlnZ2VyIHRyYXBzLgo+ICsgICAg
ICAgICovCj4gKyAgICAgICByYyA9IHNiaV9wbGF0Zm9ybV9leHRlbnNpb25zX2luaXQoc2JpX3Bs
YXRmb3JtX3RoaXNoYXJ0X3B0cigpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGhmZWF0dXJlcyk7Cj4gKyAgICAgICBpZiAocmMpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiByYzsKPiArCj4gICNkZWZpbmUgX19jaGVja19ocG1fY3NyKF9fY3NyLCBfX21hc2sp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIG9s
ZHZhbCA9IGNzcl9yZWFkX2FsbG93ZWQoX19jc3IsICZ0cmFwKTsgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiAgICAgICAgIGlmICghdHJhcC5jYXVzZSkgeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiBAQCAtNjc2LDEyICs2ODYsNiBAQCBfX3Bt
cF9za2lwOgo+Cj4gICN1bmRlZiBfX2NoZWNrX2Nzcl9leGlzdGVuY2UKPgo+IC0gICAgICAgLyog
TGV0IHBsYXRmb3JtIHBvcHVsYXRlIGV4dGVuc2lvbnMgKi8KPiAtICAgICAgIHJjID0gc2JpX3Bs
YXRmb3JtX2V4dGVuc2lvbnNfaW5pdChzYmlfcGxhdGZvcm1fdGhpc2hhcnRfcHRyKCksCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGZlYXR1cmVzKTsKPiAtICAg
ICAgIGlmIChyYykKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+IC0KPiAgICAgICAgIC8q
IFppY250ciBzaG91bGQgb25seSBiZSBkZXRlY3RlZCB1c2luZyB0cmFwcyAqLwo+ICAgICAgICAg
X19zYmlfaGFydF91cGRhdGVfZXh0ZW5zaW9uKGhmZWF0dXJlcywgU0JJX0hBUlRfRVhUX1pJQ05U
UiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpX2hhcnRfaGFzX2NzcihzY3JhdGNo
LCBTQklfSEFSVF9DU1JfQ1lDTEUpICYmCj4gLS0KPiAyLjQzLjAKPgoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
