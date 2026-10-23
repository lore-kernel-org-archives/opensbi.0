Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF1A606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NtFgBE1N;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=rDyUUpaY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UZj0q7b5FDU9vURONHXuo9pqJkbciFryDP/vjMO3n+Q=; b=NtFgBE1NRoqnIZ3+EcFDaSZMxq
	P4WDxpVC4mnYp4/GedU9guK1SoFmNN/KdELGfJGgQCWHk34b/Xf5lOMShReI4XOGKfHM2HN7UtOOM
	zaJxTSg3Rr5KaZ4MUwoVunCp61rx62hYJZal0cYAAbe2T3D3h6u2sqyvWFvDvaw4/KR9u1Wb3qZ7v
	6yJZdm5NTIa7SrfXXcSlst6i4+YwVTiwas6g2MYgWPuU8e9SI42ol9tHPvasrLzHYzllL+93o8C7L
	iE7X3+qzOUBfP2PiaklPFENzwMnGD0qDcMykQQ/QFZDWePgAqsAp35+oXK3V6FctxsffA91ckNSh+
	mika76Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKE1j-0000000GGrh-48mj;
	Fri, 23 Oct 2026 12:05:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKE1g-0000000GGrE-20RT
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 12:05:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso9285335e9.2
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 05:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792757134; cv=none;
        d=google.com; s=arc-20260327;
        b=MxT3m1GkUQowzQEKk0CmWyjEHHhC/pwCxcCnYt+nH2j2EBXAu4AnvGAufgHtdMbncA
         RxAnlMLqS6spcG4Y5SU2wTR3BSI+x936pOgr6wrMQOOkhX4x999b17J+xkl9Qh/vmBZ1
         NIC0fjCKQHV9UK4ElwjyuDCJpZzEVml+Qup/np3I6HuJ3FgkgQCqlsiqByEI21F/B8xV
         oiitqG6OWv7lgr8OyXIgDYYokJ8wIG9qZNi8wHj7rgHvaJxjjRmzjxt7oEEiHgJ9va9M
         fDjAAGayyqhzgqQEjwT6SyT4ECzxeM3DcbEvPLO44KEkWKWh5C71yf+H8W+Bvomc4C8I
         1Kdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qug3+uvqkoe3pljvpjP8zyD/DXYnAQ1HE4C+qXNetvc=;
        fh=szlCjxWppTvYKyP9O9heyswkLlWT9SI7BHBq4C3up94=;
        b=rApx84Z/jxwBt5K3qRQ9Owg6dYPO4bnIOxqK/qqsw7WTpEoKB6HGpsKPem9zt2y+YA
         dL6nQdzKlLc8qFGNpoktoRoC6bJTuovUhE1HN1G56fIN8cdlXFngT1yo7o9aSZ/P9V69
         /91RWyrYCpeIJrev0pyz8sy8LAog1LWUCFRYcGQmL5GtHEx3ytRW1gpr99LV9mpk1N5N
         2kejO54f6NFCHtyahTnHxXlbDkNVJOMrT+3/amAcWG+/USDr2Edt1/VZJQ40ILxQdJzw
         tm+fxCYl46w8CT74+p65DC/v09IpIAw8j2CmXD5Fv1mCG2czIGp5UPCqfU9ysJSX8GXl
         fMqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792757134; x=1793361934; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qug3+uvqkoe3pljvpjP8zyD/DXYnAQ1HE4C+qXNetvc=;
        b=rDyUUpaY8P2Od+I9e0hglBSaqn8EWzv1KsB0ny8JnuhXoP561MW3CJ6VNMe2J89bxt
         eNb76XN40WRVYw8yNP1A9ZPJBCfGpqpD/nulCpB42hNJTxGS35+B8fvUDdNy4U35HU0d
         UD7OPaG0bg/dyliN4j3mIKaUbgvqNnfXv5t0ewGo8yJ9BA6z+U/w7WLRI8/wrFIwnCMQ
         T/cJgPDYDP0PZ7TeRJgQZC+dVpwZMDi+99y+/gTi42lx4i2Ei6jvlreDSmeN2yQBBPPv
         6OpEBuHW3M0I2eGvjqmqMVFbN1bROTsb1GYKMDiCj6aDWXm4kwee18QaiDDwVWUTenKQ
         FAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757134; x=1793361934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qug3+uvqkoe3pljvpjP8zyD/DXYnAQ1HE4C+qXNetvc=;
        b=THgtUGvVrlRzk0c6O/g1dnGOZn7AfjJoR6pLSpxftFwM1h9UMRPPKPsch84aAgf2rx
         RueWDf791V3I4vj2XVscwXx2oWnB8/Y++2tjnlln3O/LEc6tUDCGB4vUhu6Bo/gNqYzQ
         CvGhoPcdx+XwgGs1Wmz/feEr8sWyqyNYDOQTJbYSJWiPc205JWJW4AU65R4qu22jQf5e
         LzLXj5TxnLHn9R/DwmS+YVHxw5U0Do94lEm4YyXsiV8d95g+uT9WbBk13B+KwQJTH4RA
         GgHQvAUmw4F6/sN5nlbmWGhXDV5sxCbcNX4Xw6AGT+ZbhYKcIDOdsm0SuTLQQI9BEpI+
         fzjQ==
