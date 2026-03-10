Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15276FCC9D9
	for <opensbi@archiver.kernel.org>; Tue, 10 Mar 2026 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YAId9xEMrsQ8YY09vxdx2cTfWjP4djiPGczIWJHrvPk=; b=U+eKNtHcsQWGrL
	vPu1HcvV1NS09Yt8kqv1DPuLXqOu6AklWAzTn3cYunUuYaVvH23UmQo/Gw4fJeMLYFm2jTTL3yzeB
	qOuO4ylJG52Xrzvla9pTeNqOFBIcldvUxr4ZDYutioR0t4T8n3YsJ1cOO77jTjoHn+TL2bqnmlILS
	M6VSI4+gkes3HZedm9mj4Ob3gB99OSmG66CjQo385VBHDcS/WXK/+9YJp9m0ogMAB7T2xmz4+lbAT
	lDF5poiSyCzT0waapJUmFVMCZQDMQRuCOQe0l6htBHaFEpUCYITP0OB4GbufYAwv/Lha+s1AH1k8j
	7IlXJhxO59A+OXRIJdNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrx7-00000008t8A-3Iq7;
	Tue, 10 Mar 2026 07:56:29 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrx4-00000008t4E-31KR
	for opensbi@lists.infradead.org;
	Tue, 10 Mar 2026 07:56:28 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-67bb5e4d06eso574866eaf.1
        for <opensbi@lists.infradead.org>; Tue, 10 Mar 2026 00:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773129385; cv=none;
        d=google.com; s=arc-20240605;
        b=Cauv7L2b2ij0PynCg3kJZwXokMM9G2QDEWI9PoSEG+cZ5zlEuYdXQSdFaU29BHuLuP
         R/UTcRtleVFIt/2oUeOm6et7mdQV7yRgkmaJwq5kIp+zl3CDb3glKC2dkTgzE7xsWgFe
         j/z5lChM3cD2+7stRJo/3zMlOeqmCb9eL97EKgfPqNnkcePXBI9leo00HacKi1/l7T7b
         /WBXOpF2Pn4bWIG1E4HfNpZfPT6i/Su6hz0j4359H/D75HGw/E1V7Gp8AHOFmYteGbp/
         GnZVSei8i8X2s6dSqJ1+UXtfw/2itPOkWBJQvsZzfVBB1RYzd2wyITaAlgc341j9jGBc
         D7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDCduzFwIaAmI+IOcQyjY35j20nZKnkRNcNH3BqkzZY=;
        fh=YKcsHR7jyHuqFbxF9TEF32A5pzizE+s5ek3T2qh5h1Y=;
        b=RQbJ7rf/ZVuh6qiOEAxwWaOgIYKqd2L1EdsKseka6GYUM3gR3GlFSzR17oIKLYyMt8
         tYv4DHk6F2YlItQ0fOvs2pQDQ1peFBMN2yMHkTeELJKxJfcNLss8WqkD10P4Fsr26jm/
         DcrgoTY+xF2Pibj5JxOaIDVL6omROkCE/9DgKUz/VSnMKXlO88oeeqDUJOci/Ji74GYd
         F17b8ynwdIcaWvTRKYp58o+YHDsAz88WQZfb61BFTorp8IwHlbF3i6xnl/wZtUv5+EtA
         tUoN2aGZAUmhXe2sxbO+5nhj0TJIWhDSK6G8HL1TgxVo80wI3UAv8lsZMX2hZcRPkmfQ
         5xXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773129385; x=1773734185; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDCduzFwIaAmI+IOcQyjY35j20nZKnkRNcNH3BqkzZY=;
        b=tgRw8X6Kg1amjBaygJ2i5Lqkr9/cyoNVrZzpKB31d1+F0Y8xyF7/ALrWbH1fE6s2Ub
         CdmcCPqU6yqJGoW9IxaDBCA187VNH23EkIqzfyvKbMJI6kcV/lL8VL6rnTlbuWJwqswi
         TNrpSf+oXLKy0rfdJUSTDRA6wjSI/AahuHWw2TZ+V7mGCeQZAxjbF9rctbpfTpH/oL+i
         64sXf9gfdFsmAgp/hbGeLcUGsIWNH+y2nMAf29ikyxghsq4gtx6iS23/lHXhleSJ21wn
         saPoyWOfHNrIc6XZekU34vTqYy1bj0zkDMY9OkxMGIrd6wMlAZ5udFg+AB6JP6F2aQHm
         xvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773129385; x=1773734185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GDCduzFwIaAmI+IOcQyjY35j20nZKnkRNcNH3BqkzZY=;
        b=RjLkz7ac+KNo21uznrMfceBti46ojMSAIOUROD/CgxZJLlFrA1vQu2BGLg2MwyG9r7
         NfrEqyLlLlWfz4medyU7UuieMmgl8P0GyK2V0bgfguy93+Q7Iaz4j8+g885G59ljrhAY
         oGt9R9xsBeT9OMWmxWOgbmNZTfVqHZH/GwDGl/2vPEr6um2PmVnjVew/vRTdOhBDVtiQ
         DK+x9mSOW8xV5wOz2tytggR1ny8syI2OvKQcol38p2QyPID4RvIP2qsR7zwtG4IU7TPj
         imG/6vPa5ErorcjX3971nqd/CG3+OR+3OYBMlGc7+reSvcR9Az9ERvsvZ5NnNl1RpDCW
         WuNQ==
X-Gm-Message-State: AOJu0YxATaGKtF7NazxP3/tDzhGH4TNTQ1ndyOTfPP0uHIiWzwaXt/bN
	xrYilRvYqlEMwlN9693aYXWWzK0ae/MaFIqVc/RgslEAZWGqT1tC9AuNKqUOf5qDq6zZan8YwR2
	0sAcrryUsX6OMOiGukLvy39DEX+wFunsn5zsL6eaJgA==
