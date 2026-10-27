Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7A2606A31D
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XJAI8Vfb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=kyQQnQzC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w7uvlh5TI9kau9umNI2CVK6Dk/pTu2KkCk7FQ/rwfU8=; b=XJAI8VfbAcHI4tvIxC/+yI45hC
	n5Yx2hnOJ8+vtYRBAqjdR/NBw0UhgdalWOKGZBI6HJUu7pKre7+uhPsWlSLzDU9hnFKTVcRMy5eH/
	WjZzOhEiMEgt2vJPYSRu4MNQE69u9RGC8IHS44R9vgNDaD+E1ULWKVfSLnBaZC6NE82FoywiZ+pFg
	Oor5wsH5RikojxBGRPlaxLWqIkXvk49oMxZwyF6J4R6nvtZ1NcAtEh1in7GDlOrh8PUJi+IjikJoQ
	hFtN3dk0tH/HpIeppRDQhuKUQ+59rVP9WkQwAIMAWPNEef2SCzxYlT+4NoUpCFmv537VYj9TUf1EI
	CrCLouHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLj7F-00000005AiV-1xXf;
	Tue, 27 Oct 2026 15:29:33 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLj7C-00000005Ag0-3Eh6
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 15:29:32 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso35094241fa.1
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 08:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114969; cv=none;
        d=google.com; s=arc-20260327;
        b=aRn+Wp5ztTHKX9KkztHhrtPO4rxBMD3Vh2U0lZVgFx5HVTxTBqX4TfYYuzIfVa+tlp
         Cv0dHhvPBwypqDJiQfp/3JwCoF1fw9A1xjCyGWlfyqi9eaugsde4yXd2TuL+k/R7OXjk
         rXfa3hoBy+q9U5a4zgmjEuOp2l6y3njqy6WGF6K6X0MDHifvZcBIiN/6LQS2VL5k0cju
         lWpPko2R/Q6Segl7UjEJFbs6lRuahomwhylzwDf+Wgxla+YyNjDVEj5yNhKpv9jx/ZrG
         f4o3bsZrI2aqTluYoNGakz+LVsSuBzeOVc0N1SoTBKYRhmxrdOFzBLXggkNuIpB/db/T
         5RrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s/qL/qpTMcVOcTBkZw9/Y9cqjNpPca647/lREtsF4HQ=;
        fh=A4DX0pRuScviaRe8zJffRYipcyyzGIYIBMxsBIXPKd0=;
        b=GHWP/SrHv7fnfqvYARv51Uqn2A7R5sD5JvVQj/G+WmH3fm8/8FV0xo3Y1JoCul4T1V
         jDhBhBnIBNTCu/5K+UL3scyAndU3bp5CClom962Mg/GlhnJmtr+pjlWGYtLrdU/GL1AC
         egOA3um7kFPAzWs+R5GGP48tMI0FPAol51P/g8jAylcKJJYmP34LZ6ZjEbfvKESMJkJ4
         i0yI9R8wQIQS+SbrIBjy2npV5ohfsh9jwLXKmwS833gs1+4abpZbdm0xOuJ9Huu6gfJn
         mkVhvXIlBkdAAQrOrjN0jnXvfokFVTxGpFSKnGmKRBAPNU89GS6CFYSs+wH1Eip9DNHO
         58IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793114969; x=1793719769; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s/qL/qpTMcVOcTBkZw9/Y9cqjNpPca647/lREtsF4HQ=;
        b=kyQQnQzCxRPxR8KfAPV7jw1r5sh93ejNyhq1UDBUcOcbFmcoJzJjI+ruYv9V7vDZ7b
         GfuLexYrdh5MM9qNEuVTx1daHY6iH2mAdPF7pLRD/YSz7b1l7IL2EPJgJ+WWjCOVqpnu
         eWl6aRJ9ZA+xy5/8kQHmP9TFVkdVbevQqKeX9I/jZzZPXfxfSzwugP8FVNVd0UQyfGl5
         iIfGnn9IulNepo/GYXbjwt6qEvWNq7MebSB99dZSf4r/ZsmKX+HJRsIlKPcvMhyPeIAU
         Z09E24aAXV4JYlKUTg+ZqejjYcBzHY+uG7PUFTkhYPwKlxTVSFbrwuYpzzbdUn5dvz8q
         PpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114969; x=1793719769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/qL/qpTMcVOcTBkZw9/Y9cqjNpPca647/lREtsF4HQ=;
        b=d7OeJf42iP3bqGMvxfi6z8bHDfPumm9KySx+D0srZZpmFcylvRkJ4q9EGA0pk5zkuN
         3SI5HV3JlIh1MuCOc9JIx+QmEeAzme8UNGAxWxsmTDRXy/d1N9xoxusAKkvlsoTqJakw
         ZIQmVz6r9IMmAtZF1s9qzlUPEnVU/xhQUjMDVYEOVbC3RM5r/VCgoJZCTyXJNfsvzI3u
         HgDMOjA/D3UqtRtK2VIOrgxJVHjSSnfPSNWjUJp4AHPc3CkIB2Mvujf2WsSRGuV+6hyP
         sLJdUI9spIoviGkWNNZx0Uif+CbLf2nt+Hw6VkZH9EMLcLTnvBjw5qvuN6uQlgz4R2K0
         9e/g==
