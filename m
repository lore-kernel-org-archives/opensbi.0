Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160DAE9DE60
	for <opensbi@archiver.kernel.org>; Thu,  9 Apr 2026 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIPYxeAypAg1LWsa9ksS+cTVBYjBAeIjOSEGuAP1Dmg=; b=Ge4SVsZZwuWX4X
	iWJdTLZLsEVV8+zDZZgEVTRd5wQFZ2VNcakbpzFcEXiVbvkj28kJUf6VsvQ8UVbwA0GKLMO++YQWx
	Rs2VjVZzVyGcc/Zl1TK8Uz2oqOChrOZl1bem1SQ5iYH34aLhNjvHAWkPuk/I9W7RFNLNXmhN4aUy2
	fDiLlcCU4RRh9KcKGkVAV/sx81TFTRbkGZ6Q2QL7YTtPGSLEHA8J7vmsq8brSZDRtPNIC7KDheB6i
	kZhN8kB0IjhMg4i+lKUGAi4t0a7TUp+8mJzLINE65dqIpHfRpkL+GoDp7O+35lbD5KmN7AjmqdWyI
	p6ij3ZjJFWBT4j4VCcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkjF-00000009wRY-3YE4;
	Thu, 09 Apr 2026 08:27:09 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkjB-00000009wQa-3Kck
	for opensbi@lists.infradead.org;
	Thu, 09 Apr 2026 08:27:08 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7d9bba96f7dso334256a34.1
        for <opensbi@lists.infradead.org>; Thu, 09 Apr 2026 01:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775723223; cv=none;
        d=google.com; s=arc-20240605;
        b=PMmCpG/SLJk89PlwX619hG7JS/Msg6N1w+uiV8DkaKLel+mIbOka3fYAM1yp2b+XO1
         AlhgLvKLuflyOjAbVWiywAdWsl2FDBwnFQjFxIJ+9Gouz2KkLOIn9mNuSGn3gakS5WQA
         UGxGsjQ5Tqb7iU2PkI8sHon1ZLeK3JJQuIhF1EQ6ng0ZPnOXZSGI6ACEft003xCh7uJX
         HVpGxI2vroj2xnGZoV/3OlCYFM8v3hupI6im/yWO6d2MmmQ14Rz3UIPOQ8fv70PgiB93
         E9pdNI3ivnwQO1mP5ANaHYRVeGKg6+LRjslLt08toVt2rZZxlrYp8JYR7hTKJVOpjNL1
         lf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0+89fkudkKPZ7Oy/M0WNO2Iz2gfbfInyAgDh9gb0jxY=;
        fh=Cs4vGfMqZvBABtrH+TqblzT00xGmXKoiYxdySyZx2HQ=;
        b=GnF5X6f3vjLORSEVW2yKq++orZv7ZLUUAuizD3EpdWdLXf+Q0AYt5URZv0hesf0O44
         jZUURPjNYTrp92A0O9O6SI2ttGe+DL99oG88zMhaMKVn8FxO2ugpDnLU5g3uWtyTmjvV
         L6bZI/hzUhXNY8RFr6wlGClSxia7xrSWmcuXz6hTakz1QBTUQy5LKXAm1nlsZOMSMgVa
         OWZ9huI2El2XyFhg946sX4zwubryOfN+DG2bSFTDItZsUYxCumI2Y2VYpEUamh9VzbQe
         CGTaHz9qyNwVjuaY3zUTlOpTnUCrW7+jOaGtbr1XTPfxLtLB7OW7hZpDQ8wL9HJFTJbQ
         /xOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775723223; x=1776328023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+89fkudkKPZ7Oy/M0WNO2Iz2gfbfInyAgDh9gb0jxY=;
        b=HCkwBtFxFzhr89EXLWPHc5UGayBxgVxdJ4uLB28yuXL5Fz4q/wuY2Lz5J9Rhwv3LOG
         4xmbox/xzM6d8m2rlkO0OhZbt3AxKvC+KWOOGtdpO5NbVO8Y8vyfAvkTYBtcmwH0+58k
         XvVkAqkKkI02psfws2vj1B5qTbLTCmE1GicpGhDgw5CSqocPoUhaFwBp1ZwjkhEXk5T1
         vjUIOwPRHBoYmcrBT0/1SXT7B+MtFl1s8JECTAS5qm4XKcMwuzeUuxwLgWYLuVkuwQet
         myhBrOGnKutDJ0W/okpPkuyr0FUiPZOKBZCSOiMiQC1CznLXhwNIrzXZTFyq1yDG0I3M
         GL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723223; x=1776328023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+89fkudkKPZ7Oy/M0WNO2Iz2gfbfInyAgDh9gb0jxY=;
        b=gvmjxLO3zr8c/lXuK9nwwX79d0ZulhdH04VjrWbCsiw59pVJvMtsRFCra1XJCI73kb
         cinEAoIxd7fMKS0t1ziPmS1L1FzD2gT5G9YfzECyIcGOCuJrCUxc5f0OPTL09WaIqHt7
         Erjhg+bi7jeTC7mJ2iuaPfWMkn1xQZpcvuvEmVcJMXxa6J0vH6fbtS2RO83XHaAA/JK1
         Q+3vVDWDVNBLbKlJlFRdwIBD80aYVD93ER/QLipqkk4IqFyIk3oFQXQmeaaHkYWvVXSW
         6/9dSHHqEmNa+IYOoWVdgpGFlItWX3hmiI880wFY+p8ZHegIa7yinCv/SXq/llqzpMHc
         7T7g==
