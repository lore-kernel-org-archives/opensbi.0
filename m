Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9F5D0D141
	for <opensbi@archiver.kernel.org>; Wed,  7 Jan 2026 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nU+JkToCO8qvUfYSR67fCZt3Z4IuxakR5kgzsXwYUXA=; b=pu2a3GJ6/Dvz+A
	BLKxm1MSuwcmtyvc/p6PKKUcJ5QRa+NVE8mleFWk7CeDtBBQQ7ta1yNlQbOOiPFmST6n3hTmOXVER
	1Ot7gXdcO7OiAZbqjEJmO2jRJC2qs62yDAlLvMiU316FkWSVtr+7912ukMPB0OVJ3QpMM3qhW5RcF
	oHpeqsWdO+DnYoSK5zK8ppJkLtrjewjwHeMBCuX2l+hsZ1SzsxIp5MBFk+qPLPwJORdEwdpNv2nmo
	QC3YfLBLLfwPN+YCP38orOFnbFhoKd+GBfm/HzgGlWFpks6PGvoWNZB6NPaG8WAPQo0jFI0YkkwS3
	F/0+gg/JfLVkE/ULtkKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWvg-0000000FLjZ-1W8Q;
	Wed, 07 Jan 2026 17:02:40 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWvd-0000000FLht-1hmW
	for opensbi@lists.infradead.org;
	Wed, 07 Jan 2026 17:02:38 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7cc50eb0882so961337a34.3
        for <opensbi@lists.infradead.org>; Wed, 07 Jan 2026 09:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767805355; x=1768410155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/BL/I7gsy9TavF+QVzXJX7E8CoIeRBFTOOoZFE7hgk=;
        b=njmLf4TUWgTtbyEvThEuX9IFTb1Dx68F+tY2EcRqzGaY8hwV1T2lsE/OiwtRNsTp65
         bQBJGxQpl/cFaI0xzjHa3ypO7GzmNEf/PwLb+9RmZTJ/Q6HPbpjCOQE6m2JQ5tJ3lgrr
         H82A++UO3dxC4AkhI0BSACwf7jMqrK2pwIbVPtwptjYJ15Q1wfLYgon/pDsn7qxCOvfy
         XN2CEp9AlFe/P1slcVYJ1dcoDBDAHZ2PHTy5YVOGTU2boMf4YiNDHN61ldJSsF9guSqX
         MyWakJjzsaV8RdldFMW05hwrcTo15jaUML77XePxU+4Czm5V/ryTYm4Y9XoaKKmoEbHQ
         CW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767805355; x=1768410155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/BL/I7gsy9TavF+QVzXJX7E8CoIeRBFTOOoZFE7hgk=;
        b=p7HiCM13fOQbjyha34OkeSE9Z2++DAGgcr2p32v5FcvlZjVA4VpCbcAX0qyiJ3Yu0O
         2rOzm7/Kq6ItysAdrG+76PixzA8yYj5vq9V4xXa2SHK1Jc6mjtPsRdXaRyvLB2TUQjGO
         zScX6+GMrx/QbnsVlxLM9dizKuqbJQbG+VS+FHrXpqgw32hD3eBDx+cMMeGJg2x8FFt0
         +LxIOc8tPP8J0yYgiTW8QH1TEg8GxkXtFR6RDIKCd9duRBO7PGhQRNRZtB0XLDaFny62
         fNYoVpwvCi6P2+reMJ6+i+fh1Ja72GVNt+khdiGWtnAUNPUyu0M6BiUlBDu4R9xbY+xJ
         b+nw==
X-Gm-Message-State: AOJu0Yx9u71PYzWnRKhWaN//5HMdtlX0IjBrxew+wclgJdCCoirkp56s
	oxMfms8CHAAAs2rKBB1lrXtSdldlEeuzNQUAGCPDEERVz3E3Sm11gLlnqD02aBGynBRqya/DoUP
	V9j56tehI4GwQ0Ms3OOR11wP/elZB4ue/czYy15wXWA==