X-Gm-Message-State: AFq9FYJiU+6WT6v28Y9B13TllNJYemHiQI2Jx3zMpNVC4z8YjYSOAUUD
	25W6wq7otJ+2spjmLEs0CgSvp7ORQB4WRBKr/vzhHvZQbU879qvDqZ1zh7ERgEdjPsU2xIgKCsB
	GnLhSpooxIu7VdAPlxKDRGuB216fr35GjUMobXXB56g==
X-Gm-Gg: AYBFou001bIzLAGscwwogd1lNXy2oE/RpeYCapEi5T+TPEWqpZ1gkTGM5ks95sEyyJ5
	iVigu9F7k+Zpv9OqTpyiw9qbPhDjEyYAVJ9GbTU7FQytvubl9ZcM+ud9gNO9XOoU4eW5gS/50Xm
	h0HHPsGXTdf+1pl/iUpUSa+msMhlia2dZEYklKAhImG3Siq4hviWi+ipJJhJiWGnmv4tPTXImmt
	QhwAzXuUmKRKcv7f+RAoeRs+gV19Tc8vNTMtYYkdo+yylNnBL0utSaI7oFqOW2+K89/VTHIfUhH
	73pnhOQC4JOmGQIQbF6li3gHzAqa+2O1kh2AyOhxkJ62GSJjLpg1NnbhW8soPP2MdnsIsEipdRb
	fmU31iDiQaCxncJm6QKmV91KK1mw2LFZ2ic1nzrnZfg9eCS6CNBzG0fkP5JsZI7PX34JCLHkgNb
	TRC3qYEyFWul86p/xLy9uhupIbykjmaQUotWxttz0jo/T3bLr8AjsItJ/0
X-Received: by 2002:a05:600c:e558:20b0:4a2:150f:1609 with SMTP id
 5b1f17b1804b1-4a2150f1744mr19532175e9.8.1792757134477; Fri, 23 Oct 2026
 05:05:34 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260827115435.49190-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260827115435.49190-1-pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 17:35:22 +0530
