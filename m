Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9101CD98C5
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 04:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjjJ1s9ViOLUaCBAtERhI4QCgyH0un4jeoZSfO9p/Ao=; b=sQb3bEaY6afzqL
	Y59C7OmWiwKD8+J+mjqan9/k3kBKT9IheZg51CcLN52hU8os4jHmLNkKzzBL8jodhM7HetYyrMyT/
	5hUu2G954He7vdy0Bcrjp8WQCr/LC6FKsl/ZDR7amczxeU00VMc6Jh7nBD33Hb8tM1q88s5egjT6p
	EmdDHGwed4T1ZqYAM5UGotzD09masja5nIsunZiHqwHheqdMqevKe0a0KJjUs5S4xfqN3Otaeu8qt
	5Snl6YEV59ByR8Es4kxvVZNuzRC/pXUCsvMUSNRt9wTmqSfJOcTkL1Q5e6S0vacPNvojOGoT9DRim
	ZC8ytQ6deFolgyJ+rBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzEh-0000000DaKV-3mWg;
	Mon, 15 Jun 2026 04:47:47 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzEf-0000000DaJv-2fbn
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 04:47:47 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-399389dae01so15391451fa.3
        for <opensbi@lists.infradead.org>; Sun, 14 Jun 2026 21:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781498863; cv=none;
        d=google.com; s=arc-20240605;
        b=AxeAMg3NHEOFXOh+TgNJvePmj7MSI80dyM6YYpwVMVuYBuJnPJin/tqNCXLi2OaOy5
         fnp72inml/BK1LOJPQxY2THy93ixuL3hQLqsYxc8DvFAdI+hwl6sWeQ2k5LhodM/OSvP
         latlL0iKGt9xZG6il8f8Ty+riHil1eyXW7AwnCIR5qVsStTSEqA14KAw76QzT2yIsoR4
         cBMk21XGAHxYi6tUBujeIXVkj9VzIIdnidYfP4bA3RCMFUrMjCaWQlTU7DStpLMwK8eW
         30UTbH8VCmruMdkP1JvpfMBFc0KbQC+DXYvu2UASMX0/q1H/lCUXY+ySCmDfSEHpTSqx
         XLfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJ8Xx9fS+qQcG4D3vI6u3mUmTjTOqzo3I38r1CC06fQ=;
        fh=zdtfVpmXs6c+iT38/Mn2HC85KdzcgAzguzaH2NCKrvI=;
        b=QWPwM9trhIF/6mHtxjjY3gONI3bc4emlgFLlGr8xkhtP8V9P1bveleFnXHQEQeS/Va
         LkFaysAODaIkslNUh030654IRcWkFqymWghy3kCxT3flyryaiZRcGvjj1yFn5xtrMcY6
         1RgJHXQaGQQIXUnI620kLoKsZ5QglN4l+FQ8SUBbyDPLVpq34k7+AejJzQ47BP/dMXcp
         X/EBtqGyM7aGFRFlkvJqWBDLMBu7oZtpmJubVLWda9zy1Rdn3iVYeDorRzfvw05ETM/f
         JlY+5fEcSgsie1fvuHQAI/Q1Ab/PuAqCth6lYWOQ0yi6f/o1VWqelUY+394+ebjk7aRK
         xNow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1781498863; x=1782103663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJ8Xx9fS+qQcG4D3vI6u3mUmTjTOqzo3I38r1CC06fQ=;
        b=fk9cClmdo7m4H06aMBNq+yt6wdYt+aKjPT/JhJjPLu59z3bIK3nSO47JD4e857wPIt
         xyjWckko3tIt6kMfKGTCCZChddzH83iFwaYXwJN0sjy8ySJpioOAJiZNqi4uxGPe42dH
         rln8dAMN2M/xsQHmn2zExExvg1OWoV574gH6jgDMc/22awINLQO7eMI+cWgxOC54V3AZ
         vZVNmV3xOGY6zzZ9BdnFKZ7abJF6bdV89JeQRU6Bl42EbJLfTjTcbkjK2OvtaFAQnyT8
         emBYzBFFjHHDxUAG4B7INzOmynnnYCewqH+GtZ2t81SAuOEoqlR8vgMJ/WKzHOjGCruJ
         VWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781498863; x=1782103663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bJ8Xx9fS+qQcG4D3vI6u3mUmTjTOqzo3I38r1CC06fQ=;
        b=UUO1jtqaHNhzqVgN9vy6WUPTZdK6QdY/RUKYE8cRHW87S6qS1w/tmaP3bqwdo3QhYM
         wog/7Q8hQ7Wybga4PRqynXv7076XCwF21Au75Z1wBVHIl/ma/R/bPYw4YPUV0eCj5/j/
         tDl3b8VLZ5QAQgdLH6+a1XawjGKasU7xDP5NGl9Sr48zaCQsTcKiawkz8rQiiN6F7ERJ
         84IxaGHrpKiBKk0N8rhwUHcadZIguxmYYCf8ZpMoNylrjMwIVeSdlx7L5w25Mj+yjA4U
         3+kaL5MVm3duRK6lfjqL3q4ukvdXMvPtRlNZQi8o81FlhbcJIke0uw+kSGnmHjz974TY
         Meeg==
