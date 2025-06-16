Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47B4C71135
	for <opensbi@archiver.kernel.org>; Mon, 16 Jun 2025 06:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGmrPjhzU4ce0eTAVBKzyeE+apGoB7+9FuWwybJd/Nw=; b=MaUSCu4kU4l9t3
	hAgW5njJoqZ19pgITdzAL8zo+wDZgVi0r6NhkJATVPlpekg3wcY2tkURsycpOg3+yVSbf6dwWrKzY
	H6GaQi7GZNdYtSD9qJL7EwxqIGOb3th4XyzTeVgqstUY9/XUwsK+9JgutFKZIHum2853ARn7vkWDq
	uJM16kFQtHJJdu7+rBrWYwr8KXDkXdubaXx1DdybrJ8Un4JgfSzogKGdBFpn3KZYjJ2pR//j/DNPL
	8g/1VpwvUDV7usXIQDSPcR4NpD2T5QVeaV95vUN6O2c/U6Z+Mp7geopL9c1N0R3l2Ruw1nEPF1rDT
	mGqQ3wakIlB6BTBF1sSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR32N-00000003TtP-0QBD;
	Mon, 16 Jun 2025 06:09:43 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR32D-00000003Tsr-1ESS
	for opensbi@lists.infradead.org;
	Mon, 16 Jun 2025 06:09:34 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b2fc93728b2so3229356a12.0
        for <opensbi@lists.infradead.org>; Sun, 15 Jun 2025 23:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750054172; x=1750658972; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGiFOyJmyoYMYTfCVGWzV+kyp/gLugnM4ANcrHdRFis=;
        b=Ru+MRSK0iAHIn3CLifmyoArF6lUNXXY4yYUVb1al+wj2qSbcdWiPFlt2rITUIYCsDc
         Qz/6cYUELqdowUsE9JmhWcKHfTED48xDFtU6JYaVhYdhQ78EiJxGYNTfKUFecTuSeqQY
         H8ElVenVVHcrR1yB0q33jHxpiCXF61b+Eyqy3ckZlAgGgvj/aPU0xHAmkeVXDkp0hU7J
         ruQoNdfcHlsKZa1IEXWg9cNk/YxdZNG+0PGw7Zuv7NiGEVd+GwrlBaLkdcaMPlv937cG
         lRe/G91CSntj3GdhSxjRZTydbIGbG29Y5TJfkr67ShlwutbtDUSSj/C3WzuYecidXsjs
         7HHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750054172; x=1750658972;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGiFOyJmyoYMYTfCVGWzV+kyp/gLugnM4ANcrHdRFis=;
        b=bUz9AffBEatF5UxtYzjbCa3GWX3A67I0e4jtiqDAw6Gc52iwhkSJpQsWEdm6RzpwRF
         hNeWbrSqCWTK45MzVG9wSRkFl9DoXMiCr6ADZ/s4vL9tycQIqor/IsOCCtKFLNkSxlFq
         KrdIkM++sWIUD0hbEhgusce5WIC2EHXRhBA/VC5cbxly0sQcwVnuIl8CODCahbsJ3CjI
         yOvjUWhH0VcqF5byu0OE7RRXurvXgRtfk9a/bzbzwRpHV/odHYo5B0Sgj6otSLBP705r
         5dKbwU287WypZUlQGtvY9o9BOWytVAdRf/sJMvsP+nWsJOQOkqrb6UMZJ5Ui0zTP+XoB
         sPfw==
X-Gm-Message-State: AOJu0Yxq4VWZ5oN3EZA2yfay9VSUj/YQ6ucxePqwQxZ62mA9ZoZPgx/z
	PQNxN65Zy91kFkwhL0D8hy2oYaWWOwVPTg8i81IH27ceJyf4Y9NFjVvgfyP57LIGPnvCrblSn5D
	GXyVr
X-Gm-Gg: ASbGncsfn6L7zrHLEpayz/+5YYVvQwEE30lyWry4pAL2cKhT5HAeFtxljqi0vakszuO
	Iz5UylBj9vH55IPIoVWwTOpC9uMyxK4NKu9zXpmZwpKh3HO1NmCepKdVLhejeZoBRNsazSOtfXC
	3HlzyVCTtDiDlm7uINHSoUTeA0f7jrUkHMj3JIfoPlHyQ2GZ5uDtoELBZdMZ5LtF/8uUHanMFP6
	o5dcy+k2XevsHv9MFjG1CdLEwuC05GGDpzubHbxZKB9qofygric8KTA0CGbziKfaiw6ab9r0dAM
	DvedZAAxJ8WDx5wTGuHnwA72O66VW67Buz2WiPnoi642ccj9uI42KAVRbJbjm0eUumSkyUGhClT
	V9ynZ5iIgJyZMN5ZEm5V5
