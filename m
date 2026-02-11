Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DEAECD6CB
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rg3oN1pmBTsklTMr6X2qOL5i6NgBbFnxDxxzjlEBWJ8=; b=KcdS2KoAQ9kwIl
	Qjoo61LEAqduXD7Mh+v/oGosH0CYoiuUlnmAtyuzYs/ZUMeiNU1vcZGPR6fMfwOxynTPa2oI8pe5c
	bsy3TL20d3jqryfQUeAIg+ErsFnyK/CM6RVBU/5HaWkX2LsfYPSdutFP5d75H9S/d9Td7/htComrP
	QgnI3bmLSDOXG8WszzkVVDuVzBqlvf9UF75rwhdYw6eJmFibtsRhrZYxY4ulS4oJ9NSc6zDYSMjrf
	qH+36bRfKbCtER0mArfxBcU41EtDn4QhhYMJ9EidD5OcFdMzAVS4kYcrNzXPxSTtBi0BxW9+YEgFs
	KErv8trBT7VUcjaz2v2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3Q-00000000tqJ-2CsQ;
	Wed, 11 Feb 2026 17:31:08 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqE3N-00000000tpK-2R8u
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 17:31:08 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-40423dbe98bso2454428fac.2
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 09:31:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770831064; cv=none;
        d=google.com; s=arc-20240605;
        b=YunecXlml9dzZZMjgtcl6y05FeISeepxoTq9TxHtSxJEnZLFmfhHudhp3cVw6EdEBR
         2FzH20NeoXCzAFwtCrPxXB4oTwr7Flg8LCo3CfizX+EE9Vs2h0O5rY2+lHGjJ6wr5Lh2
         7h3X5Hx3as2e61LZiAsPndsTQXEUQV3xLt5JAYFK4x+lg9LVm/DYfohsJDVqPf6A993R
         KuBrAf1e3/MEwviFFcKw3sRJD5vLAf0xlG2czIXVuflseAnKg/4pxIsThItfAJ96Iafq
         TphT5crtKpVgX4MsuLX1rWsbiH/sb1RLFGMsxaDiQpZ3vptp+6a5qtuj6gdbtNkM3sGD
         w3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8GIqd5B+uLiwoBWGigb2g39YSZ1d9ebiVu7H2NixqNA=;
        fh=7QJJjFuoY2T+naTScm9Gi+csy3jjwvw73yUpvM/o1/M=;
        b=d8UqV306HqTAxI4F5x6XL6IdWIafpIpv5ScQa686fPrsh+MB9xAOb34djAxWOp93vc
         YyjXpKGTisJjvltIurHHk7GFd2sjCYo1m7qs/mq0hcWnBFbMUCVbr/tRsQ386neK5qAx
         olgkUfWGy5dmCZK79mS7tuclCLLQEnWUspTbX2769t5Fl/Q4rUTCr7bqfXs/ZnLtLa5D
         +9FdSlmDPF5/cDeAAGdnft0CxbVes0Xgng0xm9GNBe/8eOKnVYCteepm1sklRRRIYuM4
         5zfjFJm0JtY0KntzSc4ZKa67erIHTwCM7FVd0WYdz8JvjFAwx2fGoeYdxMwxHKSAGiRT
         mBYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770831064; x=1771435864; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GIqd5B+uLiwoBWGigb2g39YSZ1d9ebiVu7H2NixqNA=;
        b=h00oCUBXEX7A7jUShcPg3CHIo+GaFVyHEycMF68Rn8j4HVl+bECQBlTYYHDfImq5WB
         jvddFbItgSjlmTiZBi7E4IpfWnmXzoJ7UHelKgITxgVjNFQTtVezLLrGh/tEkkxNa4rt
         nf9s3+fwIqwNHmuzAxofqUH6hHmIS0PwRqPlwXYlQL6Rjny+/NidPwnyXXzSETrMCPMU
         dgqBqlcwRs5haaOK6+9KqSEk/Lgtep4hjBUaS84WXF13ZFd1XonguGClqJIiSANgbkRE
         gTZ0ayBbj+d3lf0blfWZia2YBistErQiWqBaoPFZqkZmLnZy3TxI3cn2nFYIOOWE4wFH
         4f9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770831064; x=1771435864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8GIqd5B+uLiwoBWGigb2g39YSZ1d9ebiVu7H2NixqNA=;
        b=fk0VLMj3ad7KNhA3RW6kEaLpP/zZQMHzK98gRPBpXBOxtVtKfKrMUyqYmF+owFu94m
         4ZHd8xAhokBY28BlwqBdQUNezB1cedyiPeqDMBcSaWqtufuf66k0AKzmYvsIvLWjhS4V
         z0cm8Wqz7Jd2YRcc2i+x13mrRVkp6bYgQb0U4QHv1cQsA3ThAuoEXLJsprnI0V4lqHtJ
         2hoSUXHtndMQTktuE6bKYlFioAjDWKdl4wvxDFG+oLbJNhtGykltB/B1w2hCnEhRZIyR
         kMq3wlQ7GXmf8efT7MBQiG5GWAPT6WjChOs4AJQrQP6mm8t48ycTD7g8/ozl78faCrOj
         BMEw==
