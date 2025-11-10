Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8EDCCFA1A
	for <opensbi@archiver.kernel.org>; Mon, 10 Nov 2025 08:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Et0Qkfx+qrx+cV4DzLiynXvEW0shlCo1vz244cQheJQ=; b=UJsRtYTpbnWdRz
	7d/1NkKLB8NA44KGOrPLTfYn10B/MFN77YbwY1yEWO0CcdFw0zHEKr61JSIGPVf9S19T9emAjN1XT
	9uc7o4joBvnKSdf0H13TEsHlK2FWxSZcApL3XmbNzJFIRllPdeBJFZHlkTMyPCJpAlHIANBrz3IVX
	XeyjDc6Rkx7GqhDGpjP6uJ9tJkTRRDpvLavE0rCTZMvUBMjsbyHBPc9nZPFaGU0EmmOzLXfu5cIcj
	sQBdXAzSd6ICr7NwgH9761krIELK50UBPP40OyLjXUlNuEuKmU0lJNyFLXszKulbyTLNaBzk8edGn
	4iq9vZAlUmsVBD+Jt/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN7K-00000004y5n-1iBH;
	Mon, 10 Nov 2025 08:19:14 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIN7I-00000004y4q-2YHE
	for opensbi@lists.infradead.org;
	Mon, 10 Nov 2025 08:19:14 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-43323851d03so10287345ab.0
        for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 00:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762762751; x=1763367551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnmJuJbdbkhSuT2sYg1FEGjXiLNbznZJnqJI1f7N4U0=;
        b=RPh7VoUvpi8xiJt8JcyV+7ikZq85rXJwEdxHV/f6uj8TMulDTB2LocO0lf0xfEcCCq
         +GXt0dTZe6TuapMCy7zO4rulKMM/XcUb0VvaqVAVgw5FjcmsbRBb8FNuaFVGe/YPgXNl
         //yoGOtev3tRnk27cE/DU4Ne1/qAktyMOe957sPaoSd7Z43d//DVIFV0VgZCiCmRdIAe
         O9NiD6+gQ7JTT+aSz3ET3Dh3dPUtOii6iuDGsHAKMbIF7wCGR1k6oeX1U7fYIzy68EY6
         N4IbA0WJNq2tF/EEdlpBT2J5ZlW6JFOWk79HR5vy1A2+8tUG6FM5PZcfXmnX0lSE74oZ
         GqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762762751; x=1763367551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnmJuJbdbkhSuT2sYg1FEGjXiLNbznZJnqJI1f7N4U0=;
        b=WT4FkmQXb7q6v926rSfShoiJjc4gmJzqwA2jiX1N3BiV5MLKTk9FjQz4zIhoBEmx8E
         NcdteozVRpBreE0gkJrTuX8Y68B5wfn3ChzouO1EPZjwYe9L1nggsCAshR9px/G57stS
         9653fxphvCZQevtMt41ssBg9ADrGQD1AhsqG11u+ugtt3LDV5gVm/ElfseS334pbEZaI
         pUfiPbIE5gOFRfn/tqYksAeZuOLmDmynQmz3vzJJhiyHmURgyOIq/hilU/ydgY8XCzes
         ONussoo0RRJlFTPc3PhZh1k3OXxMBscNLu/3f7KPUbev6FbDBxPatahghz1Pe64Uscx/
         Y3Yw==
X-Gm-Message-State: AOJu0YwCBGxUUpYJTUM5E+8+88bvJUfQQoZ753YtzJjf8wqRNSnpUlNW
	xA9oiikv/0d+oEdxBjWF5lOtgp0nLM4deDg5Q6VLRPs2i67lmv6X4NHGVMUrhuCZy6cbsnG844Z
	VTraVZOEpq1/C8cDmfXQ3F61reTN/zGKBb3YQVhMHOA==
X-Gm-Gg: ASbGnctYQnNhXyV/fKINuufFL+s3W8g1wzr6+/CiyARMCiNb8g6mwRq+eq2uVI2+rW4
	nlYdYalcPGnTrJJQfmAuJ/S4aj6v0yHVcw96lvNQoTgQFvrXmt+Z6va7nkCYxUdngIsSTMrP7Ko
	swL1VYxsONDcyd8YAZ1FMfuXWzzEe6muexOCeWYh4UhX0g2DHq1UZntEbaHRYNtKYY3isTD5WGs
	MuaZxnL57kw1pxMtM28yMfmT2g9HBIZRV0siBBTs76c2lyXtljsdN7u+rMLbBWAC0zQk36XyxkI
	eFnv6FKz/V82XqyYL9wqPiXTL3fQ
X-Google-Smtp-Source: AGHT+IH+dWP5D1f/pGd1DxRuLJ3M9LVnBgxY3vr4kOIElqWHYzSr+LJbR+Km2Gr7to4S1yPzexytQZqiRwgv0mMQWSs=
X-Received: by 2002:a05:6e02:4914:b0:433:767e:8f47 with SMTP id
 e9e14a558f8ab-433767ec96fmr77118105ab.29.1762762751407; Mon, 10 Nov 2025
 00:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20251107-p8700-aclint-v3-0-93eabb17d54e@bootlin.com>
