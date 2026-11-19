Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C34606A326
	for <opensbi@archiver.kernel.org>; Thu, 19 Nov 2026 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0eyi+z1u;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=BS6ewKTm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1ok4cZGWOXpCSn/xxclPAWUtL1qeln+jVMO5FCr8ZGY=; b=0eyi+z1uMjv7iRHICv5QcGaveW
	OI+m59KMU3+8hMiW0Ra16+KzHqYLOYS7Ot7A+mkLVKBslvvv/T9nRHjrio5GpqUDe+o6rM+fr0hQh
	4SR+nfjb8oFqG9T2ttF0erSQZ++1HaKIZtTw7b7osFvDWx7yBxpnQW57UT4iOFX1Z21Ns5M35UHSt
	SPmMUn1BrHypjJZwEW93764KkZe3ZgKdv0BKCij9faJraI+7hvqiOk4vjhi/d7WVUgYH0p+jaPnJJ
	y3QCsmX41pGRTOVpAn7KrKJVpTsct0urImyMeifS01KRTM+gh2W8QNAwB7wnWH8gpHlFu+f4pnPoh
	MsJQuJhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1oa-0000000ByOV-2X5P;
	Thu, 19 Nov 2026 13:04:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1ne-0000000BxTZ-2YSt
	for opensbi@lists.infradead.org;
	Thu, 19 Nov 2026 13:03:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so14003215e9.0
        for <opensbi@lists.infradead.org>; Thu, 19 Nov 2026 05:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795093416; cv=none;
        d=google.com; s=arc-20260327;
        b=rwNPQYKB7DxYttBksZ/qlImf5PKZ/c9/4VAkJLWiweOMMrMSaMjeMBicf8b8Ea3zVt
         TXeW5o50du7WvvSLPE/kHlv2CaoDaJ8uK9BPSt2GnUoNSGAuRXwfvTCL3cMWe52PjzlF
         dupdMpUJKN//yuNRrDNtyFhwrT1ZuGrtbJYDStfUdVb8VFS2FHxBNqdsVeyGlL7Yb7hb
         RK0wZxvWRUlYziN1Op6LVGSjlknL2rTDVYNwZ1yl1/l3LmGY7hEPv4M2JkECMGRQlgfH
         mNcZ4VJ9G0B5Jhsnit+Thmma+b6TY2rydvoQHY3UBSt9lfEXxuVdotAuWC0H3YBs7vIh
         cbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+7aFzxtSxEhXyHiUEJ/SaQPzeJ7k0SQTtC8nLNI+7ZM=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=CO0W0bDN2R6RYIyzr7vvMkk4uewlCSNMDRsZdpY4wWH6ZETJ3uzAiUxBqHejUyTw3s
         OPbSAtDr/TmWV+U4YbjCknN8L5fcBbMx4jkscDQTCg99H3XiRNURhwEHLPej5dRj5BDg
         Yske/Eo1bht6rsnbMc8bm1IXJ/5jy1Bg1hm9NERNteF6zeX01oJyQTaSAgUJMUKN/Xre
         GBZesjOiQgxGqT7MZ5wLGK6BaJlCONUpk+fF9syfREGlE9mDl4lbEbFe9udnaYQF8wu5
         KUcg8O7h8Oto7haBHaFBbqfeVhNXVMXU4d0FgBqwrCU6PzYaja29QAVa9+LTGxkXdstY
         a4hA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795093416; x=1795698216; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+7aFzxtSxEhXyHiUEJ/SaQPzeJ7k0SQTtC8nLNI+7ZM=;
        b=BS6ewKTmEBBg3IDYivsH+sZfXa+pbxh4Q6Lc+Ql8B8FkAXdHLO0yUPuHqDWWV0EXz6
         A0N85hiWmdwtE1lAQvytv3lqJQoaXUz6N1JCU3bN3a3fIaIkxOBUqg7ntpMT5P14Ektm
         UnPFsiWKIw1LozLkqrebZIIK6bFNfR5rT1GPW/xtKH6erldu93fTSigXZjyQQCNdMF01
         EuaKL00MrMIvUHjwckyH/sTY3AkVibhJpaMDthoJ/UEhWcB5AL0dBF9/l74BBCl1GZeZ
         VG5XSrPTn+cnHILFMOUoiwkGCn8O89aGbst4es2xQrEFIznURTAHE74WOoxW6ab7NYis
         Rp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093416; x=1795698216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+7aFzxtSxEhXyHiUEJ/SaQPzeJ7k0SQTtC8nLNI+7ZM=;
        b=G8hOOi2bG8mtVeHscR71SXS4BlK9LfBDyhkLZ3YbkZiDSOPcbaHXNrUR4DZbDXlW9Z
         WQHBBfSMB4aIkiyIOVOim8i6IvkKVLeio4uetGrbz9uiOatCDz3dZ4gRY5hfU6S7g6pZ
         WcxaQE2WgLpcuiUzFCqHn9o5ZNCck/B4iCccl/MezFMx8LaY2WQQFq6JVuUpmFSXrHo8
         OSRfkP1fUBfRDQeX3WzNI5N3zQf1iysvN6GOXZYaaOekpoG93Q3ap48fL1jh0C3/GGdD
         iZmoiFcsQPK1eNHWrEEgKUkdYq27U6KgBOXkyMN6IJoRYQEnN/peouXOeaQG3BVqd9vh
         O6Sw==
