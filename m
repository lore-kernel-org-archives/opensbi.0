Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB78CA5FA2
	for <opensbi@archiver.kernel.org>; Mon, 28 Sep 2026 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4EJ110xmzvOv0RDhAmSF9xXHCIrd9uievaN69k0Tv4=; b=tUI4tKC/f6Numy
	ByOJKPnubhVhFQMOzp+pmrMR847l6Bd8bu8TsqCboHcMGwkUJOhYoITfIWcuU7dwq2NK5tyEHjYKx
	rkye08U2NC47Me+QQZmGV+DFDcnq/uad6cF5VSdCJ9PT2DPSKyCkzTr2rn1LGn7iqUHbNXEZNsAl8
	FKCdsVXr8GU2P6doSLHE12/LnFaqMAY66XauTgvGRHOb8ivLouaH43eAoU6xm1UZFu8AVBCeiWjeV
	5PAz+yvHZpm7zVRjGUhNlYwgJjpKqVAyWy9f3q9AIZfKs24TP9Eid0Or7QuAt+sPCdpF28gP8KtVm
	6/qamq46uZadK5tgbL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBARl-00000000YBj-3MxF;
	Mon, 28 Sep 2026 12:27:05 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBARi-00000000YB7-0qh6
	for opensbi@lists.infradead.org;
	Mon, 28 Sep 2026 12:27:03 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d822dso22159345e9.2
        for <opensbi@lists.infradead.org>; Mon, 28 Sep 2026 05:27:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790598420; cv=none;
        d=google.com; s=arc-20260327;
        b=bMuYOZdOpUGQW7hm3ow8Cco4jnQj8RDT2578+QoRWXSMUbE+t9Y1pVpmwiCwgF9snZ
         pFSSFV5MyFDPpk6MrzJPu7FRHYcS1vXA5S8sI9pRb474ahZbu246VnS7smCttwtE6CoZ
         7RyQK9xOTcVtEN6fWkQ1JQac2WqjpD1C6y2AeVxBuxbJ/a/n6DSUAnrnxensX42aizrb
         sQrTTRdaXmkyo+svlQ7Bcda2wlimgDUJIjQbkOJn7N5LAOgBD7JLDyY1hNLKuuI+xX5r
         ZcnKmih2oLPE2fd5LddwRxv2NlSXdfu7UnqeKXbOC/sKOrxECpBiojFn2F0Ptm9Oc5cJ
         rb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfzUAR1fhKzwUPiF+dBsrOWh5+QzcfKAHkva1PpttKs=;
        fh=OGTb8KR6Eu4OCCYQmh/KvaBbySH77DqAVyVbwdmecyo=;
        b=A0gyqkRl3UMkVNTEPtWTo5JrVZduKmAOtWV+zpurwx+GF5oWGSSPjktICOMR/opEnt
         tJYIPgd1iIyh5RWDcuGUiot3xNNU3sEMtATycrjFfwHXlZmEwKEE98SHnvpHX9EYYAss
         xLo/EGjfUe5QikDkq7pBvIXL7xe+odXrNJk60D6JYJORYivS6sJCEo+oOMgrNwwn3nCq
         d4LmJb4vWuUak1O2uk6f/PNpxGJl9NxWv60z+InT1YF6TY8teXLTzglGW75Lwl97rU5B
         pBCq9SCceNgR5vmcNNGMObHmrWM2S2mMdqSjDyVHldZ9iAwVMKIlpNoFF3HNOpai6SuE
         GcXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790598420; x=1791203220; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfzUAR1fhKzwUPiF+dBsrOWh5+QzcfKAHkva1PpttKs=;
        b=CMr9jfyRU6PDnIzhWTD195SbwFJ2Tk02J/aGCxcIoorbN44OPJaot/U1xxMGICevqH
         JnZgvNhACwKmyhYlEmZso3PgSF+qVQS4MaDyptLF7jpwoouR5eTCCXHvU6josgF2r9gr
         A6AggFTrSCi7DICxzkfjz55iMRK+9XnpNd0oVO1raPfmj5enY2qt04+bwsQDKSgQaWCr
         3083DIawSqHVcy0b7KdNqPVv35MlzWgi2wnJcQ9osYGqEgNpCdvApgg7YK/qcsqoRPb7
         JxAco9pTy/9C3uKV3BOJeA9esGcqPCdRVSanPibynyoBJ9V3b1zpGgWlzoQleOaDhuxO
         +2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598420; x=1791203220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfzUAR1fhKzwUPiF+dBsrOWh5+QzcfKAHkva1PpttKs=;
        b=fxCVRDcKeOS5/Ry0m7IpBkgrG/ASKrUCEv68IfV0pHC68/a0oQCikAiGlRET3WICFb
         XkuZKbED+UyJYSKXkKXy+x3Ha9+ak6VDl+SYTKqsJTBBpDmMnimKCDc8sULTvYO+QgMk
         etV1ladXa6CFP123WWhaRI67CXiRRSLR/uTcrUHGuCw64Ua0uj5EgUzNRmetXaIWaS0Y
         Q4AgosOTrd9MPnjJ+v3E5MoD4JlqOdnoafcfJWdL2yd4gVOClBe2Fbm05vm9mGN6elvO
         lr+NJqdIFZlNUwCLKnwxX01mfXagdMXL8mnQqblIMIc93LTU4OE8ctpxMMnHHrfJqNnQ
         Drew==