In-Reply-To: <20251107-p8700-aclint-v3-0-93eabb17d54e@bootlin.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 10 Nov 2025 13:49:00 +0530
X-Gm-Features: AWmQ_blpEM_oLycB_BsIHFWw6CCildGWJJHo5syKS6RZ0j98s_gB2_PEOWvJZmA
Message-ID: <CAAhSdy1y36UPmjC8z6qNn5Awr73Jc23GO3848eCcpmcVEkpWww@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add MIPS P8700 compatibles for ACLINT MTIMER
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: opensbi@lists.infradead.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_001912_895919_4EBD9520 
X-CRM114-Status: GOOD (  16.97  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCA0OjE34oCvUE0gQmVub8OudCBNb25pbiA8YmVub2l0Lm1v
bmluQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IFRoZSBBQ0xJTlQgZm91bmQgaW4gdGhlIE1JUFMg
UDg3MDAgaXMgY29tcGxpYW50IHdpdGggdGhlIG5vdyBhcmNoaXZlZAo+IFJJU0MtViBBZHZhbmNl
ZCBDb3JlIExvY2FsIEludGVycnVwdG9yIFNwZWNpZmljYXRpb24uIFRoZXJlIGlzIG9uZQo+IEFD
TElOVCBjb250cm9sbGVyIHBlciBjbHVzdGVyLCBhcyBwYXJ0IG9mIHdoYXQgTUlQUyBjYWxscyB0
aGUgY29oZXJlbmNlCj4gbWFuYWdlci4KPgo+IEZvciB0aGUgTVRJTUVSLCB0aGVyZSBpcyBubyBk
ZWRpY2F0ZWQgbXRpbWUgcmVnaXN0ZXIgdG8gYWN0IGEgcmVmZXJlbmNlIGluCj4gYSBtdWx0aS1j
bHVzdGVyIGNvbmZpZ3VyYXRpb24sIGFuZCB0aGVyZSBpcyBubyBNVElNRVIgd2l0aG91dCBhc3Nv
Y2lhdGVkCj4gSEFSVHMuCj4KPiBUbyBoYW5kbGUgdGhhdCwgYSBuZXcgZGV2aWNlIHRyZWUgcHJv
cGVydHkgbmFtZWQgInJpc2N2LHJlZmVyZW5jZS1tdGltZXIiCj4gaXMgYWRkZWQgdG8gaW5kaWNh
dGUgd2hpY2ggTVRJTUVSIGlzIHVzZWQgYXMgdGhlIHJlZmVyZW5jZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KPiAtLS0KPiBDaGFu
Z2VzIGluIHYzOgo+IC0gRHJvcCBtc3dpIHBhdGNoOiBhbHJlYWR5IG1lcmdlZC4KPiAtIFN3aXRj
aCB0aGUgRFQgcHJvcGVydHkgZm9yIHRoZSBNVElNRVIgcmVmZXJlbmNlIHRvIGEgZ2VuZXJpYyBv
bmUuCj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUxMDI3LXA4
NzAwLWFjbGludC12Mi0wLWYxMGNiZmI2NmU5MkBib290bGluLmNvbQo+Cj4gQ2hhbmdlcyBpbiB2
MjoKPiAtIFNlbGVjdCB0aGUgcmVmZXJlbmNlIE1USU1FUiBiYXNlZCBvbiBhIERUIHByb3BlcnR5
LCBub3QgdGhlIGZpcnN0IG9uZQo+ICAgZm91bmQuCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjUxMDA5LXA4NzAwLWFjbGludC12MS0wLTE4MzIyYzY0Zjk2OEBi
b290bGluLmNvbQo+Cj4gLS0tCj4gQmVub8OudCBNb25pbiAoMik6Cj4gICAgICAgbGliOiB1dGls
cy90aW1lcjogbXRpbWVyOiBTZWxlY3QgdGhlIHJlZmVyZW5jZSBtdGltZXIgZnJvbSBhIERUIHBy
b3BlcnR5Cj4gICAgICAgbGliOiB1dGlscy90aW1lcjogbXRpbWVyOiBhZGQgTUlQUyBQODcwMCBj
b21wYXRpYmxlCj4KPiAgbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYyB8IDE3ICsr
KysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiAzOGE2MTA2YjEwOTk2NDZmMjU2NTdiYmE1
M2NlZmI4MDg4NjcyMWE3Cj4gY2hhbmdlLWlkOiAyMDI1MTAwOC1wODcwMC1hY2xpbnQtZWY4ODY4
ODg5NzQ1Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gLS0KPiBCZW5vw650IE1vbmluLCBCb290bGluCj4g
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5j
b20KPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKQXBwbGllZCB0aGlzIHNlcmllcyB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtz
LApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
