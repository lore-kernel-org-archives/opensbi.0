Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E82FC72AB
	for <opensbi@archiver.kernel.org>; Sun, 22 Mar 2026 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlDOPKBD6cFPWgqYK0x8v0J6/sT48ELG8+EVhClBMJM=; b=QhwL8rgc64DNPe
	EznXt+JOz0di57jjSAcOwGE9NHwWKRoaeSvc2/CAWM7X4+RoFVTrjtQb1phOfIVwVU6pyd+2gllLg
	PQFw5tGAonAHmrWjxKwqzPGN2TmH42WWDwLdCNfCJztYprMeD5a6berXqRyVTNmbWNRIWE4e9l3vG
	C9/Cw4FaXLPdY33g5+R/q5bUF8tbTzVCB1kZZcxw0t/Ud2qjFp5McyreP45xDiVmesLYDnHbHNAW8
	NbPar0qpHe1TJYv16XQmcK6eaOLDh86OS1gjuzrKN0AKu9qyw6INgdKmQ8REIR4cpBJcq6/v4ru0E
	g55oeTAv1EolnhPn23hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4BpM-0000000F6di-1hvf;
	Sun, 22 Mar 2026 05:58:20 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4BpJ-0000000F6dM-265N
	for opensbi@lists.infradead.org;
	Sun, 22 Mar 2026 05:58:18 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d750eeaec3so780341a34.0
        for <opensbi@lists.infradead.org>; Sat, 21 Mar 2026 22:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774159096; cv=none;
        d=google.com; s=arc-20240605;
        b=HBrrm16SIWG8wXhoavNRz6/PSq70BfpZf4N90HJ+OVWyYiF3UH3V6BPv2m2v8x2wMt
         IUFSWzkkNUdKidWVpvzy6nM3X6kk+0sdxs5iXsfCkoLa/oDE6Aby+84fP1Kc0DRUed7v
         Y6sQRDUD/ZVOGRg5xx7aQyx/EmratTJKpY4cHCob3AfWkXhb5RMYFdUzOE4AWUX2QlL2
         7Nplv/sB+2Kbs2Cst61jQr+Amj2kpQzZfQB1UGnLlY7lhMqBYg2aMmMcVsHpIbG7ksf1
         V3MmYRwn51DgL2snrs3RAZA/UN9t2OsRlWwncYcvGQVWJrNpnzZMWbH9Y0ZM69ylvXSA
         QEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9SSY9A93RpjuKk7+iKmG9x/ILiDG4sJu1Zfs0QKYiO0=;
        fh=1CCt9UJmt40SlRo459PKEWIuUxZQ2Zn4py42z4BZDhE=;
        b=CEfES6mJTR0+JxfUg4QrshnONU6G2DYVUD/WQVgGwFXsBDKwmkkaT+9LEYO5MCVKQb
         NFPhEXlO8hJFOVb2mTG3zwHD34LEXxOeLMmbfMusG0uoY6upTBVxUCPEHMpFBI85Gf4V
         5Zh8KmCxTnyDv+jw4yIbKsXCBJ+AF1rawN/NulI7ddpgUrD4i4DXRmJzanWxV8Y1lu3e
         OvDVD/i96393+rnd9J9zJU+8jHiM/mZ2NSr98MGTqZqSgtZP4k0tk+f4cIxw9z0enarD
         kVy2KXoQv0KrXwMas+kIJPMq8PGX51rlYYmuj6vPh+32pPp5l7jUnsBmN+jeD76v+syE
         HnNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774159096; x=1774763896; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SSY9A93RpjuKk7+iKmG9x/ILiDG4sJu1Zfs0QKYiO0=;
        b=uN42aurBOMhqhUGTV4ZzNBRcn0h5TysGjmZS4eluPwY3Yv/EgY/rHlBdNo9Fz20c3k
         2cHc/gAlF+32deyoVCfwucP/VXfRDQFQZ3odhMmRvNflLw2ojiTUjOxz6bGoMG+35PIV
         4qGUYm1T7JOW4qXgKgfRXtQfbdeyH2HTV/J7yQ/wUkECHlcjGIf5w4SfvlWNMoO9J+Md
         YN4Smq9RbMLl1aEGcaztFrpRB6M+hepwqiGxtyL8vH6kS63oC9hSK6yPj+THy1eJ10E4
         4mgxKw39d/pQv4ZZ8w1o3Fsl9JLG7XBE7D/rp5MWmbaqxoGZ1ILEpOT9Gq9xqGtOZZ6/
         OI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774159096; x=1774763896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SSY9A93RpjuKk7+iKmG9x/ILiDG4sJu1Zfs0QKYiO0=;
        b=mGRJG3SLtl52r5dEyDJMXaO5WOUSIuZZ4P3KaN1w0jutMkoziy5Z43wm2r8ZfD1+nn
         WszUX3URKh9OKXVUfLAQz79uF+Ze1FNbwwoIZbLdRGRoHf1XTI6/Xu9c6Mj1yPg3LBnC
         dphs5WHHM1hxxKRrh+waaF8SCMCo6oaCdA/v5RXlXVU9dbtgeqXthyTAMQl6WP65vIFx
         6qwyvP/TDA8b172UzfmfGLhle4blpuzw8YJ91/DDvrRI2h2jzzw0qQYV8cxNumzlGuUj
         WcCQeyBSLwcvM+cX9ISZFOttY0kgEYqjRBnBT0G43cEr7ji66oZW+sfgvT78/4Ck8+MN
         ss2Q==
