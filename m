Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88D2CCA470
	for <opensbi@archiver.kernel.org>; Tue, 30 Sep 2025 11:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/ch79scdEg8oSAVuXXZr1IP/+HdsY5plq+r1fScaCU=; b=rjv/EsRFzNKcAX
	DZkY1flYmOMjFjYiBtviMuR5FVnmBxo+lAg4A8/cb/PoSv/QJNJSjKTvZNO0pTKHjXIJAL5Xb2UmF
	S6bByHbmFZfjgPQCQ/RiWNh9kEoOLY+jfqJbfBbJgt7N4GfL6uNlDR6J92OH+gd4kfGzH9ekWc6GJ
	18j9W5od9fW3/gETYOkhdqRQqSml72xEXPsGPgce++0xmC6psiRLqOFwqYl6nwiwU5GLW/L8MB3KF
	o1gAJ0Jm8IEWoWngs6SSWeM+9z5OCRKPUFgXhcESjtIl9FpsisaauhbI2OS8QmgvVz0mn0uJ/nlhu
	+KgFBfK7b3tGW7REuC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Yvf-00000005BHB-3lz9;
	Tue, 30 Sep 2025 11:53:59 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Yvc-00000005BGp-3D2k
	for opensbi@lists.infradead.org;
	Tue, 30 Sep 2025 11:53:58 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-92b92e4b078so73164039f.0
        for <opensbi@lists.infradead.org>; Tue, 30 Sep 2025 04:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759233236; x=1759838036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qh/8wopbr8yIABkrukcjvqkgrdeCVifrAudtlvRHy9A=;
        b=HwHgWhPkI5QqeyOIrcCHiS17akiJhJ4gSbTOpNUwrqYIfoiLHUPCuOM7+abvzF30GH
         6RBx/x+oELu4kyuk1rYTlQXLQL4LwmfNGfImiLnEc/WjWQz5QP0TuuDT40WXi7ELeJlN
         TY3knAW1tQcN392SPP+1cxoBRquPBgLiZadmZkpk3RseCQ5+rR+sG+6VLH/lGsCHuXaK
         KBJj/RLCvkEy4sAtxnlGQbvZ9gAxxlZNYHzffa3XDbVxmFq/R1ZcBw205yNw972nGMWL
         xub/fNSSZ76Yi8IUVgQI8ycxWlCsYZJ47e/ccCZpd4Y0zIZGY7EFOteeLukCpCHke9Cc
         sJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759233236; x=1759838036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh/8wopbr8yIABkrukcjvqkgrdeCVifrAudtlvRHy9A=;
        b=lQgok06l8CJql21xvaDKgkyMRyFtWqWszq8R8VKmmQmDbXHqCkaHx4lTEDfRLhbu63
         H9xlIi2E0JlqRWT5dHbztMeM2dOFQr4gdnZ+fcU3EGlzJbpndfuDL/QRLhyolSjbTWeC
         niloWNmloDq8ibEmiJFfm3lr2wYavDKiMWFkURd+6db/AxAv2fciaq7igkNqe2wuGk87
         o5IK9QvejlaQnxCoYKJoGAtBgVwNaTD27V8DaMFUs50m29hA6J5OfsKCr7O+sIxSmZIZ
         XRCN0uXXwGMX3bBboDPJk4ksy12IVNXXZGxe30RBmirqA5lLOAEm6GysSQLzWYIiY+MT
         PdbQ==
X-Gm-Message-State: AOJu0Yxi8PqP2y0K4g14ShRW8kBq5awGwZNcif7YuYDE8f0Z0EKuxhv+
	X8GVu2aL7i5QoB5a8nzYbGqMGGKaW4ie8cAzI9cG1TMxYDCuTUMWYkIaqW2/1kKOR4s85t0x5WV
	cvUAuzEFWZkALBIal+rzFtaQtgrMDSU0KmceKVJdE/Za0Rewfstos5VQ=
X-Gm-Gg: ASbGnct3yokimXebuGcSFat3i1ODPt2x7dcX3yBxjlZKPekCCAenUu9qbOUgoOGwxLm
	q6FjbIu6xcG5oPnlCKfmQeSPm5sau4UtOpAaT6olsyv5Gp5nmsHGahR00BxtyqeATOZVkYlg39a
	T1ZmBEUov+XNZecdGBoYmRL0PmzylRLcU8FK7XxIqUpzguuldtPIayIJRnTbYzHS3g5hDSwjHqn
	UvC05ZGI/ax2841eg+r1SzLEam2k3k7y+U3D4AWEpCqxmnejkyJm+djnK4CvktUvFMLOpqtzh4=
X-Google-Smtp-Source: AGHT+IFfj33EwBt6OmRW0J6563+ehmtTPIkSV9cc941vbHZl6mk4dbj2SFxYfztF/45Wd5wbzDxz8dSUV91SXCsEgU8=
X-Received: by 2002:a05:6e02:2196:b0:423:fc5f:cadf with SMTP id
 e9e14a558f8ab-42595625404mr285014205ab.18.1759233235614; Tue, 30 Sep 2025
 04:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250806032924.3532975-1-z_bajeer@yeah.net>
