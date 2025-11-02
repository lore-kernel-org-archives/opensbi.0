Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA8BCCF9E3
	for <opensbi@archiver.kernel.org>; Sun,  2 Nov 2025 12:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apiemvLBmOA/Uemc64MZaFQaUrtWFSc4Ag2MSlWvsSA=; b=u4kyZNj07UloR4
	dv8HWqIZeh8KbZ+vmAjViCVkXYg3r4YZkrn+emIF/IXhWkadvmso1LBP/8+G52hT1L9ccI3wMoGr6
	2elVaUMyMAS+IshsRnysJ5Gez4pjvz4FvPDIbSHvh2SuLkKD97ejvlXQmPTvIWpDI1InPNXHDHZRV
	+/tHV8s8/xRXQUxXIIZrxz/Q3jQWICJmQNKZZZBj87v6QJ1EV9y8A6E+AMoy2ji5ovt8dp+b7RvQg
	7Xh+O1EcykuBkdcELvvIpmGuJ8s7yGJDsEv55noH+ixeG7QVcTaj6HwyKLZzTRziV7UXSk5bE11a5
	yuVOkQOV07deMmeadS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFXDG-00000008XTe-2JLa;
	Sun, 02 Nov 2025 12:29:38 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFXDB-00000008XTL-22vH
	for opensbi@lists.infradead.org;
	Sun, 02 Nov 2025 12:29:37 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-4330ef18daeso8416265ab.3
        for <opensbi@lists.infradead.org>; Sun, 02 Nov 2025 04:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762086572; x=1762691372; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5ZalbvUlzkuOcBjfIYS0T4iLMggo+G5dp9LyjHXkdk=;
        b=Q5nBZvWyXlSzXLaXqH5t8chIUoMOURvzaUkI9O83nK4IN3EuvY4B85XU0vb2QAD0Dr
         lQf2QB5L72ssRdxJ4mp7V1i7ZM5Y3FtWFEz2zQ6/1ADxmgUbp/fTFWmM8CmNrxVvS9Rb
         BOafP4XfP4LgNs8VCcxNOS4cMqTbb2X3Q62xDuhjJDSeBHPjrefRehONRLDlOr8Smpk1
         gk25DaMAWTk1qA/wesoE1kSL1fxI6+15f6SRikc0jBs3aoom1n/SPoYn+lTZSjjwKsim
         nw2AkTZw1xQ9/TcVQzORHcdpBlXKe5VAgD2bmv4dJTXjxfepJmBXjHtbDutmE45PYD6k
         PjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762086572; x=1762691372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5ZalbvUlzkuOcBjfIYS0T4iLMggo+G5dp9LyjHXkdk=;
        b=n9i2n/A5cS3uPeRYQLAk1YHaHRcOi7a7nr6xrq8vtoRLSBAqSIlM8i3np2r0D6TBpI
         lArx8p//D7fQ1o6IliFshNAXFoc1aKJUQsj33Hnrr+jbM2L2G6DmaZc2bo70rl8nPI+E
         bJdczAjehy9GU3WRI2SQ10cf/r0/yRoTcG7XVJw6zbdcJTafCNqePeapn9B/SEdLAGAm
         eQCGdtSMUamAJ/lSi3EettRcZ+diJJEKx7ZaqVzI25TqZbXdHFK+H5M5vrlUK9ZYX8KY
         1dUGngcSPc4p5njV4gNzlABOraShV6UAu5i23xBnKbFQWacTiPOGHRCPVoduP3YT9MG0
         L1OA==
X-Gm-Message-State: AOJu0YymrQnRxBtjpixdAcj0quBnCx1CvnZSnK6RHAt3G5BUwoyy127h
	9MA03iy8TlsGEtm1Q4biPg648V0WSow5M2+TRVJ2JKJXzjohtUGARh97sC60RHfgMxKDA8VmAoT
	hCZuQRReJcz2L9ckjhlv+hdGsqT4YJkQLg3ZJjQyeOtsvejLZp1Or4KXoQw==
X-Gm-Gg: ASbGnctHq84INbVyPhCoJeznH4huxJd7etIJqO86Yqob6qrRMDUxf7VTU1W5YdIaPrQ
	+cjTLQqwxoiY9NTxmOBwA5EgRwrg90oh81ZCpgPZk94+wv8WmC8P8v8vTO9rwFvXVcns6ScshFK
	ynz3KK2qRwwkAQz2WvqOT8xRZI969zMzirBLG4zjSwyaas4EqcVP5S/dsAF4IAonvt8eDRCTfGg
	CiGleOAHwtqb7eFExlMwYAPLCaj4rjf995dUSqaKfkyOQ2ijSbGviGnkFOWwanB1hJoBxmLAsP4
	0p9jzVTXD2yaiJBAo6L0jXbYi+R/n3kBFcboXw==
