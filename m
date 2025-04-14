Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA0FC369B5
	for <opensbi@archiver.kernel.org>; Mon, 14 Apr 2025 21:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGhrud7xROiLjIzqtVkMfo9UZZbD+uYAxXn1Vf7Yb0k=; b=HY8jF4YvvO6Pln
	cZk0RQXz/A0B3xmoeTzTrzob71AHQM2Di1O5sI5QLc4kOzCYkI6KSLmdd5pSlbvV0HbdM9d+ayGI+
	UCqj3FquyOOElqU0fgZTd85TwKNwpV+acyHAHIfZiZ6AsNiUJb1HwLezDgvXNRjxvOgfBav7NEIEn
	PPsNOE54aZ/5grpp47sJl1yeSzVzE2vhgzTDSh758IlC3HgDe5AdjzaSMJlFYxqY1Xgr8w4mzmPwP
	0V267bofwhTMi0TEWDVcLSHaVXxJY3zaUIun9UKSKjN4dkwD/zDWUk3KedvFlX7CC8Q+6iYgCOras
	EK5lhaqHqb33B7jxq8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4R8j-00000003Xgq-2XT5;
	Mon, 14 Apr 2025 21:14:49 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4R2z-00000003XFJ-1CAF
	for opensbi@lists.infradead.org;
	Mon, 14 Apr 2025 21:08:55 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-af52a624283so3942971a12.0
        for <opensbi@lists.infradead.org>; Mon, 14 Apr 2025 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744664932; x=1745269732; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rq3AoXnnXpk80b6Zy8C3+7sgYAPuxqrU1GFZvVjrJk=;
        b=Xe478geDr/66lwdm+5hX2PC35tKEXoeGSOMH7I6ZV6N5tUXcxtIThKFwe60RFOmzPJ
         5bKFkm94B47VgQxfe9ck4Qt35mluBMmDOAc2FtT9v2vcJtMFbFEAvWtN2LHAV3RG2VOS
         PDRTyMWFL3o8XGB41yzEbrCGQNuq+VfvVZ7iw6Y6YwACb4CkgtChvzeYno9TwHmeZkzm
         DJ5o07cioKBPWB2tBkdeZZymQT/t+pGp4Z2YNXPqZWdWQHUmc1Ly7IOjwzrE8Wl6PvGc
         cy1ZoKyIYEU9P8gieEn2WlKiE6UGu8qxrvioEPbp+gd1U4oA4SOScs1jGKEaMWouXAYV
         juEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744664932; x=1745269732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rq3AoXnnXpk80b6Zy8C3+7sgYAPuxqrU1GFZvVjrJk=;
        b=IdJ5T2hFoPWo/CQ51w3X1qFxrDO2DWCKQ2gZkyTW0ovi/mGZwtth8a5yIJO4UqgDht
         ktsPLAdUnuqCj464N4uEdpN92dbL4MLdsHhPwrSfIyndxXkOtPKx/z+AqMcdYpCoh9Iq
         RGZ1ynrJ3/WM1QzLWEMrWvJy1kQh0MX+p4MzP7myrxDjJm7YFSK3RfxOvF05NrE07sXY
         tSuMikV7K7/zoNmXMxdHLoiCKKnnN6j7GuNiQMdbrfiit/8uidsVp8Ya04L/jRNypcOM
         R0FF+6ZcmaLZEMmp0XouPEaZIJOYa7srm5DCfV7x4Ds8bQ79Wa0vHd92dfbnjIl1rkZO
         WzpA==
X-Forwarded-Encrypted: i=1; AJvYcCWr/M/Juj8CA6nBDVXcOdigpa4T0jG/dB9oJ4jChbZC70IyIm1HERHa6SO3zyszN5QWFNboC2P4@lists.infradead.org
X-Gm-Message-State: AOJu0YxZgfpqQvhQg2fnqVKGNQcjHv/D509cuiHzFIg/ZeM/1/6OWGyK
	TPZ5Xy7VUteP+v5Mw4Ux6stsMSQ75M9NutI71f1+vpkTAE2UuQcMX2m/mRCEmgk=
