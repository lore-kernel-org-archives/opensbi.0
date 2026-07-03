Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09FCC43458
	for <opensbi@archiver.kernel.org>; Fri,  3 Jul 2026 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YK1FtggBPTpSBvIIZ0MVfBeoSirIDgA/mXUj1dw/SXY=; b=pAoYaO2umOaKwK
	SPx7RVzofOeQEB4KPXVulDFpPAYBhT5ha/IAkcmaZZtgnoJmuZZdJaydM+dMMn5u43uizVcKQD1EJ
	+IuuKes6Nnjvkum+dYob5hAthi9UxvXT1yy7Aoh8CgattfUYRODE/BUORK2oMTCXgOqBz1t24rA5p
	vFyp0RwqbkfsQDMLaWUwd5+554wSSbsT4ObKyruYdBPdV9KUM70lK9pMGefos5mgr6EJs+PPna+ZO
	UOFLYsNcTdPWDwOwYKOWpvCUHf69n/9Y0DRVP4USxwpxVkRPCEKFEraZeEdl/H46m4N8QrzamGEhu
	4vcB0qu2MIxIuj++pffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfccK-00000006tQ7-4Bna;
	Fri, 03 Jul 2026 12:03:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfccI-00000006tPM-0a8y
	for opensbi@lists.infradead.org;
	Fri, 03 Jul 2026 12:03:35 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-474e7ba9fd6so279376f8f.1
        for <opensbi@lists.infradead.org>; Fri, 03 Jul 2026 05:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783080212; cv=none;
        d=google.com; s=arc-20260327;
        b=FZdDls/SMMIareMVhhnisAzwId0A5LOoNNTQaFzzCzj9a2kXqLWQ19Nq6WGvR0uJlz
         GLkyf1yGzQvpVD2pymIse3kuxqSxfJjjUjGyDPCPMFgcMA5ZxdBscxqt5d6fuY2ccM5X
         ecg91+ZyNrbpCrUWTN59EY2q64PUuDsA8RSpeDaDh8aNKruV1MiRSOymf91Ban2XOFJp
         UA6Tgmu3x/sBT4EmjFYj+5zwsdvbJ/5e4Z6r3fg+adVbz/oBNk53oAgygvHrYDhTR0ZQ
         DtOyusBoOe0EeuLo5+q3UAflwFVXU9V0sLRiRqvGP6V7P5oZ1UyX4xZR3tlo51OVUqC8
         hvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pw4m7cQ8JihP88jM6yRdCJ5Am1ypb8z/83wgw0IA0z0=;
        fh=CqbpP/AKd1PopwvHWPM2igp22cBZzYsgm1TYYUIWq4c=;
        b=IDJ+r/WvKcDcYwKc9Gl9soE/RlYsC4rBLwHJfCYdAau0qlUiKHHL/4xJhgBSte33Gg
         kj0HMsIrhQJwTAT23gVNTHQCEHVA+JjY19zYMQlQfGE/0VmrEd50rI/5dCVA7ZspWGgx
         NtmrCDYPf9BPwbHGtGoCjRhZ4BEiELyGDiCPCB0vUXPNzoURKR4KI9YuGTlQ5VJMcmx+
         nXBgmijuKxtEPyRS0/IUl5wj6u0tY+Ng0scteX42/YAEOBEILhPYKTsaHITHXDa4DBhn
         KuJ931nKtsf5AY/VaXW3TrNBge/hLU6UWuP3I8mJpNNYEZHtL7ByvkxKen+WIsY2QU6x
         v/mA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783080212; x=1783685012; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw4m7cQ8JihP88jM6yRdCJ5Am1ypb8z/83wgw0IA0z0=;
        b=JGDbIDFB+hLqRvVKC1kpFvE71P01uAsriROTUAFKop4o8Y9f7R74NMmkYxSmcd/ou0
         /o61qdHXostgH9cWy3uNQKb/fYXeEgpCPRPZJE57kwaXkWkRkTtK+WfkofV4S0msVRj6
         UxNEZ247h+lewizps7BtW3s47JIKxFoBNY5pWydiaYdx85WHqShg7DNsb3IGZIc5c/QZ
         znmNwI6FLD3TEAiLO+fr/L7HC1y2ZMlGTFSLyBRncG1z2eBchdt12y2OVYl8KnwvnYn5
         d5XfaT5051oIvemnFMVh8u1Y3zttijZUiyI04f8DhghnwCGgjPS5hH+0nFECX5HLD+jb
         DWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783080212; x=1783685012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pw4m7cQ8JihP88jM6yRdCJ5Am1ypb8z/83wgw0IA0z0=;
        b=oWvFKsT/uGAXJvpDMDJlZ/oP7jZpjb2HaPdc1vbjFa+rzJjnfnnbnyP71C8BqXEndm
         RyA4vypPWkR9uUOgFy2i5NONG2BcndRdINTuk+3A8vv5Iknawy9lctlUi9Lx9a5g3lMg
         q7/7P1ZmgLnrgB+vwhFD9SOgG9wOmUdnVcYMJvnfiBhAuJZerPDp8Wd55tfkxxx7+Avr
         XBwF5m9Sv5YgvkrXgo2rmim261tIJexfUsHL14qaqaHhR9iL/Phz/OaXpQOfSGA7pDmQ
         I2shoCf3foA3NnQEMGUR5zjWpWn/nzmQJwlHnycYN/1CB/Z589qKKuvnpoUDcoRiwjJ1
         UyZg==
