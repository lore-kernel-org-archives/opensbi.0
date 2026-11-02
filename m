Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD1606A324
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 08:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c9xvV3+O;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=S+eRvDN2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vwj8zcaJqjtw4WmbV//PT3Bg2JBTwjr4RSF94ahVUoQ=; b=c9xvV3+OG38D7N4196zdGrNfla
	JVSxSUasaV0nM1oQeEgFc8nBvmq4syp7IwFS7cZPIdwcSoEC6sxzXOXlt7H/zwYVkgNqP7kn41YJx
	38X1NYsfHtZ78eaN3fmhxWE4HJQlgAEGtqycln3QDRePClRlxDcw7MuqDyiiYOUw2LC8h7dP3YavC
	/NXBJgtnQQDZU8/A8Zl2MLFfLXSWqPgmUqWRplhu/Z2z0uCOXmaC4z82lkfg1djaq6NMhpusw3NBB
	CAaseYtuR3WvMsFJjL9MaV3I9jJq0GXrZO8wIjWdMX14hUHiuQ0hfv1gwxnIyWn1HtDQLL3SoBlfq
	l/fj4rwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmyc-0000000Fogx-2kuG;
	Mon, 02 Nov 2026 08:01:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmya-0000000Fog2-0fJ9
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 08:01:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1177749f8f.0
        for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 00:01:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793606466; cv=none;
        d=google.com; s=arc-20260327;
        b=oia4RclotSneDwCeX/OAMmgdMYghgAWIfxGs8HlisVloc2yRfbA+gByrKI55czYoFd
         Qr07v+PdTSAltkR3KsLk3LKpyDqwjVjsy5is2s3pcdmTfG4xtqsb409xpZcXQZ3RVLDQ
         24UseUyuXAJwUneDdJiWAj63BVyqeYiN0Xa5PvNQdg6cZSi8qxP0frkHfLEOQNvh+lB5
         Hyg/xOgE7TQqjZdOfc/sZ0rnWkXxps03qocv/FozTWS48C7Rp84GWR0/aTU9wUEwRh9T
         BW55025xLVvLBzfL264COyFhKAkYNotB2JzMr0Fk6Ktqj/omjfP8cL/w2otmwRoh3cay
         uLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t1jQ4ecbrJHenr18SjbT0akgLQkp/jNomCqdsDqEbsI=;
        fh=rtgYsjNJP2CHZRnKwDNwHxdOZV0/EpD9dAm6201duhs=;
        b=Q5eQR8TReMn2aEevtvJX4TaHM+wxD5tAjSu1SzZ/P7CYwi4CFkxSAhE17pUHI91b0k
         mz2KwWG602XBtfkSdIgzJMh7XTS+G87uYlVd9ZL8u3IjWc3jDCf8HagnMfiZ7FV8BIWm
         UfRCv16oMUyREtxzrMNsfMpGVF8/WqZ3iv2GAhKbUa3TaloaVY1QxGYfrREt5ahC1vQx
         UZFcUTV0uQi1zAhbUJwITmIc+uIvwtOl8RokNCIAsDvBRp8RPgSthHTdS36poJHjjQH/
         nFEvNPm1aoZ4kabmoK7Vlgc3tdXD7PXZjcX/5WlpCrzKq0EHmHYCFJIRhHp9Ve8N5FjK
         5PFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793606466; x=1794211266; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t1jQ4ecbrJHenr18SjbT0akgLQkp/jNomCqdsDqEbsI=;
        b=S+eRvDN2z1l/qfeHvlzcCByvWbMq5QvxIXmcQZrLvYnubKYKrGP3SbYlkrDFr9CPUf
         +T1/FWmEEOlBY07vbxsf9wGDiLxBlFnawyQLjN9Tkb4KKJifwOgf5G+TmIuMnbQcoHSI
         l9KPd6BtK6F4usbzZRD4VCKExbQ9MG9EQPSLxwfVYPLcYofE8yey2nhXousqYYxtCSwk
         yJg8TnztF9HR+kVTmEM4N0uEcaqrDF7CRUtmdz1w8JBAFbaCh7R682/iTwlcXgDPTvUg
         fCsrqwzYS3RE6PBIklogY+pIkCHziS2wLzEX8fj7v0jpaxC1ZBJwBJznx/ZpUi7X/U3l
         eOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606466; x=1794211266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1jQ4ecbrJHenr18SjbT0akgLQkp/jNomCqdsDqEbsI=;
        b=GS5oiQZ6/9FTvk9EqSZyNvwYX3ztXE7g6IYm2WcirtVrmOQ+ISjEyOeyt7nkJ8NK7g
         KJ2WOIuYEc00KIkO5Dn52S7oYieblIIHxOMWiGi6eo3S9ZGYnL/haPcE/Kn2XU+cUsJW
         kPJhKPCm4Jcf7Icd/jsOsv9VEAsIe+SUHBtHH3gQcRbiQHkAa/hz2QGGsldiVsdDARUQ
         SSOgJR+FmmP8YI8tH4uj6oVmyJp2vet8RJV11dbLuYgLRDAlrOGw7zKKFm7ma6oLygmD
         jWHXOXnaL+jNCfQU0lAyECvmUt34LrUDGbk1174khYUhuDUdIDKqOthrA3zS2JZkNSV7
         9UTw==
