Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0670C624DE
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbmBJKnk18UPVP38XwPwZmnRVP4OnFVKSn96kCKGHfA=; b=z23NVwtUhfpxKL
	xXyg8amUk+B5nq3Gbj9mRXdC3Slst7PNEzuKyw82qdegRdWW5hUotCNhPJawiPQQeQGEubwtKFx4d
	GSu9+ZabBc9+zgLE1VBku2zzfZ5PJnisNQQHiv/LHwlgDcIY3A8njNJ56mP2LeFdSK2wMstfAexwQ
	JLBhdTcEmEnlwVbn9cMMxFmV/W42k3g52oWc9b9+1cc3waXK5fNenNJyswbOhqAsMZy0c9590yoXQ
	ZbF7EEv3LGLXt6g3kfHCYrnBkCP64QPKqOQKJee9zCOJZEBq88bADwWQRty7Xyx5Kjga3/Tcw6zSR
	VW/pJFmxfL8EtIYbg9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P95-00000001MO2-0FUu;
	Fri, 04 Sep 2026 08:19:35 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P92-00000001MNg-2eYr
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 08:19:33 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3a1981228f8so7329701fa.1
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 01:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788509970; cv=none;
        d=google.com; s=arc-20260327;
        b=ru0kbLeAEA7zDYL4wWJS9qjooLP8CvItkpIht6cx8XojXJTSxPL/Y35K2EIr+1T9CW
         7rxP9ioBtC0/wMUw0NBBuv7e+BOQTqAgokI1p3F9iGA+fVHoSNcnEUzKuM0wXO4vcJOH
         dlfOn7JmcZYByN2NOk5ZBacBXc1m1aD6qh21QhYCwJ4RktBoNQAJLGitOsBM23u2tBjL
         EYJ1IYdg+qDwv9dzrlWv0vAGb4mGHz7VYUM/sQls16bM+X864yyPt5pDuxI7zuO20adk
         XTC5lciIr08r7RlsJ7u4vlbdpgK9xUQIrqsZAustwn/AjDQVdHqr8xsC7F34hZjFRYsj
         eCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egwNjjItP5ASdbnc4NQUkl959IRNS7F5XWrP00spAwY=;
        fh=ZWLa82ykAwJkuvh5Md1WwEfVAVY4U4beZ/cGpAok4QE=;
        b=kiAuvzwAaIQ1qLbdt4rAabPt7HH4KuY35a5LY3JRfPlUKG7UkRcquUvh1q1E00BPFK
         /PZU9HD/QvSglQZO+pHSQRAN0RVfiuQ+yOlOIRT4e2HXHaWR1fGhUKNZkQGLdWXjhSq0
         TGAV22N8QxYAbS6/te+mk5ulGnuvsCYqAUQ8ExOYBRna3pqyUyi8gb7luPc4P3Vtz0dS
         D+2xW6MvocOC9nkxJj5yug67uhql/6y2yGfWxKjfgHIaTdxHdWUgVq2vfYJaZLYYu3dT
         LL2/Ts8URCrARBKCv8Z6PajiAqpTQUpo9+DAY6Q5pGsBfplk8mdAHxjGZ4bKRzBFhdCr
         AgPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788509970; x=1789114770; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=egwNjjItP5ASdbnc4NQUkl959IRNS7F5XWrP00spAwY=;
        b=XbGjaXrpCVEZa2iFUgb/XVEpHJCMs0XuyVIyIJKHaStR8Arze5qxjHQ4kgVA2/wz1E
         TinheZ6u+WVgb2bI3dggxix//aL1fG/JvKAIeXSD52XV/YN26kw0QtjJTEElUKYYAlU+
         WiY0Mv9Pi55gENU1uMPlQ/ShUt/2agX8vkSocTd+EMLusegHMnpyKrqa5CS3b59zRZaV
         xxjDW/8t04BdzATEU0zl4PH7+08oLrLGFxqDliTxkHtT52+CVwdUDuChKkCeKfWmOmzD
         oP5QsH563av1wzNj2xBSxCF7Hzic62JtqZf1tsyssQ3eRq90EVV70MX2wy52Z9IBjxG7
         CzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509970; x=1789114770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egwNjjItP5ASdbnc4NQUkl959IRNS7F5XWrP00spAwY=;
        b=SGJO8xqnfCC6X38u/x0PjJnDvzzz9NuAzxo6zD6YvS/uoAwpptDxijrup4mNdJAvYR
         kZ/MggGzWzvga9MODloVcKbHooC2vGxv69hswMA33gXXix6sfmp4jSRl2wPkgFDSqk9O
         63vjFScBHBUxDFejshKd4WdDjcqH+Pfh7LzJo3jVfILMiGmmPOWb9hXZeCJ+65mGZVyy
         DQfgcsWhV3iz9/JOEE7Z8gecOyLTon5YreS1wAxPGH3IXEDqwj6ynyVneQdXlETgWcWq
         iJi0EGqwBmyoMtQdLhaCGtfqI7eMVQCp7UoIoukOV/qg4tmwR7BuRPOrF60EE5EjnEiR
         Ih7Q==