X-Gm-Message-State: AFq9FYKbLzZQQAkBODlNztoJjVG8k7NRV2QHHW8zmfhdycGbEhnfK3+p
	Zwa4ij8UCNQbeRtswKtaDMvnspuOksYFC8zWeK9ukgL1Opm8PLUeqRoltdt8glRabiWFwAMbcWE
	BKjfc9gLf2XvZg2IzhvL7X3WLyO9mpql6Wj8oBS2Qbg==
X-Gm-Gg: AYBFou2LK4u4y/pYg5kEVMy/DkePQ49qWw9H++RngNHnxBkIIIznHSyQDNm46N2IrOm
	QF0oAPMJ8N7SgISwVVygzUdNyKe5UZ7QMkDL3PmNcN1WbtYJdjMhcO7Vja/joEZ0cjeE1LLLttP
	AcNxua0PHUCpH8dx+MWIhsvi0cVlCkKmPQpGqOazQC81BFv+2rcspZ1lxs6p4syUzyzDIpDHdbo
	mDq2s0o1nqmsR6c/cF+jk0KTIKyBMG9EzWwEhpf8PWLur1YQWkE1Qk6vwbRI3eEX/7r0FmD9CKf
	j4hev+jAMh1ELGmJLnlbb1Jo46EmsPbkNdtDRyhsFWVDN7Svy2JVX9E+6vCVNiS6jZIPUXhPvY4
	vzNAPCXDrJdPhNpv9i4TDkzjPzhPrCYz9pMcRNN02lGB3wSY80P7TqeGYfKPVzVvJmCO0Qbd6rm
	hbwKF6Z02LM2ZR67ayUAuQ3XhrVR01htUmJ9HeDuqctJ2F5dmLUhYprfg=
X-Received: by 2002:a05:651c:1466:b0:3a6:6f81:1027 with SMTP id
 38308e7fff4ca-3ac6fd50db2mr29030641fa.24.1793114968706; Tue, 27 Oct 2026
 08:29:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260910182026.6776-1-eestelle0626@gmail.com>
In-Reply-To: <20260910182026.6776-1-eestelle0626@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Oct 2026 20:59:13 +0530
X-Gm-Features: AclHuK-r33u5h-nL4SkYJG_DKHH6Ahl6EF8gSM3nphDet_wgvEKok-yntAMZc2U
Message-ID: <CAAhSdy1WahVcrX9H2TDjDO0DCy1Aw=SOQK-bNgGkpRfsqzEUXw@mail.gmail.com>
Subject: Re: [RFC PATCH] lib: sbi_hart: Retrun zero lenght of mhpmcounter when
 probing failed