X-Gm-Message-State: AOJu0YyXPRS934xHRlPde6qVeJs8ZUHQjGHRhfpdIRmNv690TOLJvb+K
	b/G7VPaqaBp6Rz/bj/ij72aQF7Pm+wAvb9it+GgA4GJoa37y0pCDaYPgmClKXFzQt1zrsr/DMRQ
	caxl3r/U3zYed7vJSmwDXxdwSh5ppKb36hUvdrZrWLg==
X-Gm-Gg: AeBDiesMiO0wTYakkSrpXvsvcRcedOxxlv2OvIMqHWX5Aqk4775vpqUDgXTE9d5wpQd
	a4tYB+Ha3qw8NfCCqnQkZvjHE/cndOLZJWpsdh83QWxR1BJwBCNnZ1aEK4n9nFII+ep8+ffyPjm
	lpWsH2SuPxMpbjgViNpDftWpKB5QLJJ7MrNHb7GOTrloUhXE3xnYX/Ea/HZfy0AvkePpFtPzuKn
	hgOr9M8IMr+4v9/zouelKPkNencp2JBsnpZb151xJTe1tz9kmFcsAuLE/esH6gIVbXK3ptZ/mqo
	UZJGjPOYd/0ypNSD3pRYIKKWPh+PgMfKRfgLQay4j6n6oqPo8x69YDVwn29WxTZ8DhkKGC6gJM2
	Ia+uRzsECIuyAtYgRN5dsJe1urQ==
X-Received: by 2002:a05:6820:610:b0:67e:cc7:ccf5 with SMTP id
 006d021491bc7-68a605eb734mr1160656eaf.9.1775723223611; Thu, 09 Apr 2026
 01:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com> <CAB_kZitjXe8fqRgM0HvO7eeVRp_JmOM4qMR2GciSiVvbVXuNmA@mail.gmail.com>
In-Reply-To: <CAB_kZitjXe8fqRgM0HvO7eeVRp_JmOM4qMR2GciSiVvbVXuNmA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Apr 2026 13:56:49 +0530
X-Gm-Features: AQROBzBcddFKvXiE0iIcobvlbzea1MQyicIgaibomAkZTkdDOUvXNui2fTrax9w
Message-ID: <CAAhSdy3Srr+FHh0KkLm8V-V2ce2PWV3sF+iUo765KSP3LYOyOQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add RISC-V Smrnmi extension support
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, evvoevod@oss.tenstorrent.com, 
	zong.li@sifive.com, nick.hu@sifive.com, samuel.holland@sifive.com, 
	yongxuan.wang@sifive.com, rkrcmar@qti.qualcomm.com, atishp@rivosinc.com, 
	npiggin@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_012705_844758_F199DC51 
