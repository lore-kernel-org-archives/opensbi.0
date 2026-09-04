Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52776C79F80
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BU/8eotvV9GXYWilSE/gCUxTG2inUXyWavVEPMJY4SU=; b=l6Pjh884+9vTgw
	ydfYCqFNVQYw2eWyBCU6j80J5wXnVZ2It5yMZ2vG7cwS7fZFIHtR5fbUucBQtgzTokHo/bFA1tpnr
	fYM5UfEeGo3vQ6G+rw+mzZexCXuHIwoB9X6SP0J7sskzG+eB+wZV4UJhOYXIFcOCrfpSrG07DT3ZK
	BQcO7CoaIGH+TGeyiSlbbZlIjR/l2QL/dV9g2QBlEhQJ+td+jZY/+uJVwO6DzpEu6SqNNueS7WWN0
	FZ+d81oP6j0MO4nWOzIpw7tCDjK4Lw3PIsDKS8n0OhZMXsYx4k85YQ0NZNcy3X59t6vMnKIP+PdfB
	Q6KeFmzHn4LC/oTunfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PFA-00000001MrW-17VE;
	Fri, 04 Sep 2026 08:25:52 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PF7-00000001Mr2-13Qu
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 08:25:50 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so1005282e87.2
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 01:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788510347; cv=none;
        d=google.com; s=arc-20260327;
        b=r1r11O9NZYoELDuVOYANcASqo8pb7HI4VD99RJG/UXQ1/pGRePVFnK/uuehKCJPxVa
         R6//gGAYOvVMf++uiYJZT6aiVEc/KFCqxl2OTGookeyaKJiRbdHOHqjqQrWEYtBHpOo1
         6i/byRx6kFL3e3QBCLxgz7g0XfK3e3GEzipySR9FpH88ESHMZLe7GRXNeJiz9wxfI2TT
         KjEcNjzTvmap8v35GIKCijxPsyj0COwU0gu36oJef9C9JaJ4aRL61lbRUcJvKsupsYPK
         dv/LnDyj3Ax9rFmuff6dZLSPQ4FkI8CfRtj5wPjH4N+bJOH2yuy9GDXV8KOpGzeDjX2v
         QO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s1R5DKOgGp9OLltn+avFYjTq6IE+hy3OwNzSU0yB9p4=;
        fh=AuOazG/xucKVLTCYQds0rW8md/1BoWV/GFuD32bmi0U=;
        b=sLe78WjqWBlh8V/wjeDsU6DXxHvAcoVpGDfz804Nu/j3cCuL9hRTYewEreR3oRX4Yy
         KJ2qr7ge6X5TmsKKv+0aB8qHUQB0bbeyXDJ3XRyL6VSzVn01IApE6qXEeUo1+x2vukR3
         +eXakFnb2a392qWBzszVL59ziETAarNVYVkrelUFGEtn7nFNnkvjBtlVeh8bHNNSszBw
         tJEmvd6BuNu3zNZhKcCyF1DlE6X+xaasrXETBih6WLKNsUPzyTqb3Kt+9siEMnS63OuW
         5fvgADbX2Zfoksuocmc7sq4KExfsxmbxJqR0ZqYALNh3jGWdqQdoFrfuoXQDLTka3uBb
         WdJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788510347; x=1789115147; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s1R5DKOgGp9OLltn+avFYjTq6IE+hy3OwNzSU0yB9p4=;
        b=TcOpvOHt69wpcgxOZ7KeiRn0HVbKSX8FgP+CXXKkAKcv5Hg/AYPS3SUKbfVmu966Ei
         FFG0jQGyrko89QcUeUXPyZRK0HpUs3Aj/QZGBvgjaAcvy24CNHaQ7Vk/m0ToFyVaKMlC
         dgXbdz0EfxrHDbMZ7qj545mSf0CIjC9jdQMN+AqpxSACrRtgkxu/RJbzcIMTOdpfZPq1
         21BOUsntWpkqNOgY29I3nfA743dmMQ6QUCmBUdKoOJmEzbMkTpnfx+p2yVhq3zPII8Vo
         7PE77zvhj6nTAXTFfxmv2YyPQwxyDtEwi/N5SaYTqwVCZGh/mW6zxxCsDCS/XG8HGJLd
         DAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510347; x=1789115147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1R5DKOgGp9OLltn+avFYjTq6IE+hy3OwNzSU0yB9p4=;
        b=Pb95tSpGjiliYug6RBicOurYW86M9WURVR4ZY7jRydtLHLfLzI5iwDaWOu1fXA6XBB
         rsOskjfAPG7CjhRjANFzC5CYuHgOhECOz4esLtPCMn17gOvgS9VXrFRrnb+g6eNUFgjf
         GW9pVK6bQz7rhtq7Ld9HjQDg6n1oXs+ehTsB6mM86YubqkeRjwd0ywQgoZS03jo3ljQ5
         Juu/4L5cNk1T9Yk+0dX1La9aCHOVVKXhLuKr1b6Qht/MfFx83PSwCz1rAJ6YaGCjCnys
         TS77ZlFj0h/WanPdnE8//Bty6GpvomAVvorvZpT+Eru6nij+pEFppNhZ+lwacXhGDzXd
         Sanw==
