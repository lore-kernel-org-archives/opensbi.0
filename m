Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78710CCD1BF
	for <opensbi@archiver.kernel.org>; Tue, 28 Oct 2025 05:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBHEpYJDOJrGmEIvEOP5FqQEmwGCKwUvFilNa+zzhYg=; b=I73HNdK9ACqIbn
	JsmZ1gHtBwxTk7muaCQd96n64Z/4palivYA0+2KLmoWkKOkrBIqRsSdb5JQi76LijF/MTG2g6fpQP
	Lv4gGkbuBVzGSu886gLmuuF0VbX5f4luNWjByoYhFr5PFzeHCHyby5V5tBQc2OgvpMbtRBnsPR/N4
	dGEIyEtQ/85dAIsM5FDhHjlI1bfVlCTTT0+J3aodXRQP6h7+gLqnTer401v6mRWxKSsnG4p2Z4wcK
	hnWEmzkb7eP4iAV/IQmZKLPq6Dcpw7w1QiDB3IEvI4pj9miCcHixUnW1W9pFwXfzmdQtJxxpZBEOS
	zjEdKDRXJP7qWKwY35hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcfc-0000000FIWi-1w6A;
	Tue, 28 Oct 2025 05:55:00 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcfZ-0000000FIWJ-1uk4
	for opensbi@lists.infradead.org;
	Tue, 28 Oct 2025 05:54:58 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-945a5731dd3so91907239f.0
        for <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 22:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761630896; x=1762235696; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3aaEIMF/1MtVkEI4CGcoZryKsqSgdrciT2VqhiS9M8=;
        b=f8VOKTeNOZrrASQHgUxn8cqPzQ+qH6HcxiusM6Wngox+kTWz6xDBeuHhz7FqmMrK6u
         NYscasO+S3UKLcN5kD+i8xw8zPX4kYjr8w9dqaxACfOObNMVtkBT4kjPXqjk4QFCcbVS
         ExlbPK+6J6X6hOCtbjopHmvov29bcKe1DjuCzi6buz6Yo/861YBjLUEP75F4bWNIZ+7v
         5V/cn5N1HUyKgbZn1SoKguyRcnmuoTCJNmc+vH0kCuR2M+aszEhwyC+SE+O9Y9bW0/8P
         YpBZBP8Oe/uNevYha15NupC91gasrQgrkWjOs95Oj0ZE9VelhC3+4WF9NC/+RTjb6kZY
         xcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761630896; x=1762235696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3aaEIMF/1MtVkEI4CGcoZryKsqSgdrciT2VqhiS9M8=;
        b=MURaDU1yyPjh39nbchOEDZ+MqVDUQhEAfIbdX2lu5EjFuO2cqRzzQp45Sx2zO0intI
         PJKg1oCfce29cGpR1F7S4oRMaF5yDWOz50TifUi3WY82cYdoNWcY3g6FXFYweBrg+8SP
         ZXlTBG7pZhutF1zsCxaLT/u0Ts432nWIKuC/WMtWF52/wQOKm4xCCoZksNMMsc2uKLBd
         uURQVMWtaN4vRf4yjkczgU3PSf4xk/05LQqOLg3rQuWh4Lyi/PdcGSc4M4VWXK9kkQiJ
         Wj+OJ8skD9nw0CB/AkqjfEFLbu2+h6cUIUB46CH7FR9gCAQQqDuiDQGGdDOR3ro3UcqX
         rDbw==
X-Gm-Message-State: AOJu0YzYtHGE4J1alVZhSe+hWkteKxjU5Zvy6u+Ge1kC5aLUuY+6lg0I
	l0CKEtf/N5oUP/OXoPqK9u017pyvS6GZgApuzfixI1OlClZvh8EL85fcSiEeq/bTLs57g2QzglD
	iWOSI4jq3d74qy7h/DxLHDPti6fpUQ1SFYHET1dhy0fVec0/6lntbNu7Fjg==
X-Gm-Gg: ASbGncsbq+WhoGSM7I6m2b2TQ+Z5W9eBGlgdUwyBHbOeeKN5N8h9YwUym+lFnz2u45M
	ykzn5QCsEuHpWmhUmnx5epUuIk6dmD0NN+bzF1x5/7JNHfVVWbbt9ygujg9KQQfzeW5sBGsvg7P
	e+AqRrXV5NzJjml1XEhXJBaEN4Ujs8TCVWPQFjwIB0QFqUHXB5vCzUzzXf+6mATVs0Cqszjl1BW
	QksIa2iHY+1QQDSGiUmPgSywyX2cNR3e+LIbIsUvz74r83ikN11Ni3z81GhCmJqxBcq+Kb1vJi3
	0uVm45EPUDiR6kYGww==
