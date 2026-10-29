Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902B3606A31A
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 06:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IOTrjTak;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=AuopYuFq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YYrBhptZHFTNcUQc6r1RzgThOTkVAxPhOwM/Tu/Zb6s=; b=IOTrjTakVQ4fsevFl/NvSYuQbw
	PX/hVqj5q+Gi02nrBADBBLohTNEdFoJQiNcFGc0l1AZ9l1AjoC+9Xe1pCKSDd7hw+hZx3fn6eMyi5
	7KIu75u9TfHD2ttA5tU2/1IaRQ8iuYClzMZbWTZLBAYCG0Pn9e1W4ep3FTlUF5CtBiLjszpH6pLhJ
	l9M3fLXIXEl/EIMOAG66RHZrOSccVA2x8smKI+35PusLn0DdEOeYbnXoM6p10hpXBBYRb8/D0C/lH
	3lLhpMiNJfWm7awXntem4N44dvUL8to1rBwLcWnIkpucpxS1xdGCdyIeZsEiBfjVozXHcn+GgbHfC
	MMaasG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJKd-00000008R5s-0lUx;
	Thu, 29 Oct 2026 06:09:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJKZ-00000008R5A-2nBS
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 06:09:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11655105e9.1
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 23:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793254181; cv=none;
        d=google.com; s=arc-20260327;
        b=O3nICDRRl8Zqc24Y/O8iRLsEfROrepo7CMJUCvwoHdi6iSnS/Vv84QR16sn70XDRez
         XPFiUc1e3b/LLrYfcRzBlOFEOOynKUZoZY+wrrxCfQVs8AvH7iOF+edwzXtsK3jR569K
         9E8CRj2VgQomtfqDDq6Ok5o4pp5J0xknsurscxM2Es+h6tJaLOiyyuB/MU3/kEk8Arx4
         6JNd+ApboqF9u54nInyBaw53FicXY+OVj95C2pUvcd4/VNNZtPkFWXnw1v4V1CPqkIpz
         r/pv8Zv9Txgr2iTNWpCwD2rcswbUkMgMLUTForWEdOTcIwdPp/5+TzhYZPPVj6c9VPM+
         2aKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HhyZop7x3A3rr4RN2E/JF3BFWCWsDpnNQLPTToKlZw0=;
        fh=3qlhr567k4LlZV5QtnlkuDmEciJLcJw44EndeuDHPPE=;
        b=YmtzU1/VZ2PC4d38zJJ1LNDCHzQnn7NEs7ZUVrAc8l7fSFVBlkmCH88Rbk44cStAUG
         rudOS6wDGHROAxy39BaWEMfyu0ooYsb9BBJdj36AHlyN5DK+69YmfvjC5HHKUPTBUAxq
         +AvKKozg0vsJABg7s72j28tlKIRUVnyoXDQSPoMeV7IQLQfRqWm1TyH9vpgxJUbTy9Js
         zJKp5x400+j6cch0BMD2TkiPEP+65/NhJS4YxDTWsQN4P0rIjMyYdVKQabJUgUN1k8Vx
         Qlb+l7gR9FRu9dixTx9mmVDVioxZrf5C+VjCjp2njeVxbYjjj394VT4mAiqJbbIZP1IG
         tkcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793254181; x=1793858981; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HhyZop7x3A3rr4RN2E/JF3BFWCWsDpnNQLPTToKlZw0=;
        b=AuopYuFqimNhetYwSKkEIv2pFR3G/C4BWJDk42pkGDoUa3O3+GD6kO8Lt7zf7PM33x
         kQ+Gt9idDSJ8pTj9IEv9CUUpF8KFFpm8M+swFNWP84svmtbidnXM2XJTBZ5dIGhZ0P14
         uwIRRU9CwO2DVKCw2fWbfvO6I6BPrzs89B6l5b9GZtuVf3u1TC6nOdE+rJeBOe5YDRX6
         tE/OxwBsRrSqWQrpiZ3g992Ws4w12JXRJ8LoM9SfAFIb4uMmLOwaLWtNvL9eX4xlS83/
         vicYOp949XVeKMGBvnf982FBYGsbA0Owsdhy2QfQA411I6hrN1INLp/prR3CB8v9BWoc
         +6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254181; x=1793858981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhyZop7x3A3rr4RN2E/JF3BFWCWsDpnNQLPTToKlZw0=;
        b=tI3HV6QlN71OlTM34UdsY0CPdtUwrv+xL4zzWyMepUKqgo2xZm5C8y0fZgAoQ/Xq4L
         LIMytp4XVLAkKa+efc9eQLZbRPBwLBBd25UXKWBfXf7XeXkpWhemKH7H4M6SMRQsy3Pd
         NxXUzleD64ZOoCkrpnd+VuggNVMTqzMuhULwYt44tbjAREdMb6RLWc1MfEsmPlVF7lGW
         cVQ8jqM5mmkZF5VX8dzXapFS5c6N7A3uVH31oUci5eJCdfwMWx89K6sNcTFmXeLTteh/
         59+/DEEyWQeJFVGOtR1bNYCGVmIHv4Y/91UQiZIhyxwEKqQrdLuHegzOFesLHtB800sw
         Q7PQ==
