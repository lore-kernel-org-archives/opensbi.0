Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE4DEE0AC4
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJykIwYm5lqZM/sOQET2ETRgVusLtHZIXHVFN24lMWU=; b=kmNiDsmbsg7RT4
	1Xh6GRPXIVkkmv1gmV3DiQvn/kbyUH4I7CySgUaYmCa/dY+MiGE485gNkJU9x6Xm6lPzm2n6JC4DN
	jHTMAx7lwfyMw30j/xnhyO74D20YQxr/WQhYqbhgH4M8RmWLOvNX+Bzx56gYEMRfQGxcUry7kF+Cp
	o8nwIn5L9b4SbCz6eUILK6Tya1ECFZPkWfX2LMbBo0BayPafLM2AaoJEvwn9H+3mErBtr5ZyqJPPG
	jJQW0bW3+uerNoNa1kO6ACBuC6N8C6/4XyaSvcBr2AdKHunLQDGL5sXdowF7+Ob8fXsRpkYKkITnq
	HNkKWvvEYTag9P8oSq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofGv-0000000CIc5-1YL2;
	Sat, 07 Feb 2026 10:10:37 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofGs-0000000CIbZ-0O42
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 10:10:35 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-66f3e7d9eccso63883eaf.1
        for <opensbi@lists.infradead.org>; Sat, 07 Feb 2026 02:10:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770459033; cv=none;
        d=google.com; s=arc-20240605;
        b=IxPTgq1bkEeYK2ec+BcMWE2aTSnVlC8lKJe7wfvT8Dw7WYwym84xyxrZmIPwe1UBru
         2qB2Gfyws+wj1Ke+URYxOs57DJKcR7XfG8U/hJJweDpo/tyxd1Bbma1hK4Hl3blNlOgk
         xrfiGUbQCXtFf0SQLdWKJLY5aIfgF/p/BuSYkF0cXo2YlMAdAXQaO6KoZih1iAqAkhmy
         bqBujUjfakB9Rh3I0mvd5fH0QQhP/H41iSjS0+uo161u8JNXJ8Q0bvWN6nLJ437F+IVr
         fMwr6oD2Hv72+AnFZgBdrqGrvqEZHLNxcpv1XSX/mMQZ+2x0WckQ9LSQehFOxfasPDMr
         2a4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p4EV78/aIWwPXz/0IB+8ELmf6rKgSU3CW6hL2LrND8M=;
        fh=Sch92qKkux4AeucvC2KlvargZk/jQktzKzrRc6CJlNk=;
        b=Sy+H9OLn7xemVwkWcD8Zli96jG29P9ONMfxfFsiwB62FGVRFJidvH2fMX2zTsZOCPQ
         /isjRYa8Ot7LmWgakXljWWt8Blgi1wzjCvX+ROc/0vX7eLGrCZBjm/yKw9nS+c6Gpr65
         TlhZyF1IhbFe4xACMeyhYISzaH60EjsxtO6R1KohrHUkFDzPwdGLpFohE9jmdvcHq2fK
         8ACOtEjSDho+xzYgABL5Jf5HegURosQlG4BIUnXFXbncw6m2w4L9X4qsdgcFe+bo5nd5
         rroAG3UW8e4j6DAiDUrOq0cOVFJNmSWlUV67kXZW8DTct9HbMJ0gJib+bvUQwwYff3UG
         Ek1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770459033; x=1771063833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4EV78/aIWwPXz/0IB+8ELmf6rKgSU3CW6hL2LrND8M=;
        b=Cqi9smteLrn1Hniryv8pskWK+LuSarUaAji6YaWKDs+0J3imABtFL9++rvkGiR/Pnf
         vZs9QLU50VfGwgGUVa4p5O0Vz00jjEVBWe25tavczdRm7IlwB+CTKEO6lHTdzP1ncVke
         tlXt9Ip1juDKvQpgcsB2v2YM8f7qGj2d6c4RnfFW/hy0vsr+wZfigjFT8oIX77/L6LfW
         5vE8l7b0qU57rHpyKjOI+z+W4w6E5+AiOr4oUpt6SKiK13Icvzk8HkGDv98CI8b0JV+y
         Jm4CTdqtu0f2lVtAsp3rnoUgyZQYjXnDbodKWCF57E3aJj3P0GkJGT47NNN4AI1+S48j
         V42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770459033; x=1771063833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p4EV78/aIWwPXz/0IB+8ELmf6rKgSU3CW6hL2LrND8M=;
        b=QZnQxzl/UKCGAzg2tn59a+m3Qrocyj591QrrnjTn+7G62Ni2a+esLwDGg+ItYOpSGB
         Nb5F97QzDUUVwtdwka5u94f9B1nwC75d34jLwfaREBP52RQCHfw4db7nwcAYtfisdr86
         M3ZUYlxQTXKY9prXoaLrIm6pMFs8LsS+uzIot6FHIX6xfzZ0bi4YTmJzF/GXku9rvdKV
         EYhD8fZPRLc9QusXQgdn0ccw0/UMqPG2I1KOG29SK8G1p2mfCh9p+OkoSi4R3VyxfeoV
         g1tP7raooTq+qs8MLg3XWhCmdMTUptXxBlqL6EUk+R3d9z3uBy18o2eIjaLEbReg6pO2
         3X7Q==