X-Forwarded-Encrypted: i=1; AJvYcCUngNRFEQQD0AIiCmADELA5fPPU2NmxGkANmROD2mKHKZj0BxUEMOaXt9s8/EYbUCm7XfM8lh4F@lists.infradead.org
X-Gm-Message-State: AOJu0YzbhqOaaplA0LvmqfE10c2NPKt1joCRgtPJEq5gP+LD+8BqPlg3
	hPNRtic5H7aVup9h1/Qf9xIHLZEI/Ym3EjIhCOgwJFKJN6B5+Tgrcz+wEBI7vuks9+/J8hXZwx5
	dkdxFlgCKn1pSuXwppnBKmOM6FLqiVFdINjBVFEgOJw==
X-Gm-Gg: AZuq6aKQJBIP6vCPQ4sHLDhOzzWOkKeSwx/tycJ3YHL3+hIEF8nAI0ZQcvmlG+O2G0j
	QX7eRT7YYWB9k2yJnVS1Kus5cT7XcOTYwMv6w1RMSo6oPyXGExOGOASxcoOt6YfjMwS4g6eCX1F
	n0+Qhs3wa5/zjPPZre00HE+hpSD5KrVEsYfb7QGUWc5tJPDdnHDnHB57HZ48wQ/BEO7CHwqNwIv
	tDMnOoSOMTvTlf7dBolCYiYiPRo3nx7Bk/n38feN8MEnd9Leyp9uyF8hC21ntt5oNqK2LmYPoTA
	3LVlxBLmflwC3jKgoYo28UbTC/3PBwenjSKCkKMAG96VHGMtza4nJ5b30Ai7EheCKIjWlQ==
X-Received: by 2002:a05:6820:210e:b0:66e:9d89:d8b7 with SMTP id
 006d021491bc7-6743d0efe4amr1586504eaf.49.1770831063870; Wed, 11 Feb 2026
 09:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-9-anup.patel@oss.qualcomm.com> <CAMkFH19feRsme6Mfr1vQ7hSnr2yhFMivNpGkwfTT2uSV3ojnjg@mail.gmail.com>
 <CAAhSdy0JsxWANTmoz51n7Z=6x+1TofuY5GPoCWEDvwp=JZvZQQ@mail.gmail.com> <CAMDkj5zuk_Qu+MKyD+55pKZrT93kzE-4SZcf-iabVHRFitd6Wg@mail.gmail.com>
In-Reply-To: <CAMDkj5zuk_Qu+MKyD+55pKZrT93kzE-4SZcf-iabVHRFitd6Wg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 11 Feb 2026 23:00:52 +0530
X-Gm-Features: AZwV_QiR48nhYim9GWSzuy1OAE3-ewzrnrkqa3KgQeOml3paeZy0w2pmmZD6QBQ
Message-ID: <CAAhSdy0A0BitGsqs4RRpJ7w4rg=sx-L8QCY75oTUSbC_boWM6w@mail.gmail.com>
Subject: Re: [PATCH 8/8] lib: sbi_irqchip: Allow registering interrupt handlers
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: Ray Mao <raymond.mao@riscstar.com>, Anup Patel <anup.patel@oss.qualcomm.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Dave Patel <dave.patel@riscstar.com>, Samuel Holland <samuel.holland@sifive.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_093105_884757_477D7E99 
X-CRM114-Status: GOOD (  28.28  )
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

