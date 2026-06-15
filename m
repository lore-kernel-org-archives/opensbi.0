Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D54CD98CE
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 04:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+gWCmxKeCwR/IES/jw0q3nQ7pL0aMqll5/eom+R4NQM=; b=CMZDFSgYd4cYUa
	BRaV3xjdECKQi0R+stPSvGvXKVIkDHYWQ9wVLbHTXUhKR+mZ6v2zrKWp+iWhGPDvk73uV6mXsEcTk
	r3P7VY3izaPUUa2ITQPfMVllELZ9HYSmJ3QpXLCBdasGno7mJXC/d/8WROdpWdNMUnd000OzS0ss/
	e4WKtTJcIIT5lH80jscqkcdw5+zBfvO1Y31xI5B3ZTMxGe+erxxF8VfMG7dmY93iG04ikzE9bDKXM
	ZOGDAxI/hx39JzqRqoSpndrskrgiSGkkAuY3Mlv+B8Ljc3Xdp795DM3h4qkRQ5Z4h4p5s4PajLCFm
	t7j2S1STKuT+8PiHOvog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzJq-0000000DaeM-1ZEu;
	Mon, 15 Jun 2026 04:53:06 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzJn-0000000Dadj-3sRT
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 04:53:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso3476299e87.0
        for <opensbi@lists.infradead.org>; Sun, 14 Jun 2026 21:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781499182; cv=none;
        d=google.com; s=arc-20240605;
        b=NHI+rB1rB3/pdkpz8qgep8ciXwT/TxAPbI9hKO/LMNE2Kjfy2H4/NN4oHhdylhNk1A
         x07T9mvWOc81X4Dms4YfL/GlIApKs2ya10MZhG+Oie7Ix7bQ9V7sudBb+woMyUGj8Y/N
         qKRlRveNifGkdHcuVnJ4cC4giuJG9ZppbEwJN1FVkjcXzb1asn5sdsTvEIndFXOd4TPz
         TYSz+XRAFWP98C/Zt/FcDmtYI4kApzDbEN+YoBbB58oBtmQsbir/01ammIlV/SdojBiW
         JuAx10JCqkRDTnVdNPgnaFLaDKo9MqsBXVUC42rBYRq+09QKGmtPXZioc12bo6+CAwoY
         q9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uHLGKT4y/aV6Gh7GVu1H8Y/wjVk6p/PR6kqKM8Llkf8=;
        fh=74Kn0DeUmNtaH8t1VxrINEBv0O1XT0mttugZ6nSqjno=;
        b=cZ1VB4Jgzn0NpK2bj1crhYvElKbCrX+EU/9MFDrrG0yMP7P7IN8YMR1RKAdolhMCE/
         6h+Za6KH4zSvjYSmoKaFZ9XEj2//HHS7TrnqMSfuNPUHz6wVxzkI5gIyqhGTHCDt+JdZ
         +26RnghJEs5UuD8IeJjszVzAzumS/YsZdi1wSrDWe9PcIN3/gDWeHxNZ55xPyXEQRQGq
         XODif/Ia28P9ZF5wGGnJra+LLUq8rz3t/Q/bM7HKuf6eLF90jlFfE3M/mVz1Fu/Pz1a4
         kE2gcb04CWpi2V9TIqsZB952PI1EKWjei7yzdTSaWsh0z1B6NCCiLVAmxbbxb+yqsp1+
         B9iQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1781499182; x=1782103982; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHLGKT4y/aV6Gh7GVu1H8Y/wjVk6p/PR6kqKM8Llkf8=;
        b=e/2y5vFXVB+pdv/pQZOIVDimh7EUnA72TKErxLarBrYu9f2Uy6+CE4OaDO3lfdYifv
         CqrkYnVd5+dlwY/W73n60CHBNPujTuuus1+dkW6x/rD83jF3Zp6x78rMFmHmLCr7DEPA
         iif5D+cxKwPALytuC7h21qFtCsrB8MP6QGRdPnY2kW/ESRlt53TCJCxLe09iA0MiE4cw
         hoyBGG7Zp6bIsJ+FY1l6hAZ43xkzNAFHMpg7NYXKQ05SmRMDdljySRoM2MnEHOOX9szJ
         ZAde30YIpMx2fhWJm3vy2rRTOXBdylID+Q5rZvyWUYTZ51cW/4vPDh4txSjZ8kOsUYdx
         +RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781499182; x=1782103982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHLGKT4y/aV6Gh7GVu1H8Y/wjVk6p/PR6kqKM8Llkf8=;
        b=qMzPimgEuFXbUyp+hmStfuB430uKQNosiECCeSvwxTGF8u+8KpBxN8uRQl3lD6l7cs
         08I4aOFKW0dSae5BMK4UhpgN6bA9dr60e+6exUfcsdc3BurzDcFLTcPouJKXXYmcCjZd
         X28sM9sWi/WX2vhzSi35rQlLZA5thezm5+IgXxgbmVkTUmTa1DK3CM/i+h1k1sqXCYzS
         Y/Br/pHtVQ1XR7Jj6PZb1YhCpCATHnmzLsthfn9d1i6AoRHMA8yc8ylKujPu1lqy5waI
         SSrXniSENNWc+nAdh+6rf1Ox+xQCargCYPSXYSpuAAXP/vdU3mQZ2Qm5O2Xxx+cl/3yr
         JYqA==