X-Google-Smtp-Source: AGHT+IGK4YqZ26AKF6PKYCLpOokJERL37mH9zVV2LV3zHMPgT1gjTkY0u5Ce7IOW15YjncQpxumXUw==
X-Received: by 2002:a17:90b:3d43:b0:313:d6d9:8891 with SMTP id 98e67ed59e1d1-313f1be1d48mr12126241a91.3.1750054172467;
        Sun, 15 Jun 2025 23:09:32 -0700 (PDT)
Received: from smtpclient.apple ([2405:201:d019:c0ce:5ca4:d79f:2a69:b0d3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b4993fsm7745046a91.30.2025.06.15.23.09.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Jun 2025 23:09:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] lib: sbi: Optimize saddr mapping in sbi_dbtr.c
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
In-Reply-To: <20250514051605.559791-1-wxjstz@126.com>
Date: Mon, 16 Jun 2025 11:39:19 +0530
Cc: opensbi@lists.infradead.org,
 Anup Patel <anup@brainfault.org>
Message-Id: <54FA5BFB-DA84-4E88-9BCC-0577F8DE214B@ventanamicro.com>
References: <20250514051605.559791-1-wxjstz@126.com>
To: Xiang W <wxjstz@126.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_230933_354818_51E25DC7 
X-CRM114-Status: GOOD (  15.21  )
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

Cgo+IE9uIDE0IE1heSAyMDI1LCBhdCAxMDo0NeKAr0FNLCBYaWFuZyBXIDx3eGpzdHpAMTI2LmNv
bT4gd3JvdGU6Cj4gCj4gVGhlIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uIG1hcHBlZCBzYWRkciBp
bmRpdmlkdWFsbHkgZm9yIGVhY2ggZW50cnkuCj4gVGhlIHVwZGF0ZWQgY29kZSBub3cgbWFwcyBz
YWRkciBmb3IgYWxsIGVudHJpZXMgaW4gYSBzaW5nbGUgb3BlcmF0aW9uLgo+IFRoaXMgY2hhbmdl
IHJlZHVjZXMgdGhlIG51bWJlciBvZiBQTVAgKFBoeXNpY2FsIE1lbW9yeSBQcm90ZWN0aW9uKQo+
IG9wZXJhdGlvbnMsIGltcHJvdmluZyBlZmZpY2llbmN5IGFuZCBwZXJmb3JtYW5jZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBYaWFuZyBXIDx3eGpzdHpAMTI2LmNvbT4KPiAtLS0KPiBsaWIvc2JpL3Ni
aV9kYnRyLmMgfCAxMyArKysrKystLS0tLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZGJ0ci5j
IGIvbGliL3NiaS9zYmlfZGJ0ci5jCj4gaW5kZXggZjBlOTEyODUuLjA2ZjZjZDllIDEwMDY0NAo+
IC0tLSBhL2xpYi9zYmkvc2JpX2RidHIuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RidHIuYwo+IEBA
IC01MjMsMTYgKzUyMywxNiBAQCBpbnQgc2JpX2RidHJfcmVhZF90cmlnKHVuc2lnbmVkIGxvbmcg
c21vZGUsCj4gCj4gc2htZW1fYmFzZSA9IGhhcnRfc2htZW1fYmFzZShocyk7Cj4gCj4gKyBzYmlf
aGFydF9tYXBfc2FkZHIoc2htZW1fYmFzZSwgdHJpZ19jb3VudCAqIHNpemVvZigqZW50cnkpKTsK
ClRoZXJlIGlzIGNvbXBpbGF0aW9uIHdhcm5pbmcgaGVyZS4gVGhlIHNobWVtX2Jhc2UgdmFyaWFi
bGUgaXMgdm9pZCAqIGFuZCBzYmlfaGFydF9tYXBfc2FkZHIgZXhwZWN0cwp1bnNpZ25lZCBsb25n
LgoKPiBmb3JfZWFjaF90cmlnX2VudHJ5KHNobWVtX2Jhc2UsIHRyaWdfY291bnQsIHR5cGVvZigq
ZW50cnkpLCBlbnRyeSkgewo+IC0gc2JpX2hhcnRfbWFwX3NhZGRyKCh1bnNpZ25lZCBsb25nKWVu
dHJ5LCBzaXplb2YoKmVudHJ5KSk7Cj4geG1pdCA9ICZlbnRyeS0+ZGF0YTsKPiB0cmlnID0gSU5E
RVhfVE9fVFJJR0dFUigoX2lkeCArIHRyaWdfaWR4X2Jhc2UpKTsKPiB4bWl0LT50c3RhdGUgPSBj
cHVfdG9fbGxlKHRyaWctPnN0YXRlKTsKPiB4bWl0LT50ZGF0YTEgPSBjcHVfdG9fbGxlKHRyaWct
PnRkYXRhMSk7Cj4geG1pdC0+dGRhdGEyID0gY3B1X3RvX2xsZSh0cmlnLT50ZGF0YTIpOwo+IHht
aXQtPnRkYXRhMyA9IGNwdV90b19sbGUodHJpZy0+dGRhdGEzKTsKPiAtIHNiaV9oYXJ0X3VubWFw
X3NhZGRyKCk7Cj4gfQo+ICsgc2JpX2hhcnRfdW5tYXBfc2FkZHIoKTsKPiAKPiByZXR1cm4gU0JJ
X1NVQ0NFU1M7Cj4gfQo+IEBAIC01NTYsMTAgKzU1NiwxMCBAQCBpbnQgc2JpX2RidHJfaW5zdGFs
bF90cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4gcmV0dXJuIFNCSV9FUlJfTk9fU0hNRU07Cj4g
Cj4gc2htZW1fYmFzZSA9IGhhcnRfc2htZW1fYmFzZShocyk7Cj4gKyBzYmlfaGFydF9tYXBfc2Fk
ZHIoc2htZW1fYmFzZSwgdHJpZ19jb3VudCAqIHNpemVvZigqZW50cnkpKTsKCmRpdHRvCgo+IAo+
IC8qIENoZWNrIHJlcXVlc3RlZCB0cmlnZ2VycyBjb25maWd1cmF0aW9uICovCj4gZm9yX2VhY2hf
dHJpZ19lbnRyeShzaG1lbV9iYXNlLCB0cmlnX2NvdW50LCB0eXBlb2YoKmVudHJ5KSwgZW50cnkp
IHsKPiAtIHNiaV9oYXJ0X21hcF9zYWRkcigodW5zaWduZWQgbG9uZyllbnRyeSwgc2l6ZW9mKCpl
bnRyeSkpOwo+IHJlY3YgPSAoc3RydWN0IHNiaV9kYnRyX2RhdGFfbXNnICopKCZlbnRyeS0+ZGF0
YSk7Cj4gY3RybCA9IHJlY3YtPnRkYXRhMTsKPiAKPiBAQCAtNTc0LDExICs1NzQsMTEgQEAgaW50
IHNiaV9kYnRyX2luc3RhbGxfdHJpZyh1bnNpZ25lZCBsb25nIHNtb2RlLAo+IHNiaV9oYXJ0X3Vu
bWFwX3NhZGRyKCk7Cj4gcmV0dXJuIFNCSV9FUlJfRkFJTEVEOwo+IH0KPiAtIHNiaV9oYXJ0X3Vu
bWFwX3NhZGRyKCk7Cj4gfQo+IAo+IGlmIChocy0+YXZhaWxhYmxlX3RyaWdzIDwgdHJpZ19jb3Vu
dCkgewo+ICpvdXQgPSBocy0+YXZhaWxhYmxlX3RyaWdzOwo+ICsgc2JpX2hhcnRfdW5tYXBfc2Fk
ZHIoKTsKPiByZXR1cm4gU0JJX0VSUl9GQUlMRUQ7Cj4gfQo+IAo+IEBAIC01OTAsMTYgKzU5MCwx
NSBAQCBpbnQgc2JpX2RidHJfaW5zdGFsbF90cmlnKHVuc2lnbmVkIGxvbmcgc21vZGUsCj4gKi8K
PiB0cmlnID0gc2JpX2FsbG9jX3RyaWdnZXIoKTsKPiAKPiAtIHNiaV9oYXJ0X21hcF9zYWRkcigo
dW5zaWduZWQgbG9uZyllbnRyeSwgc2l6ZW9mKCplbnRyeSkpOwo+IC0KPiByZWN2ID0gKHN0cnVj
dCBzYmlfZGJ0cl9kYXRhX21zZyAqKSgmZW50cnktPmRhdGEpOwo+IHhtaXQgPSAoc3RydWN0IHNi
aV9kYnRyX2lkX21zZyAqKSgmZW50cnktPmlkKTsKPiAKPiBkYnRyX3RyaWdnZXJfc2V0dXAodHJp
ZywgIHJlY3YpOwo+IGRidHJfdHJpZ2dlcl9lbmFibGUodHJpZyk7Cj4geG1pdC0+aWR4ID0gY3B1
X3RvX2xsZSh0cmlnLT5pbmRleCk7Cj4gLSBzYmlfaGFydF91bm1hcF9zYWRkcigpOwo+ICsKPiB9
Cj4gKyBzYmlfaGFydF91bm1hcF9zYWRkcigpOwo+IAo+IHJldHVybiBTQklfU1VDQ0VTUzsKPiB9
CkFzIHRoaXMgd2FybmluZyBleGlzdCBwcmlvciB0byB0aGUgcGF0Y2jigKYKClRlc3RlZC1ieTog
SGltYW5zaHUgQ2hhdWhhbiA8aGNoYXVoYW5AdmVudGFuYW1pY3JvLmNvbT4KUmV2aWV3ZWQtYnk6
IEhpbWFuc2h1IENoYXVoYW4gPGhjaGF1aGFuQHZlbnRhbmFtaWNyby5jb20+CgoKPiAtLSAKPiAy
LjQ3LjIKPiAKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
