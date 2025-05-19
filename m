Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75E0C2D0CD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 20:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80IzkMcvWzQAmXUiEnnnTIbpDs9xB+eRBkRFQZxuxXw=; b=swVmatWUdCz0Y+
	nC1derJcyt7WBX01/3l1i4WC1iWuDPe7cmwE0hEoPodPxXLwM2zOoOPHy9acAA7AucI1iNATa28Pi
	kD77sCL4ZfHS1n1ePG9WWuQStAgZ0PlM3vu1hV0w6kPxxVwcw3P2+i2bvW9srOGKIJXWh/JjOxnF6
	uu2ZRfvx+adOKvIINkwBeKHAiD6hO8OdZAbK8oRiLxPm76rs4eSgwslyBga/9zs1vPTOHq2MxaS0w
	AyLvHVFqpXkZBRFT+eH5Y2M4nM8q4VkwlFo/oRr6Bqm68MH6oZvulmtHnHizbkWS0GJlh1+m7c5rL
	wIGH5Gj123U5j/Ygi5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH73Y-0000000AOTv-05d5;
	Mon, 19 May 2025 20:25:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH73V-0000000AOT9-3xze
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 20:25:51 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-742af84818cso2698865b3a.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 13:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747686349; x=1748291149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs9pmhkjokBI/gFPRwk8+4FZ5RtxWFbCygqbS5FyyLk=;
        b=JAo6pPOGcs6UscXbOEBmKOnGFsQkjeWdI7gZ63NqsppjRzRn535ZjHu2hzN7eI6QKK
         2sjPEi4KmEn4UoCI60f2IjU1EnJnkdbGT1+zkuqqis0Dq/8FxW2LvQtUsQPAwu0krROh
         Yjjb3GJUHMHM5B5f933Vg09Z970vEsNiEA7Iub0MJ5xFtvn949oT/Q0TTaizeo191GIe
         yqpCcxazANo925xXMXJyxD0MbBG1ukMKJf3ATOpmNOIigk3/4EuHcY9tnZRe6MvpATGa
         mUGoIsBiYUZHHKF7vJhw4HjirE4pm4+u17l9II8d3lSMo2+10n7r4XP3LgHLamgS/j4L
         SM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747686349; x=1748291149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xs9pmhkjokBI/gFPRwk8+4FZ5RtxWFbCygqbS5FyyLk=;
        b=QePuL0wiZ78tT7FckAiHwS3mGiN6P8zmEhbFdq+nVhpf6ZaSdfnjfDI/EdfsUt3c6V
         Gkk/G7hYrL5QOvQlSo5BD1s3f2lqUxslaHBEq6nj4wxbLAWtg90iUuXqMGck6CO4FiZh
         rPROqZkfV0LZpUOKxYNoQDXZYEhoZEUOHBQfIK7538hLE8jIhwIR31ka3N5zbNP7n088
         9W3JdyIbn2oXZRy4G0QTbAUiC79nRVFDfYz2l+IX5A5irUHvvbJd2VP2I5yQKD9lCewt
         Hgy9mr6oZwjdp03JNX9ISM3umQDA4uYbny5BtF+xYwYxuc1z63jcq/QaYADQY8f0PtAb
         IHgA==
X-Gm-Message-State: AOJu0YwsYf3RN7cTy2FVRrjPNoIiD3YmQZvT7GLkab4QCioOAETkD4w6
	4m9ktT239kFtB9gVcJzes7LyT2NawyBvWOm/k0V0rHjQknbxzZx5egc1qoDgOK/PwOFcQKEeAlO
	ODPtYF3gti4M4leJVFdXxH8SaIj1kHvfta4Rn35iJnw==
X-Gm-Gg: ASbGnctp6vlM02fU20J3kOWi7uMzMjVryyAnlSGXghY2Lj7uEduzTbARURBHw9zXgnZ
	c+39d1YKgDt/XEqgPSgxqi4y7VfpIH0r1vZIE8LjyrAgQKQKzdorljK2A4Wpn0Sj8qM4M67HlXD
	75m79LzRkLWa0ODj73u9cI4fm8A3OrSp0C9DCKVVlS1w==
X-Google-Smtp-Source: AGHT+IFMyRyrGAGnLB8GZ8jtERfXNSZvz2Lfk9V0dLEq2faEqsoNvwO1Dy2Ln1UJPlA/FfYlzt8S9q5xItgIjis+h08=
X-Received: by 2002:a05:6a00:a88f:b0:736:33fd:f57d with SMTP id
 d2e1a72fcca58-742a98a32e1mr14853408b3a.17.1747686348981; Mon, 19 May 2025
 13:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250519083950.739044-1-cleger@rivosinc.com> <20250519083950.739044-2-cleger@rivosinc.com>
