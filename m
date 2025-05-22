Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E96C54E65
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 20:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKVpUthloUczIytZlMjv8ql+i+eoAg8kv49oCmdVocY=; b=vf/SBW0UttGZPX
	NGNuvnzWxd7ZGIF3pUTiF5TxlEaV+ojFAms4OgDnKE9TWzsA3j+6BQroFVcQtLPYaBSC6ZOBuXQbF
	UoYx2XKgWLXwibmtFudY38uzU7YcgttYUJJlZiyjS2aXRwwoRHkkdkwb6+j564igVOFVPNFT1gxAm
	ouBr5TLD8W8gDcwY79+ot2JWjDIV7BiXfnfG5y1TQ2dRh3DXLhCc9QumNtCXqbNyuDfIXojhHVWDi
	j1Rqrmnt9jZSQaYe80O9zhn9MCWmV2w6YQtJfpYC4Yuqp9vEq2zXXJdBxxMXciPPkXBDvcX+qEbEU
	WKWtBkEzfV+1l5WFh2Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICp6-000000029Sn-40Zw;
	Thu, 22 May 2025 20:47:28 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICp4-000000029SH-3LLR
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 20:47:27 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54e7967cf67so9848414e87.0
        for <opensbi@lists.infradead.org>; Thu, 22 May 2025 13:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747946844; x=1748551644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NM978N/uold2Whs94wHu5+EBBfrAul5SLXNdVNuSl/M=;
        b=L3vTH9pwKHX3RsSjvSncYFA2U76E7I77XcIoK0Nu1Mfag/i/Fvcdn+rQHlIgEcLWbg
         Hib2p6PYHYW8uvDP0uzL/ockNUtz+K6wpmWr7w3dVDfMq1EbDEw3TOzVExBBhOffmgZR
         WGgdKOnCl19Q7oVLm/oBnm4Z8YckJs9lOvxFo1WNUScu8mmoic+rAESo+M/l/hMZviyw
         BjimUskHRDV8Y24lnN55I84cF6d9TNG+MI+EZX6qSHvbErEwVeeui8LDBSE+WOGhNl3R
         4NltK6f9bMKu45aS7yXlGLwfVdzk53cySttGvyf+2FzFunasIO6y8PItHGum56NtoR9u
         sc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946844; x=1748551644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NM978N/uold2Whs94wHu5+EBBfrAul5SLXNdVNuSl/M=;
        b=c/iF2umY+spQTv2hUrynyLThzmNcNuZMCG4WHutZZyY6DrhzHvxP42lY4lpzjm10qr
         fSXaxBXdqZZh1L5cyKX8ndRdb/ckINBZEc9eFZe5FpNRpyGCbqtEMeYtiFHeFQFpMrCk
         xARKUq0E7Uj+HP20BllrzzozwEfV2OCr0ONULc9dc94uE0NMVRsW32vK8u7nW+0ZkNpt
         zH6MJwHQqUJSh0OwibCIRHscFvhb7U6fmqcSgT6oUK7VvwVR7xT2x2l9ww74RlmqQdBi
         jU/IOS3IfneQ9c5XRpO4xj0tGMsrdRCkjlJCSI9pcGvimO1rHDfNvGi5IYT1UJLx76pY
         ORrA==
X-Gm-Message-State: AOJu0YzbSzLNKKS+If01l3ab95S5oIlaIKgPIB6wf8KYy3QTzvqO3d9y
	Y9zmTJBTR+Y5obZ0oU/MzQfaKbJGdypnga8kWksu50mCyMyRl+VF2bWM39pWvw4XQ1fe7TXzaHG
	We//CFYmr7hcPgmtcz2r4qG8FzE8TlWs=
X-Gm-Gg: ASbGncvCB/DNLadQqjDHN4OUEboM21+Vqvu3jws5k/wvMySktI5feHN4mnI1LvQOfhk
	Vw6Jxd7cCpPX6Un5h8cNwHWW6+E4T+hccbLisj6Y5RsknJ1XZ6GOoEnhrYuV72poV4I402z0UcU
	7vcBijBjvHwsi5BNR2JmoSvedRi71n8CkHOQ==
X-Google-Smtp-Source: AGHT+IHhCnPcrsVS00Y8MnvSCMOH/C1ABjlRE0GLSnBZSsOlm+5qM6ue0PrM4MPrzPflGHbGQdbt2VwQOd9HwmngyIM=
X-Received: by 2002:a05:6512:1595:b0:545:c33:40a7 with SMTP id
 2adb3069b0e04-55216e4622dmr87262e87.26.1747946844077; Thu, 22 May 2025
 13:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250519215848.27569-8-cfu@mips.com> <CAAhSdy1kLUXN8293NHWDF2=jM9n0zEpxfsxtaPJEJRY+95rAnQ@mail.gmail.com>
In-Reply-To: <CAAhSdy1kLUXN8293NHWDF2=jM9n0zEpxfsxtaPJEJRY+95rAnQ@mail.gmail.com>
From: Chao-ying Fu <icebergfu@gmail.com>
Date: Thu, 22 May 2025 13:47:12 -0700
X-Gm-Features: AX0GCFtCSsA-GuPIQllV8CsH-Uto7H6BfQpM5KEQ27vaZAiDCWcdF0OxGttvjPA
Message-ID: <CAM1rFzG5RC2N2ASzQSnO31f2zB8qkABpgNZgf=mXbM_PN8WhYw@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] Initialize MIPS custom PMA registers
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_134726_832729_04DABC90 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgMTA6MDnigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDIwLCAyMDI1IGF0IDM6MjnigK9BTSBD
aGFvLXlpbmcgRnUgPGljZWJlcmdmdUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEJlZm9yZSBQ
TVAgc2V0IHVwLCB3ZSBuZWVkIHRvIHNldCB1cCBNSVBTIGN1c3RvbSBQTUEgcmVnaXN0ZXJzCj4g
PiB0byBoYXZlIGNvcnJlY3QgY2FjaGVhYmxlIG9yIHVuY2FjaGVhYmxlIGV4ZWN1dGlvbiBmb3Ig
cG1wIHJlZ2lvbnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhby15aW5nIEZ1IDxjZnVAbWlw
cy5jb20+Cj4KPiBUaGlzIE1JUFMgc3BlY2lmaWMgUE1BIHByb2dyYW1taW5nIGhhcyB0byBiZSB1
bmRlciBwbGF0Zm9ybS9nZW5lcmljL21pcHMvCj4KPiBSZWdhcmRzLAo+IEFudXAKWWVzLCBJIHdp
bGwgbW92ZSBjb2RlIHRvIE1JUFMgcDg3MDAuYyBhbmQgd2lsbCBhZGQgYSBwbGF0Zm9ybSBwbWFf
c2V0CmZ1bmN0aW9uIHRvIGxldCBwbGF0Zm9ybXMgaW1wbGVtZW50IHRoZWlyIG93biB2ZXJzaW9u
cyAoaWYgbmVlZGVkKS4KVGhhbmtzIGEgbG90IQoKUmVnYXJkcywKQ2hhby15aW5nCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
