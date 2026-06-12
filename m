Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0AECD8CA8
	for <opensbi@archiver.kernel.org>; Fri, 12 Jun 2026 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=im6c372wElDttQHr95giSq6z8Vk5Zl03GPtZ9vxIzOQ=; b=wPGWy2pDWqMQHw
	4UU6vEMgiaOJoB1oHgRkxpbs9GKzCyObfO2T6sTujW5Cho9oF1V+Gg/ps4hIFj0/CikfXumCsanO7
	NTxLCjNME7Q6t4G5jL4TSnJ/WFyQJlsz1jePGJwe5bi7I+vZoZGjnBAiA4Hn3TM2GBIwGlM4nDGgx
	coYk5r6ej3HZo1DKNHE+x3Fh91ynavR2t+JymyMe6IvogNyGYieEW+2GC0N9eqWUbKAEDT56i8btb
	MeQNbJ+Fc5TtjT6jg9X38zsu7hfLIYxWOfotiWxDFVSKHxqiQdllY9+gKsXDRsE65SlErHj/GvfXs
	y5cj8df63NkC4+F0t3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1rE-0000000AxmG-3WTd;
	Fri, 12 Jun 2026 13:23:36 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1rC-0000000Axlq-1oVe
	for opensbi@lists.infradead.org;
	Fri, 12 Jun 2026 13:23:35 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5aa68d9d56fso1170640e87.2
        for <opensbi@lists.infradead.org>; Fri, 12 Jun 2026 06:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781270611; cv=none;
        d=google.com; s=arc-20240605;
        b=O04XFLuhRrq6TqXTndAWaUWJvIgFdD4RmqaQmrHqJ2J1RyjPNIP2cYMAbxo+sbA6iW
         ipx/++J7W/FPyf0YTf3ZIesTfDcwHv+twd+j21iVbpvReBMyezwGcdpXi/HcKLqwpNyv
         Idnl7mUWIfmrsEiz9s4eTON9EMynrtnKhnImOihYzvg8x6rbztHvFwH5/71HQMkTdKX5
         zri5HCCDpC7enB+KmtO4fVzsEzL6GELDCG9kelJBk9OP+Tnf8Ur9dWCeLX6glq53w+x2
         RhqhfPCkPLQ14ECKTVLVr9LI5Fyowkts97o9/dJxqqiSXh0hPeqsNXIpGmfOM0Qszdbg
         RhDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VGBkwEp7T2YaSRqLkUyTZdM4So5NYLJRnIwqOM+hqzY=;
        fh=KFL2ZnSEuyOnR/Qh1iesqX1KcdxrnTrRWFET+qVGlVQ=;
        b=P5a7ems9CetVccet9R6YDAYvrMZMgi5SOdG4ZckWsyVjswABqTc5RU+V84PfTY+hUx
         4bu4AfBVmACM27GsSeHY4gJ5F3mtKr3jDmwXRlTdBnLQItFGPO9JrgufKv+2GQFWerGZ
         W0s5TzdLlSgs4Y75N7W8TRNWdQf4bBMSZAIwxn/xOO0cJ/8cRQuFtiVm8inJE5D8IGnR
         1kvkCTUdPdejS3oY8ghIm7ITXlrTlAPV9uvcQaX0embvhLNLJE8G/ISyRkdLrrqyFA0I
         cywNn7uOD36yPoS3Gs3t0M6TOC13+h1QzEVfCc5JnLibOLC1QanedSJFZmDSRDs52EqG
         MvhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1781270611; x=1781875411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGBkwEp7T2YaSRqLkUyTZdM4So5NYLJRnIwqOM+hqzY=;
        b=R2CYVFWk59wIkw+EGMQzsHBHRgjGcm0oP8OzuDB8z6kNpOuHy6s8ntgG/yv7YL1MA9
         fCPTsx3PzAF86vIU5vihrQgbjPACJTHKfCdTPs+lJW0SgD902oJ4a9N3p+WHdsKQqBbv
         VIjwYyL613iTwGcDlphem+z62zHwtgTLZTDhmOvhx1MxQPR7tDmoGcjrIJoiezzwRpWZ
         ENMF9CT1lvLYLI6TOvafaZTnq2HauZ48od3B7FScvBWXZwjg8dsIAlCkPkgBZ9eIaDfm
         ulJ+EEtCyN8GBdtJ/bW5o/rXQ1/+QY+LZeOJp34Y5qyq3vFDOQT9CBZTP0TR+VmhspmF
         4qLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270611; x=1781875411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGBkwEp7T2YaSRqLkUyTZdM4So5NYLJRnIwqOM+hqzY=;
        b=HUFZEX5ifppQ9IggpGQvvMmPUIqBMH+OD0W3uTmKl/zrig8t/MIrh840NOX9iixiJ2
         /rZb6ihsqPUU/snZmTs+fkE4DKr71AsvazxDA60ZNX2mnNwtuk7RMO+rkFvLsK5iSPtx
         9IqQBbtpFpNW6YGrOuKhHa+AFtNPWqxvC1J0mn9LeJNJKqD7ucGKnfEu6lLmehUlL4cF
         PZ4SMoUjbCw1sXQsAJ1fSHDja5Csk0aLIzLC+ZrDLemvVWgqTUgGm4x4exVyuqMNzbul
         QPiepU7id5qIj9onYmsmMsKk8pvVFB7dJhixVABjmFkPzGmDCLYP/bwiZw65e7dG2pq3
         wvFA==