X-Gm-Message-State: AOJu0YzmC5Dko0PmgSykYvQKPro23S7idk/6VOFXIbqbX0XmNiUEgIlR
	VlTBFVlB3/JLHdxy+HgngkTcoRn8i1KjSpstbkmCOwUSMem7iS+zyfkmG21FZudq/UO6WZG5dyM
	fnm3qSAEKFhsDXvmZjSWdSuMTNXdXKFTJuxFSc0RVsA==
X-Gm-Gg: AZuq6aIa+I7wQjalLKtj82M2uOr8mxWectbjQGwTagFgFF4TSYwS/NUa5EBVigxV4C5
	SVkZixozUqYoTfCGdeWI73J1VDHdMy6oskqdV67vN1QR5d2UyuqdXcMZh/YxS2GxxBRxnz3xNkF
	967dLiOZzTeRe9fQu04zk5OLtp7tamyYbaYwPmRHwVorlGdGtM7F6ds0KGpQOvJ5GECdMhlU/IK
	RtLGLJEUmu8sBRmV4YflGpXg8+kZ+vSgIoTqaIHjFZxt4nhvo+hw/r5KTlcX7oDnN6xC5Rq3Ifu
	qlt/Zv6MX63M2s2/g3cJMMvoab7kfDsZFyG66hFJ1GPNw38LxXBmZHnHpQ==
X-Received: by 2002:a05:6820:4dc8:b0:663:4d6:1cc0 with SMTP id
 006d021491bc7-66d0a478f74mr2658727eaf.24.1770459032908; Sat, 07 Feb 2026
 02:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20260202150207.1331811-1-raymondmaoca@gmail.com> <20260202150207.1331811-2-raymondmaoca@gmail.com>
In-Reply-To: <20260202150207.1331811-2-raymondmaoca@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Feb 2026 15:40:21 +0530
X-Gm-Features: AZwV_QhCwu1bWh3vwAheovluoU9Kf7p3g1gie28tkZst9cxh3hNYb5_3Bgcc2UQ
Message-ID: <CAAhSdy0LKS9XTu+Xccs0SCj+vyCdFGrNQU7TNP2k97vvJwh4dQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] lib: sbi: introduce abstraction for wired
 interrupt handling
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_021034_163539_BEC681A5 
X-CRM114-Status: GOOD (  17.86  )
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