X-Gm-Message-State: AOJu0YwdSfzHPLXjJ2ZbTF6PD+VDpsX4pReuIM/5wfSqbmQ5k8C03wkF
	34/7amS3/fL2A62/zi/CC9ejnxc2M1YHE3bRjLhXKVbQ2z4GGM5pXrZVol7F4JoVrilf1Xwohej
	ZRo4HTy18GKutTGKsZQ5gURbQrqGM+taSgMwDMI8lq6wIXDpTGiHg
X-Gm-Gg: Acq92OE/a9pk1PaNO8GwVVGXpTvMmymvHCc8PnhGBeBmv35nl1+55uVgHwW3C5m9UqU
	2JO2tBobJHIdtvze4IR8wjYqnLpPKbE+DfzozsxeDzKRvrlSLz46UERlk6dPXrsIEIIwVIcMaCk
	tpNd1k4qefb5dJpWsmmLMwXBFj13tDrSkRRKpY7ce0P5xTTagu4zaAIzrnE/qt8/+Mmw7DTSR7U
	85ZFL9vVwLzGu35cIH1hnPqU2uvZtuuMe6wa1+ekl4vzjSjnKCEPjt6ydZaXyOhWXLVNBDkNjTK
	YxaLTPC/+QmrsJVUJzMinenuBd5J7kggNzHIAm5Fhw==
X-Received: by 2002:a05:6512:12c4:b0:5aa:684d:3c7c with SMTP id
 2adb3069b0e04-5ad2d487f6amr2900908e87.5.1781499181754; Sun, 14 Jun 2026
 21:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260530-trap-redirect-v1-1-45d4d333d8c9@kernel.org>
In-Reply-To: <20260530-trap-redirect-v1-1-45d4d333d8c9@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 15 Jun 2026 10:22:50 +0530
X-Gm-Features: AVVi8CcjWjCFw1LIosiQ2N0EqJm2pvJxF8wZnbpvNgit4KoLmfI5mkndsOd6rVg
Message-ID: <CAK9=C2X3-DYiasEf-mzn3Ei6z+pQop_JepmDugEjZO1i9icXiQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_trap_v_ldst: Redirect unhandled traps
To: Michael Ellerman <mpe@kernel.org>
Cc: opensbi@lists.infradead.org, asrinivasan@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_215303_978717_21C7F810 
X-CRM114-Status: GOOD (  19.42  )
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

