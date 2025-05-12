Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F437C3ABC3
	for <opensbi@archiver.kernel.org>; Mon, 12 May 2025 08:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ma+y9ly4fWtOqt+Sh1xUUddyLmBaeO35O0kKQDMphZA=; b=wt8L8bVQy6C5Ax
	4RkTwU/H0IUiKNZstofPUBKzz4LAO0ZzHWisY1z5GXKBbKIqjQZMmRtq5BxwQOl06QKP9UIauut5N
	jD+T8B63yVl0iiEPa5ge1ZB0ikw3Ry//VLjTNQAU8hPN9t1m/dFqfL0GWWxPr97J3hMSMKx8xX+e+
	aCA0VjkaWiK8l5CLh5M6944LodeJCjGeX3zJtIjsltpBLpzYVuKPcDqO6UIeOuzUvZqtwEZhtenW5
	KuuU5QdrfPhGVwj9NoVPUJeFogOOAan5u5CPiD1f4fOClDJuTqrmJ8/G3ShvyK4ikXIMRRKk8Dgu9
	H426bgtCw2yolXcqtggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOUe-00000008k9K-0zHN;
	Mon, 12 May 2025 08:26:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOOT-00000008j5X-28KB
	for opensbi@lists.infradead.org;
	Mon, 12 May 2025 08:20:14 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5fd0d383b32so2328900a12.3
        for <opensbi@lists.infradead.org>; Mon, 12 May 2025 01:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747038011; x=1747642811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFqNtPJkQMW6bqZJqLZd4oMr48a0u3Va/2wx6yUiH80=;
        b=mS5gdltUrdNTnQzLJdwXyCAA3yBdck/wa+Z++wQ6zCwVWnJ/UUvEDsjsnpbFKGdfUo
         BZI5BqTLxh5wxjmcQh7nkBuOT7wLTw94UUrPtx7TCEu+8CJGRqTr3GLfAvKU7JNW15oa
         WPvtUcf6Z7dhGVidHuCM118Me1Huoy+EQ0IkQ1dIkCQ/7pnI6pWMVk6eTgBzsJkyaSn7
         ZrrwEWoEzsnfD78kcwZIgRuRKtoPkFEGzHcewaFwZryCXdO8qgJYbNR74Ke+wGt2nO70
         BggCo7rn9LFI07EwlGXFYRI/lHx+leYIyDD679VdFfwnh13MIORA4bvpWYkho5Ok1/tu
         Mqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038011; x=1747642811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFqNtPJkQMW6bqZJqLZd4oMr48a0u3Va/2wx6yUiH80=;
        b=gze69VuWZCt4DrMwVrINhXFQk9Gh+plxeXlUhWwgozp/zaFufJ97m0HMrpYe5rfnW/
         SuaM6B5V/YiHKh4Lw0GNGNXQaKqiZzvxHwnsVsnbCaOZyV8LLiL63nxeTLbDsvxbTJmd
         po1iirziO+XIspWInw7SH5jdSoaStH+Zdv9wxtyDxYDTNBA8neKguBFh8XDAsiKcXzS1
         cU8czofZJZBs9AdjDNCcHSBvNHghEMOHs1NhkamoTZt/A1KdTOxg9qOWmXMTfERab2eT
         8FqMyE2HEhZ/KKTdDFilnlKlutQdxsaRI7fzm7DrEzS7Q5n9N8XRmBLuKQRheuC+qu+S
         MXIQ==
X-Gm-Message-State: AOJu0YzVwLJ/7YtiRtyErOd4AE3Yg22zVU2EB8V1go4PIsFWGV5sNutl
	yYW7RFKsyeayWmuVeCzUF/SmyIINVNjF2z3vHfGf+Xo/P+PYbQJL78ehrY6FnFOMiTXrRJBYExj
	NucYrQzYB/WoomSwN8QBpNHVAPx2+EaVa86I=
X-Gm-Gg: ASbGncvR/NWukZJJtZIFGR3tcwpHvx66qntDLgE/YS2zOEG/secPzgwiFN2OXMKLlBZ
	Z/iI/I2zS1kx/cwcoBKO5Q5NccMxozkSpcUCtmF48jP3K7WyBa9goL9Y9EImdU2g+yhXgC8Lj7f
	Usr/AKOKXJlAekx3QyJNyIN9aAOSGxemKWPNaOyiozQSvwfd89LgLvBm2TcZCsG+9LUxsCZZbyC
	6r4wA==
