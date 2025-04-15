Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BCEC369AB
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 06:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8NZ0BmZ3kNpXCZcglZT8yS0v/1WY+8OU3I6OPstVmI=; b=NfxVDJJopwzhqe
	bmE3myvK9kNsDxAhXkJKL34gpuWCAJkfXvLBPyk77medhofo5TFgyCL1MM4HCAmhPPvRk2HUu5WXx
	AVqZCy4aogbMPj2S/RXL9qgmj4fp/pJYCrHXA0WfRfC5j2tKN+QeNk67URvoRQORp4yR7qovUhdup
	BiwQ1zoltHeGNfMbNxFm3oTK41oksF4Lypmxez7PGBHDUK7gazGioim57xTIwF5y14AxyblRyX6Ox
	QdyfcPmskXQOYymb3sH7t63ST8RdvN3qWFsDE1mDgaOsr+tlNTECziieMr7Dz8pUwnS9FrO4VBcok
	tpyzSRgcLv45m1KhwZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZVe-00000004drn-1GwR;
	Tue, 15 Apr 2025 06:11:02 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZVc-00000004drN-2xAb
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 06:11:01 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so16403585ab.2
        for <opensbi@lists.infradead.org>; Mon, 14 Apr 2025 23:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1744697460; x=1745302260; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8zJ5ve55nQUWL0UUmEUC0sjZWlvhymmnMVfUMzj1Fk=;
        b=PC75GbsPHxcnHKaAsFGjmGnmKSafjTwrdgxwJ8t8kH7TNnyit5crdgWBj7DNy8uVrV
         qWoyN1+nphaLm89/bEUijTTwon9EFQfig9KsnoEDcIqdV19nk55jqYKe4SV1vr9zSYla
         Ec7GhSADK9zFy/hbQnHEqQIhqWhxaF5Z6o4k+6qsuA5fpc9Ii2vYKMpro1BpAClAYvca
         KgALbWO4LAbTFUi1gLwrVh7HmUAhPq2X+HNBabF5gPDengJie4bXDJ0T/6l9K24Y2t1X
         jTjmYUC4Y83/TIusaqvxJC2wMUgSPMRthMcB2pmbTr/02xm3AaUZp22DnMqORaU5OexT
         enyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744697460; x=1745302260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8zJ5ve55nQUWL0UUmEUC0sjZWlvhymmnMVfUMzj1Fk=;
        b=vHq6LL+FodZ+dxhwkO/iRZvIUZ5mPNuEkoMHTFussmXXso6I4kg7W54t6MdcYWy7Za
         yAe0LqpHppL9j8CWbiVKsGU9fk/0e+sOFanquyhOcuee1qaC1f6TE2nSCPxro9X6GU77
         XISNOwNptIGitKGPEfpCdrWgZ9DKcv8HyxLjwH+HZPY0YvO/FHQfbsu5fQBz3sPZrQIz
         TJwHiTk0G9KDMs0ecturxBj0ouJ2lL9RLhyq7SXhftP73nbqrnWAD2wOuR0Wflr0Wp2Z
         B3A0+aQOUNZdvOrrxe4eS7hhcvRvRa6c/lYKiZ522UXFv6T4Km3TQgKtJ9reAdnM3yMu
         /5CA==
X-Gm-Message-State: AOJu0YzP0RsZQFjhsv7PbYFubaRv79KmmmzmQjlDbtQ2YOAhW66UuD6a
	LfY0uUIQRz0g0zDsQdOXQd9GOdv1JyB2ur7qNR8qESpzL7fi0FLr0uSMdYxoLffttIKeM/EPYw4
	8PsS0Z1jFrfA7DHvJGEKmDgHukvkowTCU7O5OBqzo6/7eHcTBFW9RpBNg
X-Gm-Gg: ASbGncsYZTwuA5Anyi+4/z9smPYDTBkClIZTWt7XYpnlabelnaj3HmjR8AafdBeJFSn
	k7cWltZMEQGwh6FSghWu0Sb2a56RgxyiznSIiXx3ix932rCVX4aa4Flm2nlwB+CgVcH/6zeyV8z
	SMmSPGsib4YstuxpoTxJAM/no=
X-Google-Smtp-Source: AGHT+IEvWu5hV5+mwOiX4lnX2ZUlgGR2fn8pl8O+Wqr/oAW2MDHtRAN/GxHwW6YQ3qfqGjrCT6UZV+Arv3V+oT7Fju0=
X-Received: by 2002:a05:6e02:248f:b0:3d3:f775:cec0 with SMTP id
 e9e14a558f8ab-3d7ec278027mr168601185ab.22.1744697459680; Mon, 14 Apr 2025
 23:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250319123944.505756-1-wxjstz@126.com>
