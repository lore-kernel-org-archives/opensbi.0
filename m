Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A48C36011
	for <opensbi@archiver.kernel.org>; Thu, 27 Mar 2025 14:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Z7EXKf66F3FRnHd4KWZp9pYiIfU76xhsyVP7q9dRUo=; b=DnysxuvP+PkQ7K
	xbeRNCjduCxIfHH0QbZyL7EyUu+XKf9tt+BHq8p9dqe6HoMokWwAEAIiLcT+qvGzbyB8Z9r+2OvoO
	Xmmyf88G6G7gNLfckd6D0gbGVdgbqetqa1xpfDF5MK2R56QkXs+yYS50/GMAPK10PeZ2CHUPJqpDn
	u9y4MC8G0R9ylJVE6WxpH9FkwxcgTbmH5ExAWgLwfr0/Ha6WKNZt9Fr8930J1X0rdpXMqnJIdydDA
	YegHZfqC3skerklGpqvDitkxsHhfAlFec9+J/O5s1JrLzThSEKlmw27pIFQpD6r62ZBA5DX91F4bR
	QAxlo4cwx9OKkffMZypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txohH-0000000BHiU-3AZV;
	Thu, 27 Mar 2025 14:59:07 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoWH-0000000BFny-0kZQ
	for opensbi@lists.infradead.org;
	Thu, 27 Mar 2025 14:47:46 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3031354f134so1426048a91.3
        for <opensbi@lists.infradead.org>; Thu, 27 Mar 2025 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1743086864; x=1743691664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbJEeygVbXal0MqU1uEQ1Bd385OXSEZwy1oHTH+SqTo=;
        b=fVG+wHEihzcHeNbZJrsk252aZsCnJ1S0IOkNkl0G8YYVL6B/Jq2tkaDqc3g9wCvFmH
         QxRLKPUyGkicvAQfW5BV/M3tiU3hOk4VjMUmG1nEPkwYPcJU8dSKyMqKRSQwe5Oy+p5y
         c9UOvqubm8shMNkJbgGHXIa3xHEGk5ofpnxCee2jK/l3R5FzJp2kf863FRsu2Borqmuq
         VQ2S10vDkT1XhStgGG2U6xzWiRYl7XU+4BFNhyH8rsVbnHZnYvlpIWavK0r9BPI+T59O
         /wFN6/zmGt28l4k0mxKDChRHU/aolERgetc4Gx7eZgbcTPvb0omuCDfWuHYhroEtXjA7
         5/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086864; x=1743691664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbJEeygVbXal0MqU1uEQ1Bd385OXSEZwy1oHTH+SqTo=;
        b=hDd3nPzGwGkjV/M7P4RDBHlAI0wIgmgfItReXukKeieqoN1UJfZeW4JcboyCm67Ru1
         RpBQ9v6ldyK4LE2P6KVxvS7m3ELAsKrVILPvPn/xtLRa9I7EUY6v7fUTci/V4Gf/0yWU
         UQw+YgnfI7ioNCX44a9tDu9vdtfuBmr7eCrTtQO0Dyknkicdll/FUo72E1zUkvSRGtCD
         Jvo7OBF0mfa6TzmmPil2GZCjDtSP9FPGZgqEslyOiLqxTBGAE+2h9MHzuE4hkqJaaS9r
         6yrrwvx+Mo76P2uvXq1Y9fKk8aOYtXIJwwQkTwbZE8SQxGxq9gKdfrqPibKeOmmWV4pJ
         x9JA==
X-Gm-Message-State: AOJu0YxTN5r1tfVc1/Nm7bjr9xYxZn6+m9ad+brDdQLIV503MiKEW3oQ
	/9/2mTYiicDaeABKjYUzw8q9Pp3u8v+eHj8wO96ZvoP8yUhPE2kgXBlW7H1q+iwWyJI4dPVif95
	wci7etz9A4D6uvf9RQD5buM0pCPF2TEkvZIur0g==
X-Gm-Gg: ASbGncvV06SfhBpDedEE9enCusqOcAF5+NEZpAPj0oOR3ODV6XTg02m2m6oY7n2DHR+
	zxYLAEe3X+2Le5KLoRxx7rbiYBYlfuvOsjGsqaf5sDB70U2SdeTkmfxEekObpzlsxut6CJKpMLM
	VNiEtfNp/BDPJ/NZ+pCZFFEYwARII=
