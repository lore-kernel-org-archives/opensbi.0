Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63389606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 05:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KKRJ6XO9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=P3s9tOZs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1KoA8zyqbrKipPiT0onHPERQpOuTjcJpbDo5tNNr5Rc=; b=KKRJ6XO96oqKaHet2mg48Owz3u
	r2D4ZCzS73kltRFJ3kslN23F2gKjg7BqoAdmgVCJuqktPTa/GjQfg81cAZTTkNwOMczYtSiPtTmSb
	cimtjHNSHQi/oXT3QM/7lpVo9FcqSvG9uMLsk1KVL/WZ6Y9lvzH00W8DEiqC3JqwEq/NUwZbIM5l+
	AMdizyjIKYfzq+IDc0OIm1Q90KAradQvF+jcfM9pFb5hgqOS/9w/NIkDJAzlSScgHNglEEOprVALL
	Cd0xTv09C5jNulOccpLaNEGuN1eSVIOrsBymoI87YOEpCtGg9PnUdxrDmM00sH5l758PSX0wiIOZE
	0MfVoPkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8Cs-0000000FXtv-2kVK;
	Fri, 23 Oct 2026 05:52:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8Cp-0000000FXtP-0Rzy
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 05:52:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso4647585e9.3
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 22:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792734761; cv=none;
        d=google.com; s=arc-20260327;
        b=D7B2AQtg92KAaGe6TdU/UgBZ6GdS+HEP5CwcOTi201SgoklpxClLtNDhFlCyfjNeRP
         RzCjEVb8hzpsO6o87EG5pkmvEUeNHu9EB3Fq3lOrGmz9fwqDfsB+fSi8tKioesOB4nEm
         x0iFsGj/IdMqTZeKm2/t4u7yy8la7VUPaQJ2Xl2PY16qYoZ7HFX9nL4yOXHgGJZyxpLH
         kk+CO7uJlwgcxAlr65WekItWSzQVlku6cE6oB4Lw0dHb/7+FmQZ6TD3GtbMsup8L72z6
         TwQuiNiUxuM3t4YoNlu/R8SBa37oKS0fCzA7Hknr8aJBjBvYQmaYp58i8YWW7G4CEDWa
         5uDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CHxZZg4TvS5YdzCj0fSYM52Wjbqmgc3hyDWP/PvW5rA=;
        fh=DvUZaCZeGFM/iKDgemEdcvjZTXBGU6zmoXACXNg+ctg=;
        b=B3MobnnV3F+nsfcOhKPNTOqzvIZho5jloyPN4LAcdTZv1Qh5+lzBJshpKVtGpf4YlB
         nxZJnIrfqGqxqu7BHQ0k2CrQukJF0AGFYf8ZSV2m55d40puhlDaSstgusDebj1mBwaQn
         xtxwyajDL7nB8W2NhsJJUEg/5u88gEscRidi67IITjp47UKsmHcjZJeR3b4goKG8lci6
         a3Ll8jkMxCjHk1MtaLLR8pbA9UEgYHknDuTBV+XB2n7MH5N276hAkUJI3ggCf9TIBREE
         b9dJmDNyHGsqQ7sjSe4xg7T3Nl5wo6T3tDqB0nR8gjY89xIGAhgAQ8DSuIqEETkDX6Bx
         2how==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792734761; x=1793339561; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHxZZg4TvS5YdzCj0fSYM52Wjbqmgc3hyDWP/PvW5rA=;
        b=P3s9tOZsFBxzlLBvR60zKgKhROmqaWuKhXvhy47FscyevwLCh7DmGRqDDXU49M48/h
         OcBkuhPCrWJutX68L71yTbYNcG83ETeFHjTQMoPtOdUWuW9OQPY5/5jFcKqSyNDza5xM
         lG1fuN7tYaIYGY/aHS/rHNKOlmroMTCNNbPB1hGuaSmVLQYaOIuWRENgxLaz4QzSBcYE
         HvYuLa80QthnU465lcPgDZmPq5lfTfzMLhaLWIfFxR07uJglnNkM6cWZapTHjvjVf0Tz
         n5IGrk3XpeYUKCv/ZbCJzNE22w5Av2H3y5g97cGOf2yJAozm6c2DYcVLHu381+7Eg4CS
         sgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792734761; x=1793339561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHxZZg4TvS5YdzCj0fSYM52Wjbqmgc3hyDWP/PvW5rA=;
        b=AmiHbDbh+JC9EF75E12qNTXabCe3DoLI51G3rDwz5vv/hvy01IQ/tAbpr1LtTmFtRU
         Ud4DAJcibdAqM/FJarh867wKb68qScCyiJXHF1pxflF3xL+Hne9SIfeWltiGN8qVQlJG
         DOLSglOhYvQ6uJGI2ozUFTwXWk/zUV4QeevF36Bixkg/3dKg9v8cQuFYALI7ZyFvBLWp
         klKurMI++xblDWgt7Qa1SjHtETvPhA3bd80KXWt+fJhaGvejpXIrf/DGS8/XYgmygQew
         w6xf5AKNbX7xdhtVZlcHpyexsbuVxV2gO1Y3y6Ybhk8RYkLOV9L+4+mf1OSf9BfLmrip
         1xBA==