X-Gm-Message-State: AOJu0Yz34Q9Ybr+FpdLS5ik3rHhRMjTzksI0Nn+Awc4nga5pRy5tw+GO
	uE1zF/P0cq3afpXVnzeKYz2h5oaNLZVI3zrAZp4IMUYiAyJd871GzvEpqV7lsJ2dwBgqDpzzM4p
	4Ug3MnPN/mMbL3AR9vx0CJ1BJ47pC8swUs2F744w+IukWxjHD6Uz8
X-Gm-Gg: Acq92OG/o15N5jKqyvuUArx3wxHSxJ95x47ocTvW5Fp0KY94LTL5LK0nHtOsILI8GBU
	lx1dDnBcPG1bjg89sqhmsWKOMqf81K3aPJm6B+ItZJ70AvEG1FlmFLHVwf/J31UQzosiUxsm1CS
	LyfgxHwoX5s6TU0RtyaT1gzCKbSwPNXBolj4cOo/2OBunXKAAFCoJBBXjHAh1Rg5C/nhPbaOnC6
	9aEFqjDTpeQem2aW1tBqkQ3hELEDMLgasiQt/KOPPqmnir3bBDT2l0QQfQSePYy50ekqs0PMIab
	a/+TZxnwz5n4gvIr4C2Vl6mNC5pc2rEUi2/awA7b
X-Received: by 2002:a05:6512:12c5:b0:5aa:6636:ddba with SMTP id
 2adb3069b0e04-5ad2db780e6mr1024592e87.38.1781270611028; Fri, 12 Jun 2026
 06:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260522144608.3433470-1-david.garcia@aheadcomputing.com>