T24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgMTA6MjjigK9QTSBSYXltb25kIE1hbyA8cmF5bW9uZG1h
b2NhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gT24gVHVlLCBGZWIgMTAsIDIw
MjYgYXQgMTE6NDDigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToK
PiA+Cj4gPiBPbiBUdWUsIEZlYiAxMCwgMjAyNiBhdCAxMjoyOeKAr0FNIFJheSBNYW8gPHJheW1v
bmQubWFvQHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIEFudXAsCj4gPiA+Cj4g
PiA+IE9uIFNhdCwgRmViIDcsIDIwMjYgYXQgNToyNuKAr0FNIEFudXAgUGF0ZWwgPGFudXAucGF0
ZWxAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gVG8gaGFuZGxlIGV4dGVy
bmFsIGludGVycnVwdHMgaW4gTS1tb2RlLCB0aGUgc2JpX2lycWNoaXAgZnJhbWV3b3JrCj4gPiA+
PiBtdXN0IGFsbG93IHJlZ2lzdGVyaW5nIGludGVycnVwdCBoYW5kbGVycyBmcm9tIGRldmljZSBk
cml2ZXJzLgo+ID4gPj4KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0
ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiA+ID4+IC0tLQo+ID4gPj4gIGluY2x1ZGUvc2JpL3NiaV9p
cnFjaGlwLmggfCAgNTYgKysrKysrKysrKy0KPiA+ID4+ICBsaWIvc2JpL3NiaV9pcnFjaGlwLmMg
ICAgIHwgMjAyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiA+PiAg
bGliL3V0aWxzL2lycWNoaXAvYXBsaWMuYyB8ICAgMSArCj4gPiA+PiAgbGliL3V0aWxzL2lycWNo
aXAvaW1zaWMuYyB8ICAgOSArKwo+ID4gPj4gIGxpYi91dGlscy9pcnFjaGlwL3BsaWMuYyAgfCAg
IDEgKwo+ID4gPj4gIDUgZmlsZXMgY2hhbmdlZCwgMjY3IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPiA+Pgo+ID4gPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9pcnFjaGlw
LmggYi9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oCj4gPiA+PiBpbmRleCBkMmM0N2FlOC4uNzdi
NTQxMTAgMTAwNjQ0Cj4gPiA+PiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oCj4gPiA+
PiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oCj4gPiA+PiBAQCAtMTgsMTIgKzE4LDIx
IEBAIHN0cnVjdCBzYmlfc2NyYXRjaDsKPiA+ID4+Cj4gPiA+PiAgLyoqIGlycWNoaXAgaGFyZHdh
cmUgZGV2aWNlICovCj4gPiA+PiAgc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSB7Cj4gPiA+PiAt
ICAgICAgIC8qKiBOb2RlIGluIHRoZSBsaXN0IG9mIGlycWNoaXAgZGV2aWNlcyAqLwo+ID4gPj4g
KyAgICAgICAvKiogTm9kZSBpbiB0aGUgbGlzdCBvZiBpcnFjaGlwIGRldmljZXMgKHByaXZhdGUp
ICovCj4gPiA+PiAgICAgICAgIHN0cnVjdCBzYmlfZGxpc3Qgbm9kZTsKPiA+ID4+Cj4gPiA+PiAr
ICAgICAgIC8qKiBJbnRlcm5hbCBkYXRhIG9mIGFsbCBoYXJkd2FyZSBpbnRlcnJ1cHRzIG9mIHRo
aXMgaXJxY2hpcCAocHJpdmF0ZSkgKi8KPiA+ID4+ICsgICAgICAgc3RydWN0IHNiaV9pcnFjaGlw
X2h3aXJxX2RhdGEgKmh3aXJxczsKPiA+ID4+ICsKPiA+ID4+ICsgICAgICAgLyoqIExpc3Qgb2Yg
aW50ZXJydXB0IGhhbmRsZXJzICovCj4gPiA+PiArICAgICAgIHN0cnVjdCBzYmlfZGxpc3QgaGFu
ZGxlcl9saXN0Owo+ID4gPj4gKwo+ID4gPj4gICAgICAgICAvKiogVW5pcXVlIElEIG9mIHRoaXMg
aXJxY2hpcCAqLwo+ID4gPj4gICAgICAgICB1MzIgaWQ7Cj4gPiA+Pgo+ID4gPj4gKyAgICAgICAv
KiogTnVtYmVyIG9mIGhhcmR3YXJlIElSUXMgb2YgdGhpcyBpcnFjaGlwICovCj4gPiA+PiArICAg
ICAgIHUzMiBudW1faHdpcnE7Cj4gPiA+PiArCj4gPiA+PiAgICAgICAgIC8qKiBTZXQgb2YgaGFy
dHMgdGFyZ2V0dGVkIGJ5IHRoaXMgaXJxY2hpcCAqLwo+ID4gPj4gICAgICAgICBzdHJ1Y3Qgc2Jp
X2hhcnRtYXNrIHRhcmdldF9oYXJ0czsKPiA+ID4+Cj4gPiA+PiBAQCAtMzIsNiArNDEsMjEgQEAg
c3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSB7Cj4gPiA+Pgo+ID4gPj4gICAgICAgICAvKiogUHJv
Y2VzcyBoYXJkd2FyZSBpbnRlcnJ1cHRzIGZyb20gdGhpcyBpcnFjaGlwICovCj4gPiA+PiAgICAg
ICAgIGludCAoKnByb2Nlc3NfaHdpcnFzKShzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpjaGlw
KTsKPiA+ID4+ICsKPiA+ID4+ICsgICAgICAgLyoqIFNldHVwIGEgaGFyZHdhcmUgaW50ZXJydXB0
IG9mIHRoaXMgaXJxY2hpcCAqLwo+ID4gPj4gKyAgICAgICBpbnQgKCpod2lycV9zZXR1cCkoc3Ry
dWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcCwgdTMyIGh3aXJxKTsKPiA+ID4+ICsKPiA+ID4+
ICsgICAgICAgLyoqIENsZWFudXAgYSBoYXJkd2FyZSBpbnRlcnJ1cHQgb2YgdGhpcyBpcnFjaGlw
ICovCj4gPiA+PiArICAgICAgIHZvaWQgKCpod2lycV9jbGVhbnVwKShzdHJ1Y3Qgc2JpX2lycWNo
aXBfZGV2aWNlICpjaGlwLCB1MzIgaHdpcnEpOwo+ID4gPj4gKwo+ID4gPj4gKyAgICAgICAvKiog
RW5kIG9mIGhhcmR3YXJlIGludGVycnVwdCBvZiB0aGlzIGlycWNoaXAgKi8KPiA+ID4+ICsgICAg
ICAgdm9pZCAoKmh3aXJxX2VvaSkoc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcCwgdTMy
IGh3aXJxKTsKPiA+ID4KPiA+ID4KPiA+ID4gSWYgaHdpcnFfZW9pKCkgaXMgYW4gZXF1aXZhbGVu
dCBvZiBjbGFpbSgpLCB0aGVuIGh3aXJxIHNob3VsZCBiZSBhIHBvaW50ZXIgb2YgbWVtb3J5LCBz
aW5jZSB3ZSBuZWVkIHRvIHJlYWQgYW5kIHJldHVybiB0aGUgSURDX1RPUElfSUQgZnJvbSBDTEFJ
TUkuCj4gPiA+Cj4gPgo+ID4gSSB0aGluayB0aGUgZXh0ZXJuYWwgaW50ZXJydXB0IGhhbmRsaW5n
IGZsb3cgaXMgbm90IGNsZWFyCj4gPiB0byB5b3UgYnV0IGxldCBtZSB0cnkgdG8gZXhwbGFpbi4K
PiA+Cj4gPiBXaGVuZXZlciBhIGhhcnQgcmVjZWl2ZXMgZXh0ZXJuYWwgaW50ZXJydXB0Ogo+ID4K
PiA+IDEpIFRoZSBzYmlfdHJhcF9oYW5kbGVyKCkgaXMgY2FsbGVkIGJ5IGxvdy1sZXZlbCBoYW5k
bGVyCj4gPiB3aGljaCBpbi10dXJuIGNhbGxzIHNiaV9pcnFjaGlwX3Byb2Nlc3MoKQo+ID4gMikg
VGhlIHNiaV9pcnFjaGlwX3Byb2Nlc3MoKSB3aWxsIGluLXR1cm4gY2FsbAo+ID4gcHJvY2Vzc19o
d2lycXMoKSBvZiBhcHByb3ByaWF0ZSBkcml2ZXIKPiA+IDMpIFRoZSBwcm9jZXNzX2h3aXJxcygp
IGluLWNhc2Ugb2YgQVBMSUMKPiA+IGRpcmVjdC1tb2RlIHdpbGwgdXNlIElEQ19UT1BJX0lEIHRv
IGRldGVybWluZQo+ID4gaHdpcnEgbnVtYmVyIGFuZCBjYWxsIHNiaV9pcnFjaGlwX3Byb2Nlc3Nf
aHdpcnEoKQo+ID4gdG8gaGFuZGxlIGl0Lgo+ID4KPiA+IElmIHdlIGhhdmUgbmVzdGVkIGlycWNo
aXAgc3VjaCBhcyBJTVNJQytBUExJQwo+ID4gdGhlbiBwcm9jZXNzX2h3aXJxcygpIHdpbGwgYmUg
aW1wbGVtZW50ZWQgYnkgSU1TSUMKPiA+IHdoZXJlYXMgQVBMSUMgd2lsbCB1c2Ugc2JpX2lycWNo
aXBfcmVxdWVzdF9oYW5kbGVyKCkKPiA+IHRvIHJlZ2lzdGVyIGNhbGxiYWNrIGZvciBJTVNJQyBo
d2lycXMuIFRoaXMgbWVhbnMKPiA+IHNiaV9pcnFjaGlwX3Byb2Nlc3MoKSB3aWxsIGNhbGwgcHJv
Y2Vzc19od2lycXMoKSBvZgo+ID4gSU1TSUMgYW5kIElNU0lDIHdpbGwgY2FsbCBBUExJQyBpbnRl
cnJ1cHQgaGFuZGxlcgo+ID4gdmlhIHNiaV9pcnFjaGlwX3Byb2Nlc3NfaHdpcnEoKSB3aGVyZWFz
IHRoZSBBUExJQwo+ID4gaW50ZXJydXB0IGhhbmRsZXIgd2lsbCBhZ2FpbiBjYWxsIHNiaV9pcnFj
aGlwX3Byb2Nlc3NfaHdpcnEoKS4KPiA+Cj4gPiBJbiBvdGhlciB3b3Jkcywgd2UgY2FuIHN1cHBv
cnQgYW55IGlycWNoaXAgdG9wb2xvZ3kuCj4gPgo+Cj4gSSBrbm93IHRoaXMgZmxvdyBvZiBpbnRl
cnJ1cHQgaGFuZGxpbmcsIGJlZm9yZSBJIHBsYW5uZWQgdG8gcmVhZAo+IFRPUElfSUQgaW4gdGhl
IGVvaSBob29rLCBidXQgeWVzLCBJIGNhbiBkbyB0aGlzIGluIHByb2Nlc3NfaHdpcnFzKCkKPiBJ
IGFsbW9zdCByZWJhc2VkIGFsbCBteSB3b3JrIGluIEFQTElDIG9uIHRvcCBvZiB5b3VyIHBhdGNo
IHNlcmllcy4gSQo+IHdpbGwgcHVzaCBhIG5ldyB2ZXJzaW9uIHRvIFJJU0UgR2l0bGFiIGFuZCBw
aW5nIHlvdSBhbmQgUm9iaW4uCgpUaGFua3MgUmF5bW9uZCwgdGhlIGludGVudGlvbiBvZiB0aGlz
IHNlcmllcyB3YXMgdG8gZ2l2ZQp5b3UgYSBnb29kIHN0YXJ0aW5nIHBvaW50IHRvIGJ1aWxkIHVw
b24uIEkgd2lsbCBzZW5kLW91dCB2MgpwcmV0dHkgc29vbiBhZGRyZXNzaW5nIGNvbW1lbnRzIGZy
b20gRHJldyBhbmQgU2FtdWVsLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