In-Reply-To: <20250806032924.3532975-1-z_bajeer@yeah.net>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Sep 2025 17:23:44 +0530
X-Gm-Features: AS18NWBZaZ2kMIQpHczMjM68DzEk_qZ75CqoflEQ4jWZU527TbWqRj0yh1469GQ
Message-ID: <CAAhSdy2=wPme_oyMpQxF8n8hme5yPxHKh=9wwHwKdarbQCH1yA@mail.gmail.com>
Subject: Re: [PATCH] aplic: fix lock machanism in xmsiaddrcfg(h)
To: Yang Jialong <z_bajeer@yeah.net>
Cc: opensbi@lists.infradead.org, yangjialong@rvcore.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_045356_808221_6C5268DE 
X-CRM114-Status: GOOD (  19.30  )
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

VGhlIHBhdGNoIHN1YmplY3QgY2FuIGJlOgpsaWI6IHV0aWxzL2lycWNoaXA6IGZpeCBhcGxpYyBs
b2NrIG1lY2hhbmlzbSBpbiB4bXNpYWRkcmNmZyhoKQoKT24gV2VkLCBBdWcgNiwgMjAyNSBhdCA5
OjEx4oCvQU0gWWFuZyBKaWFsb25nIDx6X2JhamVlckB5ZWFoLm5ldD4gd3JvdGU6Cj4KPiA0LjUu
NC4gU3VwZXJ2aXNvciBNU0kgYWRkcmVzcyBjb25maWd1cmF0aW9uIChzbXNpYWRkcmNmZyBhbmQg
c21zaWFkZHJjZmdoKQo+IElmIHJlZ2lzdGVyIG1tc2lhZGRyY2ZnaCBvZiB0aGUgZG9tYWluIGhh
cyBiaXQgTCBzZXQgdG8gb25lLCB0aGVuCj4gc21zaWFkZHJjZmcgYW5kIHNtc2lhZGRyY2ZnaCBh
cmUgbG9ja2VkIGFzIHJlYWQtb25seSBhbG9uZ3NpZGUKPiBtbXNpYWRkcmNmZyBhbmQgbW1zaWFk
ZHJjZmdoLgoKVGhlIHBhdGNoIGRlc2NyaXB0aW9uIGNhbiBiZToKClRoZSBzZWN0aW9uIDQuNS40
ICJTdXBlcnZpc29yIE1TSSBhZGRyZXNzIGNvbmZpZ3VyYXRpb24gKHNtc2lhZGRyY2ZnCmFuZCBz
bXNpYWRkcmNmZ2gpIiBvZiB0aGUgQUlBIHNwZWNpZmljYXRpb24gc3RhdGVzIHRoYXQ6CgoiSWYg
cmVnaXN0ZXIgbW1zaWFkZHJjZmdoIG9mIHRoZSBkb21haW4gaGFzIGJpdCBMIHNldCB0byBvbmUs
IHRoZW4Kc21zaWFkZHJjZmcgYW5kIHNtc2lhZGRyY2ZnaCBhcmUgbG9ja2VkIGFzIHJlYWQtb25s
eSBhbG9uZ3NpZGUKbW1zaWFkZHJjZmcgYW5kIG1tc2lhZGRyY2ZnaC4iCgpJbiBvdGhlciB3b3Jk
cywgdGhlIEwgYml0IGlzIG5vdCBkZWZpbmVkIGZvciBzbXNpYWRkcmNmZ1toXSByZWdpc3RlcnMK
c28gZml4IGFwbGljX3dyaXRlbF9tc2ljZmcoKSBhY2NvcmRpbmdseS4KCj4KPiBTaWduZWQtb2Zm
LWJ5OiBZYW5nIEppYWxvbmcgPHpfYmFqZWVyQHllYWgubmV0Pgo+IC0tLQo+ICBsaWIvdXRpbHMv
aXJxY2hpcC9hcGxpYy5jIHwgMTEgKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvaXJx
Y2hpcC9hcGxpYy5jIGIvbGliL3V0aWxzL2lycWNoaXAvYXBsaWMuYwo+IGluZGV4IDcyOTA2ZDUu
LmU0YTI5YWUgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2lycWNoaXAvYXBsaWMuYwo+ICsrKyBi
L2xpYi91dGlscy9pcnFjaGlwL2FwbGljLmMKPiBAQCAtMTIxLDEwICsxMjEsNiBAQCBzdGF0aWMg
dm9pZCBhcGxpY193cml0ZWxfbXNpY2ZnKHN0cnVjdCBhcGxpY19tc2ljZmdfZGF0YSAqbXNpY2Zn
LAo+ICAgICAgICAgdTMyIHZhbDsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgYmFzZV9wcG47Cj4K
PiAtICAgICAgIC8qIENoZWNrIGlmIE1TSSBjb25maWcgaXMgYWxyZWFkeSBsb2NrZWQgKi8KPiAt
ICAgICAgIGlmIChyZWFkbChtc2ljZmdhZGRySCkgJiBBUExJQ194TVNJQ0ZHQUREUkhfTCkKPiAt
ICAgICAgICAgICAgICAgcmV0dXJuOwo+IC0KPiAgICAgICAgIC8qIENvbXB1dGUgdGhlIE1TSSBi
YXNlIFBQTiAqLwo+ICAgICAgICAgYmFzZV9wcG4gPSBtc2ljZmctPmJhc2VfYWRkciA+PiBBUExJ
Q194TVNJQ0ZHQUREUl9QUE5fU0hJRlQ7Cj4gICAgICAgICBiYXNlX3BwbiAmPSB+QVBMSUNfeE1T
SUNGR0FERFJfUFBOX0hBUlQobXNpY2ZnLT5saHhzKTsKPiBAQCAtMTY3LDcgKzE2Myw3IEBAIHN0
YXRpYyBpbnQgYXBsaWNfY2hlY2tfbXNpY2ZnKHN0cnVjdCBhcGxpY19tc2ljZmdfZGF0YSAqbXNp
Y2ZnKQo+Cj4gIGludCBhcGxpY19jb2xkX2lycWNoaXBfaW5pdChzdHJ1Y3QgYXBsaWNfZGF0YSAq
YXBsaWMpCj4gIHsKPiAtICAgICAgIGludCByYzsKPiArICAgICAgIGludCByYywgbG9ja2VkOwo+
ICAgICAgICAgdTMyIGksIGosIHRtcDsKPiAgICAgICAgIHN0cnVjdCBhcGxpY19kZWxlZ2F0ZV9k
YXRhICpkZWxlZzsKPiAgICAgICAgIHUzMiBmaXJzdF9kZWxlZ19pcnEsIGxhc3RfZGVsZWdfaXJx
Owo+IEBAIC0yNDcsMTIgKzI0MywxMyBAQCBpbnQgYXBsaWNfY29sZF9pcnFjaGlwX2luaXQoc3Ry
dWN0IGFwbGljX2RhdGEgKmFwbGljKQo+ICAgICAgICAgfQo+Cj4gICAgICAgICAvKiBNU0kgY29u
ZmlndXJhdGlvbiAqLwo+IC0gICAgICAgaWYgKGFwbGljLT50YXJnZXRzX21tb2RlICYmIGFwbGlj
LT5oYXNfbXNpY2ZnX21tb2RlKSB7Cj4gKyAgICAgICBsb2NrZWQgPSByZWFkbCgodm9pZCAqKShh
cGxpYy0+YWRkciArIEFQTElDX01NU0lDRkdBRERSSCkpICYgQVBMSUNfeE1TSUNGR0FERFJIX0w7
Cj4gKyAgICAgICBpZiAoYXBsaWMtPnRhcmdldHNfbW1vZGUgJiYgYXBsaWMtPmhhc19tc2ljZmdf
bW1vZGUgJiYgIWxvY2tlZCkgewo+ICAgICAgICAgICAgICAgICBhcGxpY193cml0ZWxfbXNpY2Zn
KCZhcGxpYy0+bXNpY2ZnX21tb2RlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KHZvaWQgKikoYXBsaWMtPmFkZHIgKyBBUExJQ19NTVNJQ0ZHQUREUiksCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAodm9pZCAqKShhcGxpYy0+YWRkciArIEFQTElDX01NU0lDRkdB
RERSSCkpOwo+ICAgICAgICAgfQo+IC0gICAgICAgaWYgKGFwbGljLT50YXJnZXRzX21tb2RlICYm
IGFwbGljLT5oYXNfbXNpY2ZnX3Ntb2RlKSB7Cj4gKyAgICAgICBpZiAoYXBsaWMtPnRhcmdldHNf
bW1vZGUgJiYgYXBsaWMtPmhhc19tc2ljZmdfc21vZGUgJiYgIWxvY2tlZCkgewo+ICAgICAgICAg
ICAgICAgICBhcGxpY193cml0ZWxfbXNpY2ZnKCZhcGxpYy0+bXNpY2ZnX3Ntb2RlLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQgKikoYXBsaWMtPmFkZHIgKyBBUExJQ19T
TVNJQ0ZHQUREUiksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKShh
cGxpYy0+YWRkciArIEFQTElDX1NNU0lDRkdBRERSSCkpOwo+IC0tCj4gMi4zNC4xCj4KPgo+IC0t
Cj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCk90aGVy
d2lzZSBpdCBsb29rcyBnb29kIHRvIG1lLiBJIGhhdmUgdGFrZW4gY2FyZSBvZgp0aGUgYWJvdmUg
Y29tbWVudHMgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZyB0aGlzIHBhdGNoLgoKUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8g
dGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