X-Gm-Message-State: AOJu0YyYcGfbqRGs6T3WXbNAK7Om6oHHnpM5j3rr1N5pnU7Mqzm1Jzd4
	mkorRKMoW7DfBbRwfJwM+UvrPoKLVRXO9LntvGerXVdUq7vtRkDcFtiEj/PbIiH6ZAmYWjE9x1r
	Cs2vAxrL/i0bZU946KOoZgYtXiMnPoItalhHQSX3HLA==
X-Gm-Gg: ATEYQzy7XwF1yA0BYxKw3a3SgrEhqCRRfEi+KEloEpu6ysjkWZTT6t/G/i1le8AW2lT
	QnzwpuAvxRuN1MT4CaKgxjrdJOFYqI9CWuSHjORAXArd/wRo12UOaUUNvNftGTD1W3OASroQDYX
	LXBROK59Deo27l0fCYaae3ziWwjYN/Uk5rl8kGpfDNy1O/WySfMXO2gBtwg9RWqW7VweOBSQG88
	8AFJ9JUrKAv5AabGe5/FQgPTLhPN0zZeJ8eKJHDn0BKQfhPKtdvlpn8Q9r9mgXVU51VxwmodMv2
	VsCamHX1TtEW+HuLV2s8V/fVbB3OQLzD2/9vC+2E4GGC9VJOmCwvz6IGoNzuNn3dmvOtGYA6mvb
	Jn9SpxO8k7gHvuYrt/I+5SxV3dw==
X-Received: by 2002:a05:6820:3106:b0:67b:e4a1:9e58 with SMTP id
 006d021491bc7-67c22f50a87mr5968276eaf.37.1774159095946; Sat, 21 Mar 2026
 22:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260224031733.3817148-1-peter.lin@sifive.com> <20260224031733.3817148-2-peter.lin@sifive.com>
In-Reply-To: <20260224031733.3817148-2-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 22 Mar 2026 11:28:04 +0530
X-Gm-Features: AaiRm50DQBJ6qh9El2pVE8zGKzbw-nLmGhHC-IqVLup1Xg0OWA9WAyuiE4V-16U
Message-ID: <CAAhSdy2sWX_5QsqOy=10xx=L55mQyQoPKuz=KQRhXqaRSWhZVQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] lib: sbi_init: Call hart init before platform
 early init
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_225817_548358_CAF09FAD 
X-CRM114-Status: GOOD (  15.41  )
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

