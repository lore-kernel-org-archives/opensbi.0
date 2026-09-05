Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E8BC624DB
	for <opensbi@archiver.kernel.org>; Sat,  5 Sep 2026 07:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyNiK5D+GJ9Ci2zmv8YXui9AoXlmnGoHoxvALgcoyz8=; b=ltmzaRQ2LjakWy
	TtNvzxHBgKN3E7GIesXirSTw3bX/U1gQUc5HQRBB7hhIgOZvotdaxVCtizeRS6MAWUy52VQYMooKB
	mvBj3OD2eVZP1W9u+AVE2dRlv5a2P97GRTaAvc9IgyPr8SfyQIpMa0/ZmJFsnwVrGZVO4rjfuPo/I
	Uo/xKf3Jt3IcCns5w+88rdiuhbYUSKLmeyqqZLzJSZ3LO3CNsQvZPVOErqJu2J9NIuugkri6x0Q1z
	4TZHao2e4FlFZWyqxN7TJiUI3M/I0V06sx407eUTuhm2U4ILKOMiAI1e/zgF485MluRKNATLwKM9f
	slCV80xoLXxqF7SuyDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kSY-00000003lp4-0wBl;
	Sat, 05 Sep 2026 07:05:06 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kSW-00000003lo1-1s2m
	for opensbi@lists.infradead.org;
	Sat, 05 Sep 2026 07:05:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-482e257a23aso1234853f8f.0
        for <opensbi@lists.infradead.org>; Sat, 05 Sep 2026 00:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788591903; cv=none;
        d=google.com; s=arc-20260327;
        b=WMWaYX98EvGgWGzIibqx3MgZkzmGcyI0EmTmIRaJuzRwHzLnar0t8ER/xDOydiovzf
         HDr7ZnkTy7MX9BjmeXN9E203x/lgMql+GHcVJ78IY4lvUFOqfYhAlwTuVSt5mWLXnvNF
         VNWtDK/QIlUi+PAtOgByXm9i6jReOc2F8aUpNxR0ZqOpKDXEVzUlPsjSjhUPCJ7u2PWA
         Y4pUrVGqnuX7f4z+AUffyYJqaVl4VcC5oVDH5i9g3tXBwtgatDCcKxvmadKDzbB9O6W6
         yJgIcC2qdepKcl3TWlJo4AoY2uWkZS/7BmwSfFwI4CiG14tjz6nPxLQvdt+1mFxhV6F4
         /8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zRYB6//Z+1lXA/ydmInvcIPd/NeEp4Wx7BwOCXWkNo8=;
        fh=DvUZaCZeGFM/iKDgemEdcvjZTXBGU6zmoXACXNg+ctg=;
        b=V6+Huh2GrXfydgwAjgonyj16hz1EAoXZuXa0jwVHBdzgH575HpHH47DtrnDLUok3Pp
         d5wsW3vQFbyLe9A79keLcS3fEtk/YvuFPoe34YFxbMTNQPc3vExWEKxXPpO79zAMsZkk
         NqKgWrQmbL0d3a7yisy8aK0+nqxQz+oZEFHYST+VpdQgFnx0GsyPiGfD8RZlPpuxRQgf
         v89BywWLUVxPNbT3sht57yAqJ4uJRNIRqIp6TkJYayFFoUlGwMvBhhr1QBGVSBWmLxDo
         Flm7Swvx/U+BvUIXdoO5xAI6cxy6LJ8VGXdRBohwf3qYSi5eiZZ4k5e7iCSTjk0LK+BZ
         tvmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788591903; x=1789196703; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zRYB6//Z+1lXA/ydmInvcIPd/NeEp4Wx7BwOCXWkNo8=;
        b=W/oGbQsHdsCl9/D/sc8KcrFK8nw7K8qAmbJYsVzYlurhtpIH9BAIozY5arLGCTRZ5v
         tWittPSeAILbJALDtT8gd472Yrz7UdGm/kDNfXOTYCjZoP6BQP+kBT091R6TgxSPGdJE
         BaBcT+QUJu8DjrD7Q44xQliZJdKJ43Vg0R9Y0h9lNjyz7ofVCqpzat2b29X1mYAh7zGB
         M7lXZSpOJGp4OSp2QQHvne6uVSziJsE3FaF7xxrktnTXp7aUNutaVjrCWoI3hLbSis8D
         wdveET/6y/ZT6F0/YeoCJCaCOvvdS9Jt4D0ywco4Rl6XTBpwdnXDu+tucVucKAQxTRD+
         aYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591903; x=1789196703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRYB6//Z+1lXA/ydmInvcIPd/NeEp4Wx7BwOCXWkNo8=;
        b=GvVCBvDbfQy381aNYy96pyhGnMFERtW6OoCPcA+M6W1zIEkKfjTa4zJO1y4hNWj01f
         l2XUwJHgWwpTFj2zKsmpUDA9hRmltLlDyX95z4FAYyxaNLe+bu2DbrP8bPMTE4pv2suE
         rUKe4BQAjLk1iccI9ka4AvxHuLj+xoeMbFdSBkpAyFH9AfmBVR7V7H1badOoZ2lrSP7Z
         +4I7ts0GzzDaIn47enAJQpu7S2pB40EbG9qmSm7ha6u5VzWn4WDoVTnj3ZR73J+OaKR1
         7oRpllaYUyobI8ilhMG0sKVe7AzyX+utcGa0FI3ItG+nQRxXamJtHap6rGSNs3wmrpv0
         PRtg==