In-Reply-To: <20260522144608.3433470-1-david.garcia@aheadcomputing.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 12 Jun 2026 18:53:19 +0530
X-Gm-Features: AVVi8Ce4jdOQbxyACHTdF4xu6P7m3mKrjf0YFUAi05OY_DmHCtDFeJXkcdHFNfA
Message-ID: <CAK9=C2V_At9_+0nUO8jhqnam7heXkQfe_ykhMhNjBvT=+MOFsQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: Honor CLEAR_VALUE/AUTO_START for all
 hardware event types
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062334_494828_6BDFB507 
X-CRM114-Status: GOOD (  20.92  )
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgODoxNuKAr1BNIERhdmlkIEUuIEdhcmNpYSBQb3JyYXMK
PGRhdmlkLmdhcmNpYUBhaGVhZGNvbXB1dGluZy5jb20+IHdyb3RlOgo+Cj4gc2JpX3BtdV9jdHJf
Y2ZnX21hdGNoKCkgb25seSBhY3RzIG9uIFNCSV9QTVVfQ0ZHX0ZMQUdfQ0xFQVJfVkFMVUUgYW5k
Cj4gU0JJX1BNVV9DRkdfRkxBR19BVVRPX1NUQVJUIHdoZW4gdGhlIGV2ZW50IHR5cGUgaXMgU0JJ
X1BNVV9FVkVOVF9UWVBFX0hXLgo+IEhvd2V2ZXIsIHBtdV9jdHJfZmluZF9odygpIGFsbG9jYXRl
cyBhIGhhcmR3YXJlIGNvdW50ZXIgZnJvbSB0aGUgc2FtZQo+IGh3X2V2ZW50X21hcCBmb3IgU0JJ
X1BNVV9FVkVOVF9UWVBFX0hXX0NBQ0hFLCBTQklfUE1VX0VWRU5UX1RZUEVfSFdfUkFXLAo+IGFu
ZCBTQklfUE1VX0VWRU5UX1RZUEVfSFdfUkFXX1YyIGFzIHdlbGwsIGFuZCB0aGUgc3RhcnQvY2xl
YXIgaGVscGVycwo+IChwbXVfY3RyX3N0YXJ0X2h3LCBwbXVfY3RyX3dyaXRlX2h3KSBvcGVyYXRl
IG9uIHRoZSBjb3VudGVyIGluZGV4IGFsb25lCj4gYW5kIGFyZSBhZ25vc3RpYyB0byB0aGUgZXZl
bnQgdHlwZS4gQXMgYSByZXN1bHQsIHdoZW4gYSBzdXBlcnZpc29yCj4gY29uZmlndXJlcyBhIEhX
X0NBQ0hFL0hXX1JBVy9IV19SQVdfVjIgZXZlbnQgd2l0aCB0aGVzZSBmbGFncywgdGhlCj4gY291
bnRlciBpcyBwcm9ncmFtbWVkIGFuZCByZWNvcmRlZCBpbiBhY3RpdmVfZXZlbnRzW10gYnV0IGlz
IG5ldmVyCj4gY2xlYXJlZCBvciBzdGFydGVkLCByZXF1aXJpbmcgYW4gZXh0cmEgU0JJIGNhbGwg
dG8gbWFrZSBpdCBjb3VudC4KPgo+IEV4dGVuZCB0aGUgY2hlY2sgdG8gY292ZXIgYWxsIGhhcmR3
YXJlLWNvdW50ZXIgZXZlbnQgdHlwZXMgc28gdGhhdCB0aGUKPiBjb25maWd1cmF0aW9uIGZsYWdz
IHRha2UgZWZmZWN0IGZvciBIV19DQUNIRSBhbmQgcmF3IGV2ZW50cyB0b28uCj4KPiBEZWxpYmVy
YXRlbHkgYXZvaWRpbmcgdXNpbmcgIm5vdCBGVyIgbG9naWMgdG8gYmUgZXhwbGljaXQgYWJvdXQg
SFctYmFja2VkIGV2ZW50cyBvbmx5Lgo+Cj4gRml4ZXM6IDEzZDQwZjIxICgibGliOiBzYmk6IEFk
ZCBQTVUgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgRS4gR2FyY2lhIFBvcnJhcyA8
ZGF2aWQuZ2FyY2lhQGFoZWFkY29tcHV0aW5nLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51
cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUg
cmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9w
bXUuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlf
cG11LmMKPiBpbmRleCA4YTkwMjFlMi4uNDgwYTk3MjMgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9z
YmlfcG11LmMKPiArKysgYi9saWIvc2JpL3NiaV9wbXUuYwo+IEBAIC05NDYsNyArOTQ2LDEwIEBA
IGludCBzYmlfcG11X2N0cl9jZmdfbWF0Y2godW5zaWduZWQgbG9uZyBjaWR4X2Jhc2UsIHVuc2ln
bmVkIGxvbmcgY2lkeF9tYXNrLAo+Cj4gICAgICAgICBwaHMtPmFjdGl2ZV9ldmVudHNbY3RyX2lk
eF0gPSBldmVudF9pZHg7Cj4gIHNraXBfbWF0Y2g6Cj4gLSAgICAgICBpZiAoZXZlbnRfdHlwZSA9
PSBTQklfUE1VX0VWRU5UX1RZUEVfSFcpIHsKPiArICAgICAgIGlmIChldmVudF90eXBlID09IFNC
SV9QTVVfRVZFTlRfVFlQRV9IVyB8fAo+ICsgICAgICAgICAgIGV2ZW50X3R5cGUgPT0gU0JJX1BN
VV9FVkVOVF9UWVBFX0hXX0NBQ0hFIHx8Cj4gKyAgICAgICAgICAgZXZlbnRfdHlwZSA9PSBTQklf
UE1VX0VWRU5UX1RZUEVfSFdfUkFXIHx8Cj4gKyAgICAgICAgICAgZXZlbnRfdHlwZSA9PSBTQklf
UE1VX0VWRU5UX1RZUEVfSFdfUkFXX1YyKSB7Cj4gICAgICAgICAgICAgICAgIGlmIChmbGFncyAm
IFNCSV9QTVVfQ0ZHX0ZMQUdfQ0xFQVJfVkFMVUUpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
cG11X2N0cl93cml0ZV9odyhjdHJfaWR4LCAwKTsKPiAgICAgICAgICAgICAgICAgaWYgKGZsYWdz
ICYgU0JJX1BNVV9DRkdfRkxBR19BVVRPX1NUQVJUKQo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4g
b3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