X-Gm-Message-State: AOJu0YwFi3fVu3bePcDalneCgKcPq2JXyayYYmphvZW5s/Cnchr58+0M
	74L8smr5a/H1M2qeAFlFuF9yfExisBWhJlvVZYuQADYIEI6hAOKKboJNAu60pw9yKaukoeuoJsl
	bkVzMaB2GW3eD6IV9C5y6bXqotN9WR4kQrM+MgJsPyQ==
X-Gm-Gg: Acq92OEoirXjkrsqQjKdwK5sPKCghrGMKksvbpDK4KpAx4IDwAedVP6wID7BOqme1rw
	VfRkiL4yiSMjKBBcmAElVYfG2woqRmyiYINDYN/kAbTQSSwGKkMEorSLZmEiZ1cjjYJ+Zl52RcZ
	QHBUjtEPLXJ67U9YdNJuJUjW5KEL+RGZJnLY/CspbzFM2jiIYqKGcRmzhDeJRZl8FTR6NQR2368
	R9aiqvCuHLBAbsfb9WaadjIlFPDusB18CtwdI1k0SqQAy4rkAWsyXjYVUwLMMTLJObSTNA83Vj+
	ANFyZf7gNVtyeyiXpG0d7wAi3vwMcO5aVw46bFngnQ==
X-Received: by 2002:a05:6512:8013:10b0:5aa:721a:344 with SMTP id
 2adb3069b0e04-5ad30dc7477mr1602274e87.38.1781498862439; Sun, 14 Jun 2026
 21:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260529085234.1682842-1-inochiama@gmail.com>
In-Reply-To: <20260529085234.1682842-1-inochiama@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 15 Jun 2026 10:17:30 +0530
X-Gm-Features: AVVi8CdEKfJ2fKJFowOtA8PR2Bxha4DqBwxCf2YsKqYaAYpAL4qv47HpfYolocU
Message-ID: <CAK9=C2VL2vxYXRCPmgm95AuWRpBD9GZrowe6unSxR7XOJNe14Q@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/reset: Add litex SoC reset driver
To: Inochi Amaoto <inochiama@gmail.com>
Cc: opensbi@lists.infradead.org, "Gabriel L . Somlo" <gsomlo@gmail.com>, florent@enjoy-digital.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_214745_737148_F4D3BBAA 
X-CRM114-Status: GOOD (  23.19  )
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

