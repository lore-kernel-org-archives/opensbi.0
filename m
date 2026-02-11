Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E85EB5967
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 06:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDkJE7nh6mJ1LyPd2MJ1C1uhCB6AOjOSqaXY+LaPK6U=; b=1BGXuUIoidY0U2
	MmAv7z2Qh1dmyHANI/Nhhe2o9dRXDce/GHV0WUrfSLQB1a8yrnRvIQci8+fuj3mhJ4sHbtfcCu42C
	IM1D5vSq98/V3AfFVqR3Pk3UJRVc46Bf2nKD/oVILUYlRT4QJD7Qwl8iPdVGdl6JsjHLPjP3Fi/Ri
	cAvdDGmGcPWL0tM7Rd9DRoYMoFAShUbk7qiU7CX2cHRCFmzPu1kYxrjWCwhXUQyb+LREuvpJLCYre
	ozUK44RDlHr9Z1XZu3zc5p7QinvSGlwM/hGD8LRKUkXcoJb6ucLEFe5S5JOLFkPKGKm5hn3UGPgv1
	xOe9U/RhS7545dXNpymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq3eK-00000000HzN-2sU9;
	Wed, 11 Feb 2026 06:24:32 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq3eI-00000000Hz2-0WQ0
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 06:24:31 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-40974bf7781so352593fac.0
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 22:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770791068; cv=none;
        d=google.com; s=arc-20240605;
        b=a54dzRNuWElmeP+FFEyWVvX31dcoEbB3JK1Z8ZQXOYxDFbSrI375yHFSkVcM0gCERF
         81EbNnpd5/wwJgAI9dvUMJnJYfh3zEYkRxjP7WNbq8gl0UTeuFGuD1ykIUsX7QoKzmP8
         ihp4VkRoD7QvrfnlY0sp9ahLOEZj8xgNYa5vFWBK9jcEQl1z3FYT3opAkFV6qjOhTTs7
         +ARYpft6MSatOR7uy2YaYDdG/6ozeXJpbGKQmgeWrB1dl0v8LnnmTEOq+C85r7yjVo/B
         4MfiB8luMp5EvLZvs3Jbdvz7hjpGTd9QodDm18SolP9zm0ppVW2FC9FiszZUoQQk6axY
         TJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZK7jLxoDFOrKhfo5m2V1S/g9nyRDJbi67Inrs/s2wZU=;
        fh=ZWLa82ykAwJkuvh5Md1WwEfVAVY4U4beZ/cGpAok4QE=;
        b=evOXp6McXfhbo3rTd7Q1rgVhyS9pQP/2/K1cyXOKBQ+5s2AbL163QEDxGFPKlflgV5
         XBiLplndBQHD7xpcVKC2mGpCy6UxIC1tYph6bW8qx3A8wIoyQWYLo5o73XbGTkMeb+EH
         XXrkZPIOr9stJWpN2vfFQT3tKE1UcSMYFLPFLxQBu2xiFfYgjQIpsH6ak7Geq1rUVKQo
         B3zQUNNHRiXaC6Umw8KXa1ISD7jplQbV7uBUP1f/LvX2Rw65e35OIAmpfHy33W3Z9Kx/
         BTOZMkBdCdCCUchaGHfYNfd3qK6Ryh28cquh1vR58rF86rjFuJN+uHfLAPdd/TWdsaLb
         I4fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770791068; x=1771395868; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK7jLxoDFOrKhfo5m2V1S/g9nyRDJbi67Inrs/s2wZU=;
        b=0MtKYr4ek+m72HwAKV8431Cm845lzVAgmcTSakvQ5lcDI/8JLFJvkHdfaGMkTBV9a7
         LM/IIlJ7twfbNa9BBUVadP06MenrrNrYaJrn5T9UCwHafU/e70B3Y5kDx5ameUq29TB3
         2BJ2AgeRKfmQ4Fc1FhYgbxEnmiKETv786pNzXNOD1+YAymLHiqIG8/axlJkDrOK3xSuh
         UhRME/bd/Eil4HCBNDXhtnE2VqzJx22DOGCpEwtmHnt9KQQR0xW5EauGl1X10iXaWzXT
         TAuJ9ZaCPsAItzu5TSu/O4VYlO/X2XXMYMCi3MHVOGchGwzVsQQpZwVUBVMZYeSYRHOH
         dDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770791068; x=1771395868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZK7jLxoDFOrKhfo5m2V1S/g9nyRDJbi67Inrs/s2wZU=;
        b=sWwX5f9Ypqb3Towj8V1O3hQdKMlJ+RYkpmGkjW1Sy5iNJNW1SbxpjT13rlr7k6Xzy6
         1060HUPHFzU6SLmcCo+fCXQzuu8nG3W0uJKnfNzTO5MSI8pitVw8i5LBAZPoOwV8vhu+
         G7+Il7YWQ8ccR1GQnGvA33jTKeeNMqFQAaHmBibeDWS//GUGQbZEICSD0ygTfIKYRth2
         kjVv2z/gQC4ASZQierKTpI4dwwdxFOT+C26zqBmtXlY2t7SoH0xZ+xlPgvmByJOmvQ+v
         FEa3qEBBfgASwTjN66A6Et/dZJaSkLbEI0J6N5+JdVM8z51S0IbBTB1WsxIWcL8eTiqj
         6lfw==
