Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BE9E8FDD0
	for <opensbi@archiver.kernel.org>; Sat, 27 Dec 2025 09:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7hsma45h7MQ0Cwko2xTgNgc5eaeEEDVV5fK3qvtA6A=; b=op487/Hx1C01dV
	0DWfRWbpseJWGWhHKQ/TPJEcfhxUch0VuH5LgqShWnD8tu3SKRpDBwt+n76M7gzygoFStmI6qPqZT
	Oo7Tp0ikOHK4+3T1HiZx6d9ur1FkdiTq41tS4J6fElmLxslljMzrBFXxBK2ujbleY0Yl4+ZKDyCN9
	JFV2IC9weJa5W/OlGQgngxw2dUIPTQ0qsJrJrAC6XaJ5ID80mfbFKui2/uIhLmTJe//cbIHfjh+bt
	aBRjjoCh4aYhav8Vz9lpHJGRhZFYQx1IQ0su59BCB5LpSzJIrzC0M2+Sxb/LxWOMFjiM1JLskwgF5
	3McAFhonFTm3pdrsPVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZQIv-00000001ot1-1DGV;
	Sat, 27 Dec 2025 09:09:41 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZQIt-00000001ose-0bFg
	for opensbi@lists.infradead.org;
	Sat, 27 Dec 2025 09:09:40 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-37b935df7bfso67401671fa.2
        for <opensbi@lists.infradead.org>; Sat, 27 Dec 2025 01:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1766826576; x=1767431376; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELO1KBB2Ztt0P/iy/GvVwIa0c6mH1UeXdbCUm3N5PLg=;
        b=SQebn3GM2NfCIU+kgYdfydxuvkG9d0uTFmiUMrx8n5hARTYKfnz4ASGYA4IeupnaUM
         O4ZGJ0/xCih1zYX/gkROicujB+5JdL9dJwp9hl9e9t8KhLmrpDmgn+q/nAMVKTNM7u6f
         CMyaAEYoy3g33Ae5VCSc89y/VwxrYbaDblykbUwd2OmqzRWMRJ4xZWUtDCjDT6EAs5Cm
         ffxfWSgcOmVGvwi7tnn/2rZFHmwOjOl/KrOxoH9ZZNThFQVBOoq25MYwZsMolZMvYgZD
         QKFlg6eLjOmTpn49wcFemtWSNZmoUKvxW547sNtm/GKZVZHvWg/M+qX6I06/DTfjgild
         xADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766826576; x=1767431376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ELO1KBB2Ztt0P/iy/GvVwIa0c6mH1UeXdbCUm3N5PLg=;
        b=EmlX0ikU1GCorvGyXKuOzmlOK4mMWrc/PvHwtOld4pDc0yck8i2rLyuBAsUY+r9T2g
         CsrI4e54r94NZvz8ezmEZaTt3lfFNR0TyHl5xXK/bQN8E48hHZDScplWQ+srTOOCuKh9
         HJSsRHJl1E2zW/TqXh/lTV9RvvNrmgiHStjsKUfZZnOPVOHMXwMMlxD/1lAV5+rIe+DK
         Um5q0eNpgbkt2Ha2sc3PzEOJ+ukkNSn5qZk0f8zb6kkY+lvMRBOUUdC93BOoTP828wbv
         aQ1zpgZtqw3yWoPMx4Z7fXCRzd5LJUFBua8lP6GQDk/IrFCxEttdozjl4Zsej9yEDwlF
         jD/Q==
X-Gm-Message-State: AOJu0YzLpTjFqwcyCV/9Dczsc0FbJawSSgRjQnQxaZyooxBTHpzohDqn
	yjLVJgnYCnKnbnj/m5ZJWWScrH1bypTtjPjPKM/noR3JFqHWxKuV/37reqtb/vxehBGkNcmviK6
	fZ7Vx3Bjuu3JT0cQ2+cTWeITpByzmox3x+ApqjuNivQ==
X-Gm-Gg: AY/fxX4aYWXHCeph3rYEDbzHaT6yUqSsSunwG8DCXY8PakC9UODX/lxd+zzy+67YIjt
	t3bnYIvZWbbYPMojnlMBSBdtyhl2Q1F6B9A/oPUy/vN0qnxxg7Fmf6AcN24Iby7UyNQaZ+upzH4
	IoJt6G8epGOJj4WRJJKcVffRFtbskIfuzUoec9VkJi5EltVFm1w2kHj+mR13kslDXmIvub73B/o
	8uGn8ARdDBgPsyKpiyOA0IeVyn6ab61UpMuHZHjtGVKICfm5mQYOEQiihjPKh3JWBkDv7Jm
X-Google-Smtp-Source: AGHT+IG7kmGpvVPzx/j1aMD97H1GuD9VewySg65TjT/RMXDtLdg8YdGg0WClHgE2R1Dz87kGnrpaf0DGVzAq8y8Vy6Y=
X-Received: by 2002:a2e:b8d6:0:b0:37f:af1a:d455 with SMTP id
 38308e7fff4ca-3812161ca26mr74982821fa.26.1766826576308; Sat, 27 Dec 2025
 01:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20251213104146.422972-1-jamestiotio@gmail.com>
