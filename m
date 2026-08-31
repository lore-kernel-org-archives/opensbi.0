Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B14C624A5
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rESxZXxyXeXCo1VfgB1RwbLW7w1VRcdKxckOU8tM/Z8=; b=yTfm4G3CHkyTsk
	dmqTYl9qbJ8srvYXa/26LEfPtjQCzsRhBUDFmemnFpLeuH2CF9JEMpsoVyfKWfyQwLzxbFXtfzyl6
	xF6GR0BYonfhzPmnJL530R1NoNdvpWyogGsAhAocI7vDOKjFfHLd2Hki4D8B+sUgY3qRdACRi8BT5
	uxsNwgPZuj5Le4y8+3lyFfxiqnOAfBDcsa/LGNf/0IDoFYLamCIn4buaMa5YaD8Y+LVx2KsJ8Echc
	igGF96ilwoWG+Q+t2NyXgMPcKTGhM0/jl5PhVMwAqVoy8u1Cc7j4q+r10HLPpWhFkvSVyxMz5MpLT
	QB+h2t6HbQgmF8rYhZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14Df-00000009v73-2oX5;
	Mon, 31 Aug 2026 15:46:47 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14Dc-00000009v5w-0m2R
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 15:46:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so3175853f8f.1
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 08:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788191202; cv=none;
        d=google.com; s=arc-20260327;
        b=kw8KmQpIFPwmMw/5pgxIjbRABc708xFM1T7zNs1XU5FhJkLG0JjqTmPxfjwhUcXh28
         nYEU7QUffRFrPhobVaO+JSgHZMXWgv4LB9W6nRPw5XoLWQIYe6UcJcr4T0RYCO/3yrFD
         T+m66tDfM/EBm8bFhxHWcuUOKKZGfXZWVWMnoJTnlsa+ReJDCA5/yXUaU6qjM2Q66CJR
         Butq6imsX6bhlZRZaSQ/59GnD6oUWnK7zkOZjLGi9uj+Fab1QCqfXQ7N6xBOGJPemWSr
         jJtCcpFpdRif3MXreM+4OnJ4S0jt8qEh7Wd3q2/RhkPP9FmwTmIQqMWEeovXjWjB3CdM
         eSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zwAmxq6fgh7tI2D3RhdcWHuu14xVhXZitFegQ3sgKJc=;
        fh=7B6lXk3Menm4HP8Wwf3vxL6w+nHVGSzIuaBesQHVIOM=;
        b=RconCyLReo7LYj7kpXHU833BWTY43EjvPGzBApUXN5gJ4Z3QaDgGQsyH/fbGJ1ooH+
         IgSneuEqwLgZODWd2Xur7jOb9pXebQiFiX03T1Cgp1amBat1l6LIosh1nGCJJCpfXdrB
         sy9STV+Sa1wUycLE32Fhv+Y5Vo+UZzeVxacatNBEcg7jBoVaD9CzhGVN3Mx2lNfp81u1
         ImilQmIdWbjN6gSBvdN/9WSkwsSAZAf0SLxGXSKyowXrXoXldSZG6t8F5B6n/96WIa66
         UznT3100CRH+Ey3tD4txUzfj/1SuIhrS1itCriIJY0NopAkTIN9o0J8yk/EMjfrQcTat
         M2ng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788191202; x=1788796002; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zwAmxq6fgh7tI2D3RhdcWHuu14xVhXZitFegQ3sgKJc=;
        b=rpCycqvTMmD3eA/lWlqcxNawYvDbsxk2geFH5KWJygsG3gZSCAbkn9hr7zUgMdfLk2
         beMuTk1Ds9VC2pFZnZkypIHTRoEkWXjCZbQuR54rkvHUTNSIRf4V40r5HMvnXgf4QIYg
         i2qwqg4JP8716wdJEZWNAYHvDpjghynsD8uDQx8m3pM2QPlGwnsGFyTnSwWMsAdd8wWC
         eIho4Vs0P0HGGIBdnjwz/0Ia5hb0fAJfaH5EARqXv1BFbc620kVjmCQP2Y7SOUjd+ru+
         ibPxbkVGM8qrmU51r/rD15g8zUUQCIgkoHkP+MNRni1+36XeLXqq+IBLtFtje3s28D6S
         PWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191202; x=1788796002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwAmxq6fgh7tI2D3RhdcWHuu14xVhXZitFegQ3sgKJc=;
        b=Wv78I0L/rlqy6l6mq9MnvTYCBEgGpWgIP/y61tqngacMzXBD8JpAMJ68Owt+h+u1NZ
         EyShxExzu94hAyvFZ+y3Z5UU06IEetQtMyugH4jOYaORY2GuWcPcLv6ersSg0yc1JPWP
         /gvaT3mmzp0cKq49zBODVtQ9osBJMXe5ukRf+7Ax2Z1ytRMJBtasRrbYaBaEhd2RQQLR
         ctgdiKKl9sko6BcXD7Uv0XdeYCacvvOIWke8lhWDgyfbj0uVKVSJzquxvpSeBztObLn1
         LFkmfIOiX1iqNpvJYGV+aj3T407AIbTD/HytDAH72CKHOPtC6azBEvFQIpYwRAlT7cXB
         +GYg==
X-Gm-Message-State: AFuF++nFYAgGlDt0Mg5uBfJxjjpQH6oH9NfR4aegRt0dNkceC0fs/FRA
	F61f5Hqa9887Nx3bcL+QTQJTLEWAl1FxXyAY2IK/avmb41kXltnjw9gspM7dNarXGBFVX/f+5fZ
	NyJglQE/YSjBVdqLfrD2aHpbbYWyS5cWhcQwDZMNZDPJoq/xOucBOHlBzuw==
