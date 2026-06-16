Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45582CD98DA
	for <opensbi@archiver.kernel.org>; Tue, 16 Jun 2026 08:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1A1hGXfxfL7/LUZu0J4RfwvypGbLDZHlyZokS3LjwY=; b=E8WagX2q5focY4
	mLzKqLxTfjkRdc+JSq/Rx5jqRohJ1bS6mdkYmT0qj3+QRZ9zsoghoBpReov13zK9sMSPkfXKTqilh
	vPH/37enXzwW4RqPH5z9UCppn2IxH5Yj8PBWb+hp8zMIzqvla+O0ud3VGDDKBYwY692LND75Sitcn
	Vu8VQ+AAOV9iG8BTLDrSVHK0c/0f6MkxxacwEzfXHh3KOjgbemjK98VYVdi82j3iAhTo6y+ihTb8I
	xeM7I//Xx1aDE7zyCno4HIBkaXRq9zXfBy16f+J/TRX/u5gagg3aIKU7O1CgBVbtrYr3rArYxmBhn
	CU+jaFRHaRD8+QihEMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZP1U-0000000FR0d-0WWZ;
	Tue, 16 Jun 2026 08:19:52 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZP1Q-0000000FQzU-48Hq
	for opensbi@lists.infradead.org;
	Tue, 16 Jun 2026 08:19:50 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso3916176e87.0
        for <opensbi@lists.infradead.org>; Tue, 16 Jun 2026 01:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781597987; cv=none;
        d=google.com; s=arc-20240605;
        b=GCgt+40WT6CSmOyRVbZGCfyoIeru4BVIam0lZHvxM92ZeEkAeSDVEGD3bbZnfv3mpW
         sP769CZ7x69HF2IOKsnOfuDJf1LdF2mZTte61AicG9dUiH5TawqQxJGsdHeGO1TkF3ye
         MFWudTVU5xxO9Ry4+Wsh6GmxEC8uylqDWXcv0hwVLjUjXJaw2JVmYmyXVz9Y74dnM+uy
         FnW5T2lJfQ9HQhIU0sHVd7zDWxWeyVPDvfUicF6z++ErUCPN72NQSAdUOKxO6YnPUz+t
         NsFOpHfjm0XySwHst/D3KIb7Yk2FX86s2HlPIOXrDPibFXDvrGkCUbBkh+eYG/y10b2U
         QxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F4Og6m3fLPxPn99GXDlVYEJgOPLk19UuVoYBoIYxP1E=;
        fh=0p86q/2ythAQMBPuGbnW44JppkNwhxCdadir6TIka8w=;
        b=LoqvXow0tklyQXsSoTitaGbtbG90H88UnFNQic4IcwzDeK0h+b72Tvc8/PjNIXP6q4
         fGPmps6HA5CPk7R4INPlLH0kaTDR4Wqwp7SFFXlVhslAcn7vDcadVmTtEhQM8llItkR3
         ux0oGRPGHJZ3areNk4agDeWf2g1wiXwddYDcIfPYua2Whvz1ODyfcJQ6NxdIF5+M/4ir
         B/D9yeGKhTlYX4Sbtugqjv5OjnYLxsRDzALKEyq1C70PHmub93ha6GDh18iutMFg2JfC
         WpVGImX0MVAVuYgv5tr57e9EuQyaMtjtyoRKyvLcLgVGO+vLQd+8VTc25Ngf0ajS7T5y
         6y2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1781597987; x=1782202787; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4Og6m3fLPxPn99GXDlVYEJgOPLk19UuVoYBoIYxP1E=;
        b=Tlx/739l4xzfdGHRWct9PavylG/u2+sKDesV1p4dgriQR2MTnwR1TFTk6wEBpfYj1J
         QxaysEFzWiGVL1RWuJ/CcOOiY/WQvQCQTvfHf9h69sKqVpcZWKpUeVckBI0EEuIgIJcT
         d92ho/DNKgOq3hJJOR9AlyhDWIyIJsgWt20ZMKxAJ+3u6CHhJVKJCSRl54F0up3bUaSs
         /S+hILK/fpg4xyUQQZz0Yj0+5fnx0J99j7Xn2zN3RyFQyAHDIM7EO091Njdl+62h2Bk1
         Ws0tanWUDd2qnKj+an3EMB0FB+I46cpy3CyPot1RZ/ti4xXpRgKPGFujg6ke+iMMhGsa
         i+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597987; x=1782202787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F4Og6m3fLPxPn99GXDlVYEJgOPLk19UuVoYBoIYxP1E=;
        b=tRx8FFF++X9KDN7wEWVdZ2XoCNgz6BVTb6FbT/70C2Ud/BqNoYWEqBOz/spOvBuKBZ
         6sl1fn3IxqVQkwtUj5eAfjgTPB2kOeZ9Y/HZnoHh1n57WwnVqw2nS0jouAdxTgOEoDEL
         LZ3/Ek0c3o3OE/ev1w0HEUh+nQJp8Khp9+Us59wq2Eu5RzIFqzZLsREE/RqbhLsxcH6B
         OurGrPMdlnASdUAn5Am0n8gPsbkoU2vAPFL9zaZsTZXf9Twaif+QVZu2HS/4Wxt+JQJR
         AyILnI4Egdtg4xlAZphoHhGB1qOkHwsa/kC8wXLgS/7jMD5tXp2Wbz7BuAYp5figifIo
         RMbg==