X-Google-Smtp-Source: AGHT+IGHA9Wy02/ojRBV1fNOkEvtIJTJcuFkbUBvGpQbLuSTjAKQbMGp97K7JC/fAU3ugjDGPU4yLv/Hy3hh8axy72c=
X-Received: by 2002:a05:6e02:3e93:b0:433:2dd5:f571 with SMTP id
 e9e14a558f8ab-4332dd5f894mr5295365ab.25.1762086572356; Sun, 02 Nov 2025
 04:29:32 -0800 (PST)
MIME-Version: 1.0
References: <20251008084444.3525615-1-peter.lin@sifive.com>
In-Reply-To: <20251008084444.3525615-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 2 Nov 2025 17:59:20 +0530
X-Gm-Features: AWmQ_bl5euG3ccUDXhfNRdFcJYi_IV-sid6t4qfvNGVhV3WV8edn7cjWKudCJSo
Message-ID: <CAAhSdy24ZN2WnmkToBNh1u8Lrx7p+ACJOW+3UEzNoZpGNOMsCA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] SmePMP bugfixes and improvement
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	wxjstz@126.com, alvinga@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_042934_384700_041E9330 
X-CRM114-Status: UNSURE (   9.71  )
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

T24gV2VkLCBPY3QgOCwgMjAyNSBhdCAyOjE04oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBpbXByb3ZlcyBTbWVQTVAg
cmVsYXRlZCBmdW5jdGlvbnMgYW5kIGZpeGVzCj4gdGhlIGFjY2VzcyBmYXVsdCBkdXJpbmcgZG9t
YWluIGNvbnRleHQgc3dpdGNoIHdoZW4gU21lUE1QCj4gaXMgZW5hYmxlZC4KPgo+IFl1LUNoaWVu
IFBldGVyIExpbiAoOCk6Cj4gICBsaWI6IHNiaV9oYXJ0OiBtb3ZlIHNiaV9oYXJ0X2dldF9zbWVw
bXBfZmxhZ3MoKSB0byBzYmlfZG9tYWluCj4gICBsaWI6IHNiaV9kb21haW46IGFsbG93IHNwZWNp
ZnlpbmcgaW5hY2Nlc3NpYmxlIHJlZ2lvbgo+ICAgbGliOiBzYmlfZG9tYWluOiBwcmludCB1bnN1
cHBvcnRlZCBTbWVQTVAgcGVybWlzc2lvbnMKPiAgIGxpYjogc2JpX2hhcnQ6IHJldHVybiBlcnJv
ciB3aGVuIGluc3VmZmljaWVudCBQTVAgZW50cmllcyBhdmFpbGFibGUKPiAgIGxpYjogc2JpX2Rv
bWFpbjogYWRkIFNCSV9ET01BSU5fTUVNUkVHSU9OX0ZXIG1lbXJlZ2lvbiBmbGFnCj4gICBsaWI6
IHNiaV9kb21haW46IGVuc3VyZSBjb25zaXN0ZW50IGZpcm13YXJlIFBNUCBlbnRyaWVzCj4gICBs
aWI6IHNiaTogc2JpX2hhcnQ6IHRyYWNrIGZpcm13YXJlIFBNUCBlbnRyaWVzIHdoZW4gY29uZmln
dXJpbmcgU21lUE1QCj4gICBsaWI6IHNiaV9kb21haW5fY29udGV4dDogcHJlc2VydmUgZmlybXdh
cmUgUE1QIGVudHJpZXMgZHVyaW5nIGRvbWFpbgo+ICAgICBjb250ZXh0IHN3aXRjaAo+Cj4gIGlu
Y2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgICAgfCAgMTEgKysrKwo+ICBpbmNsdWRlL3NiaS9zYmlf
aGFydC5oICAgICAgIHwgICAxICsKPiAgbGliL3NiaS9zYmlfZG9tYWluLmMgICAgICAgICB8ICA5
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICBsaWIvc2JpL3NiaV9kb21haW5fY29u
dGV4dC5jIHwgICA0ICsrCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgICAgICAgfCAxMTYgKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxNTgg
aW5zZXJ0aW9ucygrKSwgNzIgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDguMAo+CgpBcHBsaWVk
IHRoaXMgc2VyaWVzIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpSZWdhcmRzLApBbnVwCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