X-Gm-Message-State: AFuF++niOCvMf0ewxvC47CltlaNvLgy3KrvI97ukEbUaKrgzJ2sXo24P
	5yGx91hKQoe4bM7GS5TzgdoIBNDhxAkRwlkeVRAWBvXaEQNjXVFDG6uMRiii14BCajJHsjKcp7J
	xyYgYn8+sAdmeT5t9xhZCFkNXwvjVJna0V11HqaYc9RZWrT+wiEag
X-Gm-Gg: AYBFou3s6KNGC37kOzyrP7APaaaPSgg2hzpq2uNdjUs1ccjRDBOnTCF80DkGGkTHkev
	3Jjy58ZZBAtZHbvcqj1ucTic0kibBUQ7kStxIdHPb7gle6yHaYhkdCZLvPQU/IPxHRk/cRSLWi4
	2auwLP51ViXhHazKeHaVIMrhi3uyHuw2hE0xcYnQI1GhvZkV32/wtN89mh6kf10RACQU9EMtjSs
	/ky6/+ynFeD3Qv+0KwXbWJHWAFgmdxjCMK/m+UjtTLE0EtgVJnlcbhcUWyRcTBgv3E1YxKDaH9G
	nl86TBVD6w52YmigeD8C8e7HjuM74FakaBamN9rTYf928+ghKfOB7A2VKf5uMvcHhtCg3YQhDto
	wcA5Rq3qO46q2qDHKUAXRQ0QkRO7PO6a7SBJv76DEJE7v5xqw+y5862EBhKczwYmRp197yCplUn
	RD
X-Received: by 2002:a05:600c:4ecb:b0:4a0:53e:b7bd with SMTP id
 5b1f17b1804b1-4a0053eb938mr38172475e9.18.1790598419606; Mon, 28 Sep 2026
 05:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_14AA3BA0083001905C262A5CD64E442FC205@qq.com>
