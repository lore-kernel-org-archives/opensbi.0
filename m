Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F179BC3ABDD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 12:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hpQa+Om0No7EJllzp5S3cu83IJhV6YLS9vLeb2Vm00=; b=VuOMG9A9KSMfxg
	+uHdBrx/q/BQbInv9QhCPMaejKy8ww6PIgv6988vnQomXd8vt8qg8lc82BAGZVNWGxDuPtIc23gT0
	m8uGNjUEDReowdCXgRUdqrnIpd9WFPKXm/BD4K9oQeU8u/WzcTCkHGeLhTYNUKTfm03Gzh/1HJJsv
	3FHzOWx8ybMbdMlDn/v/4ruEjuiA7iTS3OhocZIjYTBa1hRuyWqqiF1+0uEh342T7Mb1KQuesLuLG
	RyfUBsGvy2PK5gIExkO3g/yiHEUqT/dru5h938Tr3PvcfMgh9tQgtyiQRJn+//uVHUJz9B3RoKQhX
	czGDSRGKJCchSotd7LZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzgS-00000009AHE-26Pe;
	Mon, 19 May 2025 12:33:32 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzPg-000000097Dr-2P7P
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 12:16:13 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-861525e9b0aso339622439f.3
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 05:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747656971; x=1748261771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxUCPJmGWSRxQszERX0JjlejHxKXOgOCWNvBlQZi6Bw=;
        b=OY3h/ceTcV32lHStwWJ+L3XJbVgvasiD+C0EaWdSDnHeEJcLoSg8/M7GAdjnORf+j4
         NAY/qqlFuQY6jWxSwNSmjfuTdUqJYFI0pI+V2ZfRVIScOMhhp6QSJU7XwEXjLu6ws/bs
         y8XrTQal/8UawGKk4bvVU2f6vWx6AqnlkbyiM9KJuCRAIXuH4moqiH52FPGzyH9/i3W5
         P0Kb5KvCwAVH4oPgcpkMdrwm4xNEfaJflTLTYfoYMgkb+MulLl3w+r49NBI5jOBrGgMb
         sBl4QVN6vAeRE6IBoYwnjPeNa7p3f4jQBOcPWGiRTzJnKnvTNRZ1pNBJFoDgyp++EQ8K
         EzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747656971; x=1748261771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxUCPJmGWSRxQszERX0JjlejHxKXOgOCWNvBlQZi6Bw=;
        b=rb/pcA7Q+yfk5ovT5kH5CHXuVl4Rse+0vKWKyfy8EnH/2Whu6N3y1d1eTwGMTJFWgI
         ev1m0At5YAfABaZh6kn69NLOUduB4ZSEHURm8MLqrS53SeADfTykeyrIJVoAbwix5m6l
         S9lX5DLtztVN/0cjTSNN913u4XxG1cb7ujkMdi7hr0mqr+ed0j4Lh7f0g8nGp5wItzep
         Bc8b3nRWWEYGF8pY8sq1DFzZL8ipnxQHCxPNJ7/ZMV8yVP8CFW3bTY8PZujsY91VMua8
         PUsqYQ6boIv2fVJ/DbEjk87SC9LTNDmqSZpHaThBqajplGYujHwD7jnVJIoMXsNKpDSB
         VcBQ==
X-Gm-Message-State: AOJu0YxDATpYiFUuGnWWhKdqYwnwkQftZyXqlYoJTzLP/QOFcGDVNKX9
	TJPbeAkNfCPfkmCI3L972BOB4hC3HTSEkp8X5If6bxTv58Z9ALC0efJ4G1GuCUoSENR5qwA3thf
	pbApHv78LBudU6l0JFrpd9/JVBQ62tt/R7QcQdcpv6pknJnynv1Oo
X-Gm-Gg: ASbGncuUQMnAfsatY2RBJxz95P3zdoGHDjZ2kvbCTAz77SytaG7HjiZ5NZjWcBKEjGR
	KW7iY0sAH7EhEiV+R6XoNdppKYx2TbjVrtP4y7ysdBysDqg2zkGGMtWts5TddrhnuBZ7AFCmCMC
	DKT/6J0EUntS7IUCVnh+XnxSpnq1WXGmo4QQ==
X-Google-Smtp-Source: AGHT+IFaC8ZDN4UA/zeDT1uEpRWWJkciNMXryPkKX0nTfsWFS9EUMhf1D7tGzn1LG6dKDnNf6a2CY/53cV9/bKSqTRI=
X-Received: by 2002:a05:6602:3799:b0:867:943:c184 with SMTP id
 ca18e2360f4ac-86a2319c8e1mr1789856739f.5.1747656971503; Mon, 19 May 2025
 05:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250429232928.6499-1-cfu@mips.com>
In-Reply-To: <20250429232928.6499-1-cfu@mips.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 19 May 2025 17:46:00 +0530
X-Gm-Features: AX0GCFtufASsYDn46SkoGitEbnUNF-HM8fSCHaSkYoq8zPFpGQwdrrMUI1mP2aM
Message-ID: <CAAhSdy2dMXgJ9brDL_bRT3AUJFjL5isyMCy4+GO=xk6+F8KCHQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] *** Add MIPS P8700 platform ***
To: Chao-ying Fu <icebergfu@gmail.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051612_610263_8687E3B0 
X-CRM114-Status: GOOD (  16.45  )
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

