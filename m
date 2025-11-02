Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A591CCFA02
	for <opensbi@archiver.kernel.org>; Sun,  2 Nov 2025 10:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7tsVm+pU7FZ/rHKD1ZlisQje2tbARSgVsiPhawp9VY=; b=CUm6+BqXArMCKQ
	sVV9dtiP+9+2cJ7VhlgE+znTgsxqOTNhiocMEfqcnHGkxgp9GuhlYHQsbbdva8B/e4TDw69JEa2eI
	zx11Ili+YmZnkUL8/SkeDdQru2kkzAkI/e7jTcEGpbY4TfUUboQUEf/T9+LlnoduEZLnSDg35W7Pe
	70tWs+/vJskt/rRFGB60d1YLB16yyHLBiCMaWW0+114xLCO9vDevgJma/FN42+hJ/poa9wvbnz10i
	uHvw+Fk1IPcd78fLCCEVl5C4aPAxQR6nAJnVsJ0zjmGMX7874qlZxLT+8HRoAlRrWui+7tYwlpHIQ
	Bw4xyuI7HggawizyLBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVWB-00000008Tdh-0jKt;
	Sun, 02 Nov 2025 10:41:03 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVW6-00000008TdG-1RLZ
	for opensbi@lists.infradead.org;
	Sun, 02 Nov 2025 10:41:02 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-945a42fd465so150301139f.3
        for <opensbi@lists.infradead.org>; Sun, 02 Nov 2025 02:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762080057; x=1762684857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpKpI+pNR6OV4zkEnhqRTzxeM0fopl2LtTA3waFi7rw=;
        b=PyKGxCPvY7zejIMx/nKm0VAzg11D4iN/9Qvx+t0RgyGYl2HBNS59OzIz4toFXSnsVM
         5u63v9JmEhwVnDWuU1ZNndt7yWbPTlRCmADUhIfMl17aT277kw8YHa8aEp/ZtH6QrMb9
         OHYFSIjEV4/rk5XWNJYVowoxy7dlkUhByKedkuAZUJD7Cz7lizTFpqNi6c7yNBgqkOa+
         AWlxLVQw7OpO1iK+W6qAmaAaUw/fYi+wf5kGwZHeJ3uSL1lyhrz6dgHbTuvYQGr0k/O4
         eV1XYHLlu36uLWL8xyiSxALpODoEoBAboeQa+klUqaPgdR2zJo9J46acxlJKi0cmNePF
         c7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762080057; x=1762684857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CpKpI+pNR6OV4zkEnhqRTzxeM0fopl2LtTA3waFi7rw=;
        b=E6JIgQD5f0B0jSXRPytvtOm4yEVD1+o4NCirX+brmr2cuELJ6meYkyXAfHXqF940BH
         OP3ZOm/GH7j1TtQhJqkg51zBcVx/IVtYMKLdDNJY/m7st0qe78HDQo5/XjgWv+KC65Cc
         LIGCjF8L+Na92fYhKu4BEgeG9Azlk6Shr5XUv+6Wo9qTkDNI8aILJWL/ECoK8qDLsvHO
         wOy95noD+IGIY4Bty189YzNc5JI8EYDLuKsnrsjMJwJKpjP2qsI797HTygRnI1Md5om4
         mAlRt1TWu1Fi15/GfybaE5lnZ3FtoGHWaA4fUhOomebvobEDMiM7ydVAcr7mQ9SDQDoo
         Pg4w==
X-Gm-Message-State: AOJu0YxXTDlXi1l3H0ZIF+V/QVGlNWItPQpXI8cOGUrq5m6z0VHjtQW7
	PHqo/k4vHksM8098Q4yfjEXtASNzLmKD8ggx3BOINtwLHzZ8eHXWufhVx5ZUUSUwT0MiHocw3Wj
	YQz73XDgGv1X1lFg4VgHG267+Sl7BWZ7W0mVykCc6eA==
X-Gm-Gg: ASbGncudG2MIHSLvM1fy4sHHhFWiNGRlna0n0DojXpKdyNQYAdKNvXjnGCtZsN1TgHW
	1UsI2+kAyjvhvOFrl430dy6DDi9CRD+um36YAWaqwtCMprjCS4a4Hdi+Th8R2UNvbQFtw15pmVL
	O96X01g8vsii5Wzd7DNw5sunCfVXY6YgkP8zOrjmv/rhy1p9YEXsDVYK3KZmj0hZ6yafMNq42bA
	PHr7KNQ9KkKt9FshQkBVdoMpC/CqI1lOEPO2WFGmoepYuQyHm4ah9Be+bDQecBBYO1OKoZDH0Sm
	gyE+K3jqh0CJvK4c
X-Google-Smtp-Source: AGHT+IEfQ3ptoVLRtIGLymBdQZV/aWCHlI0RQZyFYMQogTevJFifgIPdXrr0WTPdSPLJrfvfkU8atMqV9w6IXxwfjcM=
X-Received: by 2002:a05:6e02:16cd:b0:433:246d:283f with SMTP id
 e9e14a558f8ab-433246d293bmr45051255ab.17.1762080057078; Sun, 02 Nov 2025
 02:40:57 -0800 (PST)