T24gRnJpLCBNYXkgMjksIDIwMjYgYXQgODoxN+KAr1BNIE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFdoZW4gU0JJIGlzIGJ1aWx0IHdpdGggYSBjb21waWxlciB0
aGF0IGRvZXNuJ3Qgc3VwcG9ydCB2ZWN0b3IsIHRoZQo+IG1pc2FsaWduZWQgdmVjdG9yIGxvYWQv
c3RvcmUgZW11bGF0aW9uIGlzIG5vdCBidWlsdCBpbiwgdGhlIGhhbmRsZXJzIGFyZQo+IGp1c3Qg
c3R1YnMuCj4KPiBDdXJyZW50bHkgdGhlIHN0dWJzIGp1c3QgcmV0dXJuIDAsIGNhdXNpbmcgc2Jp
X3RyYXBfZW11bGF0ZV9sb2FkKCkgdG8KPiByZXR1cm4gd2l0aG91dCBpbmNyZW1lbnRpbmcgbWVw
YywgbWVhbmluZyB0aGUgaW5zdHJ1Y3Rpb24gd2lsbCBqdXN0Cj4gZmF1bHQgYWdhaW4sIGFuIGlu
ZmluaXRlIGxvb3AuCj4KPiBGaXggdGhlIHN0dWJzIHRvIHVzZSBzYmlfdHJhcF9yZWRpcmVjdCgp
LCB3aGljaCBmb3J3YXJkcyB0aGUgdHJhcCB0byB0aGUKPiBwcmV2aW91cyBtb2RlLCBhbGxvd2lu
ZyBpdCB0byBiZSBoYW5kbGVkIHRoZXJlLgo+Cj4gRml4ZXM6IGMyYWNjNWU1ICgibGliOiBzYmlf
bWlzYWxpZ25lZF9sZHN0OiBBZGQgaGFuZGxpbmcgb2YgdmVjdG9yIGxvYWQvc3RvcmUiKQo+IFNp
Z25lZC1vZmYtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBrZXJuZWwub3JnPgoKTEdUTS4KClJl
dmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlz
IHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
IGxpYi9zYmkvc2JpX3RyYXBfdl9sZHN0LmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX3RyYXBfdl9sZHN0LmMgYi9saWIvc2JpL3NiaV90cmFwX3ZfbGRzdC5jCj4gaW5kZXggZjRk
NDY5ZGNmMjg4ODRkMGVlY2I0ZmRlYzYxZWVlMjU4OTVkNTVhMC4uMWU0MzM2ZjlkYjIzZTdiOTcy
ZDM0MzBjZGM1MmFkZGIwZmNkYjgxNyAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV90cmFwX3Zf
bGRzdC5jCj4gKysrIGIvbGliL3NiaS9zYmlfdHJhcF92X2xkc3QuYwo+IEBAIC0zMzQsMTEgKzMz
NCwxMyBAQCBpbnQgc2JpX21pc2FsaWduZWRfdl9zdF9lbXVsYXRvcihpbnQgd2xlbiwgdW5pb24g
c2JpX2xkc3RfZGF0YSBpbl92YWwsCj4gIGludCBzYmlfbWlzYWxpZ25lZF92X2xkX2VtdWxhdG9y
KGludCBybGVuLCB1bmlvbiBzYmlfbGRzdF9kYXRhICpvdXRfdmFsLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfdHJhcF9jb250ZXh0ICp0Y250eCkKPiAgewo+
IC0gICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAvKiBVbmFibGUgdG8gZW11bGF0ZSwgc2VuZCB0
cmFwIHRvIHByZXZpb3VzIG1vZGUuICovCj4gKyAgICAgICByZXR1cm4gc2JpX3RyYXBfcmVkaXJl
Y3QoJnRjbnR4LT5yZWdzLCAmdGNudHgtPnRyYXApOwo+ICB9Cj4gIGludCBzYmlfbWlzYWxpZ25l
ZF92X3N0X2VtdWxhdG9yKGludCB3bGVuLCB1bmlvbiBzYmlfbGRzdF9kYXRhIGluX3ZhbCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBfY29udGV4dCAq
dGNudHgpCj4gIHsKPiAtICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgLyogVW5hYmxlIHRvIGVt
dWxhdGUsIHNlbmQgdHJhcCB0byBwcmV2aW91cyBtb2RlLiAqLwo+ICsgICAgICAgcmV0dXJuIHNi
aV90cmFwX3JlZGlyZWN0KCZ0Y250eC0+cmVncywgJnRjbnR4LT50cmFwKTsKPiAgfQo+ICAjZW5k
aWYgLyogT1BFTlNCSV9DQ19TVVBQT1JUX1ZFQ1RPUiAqLwo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6
IDU0N2E1YmJkYTdjM2VjMDA5NmE2Yzg3ODA5ODUxZjhjMmRmMDQ3ZDEKPiBjaGFuZ2UtaWQ6IDIw
MjYwNTMwLXRyYXAtcmVkaXJlY3QtNGE2NmZhZThhYWZmCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWls
aW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