X-Gm-Gg: ASbGncs5yllVjvq2XmLPjosMGuKsRTvfQroKL66ThNUHmXh3UvyUxcIY8USYVwhiKI+
	HTS7z9KFcvTNT4ZplbhYRTAEAeUjjy1R7qYozkVmPhr6nVmQis8gQJx5uW98PfidGyOGK/lWoTL
	4CIP+fSno+YRtTz67GWViqhvBP9k8SdU9E2XkCqH3C/HEP+lnnL1P2riCb9kFEAvHipOwpKI39i
	K84I3u27pNqhsWRv49ulwL1/0t3U9Ir/GkrLfVJ1tMZkXsARcCpNpV3UIOgQ1yMVHdxhaeE4H9J
	2RO3tocLvcqT/8bTE2RSTO6BmU5AH2/uXkDnrl+MCQ==
X-Google-Smtp-Source: AGHT+IHe6NWA9CCCPOsMlixqtB5HW+G3nlCcg3Mt9MgRJBhTjV8e5iWGsDm+DpOtfqFo0OZrRkx59Q==
X-Received: by 2002:a17:90b:58c5:b0:2fc:aaf:74d3 with SMTP id 98e67ed59e1d1-3084f2fbb88mr1150886a91.4.1744664931675;
        Mon, 14 Apr 2025 14:08:51 -0700 (PDT)