X-Google-Smtp-Source: AGHT+IG3a2J+hQxXj+MgUNonRhfrMaX+vOgb7T18OSRfm/9Vvu4Zvmn504Y9Ob1Is1sCc2EdgxymT6H0or+GCTslXlA=
X-Received: by 2002:a17:90b:4d09:b0:2fe:7fea:ca34 with SMTP id
 98e67ed59e1d1-303a9185808mr4935502a91.32.1743086863970; Thu, 27 Mar 2025
 07:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250325102615.1587953-1-cleger@rivosinc.com>
In-Reply-To: <20250325102615.1587953-1-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 27 Mar 2025 20:17:29 +0530
X-Gm-Features: AQ5f1Jppdi_39AjeN5AzAIe9YBbaHBJbgrBvuhulaDVv_Wf-HxoARWZeCIxbXEE
Message-ID: <CAAhSdy1wSU1kpwjp4+GDz0oJEPdh=nhkxPnQ-tX5m4-y6SK_Yg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] lib: sbi: sse: spec update and fixes
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: opensbi@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_074745_412117_E997547D 
X-CRM114-Status: GOOD (  12.96  )
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

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMzo1NuKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgU0JJIHNwZWNpZmljYXRpb24gYWRkZWQgYSBm
ZXcgbmV3IGV2ZW50cyBhcyB3ZWxsIGFzIHNwZWNpZnlpbmcKPiBzc2Vfd3JpdGVfYXR0cnMoKSBp
bnZhbGlkIGF0dHJpYnV0ZXMgZXJyb3JzLiBBbHNvIGhhbmRsZSBuZXcgZmllbGRzCj4gdG8gYmUg
c2F2ZWQgKFNQRUxQLCBTRFQpIHVwb24gaW5qZWN0aW9uLgo+Cj4gdjI6Cj4gIC0gUmVtb3ZlIHN1
cGVyZmx1b3VzIHBhcmVudGhlc2lzIGFyb3VuZCBNU1RBVFVTIHZhbHVlcwo+ICAtIEZpeCB0eXBv
IGluIGNvbW1pdAo+ICAtIE1vZGlmeSBjb21taXQgdGhhdCBhZGRlZCBhIG5ld2xpbmUgdG8gYWN0
dWFsbHkgcmVtb3ZlIHRoZSBwcmludGYKPiAgLSBBZGQgYSBjb21tZW50IHJlZ2FyZGluZyBTQklf
RURFTklFRCBiZWluZyByZXR1cm4KPgo+IENsw6ltZW50IEzDqWdlciAoNyk6Cj4gICBsaWI6IHNi
aTogc3NlOiBVcGRhdGUgU1NFIGV2ZW50IGlkcwo+ICAgbGliOiBzYmk6IHNzZTogUmVtb3ZlIHBy
aW50ZiBmcm9tIHNzYmlfc3NlX2V4aXQoKQo+ICAgbGliOiBzYmk6IHNzZTogUmV0dXJuIFNCSV9F
REVOSUVEIGZvciByZWFkIG9ubHkgcGFyYW1ldGVycy4KPiAgIGxpYjogc2JpOiBzc2U6IFJlbmFt
ZSBTVEFUVVMqIGludGVycnVwdGVkIGZsYWdzIHRvIFNTVEFUVVMqCj4gICBsaWI6IHNiaTogc3Nl
OiBSZW1vdmUgc3VwZXJmbHVvdXMgcGFyZW50aGVzaXMgYXJvdW5kIE1TVEFUVVNfKiB2YWx1ZXMK
PiAgIGxpYjogc2JpOiBzc2U6IEFkZCBzdXBwb3J0IGZvciBTU1RBVFVTLlNQRUxQCj4gICBsaWI6
IHNiaTogc3NlOiBBZGQgc3VwcG9ydCBmb3IgU1NUQVRVUy5TRFQKCkkgaGF2ZSB0YWtlbiBjYXJl
IG9mIHRoZSBjb21tZW50IG9uIFBBVENIMiBhdCB0aGUKdGltZSBvZiBhcHBseWluZyB0aGlzIHNl
cmllcy4KCkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRo
YW5rcywKQW51cAoKPgo+ICBpbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oICAgICAgfCAgMyAr
LQo+ICBpbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNlLmggfCA1MCArKysrKysrKysrKysr
KysrKysrKy0tLS0tLQo+ICBsaWIvc2JpL3NiaV9wbXUuYyAgICAgICAgICAgICAgICAgfCAgNCAr
LS0KPiAgbGliL3NiaS9zYmlfc3NlLmMgICAgICAgICAgICAgICAgIHwgNjAgKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyks
IDMyIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQ3LjIKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxp
bmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
