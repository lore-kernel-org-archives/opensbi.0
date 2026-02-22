Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7238C636A0
	for <opensbi@archiver.kernel.org>; Sun, 22 Feb 2026 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RE6EDhf2DGutreGZyubDC1XXNvERmI6Qfu/2rmA76js=; b=h+9IYq6eANRETW
	2ew0ezaZ+p9dQ0YNRH44lIBdHinomfbJ5PJKehWzAu87Tblm+jKBtVFUMDV5lXHuoAZOOmS9H5PMn
	g2qbnBs+cNjDQc0wmiujYsrc62mNp88hybZlkAX1eQLZERnvQ1TZz/pGGjHigc9mAEBObmeYA/odb
	hYuU7i4+Gx6Yz6VAbfwozH63zY2rjAXS5q8qjlSG0YOVh+8YwEPfjbJ87+PtgooPGtEnjWqcsb+ZH
	8twBfBJE7Zj2NMULwVn+72FqgX7ZA1JzxgOzWNPnT8ZKRPGQ5A5NefB4farIKDo8r+DiBUUUdxiM2
	cMxW4XTWNDEnR/Z7Q/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuBOc-0000000Gmc2-1aid;
	Sun, 22 Feb 2026 15:29:22 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuBOZ-0000000Gmb3-2ku8
	for opensbi@lists.infradead.org;
	Sun, 22 Feb 2026 15:29:21 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-4042905015cso2444344fac.0
        for <opensbi@lists.infradead.org>; Sun, 22 Feb 2026 07:29:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771774157; cv=none;
        d=google.com; s=arc-20240605;
        b=hS72OhiT6Ok1GJVJB3198l1YmO5Lc+hXYdfgD+jitOUdCnX7FgXsktAxHQrUh3rChC
         xhLJxkKUFQja5gYFJbuX6LYx0ylsNT4m/ZrMkSSUHciV4pvUtdK4uArLRGOL8Qv7iN6O
         lwLzgp7P6nzLKLK4JJzb5qEsDGiJ0VJ8SIlLAGiS/ejgWpoDbESvbsXGoYklN1xriNpY
         htuA6vz6VGXK0MO+GpZBRYYF8O5B3wIHKbvZB5n4cgbX7h3B9sPFSq6Ra99Ptp/swNR4
         zsjNME3A5BOyhCj7hHuSwYM196t/o0byx/60+mKVLRXUtc9Pb0073d9hne3sgHru9zuc
         omdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFhV/+I72QRfgQ2zyLW9HvG7M4rNiLQD0sk1PGyNt6M=;
        fh=XD63iv7DFU39kOL15bMG+F36rmI4VTIAXAjvAph5cFo=;
        b=a6jOm5QptE78mhHarUd7izru6vdshS/IiltExOb7FOh3XaOUD8b6G94p7mQs7nbWls
         R6xdar1XKPh6j8wMbMG48D1mqn6RElUfZavIcKVlSr28myN7IkChlbLXLGC18pcc5fy5
         FEIvtRj0htlA1mAxJ64v6wEA/9G9vqpB3j+FSyRBbqDgdXbGU8uGgDCgaN89OlMzpLrI
         gQiEHTFzfY4lItLGTmFC0hn8R/vvVsqI5PP46UIcK0zvPbmVOvEdd9rGJ7j4Py6rvGNT
         /pLa+1ciNa4AbJ360Vxqu+c0azZuPBavI8LVjMMvOG0VwkK5dfyQb64t9W9e7F1WhRBL
         cvVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1771774157; x=1772378957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFhV/+I72QRfgQ2zyLW9HvG7M4rNiLQD0sk1PGyNt6M=;
        b=Jvs6pH41lbxrLk/i9QT6M/yZuOafLcP0luaAiQN3m5IMK+gl6cX83nvaFOu/lsEfvh
         5xyjcU9Nd/4Opjyh2Lx49WXnZB0I6smcw2Euq9OxIuCHVTzIpVpYRnyarz+zJzjulfgd
         lqTVhykX9mhvAmK3jzUnuA8aa74Ql0NZdkC5lEGcWGHV3r6uHUnHlm7y0ndU+dSZlLwl
         ckkr6q/canyOvxlon+VLwYTgVk1hcZiTGJppJaotmKKVGqFFOJX0aNZnG9QcI9p6EdHU
         jOOSu8p3eIR56BmhlXetj0HdZm2StZFjRY85MS62cJfAmKbXAnwfOwUkp2aPC74edI+L
         7M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771774157; x=1772378957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xFhV/+I72QRfgQ2zyLW9HvG7M4rNiLQD0sk1PGyNt6M=;
        b=wes+DDOhtRO0gsdCcpPylORYIB8ZTgj4BqRKk/TmUjP4m+PWe52S885Z6H97vxByQE
         NDRYPQpcEE/CHmj5Lj9b9lOgBfcMQDNcdOoK0CHsVIf0QO/Pf1CPvAaoA1463CaBgTqF
         vlKEtEzK5m+xP6lfvbRJHpkahUKQY6KKfbkHr07VYmgbzBLlhTKP0bNx4gLGeYmMjsQY
         uBLLFhwlCQ48dOmu1n3oNn//qMWEfNiETHNXw4AS6ayaVLCQ9I/GP1+jRtFe9CeeuaR1
         ofqz13DMloH99jI9E53bYBPi0niSeHmF+CEWe22Pe0EUS6xg34+LagcDl19OA9JPiUSi
         NB3A==