Received: from [192.168.1.27] ([50.35.45.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b654adsm103883345ad.1.2025.04.14.14.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 14:08:51 -0700 (PDT)
Message-ID: <37490d75-2909-49ec-a9c3-b662530e1522@rivosinc.com>
Date: Mon, 14 Apr 2025 14:08:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] lib: sbi: Enable Control Transfer Records (CTR) Ext
 using xstateen.
To: Anup Patel <anup@brainfault.org>
Cc: apatel@ventanamicro.com, beeman@rivosinc.com,
 Rajnesh Kanwal <rkanwal@rivosinc.com>, alistair.francis@wdc.com,
 opensbi@lists.infradead.org
References: <20250307124451.122828-1-rkanwal@rivosinc.com>
 <bb9d0867-0aea-46b7-9f8c-3a700081c086@sifive.com>
 <5fa2aa42-9438-47f5-93c5-406cd9996765@rivosinc.com>
 <CAAhSdy39X-sYfakakWnpfB2YYG2X0CWgthHD6uYTEo6RGanH1Q@mail.gmail.com>
Content-Language: en-US
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <CAAhSdy39X-sYfakakWnpfB2YYG2X0CWgthHD6uYTEo6RGanH1Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_140853_543750_59A3D414 
X-CRM114-Status: GOOD (  26.67  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gNC8xMy8yNSA2OjQxIEFNLCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIEZyaSwgQXByIDExLCAy
MDI1IGF0IDEyOjM54oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+IHdyb3Rl
Ogo+Pgo+PiBPbiAzLzMxLzI1IDU6NDYgUE0sIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+Pj4gSGkg
UmFqbmVzaCwKPj4+Cj4+PiBPbiAyMDI1LTAzLTA3IDY6NDQgQU0sIFJham5lc2ggS2Fud2FsIHdy
b3RlOgo+Pj4+IFRoZSBDb250cm9sIFRyYW5zZmVyIFJlY29yZHMgKENUUikgZXh0ZW5zaW9uIHBy
b3ZpZGVzIGEgbWV0aG9kIHRvCj4+Pj4gcmVjb3JkIGEgbGltaXRlZCBicmFuY2ggaGlzdG9yeSBp
biByZWdpc3Rlci1hY2Nlc3NpYmxlIGludGVybmFsIGNoaXAKPj4+PiBzdG9yYWdlLgo+Pj4+Cj4+
Pj4gVGhpcyBleHRlbnNpb24gaXMgc2ltaWxhciB0byBBcmNoIExCUiBpbiB4ODYgYW5kIEJSQkUg
aW4gQVJNLgo+Pj4+IFRoZSBFeHRlbnNpb24gaGFzIGJlZW4gc3RhYmxlIGFuZCB0aGUgbGF0ZXN0
IHJlbGVhc2UgY2FuIGJlIGZvdW5kIGhlcmUKPj4+PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yv
cmlzY3YtY29udHJvbC10cmFuc2Zlci1yZWNvcmRzL3JlbGVhc2UKPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFJham5lc2ggS2Fud2FsIDxya2Fud2FsQHJpdm9zaW5jLmNvbT4KPj4+Pgo+Pj4+IC0t
LQo+Pj4+IENoYW5nZXMgaW4gVjM6Cj4+Pj4gICAgICAgICAgIFJlbW92ZWQgRldGVCBiaXQuIEl0
IHdhcyBkaXNjdXNzZWQgaW4gdGVjaC1wcnMgZ3JvdXAgdG8KPj4+PiAgICAgICAgICAgdXNlIHRy
YXAgYW5kIGVuYWJsZSBhcHByb2FjaCByYXRoZXIgdGhhbiBGV0ZUIGJpdC4gVHJhcAo+Pj4+ICAg
ICAgICAgICBhbmQgZW5hYmxlIGFwcHJvYWNoIGxlYWRzIHRvIGxldHRlciBudW1iZXIgb2YgdHJh
cHMgdGhhbgo+Pj4+ICAgICAgICAgICBlbmFibGluZyBhbmQgZGlzYWJsaW5nIEZXRlQgYml0IG9u
IGVhY2ggQ1RSIHVzYWdlLgo+Pj4+ICAgICAgICAgICBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9n
L3RlY2gtcHJzL21lc3NhZ2UvMTMzOQo+Pj4KPj4+IElmIHlvdSB3YW50IHRvIHVzZSB0aGUgdHJh
cCBhbmQgZW5hYmxlIGFwcHJvYWNoLCB0aGVuIHlvdSBjYW5ub3QgZW5hYmxlIHRoZQo+Pj4gbXN0
YXRlZW4wIGJpdCBieSBkZWZhdWx0LCBvciB5b3Ugd2lsbCBuZXZlciB0cmFwLiBUaGlzIGlzIGFs
c28gbWlzc2luZyB0aGUgY29kZQo+Pj4gZm9yIHRoZSB0cmFwIGhhbmRsZXIuCj4+Pgo+Pgo+PiBJ
IHRoaW5rIHlvdSBtZWFuIHlvdSBjYW4ndCB0cmFwIGluIE0tbW9kZS4gSG93ZXZlciwgdGhlcmUg
aXMgbm8gdXNlIGNhc2UKPj4gZm9yIE0tbW9kZSBwcm9maWxpbmcuCj4+Cj4+IFRoZSBQUlMgZGlz
Y3Vzc2lvbiB3YXMgYXJvdW5kIGhvdyB3ZSBoYW5kbGUgQ1RSIHN0YXRlIGZvciBndWVzdHMgd2hl
cmUKPj4gdGhlIGVhcmxpZXIgYXBwcm9hY2ggdXNlZCBGV0ZUIGluc3RlYWQgb2YgdGhlIHRyYXAv
ZW5hYmxlLgo+Pgo+Pj4+Cj4+Pj4gQ2hhbmdlcyBpbiBWMjoKPj4+PiAgICAgICAgICAgQWRkZWQg
RldGVCBiaXQgZm9yIENUUi4KPj4+PiAtLS0KPj4+PiAgICBpbmNsdWRlL3NiaS9yaXNjdl9lbmNv
ZGluZy5oIHwgMTMgKysrKysrKysrKysrKwo+Pj4+ICAgIGluY2x1ZGUvc2JpL3NiaV9oYXJ0Lmgg
ICAgICAgfCAgNCArKysrCj4+Pj4gICAgbGliL3NiaS9zYmlfaGFydC5jICAgICAgICAgICB8ICA3
ICsrKysrKysKPj4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oIGIvaW5jbHVkZS9z
YmkvcmlzY3ZfZW5jb2RpbmcuaAo+Pj4+IGluZGV4IDAzYzY4YTU3Li5mM2UyYWZkNSAxMDA2NDQK
Pj4+PiAtLS0gYS9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4+Pj4gKysrIGIvaW5jbHVk
ZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaAo+Pj4+IEBAIC0zNzUsNiArMzc1LDE3IEBACj4+Pj4gICAg
I2RlZmluZSBDU1JfU1NUQVRFRU4yICAgICAgICAgICAgICAgICAgICAgIDB4MTBFCj4+Pj4gICAg
I2RlZmluZSBDU1JfU1NUQVRFRU4zICAgICAgICAgICAgICAgICAgICAgIDB4MTBGCj4+Pj4KPj4+
PiArLyogTWFjaGluZS1MZXZlbCBDb250cm9sIHRyYW5zZmVyIHJlY29yZHMgQ1NScyAqLwo+Pj4+
ICsjZGVmaW5lIENTUl9NQ1RSQ1RMICAgICAgICAgICAgICAgICAgICAgMHgzNGUKPj4+PiArCj4+
Pj4gKy8qIFN1cGVydmlzb3ItTGV2ZWwgQ29udHJvbCB0cmFuc2ZlciByZWNvcmRzIENTUnMgKi8K
Pj4+PiArI2RlZmluZSBDU1JfU0NUUkNUTCAgICAgICAgICAgICAgICAgICAgIDB4MTRlCj4+Pj4g
KyNkZWZpbmUgQ1NSX1NDVFJTVEFUVVMgICAgICAgICAgICAgICAgICAweDE0Zgo+Pj4+ICsjZGVm
aW5lIENTUl9TQ1RSREVQVEggICAgICAgICAgICAgICAgICAgMHgxNWYKPj4+PiArCj4+Pj4gKy8q
IFZTLUxldmVsIENvbnRyb2wgdHJhbnNmZXIgcmVjb3JkcyBDU1JzICovCj4+Pj4gKyNkZWZpbmUg
Q1NSX1ZTQ1RSQ1RMICAgICAgICAgICAgICAgICAgICAweDI0ZQo+Pj4+ICsKPj4+PiAgICAvKiA9
PT09PSBIeXBlcnZpc29yLWxldmVsIENTUnMgPT09PT0gKi8KPj4+Pgo+Pj4+ICAgIC8qIEh5cGVy
dmlzb3IgVHJhcCBTZXR1cCAoSC1leHRlbnNpb24pICovCj4+Pj4gQEAgLTc5OSw2ICs4MTAsOCBA
QAo+Pj4+ICAgICNkZWZpbmUgU01TVEFURUVOMF9DUyAgICAgICAgICAgICAgICAgICAgICAoX1VM
TCgxKSA8PCBTTVNUQVRFRU4wX0NTX1NISUZUKQo+Pj4+ICAgICNkZWZpbmUgU01TVEFURUVOMF9G
Q1NSX1NISUZUICAgICAgICAgICAgICAxCj4+Pj4gICAgI2RlZmluZSBTTVNUQVRFRU4wX0ZDU1Ig
ICAgICAgICAgICAgICAgICAgIChfVUxMKDEpIDw8IFNNU1RBVEVFTjBfRkNTUl9TSElGVCkKPj4+
PiArI2RlZmluZSBTTVNUQVRFRU4wX0NUUl9TSElGVCAgICAgICAgICAgICAgICA1NAo+Pj4+ICsj
ZGVmaW5lIFNNU1RBVEVFTjBfQ1RSICAgICAgICAgICAgICAgICAgICAgIChfVUxMKDEpIDw8IFNN
U1RBVEVFTjBfQ1RSX1NISUZUKQo+Pj4+ICAgICNkZWZpbmUgU01TVEFURUVOMF9DT05URVhUX1NI
SUZUICAgNTcKPj4+PiAgICAjZGVmaW5lIFNNU1RBVEVFTjBfQ09OVEVYVCAgICAgICAgIChfVUxM
KDEpIDw8IFNNU1RBVEVFTjBfQ09OVEVYVF9TSElGVCkKPj4+PiAgICAjZGVmaW5lIFNNU1RBVEVF
TjBfSU1TSUNfU0hJRlQgICAgICAgICAgICAgNTgKPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9z
Ymkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPj4+PiBpbmRleCA0YzM2Yzc3
OC4uYzNhN2ZlYjcgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+Pj4+
ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPj4+PiBAQCAtNzUsNiArNzUsMTAgQEAgZW51
bSBzYmlfaGFydF9leHRlbnNpb25zIHsKPj4+PiAgICAgICBTQklfSEFSVF9FWFRfWklDRklTUywK
Pj4+PiAgICAgICAvKiogSGFydCBoYXMgU3NkYmx0cnAgZXh0ZW5zaW9uICovCj4+Pj4gICAgICAg
U0JJX0hBUlRfRVhUX1NTREJMVFJQLAo+Pj4+ICsgICAgLyoqIEhBUlQgaGFzIENUUiBNLW1vZGUg
Q1NScyAqLwo+Pj4+ICsgICAgU0JJX0hBUlRfRVhUX1NNQ1RSLAo+Pj4+ICsgICAgLyoqIEhBUlQg
aGFzIENUUiBTLW1vZGUgQ1NScyAqLwo+Pj4+ICsgICAgU0JJX0hBUlRfRVhUX1NTQ1RSLAo+Pj4+
Cj4+Pj4gICAgICAgLyoqIE1heGltdW0gaW5kZXggb2YgSGFydCBleHRlbnNpb24gKi8KPj4+PiAg
ICAgICBTQklfSEFSVF9FWFRfTUFYLAo+Pj4+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0
LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPj4+PiBpbmRleCA4ZTI5NzliNS4uYzM0MzgwNWMgMTAw
NjQ0Cj4+Pj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4+Pj4gKysrIGIvbGliL3NiaS9zYmlf
aGFydC5jCj4+Pj4gQEAgLTEwNSw2ICsxMDUsMTEgQEAgc3RhdGljIHZvaWQgbXN0YXR1c19pbml0
KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPj4+PiAgICAgICAgICAgICAgIGVsc2UKPj4+
PiAgICAgICAgICAgICAgICAgICAgICAgbXN0YXRlZW5fdmFsICY9IH4oU01TVEFURUVOMF9TVlNM
Q1QpOwo+Pj4+Cj4+Pj4gKyAgICAgICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNj
cmF0Y2gsIFNCSV9IQVJUX0VYVF9TU0NUUikpCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgbXN0
YXRlZW5fdmFsIHw9IFNNU1RBVEVFTjBfQ1RSOwo+Pj4+ICsgICAgICAgICAgICBlbHNlCj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgbXN0YXRlZW5fdmFsICY9IH5TTVNUQVRFRU4wX0NUUjsKPj4+
Cj4+PiBUaGUgcHVycG9zZSBvZiB0aGUgU21zdGF0ZWVuIGV4dGVuc2lvbiBpcyB0byBwcmV2ZW50
IHNpZGUgY2hhbm5lbHMgYmV0d2Vlbgo+Pj4gY29udGV4dHMsIGJ5IGJsb2NraW5nIGFjY2VzcyB0
byByZWdpc3RlcnMgdGhhdCBhcmUgbm90IGNvbnRleHQgc3dpdGNoZWQuIFRoYXQKPj4+IG1lYW5z
IGFueSBjb2RlIHRoYXQgc2V0cyBhIG5ldyBtc3RhdGVlbjAgYml0IG5lZWRzIHRvIGFsc28gaW5j
bHVkZSBjb2RlIHRvCj4+PiBwZXJmb3JtIHRoZSBjb250ZXh0IHN3aXRjaCwgb3IgeW91IGFyZSBj
cmVhdGluZyB0aGUgc2lkZSBjaGFubmVsIGFueXdheS4KPj4+Cj4+Cj4+IHllcy4gV2UgbmVlZCB0
byBzYXZlL3Jlc3RvcmUgdGhlIENUUiBzdGF0ZSBkdXJpbmcgZG9tYWluIGNvbnRleHQgc3dpdGNo
Lgo+PiBJIGFtIG5vdCBhd2FyZSBvZiBhbnkgdXNlIGNhc2VzIHdoZXJlIHdlIGFyZSBhY3R1YWxs
eSBydW5uaW5nIHR3bwo+PiBkaWZmZXJlbnQgd29ybGRzIHdpdGggb3BlbnNiaSBkb21haW5zIHRo
YXQgcmVxdWlyZSB0aGlzIGF0IHRoaXMgcG9pbnQuCj4+Cj4+IE9uY2Ugd2UgaGF2ZSBmdWxsIHN1
cGVydmlzb3IgZG9tYWluIGV4dGVuc2lvbiBzdXBwb3J0LCB0aGVzZSBtdXN0IGJlCj4+IHRha2Vu
IGNhcmUgb2YuIENhbiB3ZSBtZXJnZSB0aGlzIHdpdGggYSBUT0RPIGl0ZW0gYWJvdXQgZG9tYWlu
IGNvbnRleHQKPj4gc3dpdGNoIGlzc3VlID8KPiAKPiBJZGVhbGx5LCB3ZSBzaG91bGQgbm90IGxl
YXZlIHRoZSBDVFIgc3RhdGUgZW5hYmxlZCBieSBkZWZhdWx0IGV2ZW4KPiBpbiBhYnNlbmNlIG9m
IGRvbWFpbiBjb250ZXh0IHN3aXRjaC4gQ3VycmVudGx5LCB3ZSBhbHJlYWR5IGhhdmUKPiBBSUEg
YW5kIGEgZmV3IG90aGVyIGJpdHMgd2hpY2ggYXJlIGVuYWJsZWQgYnkgZGVmYXVsdCBpbiBtc3Rh
dGVlbjAKPiBhdCBib290LXRpbWUgYnV0IHRob3NlIHNob3VsZCBhbHNvIGJlIGVuYWJsZWQgbGF6
aWx5IHVwb24gZmlyc3QgYWNjZXNzCj4gZmF1bHQgdG8gYWxpZ24gd2l0aCB0aGUgcHVycG9zZSBv
ZiBTbXN0YXRlZW4gZXh0ZW5zaW9uLgo+IAoKWWVzLiBJIHdpbGwgc2VuZCBhIHBhdGNoIGZvciBs
YXppbHkgZW5hYmxpbmcgc21zdGF0ZWVuIGJpdHMgaW4gb3BlbnNiaSAmIAprdm0uCgo+IEZvciBu
b3csIGxldCdzIGdvIGFoZWFkIHdpdGggdGhpcyBwYXRjaCBidXQgc2VwYXJhdGVseSB3ZSBuZWVk
IHRvCj4gYWRkIGluZnJhc3RydWN0dXJlIGluIE9wZW5TQkkgdG8gbGF6aWx5IGVuYWJsZSBiaXRz
IGluIFNtc3RhdGVlbgo+IHVwb24gZmlyc3QtYWNjZXNzLXRyYXAuCj4gCj4gUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gCj4gQXBwbGllZCB0aGlzIHBhdGNo
IHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCj4gCj4gVGhhbmtzLAo+IEFudXAKPiAKPiAKPiAK
Pj4KPj4+IFJlZ2FyZHMsCj4+PiBTYW11ZWwKPj4+Cj4+Pj4gKwo+Pj4+ICAgICAgICAgICAgICAg
Y3NyX3dyaXRlKENTUl9NU1RBVEVFTjAsIG1zdGF0ZWVuX3ZhbCk7Cj4+Pj4gICAgI2lmIF9fcmlz
Y3ZfeGxlbiA9PSAzMgo+Pj4+ICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9NU1RBVEVFTjBI
LCBtc3RhdGVlbl92YWwgPj4gMzIpOwo+Pj4+IEBAIC02ODgsNiArNjkzLDggQEAgY29uc3Qgc3Ry
dWN0IHNiaV9oYXJ0X2V4dF9kYXRhIHNiaV9oYXJ0X2V4dFtdID0gewo+Pj4+ICAgICAgIF9fU0JJ
X0hBUlRfRVhUX0RBVEEoemljZmlscCwgU0JJX0hBUlRfRVhUX1pJQ0ZJTFApLAo+Pj4+ICAgICAg
IF9fU0JJX0hBUlRfRVhUX0RBVEEoemljZmlzcywgU0JJX0hBUlRfRVhUX1pJQ0ZJU1MpLAo+Pj4+
ICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc3NkYmx0cnAsIFNCSV9IQVJUX0VYVF9TU0RCTFRS
UCksCj4+Pj4gKyAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHNtY3RyLCBTQklfSEFSVF9FWFRfU01D
VFIpLAo+Pj4+ICsgICAgX19TQklfSEFSVF9FWFRfREFUQShzc2N0ciwgU0JJX0hBUlRfRVhUX1NT
Q1RSKSwKPj4+PiAgICB9Owo+Pj4+Cj4+Pj4gICAgX1N0YXRpY19hc3NlcnQoU0JJX0hBUlRfRVhU
X01BWCA9PSBhcnJheV9zaXplKHNiaV9oYXJ0X2V4dCksCj4+Pgo+Pj4KPj4KPj4KPj4gLS0KPj4g
b3BlbnNiaSBtYWlsaW5nIGxpc3QKPj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo+IAoKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
