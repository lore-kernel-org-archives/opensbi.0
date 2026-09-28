Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB15CA5FA1
	for <opensbi@archiver.kernel.org>; Mon, 28 Sep 2026 08:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVxWRO6ldhYVF9QYCBYhVex5dQTtIf85O85p4aRg578=; b=xIRdD+PWqmqX0U
	nGu5LQm35sMMM7D8hkU2ubdtvOPi0SpvL9NKwxLNDB1nyxxmzoMF8nQWkRnYxfvRNC5iGU3pdEk/W
	NukVIh8iaW/idfRj2//CEc0Nl+wZUmUynJosXVwIkrHWIhqC9e+9YTg4MPRCt2Ncr3qlu4dup89me
	6yVGBiv1RFkgouxWwI6aeLwUO7JePFFXB+yARmmKbCLN7QeR3s+lz4NcFly7Md5Nz3pl+AIfh/TgR
	cerPDhcTdTqWQ89/EnYqEmsi5S0GgcF70S2EfAC9i9vqRKWw2UoYhFtVAL8sFa7NT5pwgD7viSzLV
	23kTckwxu6wzJBwmQ6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6px-000000006Pt-12hw;
	Mon, 28 Sep 2026 08:35:49 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6pu-000000006OO-2jG0
	for opensbi@lists.infradead.org;
	Mon, 28 Sep 2026 08:35:47 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4887f690df6so1888109f8f.1
        for <opensbi@lists.infradead.org>; Mon, 28 Sep 2026 01:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790584545; cv=none;
        d=google.com; s=arc-20260327;
        b=WQ7f0MyR2nB0XNJ4Luqdzhy4Q3Q9EgyrJ6h502geqRcyoLr0ZfnKtxYXLAIz3u1pai
         6SRvWH2iN8thk8Tn/PmonZjaMniu5cV48yNl/GnfgSvmGtH1X5UcCakiGuamyxYXps/y
         578c6omcnzofIHCGVn02ZmTmX6QJs233qwQf6gAz0CKyfNVE10qbo7Jc9KoSa8PQYr/C
         4asSRoIQkcwpIiyzSWFcdRsgAz96TbWZUa4vbjBJSMOURoTjA6JgIoE6qb2M9iz/XulJ
         /C+8KR+KaMNItv6eaBHo2PBxYgyUiY8JhdrFPONJH7B1KM+IfyOqh7ffEAw28KGSq9pP
         0v0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8z784xRYm5Xg4LaOd+5XOaj+OQEwnzxV0aHM3OrovXo=;
        fh=ygJKWDzfYxqOQp8nGh850quZMbK84LLZz8MerwOV26c=;
        b=BYcG+AgFUOo4GleycOht959VDzFRWP4o8GXDfddDa3Mjt+RROx2gzbM0tJtDL4ssHC
         7tw6UopIyeFQRXAIZvJMfFq0m/N8vg2ZfdizTknXjz3pgI1hejYN0zXCpD8Hi6gc5VD6
         EaAa+m/vePHOAvd9xwI5JGEsMI9JDmmFGDAhV/2bFVMGe2miEwWwft/P3VpSD1fuQ3mM
         mEdrkvep8dwQaWGAava9DVPHW+OjowT3x/NclYnnmoma7kiqTjOtlQ8ucL9952zyjHXI
         1TbRVA//+rLh9FZXBmjfa+GU1Sew1TTWCyFw9wNoZvlc1EwDCIxWPV9Hdxz67cYHRZ92
         rkAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790584545; x=1791189345; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8z784xRYm5Xg4LaOd+5XOaj+OQEwnzxV0aHM3OrovXo=;
        b=j83s6qVbqCcOuV0uoAgb8VutuMcLA1Ao7/fXOgCtuHQRS81OrHJ3HDZ7HI54ujlYS8
         Oj2T93LhX4GRtDS3chFPer4ha26NxGCSuxQyyIIILGqw4DU1hs20A23DfdUFsQV+9hiN
         8KR+jlpOl8J8La5YL2MQaWWEMj9CPtPhqKvXjShQfIwqorvOtQBUeklTkLMMjYzyWboS
         Kvs4H3WigOV50MgsfRu9CwWXjJk5tpgmjjUYbcQq+7VirCt58qDR6Gcy+NP8/VUKi+CD
         kH3RiXWc7eXuQTNt9L8cuKnGI7DMntd+m5/8zYcQ99xBRfoAr0SR9NbvUfKKWjJXSqg+
         qsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584545; x=1791189345;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8z784xRYm5Xg4LaOd+5XOaj+OQEwnzxV0aHM3OrovXo=;
        b=LL38FcXKpEnuwfapveZ1bhZKsCz2gtpFTU2a+yyHOmpI9NLRelXf6Bb9BSXv9KarzR
         q3eMhSCFghw2hd/5OiI4E1QljoHqqneRvoSYtfvHBZ7De+E/mGjilRciUDFauULn8d0f
         euTxSihtBSVY+AeNWzgeZrH/Q1jEWvakA7eN4FdF1i8wYpU8JYho7yeZavL4jxb33x4S
         1NBrpLUEQ/EgHzocfBPEk9MZn30mudRpidNZIStFNISgkkjHjogWl9oi418ieLQ+9e5x
         05g6B1LW0lf6RElTwwSU5V0m8LuZ7OW8lNgCVnpTWqQOmZ2yCwvGeMFQvOELwoJV9bhz
         hTzQ==
