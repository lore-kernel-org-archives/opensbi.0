Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291DBCCF9E3
	for <opensbi@archiver.kernel.org>; Sun,  2 Nov 2025 10:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJKrNYG7aWCVf06KFDavPZq8c33isdS/in/i461MfOg=; b=VvXph2ttdsXiL5
	9KehV0EeGc6XbxIGdvu+GtZ9akk8r3507V03AVkN/7lzB6sW/E2N8tZYS9+VImu3Oyw07hfyTbjs8
	9I5BvO4mOKsk8wA3g6H+QLI1S1bmPNV243RSlZ8phwHJYCpNs/XC0sa9iT0E1YXgQce2YnBGDA+Ue
	TVYSTtMrzyTA+XaZeWsr197oK1Z7qHQuUnopjHl4HaiCcpxKjrrDQX4EbknMieSd6TKUM7/Xhyl40
	zMG3cbDE48jYwuPAQcY2Q2zsZqEol/HnGUtepX5Tl+LYKNSA0QK/lgv5oh8TORnx+K+w2YfvsETAR
	VsVEkSukhjDagb96+xXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVkq-00000008UIf-3IJA;
	Sun, 02 Nov 2025 10:56:12 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVkn-00000008UHt-2zbu
	for opensbi@lists.infradead.org;
	Sun, 02 Nov 2025 10:56:10 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-433258101ceso6821105ab.1
        for <opensbi@lists.infradead.org>; Sun, 02 Nov 2025 02:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762080969; x=1762685769; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIB7bONgtTZw6sRvf2OCQqYV8fp1AxoSicMbMpvqcos=;
        b=balr485+8P5wyHLC7PQo6KyYnENiMvOusFIReHzYlkVDRSET1vI61cvZJ3i/LEZZ9a
         ZM7YoCZA05DUqrYjkN9oNtAkiDQ5I+xAKwyzZ/QFltt8XUgQyhUGGXWwYSBflqZGmthe
         /uegpuPNid+Cxv0TvBkZcdgbk4q2nvRV9Qpx4/DGPKsO1GaBqrEGgSQzTCq/kXwd4aHR
         Irn8i8A8F2rJynmHnkzfZNOfIQJfjATeHCSngeEU5OasxrNTqbAfqyMzIncmoCYVu8M3
         Q1mVwUF2bfHvb7FSpxpMljPS5mHDw7BuaE/4b9pfhtrMjEwnyEHQbEsp3dyb0heIRgQi
         UNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762080969; x=1762685769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIB7bONgtTZw6sRvf2OCQqYV8fp1AxoSicMbMpvqcos=;
        b=hRTXBRmF1q4LlZfb0F94N4XdmfXbNhHMQZbmkxlOBCg2wqDcGPyUv2QPYQQCY0OvWa
         jh2pGvZygiOH3fjaPuq6LvoDl1nZgZDHvHkW29hs2NXgylrDoVEQ9nuUbl2TBwJrHRB4
         qk4hTVWb2rYvQXBAer1oXHbUr8QzHBlBNpWZI6dJWr0pP7hmkIexc4+7RO3UpIhAtNxW
         1m8YG824tWiNFo5x9ZkU4l2kAgj22fgdeABgFAl1f0h2WUX1wPAyeSux6BPZBXCi2Jvh
         4QADyy8ILpZ1BA3UQfvwWbjbZuM+Ap8GRw8xEDtIYS15QV3++YB8qRggsNFOm1zmNfp3
         fwsA==
X-Gm-Message-State: AOJu0YxxGjd0HVCcFK0CRZ+DQZP7CvKDTFxD6w4MwdEEgdmzHZ9b0mVP
	T756HeclrDx3ytrnvjgNTDozbUAz1TrM2Hv7FBSEN7uBC0gJNL/RQno3gXhIet7YRcPOG98kHAg
	h0yspFMxZUluqWeqr+hZu1mYeBvTaHsQkqySJySEZYw==
X-Gm-Gg: ASbGncs2PRWiKPFAiFiooittjZ2fBnZ7zcN6oj60bvfBObpJzbdwPA2BvmCNp9ohFzj
	R89DALtcYcz4S4nsJxCI7YkW/JvgBGIrr/6+AnAKmPg+4BQ4jBU7/WwrOcMnB2AzyCRXDoUE7AI
	BulHvj8QOI81WqckWR2JPVxJOujMdAD+Atdhxi2wL70Ija58OBfDRi4bRXXCXjfVH5Ok5uC/MK7
	SN7sgTw8ly6Dh+iUy6ddai+UQDKpwgvzca6fpM8B6e1bbwj0eeWCtl8v6d6ZvDPzEFIUoFDFSQX
	bNY/34n8VkEQIsRF
X-Google-Smtp-Source: AGHT+IHaTwcJ5iJqIteZCKVbzbjf7V4pLC8Lju7Wf6Zzj/p/zrOfMnC6Y2FAmJikLgxdxlX5PVjj+GILmoydm/8WPl8=
X-Received: by 2002:a05:6e02:12cb:b0:430:d371:d3bd with SMTP id
 e9e14a558f8ab-4330d1dbf00mr122815245ab.25.1762080968797; Sun, 02 Nov 2025
 02:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20251008084444.3525615-1-peter.lin@sifive.com> <20251008084444.3525615-6-peter.lin@sifive.com>
