Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ED9C61DE4
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 05:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSGy+q3zFkb8B2Q1B5rVNxVTM+eAvOLK9pHTqpjQ8BY=; b=I5A7oRKYQ87ano
	TjVLc4+4Fq5Hj9+JHgCHwbeGMgXx3CTwdJr/62dXh7To97vCuiLHt6Lef9nt/2JJHPx3rg31mff5o
	vMSRyiMxHEkX7vya1Td0R6bgC59HV2f+vWwZFa6n9ARPMDY3bS+XbLzOJ45cyJ4vGx7yHiReAgtjU
	dHeRP+HGdcSXL8BmFesrWtxQp6w0EXiRAd4MOTT5xZ/rt6KcFuGwyAjwxrqM5aVBd/qA8GWp4zGRp
	wpuAOK5rj5QkzQz8cXNzwpIx2V4DuG1bzVETEQpxv903xEDjW3lvDMFffoknx9vQJgdhfGswEyzQP
	u9TdkmyZGzXwyyvIcXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Gu1-0000000B11v-34Fc;
	Tue, 01 Sep 2026 05:19:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Gty-0000000B11Z-20kq
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 05:19:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so2035012f8f.1
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 22:19:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788239956; cv=none;
        d=google.com; s=arc-20260327;
        b=syPX0oDYWyS50SuHX0pCKZ/8bxfVdhURBUoG4MN5xqLjaul5Mt9qGuKEoMnyfcKrhb
         KAHeVaxhcsg5YeHPpd3KTwBhtfP7mOx/sYQyEMIdLZ+LJRvnlYnZqXs8Ihk+HWMeDmsU
         UJJ1m93YIsJMNGb22svZlhPpny1iiFtuSEqtRdBXYDtTmr/B+99t3Clt6vra0m29FLpd
         HOvqc28CC+5o+lSKdM9meX915oyEs3JB4cHzJ8XEmywCsBZXNmF+cLp9/mYlCz5xALTJ
         ++L+GOqmj56ys9erVxrkXY/hmO1hn/KbUdEsjb1Ji2sMMCxruew44oH59qJPlPu8FDpx
         aTwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NGm6nOxO6qf7RypC1A17ziBHFPaw2yUrUtKjLVJj54E=;
        fh=ZWLa82ykAwJkuvh5Md1WwEfVAVY4U4beZ/cGpAok4QE=;
        b=eKZi2SjfS6dUa+BMba7K4XBWXF1UJaGIWjWK59ByB26/U5fwhWFBnqZHT3UsPf1yT8
         58gBEdHdFSPK/8yvdRdIC7iyzi49Slay/SaRlFDJNyLu/oeIH0ResK80x7m9VULnQawY
         75JA+utL9cOtvO/t+oGXWnULmpYl3gSp8228qrmDrs/jazLKmHiUwX63Ei5ahCPPenwi
         K+stRowK8ctFGZKhL3XBF9VtQKZ05qlNBOPzzIxHqQrTHo4U0LVn8VpFvMXDRT0jptVe
         hH4h2t4WYZO6qwAJHIcDAHLd8Lp6oRNMWjQ+8W/9dfIqHyOduKCB+JgNUB0kz1bTleOn
         rGuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788239956; x=1788844756; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGm6nOxO6qf7RypC1A17ziBHFPaw2yUrUtKjLVJj54E=;
        b=HRkPXU8IKzg2bt/wEIaMy9ROZ1mXdR8gGMQzfoWZhYJndxAYYs6Yd0z0NmA1lxrlb1
         vR7+4VMmStPUbkhEIao+rIWGnPesKQ/EaEXqgDs4ut3x2i34YzbdggVMVjS9+VV/woBI
         N1LRl96IpuAWmqmrfgCjR6KKWcMmdA5JUDcJI1zdcvc8OiZHJivJGKYovgtLUTikHXhS
         6K8g0q/xyyr0UBd+5ZDDwVpUNYJMIYpHu4N9YbPqv5JOOlb42Mic9+HZC4kcpUAE+zpb
         HCbBSQkqgX8n82t0L+z4C+xEjd5tTpi5EnW5Np+rhA2jRRypF9MmWaHNeLN/gM9bWrOT
         HOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788239956; x=1788844756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGm6nOxO6qf7RypC1A17ziBHFPaw2yUrUtKjLVJj54E=;
        b=jcLTAWRaLq4lgcgNdPsHHlPPN5sYYIt/MxKnB7r/ARc4xglNj7EcxSTk8SjnJuGNBK
         mCqyFzrUw/10EEjh3tUA9SJM5Qlot2dt6601YVsFBMClI73PjbYWbKBiCDgUfqMArfAi
         uZKYM2DCAaN/TMik0c/q0+u8umhjV6QgvktyM2hBs0UR5NhxNodJ+kmUmPxWxZ0v0m+G
         6cWq7jUqYcJkvL5cVTbBgcBBwVn04n1iI3tulbpMNe3ruMKe/H66QUrK8OvYLXwDlTCm
         0805mRb3g+FgD6vyom1iyossitVl/eQX6AATeAo7y482dedqjE1LoDJcfRs+VS4JMcP/
         pGBQ==
