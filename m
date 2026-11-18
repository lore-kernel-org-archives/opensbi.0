Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1792606A331
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TyY1JLqo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=pmU1at4H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MpZ9QIBXLuAwj1w8BgOAH2Cu84RjDLuiOcPog7qDofY=; b=TyY1JLqoakd2F9tgvil2Izh2e0
	fkKI3QltiUrLHz8k08QzoQbUXJ4rhR0+OpFa4mEpYdiRsetqtBY61S22Pplpu/obX5wNt9g/S3LWj
	USCmzob8l1KieWihdeFAcFrjaIwR0T2KxB+HvR3YHpKG9i+Sqcq97X3bfkAS/iRKnqpQbDofAVV1g
	2rjQuEFk5I5nuA0c5RUV0Z0cBzQSfw6VDCJMmETAKlGjyUJfe/iBkWPOtTWDeWZ1gxaZrt0CIF/Fu
	0/ZTDiHopue0WbauO2GyD8xgnTJpsIJ3oUDfW/r3eybbyFvGg98rS/dWs3ZfaxjCjX1HpfARsle/l
	wUVi4I9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgdz-000000096YP-0WAD;
	Wed, 18 Nov 2026 14:28:15 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgdm-000000096U3-1wsn
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 14:28:12 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4a42b34e930so799578f8f.2
        for <opensbi@lists.infradead.org>; Wed, 18 Nov 2026 06:28:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795012080; cv=none;
        d=google.com; s=arc-20260327;
        b=XSekVLEl9rQMOXU7GT0rGQSs+QIFNZdBiRbDPuhhw/se7K+cWhAG0DhvSwbAMuiaNQ
         KRiPOKe0N9Ypovp4DkpZYRUlE/6QIxOdx+fo50yvaiY6EZDS9BlYFv/Uhbkt6hCCIzXU
         c4DATJN0RA71KLXdruQNOzrbrFEnL3ZqTCcX90og0Qp1n1rGxxEk+Vd6hCjX9/5QAOmi
         NCwiP8QB33n78FpQFchRm97qIHoq0471cGPr0WXpqCdSxErkd2bIU0Jp2F1Uv90ubIIE
         5UJFz/tJTwKmNQ5NUeiJfLF3SwcHI7Moc2dtmVCgm9kQE+SecMhC10XyoXUGcZF+jjzN
         pzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XaDlT+uEvuibfJt2VZgZPsFYXEbBEv/H2OZqn/QnR2o=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=ejCU9SwfnDqnUEfsmrKeeKflP4ORsYWGFM3aGYUbg+HYsB2SF7v1Q+F08qMJV5t8Hq
         Q2w+qmeEwaLuH4UgkomaHlCehP2P0jZPLHKG2sWZOX5/8MoP5Tjxxwf2g8B/ryVX1gBs
         aunSXylm4RA+4ICsZYZjAa3SguMeFZOp9j/3/EdUKts1heiHrRdylHMI5/JXeJsLShuL
         OS9awUWeSsRlvjdEafpC5eTzYpvYBTi935/kCrZcAu33mkpqZBR6bY6U2zkYywN30fa+
         wHtnJJqcUYIB9bDyILmkhKL7d8JYJKxiPX3Y6lvkhaPI2ba0DlMKHvPPIvfgsyByj49Z
         F+uw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795012080; x=1795616880; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XaDlT+uEvuibfJt2VZgZPsFYXEbBEv/H2OZqn/QnR2o=;
        b=pmU1at4HgdobEX4Ve21nk2+GxYwHSJv9yOO1IdN+Qd3+0A6ay6Z8dRoBOBe9M8xJDV
         ktpxx+H+0GiBHL3Iku+2YRxtdGe+8E1udYnJ94nwrDma7nBVORcMO+dtUF5wFTBFZNGa
         7ip1smwRLJUjmtVTg82zdtKiVobn4IRwRNKxphMtSFB1DSYFM4eLPQ4bBdnl1UFjHVhm
         vQaKbM6Z9kmg/ZiFHSbTrndkepwhxaZ7Qpk+Dl5fuSsCxXKT1Um00jiWQesu8eB9bDbH
         D5mvsyRkGowPyNjaArWLgu26xRZUjp5oz8Dacsk1WRGrd0yvGg38tlDMhK4sz3kdY3Ka
         tkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012080; x=1795616880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XaDlT+uEvuibfJt2VZgZPsFYXEbBEv/H2OZqn/QnR2o=;
        b=pvxRcDHGToBlC7QtquEk1pRoK6lLv2k5gnffaQ9ISxBORIHbGS7SgZLZG7w2jV/I8g
         65FEjp0xhnZM7zjuNbWb1CjZfx82ADFM8TbLLGqsDOOYKJ06WqxZbrqvGh/VaDR886GH
         nlfqa01buJG2KmMu5L0AzZUGausqIjVTdr81h62duTrFZfh/AypFsfw0rzHa1iKauCqF
         8Q4L3BcaxCMcifyuLY6nEJNokabWI17i58S0I8EjybNG8owMCOAbU69U5F2DfLuUV8Ok
         w0CBkUR1bQ777se+urltSN5bozR8JQpjg95WZ5dQ+YXy7kKfrGAObQxjzdggjFM3N0/K
         IXqQ==