X-Google-Smtp-Source: AGHT+IGVM9UnFXLCb4+gBg+6inJhynpXZtFrob/eJdDdanbYL6FowXqIvy4OjGPoqWIG8q2ldWHaY/QUI0ANx/T+uWk=
X-Received: by 2002:a05:6e02:3082:b0:431:d73b:ea91 with SMTP id
 e9e14a558f8ab-4320f6860bdmr38782745ab.0.1761630896171; Mon, 27 Oct 2025
 22:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com> <20251020-cache-upstream-v7-4-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-4-69a132447d8a@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Oct 2025 11:24:45 +0530
X-Gm-Features: AWmQ_bmdkw3xd01YbNy4zcNhfG4RY7TuteoDq4mkaRpIn0cdqjC0pSiEXCZkOI0
Message-ID: <CAAhSdy12vzd-NoKXa2s+xkArdSbmorJJ4gmPGX9yzm6efnX49w@mail.gmail.com>
Subject: Re: [PATCH v7 04/12] lib: utils/cache: Add fdt cmo helpers
To: Nick Hu <nick.hu@sifive.com>
Cc: opensbi@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_225457_504692_0A607637 
X-CRM114-Status: GOOD (  23.69  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTE6NTbigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHRoZSBoZWxwZXJzIHRvIGJ1aWxkIHVwIHRoZSBjYWNoZSBo
aWVyYXJjaHkgdmlhIEZEVCBhbmQgcHJvdmlkZSBzb21lCj4gY21vIGZ1bmN0aW9ucyBmb3IgdGhl
IHVzZXIgd2hvIHdhbnQgdG8gZmx1c2ggdGhlIGVudGlyZSBjYWNoZS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1ieTogU2FtdWVsIEhv
bGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0
ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpX3V0aWxzL2NhY2hl
L2ZkdF9jbW9faGVscGVyLmggfCAgNDAgKysrKysrKysrKysKPiAgbGliL3V0aWxzL2NhY2hlL2Zk
dF9jbW9faGVscGVyLmMgICAgICAgICB8IDExMiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gIGxpYi91dGlscy9jYWNoZS9vYmplY3RzLm1rICAgICAgICAgICAgICAgfCAgIDEgKwo+
ICBwbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgICAgICAgICAgICAgIHwgICAzICstCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgMTU1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3NiaV91dGlscy9jYWNoZS9mZHRfY21vX2hlbHBlci5oIGIvaW5jbHVk
ZS9zYmlfdXRpbHMvY2FjaGUvZmR0X2Ntb19oZWxwZXIuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uYTZhMjhk
YjllZGUyNzIyZDgyNjFkMmUwNzdlZWI3NzEwY2ZmMDg5Mwo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9pbmNsdWRlL3NiaV91dGlscy9jYWNoZS9mZHRfY21vX2hlbHBlci5oCj4gQEAgLTAsMCArMSw0
MCBAQAo+ICsvKgo+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4g
KyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAyNSBTaUZpdmUgSW5jLgo+ICsgKi8KPiArCj4gKyNp
Zm5kZWYgX19GRFRfQ01PX0hFTFBFUl9IX18KPiArI2RlZmluZSBfX0ZEVF9DTU9fSEVMUEVSX0hf
Xwo+ICsKPiArI2lmZGVmIENPTkZJR19GRFRfQ0FDSEUKPiArLyoqCj4gKyAqIEZsdXNoIHRoZSBw
cml2YXRlIGZpcnN0IGxldmVsIGNhY2hlIG9mIHRoZSBjdXJyZW50IGhhcnQKPiArICoKPiArICog
QHJldHVybiAwIG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJl
Cj4gKyAqLwo+ICtpbnQgZmR0X2Ntb19wcml2YXRlX2ZsY19mbHVzaF9hbGwodm9pZCk7Cj4gKwo+
ICsvKioKPiArICogRmx1c2ggdGhlIGxhc3QgbGV2ZWwgY2FjaGUgb2YgdGhlIGN1cnJlbnQgaGFy
dAo+ICsgKgo+ICsgKiBAcmV0dXJuIDAgb24gc3VjY2Vzcywgb3IgYSBuZWdhdGl2ZSBlcnJvciBj
b2RlIG9uIGZhaWx1cmUKPiArICovCj4gK2ludCBmZHRfY21vX2xsY19mbHVzaF9hbGwodm9pZCk7
Cj4gKwo+ICsvKioKPiArICogSW5pdGlhbGl6ZSB0aGUgY2FjaGUgZGV2aWNlcyBmb3IgZWFjaCBo
YXJ0Cj4gKyAqCj4gKyAqIEBwYXJhbSBmZHQgZGV2aWNldHJlZSBibG9iCj4gKyAqIEBwYXJhbSBj
b2xkX2Jvb3QgY29sZCBpbml0IG9yIHdhcm0gaW5pdAo+ICsgKgo+ICsgKiBAcmV0dXJuIDAgb24g
c3VjY2Vzcywgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUKPiArICovCj4gK2lu
dCBmZHRfY21vX2luaXQoYm9vbCBjb2xkX2Jvb3QpOwo+ICsKPiArI2Vsc2UKPiArCj4gK3N0YXRp
YyBpbmxpbmUgaW50IGZkdF9jbW9faW5pdChib29sIGNvbGRfYm9vdCkgeyByZXR1cm4gMDsgfQo+
ICsKPiArI2VuZGlmIC8qIENPTkZJR19GRFRfQ0FDSEUgKi8KPiArI2VuZGlmIC8qIF9fRkRUX0NN
T19IRUxQRVJfSF9fICovCj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9jYWNoZS9mZHRfY21vX2hl
bHBlci5jIGIvbGliL3V0aWxzL2NhY2hlL2ZkdF9jbW9faGVscGVyLmMKPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAu
LjZkMmU4NTNkZDczNTczNTA5MmM1N2RiMjM5OGY5N2E2NGRlM2FiNWUKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvbGliL3V0aWxzL2NhY2hlL2ZkdF9jbW9faGVscGVyLmMKPiBAQCAtMCwwICsxLDEx
MiBAQAo+ICsvKgo+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4g
KyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAyNSBTaUZpdmUgSW5jLgo+ICsgKi8KPiArCj4gKyNp
bmNsdWRlIDxsaWJmZHQuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfZXJyb3IuaD4KPiArI2luY2x1
ZGUgPHNiaS9zYmlfc2NyYXRjaC5oPgo+ICsjaW5jbHVkZSA8c2JpX3V0aWxzL2NhY2hlL2ZkdF9j
YWNoZS5oPgo+ICsjaW5jbHVkZSA8c2JpX3V0aWxzL2NhY2hlL2ZkdF9jbW9faGVscGVyLmg+Cj4g
KyNpbmNsdWRlIDxzYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaD4KPiArCj4gK3N0YXRpYyB1bnNp
Z25lZCBsb25nIGZsY19vZmZzZXQ7Cj4gKwo+ICsjZGVmaW5lIGdldF9oYXJ0X2ZsYyhfcykgXAo+
ICsgICAgICAgc2JpX3NjcmF0Y2hfcmVhZF90eXBlKF9zLCBzdHJ1Y3QgY2FjaGVfZGV2aWNlICos
IGZsY19vZmZzZXQpCj4gKyNkZWZpbmUgc2V0X2hhcnRfZmxjKF9zLCBfcCkgXAo+ICsgICAgICAg
c2JpX3NjcmF0Y2hfd3JpdGVfdHlwZShfcywgc3RydWN0IGNhY2hlX2RldmljZSAqLCBmbGNfb2Zm
c2V0LCBfcCkKPiArCj4gK2ludCBmZHRfY21vX3ByaXZhdGVfZmxjX2ZsdXNoX2FsbCh2b2lkKQo+
ICt7Cj4gKyAgICAgICBzdHJ1Y3QgY2FjaGVfZGV2aWNlICpmbGMgPSBnZXRfaGFydF9mbGMoc2Jp
X3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCkpOwo+ICsKPiArICAgICAgIGlmICghZmxjIHx8ICFmbGMt
PmNwdV9wcml2YXRlKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT0RFVjsKPiArCj4g
KyAgICAgICByZXR1cm4gY2FjaGVfZmx1c2hfYWxsKGZsYyk7Cj4gK30KPiArCj4gK2ludCBmZHRf
Y21vX2xsY19mbHVzaF9hbGwodm9pZCkKPiArewo+ICsgICAgICAgc3RydWN0IGNhY2hlX2Rldmlj
ZSAqbGxjID0gZ2V0X2hhcnRfZmxjKHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpKTsKPiArCj4g
KyAgICAgICBpZiAoIWxsYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9ERVY7Cj4g
Kwo+ICsgICAgICAgd2hpbGUgKGxsYy0+bmV4dCkKPiArICAgICAgICAgICAgICAgbGxjID0gbGxj
LT5uZXh0Owo+ICsKPiArICAgICAgIHJldHVybiBjYWNoZV9mbHVzaF9hbGwobGxjKTsKPiArfQo+
ICsKPiArc3RhdGljIGludCBmZHRfY21vX2NvbGRfaW5pdChjb25zdCB2b2lkICpmZHQpCj4gK3sK
PiArICAgICAgIHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaDsKPiArICAgICAgIHN0cnVjdCBj
YWNoZV9kZXZpY2UgKmRldjsKPiArICAgICAgIGludCBjcHVfb2Zmc2V0LCBjcHVzX29mZnNldCwg
cmM7Cj4gKyAgICAgICB1MzIgaGFydGlkOwo+ICsKPiArICAgICAgIGNwdXNfb2Zmc2V0ID0gZmR0
X3BhdGhfb2Zmc2V0KGZkdCwgIi9jcHVzIik7Cj4gKyAgICAgICBpZiAoY3B1c19vZmZzZXQgPCAw
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArCj4gKyAgICAgICBmZHRf
Zm9yX2VhY2hfc3Vibm9kZShjcHVfb2Zmc2V0LCBmZHQsIGNwdXNfb2Zmc2V0KSB7Cj4gKyAgICAg
ICAgICAgICAgIHJjID0gZmR0X3BhcnNlX2hhcnRfaWQoZmR0LCBjcHVfb2Zmc2V0LCAmaGFydGlk
KTsKPiArICAgICAgICAgICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgc2NyYXRjaCA9IHNiaV9oYXJ0aWRfdG9fc2Ny
YXRjaChoYXJ0aWQpOwo+ICsgICAgICAgICAgICAgICBpZiAoIXNjcmF0Y2gpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICsgICAgICAgICAgICAgICByYyA9IGZkdF9u
ZXh0X2NhY2hlX2dldChmZHQsIGNwdV9vZmZzZXQsICZkZXYpOwo+ICsgICAgICAgICAgICAgICBp
ZiAocmMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwoKVGhlICJuZXh0LWxl
dmVsLWNhY2hlIiBwcm9wZXJ0eSBtaWdodCBiZSBhYnNlbnQgaW4gQ1BVIERUIG5vZGVzCnNvIGZk
dF9uZXh0X2NhY2hlX2dldCgpIG11c3QgcmV0dXJuIFNCSV9FTk9FTlQgd2hlbiBpdCBpcwphYnNl
bnQuCgpBbHNvLCBvdmVyIGhlcmUgd2UgbXVzdCBoYW5kbGUgInJjID09IFNCSV9FTk9FTlQiIGFz
IHNwZWNpYWwKY2FzZSBhcyBmb2xsb3dzOgoKZGlmZiAtLWdpdCBhL2xpYi91dGlscy9jYWNoZS9m
ZHRfY21vX2hlbHBlci5jIGIvbGliL3V0aWxzL2NhY2hlL2ZkdF9jbW9faGVscGVyLmMKaW5kZXgg
NmQyZTg1M2QuLmQ4N2JhYjc2IDEwMDY0NAotLS0gYS9saWIvdXRpbHMvY2FjaGUvZmR0X2Ntb19o
ZWxwZXIuYworKysgYi9saWIvdXRpbHMvY2FjaGUvZmR0X2Ntb19oZWxwZXIuYwpAQCAtNjIsOCAr
NjIsMTAgQEAgc3RhdGljIGludCBmZHRfY21vX2NvbGRfaW5pdChjb25zdCB2b2lkICpmZHQpCiAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwoKICAgICAgICAgICAgICAgIHJjID0gZmR0
X25leHRfY2FjaGVfZ2V0KGZkdCwgY3B1X29mZnNldCwgJmRldik7Ci0gICAgICAgICAgICAgICBp
ZiAocmMpCisgICAgICAgICAgICAgICBpZiAocmMgJiYgcmMgIT0gU0JJX0VOT0VOVCkKICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOworICAgICAgICAgICAgICAgaWYgKHJjID09IFNC
SV9FTk9FTlQpCisgICAgICAgICAgICAgICAgICAgICAgIGRldiA9IE5VTEw7CgogICAgICAgICAg
ICAgICAgc2V0X2hhcnRfZmxjKHNjcmF0Y2gsIGRldik7CiAgICAgICAgfQoKSSB3aWxsIHRha2Ug
Y2FyZSBvZiB0aGUgYWJvdmUgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZyB0aGlzIHNlcmllcy4KClJl
Z2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
