Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F78C83F34
	for <opensbi@archiver.kernel.org>; Tue, 22 Jul 2025 11:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kufcBpzATaRECqMBIN8lU4Eyo2bPa+zwF0T8oe0Bf9k=; b=f0epgrBMEyXIX4
	w4uQQH8t5i77W2rzA8JXQtt37vXlZtj21vpsbYK8kTUzXYYnO4VK+/dC6HRGGC/k6F7YKrwCDVrHl
	jidSYP7ndjnYO506ZqBiaKjEtVKh6yU3VOoXL1XoKjfUOF/ZJi5pSDo4ZuFat+gN/g4t5ZkaMojma
	Hx1r3Sut4bLcftuivPTGt45VRYvZBczbuIKGcIoqHO95C3dF9XwH+e7HOjjskhuIdVL2AO3mpDa1u
	4QppD3snZqxHBFi1buv5jqCj8oZFl1oAUmXZ1M3ePcPMOWydZUe0Ej4cf61BNEK0LH4z7nBDWxpsu
	/qn+mqwRVcBFpr2aZSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAjl-00000002DLW-1OhV;
	Tue, 22 Jul 2025 11:00:45 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAWz-00000002BtI-3ox9
	for opensbi@lists.infradead.org;
	Tue, 22 Jul 2025 10:47:35 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3e28bf4a350so28127395ab.1
        for <opensbi@lists.infradead.org>; Tue, 22 Jul 2025 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753181253; x=1753786053; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbPScLYc5N1EeJ4Z2Cb+wS+GNP/NyM5I4HlvhnATffk=;
        b=0i0dBrXvZOyuYBAsW1acoYGobLhFRIpAXF6v3i4eBrvbk4QuXLhEbfi3YEGg9TTkpH
         GGgRRgESlozDaXF0jLAI3fKEL1bKTmlAoFnS/FuWwxIOTJdwqkT7aG8GT5YihQNadypW
         DLDGKll8D31yoyOIUyLCSABelRB49TiJL0FZ1/3LfAYyvIUocTFnWQPTS30K/vWqSabK
         5rM1zwxdYoYBqzPhpuFxameljRnddI2biKGRtIzxhxac2CDdmEF5Q82zFupS1welT4EV
         qNCjOaM3tsvP3Bjs6I4YaNRdBHNM9ZqVArBF2qKtBJbRzC4rUMREck9cWpVfxEsNTbK4
         ROgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753181253; x=1753786053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbPScLYc5N1EeJ4Z2Cb+wS+GNP/NyM5I4HlvhnATffk=;
        b=ZMwjQgxexiHshFHfTQGAkGW2U3TwZ/VxZcZwb0TE5AQPYtfVp18bPuX4I5HvOqv0TO
         7rboooMNzFFVjmSsxpJS+xRNg1FvqZ44HtgqD9Vz+YZkxMYs9PiRvD18uMJD/7wdQTH3
         w5SFWpAbNVbj7qPlhdCRoN3MO2u3C1A95E8Brh/DKf8kX40aVoOEaiK8d6npr3cLS+Vz
         S3tVcOfzdHarOJ8Ef4WqzPPxk+It3odMvaIz2iXNbyEoBGGjZGEEWPzH+FxgnBwYd76l
         SraydM6PlQbZt/955zdOtBdM8rmpneXtr16/KzTfakaPbXnLJHsJIjZq5A3OLO5SnuOu
         xVSA==
X-Gm-Message-State: AOJu0Yw7tOg+U4cm1jBniRbjvdKGtxrwSK/v0u3AJUNgDrlnV+xNgNEX
	f3DzDodrW/qHcYIlC0ynyHX/RZmi3x8a6f8RCMVC5f/3Y1q4cwwbq34vYjKzUL6fmX+HBCwyWmH
	/dTYDIairDoKWo1tv3BmwFjCgwjk8FHBtxUunSYgBxw==
X-Gm-Gg: ASbGncvmoe8w9+hvzL5FeL/M1ih/uwPZ0VWjVd61Lr2drezJDtHohparXrdMGFemh9r
	KhaSnBrLIO46FFLjCK6Ei+6JYzNOzMqxtOEg7KemdRcus+HejxbTBupIktI7+AztV8+LM/xK0dF
	UBX61JY5PrV6pgWZ7+4uOo4jzKxBmHdleOCEyIk75u9G37u7FNkeMDaqbnwXeVXLb2Ly1bWfTzU
	e+fet4=
X-Google-Smtp-Source: AGHT+IGGHmYGhs8ks0fhLteyROe5GFYV1L3KxA36DYGtRNkJwCTpZGBlnsLG3xm+GtJO+VWWBQmMAYbFtaDE5/+XFFI=
X-Received: by 2002:a05:6e02:1786:b0:3e2:99f3:9c5f with SMTP id
 e9e14a558f8ab-3e299f39ddbmr203368505ab.9.1753181252883; Tue, 22 Jul 2025
 03:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250709232932.37622-1-jrtc27@jrtc27.com> <20250709232932.37622-3-jrtc27@jrtc27.com>
In-Reply-To: <20250709232932.37622-3-jrtc27@jrtc27.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Jul 2025 16:17:21 +0530
X-Gm-Features: Ac12FXyqreSrbhC30H2VmTZHzbuAFr3u0IFJ1Ji1hlUEfIpPfq01lTcETBfAKPw
Message-ID: <CAAhSdy18+u1PtPkofNDp0V6bmpEDXtYHSrmUFRShUGZTg5i8Jg@mail.gmail.com>
Subject: Re: [PATCH 3/3] include: sbi: Remove unused (LOG_)REGBYTES
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_034733_951263_A19393C2 
X-CRM114-Status: GOOD (  13.27  )
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

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgNDo1OeKAr0FNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdA
anJ0YzI3LmNvbT4gd3JvdGU6Cj4KPiBUaGVzZSBhcmUgbm8gbG9uZ2VyIHVzZWQsIHNvIHJlbW92
ZSB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmVzc2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcu
Y29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3Ms
CkFudXAKCj4gLS0tCj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggfCA3IC0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCBiL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiBp
bmRleCBmNGRmMWFlLi40MGE4NTRlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3Jpc2N2X2Vu
Y29kaW5nLmgKPiArKysgYi9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gQEAgLTEzMTcs
MTMgKzEzMTcsNiBAQAo+Cj4gICNkZWZpbmUgSU5TTl9MRU4oaW5zbikgICAgICAgICAgICAgICAg
IChJTlNOX0lTXzE2QklUKGluc24pID8gMiA6IDQpCj4KPiAtI2lmIF9fcmlzY3ZfeGxlbiA9PSA2
NAo+IC0jZGVmaW5lIExPR19SRUdCWVRFUyAgICAgICAgICAgICAgICAgICAzCj4gLSNlbHNlCj4g
LSNkZWZpbmUgTE9HX1JFR0JZVEVTICAgICAgICAgICAgICAgICAgIDIKPiAtI2VuZGlmCj4gLSNk
ZWZpbmUgUkVHQllURVMgICAgICAgICAgICAgICAgICAgICAgICgxIDw8IExPR19SRUdCWVRFUykK
PiAtCj4gICNkZWZpbmUgU0hfVlNFVyAgICAgICAgICAgICAgICAgICAgICAgIDMKPiAgI2RlZmlu
ZSBTSF9WSUVXICAgICAgICAgICAgICAgICAgICAgICAgMTIKPiAgI2RlZmluZSBTSF9WRCAgICAg
ICAgICAgICAgICAgICAgICAgICAgNwo+IC0tCj4gMi4zNC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBt
YWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
