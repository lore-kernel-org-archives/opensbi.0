Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD9CCD37AC
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bneO3Sx19NvMB43Vj+ceF2pyUKOyVbEwwm42q4964R0=; b=zifyZNFFxoex3d
	Wyh1KG7jQ8YZEXyQW9Exu9QW85I/SJqVryVu2iTFztEpVZWjgUW7xPqN5auv0b2J4088AiFxoxW5E
	djgKxxilVEnKQg+8KZnEK9E+Yv46TZqu80V4tui+TDPKRdjkGlgFSjD0PIXRvHIrTi6JUtB5P5IGT
	QOrzWMCByVd7XzQ9JxJGWg9AcjJI+SsGT6PiaYnQl1eLD7qgTHoh2jjGiNuyR59l9Tq/kYXXoS8Kh
	enPoWVcg2hVSxHGxiJ1zpx1Jn2cZgHCp9gM2GCeMJSAZQAzit6RIJbcx1SqOC+gZpje1YCy262Yty
	pxo20lYQ/cXJc6gpW5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMR7d-0000000Dpgp-1sLo;
	Mon, 11 May 2026 13:56:37 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMR7b-0000000Dpg0-2FTw
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 13:56:36 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4824176bbbeso865746b6e.0
        for <opensbi@lists.infradead.org>; Mon, 11 May 2026 06:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778507794; cv=none;
        d=google.com; s=arc-20240605;
        b=bS5VxJz7dfaexJ35+sX+STN3X6Oqd79z1r/3wScXZKgb6j5sCIAsxZCyd/3AkWjmjc
         zk7/o4pJm0BrMbfAcDJ9CuqPdk6A0LgN1Rq/I7LkROKo0U29ySJc7aVX1waB8KaHUbwm
         n+5yOVHw4REKIE2R0p9uL6EJn2IS9zPjeXMgawF8r7Au3mJedWD1fNq5hxft4qZvUN38
         CcQa16w6VyT8FRL7lK052zbZb0ezYa6xQZQwudbFBFX/keW+GxcuhqXhsWfcf5xzUIvr
         ew4I5dOYyVBsOxfsBswe7HwOemkpkK5n2boQvb4Qnw6yMjETaFVwtF3cq5Ivfc7QP2Mp
         OItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a6+JvjSlnfWA46ElWHle524B5YYQtLnJE6G1LjTnJi4=;
        fh=ShLZuGA5Ga9ZSwTp3CGA04qdm0rmXd4x3VKZmN6jqbE=;
        b=h8eVJcJ4Pzafo/MrQvXEGcmiMXD+HeazDSSQ8I+lIxbcSp7bUJpUrJjdiUq958d4Nk
         4lcsU6z2Dy4ChtHkVEBf8HFbRRDCXfSEanYW+PTmqHTP5TvtgudsKr4jSoPOe0a1gk+5
         OPE+leGuMlVEbk5oQ6Pg2lbW1tpdipiIvIvN8dy7pa1Hhmf12MwnsXIDLREoebwyzIb9
         BYkMUOhlbvAaBB3jwJlWNUaPoDMq++QYxFulqJhWn56Rq6qI2uAu/2Rnu84vvwFp9+/h
         oiL4QmHWpMVka7JdMhvo+DGTcpN+BUz3opVhd9SMDu9sblMxssBJhZl6FjLqQIJeOYwf
         4QmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778507794; x=1779112594; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6+JvjSlnfWA46ElWHle524B5YYQtLnJE6G1LjTnJi4=;
        b=j8Z7URNJsCLoj0UxHUrzvNakoN6/dmOD2E2jU/gGlDAuuELF8rdc2lVyaDONLjyBIw
         nmRZXjhI8tI9O0AIV6WzpGVo4D+b+HqItQrDGFwedrsvmdNmxZ0v+Na4TpuEqGxkE3eA
         0973R+wyxp7PsIRMi4kPb+QpsI9gPJtDeLo5rWEMsY6OBP5inwLlQxkvAYneUplMfIMg
         fq2gTp41wguo/idMycP0Hyg5ip/t58OYBE2A8cZfgLC0ZHLdMeXGUa/e7ToqkeasTc3U
         KomMxAWCh8y1BQp1WDVX1xi0Z8rO55+X1KRArZ+uLkMHqJbvYSIAflEEy+2To5IHp0BF
         YKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507794; x=1779112594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a6+JvjSlnfWA46ElWHle524B5YYQtLnJE6G1LjTnJi4=;
        b=SUEbeeNPnNPEQsRpdzmcloc+xRREZA14tr/sOq/BKzfyLHP+CJ2FZE22KJT5Eyn9Q3
         Kv2zfEuEGFNusloI+AwLBa6ob20tpWZfq6ojA65vkohjy8DrxjX4lxDRRT+crqSRuye8
         SIKhfsISK7Q5bYHKM8LCSmFNmmY+din5Y1NVY+5N+QXmA+m+wYSaO9rZPlrTU896ui5o
         7rbZi8TZkhnlMpYasVCSzFvD1ayRx1mgeprj+blBEcGezhOaFy8tdNa4tnxdVUfpoizs
         7YuwAPuJfiExDxbSx8jmsNl91G4aspGQLYzktvMhtyKb6+Qm4tY5scaSy+keGX6TrQEL
         J+lQ==