X-Gm-Message-State: AOJu0YyepOqJp++SoPW6p4fcycW4sAk7fnDHro2aGKuLy+rZ9xZPXQKs
	ZYdKq0hm8HAKy6BAj9/B3XfRG+0g8zrDO3ctR23+Ae8UhorlDUTJy6csRNiDQCWIX3l7n6Q+hUv
	aQ/MoYCYr32G7zuNVQYT8gbvZ0SRTFaM5qTQy13GVrA==
X-Gm-Gg: Acq92OETYfZko1tzh/8Z/r2vb4SNQEa+bc412IZ/wnP322cyddwfzr8TGImL5JAk3U1
	3Xq9ivvw8HMDPqS2po/bNAFdwkT9BWkXqsUfyujrnqN7zXIluOQ0RbvsLWQYMuQme6cHt9U1VSk
	r7URE51g9i3Q9YGHPVAyDZKAl7YXP3GeaYGwYRwP/jWg/EmBI1yCD15n3rnUKD03af6GKmutNmQ
	nHcoZAS94Q5pzBgzxWzaPXDSyEBJdqQNcyXZMPNrLXs0+5QV72tAspdB3yVz6HsezT8ssmL8R80
	K5nHEvVVugvf2XGwcsPlDhSLYGMleWoux+UCKQ4=
X-Received: by 2002:ac2:47f1:0:b0:5aa:780b:f341 with SMTP id
 2adb3069b0e04-5ad2db77eb3mr3508856e87.35.1781597986400; Tue, 16 Jun 2026
 01:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260605113214.242-1-ganboing@gmail.com> <20260605113214.242-7-ganboing@gmail.com>
In-Reply-To: <20260605113214.242-7-ganboing@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 16 Jun 2026 13:49:34 +0530
X-Gm-Features: AVVi8CfT2KSJG6UFCJ1QwMnGg61IQCy-fdRExibXZZdlXQxMfO8u_Wruxhrzxo8
Message-ID: <CAK9=C2UHxBUmXv8G9rRwi_wX41dW1wEKrOtyjJvsQL6=h+EeQA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] Makefile: define OPENSBI_DEBUG if DEBUG builds
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, wangruikang@iscas.ac.cn, dramforever@live.com, 
	andrew.jones@oss.qualcomm.com, cleger@rivosinc.com, pjw@kernel.org, 
	asrinivasan@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_011949_040516_C31BCB3A 
X-CRM114-Status: GOOD (  11.47  )
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

R2VuZXJhbGx5IGdvb2QgdG8gaGF2ZSBhdCBsZWFzdCBvbmUgc2VudGVuY2Ugb2YgY29tbWl0IGRl
c2NyaXB0aW9uLgpJIHdpbGwgdGFrZSBjYXJlIG9mIGl0IGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcu
CgpPbiBGcmksIEp1biA1LCAyMDI2IGF0IDU6MDTigK9QTSBCbyBHYW4gPGdhbmJvaW5nQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBCbyBHYW4gPGdhbmJvaW5nQGdtYWlsLmNv
bT4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtz
LApBbnVwCgo+IC0tLQo+ICBNYWtlZmlsZSB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gaW5kZXggNDY1
NDEwNjMuLjZjZTNjMTFlIDEwMDY0NAo+IC0tLSBhL01ha2VmaWxlCj4gKysrIGIvTWFrZWZpbGUK
PiBAQCAtNDUxLDYgKzQ1MSw3IEBAIERUU0NQUEZMQUdTID0gICAgICAgJChDUFBGTEFHUykgLW5v
c3RkaW5jIC1ub3N0ZGxpYiAtZm5vLWJ1aWx0aW4gLURfX0RUU19fIC14IGFzc2VtYmxlCj4KPiAg
aWZuZXEgKCQoREVCVUcpLCkKPiAgQ0ZMQUdTICAgICAgICAgKz0gICAgICAtTzAKPiArQ1BQRkxB
R1MgICAgICAgKz0gICAgICAtRE9QRU5TQklfREVCVUcKPiAgZWxzZQo+ICBDRkxBR1MgICAgICAg
ICArPSAgICAgIC1PMgo+ICBlbmRpZgo+IC0tCj4gMi4zNC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBt
YWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