In-Reply-To: <20250519083950.739044-2-cleger@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 19 May 2025 13:25:37 -0700
X-Gm-Features: AX0GCFuL_yfKqPTbyRZpXJ-oVGDj79zguNvevb5gjVH37sq-m9JS1lIei3WUmaA
Message-ID: <CAHBxVyFweJZQXL_NLxfGr853+yfWo9wLsadaGs39XD1Hvfr3DQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] lib: sbi: pmu: Add SSE register/unregister() callbacks
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: opensbi@lists.infradead.org, Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_132549_989116_68D6439C 
X-CRM114-Status: GOOD (  16.75  )
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

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgMTo0MOKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBcyBzb29uIGFzIHRoZSBTU0UgZXZlbnQgaXMgcmVn
aXN0ZXJlZCwgdGhlcmUgaXMgbm8gcmVhc29uIG5vdCB0bwo+IGRlbGVnYXRlIHRoZSBpbnRlcnJ1
cHQuIFNwbGl0IHRoZSBQTVUgU1NFIGVuYWJsZS9kaXNhYmxlKCkKPiBjYWxsYmFja3MgYnkgbW92
aW5nIE1JREVMRUcgc2V0dGluZyB0byByZWdpc3Rlci91bnJlZ2lzdGVyKCkuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGxp
Yi9zYmkvc2JpX3BtdS5jIHwgMjQgKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2xpYi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKPiBpbmRleCA1OTgzYTc4NC4u
ZGVlNTBiOWIgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfcG11LmMKPiArKysgYi9saWIvc2Jp
L3NiaV9wbXUuYwo+IEBAIC0xMDk3LDI0ICsxMDk3LDE4IEBAIHZvaWQgc2JpX3BtdV9leGl0KHN0
cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPgo+ICBzdGF0aWMgdm9pZCBwbXVfc3NlX2VuYWJs
ZSh1aW50MzJfdCBldmVudF9pZCkKPiAgewo+IC0gICAgICAgc3RydWN0IHNiaV9wbXVfaGFydF9z
dGF0ZSAqcGhzID0gcG11X3RoaXNoYXJ0X3N0YXRlX3B0cigpOwo+ICAgICAgICAgdW5zaWduZWQg
bG9uZyBpcnFfbWFzayA9IHNiaV9wbXVfaXJxX21hc2soKTsKPgo+IC0gICAgICAgcGhzLT5zc2Vf
ZW5hYmxlZCA9IHRydWU7Cj4gLSAgICAgICBjc3JfY2xlYXIoQ1NSX01JREVMRUcsIGlycV9tYXNr
KTsKPiAgICAgICAgIGNzcl9jbGVhcihDU1JfTUlQLCBpcnFfbWFzayk7Cj4gICAgICAgICBjc3Jf
c2V0KENTUl9NSUUsIGlycV9tYXNrKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIHBtdV9zc2VfZGlz
YWJsZSh1aW50MzJfdCBldmVudF9pZCkKPiAgewo+IC0gICAgICAgc3RydWN0IHNiaV9wbXVfaGFy
dF9zdGF0ZSAqcGhzID0gcG11X3RoaXNoYXJ0X3N0YXRlX3B0cigpOwo+ICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBpcnFfbWFzayA9IHNiaV9wbXVfaXJxX21hc2soKTsKPgo+ICAgICAgICAgY3NyX2Ns
ZWFyKENTUl9NSUUsIGlycV9tYXNrKTsKPiAgICAgICAgIGNzcl9jbGVhcihDU1JfTUlQLCBpcnFf
bWFzayk7Cj4gLSAgICAgICBjc3Jfc2V0KENTUl9NSURFTEVHLCBpcnFfbWFzayk7Cj4gLSAgICAg
ICBwaHMtPnNzZV9lbmFibGVkID0gZmFsc2U7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBwbXVfc3Nl
X2NvbXBsZXRlKHVpbnQzMl90IGV2ZW50X2lkKQo+IEBAIC0xMTIyLDcgKzExMTYsMjUgQEAgc3Rh
dGljIHZvaWQgcG11X3NzZV9jb21wbGV0ZSh1aW50MzJfdCBldmVudF9pZCkKPiAgICAgICAgIGNz
cl9zZXQoQ1NSX01JRSwgc2JpX3BtdV9pcnFfbWFzaygpKTsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lk
IHBtdV9zc2VfcmVnaXN0ZXIodWludDMyX3QgZXZlbnRfaWQpCj4gK3sKPiArICAgICAgIHN0cnVj
dCBzYmlfcG11X2hhcnRfc3RhdGUgKnBocyA9IHBtdV90aGlzaGFydF9zdGF0ZV9wdHIoKTsKPiAr
Cj4gKyAgICAgICBwaHMtPnNzZV9lbmFibGVkID0gdHJ1ZTsKPiArICAgICAgIGNzcl9jbGVhcihD
U1JfTUlERUxFRywgc2JpX3BtdV9pcnFfbWFzaygpKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQg
cG11X3NzZV91bnJlZ2lzdGVyKHVpbnQzMl90IGV2ZW50X2lkKQo+ICt7Cj4gKyAgICAgICBzdHJ1
Y3Qgc2JpX3BtdV9oYXJ0X3N0YXRlICpwaHMgPSBwbXVfdGhpc2hhcnRfc3RhdGVfcHRyKCk7Cj4g
Kwo+ICsgICAgICAgcGhzLT5zc2VfZW5hYmxlZCA9IGZhbHNlOwo+ICsgICAgICAgY3NyX3NldChD
U1JfTUlERUxFRywgc2JpX3BtdV9pcnFfbWFzaygpKTsKPiArfQo+ICsKPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzYmlfc3NlX2NiX29wcyBwbXVfc3NlX2NiX29wcyA9IHsKPiArICAgICAgIC5yZWdp
c3Rlcl9jYiA9IHBtdV9zc2VfcmVnaXN0ZXIsCj4gKyAgICAgICAudW5yZWdpc3Rlcl9jYiA9IHBt
dV9zc2VfdW5yZWdpc3RlciwKPiAgICAgICAgIC5lbmFibGVfY2IgPSBwbXVfc3NlX2VuYWJsZSwK
PiAgICAgICAgIC5kaXNhYmxlX2NiID0gcG11X3NzZV9kaXNhYmxlLAo+ICAgICAgICAgLmNvbXBs
ZXRlX2NiID0gcG11X3NzZV9jb21wbGV0ZSwKPiAtLQo+IDIuNDkuMAo+CgpSZXZpZXdlZC1ieTog
QXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