X-Gm-Message-State: AFuF++my3sC7mHodP5FS4MAnAkX3bh0P969FhfS9CrszpKEk9G7ioMkR
	gmsv5in0s2PJiQBrGszK/aKy5QOOHac3CzJh/QnvKSCVifcG9WeDLxsMu0CLu722Cxt19iJdiUo
	Kh1RKufPtHsLCfayq2ophkX3ZJBdQuBvQ4nolhC7i1ac4VSBm73F0R1U=
X-Gm-Gg: AYBFou0uWgqx8f9ZfXSUUanE9XKoSSSMbVciKMCFE1maAzRqvbizMrth6l2+RhMb8TT
	qngvqSP35eBWp0VfsgiSR0+HbpPISriE41GNd6riyKgZkstSVayVn2CGl/vgsBfkTtN1LNHbFQW
	v8z8rJB2lRv19Ddaj1ZTT/Dnk4K9lk64jTbElmDMpeN69gizWI6hAi4L5rlYj/ffDGp8vfYoeX9
	yGVX2LIng+PAOTuF4yi9yPympC7Fr8AyhOnju/ikR7MsW2mvzkRzQcUDeRVI79dKixBZBNCRG5+
	UhxlK0UkV/sndddkCT0hggPRx3g9C+/Tt6uq/57DQ3yoCMZqkva93Gv6YAcJesd3r41iyH8g1qQ
	c0eP8iZhtJ53w/rd+E7jb/GMI3t2P0179gNI4Qqq+MVbWlNJi4wZqPPMFG1sI4l8=
X-Received: by 2002:a05:651c:1595:b0:3a3:749e:31a6 with SMTP id
 38308e7fff4ca-3a3749e33a6mr2519921fa.26.1788509969928; Fri, 04 Sep 2026
 01:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260805093354.1022980-1-ben717@andestech.com>
In-Reply-To: <20260805093354.1022980-1-ben717@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Sep 2026 13:49:16 +0530
X-Gm-Features: AcwNN1VFdKF2kSwSpYTfvf_a0rNv3UJpLoEhQwEMyWucoFiiLEnbufBgqCL9hTc
Message-ID: <CAAhSdy3Vf1NjHSJFCJjxKtre6v6w4Q=axuSko++AocTZ2toLAg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: respect scounteren when emulating timeh
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_011932_690919_525F422B 
X-CRM114-Status: GOOD (  16.46  )
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

T24gV2VkLCBBdWcgNSwgMjAyNiBhdCAzOjA04oCvUE0gQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3
QGFuZGVzdGVjaC5jb20+IHdyb3RlOgo+Cj4gYmVlZjJmNjkzNzg1ICgibGliOiBzYmk6IFJlc3Bl
Y3Qgc2NvdW50ZXJlbiB3aGVuIGVtdWxhdGluZyB0aGUgdGltZQo+IENTUiIpIHJlc3RvcmVkIGl0
IGZvciBUSU1FIG9ubHksIHNvIG9uIFJWMzIgc3VwZXJ2aXNvciBzb2Z0d2FyZSBzdGlsbAo+IGNh
bm5vdCByZXN0cmljdCBVLW1vZGUgb3IgVlMtbW9kZSBhY2Nlc3MgdG8gdGltZTogcmR0aW1lIHRy
YXBzIGFzCj4gaW50ZW5kZWQgd2hpbGUgcmR0aW1laCBrZWVwcyByZXR1cm5pbmcgdGhlIHVwcGVy
IGhhbGYuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZW4gWm9uZy1Zb3UgWGllIDxiZW43MTdAYW5kZXN0
ZWNoLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhh
bmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9lbXVsYXRlX2Nzci5jIHwgMyArKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX2VtdWxhdGVfY3NyLmMgYi9saWIvc2JpL3NiaV9lbXVsYXRlX2Nz
ci5jCj4gaW5kZXggYzIyNTNjODJjNTI3Li40NTU4YWJmZmI4MWEgMTAwNjQ0Cj4gLS0tIGEvbGli
L3NiaS9zYmlfZW11bGF0ZV9jc3IuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2VtdWxhdGVfY3NyLmMK
PiBAQCAtOTAsNyArOTAsOCBAQCBpbnQgc2JpX2VtdWxhdGVfY3NyX3JlYWQoaW50IGNzcl9udW0s
IHN0cnVjdCBzYmlfdHJhcF9yZWdzICpyZWdzLAo+ICAgICAgICAgICAgICAgICAqY3NyX3ZhbCA9
IGNzcl9yZWFkKENTUl9NQ1lDTEVIKTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAg
ICBjYXNlIENTUl9USU1FSDoKPiAtICAgICAgICAgICAgICAgLyogUmVmZXIgY29tbWVudHMgb24g
VElNRSBDU1IgYWJvdmUuICovCj4gKyAgICAgICAgICAgICAgIGlmICghaHBtX2FsbG93ZWQoY3Ny
X251bSAtIENTUl9DWUNMRUgsIHByZXZfbW9kZSwgdmlydCkpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIFNCSV9FTk9UU1VQUDsKPiAgICAgICAgICAgICAgICAgKmNzcl92YWwgPSAo
dmlydCkgPyBzYmlfdGltZXJfdmlydF92YWx1ZSgpID4+IDMyOgo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNiaV90aW1lcl92YWx1ZSgpID4+IDMyOwo+ICAgICAgICAgICAg
ICAgICBicmVhazsKPiAtLQo+IDIuMzQuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0
Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
