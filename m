Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CF9606A31A
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 05:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gs06dl21;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=T2GI17dj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T6qSlnPl+4TmtKzMfE2KnD7rq8MD7dm0YAT/go69er0=; b=Gs06dl21DrT1FNMct57AzZMOzA
	E7gsmD5lPceg+xRD24hqwRxW3jtZYsjtIfachMHmSvxny39xqBBd4iOB8nXtCJOtGTwy9AniUlUHF
	EAD7Nu6VBBCgNTYPPta4kAXDAry167RvdxLgOvuojiFu97rA9tQX67tuYA8OTl0KY15oCxQoYxCEv
	FdJPU9wC1jZF222pDO+zjZBbk+ij2QPBJmlPS6rZaDxTRmFM06vFACgl9RNfUDO1GoeZBOYgfMuYO
	ET4855aOfZtL8N9NTYfdQCVj5dBt73/2SHff0V3+VgDumBreb9Mo76n3JJej/RQkjyW4ozu9M8O1I
	k42LMzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCrP-00000001ir0-2b5G;
	Mon, 26 Oct 2026 05:03:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCrN-00000001iqe-27qc
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 05:03:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so14729775e9.0
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 22:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792990980; cv=none;
        d=google.com; s=arc-20260327;
        b=c9qWhgYanwhY6DMk0My6V7jxppSHigKEBnD6dBvyx2EFesMHZHL805Oc0OclsgLah/
         JWIV4fiPbgf1RrajhC6Idry8F9toQCXoA1n5jen7ia9gcQy1W1enLg2J8LRb5XnCX5Dz
         s61r5Rhvs2WIJ6rnufAIFkxFPnfgiYcD0Opt8pcIn+bg93+4DXwi1dbOTo7IeLvQDEEI
         dcDPwsr32R2tCQnmuBiekAGEzQQOjhXy9Zm53t4w+1WNZAI8v5VSYo5GgzO/ZZs/gGvi
         a3tGBLrTLfupfmF5Fk/ZUBcVtgRZHYDD2mMzzgH5icAsPKmo0IVgzeijIMJhrvPF77em
         LRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DZjjt2tmtZ6rj5ojWx5BPX342aOP6atfmTU1ULz6VkU=;
        fh=Dh6aZinx23Z80DMo/g7Tzp0Oq2qhcklt202M/UMjetY=;
        b=Ld6YpBIzmQ3KYPZhqgjEG0E+Q6aezw0bDsaKME3nA8tMKMH9Tv1/N59WVbi+AffHcx
         My3VmHVcT4zSbCVFEmUL3mlP3jKUrTdyh12zV22SHpEPn4zPsWa4N2MjxOzZ342Hgt1x
         H0fduXOtPcyCu8BeLUslkrbtF6OX182mIDLGepqwlByoS/Gji1Yj9vv6TWC9YUB1tlJW
         OQYlmgzW3nfATAcrafWMGPQHVU8EPCUT7PdgE5Dfu+F6LBQ9PLBnlZEYoLH6lwo3XtZb
         1qcSk1Z44S3kr6B8bJhq9BlCmQ4vT8dreEQv7Ak8UL2RO9/jJOAHssBTFkzc3wzOf5Ls
         9lDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792990980; x=1793595780; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DZjjt2tmtZ6rj5ojWx5BPX342aOP6atfmTU1ULz6VkU=;
        b=T2GI17djP4xicMio9rSvA/1wD/tXXwywiFm1IzXEwLR6YI0UWSq2IIHEABhQNoNFBB
         LF6If5ztlbK1dbQwIbe/YkEGV51EzDAMRaTghmder13fxLJw3KGhCWSiCPGDtdfs8bkG
         u5Try9J3UKjeLz7HrXf5c+5QZFL9kE4N2EGsdLi/BKhJ9inhJY7fswEALBTg2PqrHGcH
         aENv94f/zteFSMPcjg6+LvMSk8IID98g4xBSNlZYtagVLieVqwsy5nwMmDc98GUApBWt
         6ostzCY3RHri70qFJ1Fvah0aPTzlZ2cT4SdUeS6qLr3Sdt5MNfTzuZy9/lyUzL3F+Pao
         OvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792990980; x=1793595780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZjjt2tmtZ6rj5ojWx5BPX342aOP6atfmTU1ULz6VkU=;
        b=o/u2nlHq/l8UG4lweLZwm9IIR81NDih7la2dHdZbEmdcLVeUlWZmWf8nExvNMioROw
         mPSZlhDMsnoqJGVrJODXBZxMWnXu5aqpf9EP1D9fTy5pCdeyhGa1aWHg50Xl1JXKXnyB
         pTmytXK7vf9etCdCcr/zr+tHZqty8o7sdOif1lD9rx5P9i2AA9lgxxOGFJf5BQ27D/jn
         djda0fVSUZTwA1O7sxlIKlUn/Yxsi6PNiYsOXaGw7hWRCbLr7dRIVD/vUWy35VPc3s3v
         5lA3UzM4H7ntPWLZ8/1zzdWt8XgJ5faE1W5OWoJ5I2X5m+6/oNIN3cSvi0r30GnS69ie
         yAmg==