X-Gm-Message-State: AOJu0YyaZN0M5Zn0TwMj5q+0ijCeFAwxblhcX03yftTRYsmp/zAc153s
	F0/WEIfbklD2chw+M5ba29kh4fZtlNGs357xgImmc48HQAPBJgRrpzoOci0+5v8KytVW3pKH/48
	wOrmYS1EgWY5oezk0FCXM0Mja6u7a4ApzqlduMCMDTQ==
X-Gm-Gg: AZuq6aJ5lGxPnf4VqSktaVAtu7xcF8xD85nVKiYGc7VlixyKnxTLVAZaGT/XIVcvcD5
	0IoIEyc4oYHS7xa2SGuZslknPzBahQ7eefZXRrc4prYMEoIqSFObC3McMZeRqEKoYxNUo+zwz9x
	uClH4YIOYWWRNdA4TN5bIduJxD54gf4p4e2SaY5fWNHb8o8hJq82qOdIa4V9JwaieXP2FoA3TMC
	JzwA6csotg4PfrsQZ/iEU8YtH03WxGZ6S3yCN1Cc6Lb3FM8TsqjdYo0YKYzZY7Xh+/tXswr2sbM
	KPo3+XHA0qiv3qswLFAXjImfDTOq1aC/jemb/P82ssYWkp+C2MOdvNSdy9rU8Z5lw4nS0imLCC6
	9Pvq3TATVa86U6RwsZlFfQPCp4w==
X-Received: by 2002:a05:6820:f032:b0:65f:6aa6:fc36 with SMTP id
 006d021491bc7-679c4257ccdmr4148001eaf.10.1771774157455; Sun, 22 Feb 2026
 07:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20260125090643.190748-1-jamestiotio@gmail.com>
In-Reply-To: <20260125090643.190748-1-jamestiotio@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 22 Feb 2026 20:59:06 +0530
X-Gm-Features: AaiRm53XR3a67IxSPwSYTadqJ8iyVBzymS3irq1amCOG9hGC6OZtOkIZ3nbOlB0
Message-ID: <CAAhSdy2_yBvLPy6rgTJfK1vURmrAr4er4Cpbp-s9gnJXOVMFQg@mail.gmail.com>
Subject: Re: [PATCH v2] lib: sbi_pmu: Add FW counter index validation when
 reading high bits on RV64
To: James Raphael Tiovalen <jamestiotio@gmail.com>
Cc: opensbi@lists.infradead.org, andrew.jones@linux.dev, atishp@rivosinc.com, 
	radim.krcmar@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_072919_978362_410946E2 
X-CRM114-Status: GOOD (  22.03  )
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