X-Gm-Message-State: AFq9FYLzBaB2ThpoCHHH0jLRqT/njFTrgbRE/3dd1NbL8cbWi5sV+ep9
	syQaaFxr8vxv1k08yIOY2SgPAlYba58tJiseVrrapjTV0oqXyFc9bsnGkxPTloM55pE49XHk1H2
	B2rQ4v1O6Uz22I8LIkC868zyr69cY0+hJwhMOPK7Kag==
X-Gm-Gg: AYBFou1EZPYzx+zoAAT5i6H8LzsOJeGKbSnF8Nn97C6fZxjnF8fgwEMKlX03n9PR8Rw
	gyqdwgORum5J8QIbaezrH/3PyFfg77T5LIIzUDorO5FKf2PIuk3Lmpu0UDG5jM9DJwajdURfGl4
	fd6kfelSedH0ahPl0q/ED5YuRdw0qDWMNI3Sp/ynaeCoIjp36Qn/0587cfBKT/QliQna/QUEbHE
	HD4RoOhgh9S7LIVBAXxZnkmWw3gcPK/DYRbOBLFEpzHpxCV1+tCvokvKk1ufPDs8WuvV+akHHq+
	fYfnnUjvRdFeLuSN6BODTzSRRqCtCrgElGjriVu67EYpFOSO24+JeQWS9Q2OVBpChy4qtaTwQyt
	gIlAnJy3wPmlzYLRDFAcBpOZKrocvwBVal4ZtG7jvSM8eI6kJQxYM+JBjsHtDsFuhxOcSWnmOVO
	M=
X-Received: by 2002:a05:6000:2910:b0:488:8987:663b with SMTP id
 ffacd0b85a97d-48889876a66mr11422896f8f.23.1790584544979; Mon, 28 Sep 2026
 01:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com> <20260817090503.2104998-10-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-10-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Sep 2026 14:05:32 +0530