X-Gm-Message-State: AOJu0YziqNOt37Jtk+CQh5wu0W2DuvZsamboX/U3zMitCeGil4PMlbxu
	DSFKCdIIkmpLcFVOeen7B7/Ukb3yQ6HNVFTpgr2zjRyhpvw3Lf9oOZuGum20nW6gLM0mtjcYGGL
	84Q8YZjFWglqzmaVZOGRJMzUisvID+XlxuDUAXnBlNaroOMHFQbZl2QU=
X-Gm-Gg: Acq92OFWurEfSv7EDatQ/ldKoSfDVYY0y44v89YFodlIsTQIcfL+7iiQEOTWTqnQ3L1
	5na9YPJbPiQvJuJI/jUV+QIImL3oTSpJkv57FHLUmWSP0Vljwj1rdjcbitHbnUT8q87+E1J6trk
	HbfB3/+Uz70/cAaSOLguV3MG3ykv2ltQ0NCvvEOSRwGhVADWSW13fJOE1Kfi5Z7ThM1qCcaHJvW
	I8UVYV1yR2ndbdwn8/9R1sdsu1zaEEsd1IbgS9fcX0e+QJmUL8PEzzptW1ZAkQAnt5js8khZz5v
	9Hc/cqfRN05+LdhOFy+xzcC4Q6FA1GX0U0x+mp/BVxmE9T1tF8oFkcvwdd4UVUAmjdykgal3zkU
	k9fUnHz08Nukc26JUJS1DckqEWaM=
X-Received: by 2002:a05:6820:3101:b0:69b:5696:e63f with SMTP id
 006d021491bc7-69b5696ef1emr1811814eaf.24.1778507793594; Mon, 11 May 2026
 06:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260419150857.2705843-1-aurelien@aurel32.net> <20260419150857.2705843-3-aurelien@aurel32.net>
In-Reply-To: <20260419150857.2705843-3-aurelien@aurel32.net>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 May 2026 19:26:22 +0530
X-Gm-Features: AVHnY4KnFu-RE4yRCVvFPrhBW1H8UzAO9dhxoCc25pHHKTb4JVzW7FM4_9SWu6M
Message-ID: <CAAhSdy0m+9HZ0fMxVSeFak1Yhc70ceNDGBKh=qsEbJ-wSe8jpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib: utils/reset: add SpacemiT P1 PMIC support
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_065635_590081_336D7F6B 
X-CRM114-Status: GOOD (  25.44  )
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

