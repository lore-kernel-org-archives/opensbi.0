Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C7D1067034
	for <opensbi@archiver.kernel.org>; Thu, 12 Mar 2026 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gjmqXTE7BRrVUW9TOkFSyn1nJBR4mEv+roKJTltmADk=; b=3lfSGMOhH0f8Ua
	Sc5g2fHe0nBfiP5dwLV6U4hmSJImF3NJQryOEHFwX0eiJm0K2ltbEgLhe2L+ZP0pmXSp/FWUOQ7ol
	oRV1WXGOaZR48HID6AISz2ekdnVauJqaU6cPBGfjzrKl75YoLH5NymBrHati5/5XfnGqeMfucbE8/
	wRYx4vPU9bLc0mBlU47fVtwxgnPSILL3L1jmpRoYPNQCuoPKKU2HDn7jDLQxocz51MSr4dvoyVyKy
	DLM93FYpHZpvHXcYeM2b7W7UCoQCDVoP7Ul5qOTAhv0gPWfTHP/yQYUhi3E0+QxZFQ0PLIwvPNK9v
	4vzs9XtVrm3pSKuOBbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gne-0000000EBVW-15jz;
	Thu, 12 Mar 2026 14:14:06 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gnZ-0000000EBV2-3iiB
	for opensbi@lists.infradead.org;
	Thu, 12 Mar 2026 14:14:04 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-79881805788so11992217b3.0
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773324841; x=1773929641; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8ipA+/kgnyrGUoRIh1Wj2aE80ByLbtHMLBQ4ifTwDs=;
        b=fhvrtr3N9GjnSqes3oWhvCpqZgYrR8ERUH5PJnXMDaVub75il4p+DkgmQHd2r9b+DK
         khG8Qg7RihHkmhD5wJ8UBuda6IEvuUEIV+bng3ojkvtiUxsl1vd3pG1SACu04FGhnzD+
         VTe8JZgVCkK1fTpZ9SNjCKtJ+AosVI4msWR02xIGv/MAJlSviVCGXRl18wBsDkqRsW0m
         8xwbxrFP35L9NUv+Vtb+hoTN3I81OKqiv7BQBZqcZGt771Ktk9Tgqb3U8PcmmyslcVd0
         vCxjG5BSQHa9zcsPwTRw3JEfTgoV9xZO/FJSy8UIe1tnfnkmPgZ2n45qpkvRd4diTGvQ
         u6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324841; x=1773929641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8ipA+/kgnyrGUoRIh1Wj2aE80ByLbtHMLBQ4ifTwDs=;
        b=bT20o5AfePxNPKzvEZ8vMqACb7voJ/A01MXlbQwbYf/lGwuWIp/D9hDulUNuK4NNZz
         b23NDy6xIEC/prMpclMANlpxiCWnhtZLHIZVaGNiJQh5+s6Tac3F9oE1+WgkdSR3YL3M
         ovIk02+05X6KE8S9ly1nChtpPUIs9yeo2xO98QdbplqXRRtfekJRKDGFa9o9tmREbl1E
         nhZqP2MJSM+LLWtLdxhXnp3Jj/bRpVTa+X0xZLADBYc4Vm+ji4a4LPPZT5HOpuZ/NJhL
         nagSXnQV227k5N21mjQrrvDYLDu473wkOH9vxBX+FThSDVqP5cqF0RyVTb/FXDmeOrJs
         Os+w==
X-Forwarded-Encrypted: i=1; AJvYcCXJAMsbLqw6sJdaA3t2hTDhTSS8nAS+v+ejjJk00Gik5dOCbuZJOCelLGz4D3SQNAXSmjjV3I+t@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+kHAEdT7ohB5KT7/S7jCmZRTlgpKaue6yreNl2+Lbuo/Yk7lW
	WUDXK2AOH8t5su/5jRiY+SLfSbrNL8qrhhK4czvgmTWdx/GWe8zEnKGIVZHqcnvAZWQ=
