Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685ABC83F17
	for <opensbi@archiver.kernel.org>; Mon, 28 Jul 2025 05:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qB6uvNn14nR9Q8dtyWjGkpJUaYsGOVRk2z/tPjpy3WQ=; b=X804H+bGzFcVaJ
	5jtyKuJLk04bAaTTt5aIrTq9Q+sia+gV/jaAP3s9xY5psvQ5z7Tx444FK9tFcqxbhigoIixMZPCnx
	zXzHB3qpO788D8o7yf28N1tTESZ0BCOhb3JSgBBo2PNY2rRPbqqyHoRTF++X9DYzI5Z0WNGP5/s0/
	hiqb89mqoAaM2BMs9CRUF3OtEI//C5T+GyVeG5H9egQN/qf1flxxajjApg0af8t0MYrTSsJ0E+ulD
	3RYroo5a+OZpTZvTo1ubvtJbL59PiCMj5eWEOnYC6hZ9AUTDwOKl9z/we6IG5aWW/gYGSHZB2RAuK
	5HadI6xxZpDmnWtPnrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugG1z-0000000Dcw5-3qBf;
	Mon, 28 Jul 2025 05:04:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugG1w-0000000Dcve-3599
	for opensbi@lists.infradead.org;
	Mon, 28 Jul 2025 05:04:10 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b78776fb25so400575f8f.1
        for <opensbi@lists.infradead.org>; Sun, 27 Jul 2025 22:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1753679047; x=1754283847; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUx4YjSihRvnPxzs2wUf5jVF3PWvdLbajxnim0sdP+0=;
        b=hWRmmprj+v/9FilT+vBGL1rQU7MskCLPajJLL8eI7DaqlBNuZB5bNWDmWojESqM/vq
         +3/zqqI6wgdh/UxMNH01CqfuAzJQgkDBcWDxOOEM/VCSfEF1XvSDTGJApGS2Jta7IRqY
         V9vvhu+9nbq/tMbPq04atIeopFsaDkJZ8IHuNHlRQC7XEMQcmAPIXm1TKXYAaz9EX4Ze
         sreBWl7eIOdErGBIsitGG7KYeoidBXVzAMlpeEk8frCOC7SAhl8mdDZiEleCPt7x8iAg
         S8mtMhIWtoXuKwj1CcJ/Gr8Vu9jn3YXSKyuLC6VRbFU+hbyDgLZlKjkUQ72vBTfYthFd
         8RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753679047; x=1754283847;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUx4YjSihRvnPxzs2wUf5jVF3PWvdLbajxnim0sdP+0=;
        b=RDrEcXmJUjDOG4f/ej+MYPeDspE7k1W6000UEHPF9VjsgvDovXcqN8V9NDClYJcp8F
         VgPUhJJwwIciyAa0XEIrsBbpsDd3E7EHxQehirh+j04XmwGX9Pk9oerAsKbixnjhczhJ
         FWj+EUot7CM9fpcKFTy34r/LAcbpCD9KzER9AxWyByfEYA1fu0snV4z6PQknABfeMwQl
         8SoFnWaJYW+RxD6zyNUq/Gua2d517vuy5q5spq7OVoPPviPpMKp8dBgTLU6Cl+hMatKl
         6L6g3ZOuZrwfIGTU9MCKGDaDW/5VbO+ycsPrkoPBQJFl+HzjdLqKqgnZgGLfYTNv2wqP
         tRdw==
X-Gm-Message-State: AOJu0YzyEd9B/VrUOkcQf3aWj0oqgYn7OvR36Ao71S7Bv+ljhZ9nvZco
	WD8br9daGDlAbUpyFVNdADzOvSp+a7S8l4wD5ZHDc53utM+mxweJGfc1TgGnaHOYQrd4jvnlgYh
	lpfAv