X-Gm-Message-State: AOJu0YzES0+qiwuMpfjs94b1nGQy0Q8bP5E6ENT/30r5s4PSDy51bLh+
	Mnzs5wvJ+1KcQ+In5WdazmF+OCGd/X+dyiNg76Zmt2pMn5RxQ4iDwk8VjJRX0Z1FUH1qopxB4hO
	/AdC0gI27TW6FahhZElchboQbE1J2N6Jr2IdSu3cck4wm4UCPx7iO
X-Gm-Gg: AfdE7cno4u9hAL6WfywnZC79dtDs3SJuBd+31snPAXnalWNjHkK81VBYAWhuqH+AVbB
	nTYGI3/Sl8/Diajhf0Lko2/QcOCsL5lNIoWSZckjWoV8pH3ZcrcYusm5Vijbbew0/8FradUuLhH
	YChWXww3afChMqn/Vep2OgHnpoThG92wNn6Ii972a3Jl35VURzinySApomXSLMo6DGQbNsjw/CT
	8u4zcD3xGJIfS5B2m3u269zWrfFFipKarkTw+VzpPwj8xu8COMKm+WFAq3gDXfEREM0G+uxLqNW
	DAoq7G+TDlJrUD4aQWXbGETcsYonk3h8ebTnsixL260iLq+6lwItLxUs4dLkDE8wyX7IqCODlKp
	bzvy8G2H2OdXJX2w=
X-Received: by 2002:a05:6000:1846:b0:478:2698:72f4 with SMTP id
 ffacd0b85a97d-478269873f5mr10311604f8f.45.1783080212140; Fri, 03 Jul 2026
 05:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <6a477160.de7c5347.2799ad.72abSMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <6a477160.de7c5347.2799ad.72abSMTPIN_ADDED_BROKEN@mx.google.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Jul 2026 17:33:18 +0530
X-Gm-Features: AVVi8CcAD4EpPQSGRqdZS7ebcKE5ijHG1ldq1cDXoSiZzOj_hzh85-qidJGgwlc
Message-ID: <CAAhSdy0jxam_NhaYZnRrJZz=L75EY9h2Epvti4xo3TOkvPtiXQ@mail.gmail.com>
Subject: Re: [Question] Possible tlb_sync hang when remote SFENCE.VMA races
 with HSM hart_stop
To: bin.yao@ingenic.com
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_050334_197570_72BCAE9E 
X-CRM114-Status: GOOD (  19.14  )
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

