Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44350C3ABDA
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 05:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cixhEQml7TRBqecg4gqF1qgLhm81X+18jUq35GiGCt0=; b=CXWXT+Ofs1etrQ
	vRaVLEwcFWUurtqwOj9lsN8vDmb85cXmp/V/VIdU/KGIDAN02nWTkjVWFCHukprOtOdOxVC/0H0wn
	u4tjSbUIGX0W6XjAekLCk+5X1or3aGaDN0WEsKgtwnyYkKWTfUZ8LOP2F6xOt1ifsfn4DvKnn2pLn
	h8caKDlbFkqN5UnlQa0USVKnyJNEFke+wSuavfcO/9KTUH0ORTrMS78oU8Jviwhj84RDTkTLMYGXM
	rx4+pTXyWfm0edqqW8OdRLr45z3kjY3Vz+3hQPbSK4GwrgMxPJLNqAI82xmmYs44ox4NhjLzDARO9
	XNnrxw7pVSor8wzzhABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFXu-0000000BaOo-2RBt;
	Tue, 20 May 2025 05:29:46 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFXs-0000000BaOF-3Uxb
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 05:29:46 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3db87b9605bso33962625ab.3
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 22:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747718984; x=1748323784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtCDb1n3G5WF43napEx7CeS+XvRpPK2lo8uVCMzXzB0=;
        b=ZyF1Jjkq4vz70zmoBuQyY2o20fozi3vv4vVEbLXJZyX18oqnaQ2yol+YBALLWyjKbO
         Rx91CwVooHZlZ4Y+nk1Tj0b0dkm7iEoHkfdeXNTPCkhmaPe4Jlf1hBOyT/OOagwy/Kkw
         hNbmOWkOk44LzB1bVRXOfHsaUOoj4Y7LxHqN3sLaozCpihJph+Y6dOX9OxcsMRqoxYw0
         z1NUnsDFrSDuHxxkg+uhNIxuOXVnkkR1xf3hGfF4IqesI7YjX+Mu37ZXg+L9MgfTekFF
         CXflQCoG15h7m9wEctSWvr1C5B0mdr8dHTrfD27kq1PzOEra4Ir24oSV/ZCF3bMtJBnE
         YykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747718984; x=1748323784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtCDb1n3G5WF43napEx7CeS+XvRpPK2lo8uVCMzXzB0=;
        b=iHh29pqhf/SLLNyQRMGxFP/Jtdwqk4SBHL0FMVJOexO3RFXVnTIZAWTtjaW03A68H2
         atHLT4mgoAepz/jevrTkgbOawF+oPTxy1Y/tTQSzhF5rLQZ7lizY+xtws+SoreiJf7vY
         Npic51hDS4vQ+k1LgnZ18prlAKa4/z5sKSz6rd2I6oiY9HcNMkc2nLgotXDSns659WiU
         EXmBU3EYdRPTjLBBZkX6c9pVJplQbmIEz5OVpvZuTHn/xxNgPP+1BuSkxKfZQEdtZbTi
         iqLf3PVWO4T93gcuoXHHX0cxUuhHCLfbdww6pwTdoPecAu9oi/ASiT2GSMDKj2+hJTxJ
         oGRw==
X-Gm-Message-State: AOJu0YyPIpXYKzCwLKjpc5sFvdG6TcFCy90bqtzuUWVHVQS51u9sFapj
	u+QbAiz544jftIf/6x9I6DOQZw0+9DecQVQjgsJ4ODTBC/0xUE3brq6ZIPYDJW8eP/Wgj7hN21K
	6Ru/57iRFFksQ9MTU7y4ytEgIx4gNf6lLvRbscprJ9A==
X-Gm-Gg: ASbGncvJQnrYto5XZ4pjzMK+GUgOYdBC88JF1s8oxVgqwggznxGaNxxriLTRcGL02tM
	f/tLRlLrtEUV2vglX7FxKG7jctHQi6nKjWIFnFjH64yQUGtn0TNyB0khAaVQIb9+OkdHPCjx0OD
	NZ873oJ1Zlfi++S2SLq9Lbh3ted/2PzeF+6A==