X-Forwarded-Encrypted: i=1; AKwUvBzIHMLqYy2JX0OtulhpZJfES3urjwY7ylQKOfFRw7HltgQ/miFpC3R1RlfbqXydxRfBliIELpHs@lists.infradead.org
X-Gm-Message-State: AFuF++meuzrIW5bO3d68wy/iJj8/3QuSZimZ1e+rLZl8NCqAvsfIn2Hq
	+XK0z24rga1A3Dkoc+cf0uPmGPiTOarZOqaaYTfZGxucp1ys7zsbsbCDdsHC/MeMoG0L/lJz9fM
	65a867EUSyhtxi444vxbYRzfKkAco75YlqFCoY2E3t0HXMFerojB7sE9jdQ==
X-Gm-Gg: AYBFou0pTUSuc6lQlDFNT+6RyVgkVeU0LQMnA07MECR9QoGJ54+lAtYgQRvkMw+6X0W
	wWVafwEBG5LEh+w2UKGtxYR1QCZoKVJ5Rn7I9dfyXeQ6Up2jFMo5Nwt9phB31dqOKKRNbOv/isj
	4n1psT5OZ2c+l98DyJ+gJPmA+HsOoiYkpkCCKhb2cIRRM/s9Ir/nHUF31yfafTGKP937v9ArqwO
	r48UDmQizV+C9r8NSBx+/2jBdy/FSe5DUaPsnDOSbw5QB4tQXRq61epQKNU7+u+ZzGpElmIzdd0
	8rpXBapMv6NZqVZsNP4ExwvxJGkIEGoc8Phz8N85gK4IKEm4Rfy5xoxaQEhnGrMp9Ysayl8/++P
	qR9iE8VhYsc6QA51JCRwDNt3UOf8NU9sq9dV1KFX6qiVcADqPD+ynTVxu5XV8Vqk=
X-Received: by 2002:a05:6512:3b8f:b0:5b6:1a7c:aa15 with SMTP id
 2adb3069b0e04-5b61a7cacc7mr279575e87.45.1788510346674; Fri, 04 Sep 2026
 01:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260820134431.167336-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20260820134431.167336-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Sep 2026 13:55:33 +0530
X-Gm-Features: AcwNN1Wcw-WSR7lhHR4m0VutwW8XmngxVoC7LheefmxXU32FL-S1UfxaAU79fvU
Message-ID: <CAAhSdy1=d3EvkuC50CVfoS28d2OO4=BpYCFN4AHhH9syrN+WWQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] lib: sbi_irqchip: error handling in sbi_irqchip_raw_handler_default()
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_012549_311608_589BD9B2 
X-CRM114-Status: GOOD (  13.46  )
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

T24gVGh1LCBBdWcgMjAsIDIwMjYgYXQgNzoxNOKAr1BNIEhlaW5yaWNoIFNjaHVjaGFyZHQKPGhl
aW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBzYmlfaXJxY2hpcF9m
aW5kX2hhbmRsZXIoKSBtYXkgcmV0dXJuIE5VTEwuCj4gQ2hlY2sgdGhlIHJldHVybiB2YWx1ZSBi
ZWZvcmUgZGVyZWZlcmVuY2luZy4KPgo+IEFkZHJlc3Nlcy1Db3Zlcml0eS1JRDogMTY3NzQwOCBE
ZXJlZmVyZW5jZSBudWxsIHJldHVybiB2YWx1ZQo+IFNpZ25lZC1vZmYtYnk6IEhlaW5yaWNoIFNj
aHVjaGFyZHQgPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4KCkxHVE0uCgpSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBw
YXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCj4gLS0tCj4gIGxp
Yi9zYmkvc2JpX2lycWNoaXAuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9pcnFjaGlwLmMgYi9saWIvc2JpL3Ni
aV9pcnFjaGlwLmMKPiBpbmRleCBiNDkwYTNhZC4uMTY2NGJkMmQgMTAwNjQ0Cj4gLS0tIGEvbGli
L3NiaS9zYmlfaXJxY2hpcC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaXJxY2hpcC5jCj4gQEAgLTE4
NSw2ICsxODUsOSBAQCBpbnQgc2JpX2lycWNoaXBfcmF3X2hhbmRsZXJfZGVmYXVsdChzdHJ1Y3Qg
c2JpX2lycWNoaXBfZGV2aWNlICpjaGlwLCB1MzIgaHdpcnEpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBTQklfRUlOVkFMOwo+Cj4gICAgICAgICBoID0gc2JpX2lycWNoaXBfZmluZF9oYW5kbGVy
KGNoaXAsIGh3aXJxKTsKPiArICAgICAgIGlmICghaCkKPiArICAgICAgICAgICAgICAgcmV0dXJu
IFNCSV9FSU5WQUw7Cj4gKwo+ICAgICAgICAgaWYgKGgtPmNhbGxiYWNrKQo+ICAgICAgICAgICAg
ICAgICByYyA9IGgtPmNhbGxiYWNrKGh3aXJxLCBoLT5wcml2KTsKPgo+IC0tCj4gMi41My4wCj4K
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
