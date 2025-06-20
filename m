Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B134FC7115D
	for <opensbi@archiver.kernel.org>; Fri, 20 Jun 2025 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wz/wxnKTkU6Yt6rFFvh6uG/Ak7HQ5clMsCrzrfFCPfo=; b=HyaqSUH8B8WKmF
	Lby5pcbM6cKwlDtpOIB7bF2gYlXDjLHEQObfZWxlZ7wGSk5e2wFj8h1oj1xkqOBDrLtrP4xkpweUJ
	5hT4Ij39YiGJe9oEviWOUf5k/WkJivexrH9eFwtLM8nTwH28jafkVLRajiqPLRidvU6GSKiMLxkun
	6zNK8sGXftBMD2JRXQn1rmXUs7y5pOnhz3vapqHY9UkF1Lp+pE5Zq85N1sMSKbiWCgeHJ5LSYYQLc
	+nqdQ82H0JK09o5IOccA/jAj6Un41pyKFmG+PzWDjJJlzKhl9hQ3BHgbQOBiefif0baoRRzjhy6sl
	J18UYXKyN2dOVM/F1uxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeO3-0000000G6t3-0tI3;
	Fri, 20 Jun 2025 16:14:43 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSe2a-0000000G3WS-1V0E
	for opensbi@lists.infradead.org;
	Fri, 20 Jun 2025 15:52:33 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3de18fdeab0so21999845ab.3
        for <opensbi@lists.infradead.org>; Fri, 20 Jun 2025 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750434751; x=1751039551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77Z2MZZcbb4PVRX+1WZXELgzOAeOA0TXcFqcTy7KqP0=;
        b=CNZcHzUU3zXc/92bVbBNhmelyGnGSy2T5ZzjJWNu6fg53Wn7VNQKRTyXEvIbFrk5vL
         1+Ynn5unwqyEvsjIjHwEmkaxFKiYH0x+28+WJpVaeRapgkEzQ3oKBec6n2pdyMrufa8k
         zF3or2vjbiP35Idqkj9GtNWkglE5RAppnCIHeTRV6nskOZ63CJ0tGxIzG3TQL82hCleK
         oiVvCP/d9xw6iDc5PFky7EbB8yiFSwQr8dVlSyNYrPRGzghWpENuoXQek+5sXRuqPKNh
         xG2zhnnx1hnEHQgVHheFWkWSxgHPH/ylDY/ys8YwAQbYtE6AxLdvnxuXOMOOxbmk6LdH
         CmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750434751; x=1751039551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77Z2MZZcbb4PVRX+1WZXELgzOAeOA0TXcFqcTy7KqP0=;
        b=iZ23oTRa7e4llLWZp1EF1D4m6qWxcInmxbEMEWeWx+JBE5ZC7k4lLbOna9GPdQ0yz9
         6nVMcXYvyXqNbCJVPxeekiQkevxDJYY8tXmW1qsYJx83ppiRK2aFX5Wavgt9hh/FjGKG
         OYI4nf3UFmodDteAFCyy4mpK+cl+0+fKuHVUO2Rf8Bh/y/weexNxtzMMMNG6QG9PjCzA
         rRjQz6IUgMq67jHRPLoZCTBmdIzqeO+rtH8Ot7t6JG/moam2KSJPPSt6TRK6f+X5FKto
         t7RYH6MCxowZp55zwtogffL13b/P3FWxUK8AjR04Y3zX+qVjfDgmkw1ZvRf7VnP1g3zN
         K0Lw==
X-Gm-Message-State: AOJu0YxtuOg4kBzIwDFISu31F4X/hifzQ60T/0b2dytOXmuN4+CNgakM
	h9XmMXVYgRwrCKAQ4x5y4mi78G/Gaxa2pTb2DJ/4ruQIMd0ZE3hy7fxm0DHFKLmcdGkK4ZK4myw
	BS2NXNo82iqW+xYuq6f95L7oOJFVceyoiyEPENmjQ89Qtl6lmLg+8