X-Gm-Features: AclHuK-_T6dP0IPCe4bJfs8IaxEKJO9b9DdmGkfdqSjx6VtY4h4onYAw9iM-5XA
Message-ID: <CAAhSdy0ZDYTLKPJ3OTMrs=Mpebejn_PxWYGGiphDbStGOgYN=A@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] docs: document WID DT properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	scott@riscstar.com, conor@kernel.org, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, pawandeep.oza@oss.qualcomm.com, krzk@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_013546_722000_33CFD16E 
X-CRM114-Status: GOOD (  21.95  )
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMjozNeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkICJ3aWQiIGFuZCAid2lkZGVsZWciIHBy
b3BlcnRpZXMgdG8gZG9tYWluIGluc3RhbmNlIG5vZGUKPiBkb2N1bWVudGF0aW9uIGFuZCBleGFt
cGxlIERULiBBZGQgYSAiUm9vdCBEb21haW4gTm9kZSIgc2VjdGlvbgo+IGRlc2NyaWJpbmcgdGhl
ICJyb290IiBzdWJub2RlIHVuZGVyIHRoZSBkb21haW4gY29uZmlndXJhdGlvbgo+IG5vZGUgZm9y
IHJvb3QgZG9tYWluIFdJRCBjb25maWd1cmF0aW9uCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGll
biBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+ICBkb2NzL2RvbWFpbl9z
dXBwb3J0Lm1kIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZG9jcy9kb21h
aW5fc3VwcG9ydC5tZCBiL2RvY3MvZG9tYWluX3N1cHBvcnQubWQKPiBpbmRleCBlMjY3YTlmNy4u
YzM1YTFkOWEgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9kb21haW5fc3VwcG9ydC5tZAo+ICsrKyBiL2Rv
Y3MvZG9tYWluX3N1cHBvcnQubWQKPiBAQCAtOTMsNiArOTMsOCBAQCBmb2xsb3dpbmcgbWFubmVy
Ogo+ICAgIGlzIHRoZSBuZXh0IG1vZGUgZm9yIHRoZSBST09UIGRvbWFpbgo+ICAqICoqc3lzdGVt
X3Jlc2V0X2FsbG93ZWQqKiAtIFRoZSBST09UIGRvbWFpbiBpcyBhbGxvd2VkIHRvIHJlc2V0IHRo
ZSBzeXN0ZW0KPiAgKiAqKnN5c3RlbV9zdXNwZW5kX2FsbG93ZWQqKiAtIFRoZSBST09UIGRvbWFp
biBpcyBhbGxvd2VkIHRvIHN1c3BlbmQgdGhlIHN5c3RlbQo+ICsqICoqd2lkKiogLSBDb25maWd1
cmFibGUgV29ybGQgSUQgZm9yIHRoZSBST09UIGRvbWFpbgo+ICsqICoqd2lkZGVsZWcqKiAtIENv
bmZpZ3VyYWJsZSBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgZm9yIHRoZSBST09UIGRvbWFp
bgoKQmFzZWQgb24gdGhlIGJlbG93IGV4YW1wbGVzLCB0aGUgIndpZCIgYW5kICJ3aWRkZWxlZyIg
aXMgYWxzbyBhdmFpbGFibGUgZm9yCm5vbi1ST09UIGRvbWFpbnMgc28gc2hvdWxkIG5vdCBoYXZl
IHRoZXNlIGxpc3RlZCB1bmRlciAiRG9tYWluIEluc3RhbmNlIgpzZWN0aW9uIGFzIHdlbGwgPz8K
Cj4KPiAgRG9tYWluIEVmZmVjdHMKPiAgLS0tLS0tLS0tLS0tLS0KPiBAQCAtMTI2LDYgKzEyOCwy
MyBAQCBUaGUgRFQgcHJvcGVydGllcyBvZiBhIGRvbWFpbiBjb25maWd1cmF0aW9uIERUIG5vZGUg
YXJlIGFzIGZvbGxvd3M6Cj4gICogKipjb21wYXRpYmxlKiogKE1hbmRhdG9yeSkgLSBUaGUgY29t
cGF0aWJsZSBzdHJpbmcgb2YgdGhlIGRvbWFpbgo+ICAgIGNvbmZpZ3VyYXRpb24uIFRoaXMgRFQg
cHJvcGVydHkgc2hvdWxkIGhhdmUgdmFsdWUgKiJvcGVuc2JpLGRvbWFpbixjb25maWciKgo+Cj4g
KyMjIyBSb290IERvbWFpbiBOb2RlCj4gKwo+ICtUaGUgcm9vdCBkb21haW4gV0lEIGNvbmZpZ3Vy
YXRpb24gaXMgZGVzY3JpYmVkIGluIGEgKipyb290Kiogc3Vibm9kZSB1bmRlcgo+ICt0aGUgZG9t
YWluIGNvbmZpZ3VyYXRpb24gRFQgbm9kZS4gVGhpcyBzdWJub2RlIGRvZXMgbm90IGhhdmUgYSBj
b21wYXRpYmxlCj4gK3N0cmluZy4KPiArCj4gK1RoZSBEVCBwcm9wZXJ0aWVzIG9mIHRoZSByb290
IGRvbWFpbiBub2RlIGFyZSBhcyBmb2xsb3dzOgo+ICsKPiArKiAqKndpZCoqIChPcHRpb25hbCkg
LSBUaGUgMzIgYml0IFdvcmxkIElEIGZvciBsb3dlci1wcml2aWxlZ2UgbW9kZXMKPiArICAoUy9V
LW1vZGUpIGZvciB0aGUgUk9PVCBkb21haW4uIElmIHByZXNlbnQsIE9wZW5TQkkgd3JpdGVzIHRo
aXMgdmFsdWUKPiArICB0byAqKm1sd2lkKiogd2hlbiBlbnRlcmluZyB0aGUgUk9PVCBkb21haW4g
KHJlcXVpcmVzIFNtbHdpZCBleHRlbnNpb24pLgo+ICsgIElmIGFic2VudCwgT3BlblNCSSB1c2Vz
IHRoZSBNLW1vZGUgV0lEIGFzIGZhbGxiYWNrLgo+ICsqICoqd2lkZGVsZWcqKiAoT3B0aW9uYWwp
IC0gVGhlIDY0IGJpdCBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgZm9yCj4gKyAgdGhlIFJP
T1QgZG9tYWluLiBJZiBwcmVzZW50LCBPcGVuU0JJIHdyaXRlcyB0aGlzIHZhbHVlIHRvICoqbXdp
ZGRlbGVnKioKPiArICB3aGVuIGVudGVyaW5nIHRoZSBST09UIGRvbWFpbiAocmVxdWlyZXMgU213
aWRkZWxlZyBleHRlbnNpb24pLiBJZiBhYnNlbnQsCj4gKyAgY2xlYXJzICoqbXdpZGRlbGVnKiog
dG8gZGlzYWJsZSBTLW1vZGUgV0lEIGRlbGVnYXRpb24uCj4gKwo+ICAjIyMgRG9tYWluIE1lbW9y
eSBSZWdpb24gTm9kZQo+Cj4gIFRoZSBkb21haW4gbWVtb3J5IHJlZ2lvbiBEVCBub2RlIGRlc2Ny
aWJlcyBkZXRhaWxzIG9mIGEgbWVtb3J5IHJlZ2lvbiBhbmQKPiBAQCAtMjA0LDYgKzIyMywxNCBA
QCBUaGUgRFQgcHJvcGVydGllcyBvZiBhIGRvbWFpbiBpbnN0YW5jZSBEVCBub2RlIGFyZSBhcyBm
b2xsb3dzOgo+ICAgIHdoZXRoZXIgdGhlIGRvbWFpbiBpbnN0YW5jZSBpcyBhbGxvd2VkIHRvIGRv
IHN5c3RlbSByZXNldC4KPiAgKiAqKnN5c3RlbS1zdXNwZW5kLWFsbG93ZWQqKiAoT3B0aW9uYWwp
IC0gQSBib29sZWFuIGZsYWcgcmVwcmVzZW50aW5nCj4gICAgd2hldGhlciB0aGUgZG9tYWluIGlu
c3RhbmNlIGlzIGFsbG93ZWQgdG8gZG8gc3lzdGVtIHN1c3BlbmQuCj4gKyogKip3aWQqKiAoT3B0
aW9uYWwpIC0gVGhlIDMyIGJpdCBXb3JsZCBJRCBmb3IgbG93ZXItcHJpdmlsZWdlIG1vZGVzCj4g
KyAgKFMvVS1tb2RlKSBmb3IgdGhlIGRvbWFpbiBpbnN0YW5jZS4gSWYgcHJlc2VudCwgT3BlblNC
SSB3cml0ZXMgdGhpcyB2YWx1ZQo+ICsgIHRvICoqbWx3aWQqKiBvbiBjb250ZXh0IHN3aXRjaCBp
bnRvIHRoaXMgZG9tYWluIChyZXF1aXJlcyBTbWx3aWQgZXh0ZW5zaW9uKS4KPiArICBJZiBhYnNl
bnQsIE9wZW5TQkkgdXNlcyB0aGUgTS1tb2RlIFdJRCBhcyBmYWxsYmFjay4KPiArKiAqKndpZGRl
bGVnKiogKE9wdGlvbmFsKSAtIFRoZSA2NCBiaXQgV29ybGQgSUQgZGVsZWdhdGlvbiBiaXRtYXNr
IGZvcgo+ICsgIHRoZSBkb21haW4gaW5zdGFuY2UuIElmIHByZXNlbnQsIE9wZW5TQkkgd3JpdGVz
IHRoaXMgdmFsdWUgdG8gKiptd2lkZGVsZWcqKgo+ICsgIG9uIGNvbnRleHQgc3dpdGNoIGludG8g
dGhpcyBkb21haW4gKHJlcXVpcmVzIFNtd2lkZGVsZWcgZXh0ZW5zaW9uKS4gSWYgYWJzZW50LAo+
ICsgIGNsZWFycyAqKm13aWRkZWxlZyoqIHRvIGRpc2FibGUgUy1tb2RlIFdJRCBkZWxlZ2F0aW9u
Lgo+Cj4gICMjIyBBc3NpZ25pbmcgSEFSVCBUbyBEb21haW4gSW5zdGFuY2UKPgo+IEBAIC0yNjAs
NiArMjg3LDExIEBAIGJlIGRvbmU6Cj4gICAgICAgICAgICAgICAgICBvcmRlciA9IDw2ND47Cj4g
ICAgICAgICAgICAgIH07Cj4KPiArICAgICAgICAgICAgcm9vdCB7Cj4gKyAgICAgICAgICAgICAg
ICB3aWQgPSA8Mz47Cj4gKyAgICAgICAgICAgICAgICB3aWRkZWxlZyA9IDwweDAgMHgwPjsKPiAr
ICAgICAgICAgICAgfTsKPiArCj4gICAgICAgICAgICAgIHRkb21haW46IHRydXN0ZWQtZG9tYWlu
IHsKPiAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAib3BlbnNiaSxkb21haW4saW5zdGFu
Y2UiOwo+ICAgICAgICAgICAgICAgICAgcG9zc2libGUtaGFydHMgPSA8JmNwdTA+Owo+IEBAIC0y
NjgsNiArMzAwLDggQEAgYmUgZG9uZToKPiAgICAgICAgICAgICAgICAgIG5leHQtYXJnMSA9IDww
eDAgMHgwPjsKPiAgICAgICAgICAgICAgICAgIG5leHQtYWRkciA9IDwweDAgMHg4MDEwMDAwMD47
Cj4gICAgICAgICAgICAgICAgICBuZXh0LW1vZGUgPSA8MHgwPjsKPiArICAgICAgICAgICAgICAg
IHdpZCA9IDwxPjsKPiArICAgICAgICAgICAgICAgIHdpZGRlbGVnID0gPDB4MCAweDY+Owo+ICAg
ICAgICAgICAgICAgICAgc3lzdGVtLXJlc2V0LWFsbG93ZWQ7Cj4gICAgICAgICAgICAgICAgICBz
eXN0ZW0tc3VzcGVuZC1hbGxvd2VkOwo+ICAgICAgICAgICAgICB9Owo+IEBAIC0yNzYsNiArMzEw
LDggQEAgYmUgZG9uZToKPiAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAib3BlbnNiaSxk
b21haW4saW5zdGFuY2UiOwo+ICAgICAgICAgICAgICAgICAgcG9zc2libGUtaGFydHMgPSA8JmNw
dTEgJmNwdTIgJmNwdTMgJmNwdTQ+Owo+ICAgICAgICAgICAgICAgICAgcmVnaW9ucyA9IDwmdG1l
bSAweDA+LCA8JnR1YXJ0IDB4MD4sIDwmYWxsbWVtIDB4M2Y+Owo+ICsgICAgICAgICAgICAgICAg
d2lkID0gPDA+Owo+ICsgICAgICAgICAgICAgICAgd2lkZGVsZWcgPSA8MHgwIDB4MT47Cj4gICAg
ICAgICAgICAgIH07Cj4gICAgICAgICAgfTsKPiAgICAgIH07Cj4gLS0KPiAyLjQzLjcKPgoKUmVn
YXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
