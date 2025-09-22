Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C4BCAC592
	for <opensbi@archiver.kernel.org>; Mon, 22 Sep 2025 06:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tbqj+U+KBMV0+PuR8Cpmo/AyvGeBA1elPTAyWx++6M=; b=FP/W9J+eoiAs/4
	Iv7WWTlUOmJCazpmlGT1nT+ftifA6kgLiEX2aIO0qrohF9/+phWhewPsuCVrWayQfosYeXeTuTvQj
	UgSX1AThr1KW2GugkM/RqAVosEBRkKMan0nE6OPHcZnNlKXF877wbitfBNc9C0gGSM+GspS5m5/eN
	J17SQT0pHjIhawyQhS/xiUaU3c3wqz4Xnk5DGmRuMDRb/YW7D7EbEuVEz3m6qPQpL8p8uj5kn7b/O
	z4X5b6OA6cQjDzWT2W3q+6ATtPl28N+qfyblRQfmOsPhhSSa2hQ6FcmjqmuST6pFwLv4t9+kDcz5f
	cibVqUHIihyuAOfofthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ZcT-00000008uVo-3TRi;
	Mon, 22 Sep 2025 06:01:49 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ZcR-00000008uVE-1MiA
	for opensbi@lists.infradead.org;
	Mon, 22 Sep 2025 06:01:48 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-8936326129eso120872539f.2
        for <opensbi@lists.infradead.org>; Sun, 21 Sep 2025 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1758520906; x=1759125706; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr4Y8zTjumKo8nXqQcI7EddtDf0MyutlVC41SoVKa8Q=;
        b=M+OUYVuqEXu/TKUl6msU5QdQQoNX1um/v5sQpPKI13paYHoJlS7Tq1hje/oI9V14/E
         Dk6HpJQ8KH2nP4d71MYX/xo+W9ig++cZbsOzU1UFj9ZBOCwSfCR8rOwtkYQdofSM83HR
         keAapxmJxqqVS/jrHVROsPMo+uTK3IeYuGcWVizDVj6z0qEekqLWguuCSC62DjAvUnPB
         9ICX9JrK+1sgs7QfhAA1/Ix5VbZ4RELTrmFpB80V3XtT+l0rmOHqUDDT91VpeEjrX6jd
         hYFPjJEu/6YJCQbbhvH/xms4wstezfNMsXMpgwT5smBI1NQJ5Dgv3o6Iiia7kNo4QIv4
         qIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758520906; x=1759125706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rr4Y8zTjumKo8nXqQcI7EddtDf0MyutlVC41SoVKa8Q=;
        b=AzlWcs4qprWs8BQZjSQ+O3sPjELzzGYZnT6loPwO3kcNuPH9v6Ayv6WGHmo63gw+Q0
         LqqtqWOE3RFJjZGnLynu4lr/n5RHwUCzwijSxyUxO5BNd1MOmyddJZ+AhcCrOd9854fG
         pBrw61WPuCgaoIuO6v8+hZrGCsJOZdLO8WbhmS0McoOaePFUKqX5Iil50naZWsy591C3
         oahvqFn6roA1v86nCGTCRqJBy64Fmxo/VXePwydjzUYz9pFepK5Rux0SSZL007L/gmrg
         bjhGi+Y1BYwgd8/AtSO6wTaZZ89khv0XpMeJDEz6+yZAqn6G6ZVBvB6o3WbD0xB0Y9v1
         hUkw==
X-Gm-Message-State: AOJu0Yz88y7SstFaRjUx++aifYHpslmc9x1hWa2DFYVsYt3G9/e2PKhl
	gSHDOQTJ7iYcKaPl81P1TYuPOH338tA1yTab4L3VnHGBdejtS23xvNDTWZxWmpwfPDQn4Xn+emR
	y/XyBb8pc+nfHiqxEECjxp7KZNttv/FaJQlcAAFNo0VrbXu8dir4KBh8=
X-Gm-Gg: ASbGncuptWpq14Cv2PaMZfAZqgXiQqdGQjX2JJtwmiJrCnUj8zGoSk3tjkmrxyfX5YB
	NH80D0fQshPYjhy2luGQNdKCxo7izCF34rXFaIBRnDNVZueEXfFsI2R2Y5vAfX2zMpNbTuyPFk+
	kxlcJx4om4WWkZUeREVmR1YM2O9dCWlAGHItQK5R2YDH5C0kQnHcA0HZlcbD5KPLiFBbR+4oUd8
	TLhgsJB9hoicaSKiiOdMRzxQGvpEMbIhmLXytkg