X-Gm-Gg: ASbGncv6pL9D4QSC/W4oYX7l9/RF6kL1mbsFicuGtFDbuONkDLJZxrze1xd8CoMO29I
	6CpSTbjyVGjlEOgdnTE3Rw2NlKCtcXIvZjUDAujerhOrP16Wc6b/EZDSrus29Vll5nx/JP54a2F
	Q5naRUcdqhwFn1QPDiY01Jx/ocPwexRxCZgnuy8/i9Pkny7A92GNzbAUk2wnRwJFvuTQSDuxFNZ
	sUoOF6t78rtnWwUpQrWCFktRRVFvkycohaEAn9LQuY1RU+gryaSdEKFWinuf58W/CKi3hPWErIT
	xIKDm6B4h/FdUGPfAGUMPETbvM09VEQvvHQ5UfatKgIDqtb7a0xBtGQlfDAPisYutTD6fsTMt9y
	ISWUfJW4a57s8FUuQyuFgWuH8Vp05gf3bL6L5os7qHKLy7v50bsxwk4a0Tr/w43mdGpw=
X-Google-Smtp-Source: AGHT+IE6mza4rvUGTmOzRuDdO+NgH6mfVruwRaIgxJFIw87RR/qye7274KNLq3JpwAMtmjyhifWvig==
X-Received: by 2002:a05:6000:400e:b0:3a6:d95c:5e8 with SMTP id ffacd0b85a97d-3b776641178mr7137202f8f.35.1753679046507;
        Sun, 27 Jul 2025 22:04:06 -0700 (PDT)