X-Gm-Message-State: APuU4Z9aGjmZ9W78tLMVxIiLvTF6gT7WTfDebq1YSwYi9KMhUmkFluVX
	AJUveYIZaJSGYT+yvLUIn22xHz2lEzZ5tBJTTAaech703cQRtNYLOnJo+wXBfgqZta8jgPUDov+
	Cd/2gPWIOv0c+xkfRvn2iTe7KTEPUx7vI+1yGGyu2tlCI/mgcaXGy
X-Gm-Gg: AYBFou1l2E1vQZGg92Xx9eN4LRSfb2vWtPYfW9+Rosucpba4TIIxslV2hrunhIZJWqa
	Y8V5RC/oHc+xS95Vq9EIZwsVHKgNbAFur6H5gBpdn4NftATS+nQBfXCx4UaGi/8BZEYt9LIFMzb
	7gTucAix8f79f2UzwKMgwGEJgnJ9o/dpl1le/B9C2AdLsgV6TccZoqOky9vhS/h5ngt27jtZrZp
	RErGbXAptGPdk6GvhOxlQTwcSGBRmN4vEsFs+A3s3XhXTusjLmrfJmnuNDcsHV06I2XkUkv5wLw
	NMr3ie1AzIcPi/crUZ0kSkuQBF/y0s3dCX1XlxrK2OLb1VuAPZzUhjyQ+Yzosf7uuOjq8eCN+Bt
	uoSHblP9VGycFb3gUKPMt6ICe8yNrTSfipU1irxO62n0ivtS9eGP2DRaoVMeYY7AV5XmHB8AOqu
	8KRppmqnfXTjsqd3gpx3R0bAcV4VmjES+MbvWu04YJ8EBhvrMCN3vLKPkA
X-Received: by 2002:a5d:64e7:0:b0:48e:17d1:16c9 with SMTP id
 ffacd0b85a97d-48e6e4f5652mr18537663f8f.40.1793606464959; Mon, 02 Nov 2026
 00:01:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <SY8P300MB00410B44E7D55CB5CF7B276AB5882@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
In-Reply-To: <SY8P300MB00410B44E7D55CB5CF7B276AB5882@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Nov 2026 13:30:52 +0530
X-Gm-Features: AclHuK8PT0xoh7jcJvVpTJAIzggt1p1ePKUXrN2SfvfSMxy3lFUy8FUp-HgzB5k
Message-ID: <CAAhSdy3b=C2XiHSG5TD7zmRHb+FCBBPw07Zxt6=3p7sJNYYZhQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: fix mapping reset for already stopped counters
To: Fengwei Tan <tfx2001@outlook.com>
Cc: opensbi@lists.infradead.org, 
	"David E. Garcia Porras" <david.garcia@aheadcomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_000108_233906_586EEC48 