T24gU3VuLCBKYW4gMjUsIDIwMjYgYXQgMjozNuKAr1BNIEphbWVzIFJhcGhhZWwgVGlvdmFsZW4K
PGphbWVzdGlvdGlvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIHdoZW4gd2UgYXR0
ZW1wdCB0byByZWFkIHRoZSB1cHBlciAzMiBiaXRzIG9mIGEgZmlybXdhcmUKPiBjb3VudGVyIG9u
IFJWNjQgb3IgaGlnaGVyLCB3ZSBqdXN0IHNldCBgc2JpcmV0LnZhbHVlYCB0byAwIHdpdGhvdXQK
PiB2YWxpZGF0aW5nIHRoZSBjb3VudGVyIGluZGV4LiBUaGUgU0JJIHNwZWNpZmljYXRpb24gcmVx
dWlyZXMgdXMgdG8gc2V0Cj4gYHNiaXJldC5lcnJvcmAgdG8gYFNCSV9FUlJfSU5WQUxJRF9QQVJB
TWAgaWYgdGhlIGNvdW50ZXIgaW5kZXggcG9pbnRzIHRvCj4gYSBoYXJkd2FyZSBjb3VudGVyIG9y
IGFuIGludmFsaWQgY291bnRlci4gQWRkIGEgdmFsaWRhdGlvbiBjaGVjayB0bwo+IGVuc3VyZSBj
b21wbGlhbmNlIHdpdGggdGhlIHNwZWNpZmljYXRpb24gb24gUlY2NCBvciBoaWdoZXIuCj4KPiBG
aXhlczogNTE5NTFkOWU5YWY4ICgibGliOiBzYmlfcG11OiBJbXBsZW1lbnQgc2JpX3BtdV9jb3Vu
dGVyX2Z3X3JlYWRfaGkiKQo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIFJhcGhhZWwgVGlvdmFsZW4g
PGphbWVzdGlvdGlvQGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3Bl
bnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiB2MSAtPiB2MjoKPiAgIC0gSW1wbGVt
ZW50ZWQgUmFkaW0ncyBzdWdnZXN0aW9uIHRvIHJlZmFjdG9yIGBzYmlfcG11X2N0cl9md19yZWFk
KClgCj4gICAgIGluc3RlYWQgb2YgYWRkaW5nIGEgbmV3IGZ1bmN0aW9uLgo+ICAgLSBVcGRhdGVk
IHRoZSB0eXBlIG9mIGBjaWR4YCBpbiB0aGUgZnVuY3Rpb24gc2lnbmF0dXJlIG9mCj4gICAgIGBz
YmlfcG11X2N0cl9md19yZWFkKClgLgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfcG11LmggICB8
ICAyICstCj4gIGxpYi9zYmkvc2JpX2VjYWxsX3BtdS5jIHwgIDQgKystLQo+ICBsaWIvc2JpL3Ni
aV9wbXUuYyAgICAgICB8IDEwICsrKysrKysrKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Ni
aV9wbXUuaCBiL2luY2x1ZGUvc2JpL3NiaV9wbXUuaAo+IGluZGV4IGMwZTI1ZjVhLi4zZmZmNDYy
NyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfcG11LmgKPiArKysgYi9pbmNsdWRlL3Ni
aS9zYmlfcG11LmgKPiBAQCAtMTM2LDcgKzEzNiw3IEBAIGludCBzYmlfcG11X2FkZF9od19ldmVu
dF9jb3VudGVyX21hcCh1MzIgZWlkeF9zdGFydCwgdTMyIGVpZHhfZW5kLCB1MzIgY21hcCk7Cj4K
PiAgaW50IHNiaV9wbXVfYWRkX3Jhd19ldmVudF9jb3VudGVyX21hcCh1aW50NjRfdCBzZWxlY3Qs
IHVpbnQ2NF90IHNlbGVjdF9tYXNrLCB1MzIgY21hcCk7Cj4KPiAtaW50IHNiaV9wbXVfY3RyX2Z3
X3JlYWQodWludDMyX3QgY2lkeCwgdWludDY0X3QgKmN2YWwpOwo+ICtpbnQgc2JpX3BtdV9jdHJf
ZndfcmVhZCh1bnNpZ25lZCBsb25nIGNpZHgsIHVpbnQ2NF90ICpjdmFsLCBib29sIGhpZ2hfYml0
cyk7Cj4KPiAgaW50IHNiaV9wbXVfY3RyX3N0b3AodW5zaWduZWQgbG9uZyBjaWR4X2Jhc2UsIHVu
c2lnbmVkIGxvbmcgY2lkeF9tYXNrLAo+ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgZmxhZyk7Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2VjYWxsX3BtdS5jIGIvbGliL3Ni
aS9zYmlfZWNhbGxfcG11LmMKPiBpbmRleCA4NjhlODY2NS4uNDFiYjE2MjQgMTAwNjQ0Cj4gLS0t
IGEvbGliL3NiaS9zYmlfZWNhbGxfcG11LmMKPiArKysgYi9saWIvc2JpL3NiaV9lY2FsbF9wbXUu
Ywo+IEBAIC01MCwxMiArNTAsMTIgQEAgc3RhdGljIGludCBzYmlfZWNhbGxfcG11X2hhbmRsZXIo
dW5zaWduZWQgbG9uZyBleHRpZCwgdW5zaWduZWQgbG9uZyBmdW5jaWQsCj4KPiAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIFNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRDoK
PiAtICAgICAgICAgICAgICAgcmV0ID0gc2JpX3BtdV9jdHJfZndfcmVhZChyZWdzLT5hMCwgJnRl
bXApOwo+ICsgICAgICAgICAgICAgICByZXQgPSBzYmlfcG11X2N0cl9md19yZWFkKHJlZ3MtPmEw
LCAmdGVtcCwgZmFsc2UpOwo+ICAgICAgICAgICAgICAgICBvdXQtPnZhbHVlID0gdGVtcDsKPiAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIFNCSV9FWFRfUE1VX0NPVU5URVJf
RldfUkVBRF9ISToKPiArICAgICAgICAgICAgICAgcmV0ID0gc2JpX3BtdV9jdHJfZndfcmVhZChy
ZWdzLT5hMCwgJnRlbXAsIHRydWUpOwo+ICAjaWYgX19yaXNjdl94bGVuID09IDMyCj4gLSAgICAg
ICAgICAgICAgIHJldCA9IHNiaV9wbXVfY3RyX2Z3X3JlYWQocmVncy0+YTAsICZ0ZW1wKTsKPiAg
ICAgICAgICAgICAgICAgb3V0LT52YWx1ZSA9IHRlbXAgPj4gMzI7Cj4gICNlbHNlCj4gICAgICAg
ICAgICAgICAgIG91dC0+dmFsdWUgPSAwOwo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9wbXUu
YyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4gaW5kZXggZTA4NDAwNWQuLmEzMTA1NTNlIDEwMDY0NAo+
IC0tLSBhL2xpYi9zYmkvc2JpX3BtdS5jCj4gKysrIGIvbGliL3NiaS9zYmlfcG11LmMKPiBAQCAt
MjI3LDcgKzIyNyw3IEBAIHN0YXRpYyBib29sIHBtdV9jdHJfaWR4X3ZhbGlkYXRlKHVuc2lnbmVk
IGxvbmcgY2Jhc2UsIHVuc2lnbmVkIGxvbmcgY21hc2spCj4gICAgICAgICByZXR1cm4gY21hc2sg
JiYgY2Jhc2UgKyBzYmlfZmxzKGNtYXNrKSA8IHRvdGFsX2N0cnM7Cj4gIH0KPgo+IC1pbnQgc2Jp
X3BtdV9jdHJfZndfcmVhZCh1aW50MzJfdCBjaWR4LCB1aW50NjRfdCAqY3ZhbCkKPiAraW50IHNi
aV9wbXVfY3RyX2Z3X3JlYWQodW5zaWduZWQgbG9uZyBjaWR4LCB1aW50NjRfdCAqY3ZhbCwgYm9v
bCBoaWdoX2JpdHMpCj4gIHsKPiAgICAgICAgIGludCBldmVudF9pZHhfdHlwZTsKPiAgICAgICAg
IHVpbnQzMl90IGV2ZW50X2NvZGU7Cj4gQEAgLTIzNiw2ICsyMzYsMTQgQEAgaW50IHNiaV9wbXVf
Y3RyX2Z3X3JlYWQodWludDMyX3QgY2lkeCwgdWludDY0X3QgKmN2YWwpCj4gICAgICAgICBpZiAo
dW5saWtlbHkoIXBocykpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+Cj4g
KyAgICAgICBpZiAoY2lkeCA8IG51bV9od19jdHJzIHx8IGNpZHggPj0gdG90YWxfY3RycykKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKwo+ICsjaWYgX19yaXNjdl94bGVu
ID4gMzIKPiArICAgICAgIGlmIChoaWdoX2JpdHMpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAw
Owo+ICsjZW5kaWYKPiArCj4gICAgICAgICBldmVudF9pZHhfdHlwZSA9IHBtdV9jdHJfdmFsaWRh
dGUocGhzLCBjaWR4LCAmZXZlbnRfY29kZSk7Cj4gICAgICAgICBpZiAoZXZlbnRfaWR4X3R5cGUg
IT0gU0JJX1BNVV9FVkVOVF9UWVBFX0ZXKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJ
TlZBTDsKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