X-Gm-Message-State: AOJu0Yw7M0PtffNH3MTb07B6Sij06SbMFgakQjcKkMBzfACqjq+cAp3g
	mJlnkITGe/DAopGXsgBKGUmmegKfe8wCWLaSfUB9u0VdyQ1OyA/QQ/JzlKLNTRWPOyejrwVsFJM
	7clPBJtItsv0oUs4DPtEGriNYBVLyAqx/3autyL/WOCHFMs5e3Qkf
X-Gm-Gg: AZuq6aJ01+zvj33wbzk7OaaOuTYUXJXtQla+CGnuGbPW3kS86eLybO4IwMu1y1lq1IV
	3suzb20iOi7ku/0kajtELrdzufkWg/VSRxvO/a8p3Y4VDTE2hRWkI/NIJbrMrZl7Uc31y7GXd7Z
	INvQn1kJk9vyXHkygOwMKY/LWXVCmKBZFHDp7AA1V0GbyPvmAmS4m/YhI3D0DsSXH+HRYfsXRSF
	JKBGkaqRYieWudz0o/qgAUL0NXxS2IwYhFt3FetZfHDiPsUCEURfeChKSfc+Fme0QP7vR6QG9tG
	g4vVZ07nQalxjjZZdm/Jyp7A7guyE2WYHDBJU16bniNRsh7d9Spl0r/reM2J4LphqFsIHA==
X-Received: by 2002:a05:6820:4987:b0:66b:2d47:a791 with SMTP id
 006d021491bc7-672e62cc621mr2242262eaf.32.1770791068010; Tue, 10 Feb 2026
 22:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20251229071914.1451587-1-ben717@andestech.com>
In-Reply-To: <20251229071914.1451587-1-ben717@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 11 Feb 2026 11:54:17 +0530
X-Gm-Features: AZwV_Qh3JFk9EJ2AClojgX5Uc5VjhLZuRSOR7Kz_BicKlN-GKKMkzUCFAigm_no
Message-ID: <CAAhSdy0Z9gBRThF0DPTxMdvyzbiadb2=TawHcDH8Uus6sMrhLA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add hart state management and system suspend support
 for AE350
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_222430_444736_17834CCA 
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