T24gVHVlLCBGZWIgMjQsIDIwMjYgYXQgODo0N+KAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVG8gYWxsb3cgdGhlIHBsYXRmb3JtIGVhcmx5
X2luaXQgaG9vayB0byB1c2UgdGhlCj4gc2JpX2hhcnRfaGFzX2V4dGVuc2lvbigpIGhlbHBlciwg
cmVvcmRlciB0aGUKPiBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZSB0byBjYWxsIHNiaV9oYXJ0X2lu
aXQoKQo+IHByaW9yIHRvIHNiaV9wbGF0Zm9ybV9lYXJseV9pbml0KCkgZHVyaW5nIGJvdGgKPiBj
b2xkIGFuZCB3YXJtIGJvb3QgcGF0aHMuCj4KPiBSZXZpZXdlZC1ieTogR3JlZW50aW1lIEh1IDxn
cmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBz
aWZpdmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGlu
QHNpZml2ZS5jb20+CgpOb3QganVzdCBzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKCksIHRoZSBwbGF0
Zm9ybSBlYXJseQpkcml2ZXJzIG1heSB1c2Ugc2JpX3RpbWVyX21kZWxheS91ZGVsYXkoKSBmdW5j
dGlvbnMKYXMgd2VsbC4gRm9yIGUuZy4gdGhlIFJQTUkgc2htZW0gZHJpdmVyIHVzZXMgZGVsYXkK
ZnVuY3Rpb25zIGFuZCBpdCBhbHNvIHByb2JlZCBhcyBlYXJseSBkcml2ZXIuCgpJIGhhdmUgdXBk
YXRlZCB0aGlzIHBhdGNoIHJlLW9yZGVyIGJvdGggc2JpX2hhcnRfaW5pdCgpCmFuZCBzYmlfdGlt
ZXJfaW5pdCgpIGJlZm9yZSBzYmlfcGxhdGZvcm1fZWFybHlfaW5pdCgpLgoKQXBwbGllZCB0aGlz
IHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
IGxpYi9zYmkvc2JpX2luaXQuYyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9p
bml0LmMgYi9saWIvc2JpL3NiaV9pbml0LmMKPiBpbmRleCA1MjU5MDY0YjEuLmFlZDJiOTZmOCAx
MDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9pbml0LmMKPiArKysgYi9saWIvc2JpL3NiaV9pbml0
LmMKPiBAQCAtMjY1LDExICsyNjUsMTEgQEAgc3RhdGljIHZvaWQgX19ub3JldHVybiBpbml0X2Nv
bGRib290KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgdTMyIGhhcnRpZCkKPiAgICAgICAg
ICAqLwo+ICAgICAgICAgd2FrZV9jb2xkYm9vdF9oYXJ0cyhzY3JhdGNoKTsKPgo+IC0gICAgICAg
cmMgPSBzYmlfcGxhdGZvcm1fZWFybHlfaW5pdChwbGF0LCB0cnVlKTsKPiArICAgICAgIHJjID0g
c2JpX2hhcnRfaW5pdChzY3JhdGNoLCB0cnVlKTsKPiAgICAgICAgIGlmIChyYykKPiAgICAgICAg
ICAgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+Cj4gLSAgICAgICByYyA9IHNiaV9oYXJ0X2luaXQo
c2NyYXRjaCwgdHJ1ZSk7Cj4gKyAgICAgICByYyA9IHNiaV9wbGF0Zm9ybV9lYXJseV9pbml0KHBs
YXQsIHRydWUpOwo+ICAgICAgICAgaWYgKHJjKQo+ICAgICAgICAgICAgICAgICBzYmlfaGFydF9o
YW5nKCk7Cj4KPiBAQCAtNDI0LDExICs0MjQsMTEgQEAgc3RhdGljIHZvaWQgX19ub3JldHVybiBp
bml0X3dhcm1fc3RhcnR1cChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsCj4gICAgICAgICBp
ZiAocmMpCj4gICAgICAgICAgICAgICAgIHNiaV9oYXJ0X2hhbmcoKTsKPgo+IC0gICAgICAgcmMg
PSBzYmlfcGxhdGZvcm1fZWFybHlfaW5pdChwbGF0LCBmYWxzZSk7Cj4gKyAgICAgICByYyA9IHNi
aV9oYXJ0X2luaXQoc2NyYXRjaCwgZmFsc2UpOwo+ICAgICAgICAgaWYgKHJjKQo+ICAgICAgICAg
ICAgICAgICBzYmlfaGFydF9oYW5nKCk7Cj4KPiAtICAgICAgIHJjID0gc2JpX2hhcnRfaW5pdChz
Y3JhdGNoLCBmYWxzZSk7Cj4gKyAgICAgICByYyA9IHNiaV9wbGF0Zm9ybV9lYXJseV9pbml0KHBs
YXQsIGZhbHNlKTsKPiAgICAgICAgIGlmIChyYykKPiAgICAgICAgICAgICAgICAgc2JpX2hhcnRf
aGFuZygpOwo+Cj4gLS0KPiAyLjQzLjcKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+
IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