T24gRnJpLCBNYXkgMjksIDIwMjYgYXQgMzowM+KAr1BNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gTGl0ZXggU29DIGNvbnRyb2xsZXIgc3VwcG9ydHMgcmVi
b290IGZ1bmN0aW9uIGJ5IHRvZ2dsaW5nIHRoZSBmaXJzdAo+IGJpdCBvZiB0aGUgY3RybCByZWdp
c3Rlci4gQWRkIGEgcmVzZXQgZHJpdmVyIHNvIG90aGVyIHNvZnR3YXJlIGNhbgo+IHVzZSBpdC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+CgpM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBs
aWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoK
PiAtLS0KPiAgbGliL3V0aWxzL3Jlc2V0L0tjb25maWcgICAgICAgICAgICB8ICA1ICsrKwo+ICBs
aWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X2xpdGV4LmMgIHwgNjYgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIGxpYi91dGlscy9yZXNldC9vYmplY3RzLm1rICAgICAgICAgfCAgMyAr
Kwo+ICBwbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnIHwgIDEgKwo+ICA0IGZpbGVz
IGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91dGls
cy9yZXNldC9mZHRfcmVzZXRfbGl0ZXguYwo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9yZXNl
dC9LY29uZmlnIGIvbGliL3V0aWxzL3Jlc2V0L0tjb25maWcKPiBpbmRleCBmOTg5MjZlNS4uYjJh
YzEyMGUgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL3Jlc2V0L0tjb25maWcKPiArKysgYi9saWIv
dXRpbHMvcmVzZXQvS2NvbmZpZwo+IEBAIC0yNCw2ICsyNCwxMSBAQCBjb25maWcgRkRUX1JFU0VU
X0hUSUYKPiAgICAgICAgIHNlbGVjdCBTWVNfSFRJRgo+ICAgICAgICAgZGVmYXVsdCBuCj4KPiAr
Y29uZmlnIEZEVF9SRVNFVF9MSVRFWAo+ICsgICAgICAgYm9vbCAiTElURVggU29DIHJlc2V0IGRy
aXZlciIKPiArICAgICAgIGRlcGVuZHMgb24gRkRUX0dQSU8KPiArICAgICAgIGRlZmF1bHQgbgo+
ICsKPiAgY29uZmlnIEZEVF9SRVNFVF9SUE1JCj4gICAgICAgICBib29sICJSUE1JIEZEVCByZXNl
dCBkcml2ZXIiCj4gICAgICAgICBkZXBlbmRzIG9uIEZEVF9NQUlMQk9YICYmIFJQTUlfTUFJTEJP
WAo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X2xpdGV4LmMgYi9saWIv
dXRpbHMvcmVzZXQvZmR0X3Jlc2V0X2xpdGV4LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwLi4yODc3NDVmMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9saWIvdXRpbHMv
cmVzZXQvZmR0X3Jlc2V0X2xpdGV4LmMKPiBAQCAtMCwwICsxLDY2IEBACj4gKy8qCj4gKyAqIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiArICoKPiArICogQ29weXJpZ2h0
IChjKSAyMDI2IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gKyAqLwo+ICsK
PiArI2luY2x1ZGUgPGxpYmZkdC5oPgo+ICsjaW5jbHVkZSA8c2JpL3Jpc2N2X2lvLmg+Cj4gKyNp
bmNsdWRlIDxzYmkvc2JpX2Vycm9yLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX3N5c3RlbS5oPgo+
ICsjaW5jbHVkZSA8c2JpX3V0aWxzL2ZkdC9mZHRfZHJpdmVyLmg+Cj4gKyNpbmNsdWRlIDxzYmlf
dXRpbHMvZmR0L2ZkdF9oZWxwZXIuaD4KPiArCj4gKyNkZWZpbmUgUkVTRVRfQ1RSTCAgICAgICAg
ICAgICAgICAgICAgIDB4MAo+ICsKPiArc3RhdGljIHZvbGF0aWxlIHUzMiAqbGl0ZXhfc29jX2Jh
c2U7Cj4gKwo+ICtzdGF0aWMgaW50IGxpdGV4X3Jlc2V0X2NoZWNrKHUzMiB0eXBlLCB1MzIgcmVh
c29uKQo+ICt7Cj4gKyAgICAgICBzd2l0Y2ggKHR5cGUpIHsKPiArICAgICAgIGNhc2UgU0JJX1NS
U1RfUkVTRVRfVFlQRV9DT0xEX1JFQk9PVDoKPiArICAgICAgIGNhc2UgU0JJX1NSU1RfUkVTRVRf
VFlQRV9XQVJNX1JFQk9PVDoKPiArICAgICAgICAgICAgICAgcmV0dXJuIDI1NTsKPiArICAgICAg
IH0KPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbGl0ZXhf
ZG9fcmVzZXQodTMyIHR5cGUsIHUzMiByZWFzb24pCj4gK3sKPiArICAgICAgIHdyaXRlbF9yZWxh
eGVkKDB4MSwgbGl0ZXhfc29jX2Jhc2UgKyBSRVNFVF9DVFJMKTsKPiArfQo+ICsKPiArc3RhdGlj
IHN0cnVjdCBzYmlfc3lzdGVtX3Jlc2V0X2RldmljZSBsaXRleF9yZXNldCA9IHsKPiArICAgICAg
IC5uYW1lID0gImxpdGV4LXJlc2V0IiwKPiArICAgICAgIC5zeXN0ZW1fcmVzZXRfY2hlY2sgPSBs
aXRleF9yZXNldF9jaGVjaywKPiArICAgICAgIC5zeXN0ZW1fcmVzZXQgPSBsaXRleF9kb19yZXNl
dAo+ICt9Owo+ICsKPiArc3RhdGljIGludCBsaXRleF9yZXNldF9pbml0KGNvbnN0IHZvaWQgKmZk
dCwgaW50IG5vZGVvZmYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBmZHRfbWF0Y2ggKm1hdGNoKQo+ICt7Cj4gKyAgICAgICB1aW50NjRfdCByZWdfYWRkcjsKPiAr
ICAgICAgIGludCByYzsKPiArCj4gKyAgICAgICByYyA9IGZkdF9nZXRfbm9kZV9hZGRyX3NpemUo
ZmR0LCBub2Rlb2ZmLCAwLCAmcmVnX2FkZHIsIE5VTEwpOwo+ICsgICAgICAgaWYgKHJjIDwgMCB8
fCAhcmVnX2FkZHIpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5PREVWOwo+ICsKPiAr
Cj4gKyAgICAgICBsaXRleF9zb2NfYmFzZSA9ICh2b2xhdGlsZSB1MzIgKikodW5zaWduZWQgbG9u
ZylyZWdfYWRkcjsKPiArCj4gKyAgICAgICBzYmlfc3lzdGVtX3Jlc2V0X2FkZF9kZXZpY2UoJmxp
dGV4X3Jlc2V0KTsKPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBmZHRfbWF0Y2ggbGl0ZXhfcmVzZXRfbWF0Y2hbXSA9IHsKPiArICAgICAgIHsg
LmNvbXBhdGlibGUgPSAibGl0ZXgsc29jLWNvbnRyb2xsZXIiIH0sCj4gKyAgICAgICB7IH0sCj4g
K307Cj4gKwo+ICtjb25zdCBzdHJ1Y3QgZmR0X2RyaXZlciBmZHRfcmVzZXRfbGl0ZXggPSB7Cj4g
KyAgICAgICAubWF0Y2hfdGFibGUgPSBsaXRleF9yZXNldF9tYXRjaCwKPiArICAgICAgIC5pbml0
ID0gbGl0ZXhfcmVzZXRfaW5pdCwKPiArfTsKPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3Jlc2V0
L29iamVjdHMubWsgYi9saWIvdXRpbHMvcmVzZXQvb2JqZWN0cy5tawo+IGluZGV4IDNjNjgxYzI3
Li4zOGI0ZTMwNiAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvcmVzZXQvb2JqZWN0cy5tawo+ICsr
KyBiL2xpYi91dGlscy9yZXNldC9vYmplY3RzLm1rCj4gQEAgLTE3LDYgKzE3LDkgQEAgbGlic2Jp
dXRpbHMtb2Jqcy0kKENPTkZJR19GRFRfUkVTRVRfR1BJTykgKz0gcmVzZXQvZmR0X3Jlc2V0X2dw
aW8ubwo+ICBjYXJyYXktZmR0X2Vhcmx5X2RyaXZlcnMtJChDT05GSUdfRkRUX1JFU0VUX0hUSUYp
ICs9IGZkdF9yZXNldF9odGlmCj4gIGxpYnNiaXV0aWxzLW9ianMtJChDT05GSUdfRkRUX1JFU0VU
X0hUSUYpICs9IHJlc2V0L2ZkdF9yZXNldF9odGlmLm8KPgo+ICtjYXJyYXktZmR0X2Vhcmx5X2Ry
aXZlcnMtJChDT05GSUdfRkRUX1JFU0VUX0xJVEVYKSArPSBmZHRfcmVzZXRfbGl0ZXgKPiArbGli
c2JpdXRpbHMtb2Jqcy0kKENPTkZJR19GRFRfUkVTRVRfTElURVgpICs9IHJlc2V0L2ZkdF9yZXNl
dF9saXRleC5vCj4gKwo+ICBjYXJyYXktZmR0X2Vhcmx5X2RyaXZlcnMtJChDT05GSUdfRkRUX1JF
U0VUX1NHMjA0Ml9IV01PTl9NQ1UpICs9IGZkdF9yZXNldF9zZzIwNDJfbWN1Cj4gIGxpYnNiaXV0
aWxzLW9ianMtJChDT05GSUdfRkRUX1JFU0VUX1NHMjA0Ml9IV01PTl9NQ1UpICs9IHJlc2V0L2Zk
dF9yZXNldF9zZzIwNDJfaHdtb25fbWN1Lm8KPgo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5l
cmljL2NvbmZpZ3MvZGVmY29uZmlnIGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZp
Zwo+IGluZGV4IDgxOGI3MWY0Li45Njk2MzllMyAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5l
cmljL2NvbmZpZ3MvZGVmY29uZmlnCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2Rl
ZmNvbmZpZwo+IEBAIC00OSw2ICs0OSw3IEBAIENPTkZJR19GRFRfUkVHTUFQX1NZU0NPTj15Cj4g
IENPTkZJR19GRFRfUkVTRVQ9eQo+ICBDT05GSUdfRkRUX1JFU0VUX0FUQ1dEVDIwMD15Cj4gIENP
TkZJR19GRFRfUkVTRVRfR1BJTz15Cj4gK0NPTkZJR19GRFRfUkVTRVRfTElURVg9eQo+ICBDT05G
SUdfRkRUX1JFU0VUX0hUSUY9eQo+ICBDT05GSUdfRkRUX1JFU0VUX1JQTUk9eQo+ICBDT05GSUdf
RkRUX1JFU0VUX1NHMjA0Ml9IV01PTl9NQ1U9eQo+IC0tCj4gMi41NC4wCj4KPgo+IC0tCj4gb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