X-Gm-Gg: AY/fxX4dBnCfXsbkOX1N7VbsmgfItJorIO/CiP35MhQsSD5uvSXpzzrFDCkJk/85tYZ
	tUXkWdUQ98rg59m2jBfLjkL7U0ClY08dqjkiebhjxnRack6nkfW69QEw9y66gJS3O3fSi0UIhrn
	IzhvA0691b9E/+UCPWZXtLJajJyb/pPzqw1QLFNfK+SW3wyHIZLkVntOl4pfDbFOVLZnsU79a4S
	D8fx8uujnov6Yq4CssaG7cwLwUKon8qxF8iYv2yoH5KfgdHb8XcWcXtx33M5TZM7UzRowDHcyMz
	mc60jkyXNJIJfQ+jrxQTKeUrr6B69j+vq6Cm9QA9voJ3I9M0swSgJ7MeLVnEHNkwvt0kEg==
X-Google-Smtp-Source: AGHT+IHzd6ctsB1LsAwo1xg+CQRwelNwQPR9ldSct1fpI/hIIx4GLDUJJg8YuEXpQkkiSSGPHmhnMtXIuSa8jOKHpic=
X-Received: by 2002:a05:6820:530a:b0:659:9a49:8e3a with SMTP id
 006d021491bc7-65f54ed1d51mr859442eaf.10.1767805354358; Wed, 07 Jan 2026
 09:02:34 -0800 (PST)
MIME-Version: 1.0
References: <bb8641e5f82654e3989537cea85f165f67a7044e.1767801896.git.michal.simek@amd.com>
In-Reply-To: <bb8641e5f82654e3989537cea85f165f67a7044e.1767801896.git.michal.simek@amd.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 Jan 2026 22:32:23 +0530
X-Gm-Features: AQt7F2rIyIm4sth6aE3ZADdvUriM5ekJxVe8MLYh2i3P415w2xvMPkxfZM4ChbU
Message-ID: <CAAhSdy3bh-rf50qoKyoogD920QZYFuhvToOzdRGyYi8+-NJzSg@mail.gmail.com>
Subject: Re: [PATCH v2] lib: sbi: Fix behavior on platform without HART protection
To: Michal Simek <michal.simek@amd.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_090237_661996_D230DFE0 
X-CRM114-Status: GOOD (  19.34  )
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