X-Gm-Message-State: AFq9FYKkhamVGTLRloDqFChuztyT8hDszhbdSeTnqzIWOFmmb6AknFTu
	cMY+69XdWtFVPhSxletsDzRvm4h4X8s4AUvkNYcBVomtERfBKA3LBCUGQ2wiiEi3fsBCk5NsBCU
	Qc3IMsAHg6KQEZzZh8cR+rK75iSrtYnVxh25BvxAuLQ==
X-Gm-Gg: AYBFou272giMOI2JnSKMcncOOiHLMlGAyCqVsSRd3GZ9x5xSb57Mf6XUez5q2+KaB/V
	FLpOjMezHO+/9OoSqI09mUpvYVHbjX7epV9oUbPG5TfbPlj883ITf5qrHWADA5D++23FkA9F+wy
	vhu4ScSADCNZIBBhRVQVWyewetqZ24FsgLs8MUAEV4ggwoRKi8MDbov1agQeXMbIu9eglqA+jJ2
	kz0GYvPB4D6X0rAWfuIjGjUeQb39jQ+XJk2f1H3AwPb4HELHPhFuHx9+PMDmT9vP+V8f5yhKkAf
	OmIOqzOXGMrV6POivHtI5mLjLG/1MUriSZoT1+uMo++Nij56BgtY669vnLEs8JGMJsFL7ndVpfx
	ExMEwiwnX6X33ghxtC8sBgzIEoctuC1sJy6Cdhr8IhdSVHviIquSJxyrSbjSnXsz2M10c2mzJgn
	Eh9ncjpKRPLpw8chBX3udFOBy4B/SznkMBNFbPV7lyt8Wi9kgXBS5fX+Zm
X-Received: by 2002:a05:600c:3146:b0:4a2:fe11:9a8a with SMTP id
 5b1f17b1804b1-4a96552d0b9mr88931805e9.0.1793254181235; Wed, 28 Oct 2026
 23:09:41 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com> <20261028-spacemit-k3-v6-2-01d984f60941@linux.spacemit.com>
In-Reply-To: <20261028-spacemit-k3-v6-2-01d984f60941@linux.spacemit.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 11:39:29 +0530
X-Gm-Features: AclHuK_cUoFyV35AYjsJQTCM3JW0WkHU45-esDeApRBjf4xlPhMA_eC5isbzQns
Message-ID: <CAAhSdy1gCm_UnSghvQgq71VzeONzZWbGmGW9H1J+_h_2oKMOJw@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] platform: generic: spacemit: k1: rename cache
 flush operation
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org, Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
	Bo Gan <ganboing@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, E Shattow <e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_230943_728532_94BB08D9 