Received: from smtpclient.apple (global-184-7.n-1.net.cam.ac.uk. [131.111.184.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b7868629a4sm3188010f8f.79.2025.07.27.22.04.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Jul 2025 22:04:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] platform: andes:  Fix license to compatible GPL
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250728045551.355122-1-wxjstz@126.com>
Date: Mon, 28 Jul 2025 06:03:55 +0100
Cc: opensbi@lists.infradead.org,
 Anup Patel <anup@brainfault.org>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-Id: <E921AB6A-1390-4BFC-9B13-91D3036B9F1B@jrtc27.com>
References: <20250728045551.355122-1-wxjstz@126.com>
To: Xiang W <wxjstz@126.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_220408_807779_A648CC23 
X-CRM114-Status: GOOD (  20.15  )
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

T24gMjggSnVsIDIwMjUsIGF0IDA1OjU1LCBYaWFuZyBXIDx3eGpzdHpAMTI2LmNvbT4gd3JvdGU6
Cj4gCj4gU2luY2UgcGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL2FuZGVzL2FuZGVzLmggYW5kCj4g
cGxhdGZvcm0vZ2VuZXJpYy9pbmNsdWRlL2FuZGVzL2FuZGVzX3BtYS5oIGFyZSBsaWNlbnNlZCB1
bmRlciB0aGUKPiBHUEwsIGFueSBDIGZpbGVzIHRoYXQgdXNlIHRoZW0gc2hvdWxkIGFsc28gYmUg
bW9kaWZpZWQgdG8gY29tcGx5Cj4gd2l0aCB0aGUgR1BMLiBPdGhlcndpc2UsIHRoZXJlIG1heSBi
ZSBwb3RlbnRpYWwgbGVnYWwgaXNzdWVzLgoKRmlyc3RseSwgdGhhdOKAmXMgbm90IGhvdyBsaWNl
bnNlcyB3b3JrLiBUaGUgY29tYmluZWQgd29yayBpcyBHUEwsIGJ1dAp0aGF0IGRvZXNu4oCZdCBt
ZWFuIHRoZXNlIGZpbGVzIGFyZS4gVGhleSBjYW4gYmUgQlNELCBhbmQgc2hvdWxkIGJlLApiZWNh
dXNlIHRoYXTigJlzIHdoYXQgdGhleSB3ZXJlIGNvbnRyaWJ1dGVkIHVuZGVyLgoKU2Vjb25kbHks
IHdoeSBhcmUgdGhlcmUgR1BM4oCZZWQgZmlsZXMgaW4gT3BlblNCST8gSXTigJlzIGEgQlNELWxp
Y2Vuc2VkCnByb2plY3QsIGFuZCBhbnl0aGluZyBlbHNlKiBpcyBwcm9ibGVtYXRpYyBmb3IgdmVu
ZG9ycy4gRXNwZWNpYWxseSBmb3IKc291cmNlIGZpbGVzIHRoYXQgYXJlIGluY2x1ZGVkIGJ5IGRl
ZmF1bHQgaW4gdGhlIGdlbmVyaWMgcGxhdGZvcm0gYnVpbGQuCgpTbyBhIGhhcmQgTkFLIGZyb20g
bWUsIGFuZCBhIGNhbGwgdG8gZGVsZXRlIHRoZSBHUEzigJllZCBBbmRlcyBmaWxlcyBvcgpyZXBs
YWNlIHRoZW0gd2l0aCBCU0QtbGljZW5zZWQgb25lcyAod2hpY2ggY2FuIGp1c3QgYmUgZ2V0dGlu
ZyB0aGUKYXV0aG9yKHMpIHRvIHJlbGljZW5zZSB0aGVtKS4gSSBkb3VidCB0aGVyZeKAmXMgYW55
dGhpbmcgaW50ZXJlc3RpbmcgaW4KdGhlbSBhbnl3YXkuCgpKZXNzCgoqIFdlbGwsIGFueXRoaW5n
IGNvcHlsZWZ0IC8gbm9uLXBlcm1pc3NpdmUKCj4gU2lnbmVkLW9mZi1ieTogWGlhbmcgVyA8d3hq
c3R6QDEyNi5jb20+Cj4gLS0tCj4gcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hZTM1MC5jICAgICB8
IDIgKy0KPiBwbGF0Zm9ybS9nZW5lcmljL2FuZGVzL2FuZGVzX3BtdS5jIHwgMiArLQo+IHBsYXRm
b3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfc2JpLmMgfCAyICstCj4gcGxhdGZvcm0vZ2VuZXJpYy9h
bmRlcy9zbGVlcC5TICAgICB8IDIgKy0KPiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9hbmRl
cy9hZTM1MC5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hZTM1MC5jCj4gaW5kZXggZjA2ZTIw
N2QuLjg4MGQ1ODAzIDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYWUzNTAu
Ywo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYWUzNTAuYwo+IEBAIC0xLDUgKzEsNSBA
QAo+IC8qCj4gLSAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiArICog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiAgKgo+ICAqIENvcHlyaWdodCAoYykg
MjAyMiBBbmRlcyBUZWNobm9sb2d5IENvcnBvcmF0aW9uCj4gICoKPiBkaWZmIC0tZ2l0IGEvcGxh
dGZvcm0vZ2VuZXJpYy9hbmRlcy9hbmRlc19wbXUuYyBiL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMv
YW5kZXNfcG11LmMKPiBpbmRleCA5ZWVlNGVkYy4uNjA5OWE3M2IgMTAwNjQ0Cj4gLS0tIGEvcGxh
dGZvcm0vZ2VuZXJpYy9hbmRlcy9hbmRlc19wbXUuYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMv
YW5kZXMvYW5kZXNfcG11LmMKPiBAQCAtMSw0ICsxLDQgQEAKPiAtLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMAo+IC8qCj4gICogYW5kZXNfcG11LmMgLSBBbmRlcyBQTVUgZGV2aWNlIGNhbGxiYWNrcyBh
bmQgcGxhdGZvcm0gb3ZlcnJpZGVzCj4gICoKPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJp
Yy9hbmRlcy9hbmRlc19zYmkuYyBiL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfc2JpLmMK
PiBpbmRleCBmNjhhYzkwOC4uNmMxNTVlMTAgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJp
Yy9hbmRlcy9hbmRlc19zYmkuYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNf
c2JpLmMKPiBAQCAtMSw0ICsxLDQgQEAKPiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJT
RC0yLUNsYXVzZQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+IC8qCj4g
ICogQ29weXJpZ2h0IChDKSAyMDIzIFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycC4KPiAgKgo+IGRp
ZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL2FuZGVzL3NsZWVwLlMgYi9wbGF0Zm9ybS9nZW5l
cmljL2FuZGVzL3NsZWVwLlMKPiBpbmRleCAzNjFhZmYzYS4uOTY3ZmRhZWYgMTAwNjQ0Cj4gLS0t
IGEvcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9zbGVlcC5TCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJp
Yy9hbmRlcy9zbGVlcC5TCj4gQEAgLTEsNSArMSw1IEBACj4gLyoKPiAtICogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAo+ICAqCj4gICogQ29weXJpZ2h0IChjKSAyMDIzIEFuZGVzIFRlY2hub2xvZ3kgQ29y
cG9yYXRpb24KPiAgKgo+IC0tIAo+IDIuNDcuMgo+IAo+IAo+IC0tIAo+IG9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