In-Reply-To: <tencent_14AA3BA0083001905C262A5CD64E442FC205@qq.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Sep 2026 17:56:46 +0530
X-Gm-Features: AclHuK9NhPXurGtVDDyD0CAdKK0DM_J1cAPpQ9uc1z9oUiUJXSqlejYrC98EmQI
Message-ID: <CAAhSdy3SWBEJwVPfGO=P2jf5RZwuA1v7VTK6DETa5=ykN4dw3g@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_mpxy: Fix shared memory size rounding
To: Shibo Zhu <3499129952@qq.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_052702_288611_1BD64AE9 
X-CRM114-Status: GOOD (  26.90  )
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgOToyNeKAr1BNIFNoaWJvIFpodSA8MzQ5OTEyOTk1MkBx
cS5jb20+IHdyb3RlOgo+Cj4gc2JpX21weHlfcmVnaXN0ZXJfY2hhbm5lbCgpIGN1cnJlbnRseSBw
ZXJmb3JtcyBjZWlsaW5nIGRpdmlzaW9uIGJ5Cj4gUEFHRV9TSVpFIGJ1dCBzdG9yZXMgdGhlIHJl
c3VsdGluZyBwYWdlIGNvdW50IGluIG1weHlfc2htZW1fc2l6ZS4gQWxsCj4gY29uc3VtZXJzIGlu
dGVycHJldCBtcHh5X3NobWVtX3NpemUgYXMgYSBieXRlIGNvdW50LCBzbyBjaGFubmVscyByZXF1
aXJpbmcKPiBtb3JlIHRoYW4gb25lIHBhZ2UgcHJvZHVjZSBhbiB1bmRlcnNpemVkIHNoYXJlZCBt
ZW1vcnkgdmFsdWUuCj4KPiBVc2UgUk9VTkRVUCgpIHRvIGtlZXAgdGhlIHJvdW5kZWQgdmFsdWUg
aW4gYnl0ZXMuIEFkZCBTQklVbml0IGNvdmVyYWdlIGZvcgo+IHBhZ2UgYm91bmRhcmllcyBhbmQg
ZW5zdXJlIHNtYWxsZXIgY2hhbm5lbHMgZG8gbm90IHJlZHVjZSB0aGUgc2hhcmVkIG1lbW9yeQo+
IHNpemUuCgpUaGUgU0JJVW5pdCB0ZXN0IGZvciBNUFhZIHNob3VsZCBiZSBhIHNlcGFyYXRlIHBh
dGNoLiBJIHdpbGwgZHJvcCB0aG9zZSBjaGFuZ2VzCmF0IHRoZSB0aW1lIG9mIG1lcmdpbmcgc28g
c2VuZCBhIHNlcGFyYXRlIHBhdGNoLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVw
by4KClRoYW5rcywKQW51cAoKPgo+IEZpeGVzOiBlYzA5OTE4NDI2YTUgKCJsaWI6IHNiaTogVXBk
YXRlIE1QWFkgZnJhbWV3b3JrIGFuZCBTQkkgZXh0ZW5zaW9uIGFzIHBlciBsYXRlc3Qgc3BlYyIp
Cj4gU2lnbmVkLW9mZi1ieTogU2hpYm8gWmh1IDwzNDk5MTI5OTUyQHFxLmNvbT4KPiAtLS0KPiAg
bGliL3NiaS9zYmlfbXB4eS5jICAgICAgICAgICAgfCAgOCArKystLQo+ICBsaWIvc2JpL3Rlc3Rz
L29iamVjdHMubWsgICAgICB8ICAyICsrCj4gIGxpYi9zYmkvdGVzdHMvc2JpX21weHlfdGVzdC5j
IHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFu
Z2VkLCA3MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgbGliL3NiaS90ZXN0cy9zYmlfbXB4eV90ZXN0LmMKPgo+IGRpZmYgLS1naXQgYS9saWIvc2Jp
L3NiaV9tcHh5LmMgYi9saWIvc2JpL3NiaV9tcHh5LmMKPiBpbmRleCAxOWY1OWYzYS4uZWQwZTc4
MDcgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfbXB4eS5jCj4gKysrIGIvbGliL3NiaS9zYmlf
bXB4eS5jCj4gQEAgLTI1Nyw4ICsyNTcsOCBAQCBpbnQgc2JpX21weHlfcmVnaXN0ZXJfY2hhbm5l
bChzdHJ1Y3Qgc2JpX21weHlfY2hhbm5lbCAqY2hhbm5lbCkKPgo+ICAgICAgICAgLyogVXBkYXRl
IHNoYXJlZCBtZW1vcnkgc2l6ZSBpZiByZXF1aXJlZCAqLwo+ICAgICAgICAgaWYgKG1weHlfc2ht
ZW1fc2l6ZSA8IGNoYW5uZWwtPmF0dHJzLm1zZ19kYXRhX21heGxlbikgewo+IC0gICAgICAgICAg
ICAgICBtcHh5X3NobWVtX3NpemUgPSBjaGFubmVsLT5hdHRycy5tc2dfZGF0YV9tYXhsZW47Cj4g
LSAgICAgICAgICAgICAgIG1weHlfc2htZW1fc2l6ZSA9IChtcHh5X3NobWVtX3NpemUgKyAoUEFH
RV9TSVpFIC0gMSkpIC8gUEFHRV9TSVpFOwo+ICsgICAgICAgICAgICAgICBtcHh5X3NobWVtX3Np
emUgPSBST1VORFVQKGNoYW5uZWwtPmF0dHJzLm1zZ19kYXRhX21heGxlbiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX1NJWkUpOwo+ICAgICAgICAgfQo+
Cj4gICAgICAgICBzYmlfbGlzdF9hZGRfdGFpbCgmY2hhbm5lbC0+aGVhZCwgJm1weHlfY2hhbm5l
bF9saXN0KTsKPiBAQCAtODAzLDMgKzgwMyw3IEBAIGludCBzYmlfbXB4eV9nZXRfbm90aWZpY2F0
aW9uX2V2ZW50cyh1MzIgY2hhbm5lbF9pZCwgdW5zaWduZWQgbG9uZyAqZXZlbnRzX2xlbikKPgo+
ICAgICAgICAgcmV0dXJuIFNCSV9TVUNDRVNTOwo+ICB9Cj4gKwo+ICsjaWZkZWYgQ09ORklHX1NC
SVVOSVQKPiArI2luY2x1ZGUgInRlc3RzL3NiaV9tcHh5X3Rlc3QuYyIKPiArI2VuZGlmCj4gZGlm
ZiAtLWdpdCBhL2xpYi9zYmkvdGVzdHMvb2JqZWN0cy5tayBiL2xpYi9zYmkvdGVzdHMvb2JqZWN0
cy5tawo+IGluZGV4IDQwYzQ0MWUxLi44ODhiNDQxMiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3Rl
c3RzL29iamVjdHMubWsKPiArKysgYi9saWIvc2JpL3Rlc3RzL29iamVjdHMubWsKPiBAQCAtMTks
NiArMTksOCBAQCBsaWJzYmktb2Jqcy0kKENPTkZJR19TQklVTklUKSArPSB0ZXN0cy9zYmlfbWF0
aF90ZXN0Lm8KPiAgY2FycmF5LXNiaV91bml0X3Rlc3RzLSQoQ09ORklHX1NCSVVOSVQpICs9IGVj
YWxsX3Rlc3Rfc3VpdGUKPiAgbGlic2JpLW9ianMtJChDT05GSUdfU0JJVU5JVCkgKz0gdGVzdHMv
c2JpX2VjYWxsX3Rlc3Qubwo+Cj4gK2NhcnJheS1zYmlfdW5pdF90ZXN0cy0kKENPTkZJR19TQklV
TklUKSArPSBtcHh5X3Rlc3Rfc3VpdGUKPiArCj4gIGNhcnJheS1zYmlfdW5pdF90ZXN0cy0kKENP
TkZJR19TQklVTklUKSArPSBiaXRvcHNfdGVzdF9zdWl0ZQo+ICBsaWJzYmktb2Jqcy0kKENPTkZJ
R19TQklVTklUKSArPSB0ZXN0cy9zYmlfYml0b3BzX3Rlc3Qubwo+Cj4gZGlmZiAtLWdpdCBhL2xp
Yi9zYmkvdGVzdHMvc2JpX21weHlfdGVzdC5jIGIvbGliL3NiaS90ZXN0cy9zYmlfbXB4eV90ZXN0
LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwLi5kOTY5NzViNAo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9saWIvc2JpL3Rlc3RzL3NiaV9tcHh5X3Rlc3QuYwo+IEBAIC0w
LDAgKzEsNjQgQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZSAq
Lwo+ICsKPiArI2luY2x1ZGUgPHNiaS9zYmlfdW5pdF90ZXN0Lmg+Cj4gKwo+ICtzdGF0aWMgdTMy
IG1weHlfdGVzdF91bnVzZWRfY2hhbm5lbF9pZCh2b2lkKQo+ICt7Cj4gKyAgICAgICB1MzIgY2hh
bm5lbF9pZCA9IDA7Cj4gKwo+ICsgICAgICAgd2hpbGUgKHNiaV9tcHh5X2ZpbmRfY2hhbm5lbF9h
bnkoY2hhbm5lbF9pZCkpCj4gKyAgICAgICAgICAgICAgIGNoYW5uZWxfaWQrKzsKPiArCj4gKyAg
ICAgICByZXR1cm4gY2hhbm5lbF9pZDsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbXB4eV9zaG1l
bV9zaXplX3Rlc3Qoc3RydWN0IHNiaXVuaXRfdGVzdF9jYXNlICp0ZXN0KQo+ICt7Cj4gKyAgICAg
ICBzdGF0aWMgY29uc3Qgc3RydWN0IHsKPiArICAgICAgICAgICAgICAgdTMyIG1zZ19kYXRhX21h
eGxlbjsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBleHBlY3RlZDsKPiArICAgICAg
IH0gY2FzZXNbXSA9IHsKPiArICAgICAgICAgICAgICAgeyA0MDk1LCBQQUdFX1NJWkUgfSwKPiAr
ICAgICAgICAgICAgICAgeyA0MDk2LCBQQUdFX1NJWkUgfSwKPiArICAgICAgICAgICAgICAgeyA0
MDk3LCAyICogUEFHRV9TSVpFIH0sCj4gKyAgICAgICAgICAgICAgIHsgODE5MiwgMiAqIFBBR0Vf
U0laRSB9LAo+ICsgICAgICAgICAgICAgICB7IDgxOTMsIDMgKiBQQUdFX1NJWkUgfSwKPiArICAg
ICAgIH07Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX21weHlfY2hhbm5lbCBjaGFubmVsc1thcnJheV9z
aXplKGNhc2VzKSArIDFdID0geyAwIH07Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHNhdmVkX3Np
emUgPSBtcHh5X3NobWVtX3NpemU7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHByZXZpb3VzID0g
UEFHRV9TSVpFOwo+ICsgICAgICAgdTMyIGk7Cj4gKwo+ICsgICAgICAgbXB4eV9zaG1lbV9zaXpl
ID0gUEFHRV9TSVpFOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBhcnJheV9zaXplKGNh
c2VzKTsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIGNoYW5uZWxzW2ldLmNoYW5uZWxfaWQgPSBt
cHh5X3Rlc3RfdW51c2VkX2NoYW5uZWxfaWQoKTsKPiArICAgICAgICAgICAgICAgY2hhbm5lbHNb
aV0ub3duZXJfZG9tYWluID0gc2JpX2RvbWFpbl90aGlzaGFydF9wdHIoKTsKPiArICAgICAgICAg
ICAgICAgY2hhbm5lbHNbaV0uYXR0cnMubXNnX2RhdGFfbWF4bGVuID0gY2FzZXNbaV0ubXNnX2Rh
dGFfbWF4bGVuOwo+ICsKPiArICAgICAgICAgICAgICAgU0JJVU5JVF9BU1NFUlRfRVEodGVzdCwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpX21weHlfcmVnaXN0ZXJfY2hh
bm5lbCgmY2hhbm5lbHNbaV0pLCBTQklfT0spOwo+ICsgICAgICAgICAgICAgICBTQklVTklUX0VY
UEVDVF9FUSh0ZXN0LCBzYmlfbXB4eV9nZXRfc2htZW1fc2l6ZSgpLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjYXNlc1tpXS5leHBlY3RlZCk7Cj4gKyAgICAgICAgICAgICAg
IFNCSVVOSVRfRVhQRUNUKHRlc3QsIHNiaV9tcHh5X2dldF9zaG1lbV9zaXplKCkgPj0gcHJldmlv
dXMpOwo+ICsgICAgICAgICAgICAgICBwcmV2aW91cyA9IHNiaV9tcHh5X2dldF9zaG1lbV9zaXpl
KCk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgLyogUmVnaXN0ZXJpbmcgYSBzbWFsbGVyIGNo
YW5uZWwgbXVzdCBub3QgZGVjcmVhc2UgdGhlIHNoYXJlZCBtZW1vcnkuICovCj4gKyAgICAgICBj
aGFubmVsc1tpXS5jaGFubmVsX2lkID0gbXB4eV90ZXN0X3VudXNlZF9jaGFubmVsX2lkKCk7Cj4g
KyAgICAgICBjaGFubmVsc1tpXS5vd25lcl9kb21haW4gPSBzYmlfZG9tYWluX3RoaXNoYXJ0X3B0
cigpOwo+ICsgICAgICAgY2hhbm5lbHNbaV0uYXR0cnMubXNnX2RhdGFfbWF4bGVuID0gNDA5NTsK
PiArICAgICAgIFNCSVVOSVRfQVNTRVJUX0VRKHRlc3QsIHNiaV9tcHh5X3JlZ2lzdGVyX2NoYW5u
ZWwoJmNoYW5uZWxzW2ldKSwgU0JJX09LKTsKPiArICAgICAgIFNCSVVOSVRfRVhQRUNUX0VRKHRl
c3QsIHNiaV9tcHh5X2dldF9zaG1lbV9zaXplKCksIHByZXZpb3VzKTsKPiArCj4gKyAgICAgICBm
b3IgKGkgPSAwOyBpIDwgYXJyYXlfc2l6ZShjaGFubmVscyk7IGkrKykKPiArICAgICAgICAgICAg
ICAgc2JpX2xpc3RfZGVsX2luaXQoJmNoYW5uZWxzW2ldLmhlYWQpOwo+ICsgICAgICAgbXB4eV9z
aG1lbV9zaXplID0gc2F2ZWRfc2l6ZTsKPiArfQo+ICsKPiArc3RhdGljIHN0cnVjdCBzYml1bml0
X3Rlc3RfY2FzZSBtcHh5X3Rlc3RzW10gPSB7Cj4gKyAgICAgICBTQklVTklUX1RFU1RfQ0FTRSht
cHh5X3NobWVtX3NpemVfdGVzdCksCj4gKyAgICAgICBTQklVTklUX0VORF9DQVNFLAo+ICt9Owo+
ICsKPiArU0JJVU5JVF9URVNUX1NVSVRFKG1weHlfdGVzdF9zdWl0ZSwgbXB4eV90ZXN0cyk7Cj4g
LS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
