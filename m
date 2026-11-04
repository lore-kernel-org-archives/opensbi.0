Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B85606A31B
	for <opensbi@archiver.kernel.org>; Wed,  4 Nov 2026 05:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RcZt9RJM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=IB9soPMn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RNqJyZrzhH1F7CUOXGeuM0m8HsE1tNV8hUVQNht2aug=; b=RcZt9RJMknKYfBxNk+TwXuylX1
	t1YBg356GyJ9IhrO2fISwLP0BMUqdVBZthpYUpQXXS/AYv2b895m53MHkEGF4r5YU43JZB248Da/g
	OV6VJGoS3qo31aOjkR18diAtciqm7b+Ia8Rl07ZKNnTJG1rM6APTqmHgwN2mBqWJ/8yDxaGBROIpm
	x8R3JWLoXLzywPjTFaVuCgqSy2p3L/T29QTHwycAjuhSpJno4mAHQGCGjsIbcV/FqIcGSvNc8Jxw2
	KutVeX/oJgzujgENEw/LA3U0nQVw0H7TUaKbyFtNRWD84UlluzqEC32ZJ6qwrYiLpRVEiOD6e3oAk
	KUnhdaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTsf-00000004MT7-1gut;
	Wed, 04 Nov 2026 05:49:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTsc-00000004MSR-1asn
	for opensbi@lists.infradead.org;
	Wed, 04 Nov 2026 05:49:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4b467581b98so1131835e9.0
        for <opensbi@lists.infradead.org>; Tue, 03 Nov 2026 21:49:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793771388; cv=none;
        d=google.com; s=arc-20260327;
        b=VXIpE9jmDYhQIORCpOiTobxncBL7EFpZr9ulgxGHajvjyf2do5le+Z0os/tzRmrO6P
         9pK2w5YaPyOZmBvtT4vhQu+L3Mw7A6Mp8STZjcLA+zDuIdNnZaAskmBVQIX/N1dUhRkz
         3QQvSpV9bZvfz2WlU+7KcvJVxeurPfP78g9nYcGyNBimvj2XdPW2vaOvmJACu8zkaxE0
         J3RElOr8EC2s2aKmJBg7Gt11YVkeRknOgEndPXxM1SVPNHsSGZxSoSF7xzj0NvWPuCfp
         eauSAigyiwXe8cjjm6xrXpPqI9A02IMC9Epn6e/TQA2emyERaDpE23bUb8FbYfS0XBdq
         6Aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e0NPYIgFTCXasd/xNIuoq/x8vOX85LwsvQefcSnfsfA=;
        fh=kzaInViZNSOfpfRS6IdHZX/H7OfEmg1t+EHUNhdJ0Xs=;
        b=oc+GAZj2kuAY5YUXSVtsV4cmdZqb0mfafS2V2W/FQ73lFfQUvz67E4lMSbxK8kumME
         jBdBTpoHYe0tcFhjFXvvnf6sj5VSQE40frXv4b/jArf6qRfM2XbLrmzOfZsWc1p4Oc6y
         MGWaalJPuxsm6cW/NFjDUZBH+kSd5L4cil6Dv2JVR2gHEb00ivDY79lqg10P4x5JZhqw
         p88VzeOfbnvvHz9oyb+XffZwcdyW0Ra6vFCm1Rm9r+QIMHzdJvzBkxSH/3MXRahKgsEi
         6iVJmDP8PBMnXAZ1yFFc5zQIL447Uv70yqhsrmt5SeXVzPUgH9TbXIHIbAbXjXAQ00Sg
         xSEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793771388; x=1794376188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e0NPYIgFTCXasd/xNIuoq/x8vOX85LwsvQefcSnfsfA=;
        b=IB9soPMnNIcW2q5Oodb2mhLE/oDZNsk9yLxDMtfXw6mHIZdObOeDDdw4gk6KTeM9D6
         XghvocTOV/XKyvBQU2r/qxmjhoyybiQPwcoaAa7KUkYDqSNRC0xqwm8OVxpFNoFM2nT7
         nRh2RODAhHXyGnnngLCaYz2fQMlPttRrIQEM8mZuh1KeM8iwZwt8g0d+CMb2PeSeEz3W
         QyJ1mj+Ytj+WU0RUNaQLnwiaUF3Zpuze2+I1R6OTl8c8PpuuqZwsfskQPmNDgVDCLGUc
         NjvUNUQWKMH8WWP9p9Ob85fWZt186ceInMcyszq5TF0nXVaUznwRF80CQ1lR7/cAqJkT
         cvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771388; x=1794376188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e0NPYIgFTCXasd/xNIuoq/x8vOX85LwsvQefcSnfsfA=;
        b=A0Ykou0oxcA/eAfvdZtD6f4HJBHtTFCPuCxWLjHH6WDTvi4eVF+Y1vGTpBY0PO6Wf+
         DL/4t9PtL+pdxS3XRRrHsRoK0/JpJZO4px9OCsJxzY/IB1f1n2oolpctSOozUp4rlJgt
         9WhS3lMPNTdYVs5GLuahIq19Jcz/hxv+EoakWr0joqL9NZuTy2jSrf8q6l8ggfW+NEv8
         TicYx0uEASfMN/uPPIz9QuLUX47VMU/0xM/fTmUTiyapX6jeIBIHT94qnW3pGLfw/HUP
         zyWvenF4zZaZf80ICTwQxID9tqNi8cWoBgWnvUDSuqm4v9LbzU0MRx8qgm4zWiE5tG/c
         lQfA==
