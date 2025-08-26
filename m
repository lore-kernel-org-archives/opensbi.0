Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21628CA0EFA
	for <opensbi@archiver.kernel.org>; Tue, 26 Aug 2025 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjCVRZiV56XIiFXeRybb/RCWJkKXKkXQmA7ral9fGaE=; b=WaLz/t90Uz+8NH
	lmojnnpBv8YUMkSpcUh3wztJw4w0gD7d+lm4cXiXI+CNPfbu3YYuocoXITwZdmWBuwE9zHL3+BqHq
	kh5qVAS77RFVEHAxh0F5oURFiw1TUC7JtYbdLmYb3D21cYNdYBRmSdlSbgdAPwQy9j5JX9idf5gp9
	ugqigFPZPsefCGhanrLhl0YCMk5WJxXJL3mrspTvhpbWxQmO8gYlQFPLMlJ4JatodDSKNFmDbMA6w
	v0a6m+t2mwGJG+kMxwBvNbVu40QA+Im4Waf9uemd+fZz9rcQf5BnqxqHcbf7HUaUeC4xoxkTVcoZa
	MZ5BeUTj4RDC1jWclxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqs7H-0000000Bq16-30LP;
	Tue, 26 Aug 2025 11:45:31 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrdy-0000000BkAL-2xGT
	for opensbi@lists.infradead.org;
	Tue, 26 Aug 2025 11:15:16 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3ea8b3a6426so39195665ab.2
        for <opensbi@lists.infradead.org>; Tue, 26 Aug 2025 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756206914; x=1756811714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvnvMhgci4VPXEWy4qMhlyURjOtqGTZRKZwqD0WX/bo=;
        b=iJK8V/zVpTqc7a0/eCHNPvuW6hNmyuqerQ8iookWhWQeexww1Af8w9N4LhUJt2N6kZ
         pF5phx87t31WT3fmHnsyO0jf7gehGoPBBPz5we5dR5LNG+xyAl5nyLU3j+GdDfxM4GPg
         ZzwUNBtnyZL+GFMKaAFy+4hR4DshdmKXLUVigisMGoQ2SgkzXugJ3RSLW3QWemZYn90J
         qaeTF9T8SZaNvMz/FsLmJq0ozWl2a5oFusZs48CwTIZp6HG0uCAlog4MYErsPkZIgatZ
         XzZk0Qvd41Fz/dDoWC5ck5vnHzXwbkzpBISe7smZRGz2/wnRPuBOweT8C6dQGdG+QSS8
         TyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756206914; x=1756811714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvnvMhgci4VPXEWy4qMhlyURjOtqGTZRKZwqD0WX/bo=;
        b=aYgWj0/9xdNvnWYnjMZ06ghRRK6lYmL50DI8EzI+m027rwvuMqom74DwItyg6B4jGV
         AvUU/VvI81dUQTqFmAKS3T9jTLYqYTp1/O+CrbMkR8LM5cd63k3KJLDE5Q9+8ZZwwwpI
         +eX3Ew30UBWyOVrP6ACxE0NssMkujLawTKGqn4dHut9sp0ulACaj7LtPeyPiznBYOnpI
         IcjNbT2Oth2IQF4EBH5deeGpwbLgYBJ9UaM0mNWdvlJHM9/qwXjXo3dnOXdXu5A7Nn65
         dUh57eur8Ugmy7Yxo1THU6TsE0VGU5yDPaV46o18QaWfzEGvs+AvappnX/Pdo6Z+gB+x
         2tng==
X-Gm-Message-State: AOJu0YyLwlCYiCP4OVb1cfr1oSmlImXgEzSGC4ytmoz9TvhwwTJ+VAPe
	+jr7336kOgFrwEk7DMNQ1sWtgzEXBv469OyOjRhDJC1cwu2NXma35TgsQ3by5grwttq78Mg/0hX
	dfQVP6a2j3aKtBVpVTVMIRrE8lxMMQCM/XTvJYm5p3SnIt8u8oWBi
X-Gm-Gg: ASbGncv5q1Cax/msunwoybc/IKK6APXPKCgRVKJhXyV2LVRBj13njcFGZt7E21T/sPI
	7LdOHxVRkW1Av1NYjqghJuYKBHIC4GVU9CxypabxsfYTXAaKLY85a/KmzrmMShfGUqCEBKToPsH
	naGY47MyffbwWcGEIogHB+3aBAZiDskQ2vWVoocgJikVT7Pnf0sRJAYI2r/GBNXJZiWqdlwx6r/
	vK39pVxNrzDM2a+jqbbXJt1oFGckMlRHjBkDHYipsTriYJCWLb526oHAJjnN1kWR9RyfKZaTg==
X-Google-Smtp-Source: AGHT+IHaZOWX7eZmtkivoWQqqcyUeObjfIjzB5oZQF/i7vIT6P/QTC6jnC6vu+zbhgY3J9cq7pihdlkxKbPY4KbUNAg=
X-Received: by 2002:a05:6e02:1a8b:b0:3ef:13b4:75fc with SMTP id
 e9e14a558f8ab-3ef13b476damr13009675ab.12.1756206913453; Tue, 26 Aug 2025
 04:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250721160712.8766-1-maherme.dev@gmail.com>
In-Reply-To: <20250721160712.8766-1-maherme.dev@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Aug 2025 16:45:00 +0530
X-Gm-Features: Ac12FXyR3lWnSEeyhLdNMqoqbkArj2rY7roQRBh5Dhtd2S-wgi5WwcRN8D4Q13o
Message-ID: <CAAhSdy0oeCjUFY35SgGXBdLuxt+Giepec8Y133db7nNxdu8k+g@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: pmu: Improve loop in pmu_ctr_find_hw
To: =?UTF-8?Q?Manuel_Hern=C3=A1ndez_M=C3=A9ndez?= <maherme.dev@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_041514_860685_792ED82F 
X-CRM114-Status: GOOD (  16.16  )
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

T24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgMTA6MzHigK9QTSBNYW51ZWwgSGVybsOhbmRleiBNw6lu
ZGV6CjxtYWhlcm1lLmRldkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2UgZG8gbm90IG5lZWQgdG8g
aXRlcmF0ZSBvdmVyIGFsbCB2YWx1ZXMgaW4gdGhlIGxvb3AsCj4gd2UgY2FuIGJyZWFrIHRoZSBs
b29wIHdoZW4gd2UgZm91bmQgYSB2YWxpZCBjb3VudGVyCj4gdGhhdCBpcyBub3Qgc3RhcnRlZCB5
ZXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYW51ZWwgSGVybsOhbmRleiBNw6luZGV6IDxtYWhlcm1l
LmRldkBnbWFpbC5jb20+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkg
cmVwby4KClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGxpYi9zYmkvc2JpX3BtdS5jIHwgMSArCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKPiBpbmRleCAwN2E1YzU0NC4uNjM1Y2IwYzcg
MTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfcG11LmMKPiArKysgYi9saWIvc2JpL3NiaV9wbXUu
Ywo+IEBAIC03ODAsNiArNzgwLDcgQEAgc3RhdGljIGludCBwbXVfY3RyX2ZpbmRfaHcoc3RydWN0
IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgLyogV2UgZm91bmQgYSB2YWxp
ZCBjb3VudGVyIHRoYXQgaXMgbm90IHN0YXJ0ZWQgeWV0ICovCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgY3RyX2lkeCA9IGNiYXNlOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4KPiAtLQo+IDIuMzQuMQo+Cj4KPiAtLQo+
IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