X-Gm-Gg: ASbGnct86bRZgKzx90btMbKijCVb2g8nViFHpOoTdineMW1lTBAh7HiM8AhAvMzU3QP
	iqn/AmZK8Kr9XC7ENZPLWAvB6ncEkO70DmiqIOtFtSovZ//p/ftiIKrlwzIGjvsNNGuKiaLXmQV
	MNywwuqLYNBb9Loqx8iwBorOQAA17Tz4uiYoj6sIzG5IM=
X-Google-Smtp-Source: AGHT+IE46rKkgv5Ugt9fsOu0e+bfnNkfkpbwrYWUG+C14/sC0L5ZTvETqu4NiL1QsBxt/RXwI7H6fiXILt9+r3GESSE=
X-Received: by 2002:a05:6e02:1fc4:b0:3dd:f743:d182 with SMTP id
 e9e14a558f8ab-3de38c2204emr41071435ab.5.1750434751291; Fri, 20 Jun 2025
 08:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250611121236.937455-1-wxjstz@126.com> <CAAhSdy2woTUMuEQUZ-DDysuZGo5j=iCM29351kiMFmH1ciuBOw@mail.gmail.com>
 <00adadf73aabdd24e055722f184c742936368f4f.camel@126.com> <715482eb273584bb88d7e0c5dc23b72c1dd09201.camel@126.com>
In-Reply-To: <715482eb273584bb88d7e0c5dc23b72c1dd09201.camel@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Jun 2025 21:22:20 +0530
X-Gm-Features: AX0GCFvPD-nveU3or3KCWpBJnP53GGaXzstL49JGpqG4FRFFw1xqVMdIPVXENfI
Message-ID: <CAAhSdy1LToObmd+Oc+8puc86y1yBvgS4Z58du6TktKZWxYE3Uw@mail.gmail.com>
Subject: Re: [PATCH 00/12] Some improvements on boot sequence
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_085232_477349_87F3D725 
X-CRM114-Status: GOOD (  21.49  )
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