X-Gm-Message-State: AFq9FYICXcOhfRsh6cV9v77L/tY8Ct0OdOnV6aAuWO7zLeNAQiFUYwQ1
	1/MtwKwtY6DElgeHGylrZ6Jcyn/8ygcNSNU8zZoxfCZZDf943TS+hIcen+vfwtIAWu6cSM4qN/k
	BeL232b0KPMQWamqUTBEl2BV+ZBQyRWtnK9hpK+3kNw==
X-Gm-Gg: AYBFou3TS4OhJCUVRebq0BlFt9yoK0moIwLTsBYsfaYwsgqFZJSVBVg4cnYs7rozJhm
	BFLJ0TMLhYa9V+2wjQLBX9ebd79EVlTgzHNdK6+kHPNMXvk+xWgBAPmSKmi13FUGRLmmmO4Y7SN
	Rrum0tqPaHOEq3n7f7SWcrwDGdL8RqO+7DPJWxE/LxDVd2cum0fCa6UCdyeUQVSEbQCl87tGJ/s
	RYw5dvw6g19bMo1ZgfaQMK1+KsaQvOXWkvtf686w9e1Om6rJoY6FScsJTAJDDtcSQleV2qr/9fu
	R5fisz83WzShh/EvX8jwcYEFGXvSmti/t37ml3XSuBVEn733r+hlX44I8crm7UKhyLK6dvkOnrc
	iIgRz3w0UwvVL3RkJ+LxCI4IsxxU3c0R0cBsdTYYFtSkGYL4YvmidLvFYgWP8AEoOKxYob/jl23
	1a55aWWLeJ8RfZeXPh9xEUpatGuhFea6rh4G4j8YykQBRBBqn2UeMHzwyvw313KafiwX0tFBGW6
	BWg
X-Received: by 2002:a05:600c:4fd4:b0:4a0:eae0:769a with SMTP id
 5b1f17b1804b1-4a211ed7279mr16554385e9.28.1792734760847; Thu, 22 Oct 2026
 22:52:40 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com> <20261023024345.16779-2-theodoruswensanfebruanto025@gmail.com>
