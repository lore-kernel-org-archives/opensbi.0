Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF28FEEF29
	for <opensbi@archiver.kernel.org>; Tue,  7 Apr 2026 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSR49kwPMgsuZZ39IVlHhi0HktPq9stxWFEutqWgKKE=; b=O6maZZ0qgsdXss
	V+/0OFwBQZMOZr/pI+DvmlYXJvLNhP+tjLfUjtXE2UZGwiQ49ll4FqfSt1dxXOdvqkSbYMsBPL9U9
	l0V1BxProtdr8XTlBbMeyp863OeAd4lA/0FIMZ/Ptv9aPmVd75EYS+nFLyhNxsso0gz/tnL3Ehva1
	2nMn6+YZ79b3vxrTPbFsJa/Qu8Eo7ZSM8ajANhNoXJdtllfs6ynwSMKlHHqEOnCVX3t+8M2m0vqeu
	JBXs3kMgTGcQhBYhjxHqqpMXnL0jABT6ngodWHhCytlY5yKjzphVxqF9pkpBV6/1kW+2CBEjgQnUd
	Y2hsTHet78wPvVfNAr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5HS-00000006QKV-2zgO;
	Tue, 07 Apr 2026 12:11:42 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5HP-00000006QJP-2bMk
	for opensbi@lists.infradead.org;
	Tue, 07 Apr 2026 12:11:41 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7dbba5076c8so1755773a34.0
        for <opensbi@lists.infradead.org>; Tue, 07 Apr 2026 05:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775563898; cv=none;
        d=google.com; s=arc-20240605;
        b=kONv6+QqYsQVUzK2C5p1tOZOdhGEPy7bTrvY8N4NfNKILDxniSjwr6zzCNm1xyzzs/
         Ccr6rJzkmOxb4wX6ErNkV3tRmw+xg6I7BDCAB2krp60I4ar59ogM1gATlA8WW+cWRZ8B
         ysi6PwaLgJ/rNMkve4amQPjUriwKPV/32VWV7hmKLsshtQ9PjddQADZbOki8byVhtvGC
         uZkq8pLXohavek1zu6NQ9Ue1aoVNJmjIp7r2LoWiHgjrRf4LVIhduuwBCWsaM9CWYREG
         h4xSDI3HraCEb/ikSWkT19wlwpOS0NsurxYLFTzJJcTTUVJ1C/zjflzyOpeWFrK+Inle
         zgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vKHhqdQgXF252dLusvJg4789UsH1vHeJpuv4XlCfJoA=;
        fh=Sch92qKkux4AeucvC2KlvargZk/jQktzKzrRc6CJlNk=;
        b=J6/LXXoati00+Jn//16H3xiolQI44weX9tL/z9XIK9ALUdi1wgy9pVA6KC3TjrgbUW
         S0M/WuXX3AA8NKnvUt4QZufbwvcMr1BjAcNY9cRtQGOgS0JbJdSE/5oGOLN5LPemou5A
         54VlBgV2fKZ4AHgO+3OIgMU8suVbgE/59b5ykmoqfUhfLH8U7Stq/daG9/ou2ogMcNi7
         PumeLiQ0+guX4/f4xT3BKS+eNoLN5zSQYNs4hnYFUFZ41Eqh5wkkGjWO1AEz58oVL9he
         VKFjFUnqia9CXI5/5EfbNHaqTFseLaLujAgNfn7kOUraI0RP4dOIw0Gp7Q9BOa6/FMIh
         7GQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775563898; x=1776168698; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKHhqdQgXF252dLusvJg4789UsH1vHeJpuv4XlCfJoA=;
        b=NfBwommiLk52+xY2c5OldXD923/5IrTR1XnyzE7B1p9VNQ20Y1vhqHF/7PcxLGTsMz
         4Sr7XdzNJMrshKu97UIDpOj/bsHmGAv1Cc4P+MuoBIxSdulqDnpEFN2pqdmYPEcHJMBX
         ivi4WAIIIZvmPms+N2IA6nGV8Wlx9A08wHOvHXxWQuQyn2bYwnPpwy7OSB7xXMR/YnaT
         xdUo9dCxJtL+kQx3KvqsjgNCTDeD36/cCcY30Fn5UmRldRAMHGpbmp9ITYE9S4qDk9cY
         +ipk318KHYnTcd6bZHEgXO+P978I6QMaErBMNUbukgKbpMLt5XkPcJM3jJfFlDnPzMr9
         YWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775563898; x=1776168698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vKHhqdQgXF252dLusvJg4789UsH1vHeJpuv4XlCfJoA=;
        b=aNgXeGGEJ9Vy6JVPljxP+gNxJNGVPU9sEOPEkumAVptDT7O8/ZY6JhkQjUjC5TZ7J5
         YdP5OhK8ypP7Hls/YWN35M3UKdu3zWuCXLr2f8+nSY9W8GvPnJo9JpUIoN/SMpTE2TNR
         LY8SWYL/CNT92IHxXFtguh8TGmDSC791UBgYxhwhqSijo+thGfk8biQJUct8qo/WV15/
         4xwvLFeRQSEpIMh3Nlv1ZWRR8qggCtPwgwgrzWT6G1GLbjvQ8WayZ+o6JInY0DEBoEd3
         NMu1mvODCaeYcGZoECBTIdsdpnghY3wodQaH10AsT9Rnj3ck7JB+CrbX0fBxTJT4hVCc
         puvg==