X-Gm-Message-State: APuU4Z8F/s5x8qD8h1AR31CDORFTBszpW44K/y00vn+gbAuCPxGnyNU4
	k6P0/VOLQpAdDxForqdEsZREc6TXtC4sYn5qeWhKYVc+2HiXLfiIqDthOvKI2AgZiohxXHgTQeW
	vZfoserf6wnnpJLYzvZWIT+ouKVYVctv4Ms9d7GP7aw==
X-Gm-Gg: AZFdTZfykclhpa8vSVtBZl6rbURCBS+oCqpABRz4zmYV5Zd4aJWvC7AsDOkulWTBEBK
	Zc/Q6OAW8thUxaWEMSDTYRImAdNZPHdCZRkPCbYMKJhYDIhpPV1Y2MxxDdRyYH06yEN7uH7PM05
	V2Itji1GTDb7D6sZ4uTRBHCIZUVIPl0t3sjY621pS7e24mTgdx9zSlqm5M74oonGR2EcqRQgAk4
	6vZWZ33mWmHnO+mgWAYSIgDnJp+LYBBm1aSFo9SOtyY019UOlNpRbByUI505C9CzZvuacx51jOt
	3FRQjMl7xZHb0uG77Z7YgEhfeSTyIZTe4p07jHRnPkjhIS3Oxh8pFLJ3FL+GrIESobShHc5ips8
	K7OYDyrGDAIV2g4e8DqPwu+1EN4MqglC02MSwBT5vd0nMNW+7bSzPRriiy8qHZynmjMWrBi9zcy
	WTnGIyDaXPgjVSRRK2mqaH18N6uV2LZnI4YzC+mTYTinskT03q29tr
X-Received: by 2002:a05:6000:4301:b0:4a7:b8ab:df75 with SMTP id
 ffacd0b85a97d-4a7b8abe271mr2908630f8f.44.1795012079655; Wed, 18 Nov 2026
 06:27:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com> <20261117184547.1145243-3-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20261117184547.1145243-3-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 18 Nov 2026 19:57:48 +0530
X-Gm-Features: Aa3M54pxPX4oETPvbr9op8Bbioc99t0ieRUDLI8HaLMOiYJjv8GdrIyYkRKHe-s
Message-ID: <CAAhSdy2MbaL21GNj1GUfkiE4SgJqtM4iypu1fM=JBboLk6KmLQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] include: sbi/sbi_hartmask: add equality helper
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062803_670946_5467A349 
X-CRM114-Status: GOOD (  16.76  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMTI6MTXigK9BTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogT3phIFBhd2FuZGVlcCA8
cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgo+Cj4gQWRkIHNiaV9oYXJ0bWFza19lcXVh
bCgpIHRvIGNoZWNrIHdoZXRoZXIgdHdvIGhhcnRtYXNrcyBjb250YWluIHRoZQo+IHNhbWUgaGFy
dCBpbmRleGVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogT3phIFBhd2FuZGVlcCA8cGF3YW5kZWVwLm96
YUBvc3MucXVhbGNvbW0uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnRtYXNrLmggfCAy
MSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaGFydG1hc2suaCBiL2luY2x1ZGUv
c2JpL3NiaV9oYXJ0bWFzay5oCj4gaW5kZXggZGE2ODIxZWUuLmU2ZmNlMzIzIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2hh
cnRtYXNrLmgKPiBAQCAtMjA2LDQgKzIwNiwyNSBAQCBzdGF0aWMgaW5saW5lIGludCBzYmlfaGFy
dG1hc2tfd2VpZ2h0KGNvbnN0IHN0cnVjdCBzYmlfaGFydG1hc2sgKnNyY3ApCj4gICAgICAgICAg
ICAgICAgIChfX2kpIDwgU0JJX0hBUlRNQVNLX01BWF9CSVRTOyBcCj4gICAgICAgICAgICAgICAg
IChfX2kpID0gZmluZF9uZXh0X2JpdCgoX19tKS0+Yml0cywgU0JJX0hBUlRNQVNLX01BWF9CSVRT
LCAoX19pKSArIDEpKQo+Cj4gKwo+ICsvKioKPiArICogQ2hlY2sgd2hldGhlciB0d28gaGFydG1h
c2tzIGFyZSBlcXVhbAo+ICsgKiBAcGFyYW0gYSB0aGUgZmlyc3QgaGFydG1hc2sgdG8gY29tcGFy
ZQo+ICsgKiBAcGFyYW0gYiB0aGUgc2Vjb25kIGhhcnRtYXNrIHRvIGNvbXBhcmUKPiArICoKPiAr
ICogUmV0dXJuOiB0cnVlIGlmIGJvdGggaGFydG1hc2tzIGNvbnRhaW4gdGhlIHNhbWUgaGFydHMs
IGZhbHNlIG90aGVyd2lzZQo+ICsgKi8KPiArc3RhdGljIGlubGluZSBib29sIHNiaV9oYXJ0bWFz
a19lcXVhbChjb25zdCBzdHJ1Y3Qgc2JpX2hhcnRtYXNrICphLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0bWFzayAqYikKPiArewo+
ICsgICAgICAgdTMyIGk7Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IEJJVFNfVE9fTE9O
R1MoU0JJX0hBUlRNQVNLX01BWF9CSVRTKTsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChh
LT5iaXRzW2ldICE9IGItPmJpdHNbaV0pCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IGZhbHNlOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiB0cnVlOwo+ICt9Cj4gKwo+
ICAjZW5kaWYKPiAtLQo+IDIuNDMuMAo+CgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