X-Gm-Features: AclHuK_DOHikF-MCwUPEo1NsYvRE1oA-Nar1eSpu6nEvKjgBPa-k41z2h_DqejE
Message-ID: <CAAhSdy1X_sdEqPq2ue-xMjMxYaL56s-QG03Fk=3=M0OPgWsiLw@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: andes: validate PMAADDR decoding
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_050536_552922_FF927F25 
X-CRM114-Status: GOOD (  20.30  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBBdWcgMjcsIDIwMjYgYXQgNToyNOKAr1BNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gZGVjb2RlX3BtYWFkZHJ4KCkgcmVjb25zdHJ1Y3RzIGEg
TkFQT1QgcmVnaW9uIHdpdGggc2lnbmVkIGludCBzaGlmdHMuICBUaGUKPiBRaUxhaSBwbGF0Zm9y
bSBjb25maWd1cmVzIDJeMzUgYW5kIDJeMzcgUENJZSByZWdpb25zLCBzbyBkZWNvZGluZyB0aGUg
Zmlyc3QKPiBlbmFibGVkIHJlZ2lvbiB3aGlsZSBjaGVja2luZyB0aGUgbmV4dCBvbmUgcmVhY2hl
cyBzaGlmdHMgYnkgMzIgYW5kIDM1Lgo+IFRob3NlIHNoaWZ0cyBhcmUgdW5kZWZpbmVkIGV2ZW4g
b24gUlY2NC4KPgo+IFRoZSBhbGwtb25lcyBQTUFBRERSIHZhbHVlIGFsc28gdmlvbGF0ZXMgdGhl
IHNiaV9mZnooKSBwcmVjb25kaXRpb24sIGFuZCBhCj4gZGVjb2RlZCBiYXNlIG9yIGVuZCBtYXkg
bm90IGZpdCBpbiB1bnNpZ25lZCBsb25nLgo+Cj4gVXNlIHVuc2lnbmVkIHNoaWZ0cyBhbmQgbWFr
ZSB0aGUgZGVjb2RlciByZWplY3QgZW5jb2RpbmdzIHdob3NlIHNpemUsIGJhc2UsCj4gb3IgaW5j
bHVzaXZlIGVuZCBjYW5ub3QgYmUgcmVwcmVzZW50ZWQuICBUcmVhdCBhbiBpbnZhbGlkIGVuYWJs
ZWQgZW50cnkgYXMKPiBvdmVybGFwcGluZyB3aGVuIGFkZGluZyBhIHJlZ2lvbiwgYW5kIGZhaWwg
cmF0aGVyIHRoYW4gc2tpcHBpbmcgaXQgd2hlbgo+IGZyZWVpbmcgYSByZWdpb24uCj4KPiBGaXhl
czogYWE1NjA4NGM0ZGZiICgicGxhdGZvcm06IGdlbmVyaWM6IGFuZGVzOiBhZGQgYSBuZXcgQW5k
ZXMgU0JJIGNhbGwgdG8gc2V0IHVwIGEgUE1BIGVudHJ5IikKPgo+IFNpZ25lZC1vZmYtYnk6IFBl
bmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNjYXMuYWMuY24+CgpJIGFtIGlnbm9yaW5nIHRoaXMgcGF0
Y2ggc2luY2UgdGhlIGZvbGxvd2luZyBwYXRjaCB3YXMgYWxyZWFkeSBtZXJnZWQ6Cmh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9vcGVuc2JpL3BhdGNoLzIwMjYwNzI5MDkyMzE3
LjI4NDg2NjUtMS1yYW5kb2xwaEBhbmRlc3RlY2guY29tLwoKUmVnYXJkcywKQW51cAoKPiAtLS0K
PiBCYXNlLWNvbW1pdDogNGU3OWZkN2RlNTlmMWIyODk5MDkyYzFhODRjZTY4YzhlYmM2OGY5Mwo+
Cj4gIHBsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfcG1hLmMgfCAyOCArKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNf
cG1hLmMgYi9wbGF0Zm9ybS9nZW5lcmljL2FuZGVzL2FuZGVzX3BtYS5jCj4gaW5kZXggYmE5YTM1
Yi4uY2RjMDZhYyAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL2FuZGVzL2FuZGVzX3Bt
YS5jCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hbmRlc19wbWEuYwo+IEBAIC02OSwx
MCArNjksMTAgQEAgc3RhdGljIHZvaWQgc2V0X3BtYXhjZmcoaW50IGVudHJ5X2lkLCBjaGFyIGZs
YWdzKQo+ICAgICAgICAgY3NyX3dyaXRlX251bShwbWFjZmdfYWRkciwgcG1hY2ZnX3ZhbCk7Cj4g
IH0KPgo+IC1zdGF0aWMgdm9pZCBkZWNvZGVfcG1hYWRkcngoaW50IGVudHJ5X2lkLCB1bnNpZ25l
ZCBsb25nICpzdGFydCwKPiArc3RhdGljIGJvb2wgZGVjb2RlX3BtYWFkZHJ4KGludCBlbnRyeV9p
ZCwgdW5zaWduZWQgbG9uZyAqc3RhcnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgKnNpemUpCj4gIHsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgcG1hYWRkcjsK
PiArICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgcG1hYWRkcjsKPiAgICAgICAgIGludCBrOwo+
Cj4gICAgICAgICAvKioKPiBAQCAtODEsOSArODEsMjMgQEAgc3RhdGljIHZvaWQgZGVjb2RlX3Bt
YWFkZHJ4KGludCBlbnRyeV9pZCwgdW5zaWduZWQgbG9uZyAqc3RhcnQsCj4gICAgICAgICAgKiBz
dGFydCA9IDQgKiAoJHBtYWFkZHIgLSAoc2l6ZSAvIDgpICsgMSkKPiAgICAgICAgICAqLwo+ICAg
ICAgICAgcG1hYWRkciA9IGNzcl9yZWFkX251bShDU1JfUE1BQUREUjAgKyBlbnRyeV9pZCk7Cj4g
KyAgICAgICBpZiAocG1hYWRkciA9PSB+MFVMKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFs
c2U7Cj4gKwo+ICAgICAgICAgayA9IHNiaV9mZnoocG1hYWRkcik7Cj4gLSAgICAgICAqc2l6ZSA9
IDEgPDwgKGsgKyAzKTsKPiAtICAgICAgICpzdGFydCA9IChwbWFhZGRyIC0gKDEgPDwgaykgKyAx
KSA8PCAyOwo+ICsgICAgICAgaWYgKGsgPj0gX19yaXNjdl94bGVuIC0gMykKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOwo+ICsKPiArICAgICAgIGFkZHIgPSBwbWFhZGRyIC0gKDFVTCA8
PCBrKSArIDE7Cj4gKyAgICAgICBpZiAoYWRkciA+ICh+MFVMID4+IDIpKQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAgICAgKnNpemUgPSAxVUwgPDwgKGsgKyAzKTsK
PiArICAgICAgICpzdGFydCA9IGFkZHIgPDwgMjsKPiArICAgICAgIGlmICgqc3RhcnQgPiB+MFVM
IC0gKCpzaXplIC0gMSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gKyAg
ICAgICByZXR1cm4gdHJ1ZTsKPiAgfQo+Cj4gIHN0YXRpYyBib29sIGhhc19wbWFfcmVnaW9uX292
ZXJsYXAodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBzaXplKQo+IEBAIC05Nyw3
ICsxMTEsOCBAQCBzdGF0aWMgYm9vbCBoYXNfcG1hX3JlZ2lvbl9vdmVybGFwKHVuc2lnbmVkIGxv
bmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiAgICAgICAgICAgICAgICAgaWYgKGlzX3Bt
YV9lbnRyeV9kaXNhYmxlKHBtYXhjZmcpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRp
bnVlOwo+Cj4gLSAgICAgICAgICAgICAgIGRlY29kZV9wbWFhZGRyeChpLCAmX3N0YXJ0LCAmX3Np
emUpOwo+ICsgICAgICAgICAgICAgICBpZiAoIWRlY29kZV9wbWFhZGRyeChpLCAmX3N0YXJ0LCAm
X3NpemUpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICAgICAgICAg
ICAgICAgICBfZW5kID0gX3N0YXJ0ICsgX3NpemUgLSAxOwo+Cj4gICAgICAgICAgICAgICAgIGlm
IChNQVgoc3RhcnQsIF9zdGFydCkgPD0gTUlOKGVuZCwgX2VuZCkpIHsKPiBAQCAtMzUyLDcgKzM2
Nyw4IEBAIGludCBhbmRlc19zYmlfZnJlZV9wbWEodW5zaWduZWQgbG9uZyBwYSkKPiAgICAgICAg
ICAgICAgICAgaWYgKGlzX3BtYV9lbnRyeV9kaXNhYmxlKHBtYXhjZmcpKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+Cj4gLSAgICAgICAgICAgICAgIGRlY29kZV9wbWFhZGRy
eChpLCAmc3RhcnQsICZzaXplKTsKPiArICAgICAgICAgICAgICAgaWYgKCFkZWNvZGVfcG1hYWRk
cngoaSwgJnN0YXJ0LCAmc2l6ZSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNC
SV9FUlJfRkFJTEVEOwo+ICAgICAgICAgICAgICAgICBpZiAoc3RhcnQgIT0gcGEpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4KPiAtLQo+IDIuNTAuMSAoQXBwbGUgR2l0LTE1
NSkKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