X-CRM114-Status: GOOD (  24.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA4OjQ44oCvUE0gRmVuZ3dlaSBUYW4gPHRmeDIwMDFAb3V0
bG9vay5jb20+IHdyb3RlOgo+Cj4gTGludXggc3RvcHMgYSBjb3VudGVyIGJlZm9yZSBpc3N1aW5n
IGFub3RoZXIgc3RvcCB3aXRoIFJFU0VUIGZsYWcgd2hlbgo+IGRlbGV0aW5nIGFuIGV2ZW50IFsx
XS4gUmV0dXJuaW5nIGVhcmx5IG9uIFNCSV9FQUxSRUFEWV9TVE9QUEVEIHNraXBzCj4gY291bnRl
ci10by1ldmVudCBtYXBwaW5nIHJlc2V0LCBldmVudHVhbGx5IGV4aGF1c3RpbmcgdGhlIGhhcmR3
YXJlCj4gY291bnRlcnMuCj4KPiBDb250aW51ZSB0aGUgc3RvcCBhbmQgcmVzZXQgcHJvY2VzcyBm
b3IgdGhlIHJlbWFpbmluZyBjb3VudGVycyB3aGVuIGEKPiBjb3VudGVyIGluIHRoZSBzZXQgaXMg
YWxyZWFkeSBzdG9wcGVkLiBQcmVzZXJ2ZSBTQklfRUFMUkVBRFlfU1RPUFBFRCBpbgo+IHRoZSBm
aW5hbCByZXN1bHQsIHdoaWxlIHN0aWxsIHJldHVybmluZyBpbW1lZGlhdGVseSBvbiBvdGhlciBl
cnJvcnMuCj4KPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jP2lk
PTcyZDNmY2Y4MDJjNDVkMDBiMzAwZjI1Yjg0OGE5M2MzYTJiZDdjN2UjbjMxOAo+Cj4gRml4ZXM6
IGM1MDc3ZDQ5N2QwZiAoImxpYjogc2JpX3BtdTogRml4IGNvdW50ZXIgYW5kIGV2ZW50IGluZm8g
ZXJyb3IgY29kZXMgYXMgcGVyIFNCSSB2My4wIHNwZWMiKQo+IFNpZ25lZC1vZmYtYnk6IEZlbmd3
ZWkgVGFuIDx0ZngyMDAxQG91dGxvb2suY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNj
di9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCgo+IC0tLQo+IFRoaXMgcGF0Y2ggZml4ZXMg
YSByZWdyZXNzaW9uIGludHJvZHVjZWQgYnkgYzUwNzdkNDk3ZDBmICgibGliOiBzYmlfcG11Ogo+
IEZpeCBjb3VudGVyIGFuZCBldmVudCBpbmZvIGVycm9yIGNvZGVzIGFzIHBlciBTQkkgdjMuMCBz
cGVjIiksIHdoZXJlIHRoZQo+IGNvdW50ZXItdG8tZXZlbnQgbWFwcGluZyByZXNldCBpcyBza2lw
cGVkIGlmIGEgY291bnRlciBpbiB0aGUgc2V0IGlzCj4gYWxyZWFkeSBzdG9wcGVkLiBUaGlzIGV2
ZW50dWFsbHkgZXhoYXVzdHMgdGhlIGhhcmR3YXJlIGNvdW50ZXJzLgo+Cj4gVGhlIHNiaV9wbXVf
Y3RyX3N0YXJ0KCkgcGF0aCBpcyBsZWZ0IHVuY2hhbmdlZCBhcyBpdCBkb2Vzbid0IHNlZW0gdG8g
aGl0Cj4gYW55IGlzc3VlLCBidXQgcGxlYXNlIGxldCBtZSBrbm93IGlmIEkgbWlzc2VkIGFueXRo
aW5nIGFuZCBJIHdpbGwgZm9sbG93Cj4gdXAgd2l0aCBhIHYyLgo+IC0tLQo+ICBsaWIvc2JpL3Ni
aV9wbXUuYyB8IDEwICsrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3BtdS5jIGIvbGli
L3NiaS9zYmlfcG11LmMKPiBpbmRleCBiNGFiZmExZS4uZmJjNjZlMmIgMTAwNjQ0Cj4gLS0tIGEv
bGliL3NiaS9zYmlfcG11LmMKPiArKysgYi9saWIvc2JpL3NiaV9wbXUuYwo+IEBAIC02OTYsNiAr
Njk2LDcgQEAgaW50IHNiaV9wbXVfY3RyX3N0b3AodW5zaWduZWQgbG9uZyBjYmFzZSwgdW5zaWdu
ZWQgbG9uZyBjbWFzaywKPiAgICAgICAgIGludCBldmVudF9pZHhfdHlwZTsKPiAgICAgICAgIHVp
bnQzMl90IGV2ZW50X2NvZGU7Cj4gICAgICAgICBpbnQgaSwgY2lkeDsKPiArICAgICAgIGJvb2wg
YW55X2FscmVhZHlfc3RvcHBlZCA9IGZhbHNlOwo+Cj4gICAgICAgICBpZiAoIXBtdV9jdHJfaWR4
X3ZhbGlkYXRlKGNiYXNlLCBjbWFzaykpCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
QEAgLTcxOCw4ICs3MTksMTEgQEAgaW50IHNiaV9wbXVfY3RyX3N0b3AodW5zaWduZWQgbG9uZyBj
YmFzZSwgdW5zaWduZWQgbG9uZyBjbWFzaywKPiAgICAgICAgICAgICAgICAgZWxzZQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldCA9IHBtdV9jdHJfc3RvcF9odyhjaWR4KTsKPgo+IC0gICAg
ICAgICAgICAgICBpZihyZXQpCj4gKyAgICAgICAgICAgICAgIGlmIChyZXQgPT0gU0JJX0VBTFJF
QURZX1NUT1BQRUQpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBhbnlfYWxyZWFkeV9zdG9w
cGVkID0gdHJ1ZTsKPiArICAgICAgICAgICAgICAgfSBlbHNlIGlmIChyZXQpIHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgICAgICAgICB9Cj4KPiAgICAg
ICAgICAgICAgICAgaWYgKGNpZHggPiAoQ1NSX0lOU1RSRVQgLSBDU1JfQ1lDTEUpICYmIGZsYWcg
JiBTQklfUE1VX1NUT1BfRkxBR19SRVNFVCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBo
cy0+YWN0aXZlX2V2ZW50c1tjaWR4XSA9IFNCSV9QTVVfRVZFTlRfSURYX0lOVkFMSUQ7Cj4gQEAg
LTczMSw2ICs3MzUsMTAgQEAgaW50IHNiaV9wbXVfY3RyX3N0b3AodW5zaWduZWQgbG9uZyBjYmFz
ZSwgdW5zaWduZWQgbG9uZyBjbWFzaywKPiAgICAgICAgIGlmIChwaHMtPnNzZV9lbmFibGVkKQo+
ICAgICAgICAgICAgICAgICBjc3JfY2xlYXIoQ1NSX01JUCwgc2JpX3BtdV9pcnFfbWFzaygpKTsK
Pgo+ICsgICAgICAgaWYgKCFyZXQgJiYgYW55X2FscmVhZHlfc3RvcHBlZCkgewo+ICsgICAgICAg
ICAgICAgICByZXQgPSBTQklfRUFMUkVBRFlfU1RPUFBFRDsKPiArICAgICAgIH0KPiArCj4gICAg
ICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPgo+IC0tLQo+IGJhc2UtY29tbWl0OiBhNTAyMTFlOTA4
YWY5MDE3ZjMxNjM2MWY4OWEwNGFkOTQ0NmNiMzMwCj4gY2hhbmdlLWlkOiAyMDI2MTAwMy1maXgt
cG11LWNvdW50ZXItcmVzZXQtZmFpbGVkLTc3N2U1ZDYyZDVkZQo+Cj4gQmVzdCByZWdhcmRzLAo+
IC0tCj4gRmVuZ3dlaSBUYW4gPHRmeDIwMDFAb3V0bG9vay5jb20+Cj4KCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