X-Gm-Message-State: APuU4Z8CSMfP7BAVBw4Wb6qFyGO9r9cPmm5v1DVwkNZOfncpB4Vjr7Rz
	1H2b4DKvXKiANgJRhhwuRmVBXLP2snTEl7dXVoaQBAl2wSCb04Z0pOXJ+1zEC6ChOpARKOxqpcC
	xwjybwkfu4grOXKWxCsH4E9+/VaBhzIX7E2A4CFIBqw==
X-Gm-Gg: AYBFou3HVyGo+kzFnAmkWXRVqg5wY/crAFNezXEujtzGk1r03KnM4T8FzJx9Jxfx1O/
	Ryc/IokOzbQm6mZAin3cdD7CTwRll2Jut+KcH84dDJo2tI9pHw5OCC3umBM2wyiDBz7oHbq0erj
	Uqt6UewwG397zZbmCa5Hi+tyemsEkVWVMQcwU4dX+jsz0Kmxr5EL8lP8Vattzbv2opuxYtaFYTG
	ayQ7R/AwnC5oIruElpIgxOq0oRCrzfs7gLnb99c08lS7/K1r8Ip4yBjijNPO7VZDLcDoLboIHRB
	w07PmjD0SWpTqUngSWdLoOLrIDWMfpYkVh79et89RYD6JbGs23KjTiRnsgSHn1pZw1pORUnUuYg
	T8qTmTNNopsWCdqKz1XJUVBHdPuvRYAatiL/FxQIqiUMpLEUV9yqb3LrHvJfMV1p/SeuBSJNWQB
	8gWlp2H7pIbXAGbUmrnK1l9G48kfiZ+0xpzcJCqc9iUlu4lv+WZoq9
X-Received: by 2002:a05:600c:4f05:b0:4bb:73ad:c1f0 with SMTP id
 5b1f17b1804b1-4bb7da21b8emr128872985e9.23.1795093415887; Thu, 19 Nov 2026
 05:03:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-5-peter.lin@sifive.com>
 <CAAhSdy2=JhtXg_h==eiet7nJ-VMaq7VCMgmVuha-uwQKkVEmMw@mail.gmail.com> <av0GzyFfzDvasVEW@plin-1878>