T24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgNTozN+KAr0FNIENoYW8teWluZyBGdSA8aWNlYmVyZ2Z1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiAqKioKPiBDaGFuZ2VzIGluIHY0Ogo+ICAgUmVtb3ZlIGNv
ZGUgdGhhdCBvdmVycmlkZXMgbmFzY2VudF9pbml0Lgo+ICAgVXBkYXRlIHA4NzAwLmMgdG8gd29y
ayB3aXRoIHRoZSBsYXRlc3Qgb3ZlcnJpZGUuCj4gICBVc2UgY3NyX3NldCBmb3IgbWlwc2NvbmZp
ZzYgaW4gcDg3MDAuYy4KPiAgIEFkZCByaXNjdixjYm9tLWJsb2NrLXNpemUgdG8gdGhlIGR0cyBm
aWxlLgo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAgIFJlbW92ZSBzdHcucywgc3R3LmgsIGFuZCBleHRy
YSBzY3JhdGNoIHNwYWNlLgo+ICAgVXNlIG5hc2NlbnRfaW5pdCB0byBpbml0aWFsemUgTUlQUyBD
U1JzLgo+ICAgQWRkIGFtbyBlbXVsYXRpb24gdmlhIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZXhjZXB0
aW9ucy4KPiAgIENoYW5nZSB0byB1c2UgQU1PIGFuZCBSRFRJTUUgaWxsZWdhbCBpbnN0cnVjdGlv
biBleGNlcHRpb25zLgo+ICAgUmV2aXNlIHRoZSBkdHMgZmlsZS4KPiAgIFJlbW92ZSBjb2RlIHRo
YXQganVtcHMgdG8gbWlwc19jcHNfY29yZV9lbnRyeS4KPgo+IENoYW5nZXMgaW4gdjI6Cj4gICBC
cmVhayB1cCBvbmUgcGF0Y2ggdG8gMTEgcGF0Y2hlcy4KPgo+IENoYW5nZXMgaW4gdjE6Cj4gICBP
cmlnaW5hbCBjb2RlLgo+ICoqKgo+Cj4gQ2hhby15aW5nIEZ1ICg4KToKPiAgIHBsYXRmb3JtOiBn
ZW5lcmljOiBtaXBzOiBhZGQgUDg3MDAKPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBtaXBzOiBhZGQg
aGVhZGVyIGZpbGVzCj4gICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwczogYWRkIGFuIGVudHJ5IGZ1
bmN0aW9uCj4gICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwczogYWRkIHRoZSBwbGF0Zm9ybSBmaWxl
Cj4gICBsaWI6IEVtdWxhdGUgYW1vIGluc3RydWN0aW9ucwo+ICAgcGxhdGZvcm06IGdlbmVyaWM6
IG1pcHM6IGFkZCBhIGR0cyBmaWxlCj4gICBwbGF0Zm9ybTogZ2VuZXJpYzogbWlwczogYWRkIG9i
amVjdHMubWsKPiAgIEluaXRpYWxpemUgTUlQUyBjdXN0b20gUE1BIHJlZ2lzdGVycwoKRHJvcCB0
aGUgQU1PIGVtdWxhdGlvbiBwYXRjaCBzaW5jZSBJIGhhdmUgc2VuZCBhbm90aGVyIHZlcnNpb24K
b2YgdGhpcyBwYXRjaC4KCkFsc28sIHlvdSBuZWVkIHRvIHJlYmFzZSB0aGlzIHNlcmllcyBvbiBs
YXRlc3QgT3BlblNCSSBiZWNhdXNlCnRoZSBwbGF0Zm9ybSBvdmVycmlkZSBtZWNoYW5pc20gaW4g
Z2VuZXJpYyBwbGF0Zm9ybSBoYXMgY2hhbmdlZC4KClJlZ2FyZHMsCkFudXAKCj4KPiAgaW5jbHVk
ZS9zYmkvc2JpX2F0b21pYy5oICAgICAgICAgICAgICAgICAgICB8ICA5MCArKysrCj4gIGxpYi9z
Ymkvb2JqZWN0cy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBsaWIvc2Jp
L3Jpc2N2X2FzbS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDM2ICsrCj4gIGxpYi9zYmkv
c2JpX2F0b21pYy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAxODIgKysrKysrKysKPiAgbGli
L3NiaS9zYmlfaWxsZWdhbF9pbnNuLmMgICAgICAgICAgICAgICAgICB8IDQ5MiArKysrKysrKysr
KysrKysrKysrKwo+ICBwbGF0Zm9ybS9nZW5lcmljL0tjb25maWcgICAgICAgICAgICAgICAgICAg
IHwgICA0ICsKPiAgcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICB8
ICAgMSArCj4gIHBsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9taXBzL2JvYXJkLmggICAgICAgfCAg
MzMgKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvbWlwcy1jbS5oICAgICB8ICA4
OCArKysrCj4gIHBsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9taXBzL3A4NzAwLmggICAgICAgfCAx
MjIgKysrKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL2Nwcy12ZWMuUyAgICAgICAgICAgICB8
ICA3NSArKysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL21pcHMsYm9zdG9uLXA4NzAwLmR0cyB8
IDM0NyArKysrKysrKysrKysrKwo+ICBwbGF0Zm9ybS9nZW5lcmljL21pcHMvb2JqZWN0cy5tayAg
ICAgICAgICAgIHwgICA3ICsKPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMgICAgICAg
ICAgICAgICB8IDI3NiArKysrKysrKysrKwo+ICAxNCBmaWxlcyBjaGFuZ2VkLCAxNzU0IGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV9hdG9taWMuaAo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfYXRvbWljLmMKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9taXBzL2JvYXJkLmgKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9taXBzL21pcHMtY20uaAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL21pcHMvcDg3MDAuaAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL2Nwcy12ZWMuUwo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL21pcHMsYm9zdG9uLXA4NzAwLmR0
cwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL29iamVjdHMubWsK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9wODcwMC5jCj4KPiAt
LQo+IDIuNDcuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