X-Gm-Message-State: APuU4Z9/tEN/nk5yCgrCLJ+tfn8ndgeon2FymA+RqDQqA7qnE6Zk5Wjb
	ATHDMysoYWPBMd+BBoQNJkF5P/pj880CeNki7RXnb/HhVFq+L2SaAHulIwELSAoJTiygyQB7G0D
	biwIn4A/rEMJ0v1e9EMrexo9X8KLgVgzNasbJ0yaJ5w==
X-Gm-Gg: AYBFou0Bi+Qo/n9YjqcFUhtFMf6rRSRkN7y+pFGJrO03FljSaQzHwIaV8r0hH9KfSdr
	pu/7tZWkzCmbIVv+5PSCNOa5du5LU6yWHyBbYSGjFwW6vWoOvuPQFHmOeugVdjTY4eWI1HFq6mQ
	UG0g5nIjUrGZljVwTbWVoUKz+uyfMGSeTpRDIEmP7THEANLFuJ1zj/ZOZXKrWF8N0SbZP+2MGox
	RySgKi+I3C+Vi5pGlG1Gacdx+p2WTh7jmjWDoa5gTh0TMbDUpQwu6eeqRd8Eh1VL5eDmeqJqTlw
	YD3+GN0BPFB4HRSDo+TXXEvo1Q5t6hVTwvdV5uEDU7pInD5ls2R4HUjIKsogT7P/taO0SSV32x7
	/7BHJ0a3f83Vl0YYolj99NSijxqWAgtdMufn+xJF5xbaGw7Q5+OdbOaV3iqkpKlvymETjlwBDR4
	QnDbliZ9M1qJVq890b96ycHSXNQZLmw9APJu6QDng5suQjuNLNOjautFU=
X-Received: by 2002:a05:600c:6384:b0:4a1:702f:c736 with SMTP id
 5b1f17b1804b1-4ac150b20famr349344065e9.3.1793771388098; Tue, 03 Nov 2026
 21:49:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261006193637.735638-1-nickolai@csail.mit.edu>
In-Reply-To: <20261006193637.735638-1-nickolai@csail.mit.edu>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Nov 2026 11:19:35 +0530
X-Gm-Features: AclHuK-bTo4SnW_b3g3M9K0tL-NPQgf8EATH_ArHoQ41KGlApwVypyuRefvtKds
Message-ID: <CAAhSdy3hFT8-oeZ_rybXZ7Gr79pehC0+diq-f=ZB0W2jyN7BhA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Refresh the root memregion count after sanitize_domain()
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: opensbi@lists.infradead.org, 
	Nickolai Zeldovich <nickolai.zeldovich@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_214950_461366_90E89F5D 