T24gRnJpLCBKdWwgMywgMjAyNiBhdCAxOjUy4oCvUE0gPGJpbi55YW9AaW5nZW5pYy5jb20+IHdy
b3RlOgo+Cj4gSGVsbG8gT3BlblNCSSBtYWludGFpbmVycywKPgo+IFdlIGFyZSBzZWVpbmcgYSBo
YW5nIGR1cmluZyBhZ2luZy9zdHJlc3MgdGVzdGluZyBhbmQgd291bGQgbGlrZSB0byBjaGVjayB3
aGV0aGVyIG91ciBhbmFseXNpcyBpcyBjb3JyZWN0Lgo+Cj4gRW52aXJvbm1lbnQ6Cj4gLSBPcGVu
U0JJIGJhc2UgdmVyc2lvbjogdjEuOC4xCj4gLSBCYXNlIGNvbW1pdCBpbiBvdXIgdHJlZTogNzQ0
MzRmMjU1ODczZDc0ZTU2Y2M1MGFhNzYyZDFjYWYyNGMwOTlmOAo+IC0gRG93bnN0cmVhbSB0cmVl
IHdpdGggcGxhdGZvcm0tc3BlY2lmaWMgSFNNIGhhcnRfc3RvcCBzdXBwb3J0Cj4gLSBQbGF0Zm9y
bTogZG93bnN0cmVhbSBJbmdlbmljIHBsYXRmb3JtCj4KPiBPYnNlcnZlZCBzeW1wdG9tOgo+IFdo
ZW4gb25lIGhhcnQgZXhlY3V0ZXMgcmVtb3RlIFNGRU5DRS5WTUEgd2hpbGUgYW5vdGhlciBoYXJ0
IGlzIHN0b3BwaW5nLCB0aGUgc2VuZGVyIGNhbiBzcGluIGZvcmV2ZXIgaW4gdGxiX3N5bmMoKSB3
YWl0aW5nIGZvciBhIGNvbXBsZXRpb24gdGhhdCBuZXZlciBhcnJpdmVzLgo+Cj4gT3VyIGN1cnJl
bnQgdW5kZXJzdGFuZGluZyBvZiB0aGUgcmFjZSBpczoKPgo+IDEuIFRoZSBzb3VyY2UgaGFydCBj
YWxscyBzYmlfdGxiX3JlcXVlc3QoKSBhbmQgdGhlbiBzYmlfaXBpX3NlbmRfbWFueSgpLgo+IDIu
IHNiaV9pcGlfc2VuZF9tYW55KCkgYnVpbGRzIHRoZSB0YXJnZXQgbWFzayB1c2luZyBzYmlfaHNt
X2hhcnRfaW50ZXJydXB0aWJsZV9tYXNrKCksIHNvIGEgdGFyZ2V0IGhhcnQgY2FuIHN0aWxsIGJl
IHNlbGVjdGVkIHdoaWxlIGl0IGlzIGluIFNCSV9IU01fU1RBVEVfU1RBUlRFRC4KPiAzLiBCZWZv
cmUgdGhlIHNvdXJjZSBjb21wbGV0ZXMgdGhlIHNlbmQgcGF0aCwgdGhlIHRhcmdldCBoYXJ0IGNh
biBleGVjdXRlIHNiaV9oc21faGFydF9zdG9wKCkgYW5kIHRyYW5zaXRpb24gZnJvbSBTVEFSVEVE
IHRvIFNUT1BfUEVORElORy4KPiA0LiBUaGUgc291cmNlIHN0aWxsIHF1ZXVlcyB0aGUgVExCIHJl
cXVlc3QgaW4gdGxiX3VwZGF0ZSgpIGFuZCBpbmNyZW1lbnRzIGl0cyBsb2NhbCB0bGJfc3luYyBj
b3VudGVyLgo+IDUuIFRoYXQgY291bnRlciBpcyBkZWNyZW1lbnRlZCBvbmx5IHdoZW4gdGhlIHRh
cmdldCBoYXJ0IGxhdGVyIHJ1bnMgdGxiX2VudHJ5X3Byb2Nlc3MoKS4KPiA2LiBJZiB0aGUgdGFy
Z2V0IGhhcnQgaGFzIGFscmVhZHkgcGFzc2VkIHRoZSBwb2ludCBpbiB0aGUgc3RvcCBwYXRoIHdo
ZXJlIHBlbmRpbmcgSVBJcyBhcmUgZHJhaW5lZCwgdGhlIHF1ZXVlZCBUTEIgcmVxdWVzdCBpcyBu
ZXZlciBwcm9jZXNzZWQsIHNvIHRoZSBzb3VyY2UgcmVtYWlucyBpbiB0bGJfc3luYygpIGZvcmV2
ZXIuCj4KPiBTbyB0aGlzIGxvb2tzIGxpa2UgYSByYWNlIGJldHdlZW46Cj4gLSB0aGUgaW50ZXJy
dXB0aWJsZS1tYXNrIHNuYXBzaG90IGluIHNiaV9pcGlfc2VuZF9tYW55KCksIGFuZAo+IC0gdGhl
IFNUQVJURUQgLT4gU1RPUF9QRU5ESU5HIHRyYW5zaXRpb24gaW4gc2JpX2hzbV9oYXJ0X3N0b3Ao
KQo+Cj4gSW4gb3RoZXIgd29yZHMsIHRsYl9zeW5jIGl0c2VsZiBkb2VzIG5vdCBhcHBlYXIgdG8g
YmUgd3Jvbmc7IHRoZSBwcm9ibGVtIHNlZW1zIHRvIGJlIHRoYXQgYSBoYXJ0IGNhbiBiZSBjb3Vu
dGVkIGFzIGEgdGFyZ2V0LCBidXQgdGhlbiBzdG9wIGJlZm9yZSBpdCBjYW4gcHJvY2VzcyB0aGUg
cXVldWVkIFRMQiByZXF1ZXN0Lgo+Cj4gVG8gbWFrZSB0aGUgd2luZG93IGVhc2llciB0byBoaXQg
ZHVyaW5nIGRlYnVnZ2luZywgd2UgdGVtcG9yYXJpbHkgYWRkZWQgYW4gYXJ0aWZpY2lhbCBkZWxh
eSBpbiBzYmlfaXBpX3NlbmRfbWFueSgpIGluIG91ciBkb3duc3RyZWFtIHRyZWUuIEhvd2V2ZXIs
IG91ciB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlIGRlbGF5IG9ubHkgaW5jcmVhc2VzIHRoZSBy
ZXByb2R1Y3Rpb24gcHJvYmFiaWxpdHksIGFuZCB0aGUgcmFjZSBleGlzdHMgaW4gcHJpbmNpcGxl
IGV2ZW4gd2l0aG91dCB0aGF0IG1vZGlmaWNhdGlvbi4KPgo+IFF1ZXN0aW9uczoKPiAxLiBEb2Vz
IHRoZSBhbmFseXNpcyBhYm92ZSBsb29rIGNvcnJlY3Q/CgpZZXMsIHRoaXMgaXMgY29ycmVjdC4K
Cj4gMi4gSXMgdGhpcyByYWNlIGFscmVhZHkga25vd24/CgpObywgdGhpcyB3YXMgbm90IGtub3cu
Cgo+IDMuIElzIHRoZXJlIGFuIGV4aXN0aW5nIG9yIHByZWZlcnJlZCB3YXkgdG8gc2VyaWFsaXpl
IHJlbW90ZSByZmVuY2UvSVBJIHNlbmQgYWdhaW5zdCBoYXJ0X3N0b3A/CgpNeSBzdWdnZXN0aW9u
IGlzIHRvIGNhbGwgc2JpX2lwaV9wcm9jZXNzKCkganVzdCBiZWZvcmUKc2JpX3BsYXRmb3JtX2Vh
cmx5X2V4aXQoKSBpbiBzYmlfZXhpdCgpLiBUaGlzIHdheSB0aGUgSEFSVCB3aGljaCBpcwpiZWlu
ZyBzdG9wcGVkIHdpbGwgcHJvY2VzcyB0aGUgcGVuZGluZyBJUElzIGJlZm9yZSBnb2luZyBkb3du
LgoKPiA0LiBDb3VsZCB0aGlzIGJlIHJlbGF0ZWQgdG8gaXNzdWUgIzQwMiAoIkxpZmVsb2NrIGNv
bmRpdGlvbiB1bmRlciBoaWdoIGxvYWQgd2l0aCBtYW55IFRMQiBzaG9vdGRvd25zIiksIG9yIGlz
IGl0IGJldHRlciB0cmVhdGVkIGFzIGEgc2VwYXJhdGUgaXNzdWU/CgpUaGlzIGlzIG5vdCByZWxh
dGVkIHRvIGFueSBMaXZlbG9jayBjb25kaXRpb24uCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