X-Gm-Message-State: AOJu0YwWC/2F/5QNCUbMUmKd7tyFk/WEANSUSC+xE4Dkr96m3DCsZe4X
	sL0oHaqCP4WPoGB3Vg/Xw2M0WytBscKCQBzUiMpeiZzBukinQ+PHiQgNVlskWJjYiaGdclkIu3X
	Ae+wnpnabVz1u158pmjE34cvHMaQIpiPOZCEN8rnuoQ==
X-Gm-Gg: AeBDiesG4Ad2hrh13An13ESYtq/u32Lu1kc/QV2Sz6qSuK8ExHv5oh6B5DnknqBGEy6
	I7u+Qk9FgdPPnTz45VH5RZge5eOYhpaGKEHktmIXkzDvKI2UXLxOIVmMWGh/QZjwNFT2ps+YKWe
	+ptt+CMEyLLXpco10/tmBZD8aaJ2UF5NEZnAPxa/cyLOWmXgOJKfbsU0UDuSgX2qpKJGEHberOT
	m8Kv6BaI/0CfsvJ7nzpDc7ndGdP8c9uP/UoKo4muY+FGoiL8TDFkJ5ffjP5MNICfGTc/wbKUsXP
	/hgwm8UDkXVw17SBRqBNcjI1+AuHSYw3kJC1KUeVGnaqX1mm4REi1PKhBP5TYTUbIOB+XdtMRds
	nD8sX1b4n79/jhfPj6hvwh/4BFQ==
X-Received: by 2002:a05:6820:190e:b0:680:51ef:f9d1 with SMTP id
 006d021491bc7-6821f08553cmr8725196eaf.21.1775563897937; Tue, 07 Apr 2026
 05:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260211222025.2463312-1-raymondmaoca@gmail.com> <20260211222025.2463312-2-raymondmaoca@gmail.com>
In-Reply-To: <20260211222025.2463312-2-raymondmaoca@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Apr 2026 17:41:26 +0530
X-Gm-Features: AQROBzBxVMlkLMUVJofuALmDwysNTDknGwru6NWRfNyDc3zfaWhweu-8MxEIpTk
Message-ID: <CAAhSdy0T7kF8VsuDdfUPCeRSbxOWykzcMWed4sSoina9GvNa-A@mail.gmail.com>
Subject: Re: [PATCH 1/3] lib: sbi_irqchip: Add irqchip private context pointer
 in sbi_irqchip_device
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_051139_718880_E639B736 
X-CRM114-Status: GOOD (  16.17  )
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

T24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgMzo1MOKAr0FNIFJheW1vbmQgTWFvIDxyYXltb25kbWFv
Y2FAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0By
aXNjc3Rhci5jb20+Cj4KPiBIVyBzcGVjaWZpYyBwcml2YXRlIGRhdGEgaXMgcmVxdWlyZWQgZm9y
IGlycWNoaXAgZGV2aWNlIG9wZXJhdGlvbnMsCj4gZm9yIGV4YW1wbGUsIGZvciBBUExJQywgYWRk
cmVzcywgbnVtX2lkYyBhbmQgbnVtX3NvdXJjZSBhcmUgbmVlZGVkCj4gZm9yIG1hc2sgLyB1bm1h
c2sgLyBjbGFpbSBhbiBJUlEsIHRodXMgaXQgaXMgcmVhc29uYWJsZSB0byBhZGQgYQo+IHByaXZh
dGUgSFcgZGF0YSBwb2ludGVyIGluIHNiaV9pcnFjaGlwX2RldmljZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0ByaXNjc3Rhci5jb20+Cj4gLS0tCj4gIGluY2x1
ZGUvc2JpL3NiaV9pcnFjaGlwLmggfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2lycWNoaXAuaCBiL2luY2x1
ZGUvc2JpL3NiaV9pcnFjaGlwLmgKPiBpbmRleCA3N2I1NDExMC4uYWY4MjBlYzEgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9zYmkvc2JpX2lycWNoaXAuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9p
cnFjaGlwLmgKPiBAQCAtNTYsNiArNTYsOSBAQCBzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlIHsK
Pgo+ICAgICAgICAgLyoqIFVubWFzayBhIGhhcmR3YXJlIGludGVycnVwdCBvZiB0aGlzIGlycWNo
aXAgKi8KPiAgICAgICAgIHZvaWQgKCpod2lycV91bm1hc2spKHN0cnVjdCBzYmlfaXJxY2hpcF9k
ZXZpY2UgKmNoaXAsIHUzMiBod2lycSk7Cj4gKwo+ICsgICAgICAgLyoqIElycWNoaXAgZGV2aWNl
IHByaXZhdGUgY29udGV4dCAqLwo+ICsgICAgICAgdm9pZCAqY2hpcF9wcml2OwoKTm8gbmVlZCBm
b3IgdGhpcyBwYXRjaCBzaW5jZSB3ZSBjYW4gdXNlIGNvbnRhaW5lcl9vZigpIHRvCmdldCBpcnFj
aGlwIGRldmljZSBwcml2YXRlIGNvbnRleHQuCgo+ICB9Owo+Cj4gIC8qKgo+IC0tCj4gMi4yNS4x
Cj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkKClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