X-Gm-Gg: ATEYQzyqKoqEQjJDwFILe4Fh6/5smYFjB+kFp71plFWPlEUkowjzfwWm7ijqKtPhQYm
	kbivWoVvRlHfRBdix521CU0DbEUO1lGKu0Ij2Le8k79CAqG58SrzuJMX4rIbXG4pYqfT1JqtZ7t
	+jcJkhvWRKmWzMKCquri0PBBWdzNon7LJ99FpLUDSGjt3Qldvxz7a4MrTKbJCw2nLJlQrzZ7BHX
	CsiVJIeZo+kKl3HtZ1HxakT4Ngq3atWCuoU86Hb1MrV1YkFw2fYryQCbfwA4su5Aajq7Ch7ue+K
	6TsyMzMvqZfHDO8saNxTWt+pEQizmx9pw3nvmUOqdLM3mVndZCt87VfNSa7T9tNNTRXtjFyyAOQ
	j9TeGYVLEgNFvUp53EOM21++vDwMTyvxA+mIs2RZPSPYI230foX+0Qxf2i21lPHagv+PnCZI2XL
	hyJLLfhXFfLCBVk50/4ElQ5GudADIH2DPUXSviX31xOJfcdYHX9w==
X-Received: by 2002:a05:690c:9988:b0:799:1967:a9f2 with SMTP id 00721157ae682-7991967b3ccmr59209957b3.17.1773324840646;
        Thu, 12 Mar 2026 07:14:00 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f1df91sm32784857b3.44.2026.03.12.07.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 07:14:00 -0700 (PDT)
Message-ID: <88dca6b0-46cc-453d-8a5f-00e0c7181550@sifive.com>
Date: Thu, 12 Mar 2026 09:13:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] OpenSBI: Lazy floating-point and vector context switching
To: Vivian Wang <wangruikang@iscas.ac.cn>, dave.patel@riscstar.com,
 opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
 Robin Randhawa <robin.randhawa@sifive.com>,
 Anup Patel <anup.patel@qti.qualcomm.com>, Ray Mao
 <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>,
 Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>
References: <20260311171103.70074-1-dave.patel@riscstar.com>
 <1b1d72fb-482f-49db-b41b-53bfef6edb3d@iscas.ac.cn>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <1b1d72fb-482f-49db-b41b-53bfef6edb3d@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_071401_937590_F21BA017 
X-CRM114-Status: GOOD (  18.54  )
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

