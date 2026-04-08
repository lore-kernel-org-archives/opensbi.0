Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E70C1073CA8
	for <opensbi@archiver.kernel.org>; Wed,  8 Apr 2026 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmjdvQe0as3Mb/ljuGtC7G9YbU8RXQkfpG6HId4sa88=; b=C4locj1CN1dUL9
	FRi3+/ohPKfi92PNOpd47Ej6ns7m6Rp9jeLzjwjzLxsKlIFleaX7h05nCPM1YXDnR5q35YaTVzTdS
	erC1nfaer6K3U7IF8OnkjH/3OQSFvOAmcOvYnjUSYZCysktihj5LrSo1tfK6C3XYVDMvHrYGSkLzn
	gP9ABGECs7wJjFmwZMpa6vMNC8jGrzBMgKScR1alXEzk9BMNb2eCiHjNmlwDP/qEB911208MRxS9e
	F6lYPLUTSuwpJgKNhIgimx8P7W7ElUFOeocgSIzzBHJkJHXlBLmmbGTjOeHYyrJo1c9O2TN3g+TzH
	E4/pmlEdkOIFP4+YGeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAS9z-00000008rYE-2bUB;
	Wed, 08 Apr 2026 12:37:31 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAS9w-00000008rXh-3s2F
	for opensbi@lists.infradead.org;
	Wed, 08 Apr 2026 12:37:30 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-662efd1bdd4so529823eaf.0
        for <opensbi@lists.infradead.org>; Wed, 08 Apr 2026 05:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775651847; cv=none;
        d=google.com; s=arc-20240605;
        b=D3BciZ6lt4wuRYvWRrJ4LkEwp9/nYrGOwvSzD80cmJSiv5Ku6zJGy07wbo/llXPS7T
         JUTLoqzN16s3a+65rHiuPMgtj+FbMltFk7KPdd1dnShIF2y7h2woNz3VLp1uyCVRy/Fx
         GCAZa9ynrH2cboXf696YxjRISixoV5hOmaWQhqGfUFr0HTDA4KweTkG6YaWStyuNFrM4
         ZDXR7560jxyVZxP1qK0mtsrLgzzFJX0LI2BljutA+BgNPKz8rDBss5YNdNw5bz/3G8gm
         druVTftAcD64YfZjifScjPM35jCkFhWT0aSNudOCBfsDsvhcESD7TBEVY+HwJdOdEOkT
         3iqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+ac2dTtksY5lwnv/V7ig6ZtMMPPj9kR4RZZyN6DFMY=;
        fh=quIBDCwyL+NdS19WyrXWv/i7j0ls8eORWbpFbsrsN/o=;
        b=fWIv9MJtszA9ocAF3w9GtIpfhyT5uhUq0IqPoE0BcjX5iOfLX2Xk424BSKDM9edz7f
         eVG2VkAV2l0YzcJxOkV0m1Jl7Wf9/Uyha6kA+PUwF+qtYjmnFdR6jvTMmyl52iUrAISK
         8Yg+U1hp+/wSiUQIVcXw1C/V1pqvBlX8fjwF40ptE044kGrhPeRKLc1CGVvbQai9AMu/
         OzCuCe60I3WvS3I1CxR1KBaRhAiuX0lwPCbVVhEgbyVfeli43/54Mgu3SySc1A2A9+JB
         hOt5NGlDIYc2tVj7NbuqhbpPqPpWiLl9Ka7+TXqsTK38qEgvyH2rkrMXuz+v7uZly3n5
         QM2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775651847; x=1776256647; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+ac2dTtksY5lwnv/V7ig6ZtMMPPj9kR4RZZyN6DFMY=;
        b=S3gLSakoRHFpfAESM8h8HuE2d5C9cIAaFq2wbSIwBIJqRsLvuTDeWsDjraRSyFsYdT
         jtrnXZ4HOfuKQocwhZwD6lEekL2ZCcc1nHlt9kBeWsbjjxjb/816C6ctjmeMylIMSgOZ
         isp8VdMJQF2vlAIkroZPtJeDw3JyRv82nhsWXYBF2YmAGXuHDbBjAKq5ORkqX+SDr4Vi
         75WzsnlgWSFwhApc5CD8zRSGNq38WrMn4Ak/CvfIhbEob1IUBOcuNRK6Ze79kbGxoWXK
         vRYUcm2wPukWOvy9mpiCeXN8EKEnoRLb4BesU/7eCIDQK02ljpjkVn0Q2lLwdifeGLgE
         jBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775651847; x=1776256647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+ac2dTtksY5lwnv/V7ig6ZtMMPPj9kR4RZZyN6DFMY=;
        b=aTc1jX55AQyGHQ8H/3o96C8GyvBQ43l03PLrGPsdvLSgCdRXK5GbiXrRXkU/vpPb5Z
         gIuA4F9ssBEb50skYC0ZiqUI9QAoFO1ninbp9d9APxtM2ZJaqCONUzI15YlbNZRfloeb
         uK2ecbYlC+op92H6i3vZbwrVqETE39A1XNEPJpszES+Q9jVFVZlR50wZP713EioD2MyA
         DKoTcS5vhrZHAKLiFpIFPggT17J3Ea6emideWKY9/ql7I3gjHpcr9hn2vbdHA39eSECr
         KtVCaFCzoHXCDJo0jjJJDP4+0w2lCie7WR3kbrdoyjchMdoiNXk06BJ/l5KOeqVX0fEg
         0FnA==