X-Gm-Gg: ATEYQzz9cudfzcwKnXjgzlo3hapUhsjfK+wjK4QwT3179XnK+hcJoPBMMAGoGsgZLmG
	X7mBs/r2iizYObKZCZRyxfYlS+fFUEmt+5BENdgZifsnDfJO+E9h77uWlB0ZH3p4fOWMNScblAH
	AKUf2cuQNhkc+A4UVzV0gQ6zEW3b1P5WPFZPT8aqvjU8EJEF0XIgEyDCIiGRA+3hbjvPxZwngsg
	AfavRD0HbXWa/uLSqskIBc5LwQrpS6pfoon9A40yGrIK42wbAs2Sudux9rYG4XJY8RgVTGlt0Ck
	DdbW8RUg35BvCozJQKNRF9x04trxXtTkIwvMkWcj0pla+Drn+MkhTXcMyzBUjwS0brZlY8Yzzxu
	FWq8vG6PMEA3GMys+/foyZU6/2w==
X-Received: by 2002:a05:6820:210a:b0:67b:b4b3:821e with SMTP id
 006d021491bc7-67bb4b3866cmr3660698eaf.64.1773129385346; Tue, 10 Mar 2026
 00:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260302-event_inject_fix-v1-1-e88952b03aa4@gmail.com>
In-Reply-To: <20260302-event_inject_fix-v1-1-e88952b03aa4@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Mar 2026 13:26:14 +0530
X-Gm-Features: AaiRm52XrS7gasYdo2c03UzT2zPz5vAb51S9J15g40YskNBG9Ob95pMWcZqVnf4
Message-ID: <CAAhSdy16CdiabpEhLzfVuW-mvr=J-P=97+wgXUkBhm7+Ph0NgQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: fix sse_event_inject() status setting
To: thecharlesjenkins@gmail.com
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_005627_015778_995697C5 
X-CRM114-Status: GOOD (  15.68  )
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

T24gVHVlLCBNYXIgMywgMjAyNiBhdCA0OjI14oCvQU0gQ2hhcmxpZSBKZW5raW5zIHZpYSBCNCBS
ZWxheQo8ZGV2bnVsbCt0aGVjaGFybGVzamVua2lucy5nbWFpbC5jb21Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdtYWlsLmNv
bT4KPgo+IHNzZV9ldmVudF9pbmplY3QoKSBjdXJyZW50bHkgc2V0cyBhbGwgc3RhdHVzIGJpdHMg
dG8gMSBleGNlcHQgZm9yCj4gU0JJX1NTRV9BVFRSX1NUQVRVU19QRU5ESU5HX09GRlNFVCB3aGlj
aCBpdCBzZXRzIHRvIHplcm8uIEluc3RlYWQgb2YKPiBvdmVyd3JpdGluZyBhbGwgdGhlIHZhbHVl
cyBvZiB0aGUgc3RhdHVzIGJpdHMsIHNzZV9ldmVudF9pbmplY3QoKSBpcwo+IG9ubHkgZXhwZWN0
ZWQgdG8gY2xlYXIgU0JJX1NTRV9BVFRSX1NUQVRVU19QRU5ESU5HX09GRlNFVC4gRml4Cj4gc3Nl
X2V2ZW50X2luamVjdCgpIHRvIG9ubHkgZG8gdGhlIGNsZWFyaW5nLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVua2luc0BnbWFpbC5jb20+CgpMR1RNLgoK
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRo
aXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0K
PiAgbGliL3NiaS9zYmlfc3NlLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3NzZS5jIGIv
bGliL3NiaS9zYmlfc3NlLmMKPiBpbmRleCBhMTQ3NTRmOC4uODE4YWZiODcgMTAwNjQ0Cj4gLS0t
IGEvbGliL3NiaS9zYmlfc3NlLmMKPiArKysgYi9saWIvc2JpL3NiaV9zc2UuYwo+IEBAIC01NDgs
NyArNTQ4LDcgQEAgc3RhdGljIHZvaWQgc3NlX2V2ZW50X2luamVjdChzdHJ1Y3Qgc2JpX3NzZV9l
dmVudCAqZSwKPgo+ICAgICAgICAgc3NlX2V2ZW50X3NldF9zdGF0ZShlLCBTQklfU1NFX1NUQVRF
X1JVTk5JTkcpOwo+Cj4gLSAgICAgICBlLT5hdHRycy5zdGF0dXMgPSB+QklUKFNCSV9TU0VfQVRU
Ul9TVEFUVVNfUEVORElOR19PRkZTRVQpOwo+ICsgICAgICAgZS0+YXR0cnMuc3RhdHVzICY9IH5C
SVQoU0JJX1NTRV9BVFRSX1NUQVRVU19QRU5ESU5HX09GRlNFVCk7Cj4KPiAgICAgICAgIGlfY3R4
LT5hNiA9IHJlZ3MtPmE2Owo+ICAgICAgICAgaV9jdHgtPmE3ID0gcmVncy0+YTc7Cj4KPiAtLS0K
PiBiYXNlLWNvbW1pdDogOGQxYzIxYjM4NzUyMzAxZmM2YzcyN2VlY2U0NWMxNWM2NjM2NDliMAo+
IGNoYW5nZS1pZDogMjAyNjAzMDItZXZlbnRfaW5qZWN0X2ZpeC1kNTE4N2JlNDBlMGMKPgo+IC0g
Q2hhcmxpZQo+Cj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