X-Gm-Message-State: AFq9FYLB/NQtKT8mExiYDGrO6lr8G4B8uEjDHRILKSVZ5koEf1QzQjQw
	WB9jDqMmBTUIBRQPsSUv8I9HHlFAz7W70Xp0YT3eWKY1OoxwP2oNRi7k4Ug4kZ902mYMNxLAmeQ
	r2/ocBl07dmcWGVWK6WyUmYeOffaGE6pisdFYGInPmQ==
X-Gm-Gg: AYBFou1fnFkjP/PN4o8kGTOvlcjqW86gaGFdt6PAfdGMkmsK3tvStZrjQoonkemO4SG
	RWtvdHUCz3XOJ9bmHzsEbgtVc9HoFTd8qAUXYhgyGdQOVELT1aSS7WBrlajQCytCAmQQPR7gA8t
	+EaUQ6zRm0iAupnHIy1qxNXo/VF8ousBz70+ttwP3j+o+D5rUR0XzELRY2dR3CDTf3wzW5zEIXf
	WZPZkF4zZqa2XOS1O9BGzmrDkWJdC74/JJT1GjV8KpwxoSNC7tu13PmFcJO4CZO2CXoQm3V1DZG
	hjJXsDl62M0BH3TpPkdYkUN2q9P5Xol7cSfgzF87Cz/j68U6MaBHd/BfaOgMp4FLccf3ZUZKPFM
	/tV84B9PF96xRnNDWkMGi6RSZ9GkdZE1kQhf0Hpre4Y4jihybqdEU30ZYR9H6YA/VLEDIwdIhVo
	SR8pGghCN0InE+Nx6Uyn0OHsHNYf22uIz3s1OaJqaoJb2+HAaDDmnpEhvJ3M7tEF4kSavZZv8Gp
	jI9FQ==
X-Received: by 2002:a05:600d:14:b0:4a4:6fdb:cc42 with SMTP id
 5b1f17b1804b1-4a46fdbcc53mr60739335e9.11.1792990979920; Sun, 25 Oct 2026
 22:02:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260910052629.3359493-1-liutong@iscas.ac.cn> <20260910052629.3359493-2-liutong@iscas.ac.cn>