T24gTW9uLCBEZWMgMjksIDIwMjUgYXQgMTI6NDnigK9QTSBCZW4gWm9uZy1Zb3UgWGllIDxiZW43
MTdAYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2Vz
IHN1cHBvcnQgZm9yIGhhcnQgc3RhdGUgbWFuYWdlbWVudCBhbmQKPiBzeXN0ZW0gc3VzcGVuZCBm
dW5jdGlvbmFsaXRpZXMgb24gdGhlIEFuZGVzIEFFMzUwIHBsYXRmb3JtLiBGb3IgdGhlIGhhcnQK
PiBzdGF0ZSBtYW5hZ2VtZW50LCBBRTM1MCBwbGF0Zm9ybSBzdXBwb3J0cyBDUFUgaG90cGx1Zy4g
Rm9yIHRoZQo+IHN5c3RlbSBzdXNwZW5kLCB0aGVyZSBhcmUgdHdvIHBsYXRmb3JtLXNwZWNpZmlj
IGxvdy1wb3dlciBtb2RlcywKPiBpbmNsdWRpbmcgZGVlcCBzbGVlcCAoc3VzcGVuZCB0byBSQU0p
IGFuZCBsaWdodCBzbGVlcCAoc3VzcGVuZCB0byBzdGFuZGJ5KS4KPgo+IEJlbG93IGlzIHRoZSBw
YXRjaCBzdW1tYXJ5Ogo+IFsxLzVdOiBUaGUgQW5kZXMgU3lzdGVtIE1hbmFnZW1lbnQgVW5pdCAo
QVRDU01VKSBsb2dpYyBpcyBmYWN0b3JlZCBvdXQgaW50bwo+ICAgICAgICBhIGRlZGljYXRlZCBG
RFQtYmFzZWQgSFNNIGRyaXZlciwgaW1wcm92aW5nIGNvZGUgcmV1c2UgYW5kCj4gICAgICAgIG1h
aW50YWluYWJpbGl0eS4KPiBbMi81XTogSW1wbGVtZW50IHRoZSBmdW5jdGlvbnMgdG8gc2F2ZSBh
bmQgcmVzdG9yZSBwbGF0Zm9ybS1zcGVjaWZpYyBDU1JzCj4gICAgICAgIHdoaWNoIGFyZSBsb3N0
IGR1cmluZyBDUFUgaG90cGx1ZyBvciBkZWVwIHNsZWVwLgo+IFszLzVdOiBBZGQgdGhlIGZ1bmN0
aW9ucyB0byBlbmFibGUvZGlzYWJsZSB0aGUgY2FjaGUuCj4gWzQvNV06IEEgbmV3IExhc3QgTGV2
ZWwgQ2FjaGUgKExMQykgZHJpdmVyIGlzIGludHJvZHVjZWQgdG8gaGFuZGxlIHJlcXVpcmVkCj4g
ICAgICAgIGNhY2hlIG9wZXJhdGlvbnMgZm9yIGRlZXAgc2xlZXAuCj4gWzUvNV06IEFuIEFUQ1NN
VS1iYXNlZCBzdXNwZW5kIGRyaXZlciBpcyBpbXBsZW1lbnRlZCB0byBzdXBwb3J0IEFuZGVzIGRl
ZXAKPiAgICAgICAgc2xlZXAgYW5kIGxpZ2h0IHNsZWVwLCBwcm92aWRpbmcgdGhlIE9TIHdpdGgg
YWNjZXNzIHRvIHN0YW5kYXJkaXplZAo+ICAgICAgICBTQkkgc3lzdGVtIHN1c3BlbmQgZXh0ZW5z
aW9ucy4KPgo+IEJlbiBab25nLVlvdSBYaWUgKDUpOgo+ICAgbGliOiB1dGlscy9oc206IGZhY3Rv
ciBvdXQgQVRDU01VIGNvZGUgaW50byBhbiBIU00gZHJpdmVyCj4gICBwbGF0Zm9ybTogZ2VuZXJp
Yy9hbmRlczogYWRkIENTUiBzYXZlIGFuZCByZXN0b3JlIGZ1bmN0aW9ucyBmb3IgQUUzNTAKPiAg
ICAgcGxhdGZvcm0KPiAgIGxpYjogdXRpbHMvY2FjaGU6IGFkZCBjYWNoZSBlbmFibGUgZnVuY3Rp
b24KPiAgIGxpYjogdXRpbHMvY2FjaGU6IGFkZCBBbmRlcyBsYXN0IGxldmVsIGNhY2hlIGNvbnRy
b2xsZXIKPiAgIGxpYjogdXRpbHMvc3VzcGVuZDogYWRkIEFuZGVzIEFUQ1NNVSBzdXNwZW5kIGRy
aXZlcgoKQXBwbGllZCB0aGlzIHNlcmllcyB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhh
bmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