X-Gm-Message-State: AFuF++mFbBHTLFpyNfvEK5wI3/Qtoerq2ZpBhIUdj51aWexFLocDntSR
	legMsIh6GULYl0xRfMuUKIa18+O98uBzDJs3Qw+X2mqH+QCZ87V8/XXHLirCt2XCQ3iVA9IBG1q
	Ri+Mu/0UCPVf8mQwrB6EaXq/zhMy7NXTX78ZawCIGNzPAX45dv2Qh
X-Gm-Gg: AYBFou3lf0zWIilqUEAMUpZvW+ts0Byp7ZGG9OREjgNay8a4rPnY3nySq4VGLLKKLak
	Imik4BLN3PvnaGYxt61koyrde2JMVWcC6Hlrxyk1d9ViYYlWNwGG9Xa4wf5EfXmE09kyqzqOcMN
	dKdN2539k33WZ6F11IgoDli1HjTkPR4/nNljV+9JLOc6sHjSclTx1ZAQuglpjf4fP5VVBAaqrXQ
	zN49zwsHFJoDSeeFNeDvo+xIANNkmzQKIcqY2sTA+kevpsMAo/9FnTdofeUw2IJ3mocgBLeNCTY
	A9hpdcG3HVY5viMO0sXkDw/oC3kVKKIf1x7827Boy967UWeqzar0oWlRcELDE7XQedeeetV0vU7
	vzAfWTC4+9C3afoqk7GzuovSAubtlwznEUziKmTEthRJOEtCEY7jRGdtf4onpYSqC
X-Received: by 2002:a05:6000:4685:b0:482:fa6f:eaf2 with SMTP id
 ffacd0b85a97d-482fa6fec32mr36870985f8f.13.1788239956495; Mon, 31 Aug 2026
 22:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260728081041.2724668-1-ben717@andestech.com>
In-Reply-To: <20260728081041.2724668-1-ben717@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Sep 2026 10:49:04 +0530
X-Gm-Features: AcwNN1UyO6iOcCUb2DbBprCTRUgo39E5YbqG1j_VMopj9tCmo6TJ1BT-NEC8NK8
Message-ID: <CAAhSdy3nZWu0_Mu5x1quZRTmHj1gam5XxMXLrvbY6pe-vKOPNA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Fix and improve the Andes ATCSMU and LLC drivers
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_221918_557527_130710CB 
X-CRM114-Status: GOOD (  17.44  )
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