X-CRM114-Status: GOOD (  14.80  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgMjgsIDIwMjYgYXQgNjoyNuKAr1BNIFRyb3kgTWl0Y2hlbGwKPHRyb3kubWl0
Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IEZyb206IFhpYW5iaW4gWmh1IDx4
aWFuYmluLnpodUBsaW51eC5zcGFjZW1pdC5jb20+Cj4KPiBNUkFPUF9JQ0FDSEVfSU5WQUxJRCBp
cyB1c2VkIHRvIGZsdXNoIHRoZSBsb2NhbCBELWNhY2hlIGJlZm9yZSBhIGhhcnQKPiBzdG9wcywg
c28gdGhlIG5hbWUgaW5jb3JyZWN0bHkgZGVzY3JpYmVzIEktY2FjaGUgaW52YWxpZGF0aW9uLiBS
ZW5hbWUKPiBpdCB0byBNUkFPUF9DQUNIRV9GTFVTSCB3aXRob3V0IGNoYW5naW5nIGl0cyBlbmNv
ZGVkIHZhbHVlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhbmJpbiBaaHUgPHhpYW5iaW4uemh1QGxp
bnV4LnNwYWNlbWl0LmNvbT4KPiBSZXZpZXdlZC1ieTogRSBTaGF0dG93IDxlQGZyZWVzaGVsbC5k
ZT4KPiBDby1kZXZlbG9wZWQtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXgu
c3BhY2VtaXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hl
bGxAbGludXguc3BhY2VtaXQuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVu
c2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGxpYi91dGlscy9oc20vZmR0X2hzbV9z
cGFjZW1pdC5jICAgICAgIHwgMiArLQo+ICBwbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvc3BhY2Vt
aXQvazEuaCB8IDMgKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9oc20vZmR0X2hzbV9zcGFjZW1p
dC5jIGIvbGliL3V0aWxzL2hzbS9mZHRfaHNtX3NwYWNlbWl0LmMKPiBpbmRleCA4NjhlNDliZi4u
OTljNTIzMzUgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2hzbS9mZHRfaHNtX3NwYWNlbWl0LmMK
PiArKysgYi9saWIvdXRpbHMvaHNtL2ZkdF9oc21fc3BhY2VtaXQuYwo+IEBAIC05Miw3ICs5Miw3
IEBAIHN0YXRpYyBpbnQgc3BhY2VtaXRfaGFydF9zdG9wKHZvaWQpCj4gICAgICAgICBhc20gdm9s
YXRpbGUgKCJmZW5jZSBpb3J3LCBpb3J3Iik7Cj4KPiAgICAgICAgIC8qIGZsdXNoIGxvY2FsIGRj
YWNoZSAqLwo+IC0gICAgICAgY3NyX3dyaXRlKENTUl9NUkFPUCwgTVJBT1BfSUNBQ0hFX0lOVkFM
SUQpOwo+ICsgICAgICAgY3NyX3dyaXRlKENTUl9NUkFPUCwgTVJBT1BfQ0FDSEVfRkxVU0gpOwo+
ICAgICAgICAgYXNtIHZvbGF0aWxlICgiZmVuY2UgaW9ydywgaW9ydyIpOwo+Cj4gICAgICAgICAv
KiBkaXNhYmxlIGRjYWNoZSAqLwo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL2luY2x1
ZGUvc3BhY2VtaXQvazEuaCBiL3BsYXRmb3JtL2dlbmVyaWMvaW5jbHVkZS9zcGFjZW1pdC9rMS5o
Cj4gaW5kZXggNzA5NWJjMDguLjhkNGY1MzQ0IDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVy
aWMvaW5jbHVkZS9zcGFjZW1pdC9rMS5oCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRl
L3NwYWNlbWl0L2sxLmgKPiBAQCAtMjAsOCArMjAsNyBAQAo+ICAvKiBFQ0MgZW5hYmxlICovCj4g
ICNkZWZpbmUgTVNFVFVQX0VDQ0UgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDE2KQo+
Cj4gLS8qIGljYWNoZSBpbnZhbGlkYXRpb24gKi8KPiAtI2RlZmluZSBNUkFPUF9JQ0FDSEVfSU5W
QUxJRCAgICAgICAgICAgICAgICAgICBHRU5NQVNLKDEsIDApCj4gKyNkZWZpbmUgTVJBT1BfQ0FD
SEVfRkxVU0ggICAgICAgICAgICAgICAgICAgICAgR0VOTUFTSygxLCAwKQo+Cj4gICNkZWZpbmUg
UE1VX0FQX0JBU0UgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHhkNDI4MjgwMAo+Cj4KPiAt
LQo+IDIuNTUuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