In-Reply-To: <20260910052629.3359493-2-liutong@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Oct 2026 10:32:47 +0530
X-Gm-Features: AclHuK9EiCqGsukUso9m0m-hccChTzhhjGtIeq_w-5OaaFGivFY3c6rodFIT1PQ
Message-ID: <CAAhSdy2Mp9n3YzVTDj98APExN-F1rgovrwnoneu=cWd6Ed6_XA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] lib: sbi: dbtr: fix integer overflow in read_trig
 bounds check
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, himanshu.chauhan@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_220301_561302_9928D3EE 
X-CRM114-Status: GOOD (  19.01  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMTA6NTbigK9BTSBsaXV0b25nIDxsaXV0b25nQGlzY2Fz
LmFjLmNuPiB3cm90ZToKPgo+IEluIHNiaV9kYnRyX3JlYWRfdHJpZygpLCB0aGUgcmFuZ2UgY2hl
Y2sgaXM6Cj4KPiAgIGlmICh0cmlnX2lkeF9iYXNlICsgdHJpZ19jb3VudCA+PSBocy0+dG90YWxf
dHJpZ3MpCj4KPiBXaGVuIHRyaWdfaWR4X2Jhc2UgYW5kIHRyaWdfY291bnQgYXJlIGJvdGggdW5z
aWduZWQgbG9uZyB2YWx1ZXMgc3VwcGxpZWQKPiBieSBTLW1vZGUsIHRoZWlyIHN1bSBjYW4gd3Jh
cCBwYXN0IFVMT05HX01BWCB0byBhIHNtYWxsIHZhbHVlLCBtYWtpbmcKPiB0aGUgY2hlY2sgcGFz
cy4gRm9yIGV4YW1wbGUgdHJpZ19pZHhfYmFzZT0xLCB0cmlnX2NvdW50PVVMT05HX01BWCB3cmFw
cwo+IHRvIDAsIHdoaWNoIGlzIGxlc3MgdGhhbiB0b3RhbF90cmlncy4KPgo+IFRoaXMgYWxsb3dz
IHRoZSBzdWJzZXF1ZW50IGZvcl9lYWNoX3RyaWdfZW50cnkgbG9vcCB0byBhY2Nlc3MgdHJpZ2dl
cgo+IGVudHJpZXMgZmFyIGJleW9uZCB0aGUgdHJpZ2dlcnNbXSBhcnJheSwgY29ycnVwdGluZyBN
LW1vZGUgaGVhcCBtZW1vcnkKPiB2aWEgQ1NSIHJlYWQtYmFjayB3cml0ZXMgYW5kIGxlYWtpbmcg
TS1tb2RlIGludGVybmFsIHN0YXRlIHRvIFMtbW9kZQo+IHNoYXJlZCBtZW1vcnkuCj4KPiBSZXdy
aXRlIHRoZSBjb25kaXRpb24gYXMgdHJpZ19jb3VudCA+PSB0b3RhbF90cmlncyAtIHRyaWdfaWR4
X2Jhc2UuIFRoZQo+IHN1YnRyYWN0aW9uIGlzIHNhZmUgYmVjYXVzZSB0aGUgcHJlY2VkaW5nIGNo
ZWNrIGFscmVhZHkgZ3VhcmFudGVlcwo+IHRyaWdfaWR4X2Jhc2UgPCB0b3RhbF90cmlncy4KPgo+
IEZpeGVzOiA5N2YyMzRmMTVjOTYgKCJsaWI6IHNiaTogSW50cm9kdWNlIHRoZSBTQkkgZGVidWcg
dHJpZ2dlcnMgZXh0ZW5zaW9uIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IGxpdXRvbmcgPGxp
dXRvbmdAaXNjYXMuYWMuY24+Cj4gUmV2aWV3ZWQtYnk6IEhpbWFuc2h1IENoYXVoYW4gPGhpbWFu
c2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlz
Y3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IFByZXZpb3VzbHkgc2VudCBh
cyBbUEFUQ0ggdjIgMS82XS4KPgo+IENoYW5nZXMgaW4gdjM6Cj4gLSBSZWJhc2VkIG9udG8gY3Vy
cmVudCBtYXN0ZXI7IG9ubHkgdGhlIHN1cnJvdW5kaW5nIGNvbnRleHQgbW92ZWQsIHRoZQo+ICAg
Y2hhbmdlZCBsaW5lIGlzIGJ5dGUtaWRlbnRpY2FsIHRvIHYyCj4gLSBTdWJqZWN0IHByZWZpeCBj
aGFuZ2VkIHRvICJsaWI6IHNiaTogZGJ0cjoiCj4gLSBTcGxpdCBpbnRvIHRoaXMgc2VyaWVzCj4K
PiAgbGliL3NiaS9zYmlfZGJ0ci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kYnRyLmMg
Yi9saWIvc2JpL3NiaV9kYnRyLmMKPiBpbmRleCA3ZTRkZGQ5OC4uNWY2NmI2NDEgMTAwNjQ0Cj4g
LS0tIGEvbGliL3NiaS9zYmlfZGJ0ci5jCj4gKysrIGIvbGliL3NiaS9zYmlfZGJ0ci5jCj4gQEAg
LTY0OSw3ICs2NDksNyBAQCBpbnQgc2JpX2RidHJfcmVhZF90cmlnKHVuc2lnbmVkIGxvbmcgc21v
ZGUsCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0ZBSUxFRDsKPgo+ICAgICAgICAg
aWYgKHRyaWdfaWR4X2Jhc2UgPj0gaHMtPnRvdGFsX3RyaWdzIHx8Cj4gLSAgICAgICAgICAgdHJp
Z19pZHhfYmFzZSArIHRyaWdfY291bnQgPj0gaHMtPnRvdGFsX3RyaWdzKQo+ICsgICAgICAgICAg
IHRyaWdfY291bnQgPj0gaHMtPnRvdGFsX3RyaWdzIC0gdHJpZ19pZHhfYmFzZSkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIFNCSV9FUlJfQkFEX1JBTkdFOwo+Cj4gICAgICAgICBpZiAoc2JpX2Ri
dHJfc2htZW1fZGlzYWJsZWQoaHMpKQo+IC0tCj4gMi4zNC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBt
YWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