T24gTW9uLCBGZWIgMiwgMjAyNiBhdCA4OjMy4oCvUE0gUmF5bW9uZCBNYW8gPHJheW1vbmRtYW9j
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogUmF5bW9uZCBNYW8gPHJheW1vbmQubWFvQHJp
c2NzdGFyLmNvbT4KPgo+IEFkZCB3aXJlZCBpbnRlcnJ1cHQgaGFuZGxpbmcgYWJzdHJhY3Rpb24g
aW50byBpcnFjaGlwLgo+IFRoaXMgaW50cm9kdWNlcyBhIHNtYWxsIHByb3ZpZGVyIGludGVyZmFj
ZSBiYXNlZCBvbgo+IGNsYWltL2NvbXBsZXRlL21hc2svdW5tYWsgc2VtYW50aWNzLCBhbGxvd2lu
ZyB0byByZWdpc3RlciBhIHdpcmVkCj4gaW50ZXJydXB0IGNvbnRyb2xsZXIgYXMgYSBwcm92aWRl
ci4KPgo+IFNpZ25lZC1vZmYtYnk6IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0ByaXNjc3Rhci5j
b20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmggfCA1MiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oIGIvaW5jbHVk
ZS9zYmkvc2JpX2lycWNoaXAuaAo+IGluZGV4IGUwYWUxMmY1Li4yN2I4ODc2NSAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2ly
cWNoaXAuaAo+IEBAIC0yNyw2ICsyNywzOCBAQCBzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlIHsK
PiAgICAgICAgIGludCAoKmlycV9oYW5kbGUpKHZvaWQpOwo+ICB9Owo+Cj4gKy8qIEhhbmRsZXIg
Zm9yIGEgc3BlY2lmaWVkIGh3aXJxICovCj4gK3R5cGVkZWYgaW50ICgqc2JpX2lycWNoaXBfaXJx
X2hhbmRsZXJfdCkodm9pZCAqcHJpdik7Cj4gKwo+ICsvKiBQcm92aWRlciBvcGVyYXRpb25zICov
Cj4gK3N0cnVjdCBzYmlfaXJxY2hpcF9wcm92aWRlcl9vcHMgewo+ICsgICAgICAgLyoKPiArICAg
ICAgICAqIENsYWltIGEgcGVuZGluZyB3aXJlZCBpbnRlcnJ1cHQgb24gY3VycmVudCBoYXJ0Lgo+
ICsgICAgICAgICogUmV0dXJuczoKPiArICAgICAgICAqICAgU0JJX09LICAgICAgOiAqaHdpcnEg
aXMgdmFsaWQKPiArICAgICAgICAqICAgU0JJX0VOT0VOVCAgOiBubyBwZW5kaW5nIHdpcmVkIGlu
dGVycnVwdAo+ICsgICAgICAgICogICA8MCAgICAgICAgICA6IGVycm9yCj4gKyAgICAgICAgKi8K
PiArICAgICAgIGludCAoKmNsYWltKSh2b2lkICpjdHgsIHUzMiAqaHdpcnEpOwo+ICsKPiArICAg
ICAgIC8qCj4gKyAgICAgICAgKiBDb21wbGV0ZS9hY2tub3dsZWRnZSBhIHByZXZpb3VzbHkgY2xh
aW1lZCB3aXJlZCBpbnRlcnJ1cHQKPiArICAgICAgICAqIChpZiByZXF1aXJlZCBieSBIVykuCj4g
KyAgICAgICAgKiBTb21lIEhXIG1heSBub3QgcmVxdWlyZSBhbiBleHBsaWNpdCBjb21wbGV0aW9u
Lgo+ICsgICAgICAgICovCj4gKyAgICAgICB2b2lkICgqY29tcGxldGUpKHZvaWQgKmN0eCwgdTMy
IGh3aXJxKTsKPiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogbWFzay91bm1hc2sgYSB3aXJl
ZCBpbnRlcnJ1cHQgbGluZS4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiBUaGVzZSBhcmUgcmVx
dWlyZWQgZm9yIHJlbGlhYmxlIGNvdXJpZXJpbmcgb2YgbGV2ZWwtdHJpZ2dlcmVkIGRldmljZQo+
ICsgICAgICAgICogaW50ZXJydXB0cyB0byBTLW1vZGU6IG1hc2sgaW4gTS1tb2RlIGJlZm9yZSBl
bnF1ZXVlaW5nLCBhbmQgdW5tYXNrCj4gKyAgICAgICAgKiBhZnRlciBTLW1vZGUgaGFzIGNsZWFy
ZWQgdGhlIGRldmljZSBpbnRlcnJ1cHQgc291cmNlLgo+ICsgICAgICAgICovCj4gKyAgICAgICB2
b2lkICgqbWFzaykodm9pZCAqY3R4LCB1MzIgaHdpcnEpOwo+ICsgICAgICAgdm9pZCAoKnVubWFz
aykodm9pZCAqY3R4LCB1MzIgaHdpcnEpOwo+ICt9Owo+ICsKPiAgLyoqCj4gICAqIFByb2Nlc3Mg
ZXh0ZXJuYWwgaW50ZXJydXB0cwo+ICAgKgo+IEBAIC00Niw0ICs3OCwyNCBAQCBpbnQgc2JpX2ly
cWNoaXBfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsIGJvb2wgY29sZF9ib290KTsK
PiAgLyoqIEV4aXQgaW50ZXJydXB0IGNvbnRyb2xsZXJzICovCj4gIHZvaWQgc2JpX2lycWNoaXBf
ZXhpdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpOwo+Cj4gKy8qCj4gKyAqIFJlZ2lzdGVy
IHRoZSBhY3RpdmUgd2lyZWQgaW50ZXJydXB0IHByb3ZpZGVyLgo+ICsgKiAtIG1heF9od2lycSBz
cGVjaWZpZXMgdGhlIGhpZ2hlc3QgdmFsaWQgaHdpcnEgSUQuCj4gKyAqLwo+ICtpbnQgc2JpX2ly
cWNoaXBfcmVnaXN0ZXJfcHJvdmlkZXIoY29uc3Qgc3RydWN0IHNiaV9pcnFjaGlwX3Byb3ZpZGVy
X29wcyAqb3BzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpjdHgs
IHUzMiBtYXhfaHdpcnEpOwo+ICsKPiArdTMyIHNiaV9pcnFjaGlwX2dldF9tYXhfc3JjKHZvaWQp
Owo+ICsKPiArLyogU2V0L2NsZWFyIGhhbmRsZXIgZm9yIGEgc3BlY2lmaWVkIGh3aXJxICovCj4g
K2ludCBzYmlfaXJxY2hpcF9zZXRfaGFuZGxlcih1MzIgaHdpcnEsIHNiaV9pcnFjaGlwX2lycV9o
YW5kbGVyX3QgaGFuZGxlciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqcHJp
dik7Cj4gK2ludCBzYmlfaXJxY2hpcF9jbGVhcl9oYW5kbGVyKHUzMiBod2lycSk7Cj4gKwo+ICt2
b2lkIHNiaV9pcnFjaGlwX21hc2tfaXJxKHUzMiBod2lycSk7Cj4gK3ZvaWQgc2JpX2lycWNoaXBf
dW5tYXNrX2lycSh1MzIgaHdpcnEpOwo+ICsKPiArLyogZXh0ZXJuYWwgaW50ZXJydXB0IGhhbmRs
ZXIgKGlycWNoaXAgZGV2aWNlIGhvb2spICovCj4gK2ludCBzYmlfaXJxY2hpcF9oYW5kbGVfZXh0
ZXJuYWxfaXJxKHZvaWQpOwo+ICsKCkkgZGlkIG5vdCBtZWFuIHJlbmFtaW5nIGFuZCBtb3Zpbmcg
c3R1ZmYgdG8gc2JpX2lycWNoaXAuaAppbnN0ZWFkLCBteSBleHBlY3RhdGlvbiB3YXMgdG8gdXNl
IHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UKYXMgdGhlIGFic3RyYWN0aW9uIGZvciB0aGUgaW50
ZXJydXB0IGNvbnRyb2xsZXIuCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