X-Google-Smtp-Source: AGHT+IH5JQ5qmd7tlvwu7FGQnXCZyIP18x6C7K4Iusq75IKyMYopUUBXoTYAujNH1og2bKjO7yU+MKFXAKqkQUR1erU=
X-Received: by 2002:a05:6e02:1a82:b0:424:5970:3d20 with SMTP id
 e9e14a558f8ab-4248190bd99mr191118045ab.12.1758520906207; Sun, 21 Sep 2025
 23:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-smt-k1-8-cores-v2-1-dceae56f36d9@linux.spacemit.com>
 <CAAhSdy2x2w0+92W1+L5FPYVpcTypakMjop7YLCADvZyrWKoe4g@mail.gmail.com> <869418C0C5B4E860+aNDhto1P8_DVRowH@LT-Guozexi>
In-Reply-To: <869418C0C5B4E860+aNDhto1P8_DVRowH@LT-Guozexi>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Sep 2025 11:31:35 +0530
X-Gm-Features: AS18NWCfOdR0BlqVGivkUxUYZq8nvhzXkmvOX4Zgsn9pQlO-EUOM6sjf6iIUuWk
Message-ID: <CAAhSdy1hdEyhV+paEOx3Y8SYVgpsV0MGCSEBQrVH57=sdV8YBg@mail.gmail.com>
Subject: Re: [PATCH v2] platform: generic: spacemit: add K1
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org, Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_230147_583166_EB1003D9 
X-CRM114-Status: GOOD (  18.76  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTE6MTLigK9BTSBUcm95IE1pdGNoZWxsCjx0cm95Lm1p
dGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAyMiwgMjAy
NSBhdCAwODo1NToyNUFNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gTW9uLCBTZXAg
MjIsIDIwMjUgYXQgNjo0NuKAr0FNIFRyb3kgTWl0Y2hlbGwKPiA+IDx0cm95Lm1pdGNoZWxsQGxp
bnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZyb206IFhpYW5iaW4gWmh1IDx4
aWFuYmluLnpodUBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiA+Cj4gPiA+IEV4dGVuZCBnZW5lcmlj
IHBsYXRmb3JtIHRvIHN1cHBvcnQgU3BhY2VtaVQgSzEuCj4gPiA+Cj4gPiA+IE9uIEsxLCB0aGUg
QlJPTSBvbmx5IGJyaW5ncyB1cCB0aGUgcHJpbWFyeSBjb3JlIGFuZCBsZWF2ZXMgdGhlCj4gPiA+
IG90aGVyIGNvcmVzIGluIGEgZGlzYWJsZWQgc3RhdGUuIFRoaXMgcHJldmVudHMgTGludXggZnJv
bSBib290aW5nCj4gPiA+IFNNUCBhbmQgb25seSBvbmUgY29yZSBpcyBhdmFpbGFibGUuCj4gPiA+
Cj4gPiA+IEFkZCBjb2RlIHRvIGJyaW5nIHVwIGFsbCA4IGNvcmVzIGR1cmluZyBPcGVuU0JJIGlu
aXRpYWxpemF0aW9uIHNvCj4gPiA+IHRoYXQgdGhlIExpbnV4IGtlcm5lbCBjYW4gZGV0ZWN0IGFu
ZCB1c2UgYWxsIGNvcmVzIHByb3Blcmx5Lgo+ID4gPgo+ID4gPiBDby1hdXRob3JlZC1ieTogVHJv
eSBNaXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29t
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFuYmluIFpodSA8eGlhbmJpbi56aHVAbGludXguc3Bh
Y2VtaXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4gLSByZW1vdmUg
X19zYmlfaHNtX2hhcnRfZ2V0X3N0YXRlKCkgaW4gc3BhY2VtaXRfY29sZF9ib290X2FsbG93ZWQo
KQo+ID4gPiAtIHBsdXMgUE1VX0FQX0JBU0UgaW4gUE1VX0FQX0NPUkUoMHw0KV8oV0FLRVVQfElE
TEUpX09GRlNFVAo+ID4gPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNTA5MTYtc210LWsxLTgtY29yZXMtdjEtMS01Yjc2ZTA2ZDEyZGFAbGludXguc3BhY2VtaXQu
Y29tCj4gPgo+ID4gSXQgaXMgYmV0dGVyIHRvIGhhdmUgYSBzZXBhcmF0ZSBmZHRfaHNtX3NwYWNl
bWl0IGRyaXZlciB1bmRlcgo+ID4gbGliL3V0aWxzL2hzbSBkaXJlY3RvcnkuCj4gV2UgYXJlIG5v
dCBnb2luZyB0byBzdXBwb3J0IHRoaXMgZmVhdHVyZS4KPiBUaGFua3MgZm9yIHlvdXIgc3VnZ2Vz
dGlvbi4KPgoKSSBkb24ndCB1bmRlcnN0YW5kLgpUaGlzIHBhdGggYWxyZWFkeSByZWdpc3RlcnMg
c2JpX2hzbV9kZXZpY2Ugc28gYWxsCkkgYW0gYXNraW5nIGlzIHRvIGNyZWF0ZSBhIHByb3BlciBI
U00gZHJpdmVyIHVuZGVyCmxpYi91dGlscy9oc20gZGlyZWN0b3J5LgoKUmVnYXJkcywKQW51cAoK
LS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
