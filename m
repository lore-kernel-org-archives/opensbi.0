Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81964C7115B
	for <opensbi@archiver.kernel.org>; Tue, 24 Jun 2025 03:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bw5yL8oN3UpJ+NW7fs0FO4HkTFaL9EjrxtbnvNSADuk=; b=IycxRdRx7bcfwg
	9zATtDPBcv9X8CpM2UlG5t+YlkLK2SVNgSnrF0+wM0MrkhIJP2BTeufXckN+VP41xAqVvHG+RIFic
	hMzh5L9YqVwhmruw779VedTbMhX9nOpWdVNmpQmsqoUYE/Efpbw+Ch2as8ztdylj5qnuS0gpPamav
	70vAZMgmzbc/z7HMuEo/3HurfLgbuSANs+fS3u0mLJZEr+V7u/ULb1ePbRMpoWtONPctmDIjZ75oK
	PDdlPnWVu630KB0d+2RbVnHOvXIHGuMt1vt8fhww2UQtil7eqsXbqvhGYZ8v5CzZyzPuy/AiCaa9/
	yDSxnxpf//9L8XEvTm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTu8b-00000004X99-1Ucx;
	Tue, 24 Jun 2025 03:15:57 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTu8Z-00000004X8j-26Bb
	for opensbi@lists.infradead.org;
	Tue, 24 Jun 2025 03:15:56 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3de00ea2a57so47785105ab.1
        for <opensbi@lists.infradead.org>; Mon, 23 Jun 2025 20:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1750734955; x=1751339755; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebdO4M1yp85Vn5SnGC/jFAl5Tkc90be4vrOhC/d04u0=;
        b=cVsnCxSKttN+F2dgGZ0ZZAg3oQ+UF1jU0BK2njOTWqXEuUBNsxg1zvP/0DqH51zCHO
         XMOJ93CEm2aTq1h2G5n1QAm321rV+QFX9mfEDx+7G0ilNBpeMzhTKInkXEDJReDprBkb
         Hd+6hqnJpl9YtqmjZF8P5k7UlvrlsPu+FrGrbAfnhIVdWXntQFsmrH80Y6Dl/ux0cTNC
         eq7X1a5O7MPHoKroBOZcA06zHPyiP5RNHGuvVYoAEn3Egg0cJs0a2imdjM4kexk/KhjI
         0VtZmywqe0qDthmunNb0sWF6KW5PIRswHg2QoDbix9LIHK7rPJBxQhNJAE54y0GMEqc8
         wQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750734955; x=1751339755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebdO4M1yp85Vn5SnGC/jFAl5Tkc90be4vrOhC/d04u0=;
        b=vtxroQvC4lAMrnhF0GDCoHHf3UbCHdqjojzFTdBAziXKInQNsDaH0s3wZsgrQ92pDu
         h28SgGIkY/6L3JrBKgpc4HShusXUaAijIFHBM0rScE7McvIDw8vNQLdRzD57JQOYIEkl
         /a3QhVp5HZmld7y3WINEmmQa47idU3NVtv9jg2LrE0T/GzMKEciAKGhTuU3LdphIIqi/
         5V6MhCv7JqmFT61LqBApd7/M5aA96tkBloJMcOdjGBLeX6kLo0IjyuPbsgOJIAmFf3Er
         ViuOh3btGgJDhuggVKG+lzY0tH5RLqG/wVAIz3haprNltFCsWVst1nbuo5y00iYIhWU3
         JG/Q==
X-Gm-Message-State: AOJu0YyAJdiTvwQcWYTaUeGVpmZPTXpCtih39BSeTAngHKnFDu2wE/sS
	A2n8p0tdW7tYmdQUvkYM6JLLFWiaHtKMzMan1IQRpmIu8bMqMKOAZhbo6+Ur204TMNrHuzKxqYQ
	xcyH192or6J9GdxPKFRaERYL/4hVi6Zv+DqNPINKi341JCUOEM9N32ic=