X-Gm-Message-State: AFuF++kXP6ylVTNYUhTASmWNNr4gsm8UcnDgWzknt/0kkh70s2YN1idG
	GUFT8he3aOl4G7iZY3lOqIY1jaJS1aZS6NfU6zix2Zxwf2Db1pzbh3To+RmV889lK1FkpoSjcm7
	BWw9z6dgS8c+ylpAMR7EIN4mKZ0wlK7o7rrwYrU+TRcf/OJD1F5xt
X-Gm-Gg: AYBFou1q1PYtI72sJvIiOvKMpg7+x71BL9hu3ArTi10kykM9zYw4OH/BofMhjsbf7fZ
	k6vax1dtRME3Ojm4HyKMsxtE0xSAD62d7I40M3fzeYuhkq7bhz0Bsq+QU51CW98jXGWmUEPKw5J
	uewjRi4dfSbBkwRiMAbHFjMkhAZASGveiKdBeivfXDtK3W+3axosrQaf8TDFDzRJL4PPuUyTy3C
	0TNlBMpDVEh50szoUf/35CBRQ4dW4Xqustme/vjrYfSnpmrIclvwaQzHnW+3jrjHszcwKWozf6c
	p0Dhyo0SoleXdyObB7cL02nKrRkF0CLjPHgsmmBRUuycOXYnf3PZhw8yrtGSBsPRzT7rY1m/POS
	nMRPUV/vuAXXhk7OKTdc8EfG5vn3Ye5Mof2uN4IiOVabIY1F/Mqv8o5yMp/F4Hhc=
X-Received: by 2002:a05:6000:1845:b0:485:8a46:b3ca with SMTP id
 ffacd0b85a97d-4858a46b614mr10391028f8f.50.1788591902602; Sat, 05 Sep 2026
 00:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260828213104.84490-1-theodoruswensanfebruanto025@gmail.com>
In-Reply-To: <20260828213104.84490-1-theodoruswensanfebruanto025@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 5 Sep 2026 12:34:51 +0530
X-Gm-Features: AcwNN1W_WVvgcUx_iLt0DINDcE95HfI8VULxgFA8Xow9fpGagbjeXPWM07ai7ok
Message-ID: <CAAhSdy1-HxxmbH2bpc=6C5V3FoE9teNUH8cyZBhi1pMKGKS5pA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Fix FP state enable in sbi_fp_save
To: whensun <theodoruswensanfebruanto025@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000504_502451_5C0C6F36 
X-CRM114-Status: GOOD (  14.53  )
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

T24gU2F0LCBBdWcgMjksIDIwMjYgYXQgMzowMeKAr0FNIHdoZW5zdW4KPHRoZW9kb3J1c3dlbnNh
bmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gc2JpX2ZwX3NhdmUoKSBjdXJyZW50
bHkgc2V0cyBtc3RhdHVzLlZTIGJlZm9yZSBleGVjdXRpbmcgZmxvYXRpbmctcG9pbnQKPiBzdG9y
ZSBpbnN0cnVjdGlvbnMuIFZTIGNvbnRyb2xzIHZlY3RvciBzdGF0ZSBhbmQgZG9lcyBub3QgZW5h
YmxlCj4gZmxvYXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zLgo+Cj4gU2V0IG1zdGF0dXMuRlMgaW5z
dGVhZCwgbWF0Y2hpbmcgc2JpX2ZwX3Jlc3RvcmUoKSwgc28gZmxvYXRpbmctcG9pbnQKPiBzdGF0
ZSBjYW4gYmUgc2F2ZWQgd2hlbiBGUyB3YXMgcHJldmlvdXNseSBPZmYuCj4KPiBGaXhlczogNzE4
ZTFkMTk0ZjVhICgibGliOiBzYmk6IEFkZCBmbG9hdGluZy1wb2ludCBjb250ZXh0IHNhdmUvcmVz
dG9yZSBzdXBwb3J0LiIpCj4KPiBTaWduZWQtb2ZmLWJ5OiB3aGVuc3VuIDx0aGVvZG9ydXN3ZW5z
YW5mZWJydWFudG8wMjVAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9v
cGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGxpYi9zYmkvc2JpX2ZwLmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2ZwLmMgYi9saWIvc2JpL3NiaV9mcC5jCj4gaW5kZXgg
Yzg5NDEyNTIuLjM4ZmI3YTAxIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2ZwLmMKPiArKysg
Yi9saWIvc2JpL3NiaV9mcC5jCj4gQEAgLTIwLDcgKzIwLDcgQEAgdm9pZCBzYmlfZnBfc2F2ZShz
dHJ1Y3Qgc2JpX2ZwX2NvbnRleHQgKmRzdCkKPiAgICAgICAgIGlmICghZHN0KQo+ICAgICAgICAg
ICAgICAgICByZXR1cm47Cj4KPiAtICAgICAgIG1zdGF0dXNfb3JpZyA9IGNzcl9yZWFkX3NldChD
U1JfTVNUQVRVUywgTVNUQVRVU19WUyk7Cj4gKyAgICAgICBtc3RhdHVzX29yaWcgPSBjc3JfcmVh
ZF9zZXQoQ1NSX01TVEFUVVMsIE1TVEFUVVNfRlMpOwo+Cj4gICAgICAgICBhc20gdm9sYXRpbGUo
Cj4gICNpZiBkZWZpbmVkKF9fcmlzY3ZfZCkKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5z
YmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