In-Reply-To: <20251213104146.422972-1-jamestiotio@gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 27 Dec 2025 14:39:25 +0530
X-Gm-Features: AQt7F2qrlUWbddaxadf2DTB2DCoJLeyvbuF4_mConYjXO4LcmUWrOYxeay59sws
Message-ID: <CAK9=C2WmqXC+UTqAzx_dKmZAmOULipNjymwJCWXtv=XiG1yhvA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: sbi_pmu: Fix multiple start and stop operations
 of FW counters
To: James Raphael Tiovalen <jamestiotio@gmail.com>
Cc: opensbi@lists.infradead.org, andrew.jones@linux.dev, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_010939_205000_9607FEEF 
X-CRM114-Status: GOOD (  21.18  )
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

T24gU2F0LCBEZWMgMTMsIDIwMjUgYXQgNDoxMuKAr1BNIEphbWVzIFJhcGhhZWwgVGlvdmFsZW4K
PGphbWVzdGlvdGlvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIE9wZW5TQkkgcmV0
dXJucyBTQklfRVJSX0FMUkVBRFlfU1RBUlRFRCB3aGVuIGF0dGVtcHRpbmcgdG8KPiBzdGFydCBh
IEhXIGNvdW50ZXIgdGhhdCBpcyBhbHJlYWR5IHN0YXJ0ZWQgYW5kIFNCSV9FUlJfQUxSRUFEWV9T
VE9QUEVECj4gd2hlbiBhdHRlbXB0aW5nIHRvIHN0b3AgYSBIVyBjb3VudGVyIHRoYXQgaXMgYWxy
ZWFkeSBzdG9wcGVkLiBIb3dldmVyLAo+IHRoaXMgaXMgbm90IHlldCBpbXBsZW1lbnRlZCBmb3Ig
RlcgY291bnRlcnMuCj4KPiBBZGQgdGhlIG5lY2Vzc2FyeSBjaGVja3MgdG8gcmV0dXJuIHRoZSBz
YW1lIGVycm9yIGNvZGVzIHdoZW4gYXR0ZW1wdGluZwo+IHRoZSBzYW1lIGFjdGlvbnMgb24gRlcg
Y291bnRlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBSYXBoYWVsIFRpb3ZhbGVuIDxqYW1l
c3Rpb3Rpb0BnbWFpbC5jb20+Cj4gLS0tCj4gIGxpYi9zYmkvc2JpX3BtdS5jIHwgNiArKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9z
Ymkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKPiBpbmRleCBlMjRlNDg1ZC4uMDIxOGM5
MjEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfcG11LmMKPiArKysgYi9saWIvc2JpL3NiaV9w
bXUuYwo+IEBAIC00NjgsNiArNDY4LDkgQEAgc3RhdGljIGludCBwbXVfY3RyX3N0YXJ0X2Z3KHN0
cnVjdCBzYmlfcG11X2hhcnRfc3RhdGUgKnBocywKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY2lkeCAtIG51bV9od19jdHJzLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBldmVudF9kYXRhKTsKPiAgICAg
ICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChwaHMtPmZ3X2NvdW50ZXJzX3N0YXJ0
ZWQgJiBCSVQoY2lkeCAtIG51bV9od19jdHJzKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gU0JJX0VBTFJFQURZX1NUQVJURUQ7Cj4gKwoKVGhpcyBjaGVjayBzaG91bGQgYWxzbyBi
ZSBkb25lIGZvciBwbGF0Zm9ybSBmaXJtd2FyZSBjb3VudGVycwpoZW5jZSBpdCBzaG91bGQgYmUg
anVzdCBiZWZvcmUgdGhpcyBpZi1lbHNlIGJsb2NrLgoKPiAgICAgICAgICAgICAgICAgaWYgKGl2
YWxfdXBkYXRlKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBocy0+ZndfY291bnRlcnNfZGF0
YVtjaWR4IC0gbnVtX2h3X2N0cnNdID0gaXZhbDsKPiAgICAgICAgIH0KPiBAQCAtNjI5LDYgKzYz
Miw5IEBAIHN0YXRpYyBpbnQgcG11X2N0cl9zdG9wX2Z3KHN0cnVjdCBzYmlfcG11X2hhcnRfc3Rh
dGUgKnBocywKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgICAgICAg
fQo+Cj4gKyAgICAgICBpZiAoIShwaHMtPmZ3X2NvdW50ZXJzX3N0YXJ0ZWQgJiBCSVQoY2lkeCAt
IG51bV9od19jdHJzKSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FQUxS
RUFEWV9TVE9QUEVEOwo+ICsKCkFzIGNvbW1lbnQgYXMgYWJvdmUsIHRoaXMgY2hlY2sgc2hvdWxk
IGJlIGJlZm9yZSB0aGUgcHJldmlvdXMKaWYgYmxvY2suCgo+ICAgICAgICAgcGhzLT5md19jb3Vu
dGVyc19zdGFydGVkICY9IH5CSVQoY2lkeCAtIG51bV9od19jdHJzKTsKPgo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKSSBoYXZlIHRha2VuIGNhcmUgb2YgdGhlIGFib3ZlIGNv
bW1lbnRzIGF0IHRoZSB0aW1lIG9mCm1lcmdpbmcgdGhpcyBwYXRjaC4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRo
ZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