T24gV2VkLCBKYW4gNywgMjAyNiBhdCA5OjM14oCvUE0gTWljaGFsIFNpbWVrIDxtaWNoYWwuc2lt
ZWtAYW1kLmNvbT4gd3JvdGU6Cj4KPiBUaGUgY29tbWl0IDQyMTM5YmI5YjdkYyAoImxpYjogc2Jp
OiBSZXBsYWNlIHNiaV9oYXJ0X3BtcF94eXooKSBhbmQKPiBzYmlfaGFydF9tYXAvdW5tYXBfYWRk
cigpIikgY2hhbmdlZCBsb2dpYyBieSBjYWxsaW5nCj4gc2JpX2hhcnRfcHJvdGVjdGlvbl9jb25m
aWd1cmUoKS4gQnV0IHdoZW4gcHJvdGVjdGlvbiBkb2Vzbid0IGV4aXN0IHRoZQo+IGZ1bmN0aW9u
IGlzIHJldHVybmluZyBTQklfRUlOVkFMLgo+IEJ1dCBvbiBzeXN0ZW1zIHdpdGhvdXQgcHJvdGVj
dGlvbiB0aGlzIGlzIGNvcnJlY3QgY29uZmlndXJhdGlvbiB0aGF0J3Mgd2h5Cj4gZG8gbm90IGhh
bmcgd2hlbiBzeXN0ZW0gZG9uJ3QgaGF2ZSBhbnkgSEFSVCBwcm90ZWN0aW9uLgo+Cj4gRml4ZXM6
IDQyMTM5YmI5YjdkYyAoImxpYjogc2JpOiBSZXBsYWNlIHNiaV9oYXJ0X3BtcF94eXooKSBhbmQg
c2JpX2hhcnRfbWFwL3VubWFwX2FkZHIoKSIpCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFNpbWVr
IDxtaWNoYWwuc2ltZWtAYW1kLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KClNpbmNlIHRoaXMgcGF0Y2ggYWxzbyBmaXhlcyBPcGVuU0JJ
IHJ1bm5pbmcgb24gUUVNVSB2aXJ0Cm1hY2hpbmUgd2l0aCBydmEyM3M2NCBhbmQgcnZhMjJzNjQg
Q1BVIHR5cGVzLCBJIHRoaW5rCndlIHNob3VsZCBoYXZlIGFuIGluY3JlbWVudGFsIHYxLjguMSBy
ZWxlYXNlLgoKUmVnYXJkcywKQW51cAoKCj4gLS0tCj4KPiBDaGFuZ2VzIGluIHYyOgo+IC0gQWxz
byB1cGRhdGUKPiAgIHNiaV9oYXJ0X3Byb3RlY3Rpb25fbWFwX3JhbmdlKCkvc2JpX2hhcnRfcHJv
dGVjdGlvbl91bm1hcF9yYW5nZSgpCj4KPiAgbGliL3NiaS9zYmlfaGFydF9wcm90ZWN0aW9uLmMg
fCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hhcnRfcHJvdGVjdGlvbi5jIGIvbGli
L3NiaS9zYmlfaGFydF9wcm90ZWN0aW9uLmMKPiBpbmRleCAzMDZmNWFmYmRhZWEuLmUxMGM4NTY0
NjBhNCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0X3Byb3RlY3Rpb24uYwo+ICsrKyBi
L2xpYi9zYmkvc2JpX2hhcnRfcHJvdGVjdGlvbi5jCj4gQEAgLTU0LDcgKzU0LDcgQEAgaW50IHNi
aV9oYXJ0X3Byb3RlY3Rpb25fY29uZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkK
PiAgICAgICAgIHN0cnVjdCBzYmlfaGFydF9wcm90ZWN0aW9uICpocHJvdCA9IHNiaV9oYXJ0X3By
b3RlY3Rpb25fYmVzdCgpOwo+Cj4gICAgICAgICBpZiAoIWhwcm90KQo+IC0gICAgICAgICAgICAg
ICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAg
ICBpZiAoIWhwcm90LT5jb25maWd1cmUpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5P
U1lTOwo+Cj4gQEAgLTc2LDcgKzc2LDcgQEAgaW50IHNiaV9oYXJ0X3Byb3RlY3Rpb25fbWFwX3Jh
bmdlKHVuc2lnbmVkIGxvbmcgYmFzZSwgdW5zaWduZWQgbG9uZyBzaXplKQo+ICAgICAgICAgc3Ry
dWN0IHNiaV9oYXJ0X3Byb3RlY3Rpb24gKmhwcm90ID0gc2JpX2hhcnRfcHJvdGVjdGlvbl9iZXN0
KCk7Cj4KPiAgICAgICAgIGlmICghaHByb3QpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBTQklf
RUlOVkFMOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIGlmICghaHByb3Qt
Pm1hcF9yYW5nZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4KPiBAQCAtODgsNyArODgs
NyBAQCBpbnQgc2JpX2hhcnRfcHJvdGVjdGlvbl91bm1hcF9yYW5nZSh1bnNpZ25lZCBsb25nIGJh
c2UsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiAgICAgICAgIHN0cnVjdCBzYmlfaGFydF9wcm90ZWN0
aW9uICpocHJvdCA9IHNiaV9oYXJ0X3Byb3RlY3Rpb25fYmVzdCgpOwo+Cj4gICAgICAgICBpZiAo
IWhwcm90KQo+IC0gICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICBpZiAoIWhwcm90LT51bm1hcF9yYW5nZSkKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4KPiAtLQo+IDIuNDMuMAo+Cj4gYmFzZS1jb21taXQ6IGU3
ZmE2NmMyMTYwZWMxMzlkZTE4NTNhMDBmNjY5YzA5MzIwYTkyNTYKPiBicmFuY2g6IHRyYWNrCj4K
PiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