X-Google-Smtp-Source: AGHT+IGeleCfeOf/U3owUWvv02Q0OQ64IPulgJUT2GbtE4/IRRhQBFBFwLiQs3iN4jtq8Su/Yc9BQcY9nNJLlPt74Tk=
X-Received: by 2002:a17:907:7fa5:b0:ad2:3f21:a0a3 with SMTP id
 a640c23a62f3a-ad23f21b35dmr687677366b.45.1747038011382; Mon, 12 May 2025
 01:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250512071648.89151-1-jamestiotio@gmail.com>
In-Reply-To: <20250512071648.89151-1-jamestiotio@gmail.com>
From: James R T <jamestiotio@gmail.com>
Date: Mon, 12 May 2025 16:19:34 +0800
X-Gm-Features: AX0GCFvlkfalBMP39p6r5O3zwcJYppq-XX0VDaSSL_0FPqtMWebKNPjocnPJVLQ
Message-ID: <CAA_Li+t9Yrt91SNQen6UH+vrF+UUhLqcPaB_kjtSfr446=eJ_w@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: pmu: Return SBI_EINVAL if cidx_mask is 0 in ctr_cfg_match
To: opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_012013_551366_93A269C7 
X-CRM114-Status: GOOD (  16.12  )
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

QWZ0ZXIgc29tZSBtb3JlIHRob3VnaHQsIEkgaGF2ZSBkZWNpZGVkIHRvIHVwZGF0ZSB0aGUgY29t
bWl0IG1lc3NhZ2UKb2YgdGhpcyBwYXRjaCB0byBzcGVjaWZ5IGhvdyBPcGVuU0JJJ3MgYmVoYXZp
b3IgY2hhbmdlcyB3aXRoIHRoaXMKcGF0Y2guIFRoYXQgd2F5LCB3ZSBjYW4ga2VlcCB0cmFjayBv
ZiBob3cgT3BlblNCSSdzIGJlaGF2aW9yIGhhcwpjaGFuZ2VkIGluIHRoZSBHaXQgaGlzdG9yeS4g
SSB3aWxsIGRvIHRoYXQgaW4gdjIuCgpPbiBNb24sIE1heSAxMiwgMjAyNSBhdCAzOjE24oCvUE0g
SmFtZXMgUmFwaGFlbCBUaW92YWxlbgo8amFtZXN0aW90aW9AZ21haWwuY29tPiB3cm90ZToKPgo+
IFdoZW4gY29uZmlndXJpbmcgYSBtYXRjaGluZyBjb3VudGVyLCBpZiB0aGUgY2lkeF9tYXNrIHZh
bHVlIGJlaW5nIHBhc3NlZAo+IGluIGlzIDAsIHJldHVybiB0aGUgU0JJX0VSUl9JTlZBTElEX1BB
UkFNIGVycm9yIGNvZGUuCj4KPiBUaGlzIGFsc28gYWxpZ25zIE9wZW5TQkkncyBiZWhhdmlvciB3
aXRoIEtWTSdzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgUmFwaGFlbCBUaW92YWxlbiA8amFt
ZXN0aW90aW9AZ21haWwuY29tPgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9wbXUuYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvbGliL3NiaS9zYmlfcG11LmMgYi9saWIvc2JpL3NiaV9wbXUuYwo+IGluZGV4IDU5ODNh
NzguLjYyY2U3NzAgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfcG11LmMKPiArKysgYi9saWIv
c2JpL3NiaV9wbXUuYwo+IEBAIC04NDAsNyArODQwLDcgQEAgaW50IHNiaV9wbXVfY3RyX2NmZ19t
YXRjaCh1bnNpZ25lZCBsb25nIGNpZHhfYmFzZSwgdW5zaWduZWQgbG9uZyBjaWR4X21hc2ssCj4g
ICAgICAgICB1MzIgZXZlbnRfY29kZTsKPgo+ICAgICAgICAgLyogRG8gYSBiYXNpYyBzYW5pdHkg
Y2hlY2sgb2YgY291bnRlciBiYXNlICYgbWFzayAqLwo+IC0gICAgICAgaWYgKChjaWR4X2Jhc2Ug
KyBzYmlfZmxzKGNpZHhfbWFzaykpID49IHRvdGFsX2N0cnMpCj4gKyAgICAgICBpZiAoIWNpZHhf
bWFzayB8fCAoKGNpZHhfYmFzZSArIHNiaV9mbHMoY2lkeF9tYXNrKSkgPj0gdG90YWxfY3Rycykp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+Cj4gICAgICAgICBldmVudF90
eXBlID0gcG11X2V2ZW50X3ZhbGlkYXRlKHBocywgZXZlbnRfaWR4LCBldmVudF9kYXRhKTsKPiAt
LQo+IDIuNDMuMAo+CgpCZXN0IHJlZ2FyZHMsCkphbWVzIFJhcGhhZWwgVGlvdmFsZW4KCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