In-Reply-To: <20250319123944.505756-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Apr 2025 11:40:47 +0530
X-Gm-Features: ATxdqUECSI7coCawlRfm2RYa_1yHMfvW2P1eWYZkDIIJfT2QY3pi7w7bptCCz1U
Message-ID: <CAAhSdy0OosR43uQ5M7WyW38mb47sNx2bxgkCfW5bLE2b=ieN8A@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Remove unnecessary SBI_INIT_LIST_HEAD
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_231100_745035_D7A4873C 
X-CRM114-Status: GOOD (  15.62  )
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

T24gV2VkLCBNYXIgMTksIDIwMjUgYXQgNjowOeKAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IE5vIG5lZWQgdG8gaW5pdGlhbGlzZSB0aGUgbm9kZXMgdG8gYmUgYWRkZWQg
dG8gdGhlIGxpbmtlZCBsaXN0Cj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZyBXIDx3eGpzdHpAMTI2
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtz
LApBbnVwCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9lY2FsbC5jICAgICAgICAgfCAxIC0KPiAgbGli
L3NiaS9zYmlfaGVhcC5jICAgICAgICAgIHwgMSAtCj4gIGxpYi9zYmkvc2JpX21weHkuYyAgICAg
ICAgICB8IDEgLQo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9maXh1cC5jICAgfCAxIC0KPiAgbGliL3V0
aWxzL21haWxib3gvbWFpbGJveC5jIHwgMiAtLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDYgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZWNhbGwuYyBiL2xpYi9zYmkvc2Jp
X2VjYWxsLmMKPiBpbmRleCAzZmEzYTllOC4uNzQ1ZmEzMTMgMTAwNjQ0Cj4gLS0tIGEvbGliL3Ni
aS9zYmlfZWNhbGwuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2VjYWxsLmMKPiBAQCAtOTMsNyArOTMs
NiBAQCBpbnQgc2JpX2VjYWxsX3JlZ2lzdGVyX2V4dGVuc2lvbihzdHJ1Y3Qgc2JpX2VjYWxsX2V4
dGVuc2lvbiAqZXh0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFM
Owo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBTQklfSU5JVF9MSVNUX0hFQUQoJmV4dC0+aGVhZCk7
Cj4gICAgICAgICBzYmlfbGlzdF9hZGRfdGFpbCgmZXh0LT5oZWFkLCAmZWNhbGxfZXh0c19saXN0
KTsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hlYXAu
YyBiL2xpYi9zYmkvc2JpX2hlYXAuYwo+IGluZGV4IDZkMDhlNDQ4Li42NDZjMmUwYiAxMDA2NDQK
PiAtLS0gYS9saWIvc2JpL3NiaV9oZWFwLmMKPiArKysgYi9saWIvc2JpL3NiaV9oZWFwLmMKPiBA
QCAtMjQ0LDcgKzI0NCw2IEBAIGludCBzYmlfaGVhcF9pbml0X25ldyhzdHJ1Y3Qgc2JpX2hlYXBf
Y29udHJvbCAqaHBjdHJsLCB1bnNpZ25lZCBsb25nIGJhc2UsCj4gICAgICAgICAvKiBQcmVwYXJl
IGZyZWUgbm9kZSBsaXN0ICovCj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgKGhwY3RybC0+aGtz
aXplIC8gc2l6ZW9mKCpuKSk7IGkrKykgewo+ICAgICAgICAgICAgICAgICBuID0gKHN0cnVjdCBo
ZWFwX25vZGUgKikoaHBjdHJsLT5oa2Jhc2UgKyAoc2l6ZW9mKCpuKSAqIGkpKTsKPiAtICAgICAg
ICAgICAgICAgU0JJX0lOSVRfTElTVF9IRUFEKCZuLT5oZWFkKTsKPiAgICAgICAgICAgICAgICAg
bi0+YWRkciA9IG4tPnNpemUgPSAwOwo+ICAgICAgICAgICAgICAgICBzYmlfbGlzdF9hZGRfdGFp
bCgmbi0+aGVhZCwgJmhwY3RybC0+ZnJlZV9ub2RlX2xpc3QpOwo+ICAgICAgICAgfQo+IGRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV9tcHh5LmMgYi9saWIvc2JpL3NiaV9tcHh5LmMKPiBpbmRleCBj
NWQ5ZDFiYi4uYTcwNmNiNmEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfbXB4eS5jCj4gKysr
IGIvbGliL3NiaS9zYmlfbXB4eS5jCj4gQEAgLTIzNCw3ICsyMzQsNiBAQCBpbnQgc2JpX21weHlf
cmVnaXN0ZXJfY2hhbm5lbChzdHJ1Y3Qgc2JpX21weHlfY2hhbm5lbCAqY2hhbm5lbCkKPiAgICAg
ICAgICAgICAgICAgbXB4eV9zaG1lbV9zaXplID0gKG1weHlfc2htZW1fc2l6ZSArIChQQUdFX1NJ
WkUgLSAxKSkgLyBQQUdFX1NJWkU7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIFNCSV9JTklUX0xJ
U1RfSEVBRCgmY2hhbm5lbC0+aGVhZCk7Cj4gICAgICAgICBzYmlfbGlzdF9hZGRfdGFpbCgmY2hh
bm5lbC0+aGVhZCwgJm1weHlfY2hhbm5lbF9saXN0KTsKPgo+ICAgICAgICAgcmV0dXJuIFNCSV9P
SzsKPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL2ZkdC9mZHRfZml4dXAuYyBiL2xpYi91dGlscy9m
ZHQvZmR0X2ZpeHVwLmMKPiBpbmRleCAxOTJkNmRkNS4uZTIzN2RkMDcgMTAwNjQ0Cj4gLS0tIGEv
bGliL3V0aWxzL2ZkdC9mZHRfZml4dXAuYwo+ICsrKyBiL2xpYi91dGlscy9mZHQvZmR0X2ZpeHVw
LmMKPiBAQCAtNDE1LDcgKzQxNSw2IEBAIGludCBmZHRfcmVnaXN0ZXJfZ2VuZXJhbF9maXh1cChz
dHJ1Y3QgZmR0X2dlbmVyYWxfZml4dXAgKmZpeHVwKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiBTQklfRUFMUkVBRFk7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIFNCSV9JTklUX0xJ
U1RfSEVBRCgmZml4dXAtPmhlYWQpOwo+ICAgICAgICAgc2JpX2xpc3RfYWRkX3RhaWwoJmZpeHVw
LT5oZWFkLCAmZml4dXBfbGlzdCk7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+IGRpZmYgLS1naXQg
YS9saWIvdXRpbHMvbWFpbGJveC9tYWlsYm94LmMgYi9saWIvdXRpbHMvbWFpbGJveC9tYWlsYm94
LmMKPiBpbmRleCAyZWE3YTAwNS4uYjNmN2U4YjkgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL21h
aWxib3gvbWFpbGJveC5jCj4gKysrIGIvbGliL3V0aWxzL21haWxib3gvbWFpbGJveC5jCj4gQEAg
LTM0LDcgKzM0LDYgQEAgaW50IG1ib3hfY29udHJvbGxlcl9hZGQoc3RydWN0IG1ib3hfY29udHJv
bGxlciAqbWJveCkKPiAgICAgICAgIGlmIChtYm94X2NvbnRyb2xsZXJfZmluZChtYm94LT5pZCkp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUFMUkVBRFk7Cj4KPiAtICAgICAgIFNCSV9J
TklUX0xJU1RfSEVBRCgmbWJveC0+bm9kZSk7Cj4gICAgICAgICBBVE9NSUNfSU5JVCgmbWJveC0+
eGZlcl9uZXh0X3NlcSwgMCk7Cj4gICAgICAgICBTQklfSU5JVF9MSVNUX0hFQUQoJm1ib3gtPmNo
YW5fbGlzdCk7Cj4gICAgICAgICBzYmlfbGlzdF9hZGQoJm1ib3gtPm5vZGUsICZtYm94X2xpc3Qp
Owo+IEBAIC04MCw3ICs3OSw2IEBAIHN0cnVjdCBtYm94X2NoYW4gKm1ib3hfY29udHJvbGxlcl9y
ZXF1ZXN0X2NoYW4oc3RydWN0IG1ib3hfY29udHJvbGxlciAqbWJveCwKPiAgICAgICAgIGlmICgh
cmV0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPgo+IC0gICAgICAgU0JJX0lOSVRf
TElTVF9IRUFEKCZyZXQtPm5vZGUpOwo+ICAgICAgICAgcmV0LT5tYm94ID0gbWJveDsKPiAgICAg
ICAgIHNiaV9tZW1jcHkocmV0LT5jaGFuX2FyZ3MsIGNoYW5fYXJncywgc2l6ZW9mKHJldC0+Y2hh
bl9hcmdzKSk7Cj4gICAgICAgICBzYmlfbGlzdF9hZGQoJnJldC0+bm9kZSwgJm1ib3gtPmNoYW5f
bGlzdCk7Cj4gLS0KPiAyLjQ3LjIKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
