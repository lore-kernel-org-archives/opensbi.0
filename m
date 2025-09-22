Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E4BCAC5A7
	for <opensbi@archiver.kernel.org>; Mon, 22 Sep 2025 06:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9guQUbXbLDpB5uFLdYKoA8ZrrQUTHGEN6BZFsXfP2JM=; b=giFnMnuGe7OwON
	bT5thTEjVnCqsOu6YejKNmRs+gVpxQ+3Hw7+VD18bqLwnweDLMvaYAdyd40ADEoxJtfjOi1Va6Ynv
	ryVtyXInRqh8oquTe/zFY8AopHNkiZ9IkXYLNp7Kluy9w3hD/02KG3QuJV+DcTgIU0JZecX+k04cA
	IxwuRuTeSFpWzx1OYPMz6wiqxoDNQ0KY9PkCR6b1Dv1NTPgnbDByIonfewRGi9DuhMJ7Aw9Nw6gyU
	kJWvWDzl1RrRRR19LE0m0/YWXCy/F6n/qkXsRaNxgKFyxeRqxYur0yjzFwUpL6mtQ6rSFcQA+d5/R
	G96IUZHku5WX+HqVwihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zd2-00000008ubW-1YN6;
	Mon, 22 Sep 2025 06:02:24 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Zd0-00000008uaY-1829
	for opensbi@lists.infradead.org;
	Mon, 22 Sep 2025 06:02:23 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-4247cfc66a3so19072885ab.2
        for <opensbi@lists.infradead.org>; Sun, 21 Sep 2025 23:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1758520941; x=1759125741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDafPk83F5UHqvgROfUsBdQ3UjM5D8V0Yvl6sC7Scwc=;
        b=CBKLjLMHS3Jh3U6r6CzzMAxFHipUksbCQrCKLsksKMR/YP2KekEGfEOLiEO4V+HuLG
         e8cwE6YxKSPeTCyNQaxTQZLvp815KBpObNERGwWAKCwblB6d9y84TZEvHELfhoXlFWJh
         AFsEsKYxuY34/6rka4RotLioJzY3RrLn6JOhMF7uPnZQTOUi/q3iQtM6At6MDcyVRwx7
         tdGLoEBgiOO5R1uGYub7xmuG+UPqzG6TK5tvEh89O1fkY6e/zo8X74T8bCdGhhWEDt0G
         uy2zaXUDqbPuf1plRW5zZ/l17z3yFDjk7orHEVPzZxqjckUePldtYqe9HrvtLEU3soao
         Sd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758520941; x=1759125741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDafPk83F5UHqvgROfUsBdQ3UjM5D8V0Yvl6sC7Scwc=;
        b=k/XGSYO4MUQL0cYnr91voKpM1TsLPQtYoSIKzmD0cDMA45GNLtuoAB9sjUb+G9EfmH
         CXsFnzXkgOR8FTyLF5n/FZRruw8QWOsxZGNsWFfwE/uObw0ai70GRO+xa0GC40g1/yzG
         MKZzU4DUdZ8uzwz7ZQ9hSfjpi0Xz8i92xbmS7biofvN1J/a9FIYXahvUlQweHiFu6aRn
         8RfssokVVshcoe+tMDjzhbrGd/CJAHF5lShMMvzFGduwYMILVd/+JB4g4xMJADtXsDdN
         GUxST7fP3dJgL9revvVOZmvsnDmh/P/LxmDxScj0BGgAD4ihQk96t/y2qafX4mtIEZYt
         xRsQ==
X-Gm-Message-State: AOJu0YzSOg4OCw/451wpyZMj6QjQzf6J9cBrt6/kmwd45zPE1hhG/WUG
	xtFD7AjYbgS2AaYtFe7AirNXSTDbDMxVoXwXpq4cnY99m1EPw3NndFI7N+WklTzlfLppZG+OqOK
	0Z4AnTsrcxPmaRjNvKvxogl4vw5uub/y3Ny9nePXjVHMlIhq0kuhM
X-Gm-Gg: ASbGncvuc7cB0RAncrZNczKH/u3LGqz3VtIiuApGMGECmSGk9R5xbaxoeOk9TxEI207
	B8bb5PGxxJSBUDL7uj1vRhXxh6BpgmZ2VL47vqWBhtYlFqMrZ6VgTxJkTgLNQomYwN/JYK1GfXq
	VVb0rqae9khDtq9pIiJzkj5G6Me3NmfMLPWtSCmxpk7OU/0L3+H3eeBe23+Ey2KRYl29pBvfpGy
	XGtvH4ntq7+l1ESikWoJM3DoMtkds2IzOJp7r2L