SGkgYWxsLAoKKHJlcGx5aW5nIHRvIHRoaXMgbWVzc2FnZSB0byBhdm9pZCBmdXJ0aGVyIGJyZWFr
aW5nIHRocmVhZGluZykKCk9uIDIwMjYtMDMtMTIgNDoxNCBBTSwgVml2aWFuIFdhbmcgd3JvdGU6
Cj4gT24gMy8xMi8yNiAwMToxMSwgZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20gd3JvdGU6Cj4+IEhp
IE9wZW5TQkkgbWFpbnRhaW5lcnMgYW5kIGNvbW11bml0eSwKPj4KPj4gSSBhbSB3b3JraW5nIG9u
IGFuIGltcGxlbWVudGF0aW9uIHRvIHN1cHBvcnQgZmxvYXRpbmctcG9pbnQgKEZQKSBhbmQKPj4g
dmVjdG9yIHJlZ2lzdGVyIGNvbnRleHQgbWFuYWdlbWVudCBkdXJpbmcgZG9tYWluIGFuZCBhcHBs
aWNhdGlvbgo+PiBjb250ZXh0IHN3aXRjaGVzIGluIE9wZW5TQkkuCj4+Cj4+IEN1cnJlbnRseSwg
T3BlblNCSSBzYXZlcyBhbmQgcmVzdG9yZXMgb25seSB0aGUgaW50ZWdlciByZWdpc3Rlcgo+PiBj
b250ZXh0IHdoZW4gaGFuZGxpbmcgdHJhcHMgb3IgZG9tYWluIHRyYW5zaXRpb25zLiBUaGUgRlAg
cmVnaXN0ZXJzCj4+IChmMOKAk2YzMSkgYW5kIHZlY3RvciByZWdpc3RlcnMgKHYw4oCTdjMxKSBh
cmUgbm90IGN1cnJlbnRseSBtYW5hZ2VkIGJ5Cj4+IE9wZW5TQkkuCj4+Cj4+IFdpdGggaW5jcmVh
c2luZyBhZG9wdGlvbiBvZiB0aGUgUklTQy1WIHZlY3RvciBleHRlbnNpb24gYW5kCj4+IGZsb2F0
aW5nLXBvaW50IHdvcmtsb2FkcywgaXQgYmVjb21lcyBpbXBvcnRhbnQgdG8gZW5zdXJlIGNvcnJl
Y3QKPj4gYmVoYXZpb3Igd2hlbiBTLW1vZGUgc29mdHdhcmUgb3IgdHJ1c3RlZCBhcHBsaWNhdGlv
bnMgdXNlIHRoZXNlCj4+IGV4ZWN1dGlvbiB1bml0cy4KPj4KPj4gVGhpcyBlbWFpbCBwcm9wb3Nl
cyBhbiBhcHByb2FjaCB0byBzdXBwb3J0IGxhenkgRlAgYW5kIHZlY3Rvcgo+PiBjb250ZXh0IHN3
aXRjaGluZywgYWxpZ25lZCB3aXRoIHRoZSBtZWNoYW5pc20gZGVzY3JpYmVkIGluIHRoZQo+PiBS
SVNDLVYgcHJpdmlsZWdlZCBzcGVjaWZpY2F0aW9uLgo+Pgo+PiAtLS0KPj4KPj4gIyMgQmFja2dy
b3VuZAo+Pgo+PiBJbiBSSVNDLVYsIHRoZSBgRlNgIChGbG9hdGluZy1wb2ludCBTdGF0ZSkgYW5k
IGBWU2AgKFZlY3RvciBTdGF0ZSkKPj4gZmllbGRzIGluIGBtc3RhdHVzYCAvIGBzc3RhdHVzYCBj
b250cm9sIGFjY2VzcyB0byB0aGUgZmxvYXRpbmctcG9pbnQKPj4gYW5kIHZlY3RvciB1bml0cy4K
Pj4KPj4gV2hlbiB0aGVzZSBmaWVsZHMgYXJlIHNldCB0byBgT2ZmYCwgYW55IGF0dGVtcHQgdG8g
ZXhlY3V0ZSBGUCBvcgo+PiB2ZWN0b3IgaW5zdHJ1Y3Rpb25zIHJlc3VsdHMgaW4gYW4gaWxsZWdh
bCBpbnN0cnVjdGlvbiB0cmFwLgo+Pgo+PiBUaGlzIG1lY2hhbmlzbSBhbGxvd3Mgb3BlcmF0aW5n
IHN5c3RlbXMgYW5kIGZpcm13YXJlIHRvIGltcGxlbWVudAo+PiBsYXp5IGNvbnRleHQgc3dpdGNo
aW5nIHdoZXJlIEZQL3ZlY3RvciByZWdpc3RlcnMgYXJlIHNhdmVkIG9yCj4+IHJlc3RvcmVkIG9u
bHkgd2hlbiB0aGV5IGFyZSBhY3R1YWxseSB1c2VkLgo+IAo+IFRoaXMgZG9lcyBub3Qgd29yayBp
biBNYWNoaW5lIG1vZGUsIHdoZXJlIE9wZW5TQkkgcmVzaWRlcy4KPiAKPiBTZWUgcHJpdmlsZWdl
ZCBzcGVjLCBzZWN0aW9uICJFeHRlbnNpb24gQ29udGV4dCBTdGF0dXMgaW4gbXN0YXR1cwo+IFJl
Z2lzdGVyIjogIk1hY2hpbmUgYW5kIFN1cGVydmlzb3IgbW9kZXMgc2hhcmUgYSBzaW5nbGUgY29w
eSBvZiB0aGUgRlMsCj4gVlMsIGFuZCBYUyBiaXRzLiIKPiAKPiBUaGlzIG1lYW5zIHRoYXQgYSBT
dXBlcnZpc29yIG1vZGUgcHJvZ3JhbSBjYW4gc2V0IHNzdGF0dXMuRlMgdG8gRGlydHksCj4gYWNj
ZXNzIGZsb2F0aW5nIHBvaW50IHN0YXRlLCBhbmQgc2V0IHNzdGF0dXMuRlMgYmFjayB0byBPZmYg
d2l0aG91dAo+IE1hY2hpbmUgbW9kZSBzb2Z0d2FyZSBub3RpY2luZyBldmVyLgo+IAo+IFNlZSBh
bHNvIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL2lzc3Vlcy84MzIK
PiAiSW1wb3NzaWJsZSB0byBpbXBsZW1lbnQgSFMtbGV2ZWwgc3N0YXR1cy57RlMsVlN9ID0gT2Zm
IHdpdGgKPiBzb2Z0d2FyZS1lbXVsYXRlZCBoeXBlcnZpc29yIGV4dGVuc2lvbj8iIHdoZXJlIEkg
cmFuIGludG8gdGhlIHNhbWUKPiBwcm9ibGVtIGluIGEgZGlmZmVyZW50IGNvbnRleHQuCj4gCj4g
U28gYmFzaWNhbGx5LCBsYXp5IHNhdmluZy9yZXN0b3JpbmcgRiBhbmQgViBpbiBNYWNoaW5lIG1v
ZGUgd2l0aAo+IG11bHRpcGxlIFN1cGVydmlzb3IgbW9kZSBwcm9ncmFtcyBpcyBub3QgYSBkZXNp
Z25lZCBmZWF0dXJlLCBhbmQgaXMgbm90Cj4gcG9zc2libGUgYXMgdGhlIHByaXZpbGVnZWQgYXJj
aGl0ZWN0dXJlIGlzIGN1cnJlbnRseSBkZXNpZ25lZC4gRm9yIHRoZXNlCj4gdXNlIGNhc2VzIG5v
bi1sYXp5IHN3aXRjaGluZyBpcyByZXF1aXJlZC4KCkFzIHlvdSBtZW50aW9uZWQgaW4gaW4gdGhh
dCBHaXRodWIgaXNzdWUsIGl0IGlzIGFsc28gcG9zc2libGUgdG8gZm9yY2UKZmxvYXRpbmctcG9p
bnQgaW5zdHJ1Y3Rpb25zIHRvIHRyYXAgYnkgY2xlYXJpbmcgbWlzYS5GLiBIb3dldmVyLCBub3Rl
IHRoaXMKY2xhdXNlIGluIHRoZSBtaXNhIHNwZWNpZmljYXRpb246CgoiV2hlbiBzb2Z0d2FyZSBl
bmFibGVzIGFuIGV4dGVuc2lvbiB0aGF0IHdhcyBwcmV2aW91c2x5IGRpc2FibGVkLCB0aGVuIGFs
bCBzdGF0ZQp1bmlxdWVseSBhc3NvY2lhdGVkIHdpdGggdGhhdCBleHRlbnNpb24gaXMgVU5TUEVD
SUZJRUQsIHVubGVzcyBvdGhlcndpc2UKc3BlY2lmaWVkIGJ5IHRoYXQgZXh0ZW5zaW9uLiIKClNv
IGZsb2F0aW5nLXBvaW50IHN0YXRlIG11c3QgYWx3YXlzIGJlIHNhdmVkIG9uIGEgbWlzYS5GIDEt
PjAgdHJhbnNpdGlvbiBhbmQKcmVzdG9yZWQgb24gYSBtaXNhLkYgMC0+MSB0cmFuc2l0aW9uLiBU
aGlzIGRvZXMgc29tZXdoYXQgcmVkdWNlIHRoZQplZmZlY3RpdmVuZXNzIG9mIHRoZSBsYXp5IGNv
bnRleHQgc2F2aW5nLCBidXQgc3RpbGwgcHJvdmlkZXMgc29tZSBiZW5lZml0LiBBbmQKdGhpcyBz
Y2hlbWUgZ3JhY2VmdWxseSBkZWdyYWRlcyBvbiBzeXN0ZW1zIHdoZXJlIG1pc2EuRiBpcyBub3Qg
d3JpdGFibGUuIFNvCnVubGVzcyBJIGFtIG1pc3Npbmcgc29tZXRoaW5nLCBoaWRpbmcgRlAgc3Rh
dGUgdXNpbmcgbWlzYSBiaXRzIHNob3VsZCB3b3JrIGZvcgp0aGUgY3VycmVudCB1c2UgY2FzZS4K
ClJlZ2FyZHMsClNhbXVlbAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