X-CRM114-Status: GOOD (  14.96  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCA5OjUz4oCvUE0gRXZnZW55IFZvZXZvZGluIDxldnZvZXZv
ZEB0ZW5zdG9ycmVudC5jb20+IHdyb3RlOgo+Cj4gSW4gb3JkZXIgdG8gbWFrZSBpdCBtb3ZlIGZh
c3Rlciwgd291bGQgaXQgYmUgbW9yZSBjb252ZW5pZW50IGlmIEkgc2VuZCBhIHBhdGNoIHNldCB3
aGljaCBkb2Vzbid0IGRlcGVuZCBvbiBUZW5zdG9ycmVudCBwbGF0Zm9ybSBhbmQgb25seSBoYXMg
Z2VuZXJpYyBwYXJ0IG9mIHRoZSBTbXJubWkgc3VwcG9ydD8gVGVuc3RvcnJlbnQgcGxhdGZvcm0g
cGFydCBjYW4gYmUgc3VibWl0dGVkIGxhdGVyIGFzIGEgc2VwYXJhdGUgcGF0Y2ggc2V0LgoKWWVz
LCBsZXRzIGhhdmUgZ2VuZXJpYyBTbXJubWkgc3VwcG9ydCBwYXRjaGVzIG9ubHkgaW4KdGhpcyBz
ZXJpZXMuIFRoZSB0ZW5zdG9ycmVudCBwbGF0Zm9ybSBwYXRjaGVzIGNhbiBiZSBwYXJ0CnRoZSBz
ZXJpZXMgd2hpY2ggYWRkcyB0ZW5zdG9ycmVudCBwbGF0Zm9ybSBzdXBwb3J0LgoKUmVnYXJkcywK
QW51cAoKPgo+Cj4gT24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgMTE6MzPigK9BTSBFdmdlbnkgVm9l
dm9kaW4gPGV2dm9ldm9kQHRlbnN0b3JyZW50LmNvbT4gd3JvdGU6Cj4+Cj4+IEZyb206IEV2Z2Vu
eSBWb2V2b2RpbiA8ZXZ2b2V2b2RAdGVuc3RvcnJlbnQuY29tPgo+Pgo+PiBUaGlzIHBhdGNoIHNl
cmllcyBpbXBsZW1lbnRzIHN1cHBvcnQgZm9yIHRoZSBSSVNDLVYgU21ybm1pIChSZXN1bWFibGUK
Pj4gTm9uLU1hc2thYmxlIEludGVycnVwdHMpIGV4dGVuc2lvbiBpbiBPcGVuU0JJLgo+Pgo+PiBU
aGlzIHNlcmllcyBpcyBiYXNlZCBvbiB0b3Agb2YgdGhlIFRlbnN0b3JyZW50IEF0bGFudGlzIHBs
YXRmb3JtIHBhdGNoIHNlcmllczoKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS8y
MDI2MDMxMDAwNTAwMC4zODM3NTEyLTEtbnBpZ2dpbkBnbWFpbC5jb20vVC8jdAo+Pgo+PiBUaGUg
U21ybm1pIGV4dGVuc2lvbiBwcm92aWRlczoKPj4gLSBSZXN1bWFibGUgTk1JIChSTk1JKSBzdXBw
b3J0IHdpdGggZGVkaWNhdGVkIE1ORVBDL01OU1RBVFVTL01OQ0FVU0UgQ1NScwo+PiAtIFJlc3Vt
YWJsZSBOTUkgRXhjZXB0aW9uIChSTk1FKSBoYW5kbGluZyBmb3IgdHJhcHMgb2NjdXJyaW5nIHdp
dGggTk1JRT0wCj4+IC0gSW1wbGVtZW50YXRpb24tZGVmaW5lZCBOTUkgdmVjdG9yIGxvY2F0aW9u
cyB2aWEgTk1JVkVDL05NRVZFQwo+Pgo+PiBLZXkgaW1wbGVtZW50YXRpb24gZGV0YWlsczoKPj4g
LSBBZGRzIGluZnJhc3RydWN0dXJlIGZvciBSTk1JL1JOTUUgaGFuZGxlcnMgaW4gZmlybXdhcmUg
YXNzZW1ibHkgKGZ3X2Jhc2UuUykKPj4gLSBQcm92aWRlcyBwbGF0Zm9ybSBjYWxsYmFjayBpbnRl
cmZhY2UgZm9yIGN1c3RvbSBOTUkgaGFuZGxlciBpbnN0YWxsYXRpb24KPj4gLSBEZXRlY3RzIGFu
ZCBlbmFibGVzIFNtcm5taSBlYXJseSwgYmVmb3JlIHRyYXAtYmFzZWQgZmVhdHVyZSBkZXRlY3Rp
b24KPj4gLSBFbnN1cmVzIHRyYXAtYmFzZWQgQ1NSIHByb2Jpbmcgd29ya3MgY29ycmVjdGx5IHdp
dGggTk1JcyBlbmFibGVkCj4+IC0gQWRkcyBzdHViIGhhbmRsZXIgZm9yIFRlbnN0b3JyZW50IEF0
bGFudGlzIHBsYXRmb3JtCj4+Cj4+IFRlc3Rpbmc6IFZlcmlmaWVkIG9uIHZpcnR1YWwgV2hpc3Bl
ciBwbGF0Zm9ybS4KPj4KPj4gRXZnZW55IFZvZXZvZGluICg3KToKPj4gICBpbmNsdWRlOiBzYmlf
c2NyYXRjaDogQWRkIHRtcDEgc2NyYXRjaCBzcGFjZSBmb3IgUk5NSSBjb250ZXh0IHNhdmluZwo+
PiAgIGxpYjogc2JpOiBBZGQgU21ybm1pIGV4dGVuc2lvbiBtYWNyb3MgZm9yIHJlZ2lzdGVycyBh
bmQgYml0cwo+PiAgIGZpcm13YXJlOiBBZGQgUk5NSS9STk1FIGhhbmRsZXIgaW5mcmFzdHJ1Y3R1
cmUKPj4gICBsaWI6IHNiaTogSW50cm9kdWNlIHNtcm5taV9oYW5kbGVyc19pbml0KCkgY2FsbGJh
Y2sgZm9yIHBsYXRmb3JtIGNvZGUKPj4gICBsaWI6IHNiaTogaGFydDogRGV0ZWN0IGFuZCBlbmFi
bGUgU21ybm1pIGJlZm9yZSB0cmFwLWJhc2VkIGZlYXR1cmUKPj4gICAgIGRldGVjdGlvbgo+PiAg
IHBsYXRmb3JtOiB0ZW5zdG9ycmVudDogYXNjYWxvbjogSW50cm9kdWNlIFNtcm5taSBoYW5kbGVy
cyBpbml0Cj4+ICAgICBjYWxsYmFjawo+PiAgIHBsYXRmb3JtOiB0ZW5zdG9ycmVudDogQWRkIFNt
cm5taSBzdXBwb3J0IGZvciBBdGxhbnRpcwo+Pgo+PiAgZmlybXdhcmUvZndfYmFzZS5TICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMTU5ICsrKysrKysrKysrKysrKysrLQo+PiAgaW5jbHVk
ZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCAgICAgICAgICAgICAgICAgIHwgIDEwICsrCj4+ICBpbmNs
dWRlL3NiaS9zYmlfaGFydC5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+PiAgaW5j
bHVkZS9zYmkvc2JpX3BsYXRmb3JtLmggICAgICAgICAgICAgICAgICAgIHwgIDE4ICsrCj4+ICBp
bmNsdWRlL3NiaS9zYmlfc2NyYXRjaC5oICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKy0KPj4g
IGluY2x1ZGUvc2JpL3NiaV90cmFwLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArCj4+
ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzUgKysr
LQo+PiAgbGliL3NiaS9zYmlfdHJhcC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcw
ICsrKysrKysrCj4+ICAuLi4vZ2VuZXJpYy9pbmNsdWRlL3RlbnN0b3JyZW50L2FzY2Fsb24uaCAg
ICAgfCAgMTAgKysKPj4gIHBsYXRmb3JtL2dlbmVyaWMvdGVuc3RvcnJlbnQvYXNjYWxvbi5jICAg
ICAgICB8ICAxMSArKwo+PiAgcGxhdGZvcm0vZ2VuZXJpYy90ZW5zdG9ycmVudC9hdGxhbnRpcy5j
ICAgICAgIHwgIDE2ICsrCj4+ICAxMSBmaWxlcyBjaGFuZ2VkLCAzMzYgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCj4+Cj4+IC0tCj4+IDIuNDMuMAo+PgoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