T24gRnJpLCBKdW4gMjAsIDIwMjUgYXQgNTo1MuKAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IOWcqCAyMDI1LTA2LTE25LiA55qEIDIwOjIwICswODAw77yMWGlhbmcgV+WG
memBk++8mgo+ID4g5ZyoIDIwMjUtMDYtMTbkuIDnmoQgMTc6MjUgKzA1MzDvvIxBbnVwIFBhdGVs
5YaZ6YGT77yaCj4gPiA+IE9uIFdlZCwgSnVuIDExLCAyMDI1IGF0IDU6NDLigK9QTSBYaWFuZyBX
IDx3eGpzdHpAMTI2LmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIHNlcmllcyBvZiBw
YXRjaGVzIG1haW5seSBtZXJnZXMgaW5pdF9jb2xkYm9vdCBhbmQgaW5pdF93YXJtX3N0YXJ0dXAs
Cj4gPiA+Cj4gPiA+IFRoZSBleGlzdGluZyBjb2RlIG9mIGhhdmluZyBjbGVhcmx5IHNlcGFyYXRl
IGNvbGRib290LCB3YXJtX3N0YXJ0dXAsIGFuZAo+ID4gPiB3YXJtX3Jlc3VtZSBwYXRocyBhcmUg
c3RyYWlnaHRmb3J3YXJkIHRvIHVuZGVyc3RhbmQgYW5kIG1haW50YWluLiBFdmVuLAo+ID4gPiBM
aW51eCBoYXMgc2VwYXJhdGUgc3RhcnRfa2VybmVsKCkgKGZvciBib290L3ByaW1hcnkgSEFSVCks
IHNtcF9jYWxsaW4oKQo+ID4gPiAoZm9yIG5vbi1ib290L3NlY29uZGFyeSBIQVJUcykgYW5kIF9f
Y3B1X3Jlc3VtZV9lbnRlcigpIChmb3IgSEFSVAo+ID4gPiByZXN1bWUpLgo+ID4gPgo+ID4gPiA+
IGFuZCBzZXBhcmF0ZXMgc2JpX2hzbV9oYXJ0X3dhaXQgZnJvbSBzYmlfaHNtX2luaXQsIHNvIHRo
YXQgbm9uLWNvbGRib290Cj4gPiA+ID4gSEFSVCBjYW4gcGVyZm9ybSBtb3JlIGluaXRpYWxpemF0
aW9uIHRhc2tzIGJlZm9yZSBlbnRlcmluZyBIU00gd2FpdC4gSW4KPiA+ID4gPiBvcmRlciB0byBp
bXByb3ZlIHNvbWUgbXVsdGkgSEFSVHMgcmVsYXRlZCBjb2Rlcy4KPiA+ID4KPiA+ID4gUGVyZm9y
bWluZyBtb3JlIGluaXRpYWxpemF0aW9uIG9uIG5vbi1jb2xkYm9vdCBIQVJUIGJlZm9yZQo+ID4g
PiBzYmlfaHNtX2hhcnRfd2FpdCgpIGlzIHJlZHVuZGFudCBiZWNhdXNlIG5vbi1jb2xkYm9vdCBI
QVJUCj4gPiA+IHdpbGwgaGF2ZSB0byBhbnl3YXkgd2FpdCB1bnRpbCBjb2xkYm9vdCBIQVJUIHVz
ZXMgU0JJIEhTTQo+ID4gPiBzdGFydCBjYWxsLgo+ID4gPgo+ID4gPiBPbiB0aGUgY29udHJhcnks
IGRvaW5nIHNiaV9oc21faGFydF93YWl0KCkgYXMgdGhlIGZpcnN0IHRoaW5nIGZvcgo+ID4gPiBu
b24tY29sZGJvb3QgSEFSVCBlbnN1cmVzIHRoYXQgSEFSVCBpcyBmdWxseSBpbml0aWFsaXplZCBv
bmx5Cj4gPiA+IGFmdGVyIGNvbGRib290IEhBUlQgZGVjaWRlcyB0byBicmluZyBpdCB1cCAodmlh
IFNCSSBIU00gc3RhcnQpCj4gPiA+IHdoaWNoIGFsc28gZW5hYmxlcyB1cyB0byBwb3dlcm9mZiBu
b24tY29sZGJvb3QgSEFSVCBvbgo+ID4gPiBwbGF0Zm9ybXMgd2l0aCBmdWxsIGhhcnQtaG90cGx1
Zy4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFhpYW5nIFcgKDEyKToKPiA+ID4gPiAgIGxpYjogc2Jp
OiBBZGQgY29sZGJvb3QgcGFyYW1ldGVycyB0byBzb21lIGluaXRpYWxpemF0aW9uIGZ1bmN0aW9u
cwo+ID4gPiA+ICAgbGliOiBzYmk6IE9wdGltaXNlIHRoZSBib290IHNlcXVlbmNlCj4gPiA+ID4g
ICBsaWI6IHNiaTogSW1wbGVtZW50IHN5bmNocm9uaXNhdGlvbiBhbmQgd2FpdCBiZXR3ZWVuIG11
bHRpcGxlIEhBUlRzCj4gPiA+ID4gICBsaWI6IHNiaTogUmVtb3ZlIHdhaXRfZm9yX2NvbGRib290
IGFuZCB3YWtlX2NvbGRib290X2hhcnRzCj4gPiA+ID4gICBsaWI6IHNiaTogQWRkIHdhaXQgb3Bl
cmF0aW9ucyBpbiBzb21lIGluaXRpYWxpemF0aW9uIGZ1bmN0aW9ucwo+ID4gPiA+ICAgbGliL3V0
aWxzOiBNYWtlIGZkdF9wYXJzZV9pc2FfZXh0ZW5zaW9ucyByZWVudHJhbnQKPiA+ID4gPiAgIGxp
Yjogc2JpOiBJbml0aWFsaXplIGFzIG11Y2ggYXMgcG9zc2libGUgYmVmb3JlIHNiaV9oc21faW5p
dAo+ID4gPiA+ICAgbGliOiBzYmk6IFJlbW92ZSBjb2xkX2Jvb3QgZnJvbSBzYmlfaHNtX2luaXQK
PiA+ID4gPiAgIGxpYjogc2JpOiBFbnN1cmUgdGhhdCBhbGwgSGFydHMgY29tcGxldGUgc2JpX2hh
cnRfaW5pdAo+ID4gPiA+ICAgbGliL3V0aWxzOiBGaXggWmljbnRyIGRldGVjdGlvbiBpbiBmZHRf
Y3B1X2ZpeHVwCj4gPiA+ID4gICBsaWI6IHNiaTogRml4IGR0YnIgaW5pdGlhbGl6YXRpb24KPiA+
ID4gPiAgIGxpYjogc2JpOiBSZW1vdmUgY29sZF9ib290IGZyb20gc2JpX2RvdWJsZV90cmFwX2lu
aXQKPiA+ID4KPiA+ID4gVGhpcyBhbGwgc2VlbXMgdW5uZWNlc3NhcnkgY2h1cm4gYW5kIEkgc3Rp
bGwgZmluZCBpdCBoYXJkCj4gPiA+IHRvIHVuZGVyc3RhbmQgdGhlIHVuZGVybHlpbmcgcHJvYmxl
bS4KPiA+Cj4gPiBXaGVuIGluaXRpYWxpemF0aW9uIGRlcGVuZHMgb24gb3RoZXIgSEFSVCBleHRl
bnNpb25zLCB0aGUKPiA+IG9sZCBzdGFydHVwIHByb2Nlc3MgaXMgY29tcGxldGVseSB1bmF3YXJl
IG9mIG90aGVyIEhBUlQKPiA+IGV4dGVuc2lvbnMuRm9yIGV4YW1wbGUsIHRoZSBpc3N1ZXMgZml4
ZWQgYnkgUEFUQ0gxMC9QQVRDSDExCj4gPiAvUEFUQ0gxMiBhbGwgYXNzdW1lIHRoYXQgdGhlIGV4
dGVuc2lvbnMgc3VwcG9ydGVkIGJ5IEhBUlQKPiA+IGFyZSB0aGUgc2FtZS4KPgo+IFdlIHNob3Vs
ZCBhc3N1bWUgdGhhdCBhc3ltbWV0cmljIHByb2Nlc3NvcnMgbWF5IGFwcGVhci4KPgo+IGFzeW1t
ZXRyaWMgQ1BVIGV4YW1wbGU6IFNwYWNlbWlUIEsxCj4KPiA+IFR3byBhc3ltbWV0cmljIENQVSBD
bHVzdGVycyBpbmNsdWRlZDogQ2x1c3RlcjAgaW50ZWdyYXRlcyBRdWFkCj4gPiBSSVNDLVYgU3Bh
Y2VtaVTCriBYNjDihKJDb3JlcyB3aXRoIDIuMFRPUFMgQUktUG93ZXIgZXh0ZW5zaW9uCj4gPiB3
aGlsZSBDbHVzdGVyMSBpbmNsdWRlcyBRdWFkIFJJU0MtViBTcGFjZW1pVMKuIFg2MOKEoiBDb3Jl
cyB3aXRob3V0Cj4gPiBBSSBDYXBhYmlsaXR5Cj4gaHR0cHM6Ly9kb2NzLmJhbmFuYS1waS5vcmcv
ZW4vQlBJLUYzL1NwYWNlbWlUX0sxX2RhdGFzaGVldAo+Cj4gQUkgQ2FwYWJpbGl0eSBpcyBhY2hp
ZXZlZCB0aHJvdWdoIGN1c3RvbSBleHRlbmRlZCBJTUUKPiBodHRwczovL2dpdGh1Yi5jb20vc3Bh
Y2UtbWl0L3Jpc2N2LWltZS1leHRlbnNpb24tc3BlYwoKVG8gc29tZSBleHRlbnQgd2UgYWxyZWFk
eSBzdXBwb3J0IGFzeW1tZXRyaWMgaGFydHMgYmVjYXVzZSB3ZQpoYXZlIHBlci1oYXJ0IGZlYXR1
cmVzIGFuZCBjYXBhYmlsaXRpZXMgZGV0ZWN0ZWQgYXQgYm9vdC10aW1lLiBUaGVyZQptaWdodCBi
ZSBzb21lIG1pbm9yIGltcHJvdmVtZW50cyBwb3NzaWJsZSBidXQgYm9vdC1mbG93IGNoYW5nZXMK
KGFsbW9zdCBhbGwgY2hhbmdlcykgaW4gdGhpcyBzZXJpZXMgYXJlIG5vdCBuZWVkZWQuCgpSZWdh
cmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