X-Google-Smtp-Source: AGHT+IEArPMKqxSoclrUvmtFWM43ON/WIb/2Palp8M8xZu2XYiwm+gr/erBSyMnvcjAJ3YHfmKKFqK8k54dBVA3Go78=
X-Received: by 2002:a05:6e02:250f:b0:424:8c15:888a with SMTP id
 e9e14a558f8ab-4248c15aa6emr89769315ab.32.1758520941213; Sun, 21 Sep 2025
 23:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-smt-k1-8-cores-v2-1-dceae56f36d9@linux.spacemit.com>
 <CAAhSdy2x2w0+92W1+L5FPYVpcTypakMjop7YLCADvZyrWKoe4g@mail.gmail.com>
 <869418C0C5B4E860+aNDhto1P8_DVRowH@LT-Guozexi> <CAAhSdy1hdEyhV+paEOx3Y8SYVgpsV0MGCSEBQrVH57=sdV8YBg@mail.gmail.com>
In-Reply-To: <CAAhSdy1hdEyhV+paEOx3Y8SYVgpsV0MGCSEBQrVH57=sdV8YBg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Sep 2025 11:32:09 +0530
X-Gm-Features: AS18NWB09Ou5zfueHw-1WwFAGkwtTzibC9oUGUJ_6n3m5rTdgGpcIF0SmtxaxJI
Message-ID: <CAAhSdy2c9LP5C0B9BEs9-BSR4xDsmjZDLDUdi1Hjf4bWXiXEUQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform: generic: spacemit: add K1
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org, Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_230222_320231_91F55448 
X-CRM114-Status: GOOD (  20.53  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMTE6MzHigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDIyLCAyMDI1IGF0IDExOjEy4oCvQU0g
VHJveSBNaXRjaGVsbAo+IDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4gd3JvdGU6
Cj4gPgo+ID4gT24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgMDg6NTU6MjVBTSArMDUzMCwgQW51cCBQ
YXRlbCB3cm90ZToKPiA+ID4gT24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgNjo0NuKAr0FNIFRyb3kg
TWl0Y2hlbGwKPiA+ID4gPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IEZyb206IFhpYW5iaW4gWmh1IDx4aWFuYmluLnpodUBsaW51eC5zcGFj
ZW1pdC5jb20+Cj4gPiA+ID4KPiA+ID4gPiBFeHRlbmQgZ2VuZXJpYyBwbGF0Zm9ybSB0byBzdXBw
b3J0IFNwYWNlbWlUIEsxLgo+ID4gPiA+Cj4gPiA+ID4gT24gSzEsIHRoZSBCUk9NIG9ubHkgYnJp
bmdzIHVwIHRoZSBwcmltYXJ5IGNvcmUgYW5kIGxlYXZlcyB0aGUKPiA+ID4gPiBvdGhlciBjb3Jl
cyBpbiBhIGRpc2FibGVkIHN0YXRlLiBUaGlzIHByZXZlbnRzIExpbnV4IGZyb20gYm9vdGluZwo+
ID4gPiA+IFNNUCBhbmQgb25seSBvbmUgY29yZSBpcyBhdmFpbGFibGUuCj4gPiA+ID4KPiA+ID4g
PiBBZGQgY29kZSB0byBicmluZyB1cCBhbGwgOCBjb3JlcyBkdXJpbmcgT3BlblNCSSBpbml0aWFs
aXphdGlvbiBzbwo+ID4gPiA+IHRoYXQgdGhlIExpbnV4IGtlcm5lbCBjYW4gZGV0ZWN0IGFuZCB1
c2UgYWxsIGNvcmVzIHByb3Blcmx5Lgo+ID4gPiA+Cj4gPiA+ID4gQ28tYXV0aG9yZWQtYnk6IFRy
b3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0Y2hlbGxAbGludXguc3BhY2VtaXQu
Y29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW5iaW4gWmh1IDx4aWFuYmluLnpodUBsaW51
eC5zcGFjZW1pdC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+ID4g
PiAtIHJlbW92ZSBfX3NiaV9oc21faGFydF9nZXRfc3RhdGUoKSBpbiBzcGFjZW1pdF9jb2xkX2Jv
b3RfYWxsb3dlZCgpCj4gPiA+ID4gLSBwbHVzIFBNVV9BUF9CQVNFIGluIFBNVV9BUF9DT1JFKDB8
NClfKFdBS0VVUHxJRExFKV9PRkZTRVQKPiA+ID4gPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNTA5MTYtc210LWsxLTgtY29yZXMtdjEtMS01Yjc2ZTA2ZDEyZGFA
bGludXguc3BhY2VtaXQuY29tCj4gPiA+Cj4gPiA+IEl0IGlzIGJldHRlciB0byBoYXZlIGEgc2Vw
YXJhdGUgZmR0X2hzbV9zcGFjZW1pdCBkcml2ZXIgdW5kZXIKPiA+ID4gbGliL3V0aWxzL2hzbSBk
aXJlY3RvcnkuCj4gPiBXZSBhcmUgbm90IGdvaW5nIHRvIHN1cHBvcnQgdGhpcyBmZWF0dXJlLgo+
ID4gVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uCj4gPgo+Cj4gSSBkb24ndCB1bmRlcnN0YW5k
Lgo+IFRoaXMgcGF0aCBhbHJlYWR5IHJlZ2lzdGVycyBzYmlfaHNtX2RldmljZSBzbyBhbGwKClR5
cG86IHMvcGF0aC9wYXRjaC8KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