In-Reply-To: <20251008084444.3525615-6-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 2 Nov 2025 16:25:57 +0530
X-Gm-Features: AWmQ_bm_iqPYZyvtstsRWtzA0Xx457TnmWGhC_hMxnLmW5OtbCH739lkx_pN3NE
Message-ID: <CAAhSdy0DZOaug8PrrNgjz=_7uvRGLQ=gz3FinGe_DxKJKHRcZQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] lib: sbi_domain: add SBI_DOMAIN_MEMREGION_FW
 memregion flag
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	wxjstz@126.com, alvinga@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_025609_760420_DD330B59 
X-CRM114-Status: GOOD (  14.78  )
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

T24gV2VkLCBPY3QgOCwgMjAyNSBhdCAyOjE14oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSBuZXcgbWVtcmVnaW9uIGZsYWcsIFNC
SV9ET01BSU5fTUVNUkVHSU9OX0ZXIGFuZCBtYXJrIHRoZQo+IE9wZW5TQkkgY29kZSBhbmQgZGF0
YSByZWdpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5s
aW5Ac2lmaXZlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2RvbWFp
bi5oIHwgMSArCj4gIGxpYi9zYmkvc2JpX2RvbWFpbi5jICAgICB8IDggKysrKysrLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5o
Cj4gaW5kZXggYTZlZTU1M2IuLjkxOTNmZWIwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3Ni
aV9kb21haW4uaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+IEBAIC0xNTcsNiAr
MTU3LDcgQEAgc3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9uIHsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBTQklfRE9NQUlOX01FTVJFR0lPTl9NX0VYRUNVVEFCTEUpCj4KPiAg
I2RlZmluZSBTQklfRE9NQUlOX01FTVJFR0lPTl9NTUlPICAgICAgICAgICAgICAoMVVMIDw8IDMx
KQo+ICsjZGVmaW5lIFNCSV9ET01BSU5fTUVNUkVHSU9OX0ZXICAgICAgICAgICAgICAgICAgICAg
ICAgKDFVTCA8PCAzMCkKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gIH07Cj4KPiBk
aWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+
IGluZGV4IDc5OGU2OGIzLi45NjhmZTYxYiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21h
aW4uYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4gQEAgLTU0MCw2ICs1NDAsOCBAQCB2
b2lkIHNiaV9kb21haW5fZHVtcChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLCBjb25zdCBj
aGFyICpzdWZmaXgpCj4gICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIk06ICIpOwo+ICAgICAg
ICAgICAgICAgICBpZiAocmVnLT5mbGFncyAmIFNCSV9ET01BSU5fTUVNUkVHSU9OX01NSU8pCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJWNJIiwgKGsrKykgPyAnLCcgOiAn
KCcpOwo+ICsgICAgICAgICAgICAgICBpZiAocmVnLT5mbGFncyAmIFNCSV9ET01BSU5fTUVNUkVH
SU9OX0ZXKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVjRiIsIChrKysp
ID8gJywnIDogJygnKTsKPiAgICAgICAgICAgICAgICAgaWYgKHJlZy0+ZmxhZ3MgJiBTQklfRE9N
QUlOX01FTVJFR0lPTl9NX1JFQURBQkxFKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9w
cmludGYoIiVjUiIsIChrKyspID8gJywnIDogJygnKTsKPiAgICAgICAgICAgICAgICAgaWYgKHJl
Zy0+ZmxhZ3MgJiBTQklfRE9NQUlOX01FTVJFR0lPTl9NX1dSSVRBQkxFKQo+IEBAIC04OTMsMTMg
Kzg5NSwxNSBAQCBpbnQgc2JpX2RvbWFpbl9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRj
aCwgdTMyIGNvbGRfaGFydGlkKQo+ICAgICAgICAgLyogUm9vdCBkb21haW4gZmlybXdhcmUgbWVt
b3J5IHJlZ2lvbiAqLwo+ICAgICAgICAgc2JpX2RvbWFpbl9tZW1yZWdpb25faW5pdChzY3JhdGNo
LT5md19zdGFydCwgc2NyYXRjaC0+Zndfcndfb2Zmc2V0LAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAoU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9SRUFEQUJMRSB8Cj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfRE9NQUlOX01FTVJFR0lPTl9NX0VYRUNV
VEFCTEUpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0RPTUFJTl9N
RU1SRUdJT05fTV9FWEVDVVRBQkxFIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFNCSV9ET01BSU5fTUVNUkVHSU9OX0ZXKSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJnJvb3RfbWVtcmVnc1tyb290X21lbXJlZ3NfY291bnQrK10pOwo+Cj4gICAgICAg
ICBzYmlfZG9tYWluX21lbXJlZ2lvbl9pbml0KChzY3JhdGNoLT5md19zdGFydCArIHNjcmF0Y2gt
PmZ3X3J3X29mZnNldCksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChzY3Jh
dGNoLT5md19zaXplIC0gc2NyYXRjaC0+Zndfcndfb2Zmc2V0KSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKFNCSV9ET01BSU5fTUVNUkVHSU9OX01fUkVBREFCTEUgfAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9X
UklUQUJMRSksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfRE9NQUlO
X01FTVJFR0lPTl9NX1dSSVRBQkxFIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFNCSV9ET01BSU5fTUVNUkVHSU9OX0ZXKSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJnJvb3RfbWVtcmVnc1tyb290X21lbXJlZ3NfY291bnQrK10pOwo+Cj4gICAgICAg
ICByb290LmZ3X3JlZ2lvbl9pbml0ZWQgPSB0cnVlOwo+IC0tCj4gMi40OC4wCj4KCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