In-Reply-To: <av0GzyFfzDvasVEW@plin-1878>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 18:33:23 +0530
X-Gm-Features: Aa3M54puBBhkk3OsnB_s9FUvD--ixpM69SoSSL4aRUApURE3qltgxDvfTf0jlXo
Message-ID: <CAAhSdy3fC1ksY18RPTCG68KRCNW7ZxTcX=o+JOKsWRfUptn+1w@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_050338_925767_0406EC7B 
X-CRM114-Status: GOOD (  30.43  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgNzozMOKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIE1vbiwgTm92IDE2
LCAyMDI2IGF0IDA2OjQ5OjUwUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBUdWUs
IE5vdiAxMCwgMjAyNiBhdCAzOjIw4oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5A
c2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IExvY2sgdGhlIE0tbW9kZSBXb3JsZCBJRCAo
bXdpZCkgQ1NSIGR1cmluZyBoYXJ0IHJlLWluaXRpYWxpemF0aW9uCj4gPiA+IHRvIGVuZm9yY2Ug
aW1tdXRhYmlsaXR5IG9mIHRoZSBXSUQgZXN0YWJsaXNoZWQgYnkgdGhlIHJvb3Qtb2YtdHJ1c3Qu
Cj4gPiA+Cj4gPiA+IE9wZW5TQkkgZG9lcyBub3QgYXNzaWduIHRoZSBXSUQgdmFsdWUgaXRzZWxm
OyBpdCBvbmx5IHNldHMgTVdJRF9MT0NLCj4gPiA+IHRvIGZyZWV6ZSB0aGUgdmFsdWUgZXN0YWJs
aXNoZWQgYnkgcHJpb3IgUm9UIHN0YWdlLiBUaGUgTVdJRF9MT0NLIGJpdAo+ID4gPiBhdCBYTEVO
LTEgaXMgc3RpY2t5IGFuZCBtYWtlcyB0aGUgQ1NSIHJlYWQtb25seSB1bnRpbCByZXNldCwgZW5m
b3JjaW5nCj4gPiA+IGEgdGVtcG9yYWwgc2VjdXJpdHkgYm91bmRhcnkgcGVyIHRoZSBSSVNDLVYg
V29ybGRzIHNwZWNpZmljYXRpb24uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVu
IFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2Vz
IHY0LT52NToKPiA+ID4gLSBNb3ZlIHRoZSBNV0lEIGxvY2sgb3V0IG9mIHNiaV9oYXJ0X3JlaW5p
dCgpIGludG8gc213aWRfaGFydF9pbml0KCkKPiA+ID4gLSBEcm9wIFJCLXRhZ3MgZnJvbSBPemEg
YW5kIEFudXAKPiA+ID4gLS0tCj4gPiA+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgfCAxMiArKysrKysr
KysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiA+
ID4gaW5kZXggZDg2YWJmMDcuLmE3MjFiZWY0IDEwMDY0NAo+ID4gPiAtLS0gYS9saWIvc2JpL3Ni
aV9oYXJ0LmMKPiA+ID4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gPiA+IEBAIC00NjksNiAr
NDY5LDE2IEBAIHN0YXRpYyBpbnQgaGFydF9taHBtX2dldF9hbGxvd2VkX2JpdHModm9pZCkKPiA+
ID4gICAgICAgICByZXR1cm4gbnVtX2JpdHM7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICtzdGF0aWMg
dm9pZCBzbXdpZF9oYXJ0X2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ID4gPiAr
ewo+ID4gPiArICAgICAgIC8qCj4gPiA+ICsgICAgICAgICogQXNzdW1lIE1XSUQgaXMgcmVzdG9y
ZWQgYnkgcm9vdC1vZi10cnVzdCBNLW1vZGUgaW4gcHJldmlvdXMKPiA+ID4gKyAgICAgICAgKiBz
dGFnZS4gTG9jayBtd2lkIHNvIFJvVC1kZWZpbmVkIFdJRCByZW1haW5zIGltbXV0YWJsZS4KPiA+
ID4gKyAgICAgICAgKi8KPiA+ID4gKyAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihz
Y3JhdGNoLCBTQklfSEFSVF9FWFRfU01XSUQpKQo+ID4gPiArICAgICAgICAgICAgICAgY3NyX3Nl
dChDU1JfTVdJRCwgTVdJRF9MT0NLKTsKPiA+Cj4gPiBJZiBwbXdpZCBpcyBhdmFpbGFibGUgdGhl
biB3ZSBzaG91bGQgc2V0IHBtd2lkIGluIE1XSUQgQ1NSCj4gPiBiZWZvcmUgbG9ja2luZyBpdC4g
VGhpcyB3aWxsIGhlbHAgcGxhdGZvcm1zIHdoZXJlIE9wZW5TQkkgYm9vdHMKPiA+IGZpcnN0IHdp
dGhvdXQgYW55IHByaW9yIGJvb3Rpbmcgc3RhZ2UuCj4gPgo+ID4gV2hhdCBkbyB5b3UgdGhpbmsg
Pwo+Cj4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4gSSdkIHByZWZlciBsb2NrLW9ubHksIGJl
Y2F1c2Ugd3JpdGluZyBwbXdpZCBiZWZvcmUgdGhlCj4gbG9jayBpcyBlaXRoZXIgYSBuby1vcCBv
ciBjYW4gdW5kbyBhbiBlYXJsaWVyIHN0YWdlJ3MgZGVjaXNpb24uCj4KPiBUaGUgc3BlYyBzYXlz
ICJPbi1yZXNldCwgdGhlIG13aWQgQ1NSIGlzIGV4cGVjdGVkIHRvIHNob3cgdGhlIHBsYXRmb3Jt
LWRlZmluZWQgcG13aWQKPiB2YWx1ZSIsIHNvIGlmIE9wZW5TQkkgaXMgdGhlIGZpcnN0IHN0YWdl
LCBtd2lkIGFscmVhZHkgZXF1YWxzIHBtd2lkIGFuZCB0aGUgd3JpdGUKPiBjaGFuZ2VzIG5vdGhp
bmcuCj4KPiBJdCBvbmx5IGNoYW5nZXMgc29tZXRoaW5nIHdoZW4gbXdpZCAhPSBwbXdpZCwgd2hp
Y2ggbWVhbnMgYW4gZWFybGllciBzdGFnZSBoYXMgYWxyZWFkeQo+IHByb2dyYW1tZWQgbXdpZC4g
RXhhbXBsZSB3aXRoIG5Xb3JsZHM9MTYsIHRydXN0ZWQgV0lEID0gMTU6Cj4KPiAxLiBPdXQgb2Yg
cmVzZXQsIG13aWQgPSBwbXdpZCA9IDE1LiBUaGUgUm9UIHJ1bnMgaW4gdGhlIHRydXN0ZWQgV0lE
Lgo+IDIuIFRoZSBSb1QgY29uZmlndXJlcyB0aGUgd2dDaGVja2VycyBzbyB0aGF0IFdJRCAzIGNh
biBvbmx5IGFjY2VzcyBPcGVuU0JJJ3MKPiAgICBSQU0vZGV2aWNlcyBhbmQgY2Fubm90IHRvdWNo
IHRoZSB3Z0NoZWNrZXIgY29uZmlndXJhdGlvbiByZWdpc3RlcnMuCj4gICAgLSBUaGUgUm9UIHdy
aXRlcyBtd2lkID0gMyB0byBkZW1vdGUgcnVudGltZSBNLW1vZGUsIGJ1dCBsZWF2ZXMgdGhlIGxv
Y2sKPiAgICAgIGJpdCB1bnNldCBhbmQgaGFuZHMgb3ZlciB0byBPcGVuU0JJLgo+IDQuIE9wZW5T
Qkkgd3JpdGVzIHBtd2lkICgxNSkgdG8gbXdpZCwgdGhlbiBzZXRzIHRoZSBsb2NrIGJpdC4KPiA1
LiBPcGVuU0JJIGlzIG5vdyBiYWNrIGluIHRoZSB0cnVzdGVkIFdJRCwgYW5kIGxvY2tlZCB0aGVy
ZSB1bnRpbCB0aGUgbmV4dCByZXNldC4KPiAgICBJdCBjYW4gcmVjb25maWd1cmUgdGhlIHdnQ2hl
Y2tlcnMgYW5kIHRoZSBSb1QncyBkZW1vdGlvbiBpcyB1bmRvbmUuCj4KPiBHaXZlbiB0aGUgY2Fz
ZSBhYm92ZSwgSSB0aGluayB3ZSBzaG91bGQga2VlcCBtd2lkIHVudG91Y2hlZC4KCkF0IGxlYXN0
LCBjaGVjayB0aGUgbXdpZCBpbiBDU1Igd2l0aCBwbXdpZCB3aGVuIHBtd2lkIGlzIGF2YWlsYWJs
ZSBpbiBEVC4KSWYgcG13aWQgaXMgbm90IGF2YWlsYWJsZSBpbiBEVCB0aGVuIGxlYXZlIG13aWQg
dW50b3VjaGVkLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