X-Google-Smtp-Source: AGHT+IE2ZJgiBgKfYGVGreSczI7Djsg5mrKhReF3B/+61X1gkwzmKynmu0X2CpzfufNzDE2FC1fIBy6VS4M9sNDH2Ww=
X-Received: by 2002:a05:6e02:3a01:b0:3d8:1b25:cc2 with SMTP id
 e9e14a558f8ab-3db842a6e18mr181466425ab.8.1747718983769; Mon, 19 May 2025
 22:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250519215848.27569-4-cfu@mips.com>
In-Reply-To: <20250519215848.27569-4-cfu@mips.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 May 2025 10:59:33 +0530
X-Gm-Features: AX0GCFtGTGVwq46F2IWf8JFk7qqFeZBol28SiiGckpH0cFM0SNZWXS5dharbFF4
Message-ID: <CAAhSdy25aLofOE8gvc1xePKK2DFZp7h2RP9irUu4iJ_qMVaLUg@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] platform: generic: mips: add an entry function
To: Chao-ying Fu <icebergfu@gmail.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_222944_870131_3D41C2E6 
X-CRM114-Status: GOOD (  17.23  )
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

T24gVHVlLCBNYXkgMjAsIDIwMjUgYXQgMzoyOeKAr0FNIENoYW8teWluZyBGdSA8aWNlYmVyZ2Z1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZW50cnkgZnVuY3Rpb24gaXMgbWluaW11bSBib290
IGNvZGUgZm9yIGhhcnRzIHRvIGV4ZWN1dGUgYWZ0ZXIKPiByZXNldCwgbm1pLCBjYWNoZSBlcnJv
ciwgYW5kIGRlYnVnIGV4Y2VwdGlvbi4KClRoaXMgZG9lcyBub3QgYmVsb25nIGluIE9wZW5TQkkg
YmVjYXVzZSBpdCBpcyB0aGUgam9iIG9mCnByZXZpb3VzIGJvb3Rpbmcgc3RhZ2UgdG8ganVtcCBh
dCB0aGUgcmlnaHQgZW50cnkgcG9pbnQgaW4KT3BlblNCSS4gVGhlIHByZXZpb3VzIGJvb3Rpbmcg
c3RhZ2UgYWxzbyBoYXMgdGhlCnJlc3BvbnNpYmlsaXR5IG9mIHBhc3NpbmcgdGhlIERUQi9GRFQg
YWRkcmVzcyB0byBPcGVuU0JJLgoKQWxtb3N0IGFsbCBSSVNDLVYgcGxhdGZvcm1zIGhhdmUgdGhl
aXIgb3duIGVhcmx5IGJvb3QKc3RhZ2Ugd2hpY2ggYm9vdHMgYmVmb3JlIE9wZW5TQkkuIFNvbWUg
b2YgdGhlc2UgUklTQ1YKcGxhdGZvcm1zIGFsc28gdXNlIFUtQm9vdCBTUEwgYXMgdGhlaXIgZWFy
bHkgYm9vdCBzdGFnZS4KClJlZ2FyZHMsCkFudXAKCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvLXlp
bmcgRnUgPGNmdUBtaXBzLmNvbT4KPiAtLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL2Nwcy12
ZWMuUyB8IDc1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNzUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGxhdGZvcm0vZ2Vu
ZXJpYy9taXBzL2Nwcy12ZWMuUwo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvbWlw
cy9jcHMtdmVjLlMgYi9wbGF0Zm9ybS9nZW5lcmljL21pcHMvY3BzLXZlYy5TCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi45MzA5ZTIwCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BsYXRmb3JtL2dlbmVyaWMvbWlwcy9jcHMtdmVjLlMKPiBAQCAtMCwwICsxLDc1IEBACj4g
Ky8qCj4gKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiArICoKPiAr
ICogQ29weXJpZ2h0IChjKSAyMDI1IE1JUFMKPiArICoKPiArICovCj4gKwo+ICsjaW5jbHVkZSA8
c2JpL3Jpc2N2X2VuY29kaW5nLmg+Cj4gKyNpbmNsdWRlIDxtaXBzL3A4NzAwLmg+Cj4gKwo+ICsg
ICAgICAgLnRleHQKPiArICAgICAgIC5hbGlnbiAgMTIKPiArICAgICAgIC5nbG9ibCAgbWlwc19j
cHNfY29yZV9lbnRyeQo+ICttaXBzX2Nwc19jb3JlX2VudHJ5Ogo+ICsgICAgICAgaiAgICAgICAx
Zgo+ICsKPiArICAgICAgIC5hbGlnbiAgMgo+ICtubWlfdmVjdG9yOgo+ICsgICAgICAgaiAgICAg
ICAxZgo+ICsKPiArICAgICAgIC5hbGlnbiAgMgo+ICtjYWNoZWVycl92ZWN0b3I6Cj4gKyAgICAg
ICBqICAgICAgIDFmCj4gKwo+ICsgICAgICAgLmFsaWduICAyCj4gK2RlYnVnZXhjX3ZlY3RvcjoK
PiArICAgICAgIGogICAgICAgMWYKPiArCj4gKyAgICAgICAuYWxpZ24gIDIKPiArMToKPiArICAg
ICAgIGxpICAgICAgeDEsIDAKPiArICAgICAgIGxpICAgICAgeDIsIDAKPiArICAgICAgIGxpICAg
ICAgeDMsIDAKPiArICAgICAgIGxpICAgICAgeDQsIDAKPiArICAgICAgIGxpICAgICAgeDUsIDAK
PiArICAgICAgIGxpICAgICAgeDYsIDAKPiArICAgICAgIGxpICAgICAgeDcsIDAKPiArICAgICAg
IGxpICAgICAgeDgsIDAKPiArICAgICAgIGxpICAgICAgeDksIDAKPiArICAgICAgIGxpICAgICAg
eDEwLCAwCj4gKyNpZmRlZiBGV19GRFRfUEFUSAo+ICsgICAgICAgbGkgICAgICB4MTEsIDAKPiAr
I2VuZGlmCj4gKyAgICAgICBsaSAgICAgIHgxMiwgMAo+ICsgICAgICAgbGkgICAgICB4MTMsIDAK
PiArICAgICAgIGxpICAgICAgeDE0LCAwCj4gKyAgICAgICBsaSAgICAgIHgxNSwgMAo+ICsgICAg
ICAgbGkgICAgICB4MTYsIDAKPiArICAgICAgIGxpICAgICAgeDE3LCAwCj4gKyAgICAgICBsaSAg
ICAgIHgxOCwgMAo+ICsgICAgICAgbGkgICAgICB4MTksIDAKPiArICAgICAgIGxpICAgICAgeDIw
LCAwCj4gKyAgICAgICBsaSAgICAgIHgyMSwgMAo+ICsgICAgICAgbGkgICAgICB4MjIsIDAKPiAr
ICAgICAgIGxpICAgICAgeDIzLCAwCj4gKyAgICAgICBsaSAgICAgIHgyNCwgMAo+ICsgICAgICAg
bGkgICAgICB4MjUsIDAKPiArICAgICAgIGxpICAgICAgeDI2LCAwCj4gKyAgICAgICBsaSAgICAg
IHgyNywgMAo+ICsgICAgICAgbGkgICAgICB4MjgsIDAKPiArICAgICAgIGxpICAgICAgeDI5LCAw
Cj4gKyAgICAgICBsaSAgICAgIHgzMCwgMAo+ICsgICAgICAgbGkgICAgICB4MzEsIDAKPiArCj4g
KyAgICAgICAvKiBhMCBoYXMgbWhhcnRpZCAqLwo+ICsgICAgICAgY3NyciAgICBhMCwgQ1NSX01I
QVJUSUQKPiArCj4gKyAgICAgICAvKiBMZXQgaGFydCAwIGp1bXAgdG8gX3N0YXJ0ICovCj4gKyAg
ICAgICBiZXF6ICAgIGEwLCAxZgo+ICsgICAgICAgbGxhICAgICB0MCwgX3N0YXJ0X3dhcm0KPiAr
ICAgICAgIGpyICAgICAgdDAKPiArMToKPiArICAgICAgIGxsYSAgICAgdDAsIF9zdGFydAo+ICsg
ICAgICAganIgICAgICB0MAo+ICsKPiAtLQo+IDIuNDcuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFp
bGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