X-Gm-Gg: ASbGncvBb+S3T6TJNM64qAmjlE6xjoCKzQPh7mCwSKQMOiDASOpEWGUIsapYilaYQzp
	u1MZ0/Kbo1S3riXoBzDCkNJy8287ETo+O16rHIPhVLHQ+qZ+FRnFyizG9ds/VpRAczYPJsS/LTb
	SglYXXbqZ3ke45aH3rvFcIXrn3IDJX6etkXXfhk9bG7PqYkOY7YciHCS3BJoF3/J1htXyUGXr1Y
	A==
X-Google-Smtp-Source: AGHT+IEVUDfAoSkMh1DIVNcsDaM7Lx9k7Vvcz1RQABmru2C2uXx5Jefh22HTY9kCNyqfYVsb92j3gMFnQBg2vHVLlJc=
X-Received: by 2002:a05:6e02:4517:10b0:3df:2a58:3818 with SMTP id
 e9e14a558f8ab-3df2a583f93mr6175615ab.4.1750734954623; Mon, 23 Jun 2025
 20:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250618053854.2577299-1-rpathak@ventanamicro.com> <20250618053854.2577299-2-rpathak@ventanamicro.com>
In-Reply-To: <20250618053854.2577299-2-rpathak@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Jun 2025 08:45:43 +0530
X-Gm-Features: AX0GCFusNEyahaFKqWY25wK2bvE95BhDRnnFCFTziU3m6AAuOB8xSvNggKd5x0A
Message-ID: <CAAhSdy01_uOmaX58XfD++USuzc5rtoo50yiu1BBiXuMtVhoLHw@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib: rpmi: Make RPMI drivers as non-experimental
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_201555_548792_1FC11964 
X-CRM114-Status: GOOD (  15.46  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMTE6MDnigK9BTSBSYWh1bCBQYXRoYWsgPHJwYXRoYWtA
dmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBBcyBSUE1JIHYxLjAgc3BlY2lmaWNhdGlvbiBp
cyBmcm96ZW4sIGRpc2FibGUgdGhlCj4gZXhwZXJpbWVudGFsIHRhZyBmb3Igc3VjaCBSUE1JIGRy
aXZlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBQYXRoYWsgPHJwYXRoYWtAdmVudGFuYW1p
Y3JvLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhh
bmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvdXRpbHMvY3BwYy9mZHRfY3BwY19ycG1pLmMgICAgICAg
ICAgICAgfCAxIC0KPiAgbGliL3V0aWxzL2hzbS9mZHRfaHNtX3JwbWkuYyAgICAgICAgICAgICAg
IHwgMSAtCj4gIGxpYi91dGlscy9tYWlsYm94L2ZkdF9tYWlsYm94X3JwbWlfc2htZW0uYyB8IDEg
LQo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2Nsb2NrLmMgICAgICAgfCAxIC0KPiAg
bGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9zeXNtc2kuYyAgICAgIHwgMSAtCj4gIGxpYi91
dGlscy9yZXNldC9mZHRfcmVzZXRfcnBtaS5jICAgICAgICAgICB8IDEgLQo+ICBsaWIvdXRpbHMv
c3VzcGVuZC9mZHRfc3VzcGVuZF9ycG1pLmMgICAgICAgfCAxIC0KPiAgNyBmaWxlcyBjaGFuZ2Vk
LCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9jcHBjL2ZkdF9jcHBj
X3JwbWkuYyBiL2xpYi91dGlscy9jcHBjL2ZkdF9jcHBjX3JwbWkuYwo+IGluZGV4IGVmY2VhNjUy
ZjFkNi4uN2JkM2IwZjkwZDZhIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9jcHBjL2ZkdF9jcHBj
X3JwbWkuYwo+ICsrKyBiL2xpYi91dGlscy9jcHBjL2ZkdF9jcHBjX3JwbWkuYwo+IEBAIC0zNzAs
NSArMzcwLDQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggcnBtaV9jcHBjX21hdGNo
W10gPSB7Cj4gIGNvbnN0IHN0cnVjdCBmZHRfZHJpdmVyIGZkdF9jcHBjX3JwbWkgPSB7Cj4gICAg
ICAgICAubWF0Y2hfdGFibGUgPSBycG1pX2NwcGNfbWF0Y2gsCj4gICAgICAgICAuaW5pdCA9IHJw
bWlfY3BwY19jb2xkX2luaXQsCj4gLSAgICAgICAuZXhwZXJpbWVudGFsID0gdHJ1ZSwKPiAgfTsK
PiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL2hzbS9mZHRfaHNtX3JwbWkuYyBiL2xpYi91dGlscy9o
c20vZmR0X2hzbV9ycG1pLmMKPiBpbmRleCBjYzc4NDM2ZjlhNGEuLjA2ZTRiMTc5NzZhYSAxMDA2
NDQKPiAtLS0gYS9saWIvdXRpbHMvaHNtL2ZkdF9oc21fcnBtaS5jCj4gKysrIGIvbGliL3V0aWxz
L2hzbS9mZHRfaHNtX3JwbWkuYwo+IEBAIC0zNTksNSArMzU5LDQgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBmZHRfbWF0Y2ggcnBtaV9oc21fbWF0Y2hbXSA9IHsKPiAgY29uc3Qgc3RydWN0IGZkdF9k
cml2ZXIgZmR0X2hzbV9ycG1pID0gewo+ICAgICAgICAgLm1hdGNoX3RhYmxlID0gcnBtaV9oc21f
bWF0Y2gsCj4gICAgICAgICAuaW5pdCA9IHJwbWlfaHNtX2NvbGRfaW5pdCwKPiAtICAgICAgIC5l
eHBlcmltZW50YWwgPSB0cnVlLAo+ICB9Owo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvbWFpbGJv
eC9mZHRfbWFpbGJveF9ycG1pX3NobWVtLmMgYi9saWIvdXRpbHMvbWFpbGJveC9mZHRfbWFpbGJv
eF9ycG1pX3NobWVtLmMKPiBpbmRleCBmZGIwNDkxNWJhNzAuLjUyMWUwNjczNTg3MyAxMDA2NDQK
PiAtLS0gYS9saWIvdXRpbHMvbWFpbGJveC9mZHRfbWFpbGJveF9ycG1pX3NobWVtLmMKPiArKysg
Yi9saWIvdXRpbHMvbWFpbGJveC9mZHRfbWFpbGJveF9ycG1pX3NobWVtLmMKPiBAQCAtODE5LDcg
KzgxOSw2IEBAIHN0cnVjdCBmZHRfbWFpbGJveCBmZHRfbWFpbGJveF9ycG1pX3NobWVtID0gewo+
ICAgICAgICAgLmRyaXZlciA9IHsKPiAgICAgICAgICAgICAgICAgLm1hdGNoX3RhYmxlID0gcnBt
aV9zaG1lbV9tYm94X21hdGNoLAo+ICAgICAgICAgICAgICAgICAuaW5pdCA9IHJwbWlfc2htZW1f
bWJveF9pbml0LAo+IC0gICAgICAgICAgICAgICAuZXhwZXJpbWVudGFsID0gdHJ1ZSwKPiAgICAg
ICAgIH0sCj4gICAgICAgICAueGxhdGUgPSBmZHRfbWFpbGJveF9zaW1wbGVfeGxhdGUsCj4gIH07
Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfY2xvY2suYyBiL2xp
Yi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfY2xvY2suYwo+IGluZGV4IDdkMmI0YTIwYzkzNC4u
NTg1YzJiZjM0OGQ1IDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlf
Y2xvY2suYwo+ICsrKyBiL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfY2xvY2suYwo+IEBA
IC04Myw1ICs4Myw0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoIGNsb2NrX21hdGNo
W10gPSB7Cj4gIGNvbnN0IHN0cnVjdCBmZHRfZHJpdmVyIGZkdF9tcHh5X3JwbWlfY2xvY2sgPSB7
Cj4gICAgICAgICAubWF0Y2hfdGFibGUgPSBjbG9ja19tYXRjaCwKPiAgICAgICAgIC5pbml0ID0g
bXB4eV9ycG1pX21ib3hfaW5pdCwKPiAtICAgICAgIC5leHBlcmltZW50YWwgPSB0cnVlLAo+ICB9
Owo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3N5c21zaS5jIGIv
bGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9zeXNtc2kuYwo+IGluZGV4IGI0YmFiODVhZWI5
NS4uOTRhNWFmOGNmMDRkIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3Jw
bWlfc3lzbXNpLmMKPiArKysgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3N5c21zaS5j
Cj4gQEAgLTIwNSw1ICsyMDUsNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCBzeXNt
c2lfbWF0Y2hbXSA9IHsKPiAgY29uc3Qgc3RydWN0IGZkdF9kcml2ZXIgZmR0X21weHlfcnBtaV9z
eXNtc2kgPSB7Cj4gICAgICAgICAubWF0Y2hfdGFibGUgPSBzeXNtc2lfbWF0Y2gsCj4gICAgICAg
ICAuaW5pdCA9IG1weHlfcnBtaV9tYm94X2luaXQsCj4gLSAgICAgICAuZXhwZXJpbWVudGFsID0g
dHJ1ZSwKPiAgfTsKPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9ycG1p
LmMgYi9saWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X3JwbWkuYwo+IGluZGV4IDgxYjIxZDBmNWRk
OS4uZWRjNTM5MzJjY2MwIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9yZXNldC9mZHRfcmVzZXRf
cnBtaS5jCj4gKysrIGIvbGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9ycG1pLmMKPiBAQCAtMTM4
LDUgKzEzOCw0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoIHJwbWlfcmVzZXRfbWF0
Y2hbXSA9IHsKPiAgY29uc3Qgc3RydWN0IGZkdF9kcml2ZXIgZmR0X3Jlc2V0X3JwbWkgPSB7Cj4g
ICAgICAgICAubWF0Y2hfdGFibGUgPSBycG1pX3Jlc2V0X21hdGNoLAo+ICAgICAgICAgLmluaXQg
PSBycG1pX3Jlc2V0X2luaXQsCj4gLSAgICAgICAuZXhwZXJpbWVudGFsID0gdHJ1ZSwKPiAgfTsK
PiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3N1c3BlbmQvZmR0X3N1c3BlbmRfcnBtaS5jIGIvbGli
L3V0aWxzL3N1c3BlbmQvZmR0X3N1c3BlbmRfcnBtaS5jCj4gaW5kZXggZjliYWEyM2M5MTY4Li4w
NTVhYjJmZjhiYjIgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL3N1c3BlbmQvZmR0X3N1c3BlbmRf
cnBtaS5jCj4gKysrIGIvbGliL3V0aWxzL3N1c3BlbmQvZmR0X3N1c3BlbmRfcnBtaS5jCj4gQEAg
LTEzNSw1ICsxMzUsNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCBycG1pX3N1c3Bl
bmRfbWF0Y2hbXSA9IHsKPiAgY29uc3Qgc3RydWN0IGZkdF9kcml2ZXIgZmR0X3N1c3BlbmRfcnBt
aSA9IHsKPiAgICAgICAgIC5tYXRjaF90YWJsZSA9IHJwbWlfc3VzcGVuZF9tYXRjaCwKPiAgICAg
ICAgIC5pbml0ID0gcnBtaV9zdXNwZW5kX2luaXQsCj4gLSAgICAgICAuZXhwZXJpbWVudGFsID0g
dHJ1ZSwKPiAgfTsKPiAtLQo+IDIuNDguMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0
Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