In-Reply-To: <20261023024345.16779-2-theodoruswensanfebruanto025@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 11:22:29 +0530
X-Gm-Features: AclHuK-GUxIcA7QwPEC6Gwue3BxZHqW9Nkxg0Kh4s4o1T_EK7VbuPvPZpPy4kLU
Message-ID: <CAAhSdy1aK_uugw8R_eZuvVe+90cdKGtVL2igr3XZwvK-jnGimw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] lib: sbi: Preserve stimecmp across domain switches
To: whensun <theodoruswensanfebruanto025@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_225243_264060_27B8D592 
X-CRM114-Status: GOOD (  17.63  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgODoxNOKAr0FNIHdoZW5zdW4KPHRoZW9kb3J1c3dlbnNh
bmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVGhlb2RvcnVzIFdlbnNh
biBGZWJydWFudG8gPHRoZW9kb3J1c3dlbnNhbmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+Cj4KPiBU
aGUgU3N0YyBleHRlbnNpb24gcHJvdmlkZXMgYSBzdXBlcnZpc29yIHRpbWVyIGNvbXBhcmlzb24g
cmVnaXN0ZXIuCj4gV2l0aG91dCBwcmVzZXJ2aW5nIHRoaXMgdmFsdWUsIGFub3RoZXIgZG9tYWlu
IGNhbiByZXBsYWNlIHRoZQo+IHByZXZpb3VzIGRvbWFpbidzIHRpbWVyIGRlYWRsaW5lLgo+Cj4g
S2VlcCBhIHBlci1kb21haW4gdGltZXIgY29tcGFyaXNvbiB2YWx1ZSBhbmQgaW5pdGlhbGl6ZSBu
ZXcgZG9tYWlucwo+IHRvIGEgZnV0dXJlIGRlYWRsaW5lIHRvIGF2b2lkIGltbWVkaWF0ZSB0aW1l
ciBpbnRlcnJ1cHRzLgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJl
LXNyYy9vcGVuc2JpL2lzc3Vlcy80MzMKPiBTaWduZWQtb2ZmLWJ5OiBUaGVvZG9ydXMgV2Vuc2Fu
IEZlYnJ1YW50byA8dGhlb2RvcnVzd2Vuc2FuZmVicnVhbnRvMDI1QGdtYWlsLmNvbT4KPiAtLS0K
PiAgbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW5f
Y29udGV4dC5jIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+IGluZGV4IDA4NjFkNTQx
Li4yNjk4MDY1OCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4g
KysrIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+IEBAIC01MCw2ICs1MCw4IEBAIHN0
cnVjdCBoYXJ0X2NvbnRleHQgewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzZW52Y2ZnOwo+ICAg
ICAgICAgLyoqIFN1cGVydmlzb3IgcmVzb3VyY2UgbWFuYWdlbWVudCBjb25maWd1cmF0aW9uIHJl
Z2lzdGVyICovCj4gICAgICAgICB1bnNpZ25lZCBsb25nIHNybWNmZzsKPiArICAgICAgIC8qKiBT
dXBlcnZpc29yIHRpbWVyIGNvbXBhcmlzb24gcmVnaXN0ZXIgKi8KPiArICAgICAgIHU2NCBzdGlt
ZWNtcDsKCldoZW4gSC1leHRlbnNpb24gaXMgYXZhaWxhYmxlLCB3ZSBhbHNvIGhhdmUgdnN0aW1l
Y21wIENTUiB3aGljaApuZWVkcyB0byBiZSBwcmVzZXJ2ZWQuIEFkZCB2c3RpbWVjbXAgc3RhdGUg
YW5kIG1vdmUgdGhpcyBQQVRDSAphZnRlciB0aGUgUEFUQ0ggcHJlc2VydmluZyBILWV4dGVuc2lv
biBzdGF0ZS4KCkFsc28sIGJldHRlciB0byBjcmVhdGUgc2VwYXJhdGUgInN0cnVjdCBoYXJ0X2Nv
bnRleHRfc3N0YyIgYW5kIHVzZQppdCBpbiBzdHJ1Y3QgaGFydF9jb250ZXh0LgoKPgo+ICAgICAg
ICAgLyoqIEZsb2F0IGNvbnRleHQgc3RhdGUgKi8KPiAgICAgICAgIHN0cnVjdCBzYmlfZnBfY29u
dGV4dCBmcF9jdHg7Cj4gQEAgLTE0NSw2ICsxNDcsOCBAQCBzdGF0aWMgaW50IHN3aXRjaF90b19u
ZXh0X2RvbWFpbl9jb250ZXh0KHN0cnVjdCBoYXJ0X2NvbnRleHQgKmN0eCwKPiAgICAgICAgICAg
ICAgICAgY3R4LT5zZW52Y2ZnICAgID0gY3NyX3N3YXAoQ1NSX1NFTlZDRkcsIGRvbV9jdHgtPnNl
bnZjZmcpOwo+ICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJ
X0hBUlRfRVhUX1NTUU9TSUQpKQo+ICAgICAgICAgICAgICAgICBjdHgtPnNybWNmZyAgICAgPSBj
c3Jfc3dhcChDU1JfU1JNQ0ZHLCBkb21fY3R4LT5zcm1jZmcpOwo+ICsgICAgICAgaWYgKHNiaV9o
YXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NTVEMpKQo+ICsgICAgICAg
ICAgICAgICBjdHgtPnN0aW1lY21wID0gY3NyX3N3YXA2NChDU1JfU1RJTUVDTVAsIGRvbV9jdHgt
PnN0aW1lY21wKTsKPgo+ICAgICAgICAgLyogRWFnZXIgY29udGV4dCBzd2l0Y2ggZm9yIGZsb2F0
ICovCj4gICAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFS
VF9FWFRfRikgfHwKPiBAQCAtMjA2LDYgKzIxMCw4IEBAIHN0YXRpYyBpbnQgaGFydF9jb250ZXh0
X2luaXQodTMyIGhhcnRpbmRleCkKPiAgICAgICAgICAgICAgICAgaWYgKCFjdHgpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9NRU07Cj4KPiArICAgICAgICAgICAgICAg
Y3R4LT5zdGltZWNtcCA9IH4wVUxMOwo+ICsKPiAgICAgICAgICAgICAgICAgaWYgKHNiaV9oYXJ0
X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCksCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9WKSkgewo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHZlY19zaXplID0gc2JpX3ZlY3Rvcl9jb250ZXh0X3NpemUoKTsK
PiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