X-CRM114-Status: GOOD (  37.43  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgNywgMjAyNiBhdCAxOjA24oCvQU0gTmlja29sYWkgWmVsZG92aWNoCjxuaWNr
b2xhaUBjc2FpbC5taXQuZWR1PiB3cm90ZToKPgo+IEZyb206IE5pY2tvbGFpIFplbGRvdmljaCA8
bmlja29sYWkuemVsZG92aWNoQGdtYWlsLmNvbT4KPgo+IHJvb3RfYWRkX21lbXJlZ2lvbigpIGNv
dW50cyB0aGUgcmVnaW9ucyBvbmNlLCBidXQgc2FuaXRpemVfZG9tYWluKCkKPiByZW1vdmVzIGNv
dmVyZWQgcmVnaW9ucyBvbiBldmVyeSBpdGVyYXRpb24sIHNvIHRoZSBtZXJnZSBzdGVwJ3MgbWVt
bW92ZQo+IHVzZXMgYSBzdGFsZSBjb3VudCBhbmQgcnVucyBwYXN0IHRoZSB0ZXJtaW5hdGluZyBl
bnRyeS4gIEl0IHN0YXlzIGluCj4gYm91bmRzIHRvZGF5IG9ubHkgYmVjYXVzZSB0aGUgYXJyYXkg
aGFzIFJPT1RfUkVHSU9OX01BWCArIDEgc2xvdHMuCj4KPiBSZWNvbXB1dGUgdGhlIGNvdW50IGFm
dGVyIGVhY2ggc2FuaXRpemVfZG9tYWluKCkuCj4KPiBGaXhlczogMGQ1NjI5MzgxNzMxICgibGli
OiBzYmk6IEZpeCBzYmlfZG9tYWluX3Jvb3RfYWRkX21lbXJlZ2lvbigpIGZvciBtZXJnaW5nIG1l
bXJlZ2lvbnMiKQo+IFNpZ25lZC1vZmYtYnk6IE5pY2tvbGFpIFplbGRvdmljaCA8bmlja29sYWku
emVsZG92aWNoQGdtYWlsLmNvbT4KPiBDby1BdXRob3JlZC1CeTogQ2xhdWRlIEZhYmxlIDUuMSA8
bm9yZXBseUBhbnRocm9waWMuY29tPgoKTG9va3MgbGlrZSB0aGlzIHBhdGNoIGlzIGJhc2VkIG9u
IHZlcnkgb2xkIHNvdXJjZSBiYXNlLgpUaGUgcm9vdF9tZW1yZWdzX2NvdW50IGdsb2JhbCB2YXJp
YWJsZSB3YXMgcmVtb3ZlZCBhIHllYXIKYmFjayBieSAibGliL3NiaTogZ2V0IHJpZCBvZiBzdGF0
aWMgdmFyaWFibGUgdG8gaG9sZCByb290IG1lbXJlZ2lvbnMgY291bnQiCgpGb3Igbm93LCBJIGFt
IGlnbm9yaW5nIHRoaXMgcGF0Y2guCgpSZWdhcmRzLApBbnVwCgoKPiAtLS0KPiBUaGlzIGJ1ZyB3
YXMgZm91bmQgaW4gdGhlIHByb2Nlc3Mgb2YgZm9ybWFsbHkgdmVyaWZ5aW5nIHRoZSBjb3JyZWN0
bmVzcwo+IG9mIE9wZW5TQkkgb24gdG9wIG9mIHRoZSBTYWlsIFJJU0MtViBzZW1hbnRpY3MgdXNp
bmcgTGVhbi4KPgo+IFN1bW1hcnk6Cj4KPiByb290X2FkZF9tZW1yZWdpb24oKSBjb21wdXRlcyBy
b290X21lbXJlZ3NfY291bnQgb25jZSwgdGhlbiBsb29wcwo+IHNhbml0aXplX2RvbWFpbigpICsg
bWVyZ2UuIHNhbml0aXplX2RvbWFpbigpIGNhbiByZW1vdmUgcmVnaW9ucyAoYW55Cj4gcmVnaW9u
IGNvdmVyZWQgYnkgYSBzdXBlcnNldCByZWdpb24gaXMgZHJvcHBlZCBhbmQgdGhlIGFycmF5IHNo
aWZ0ZWQKPiBkb3duKSwgYnV0IHRoZSBsb2NhbCBjb3VudCBpcyBuZXZlciByZWZyZXNoZWQsIHNv
IHRoZSBtZXJnZSBzdGVwJ3MKPiBzYmlfbWVtbW92ZShucmVnMSwgbnJlZzEgKyAxLCBzaXplb2Yo
Km5yZWcxKSAqIChyb290X21lbXJlZ3NfY291bnQgLQo+IGkxKSkgbW92ZXMgbW9yZSBlbnRyaWVz
IHRoYW4gZXhpc3QgYW5kIHJ1bnMgcGFzdCB0aGUgYXJyYXkncyB0ZXJtaW5hdGluZwo+IGVudHJ5
LiBUb2RheSB0aGlzIHN0YXlzIGluc2lkZSB0aGUgYWxsb2NhdGlvbiBvbmx5IGJlY2F1c2UgdGhl
IGFycmF5IGlzCj4gYWxsb2NhdGVkIHdpdGggUk9PVF9SRUdJT05fTUFYICsgMSBzbG90cyBhbmQg
dGhlIHN0YWxlIGNvdW50IGlzIGJvdW5kZWQKPiBieSBST09UX1JFR0lPTl9NQVguIFJlY29tcHV0
ZSB0aGUgY291bnQgYWZ0ZXIgZWFjaCBzYW5pdGl6ZV9kb21haW4oKS4KPgo+IEFuIGV4ZWN1dGlv
biB0aGF0IHRyaWdnZXJzIGl0Ogo+Cj4gc3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9uIGlzIDI0
IGJ5dGVzIChvcmRlciwgYmFzZSwgZmxhZ3MpOyB0aGUgcm9vdAo+IGFycmF5IGhhcyAzMyBzbG90
cyAoc2JpX2NhbGxvYyjigKYsIFJPT1RfUkVHSU9OX01BWCArIDEpKSwgdGhlIGxhc3Qgb25lCj4g
dGhlIGFsbC16ZXJvIHRlcm1pbmF0b3IgKG9yZGVyID09IDApLgo+Cj4gMS4gRHVyaW5nIHNiaV9k
b21haW5faW5pdCgpIGFuZCB0aGUgZHJpdmVyIGNvbGQtaW5pdHMsIHJlZ2lvbnMgYXJlIGFkZGVk
Cj4gICAgb25lIGF0IGEgdGltZSB0aHJvdWdoIHNiaV9kb21haW5fcm9vdF9hZGRfbWVtcmVnaW9u
KCkuIFN1cHBvc2UgTgo+ICAgIHJlZ2lvbnMgYXJlIHJlZ2lzdGVyZWQgc28gZmFyICh0aGUgdmly
dCBwbGF0Zm9ybSByZWdpc3RlcnMgNyBieSB0aGUKPiAgICBlbmQgb2YgYm9vdDogZmlybXdhcmUg
UlcvUlgsIFVBUlQsIENMSU5UIE1TV0ksIENMSU5UIE1USU1FUiwgUExJQyBpbgo+ICAgIHR3byBw
aWVjZXMsIHRoZSBhbGwtUkFNIGNhdGNoLWFsbDsgTiBncm93cyB0byA3KS4KPiAyLiBBIGNhbGxl
ciBhZGRzIGEgcmVnaW9uIFIgdGhhdCBzdHJpY3RseSBjb3ZlcnMgYW4gZXhpc3RpbmcgcmVnaW9u
IFMKPiAgICAoc2FtZSBmbGFncywgUyBpbnNpZGUgUikuIFRoZSBBQ0xJTlQgZHJpdmVyIGRvZXMg
dGhpcyBvbiB2aXJ0OiBpdAo+ICAgIHJlZ2lzdGVycyB0aGUgTVNXSSB3aW5kb3cgMHgyMDAwMDAw
LzB4NDAwMCBhbmQgdGhlIE1USU1FUiB3aW5kb3cKPiAgICAweDIwMDQwMDAvMHhjMDAwIHNlcGFy
YXRlbHksIGFuZCBzYW5pdGl6ZV9kb21haW4oKSBtZXJnZXMgdGhlbSB3aGVuIGEKPiAgICBjb3Zl
cmluZyAyXjE2IENMSU5UIHJlZ2lvbiBhcHBlYXJzLiBPbiBlbnRyeSByb290X21lbXJlZ3NfY291
bnQgPSBOCj4gICAgKHNheSA3KSBhbmQgcm9vdC5yZWdpb25zWzddIGlzIHRoZSB0ZXJtaW5hdG9y
Lgo+IDMuIHJvb3RfYWRkX21lbXJlZ2lvbigpIGFwcGVuZHMgUiBhdCBpbmRleCA3LCBpbmNyZW1l
bnRzIHRoZSBsb2NhbCBjb3VudAo+ICAgIHRvIDggYW5kIHdyaXRlcyB0aGUgdGVybWluYXRvciBh
dCBpbmRleCA4Lgo+IDQuIHNhbml0aXplX2RvbWFpbigpIHNvcnRzLCB0aGVuIGZpbmRzIFMgY292
ZXJlZCBieSBSIGFuZCByZW1vdmVzIGl0Ogo+ICAgIHNiaV9tZW1tb3ZlKCZyZWdpb25zW2ldLCAm
cmVnaW9uc1tpKzFdLCAyNCAqIChjb3VudCAtIGkpKSB3aXRoIGl0cwo+ICAgIE9XTiByZWNvbXB1
dGVkIGNvdW50LCBzaGlmdGluZyB0aGUgdGFpbCAoaW5jbHVkaW5nIHRoZSB0ZXJtaW5hdG9yKQo+
ICAgIGRvd24gYnkgb25lLiBUaGUgYXJyYXkgbm93IGhvbGRzIDcgbGl2ZSByZWdpb25zIGFuZCB0
aGUgdGVybWluYXRvciBhdAo+ICAgIGluZGV4IDcuIHJvb3RfYWRkX21lbXJlZ2lvbigpJ3MgbG9j
YWwgcm9vdF9tZW1yZWdzX2NvdW50IGlzIHN0aWxsIDguCj4gNS4gVGhlIG1lcmdlIGxvb3AgKHNi
aV9kb21haW5fZm9yX2VhY2hfbWVtcmVnaW9uLCB3aGljaCBzdG9wcyBhdCB0aGUKPiAgICB0ZXJt
aW5hdG9yKSBmaW5kcyB0d28gYWRqYWNlbnQgc2FtZS1vcmRlciBzYW1lLWZsYWcgcmVnaW9ucyBh
dAo+ICAgIGluZGljZXMgaTEgLSAxIGFuZCBpMSBhbmQgbWVyZ2VzIHRoZW06IG5yZWctPm9yZGVy
KyssIHRoZW4KPiAgICBzYmlfbWVtbW92ZShucmVnMSwgbnJlZzEgKyAxLCAyNCAqIChyb290X21l
bXJlZ3NfY291bnQgLSBpMSkpLiBXaXRoCj4gICAgdGhlIHN0YWxlIDggdGhpcyBjb3BpZXMgOCAt
IGkxIGVudHJpZXMgc3RhcnRpbmcgYXQgaW5kZXggaTEgKyAxLCBpLmUuCj4gICAgdXAgdG8gYW5k
IGluY2x1ZGluZyBpbmRleCA4LCB3aGlsZSB0aGUgbGl2ZSBkYXRhIHBsdXMgdGVybWluYXRvciBl
bmQKPiAgICBhdCBpbmRleCA3LiBJdCByZWFkcyBvbmUgZW50cnkgYmV5b25kIHRoZSB0ZXJtaW5h
dG9yIChpbmRleCA4LCBpbnNpZGUKPiAgICB0aGUgMzMtc2xvdCBhbGxvY2F0aW9uLCBhbGwgemVy
byBhZnRlciBjYWxsb2MpIGFuZCB3cml0ZXMgaXQgb3Zlcgo+ICAgIGluZGV4IDcuCj4gNi4gUmVz
dWx0OiBub3RoaW5nIHZpc2libHkgd3JvbmcgKnRvZGF5KiwgYmVjYXVzZSB0aGUgb3Zlci1yZWFk
IGxhbmRzIG9uCj4gICAgYSB6ZXJvZWQgc2xvdCBpbnNpZGUgdGhlIGFsbG9jYXRpb24gYW5kIGNv
cHlpbmcgemVyb3Mgb3ZlciB0aGUKPiAgICB0ZXJtaW5hdG9yJ3MgcG9zaXRpb24gbGVhdmVzIGEg
dGVybWluYXRvciB0aGVyZS4gRXZlcnkgZXh0cmEgcmVtb3ZhbAo+ICAgIHdpZGVucyB0aGUgZ2Fw
IGJ5IG9uZSBzbG90LiBUd28gY29uZGl0aW9ucyB0dXJuIGl0IGludG8gYSByZWFsIGZhdWx0Ogo+
ICAgIChhKSAzMiByZWdpc3RlcmVkIHJlZ2lvbnMsIHdoZXJlIGluZGV4IDMyIGlzIHRoZSB0ZXJt
aW5hdG9yIGFuZCB0aGUKPiAgICBvdmVyLXJlYWQgcmVhY2hlcyBpbmRleCAzMywgcGFzdCB0aGUg
c2JpX2NhbGxvYyBibG9jaywgcHVsbGluZyBoZWFwLQo+ICAgIG5laWdoYm91ciBieXRlcyBpbnRv
IHRoZSByZWdpb24gdGFibGUgKGEgbm9uLXplcm8gb3JkZXIgdGhlcmUgZXh0ZW5kcwo+ICAgIHRo
ZSB0YWJsZSB3aXRoIGEgYm9ndXMgcmVnaW9uIHRoYXQgbGFuZHMgaW4gdGhlIFBNUCBjb25maWd1
cmF0aW9uIG9mCj4gICAgZXZlcnkgaGFydCk7IChiKSBhIGNoYW5nZSB0aGF0IGRyb3BzICsgMSBm
cm9tIHRoZSBhbGxvY2F0aW9uIG9yCj4gICAgcmV1c2VzIHRoZSBzbG90LCB3aGljaCB0aGUgY3Vy
cmVudCBjb2RlIHNpbGVudGx5IGRlcGVuZHMgb24uCj4KPiBUaGUgZml4IHJlY29tcHV0ZXMgdGhl
IGNvdW50IGZyb20gdGhlIGFycmF5IChzYmlfZG9tYWluX3VzZWRfbWVtcmVnaW9ucykKPiBhZnRl
ciBldmVyeSBzdWNjZXNzZnVsIHNhbml0aXplX2RvbWFpbigpIHNvIHRoZSBtZW1tb3ZlIGNvdmVy
cyBleGFjdGx5Cj4gdGhlIHJlbWFpbmluZyByZWdpb25zIHBsdXMgdGhlIHRlcm1pbmF0b3IuCj4K
PiBWZXJpZmljYXRpb246Cj4KPiBQcm92ZWQ6IHNiaV9kb21haW5fcm9vdF9hZGRfbWVtcmFuZ2Uo
KSBvbiB0aGUgdmlydCBwbGF0Zm9ybSdzIHJlZ2lvbgo+IHNlcXVlbmNlIHNhdGlzZmllcyBpdHMg
Y29udHJhY3QgYWdhaW5zdCBhIG1vZGVsIG9mIHRoZSByZWdpb24gYXJyYXkuIFRoZQo+IHByb29m
IGhhZCB0byBjYXJyeSB0aGUgb3V0LW9mLXJhbmdlIHRhaWwgYnl0ZXMgZXhwbGljaXRseSB0byBn
byB0aHJvdWdoCj4gb24gdGhlIHVuZml4ZWQgY29kZTsgd2l0aCB0aGUgZml4IHRoZSBtZW1tb3Zl
J3MgcmFuZ2UgaXMgdGhlIGxpdmUgYXJyYXkuCj4KPiBsaWIvc2JpL3NiaV9kb21haW4uYyB8IDYg
KysrKysrIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPgo+IEZZSSwgdGhlIHNhbWUg
Y2hhbmdlIGlzIGFsc28gZmlsZWQgYXMgR2l0SHViIHB1bGwgcmVxdWVzdCAjNDI4Ogo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3BlbnNiaS9wdWxsLzQyOAo+Cj4gZGlm
ZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBp
bmRleCBiM2Y1ODkyZC4uNDkyNGUxYjEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWlu
LmMKPiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC03NDgsNiArNzQ4LDEyIEBAIHN0
YXRpYyBpbnQgcm9vdF9hZGRfbWVtcmVnaW9uKGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluX21lbXJl
Z2lvbiAqcmVnKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByYzsKPiAgICAgICAg
ICAgICAgICAgfQo+Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqIHNh
bml0aXplX2RvbWFpbigpIG1heSBoYXZlIGRyb3BwZWQgcmVnaW9ucyBjb3ZlcmVkIGJ5Cj4gKyAg
ICAgICAgICAgICAgICAqIGFub3RoZXIgcmVnaW9uLCBzbyB0aGUgY291bnQgaXMgc3RhbGUgYXQg
dGhpcyBwb2ludC4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIHJvb3Rf
bWVtcmVnc19jb3VudCA9IHNiaV9kb21haW5fdXNlZF9tZW1yZWdpb25zKCZyb290KTsKPiArCj4g
ICAgICAgICAgICAgICAgIC8qIE1lcmdlIGNvbnNlY3V0aXZlIG1lbXJlZ2lvbnMgd2l0aCBzYW1l
IG9yZGVyIGFuZCBmbGFncyAqLwo+ICAgICAgICAgICAgICAgICByZWdfbWVyZ2VkID0gZmFsc2U7
Cj4gICAgICAgICAgICAgICAgIHNiaV9kb21haW5fZm9yX2VhY2hfbWVtcmVnaW9uKCZyb290LCBu
cmVnKSB7Cj4gLS0KPiAyLjU1LjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