X-Gm-Message-State: AOJu0YwY9BOMZfuGFNM4jLN8IGc+uEPODDNPbZzONPiP+DtUsVw92FIJ
	2x/Qgce+9HVwNhoFyvhLmJFkfraI7mKT4c4WAzA5z8Ktc51hWcgJh9wWSYwTgotdXE8lBmJQ9vg
	ManJhAZA4pGzPxwebe1tE1pIjZAUrn9vqwO4ohLRNBA==
X-Gm-Gg: AeBDietoDG0S/QwyDUIF1hNMRbDskgy9yMNkBuBkfMRFxFF1SRq5xmOhIt50xxI/K1f
	56bQy6g0x9LTrQUW6GlPDiMOKSNFJHwAzEM12fezZibdsdRoF5R5iqjjihNOOXkVwqNlb8bryIP
	axbHL8zHYrIarfNqMIo71EOxLJTOtI88KHjjK7kGc04oTwKcA+15bHoOW8DWYt+Lpyv7QOJGGk+
	qbFr+jTK2NJloKa9gVL7v3EA7Z0msJkL2n2UCyC2Y6iZdMm14I78dPE42Mp86pqjEM7mf7FHj1N
	A2NI4RfFj6Zw9E5erhTOdi7zalAJ8903CfxBG/aJRyl2JLwIuXpJvUV1swoWFiTIuCJCPB1hJDp
	YfbXAznjggXeqbIUhAwBz5UZEpgXdTDbAgt8xbA==
X-Received: by 2002:a05:6820:610:b0:682:90cd:75b5 with SMTP id
 006d021491bc7-68290cd83c8mr10810589eaf.31.1775651846904; Wed, 08 Apr 2026
 05:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260311125116.1401002-1-peter.lin@sifive.com>
In-Reply-To: <20260311125116.1401002-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Apr 2026 18:07:15 +0530
X-Gm-Features: AQROBzBY3nTFJxmkw0y9SwhrjHTTBytvkXg9L6qm5eHg8qE4Z6GNmlRHP_e-wWo
Message-ID: <CAAhSdy0uiVFiwrjgX_kQaXPDN2djTWMMTBsdoTtjsh85jWDi9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] include: sbi_bitmap: add bitmap_empty() function
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_053729_215154_EE0DCD7E 
X-CRM114-Status: GOOD (  18.45  )
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

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgNjoyMeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIGJpdG1hcF9lbXB0eSgpIHRvIGNoZWNr
IGlmIGJpdG1hcCBoYXMgbm8gYml0cyBzZXQuCj4KPiBVbmxpa2UgYml0bWFwX3dlaWdodCgpIHdo
aWNoIGNhbGxzIHNiaV9wb3Bjb3VudCgpIG9uIGV2ZXJ5IHdvcmQsCj4gYml0bWFwX2VtcHR5KCkg
dXNlcyBzaW1wbGUgbm9uLXplcm8gY29tcGFyaXNvbnMgd2l0aCBlYXJseSBleGl0Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KCkxH
VE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxp
ZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+
IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfYml0bWFwLmggfCAxNiArKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9zYmkvc2JpX2JpdG1hcC5oIGIvaW5jbHVkZS9zYmkvc2JpX2JpdG1hcC5oCj4gaW5kZXggNTk2
YmNjN2QuLjgwZDNmZTNiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9iaXRtYXAuaAo+
ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9iaXRtYXAuaAo+IEBAIC0xNDMsNCArMTQzLDIwIEBAIHN0
YXRpYyBpbmxpbmUgaW50IGJpdG1hcF93ZWlnaHQoY29uc3QgdW5zaWduZWQgbG9uZyAqc3JjLCBp
bnQgbmJpdHMpCj4gICAgICAgICByZXR1cm4gcmVzOwo+ICB9Cj4KPiArc3RhdGljIGlubGluZSBi
b29sIGJpdG1hcF9lbXB0eShjb25zdCB1bnNpZ25lZCBsb25nICpzcmMsIGludCBuYml0cykKPiAr
ewo+ICsgICAgICAgaWYgKG5iaXRzID09IDApCj4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVl
Owo+ICsKPiArICAgICAgIGlmIChzbWFsbF9jb25zdF9uYml0cyhuYml0cykpCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiAhKCpzcmMgJiBCSVRNQVBfTEFTVF9XT1JEX01BU0sobmJpdHMpKTsKPiAr
ICAgICAgIGVsc2Ugewo+ICsgICAgICAgICAgICAgICBzaXplX3QgaSwgbGVuID0gQklUU19UT19M
T05HUyhuYml0cyk7Cj4gKyAgICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBsZW4gLSAxOyBp
KyspCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNyY1tpXSkKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArICAgICAgICAgICAgICAgcmV0dXJu
ICEoc3JjW2xlbiAtIDFdICYgQklUTUFQX0xBU1RfV09SRF9NQVNLKG5iaXRzKSk7Cj4gKyAgICAg
ICB9Cj4gK30KPiArCj4gICNlbmRpZgo+IC0tCj4gMi41My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBt
YWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