T24gVHVlLCBKdWwgMjgsIDIwMjYgYXQgMTo0MeKAr1BNIEJlbiBab25nLVlvdSBYaWUgPGJlbjcx
N0BhbmRlc3RlY2guY29tPiB3cm90ZToKPgo+IEZpeGVzIGFuZCBjbGVhbnVwcyBmb3IgdGhlIEFu
ZGVzIGxhc3QgbGV2ZWwgY2FjaGUsIEhTTSBhbmQgc3VzcGVuZAo+IGRyaXZlcnMsIGNvbGxlY3Rl
ZCB3aGlsZSBicmluZ2luZyB1cCBzdXNwZW5kIHRvIFJBTSBvbiB0aGUgQUUzNTAKPiBwbGF0Zm9y
bS4KPgo+IEJlbG93IGlzIHRoZSBzdW1tYXJ5IG9mIHRoaXMgcGF0Y2ggc2V0Ogo+IC0gUGF0Y2gg
MSBtYWtlcyBhbmRlc19sbGNhY2hlX2VuYWJsZSgpIHJldHVybiAwIG9uIHN1Y2Nlc3MsIGFzIHRo
ZQo+ICAgY2FjaGVfZW5hYmxlKCkgY2FsbGJhY2sgaXMgZG9jdW1lbnRlZCB0by4gTm90aGluZyBj
aGVja3MgaXQgdG9kYXksIGJ1dAo+ICAgcGF0Y2ggNyBkb2VzLgo+IC0gUGF0Y2ggMiBwdXRzIHRo
ZSBTTVUgYW5kIExMQyByZWdpc3RlciByZWdpb25zIGluIHRoZSByb290IGRvbWFpbiwgc28KPiAg
IHRoZSBzdXBlcnZpc29yIGNhbiByZWFjaCB0aGVtIHVuZGVyIFNtZXBtcC4KPiAtIFBhdGNoIDMg
cGFpcnMgdGhlIG5vbi1yZXRlbnRpdmUgQ1NSIHNhdmUgYW5kIHJlc3RvcmUgd2l0aCBhbiBleHBs
aWNpdAo+ICAgZmxhZyBpbnN0ZWFkIG9mIGluZmVycmluZyBpdCBmcm9tIHRoZSBib290IGNvdW50
IGFuZCBzbGVlcCB0eXBlLgo+IC0gUGF0Y2ggNCByZXN0b3JlcyB0aG9zZSBDU1JzIG9uIHRoZSBz
eXN0ZW0tc3VzcGVuZCByZXN1bWUgcGF0aCwgd2hpY2gKPiAgIG5ldmVyIHJlYWNoZWQgdGhlIG9s
ZCBjYWxsIHNpdGUuCj4gLSBQYXRjaCA1IHdha2VzIGEgc2xlZXBpbmcgaGFydCB3aXRoIGEgcGxh
aW4gSVBJIGFuZCBkcm9wcyB0aGUgU01VCj4gICBXQUtFVVBfQ01EIHBhdGguCj4gLSBQYXRjaCA2
IHBvbGxzIHRoZSBzZWNvbmRhcnkgaGFydHMgdW50aWwgdGhleSBhcmUgcmVhbGx5IGFzbGVlcCBp
bnN0ZWFkCj4gICBvZiBjaGVja2luZyBvbmNlLgo+IC0gUGF0Y2ggNyBhcm1zIHRoZSBTTVUgbGFz
dCBhbmQgdW53aW5kcyBhbiBhYm9ydGVkIHN1c3BlbmQgcmF0aGVyIHRoYW4KPiAgIGxlYXZpbmcg
dGhlIGhhcnQgaGFsZiBjb25maWd1cmVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmVuIFpvbmctWW91
IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+Cj4KPiBCZW4gWm9uZy1Zb3UgWGllICg3KToKPiAg
IGxpYjogdXRpbHMvY2FjaGU6IGZpeCBhbmRlc19sbGNhY2hlX2VuYWJsZSgpIHJldHVybiB2YWx1
ZQo+ICAgbGliOiB1dGlscy9hbmRlczogYWRkIHRoZSBTTVUgYW5kIExMQyByZWdpc3RlcnMgdG8g
dGhlIHJvb3QgZG9tYWluCj4gICBwbGF0Zm9ybTogZ2VuZXJpYy9hbmRlczogcGFpciBub24tcmV0
ZW50aXZlIENTUiBzYXZlL3Jlc3RvcmUgd2l0aCBhCj4gICAgIGZsYWcKPiAgIGxpYjogdXRpbHMv
c3VzcGVuZDogcmVzdG9yZSBBbmRlcyBDU1JzIG9uIHN5c3RlbS1zdXNwZW5kIHJlc3VtZQo+ICAg
bGliOiB1dGlscy9oc206IHdha2Ugc2xlZXBpbmcgQW5kZXMgaGFydHMgd2l0aCBhbiBJUEkKPiAg
IGxpYjogdXRpbHMvc3VzcGVuZDogd2FpdCBmb3IgdGhlIHNlY29uZGFyeSBBbmRlcyBoYXJ0cyB0
byBzbGVlcAo+ICAgbGliOiB1dGlscy9hbmRlczogYXJtIHRoZSBTTVUgc2xlZXAgY29tbWFuZCBs
YXN0CgpBcHBsaWVkIHRoaXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFu
a3MsCkFudXAKCj4KPiAgaW5jbHVkZS9zYmlfdXRpbHMvaHNtL2ZkdF9oc21fYW5kZXNfYXRjc211
LmggfCAgOCArKy0KPiAgbGliL3V0aWxzL2NhY2hlL2ZkdF9hbmRlc19sbGNhY2hlLmMgICAgICAg
ICAgfCAyMyArKysrKy0tCj4gIGxpYi91dGlscy9oc20vZmR0X2hzbV9hbmRlc19hdGNzbXUuYyAg
ICAgICAgIHwgNjQgKysrKysrKystLS0tLS0tLS0tCj4gIGxpYi91dGlscy9zdXNwZW5kL2ZkdF9z
dXNwZW5kX2FuZGVzX2F0Y3NtdS5jIHwgNzAgKysrKysrKysrKysrKystLS0tLS0KPiAgcGxhdGZv
cm0vZ2VuZXJpYy9hbmRlcy9hZTM1MC5jICAgICAgICAgICAgICAgfCAyNiArKysrKystLQo+ICBw
bGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvYW5kZXMvYW5kZXMuaCAgICAgICB8ICA0ICsrCj4gIDYg
ZmlsZXMgY2hhbmdlZCwgMTI5IGluc2VydGlvbnMoKyksIDY2IGRlbGV0aW9ucygtKQo+Cj4gLS0K
PiAyLjM0LjEKPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