T24gU3VuLCBBcHIgMTksIDIwMjYgYXQgODozOeKAr1BNIEF1cmVsaWVuIEphcm5vIDxhdXJlbGll
bkBhdXJlbDMyLm5ldD4gd3JvdGU6Cj4KPiBUaGUgU3BhY2VtaVQgUDEgaXMgYSBQTUlDIGNvbW1v
bmx5IGZvdW5kIHdpdGggU3BhY2VtaVQgQ1BVIGxpa2UgSzEuIEFkZAo+IGEgcmVzZXQgZHJpdmVy
IGZvciBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJl
bDMyLm5ldD4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoK
VGhhbmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvdXRpbHMvcmVzZXQvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgfCAgIDQgKwo+ICBsaWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X3NwYWNlbWl0X3AxLmMg
fCAxMTIgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGxpYi91dGlscy9yZXNldC9vYmplY3Rz
Lm1rICAgICAgICAgICAgICB8ICAgMyArCj4gIHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZj
b25maWcgICAgICB8ICAgMSArCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTIwIGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91dGlscy9yZXNldC9mZHRfcmVzZXRfc3BhY2VtaXRf
cDEuYwo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9yZXNldC9LY29uZmlnIGIvbGliL3V0aWxz
L3Jlc2V0L0tjb25maWcKPiBpbmRleCA0ODM1OTIxZi4uZjk4OTI2ZTUgMTAwNjQ0Cj4gLS0tIGEv
bGliL3V0aWxzL3Jlc2V0L0tjb25maWcKPiArKysgYi9saWIvdXRpbHMvcmVzZXQvS2NvbmZpZwo+
IEBAIC0zMyw2ICszMywxMCBAQCBjb25maWcgRkRUX1JFU0VUX1NHMjA0Ml9IV01PTl9NQ1UKPiAg
ICAgICAgIGJvb2wgIlNvcGhnbyBTRzIwNDIgaHdtb24gTUNVIEZEVCByZXNldCBkcml2ZXIiCj4g
ICAgICAgICBkZWZhdWx0IG4KPgo+ICtjb25maWcgRkRUX1JFU0VUX1NQQUNFTUlUX1AxCj4gKyAg
ICAgICBib29sICJTcGFjZW1pVCBQMSByZXNldCBkcml2ZXIiCj4gKyAgICAgICBkZWZhdWx0IG4K
PiArCj4gIGNvbmZpZyBGRFRfUkVTRVRfU1VOWElfV0RUCj4gICAgICAgICBib29sICJTdW54aSBX
RFQgRkRUIHJlc2V0IGRyaXZlciIKPiAgICAgICAgIGRlZmF1bHQgbgo+IGRpZmYgLS1naXQgYS9s
aWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X3NwYWNlbWl0X3AxLmMgYi9saWIvdXRpbHMvcmVzZXQv
ZmR0X3Jlc2V0X3NwYWNlbWl0X3AxLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwLi41MzEyZTc0MQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9saWIvdXRpbHMvcmVzZXQv
ZmR0X3Jlc2V0X3NwYWNlbWl0X3AxLmMKPiBAQCAtMCwwICsxLDExMiBAQAo+ICsvKgo+ICsgKiBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4gKyAqCj4gKyAqIENvcHlyaWdo
dCAoYykgMjAyNiBBdXJlbGllbiBKYXJubwo+ICsgKiBBdXRob3JzOgo+ICsgKiAgIEF1cmVsaWVu
IEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8bGli
ZmR0Lmg+Cj4gKyNpbmNsdWRlIDxwbGF0Zm9ybV9vdmVycmlkZS5oPgo+ICsjaW5jbHVkZSA8c2Jp
L3NiaV9iaXRvcHMuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfY29uc29sZS5oPgo+ICsjaW5jbHVk
ZSA8c2JpL3NiaV9zeXN0ZW0uaD4KPiArI2luY2x1ZGUgPHNiaV91dGlscy9mZHQvZmR0X2RyaXZl
ci5oPgo+ICsjaW5jbHVkZSA8c2JpX3V0aWxzL2kyYy9mZHRfaTJjLmg+Cj4gKwo+ICsvKiBTcGFj
ZW1pVCBQMSBQb3dlciBDb250cm9sIFJlZ2lzdGVyIDIgKi8KPiArI2RlZmluZSBQV1JfQ1RSTDIg
ICAgICAgICAgICAgIDB4N2UKPiArI2RlZmluZSBQV1JfQ1RSTDJfU0hVVERPV04gICAgIEJJVCgy
KSAgLyogU2h1dGRvd24gcmVxdWVzdCAqLwo+ICsjZGVmaW5lIFBXUl9DVFJMMl9SU1QgICAgICAg
ICAgQklUKDEpICAvKiBSZXNldCByZXF1ZXN0ICovCj4gKwo+ICtzdGF0aWMgc3RydWN0IGkyY19h
ZGFwdGVyICpwMV9hZGFwdGVyID0gTlVMTDsKPiArc3RhdGljIHVpbnQzMl90IHAxX3JlZyA9IDA7
Cj4gKwo+ICtzdGF0aWMgaW50IHAxX3N5c3RlbV9yZXNldF9jaGVjayh1aW50MzJfdCB0eXBlLCB1
aW50MzJfdCByZWFzb24pCj4gK3sKPiArICAgICAgIHN3aXRjaCAodHlwZSkgewo+ICsgICAgICAg
Y2FzZSBTQklfU1JTVF9SRVNFVF9UWVBFX1NIVVRET1dOOgo+ICsgICAgICAgICAgICAgICByZXR1
cm4gMTsKPiArICAgICAgIGNhc2UgU0JJX1NSU1RfUkVTRVRfVFlQRV9DT0xEX1JFQk9PVDoKPiAr
ICAgICAgIGNhc2UgU0JJX1NSU1RfUkVTRVRfVFlQRV9XQVJNX1JFQk9PVDoKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIDI1NTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiAr
fQo+ICsKPiArc3RhdGljIHZvaWQgcDFfb3BzKHVpbnQzMl90IHR5cGUpCj4gK3sKPiArICAgICAg
IHVpbnQ4X3QgYnl0ZTsKPiArICAgICAgIGludCByYzsKPiArCj4gKyAgICAgICByYyA9IGkyY19h
ZGFwdGVyX3JlZ19yZWFkKHAxX2FkYXB0ZXIsIHAxX3JlZywgUFdSX0NUUkwyLCAmYnl0ZSk7Cj4g
KyAgICAgICBpZiAocmMpIHsKPiArICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGNhbm5v
dCByZWFkIFAxIFBvd2VyIENvbnRyb2wgUmVnaXN0ZXIgMlxuIiwgX19mdW5jX18pOwo+ICsgICAg
ICAgICAgICAgICByZXR1cm47Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgaWYgKHR5cGUgPT0g
U0JJX1NSU1RfUkVTRVRfVFlQRV9TSFVURE9XTikKPiArICAgICAgICAgICAgICAgYnl0ZSB8PSBQ
V1JfQ1RSTDJfU0hVVERPV047Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIGJ5dGUg
fD0gUFdSX0NUUkwyX1JTVDsKPiArCj4gKyAgICAgICByYyA9IGkyY19hZGFwdGVyX3JlZ193cml0
ZShwMV9hZGFwdGVyLCBwMV9yZWcsIFBXUl9DVFJMMiwgYnl0ZSk7Cj4gKyAgICAgICBpZiAocmMp
Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBjYW5ub3Qgd3JpdGUgUDEgUG93ZXIg
Q29udHJvbCBSZWdpc3RlciAyXG4iLCBfX2Z1bmNfXyk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lk
IHAxX3N5c3RlbV9yZXNldCh1aW50MzJfdCB0eXBlLCB1aW50MzJfdCByZWFzb24pCj4gK3sKPiAr
ICAgICAgIHN3aXRjaCAodHlwZSkgewo+ICsgICAgICAgY2FzZSBTQklfU1JTVF9SRVNFVF9UWVBF
X1NIVVRET1dOOgo+ICsgICAgICAgY2FzZSBTQklfU1JTVF9SRVNFVF9UWVBFX0NPTERfUkVCT09U
Ogo+ICsgICAgICAgY2FzZSBTQklfU1JTVF9SRVNFVF9UWVBFX1dBUk1fUkVCT09UOgo+ICsgICAg
ICAgICAgICAgICBwMV9vcHModHlwZSk7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAg
ICAgfQo+ICt9Cj4gKwo+ICtzdGF0aWMgc3RydWN0IHNiaV9zeXN0ZW1fcmVzZXRfZGV2aWNlIHAx
X3Jlc2V0ID0gewo+ICsgICAgICAgLm5hbWUgPSAic3BhY2VtaXQtcDEtcmVzZXQiLAo+ICsgICAg
ICAgLnN5c3RlbV9yZXNldF9jaGVjayA9IHAxX3N5c3RlbV9yZXNldF9jaGVjaywKPiArICAgICAg
IC5zeXN0ZW1fcmVzZXQgPSBwMV9zeXN0ZW1fcmVzZXQKPiArfTsKPiArCj4gK3N0YXRpYyBpbnQg
cDFfcmVzZXRfaW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXRjaCkKPiArewo+ICsgICAg
ICAgaW50IHJjLCBpMmNfYnVzOwo+ICsgICAgICAgdWludDY0X3QgYWRkcjsKPiArCj4gKyAgICAg
ICAvKiB3ZSBhcmUgc3BhY2VtaXQscDEgbm9kZSAqLwo+ICsgICAgICAgcmMgPSBmZHRfZ2V0X25v
ZGVfYWRkcl9zaXplKGZkdCwgbm9kZW9mZiwgMCwgJmFkZHIsIE5VTEwpOwo+ICsgICAgICAgaWYg
KHJjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgICAgcDFfcmVnID0g
YWRkcjsKPiArCj4gKyAgICAgICAvKiBmaW5kIGkyYyBidXMgcGFyZW50IG5vZGUgKi8KPiArICAg
ICAgIGkyY19idXMgPSBmZHRfcGFyZW50X29mZnNldChmZHQsIG5vZGVvZmYpOwo+ICsgICAgICAg
aWYgKGkyY19idXMgPCAwKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gaTJjX2J1czsKPiArCj4g
KyAgICAgICAvKiBpMmMgYWRhcHRlciBnZXQgKi8KPiArICAgICAgIHJjID0gZmR0X2kyY19hZGFw
dGVyX2dldChmZHQsIGkyY19idXMsICZwMV9hZGFwdGVyKTsKPiArICAgICAgIGlmIChyYykKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICsKPiArICAgICAgIHNiaV9zeXN0ZW1fcmVzZXRf
YWRkX2RldmljZSgmcDFfcmVzZXQpOwo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCBwMV9yZXNldF9tYXRjaFtdID0gewo+ICsg
ICAgICAgeyAuY29tcGF0aWJsZSA9ICJzcGFjZW1pdCxwMSIsIC5kYXRhID0gKHZvaWQgKil0cnVl
IH0sCj4gKyAgICAgICB7IH0sCj4gK307Cj4gKwo+ICtjb25zdCBzdHJ1Y3QgZmR0X2RyaXZlciBm
ZHRfcmVzZXRfc3BhY2VtaXRfcDEgPSB7Cj4gKyAgICAgICAubWF0Y2hfdGFibGUgPSBwMV9yZXNl
dF9tYXRjaCwKPiArICAgICAgIC5pbml0ID0gcDFfcmVzZXRfaW5pdCwKPiArfTsKPiBkaWZmIC0t
Z2l0IGEvbGliL3V0aWxzL3Jlc2V0L29iamVjdHMubWsgYi9saWIvdXRpbHMvcmVzZXQvb2JqZWN0
cy5tawo+IGluZGV4IGFjMzhiNDlkLi4zYzY4MWMyNyAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMv
cmVzZXQvb2JqZWN0cy5tawo+ICsrKyBiL2xpYi91dGlscy9yZXNldC9vYmplY3RzLm1rCj4gQEAg
LTIwLDYgKzIwLDkgQEAgbGlic2JpdXRpbHMtb2Jqcy0kKENPTkZJR19GRFRfUkVTRVRfSFRJRikg
Kz0gcmVzZXQvZmR0X3Jlc2V0X2h0aWYubwo+ICBjYXJyYXktZmR0X2Vhcmx5X2RyaXZlcnMtJChD
T05GSUdfRkRUX1JFU0VUX1NHMjA0Ml9IV01PTl9NQ1UpICs9IGZkdF9yZXNldF9zZzIwNDJfbWN1
Cj4gIGxpYnNiaXV0aWxzLW9ianMtJChDT05GSUdfRkRUX1JFU0VUX1NHMjA0Ml9IV01PTl9NQ1Up
ICs9IHJlc2V0L2ZkdF9yZXNldF9zZzIwNDJfaHdtb25fbWN1Lm8KPgo+ICtjYXJyYXktZmR0X2Vh
cmx5X2RyaXZlcnMtJChDT05GSUdfRkRUX1JFU0VUX1NQQUNFTUlUX1AxKSArPSBmZHRfcmVzZXRf
c3BhY2VtaXRfcDEKPiArbGlic2JpdXRpbHMtb2Jqcy0kKENPTkZJR19GRFRfUkVTRVRfU1BBQ0VN
SVRfUDEpICs9IHJlc2V0L2ZkdF9yZXNldF9zcGFjZW1pdF9wMS5vCj4gKwo+ICBjYXJyYXktZmR0
X2Vhcmx5X2RyaXZlcnMtJChDT05GSUdfRkRUX1JFU0VUX1NVTlhJX1dEVCkgKz0gZmR0X3Jlc2V0
X3N1bnhpX3dkdAo+ICBsaWJzYml1dGlscy1vYmpzLSQoQ09ORklHX0ZEVF9SRVNFVF9TVU5YSV9X
RFQpICs9IHJlc2V0L2ZkdF9yZXNldF9zdW54aV93ZHQubwo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRm
b3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgYi9wbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3Mv
ZGVmY29uZmlnCj4gaW5kZXggYTljYjBmMDYuLmFlMjc4ODU2IDEwMDY0NAo+IC0tLSBhL3BsYXRm
b3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL2Nv
bmZpZ3MvZGVmY29uZmlnCj4gQEAgLTUxLDYgKzUxLDcgQEAgQ09ORklHX0ZEVF9SRVNFVF9HUElP
PXkKPiAgQ09ORklHX0ZEVF9SRVNFVF9IVElGPXkKPiAgQ09ORklHX0ZEVF9SRVNFVF9SUE1JPXkK
PiAgQ09ORklHX0ZEVF9SRVNFVF9TRzIwNDJfSFdNT05fTUNVPXkKPiArQ09ORklHX0ZEVF9SRVNF
VF9TUEFDRU1JVF9QMT15Cj4gIENPTkZJR19GRFRfUkVTRVRfU1VOWElfV0RUPXkKPiAgQ09ORklH
X0ZEVF9SRVNFVF9TWVNDT049eQo+ICBDT05GSUdfRkRUX1NFUklBTD15Cj4gLS0KPiAyLjUzLjAK
Pgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