MIME-Version: 1.0
References: <20251008084444.3525615-1-peter.lin@sifive.com> <20251008084444.3525615-4-peter.lin@sifive.com>
In-Reply-To: <20251008084444.3525615-4-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 2 Nov 2025 16:10:45 +0530
X-Gm-Features: AWmQ_bmugOcuxs6UXCOVpRmbOw15lon7ArX5y4jjit8KrPIMiR5a-U9grsmxdqs
Message-ID: <CAAhSdy0Bjp4QSzyW7EY79B89cOxZCNXYzYtiu-LRLJkbfW4CLg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] lib: sbi_domain: print unsupported SmePMP permissions
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	wxjstz@126.com, alvinga@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_024058_388979_6F33C5CC 
X-CRM114-Status: GOOD (  15.82  )
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

T24gV2VkLCBPY3QgOCwgMjAyNSBhdCAyOjE04oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGUgcmVnLT5mbGFnIGlzIGVuY29kZWQgd2l0
aCA2IGJpdHMgdG8gc3BlY2lmeSBSV1gKPiBwZXJtaXNzaW9ucyBmb3IgTS1tb2RlIGFuZCBTLS9V
LW1vZGUuIEhvd2V2ZXIsIG9ubHkKPiAxNiBvZiB0aGUgcG9zc2libGUgZW5jb2RpbmdzIGFyZSB2
YWxpZCBvbiBTbWVQTVAuCj4KPiBBZGQgYSB3YXJuaW5nIG1lc3NhZ2Ugd2hlbiBhbiB1bnN1cHBv
cnRlZCBwZXJtaXNzaW9uCj4gZW5jb2RpbmcgaXMgZGV0ZWN0ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+ICBsaWIv
c2JpL3NiaV9kb21haW4uYyB8IDggKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9z
YmlfZG9tYWluLmMKPiBpbmRleCA4OTI1MGQ0Yy4uNzk4ZTY4YjMgMTAwNjQ0Cj4gLS0tIGEvbGli
L3NiaS9zYmlfZG9tYWluLmMKPiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC0xMjUs
NiArMTI1LDcgQEAgdm9pZCBzYmlfZG9tYWluX21lbXJlZ2lvbl9pbml0KHVuc2lnbmVkIGxvbmcg
YWRkciwKPiAgdW5zaWduZWQgaW50IHNiaV9kb21haW5fZ2V0X3NtZXBtcF9mbGFncyhzdHJ1Y3Qg
c2JpX2RvbWFpbl9tZW1yZWdpb24gKnJlZykKPiAgewo+ICAgICAgICAgdW5zaWduZWQgaW50IHBt
cF9mbGFncyA9IDA7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHJzdGFydCwgcmVuZDsKPgo+ICAg
ICAgICAgaWYgKChyZWctPmZsYWdzICYgU0JJX0RPTUFJTl9NRU1SRUdJT05fQUNDRVNTX01BU0sp
ID09IDApIHsKPiAgICAgICAgICAgICAgICAgLyoKPiBAQCAtMTg1LDYgKzE4NiwxMyBAQCB1bnNp
Z25lZCBpbnQgc2JpX2RvbWFpbl9nZXRfc21lcG1wX2ZsYWdzKHN0cnVjdCBzYmlfZG9tYWluX21l
bXJlZ2lvbiAqcmVnKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBtcF9mbGFncyB8PSBQTVBf
VzsKPiAgICAgICAgICAgICAgICAgaWYgKHJlZy0+ZmxhZ3MgJiBTQklfRE9NQUlOX01FTVJFR0lP
Tl9TVV9FWEVDVVRBQkxFKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBtcF9mbGFncyB8PSBQ
TVBfWDsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIHJzdGFydCA9IHJlZy0+
YmFzZTsKPiArICAgICAgICAgICAgICAgcmVuZCA9IChyZWctPm9yZGVyIDwgX19yaXNjdl94bGVu
KSA/Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcnN0YXJ0ICsgKCgxVUwgPDwgcmVnLT5vcmRl
cikgLSAxKSA6IC0xVUw7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBVbnN1cHBv
cnRlZCBTbWVwbXAgcGVybWlzc2lvbnMgIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICJv
biByZWdpb24gMHglIiBQUklMWCAiLTB4JSIgUFJJTFggIlxuIiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2Z1bmNfXywgcnN0YXJ0LCByZW5kKTsKCkl0J3Mgb2theSB0byB1cyB1cHRv
IDEwMCBjaGFyYWN0ZXJzIHBlci1saW5lIG90aGVyd2lzZQppdCBsb29rcyBnb29kIHRvIG1lLiBJ
IHdpbGwgdGFrZSBjYXJlIG9mIHRoaXMgYXQgdGhlIHRpbWUKb2YgbWVyZ2luZyB0aGlzIHBhdGNo
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3Ms
CkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