To: Evgenii Prokopiev <eestelle0626@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_082930_829352_CCA31004 
X-CRM114-Status: GOOD (  17.54  )
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

T24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMTE6NTDigK9QTSBFdmdlbmlpIFByb2tvcGlldgo8ZWVz
dGVsbGUwNjI2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJZiB3cml0aW5nIGFjY2VzcyBpcyBub3Qg
YWxsb3dlZCwgaXQgd2lsbCByYWlzZSBhIHRyYXAsIGJ1dCB3ZSBpbmNyZWFzZQo+IHRoZSBudW1i
ZXIgb2YgYWxsb3dlZCBiaXRzIHRvIDMyIGluIHRoaXMgYXBwcm9hY2gsIHdoaWNoIGlzbid0IHJp
Z2h0Lgo+IFRoZXJlIG11c3QgYmUgYSB3cml0ZSBvZiAwLgo+Cj4gTW92ZSB0aGUgb3BlcmF0aW9u
IG9mIGluY3JlYXNpbmcgYWxsb3dlZCBiaXRzIGludG8gdGhlICdpZicgY29uZGl0aW9uLgo+Cj4g
U2lnbmVkLW9mZi1ieTogRXZnZW5paSBQcm9rb3BpZXYgPGVlc3RlbGxlMDYyNkBnbWFpbC5jb20+
CgpHb29kIGNhdGNoIQoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5r
cywKQW51cAoKCj4gLS0tCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyB8IDYgKysrKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggYmVlODg1
NTcuLjNhOWI2YzhmIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xp
Yi9zYmkvc2JpX2hhcnQuYwo+IEBAIC00NTAsMTYgKzQ1MCwxOCBAQCBzdGF0aWMgaW50IGhhcnRf
bWhwbV9nZXRfYWxsb3dlZF9iaXRzKHZvaWQpCj4gICAgICAgICAgICAgICAgIHZhbCA9IGNzcl9y
ZWFkX2FsbG93ZWQoQ1NSX01IUE1DT1VOVEVSMywgJnRyYXApOwo+ICAgICAgICAgICAgICAgICBp
ZiAodHJhcC5jYXVzZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4g
KyAgICAgICAgICAgICAgIG51bV9iaXRzID0gc2JpX2Zscyh2YWwpICsgMTsKPiAgICAgICAgIH0K
PiAtICAgICAgIG51bV9iaXRzID0gc2JpX2Zscyh2YWwpICsgMTsKPiAgI2lmIF9fcmlzY3ZfeGxl
biA9PSAzMgo+ICAgICAgICAgY3NyX3dyaXRlX2FsbG93ZWQoQ1NSX01IUE1DT1VOVEVSM0gsICZ0
cmFwLCB2YWwpOwo+ICAgICAgICAgaWYgKCF0cmFwLmNhdXNlKSB7Cj4gICAgICAgICAgICAgICAg
IHZhbCA9IGNzcl9yZWFkX2FsbG93ZWQoQ1NSX01IUE1DT1VOVEVSM0gsICZ0cmFwKTsKPiAgICAg
ICAgICAgICAgICAgaWYgKHRyYXAuY2F1c2UpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIG51bV9iaXRzOwo+ICsKPiArICAgICAgICAgICAgICAgbnVtX2JpdHMgKz0gc2JpX2Zscyh2
YWwpICsgMTsKPiAgICAgICAgIH0KPiAtICAgICAgIG51bV9iaXRzICs9IHNiaV9mbHModmFsKSAr
IDE7Cj4KPiAgI2VuZGlmCj4KPiAtLQo+IDIuNTAuMSAoQXBwbGUgR2l0LTE1NSkKPgo+Cj4gLS0K
PiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