X-Gm-Gg: AYBFou3bJnbtW/MxZkFlMrDcZ4LJFIoWZ6y3MGN9lYaESCxr9LldIjWCV6OMYsKdN/f
	d6/UtI6Z0kmdYVc3cmaeN2heQ9EFq8OD58/WDI2vPfrwrBTzJ1wrqHCT2ZSeJHnj4AY+Lne9tcJ
	RtGFcV9559VKVX3jC82dioC5gT5MqrpfDAgKUqQTo0I+XEBTumvXZL25JqtLGCpku0Ag9yhsomd
	Cv29HibiaWAyhi3VoqzOreklMhBofjwkBr/OKNgmh4iBzT0p+5YJzHcq3XRfuqCos0hSTQneXp9
	f0BBKesyBK+bY5EUw4fAogAO6dJDFSQ7vqWUDGgukIePOmcxOObEXLlkJ72gYPH3Fn3NW3axkKX
	wtGXhowx5K8SPl5ko24/L3hvGzm6IR3JX+GH4m185I3gva3swDPFn8EWg9CrMY1pFPg==
X-Received: by 2002:a05:6000:4613:b0:482:e64d:a1f7 with SMTP id
 ffacd0b85a97d-482f79db612mr52394035f8f.11.1788191202216; Mon, 31 Aug 2026
 08:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260727183041.258377-1-david.garcia@aheadcomputing.com> <20260727183041.258377-4-david.garcia@aheadcomputing.com>
In-Reply-To: <20260727183041.258377-4-david.garcia@aheadcomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 31 Aug 2026 21:16:30 +0530
X-Gm-Features: AcwNN1X_3EUu5hkZ5zw59QhAvUZMxp5NrqIU1LYSWNMMYDQV4SV9QfU7Mf0jv48
Message-ID: <CAAhSdy1KadRGkbo9_p=W97poOmdHkpHmXQDo+NubR7fV=tcuRw@mail.gmail.com>
Subject: Re: [PATCH 3/3] lib: sbi: dbtr: return SBI_ERR_INVALID_PARAM for
 invalid trigger configuration
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_084644_240076_DED342A6 
X-CRM114-Status: GOOD (  14.15  )
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

T24gVHVlLCBKdWwgMjgsIDIwMjYgYXQgMTI6MDDigK9BTSBEYXZpZCBFLiBHYXJjaWEgUG9ycmFz
CjxkYXZpZC5nYXJjaWFAYWhlYWRjb21wdXRpbmcuY29tPiB3cm90ZToKPgo+IHNiaV9kYnRyX2lu
c3RhbGxfdHJpZygpIHJldHVybnMgdGhlIGdlbmVyaWMgU0JJX0VSUl9GQUlMRUQgd2hlbgo+IGRi
dHJfdHJpZ2dlcl92YWxpZCgpIHJlamVjdHMgYSB0cmlnZ2VyIGNvbmZpZ3VyYXRpb24gKGRtb2Rl
IG9yIE0tbW9kZQo+IGJpdHMgc2V0KSwgd2hlcmUgU0JJIHYzLjAgc2VjdGlvbiAxOS40IGRlZmlu
ZXMgU0JJX0VSUl9JTlZBTElEX1BBUkFNCj4gZm9yIGFuIGludmFsaWQgdHJpZ2dlciBjb25maWd1
cmF0aW9uIGVudHJ5LiBSZXR1cm4KPiBTQklfRVJSX0lOVkFMSURfUEFSQU0gaW5zdGVhZC4KPgo+
IEZpeGVzOiA5N2YyMzRmMTVjOTYgKCJsaWI6IHNiaTogSW50cm9kdWNlIHRoZSBTQkkgZGVidWcg
dHJpZ2dlcnMgZXh0ZW5zaW9uIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEUuIEdh
cmNpYSBQb3JyYXMgPGRhdmlkLmdhcmNpYUBhaGVhZGNvbXB1dGluZy5jb20+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMg
cGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAg
bGliL3NiaS9zYmlfZGJ0ci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kYnRyLmMgYi9s
aWIvc2JpL3NiaV9kYnRyLmMKPiBpbmRleCBkMDZmY2FlYi4uNGZkN2ZiNWUgMTAwNjQ0Cj4gLS0t
IGEvbGliL3NiaS9zYmlfZGJ0ci5jCj4gKysrIGIvbGliL3NiaS9zYmlfZGJ0ci5jCj4gQEAgLTcy
OSw3ICs3MjksNyBAQCBpbnQgc2JpX2RidHJfaW5zdGFsbF90cmlnKHVuc2lnbmVkIGxvbmcgc21v
ZGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgKm91dCA9IF9pZHg7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgc2JpX2hhcnRfcHJvdGVjdGlvbl91bm1hcF9yYW5nZSgodW5zaWduZWQgbG9u
ZylzaG1lbV9iYXNlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdHJpZ19jb3VudCAqIHNpemVvZigqZW50cnkpKTsKPiAtICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9GQUlMRUQ7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9QQVJBTTsKPiAgICAgICAgICAgICAgICAgfQo+
Cj4gICAgICAgICAgICAgICAgIGlmICgocmVjdi0+dGRhdGEyICYmICF0ZGF0YTJfaW1wbCkgfHwK
PiAtLQo+IDIuNDMuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
