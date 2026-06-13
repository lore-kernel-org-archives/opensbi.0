Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE5CCD8CA8
	for <opensbi@archiver.kernel.org>; Sat, 13 Jun 2026 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FL9KQAKIcHTgUjvj2ZMDKs1quYlNHpclbw20rtmuyjw=; b=2wJ/fypT0cwjym
	iu5q3VUo66trNU6O28Z1FuGx+DGZhbC0kPR+Ys3Q4AlpDV2Pwbc7r/aS1c225WGLA+rqP8XikXPmz
	y/2tqx5Ep6abUV0onfS+nIJXKQKb3/KXjClfnfRVHZ+mxQ4YSlGbWCq3BlC9SqXz0djk1i4mqxOOT
	IntXIyNonVUjfgqQMQs5iOkXUDL+RdYqGbaDYNdYxaUXDFAvy2+0mMLCnvitl6Ho2ClUcU0Hc6Bsi
	sfU4zf/hcRlwn+6BWJRq20h/Dbq2BOAykgMsi8nKD7JtwAhZXza2BY/wdqSz63ZjmoEoOhHxxOeiN
	2xQBw/bcgdBiQbdCJS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOIA-0000000CJqd-0jsB;
	Sat, 13 Jun 2026 13:20:54 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOI7-0000000CJqD-39p4
	for opensbi@lists.infradead.org;
	Sat, 13 Jun 2026 13:20:53 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3966c0d5ac9so16348911fa.2
        for <opensbi@lists.infradead.org>; Sat, 13 Jun 2026 06:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781356849; cv=none;
        d=google.com; s=arc-20240605;
        b=OCJtM0ua0A01Pvvog6iABVINWxaALA7WD3OOzaH2c+fc5NJgHaXlgEZ+elN02hu3Pw
         GoJ7kVh8AFOE1ThZfdr9+QSvCwb6CmFVRQgfLDEWLZuu2wUatbXf35cQg0+qY0OOdjFB
         LKj8slFBMe99AJg9xCfdldvHYaKr1P+fCzr1DUVRNi2c+IuFNbdQm6ZbsLOapqzRl8FB
         urydMvx6N5bMRrO8fRiaaJIRbQTPVwNjKWlVKjETnmwdc1MPW9c4G3mjABgm2JVG2Htg
         2AkJY6z+QuCkcok1xx0AFDQocWL/i8fcno8aL/KctMQSS9VNXRSN51DXZi8Ky7ceQ9n1
         ROmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mDWWbG77TfNkjz7XBjXHcPIGJKH34gMP30Cj1vfhG0s=;
        fh=mVWD2bMqyJl3tIWEtpJSZ7RUyHJ8tV0pvXcVzzPpyHA=;
        b=LuuNQIPD33AIS+jWnkSHDNpLQB5A9kgCTs77yNjCNu4vPUxAqcpFSy7NTb+SBWd4Rn
         nxmyOR+4ldByCh+ZMzBB08sKRaasLvcM4MTQyhp0dvaSLP3YWOr8IjIkeTstUKoLcqAT
         q/E+5LMEJ1E9MUCc9LezDAqtMRdmznrq5741+UpBkCAT1aETVSjLGu2oGjY7sIwCJiLa
         d4SwKocXaSn+D91HLJo2tY51gyu2Y3YhrCHaNoxtLjuVrUWDA8wY8j7/hk0cRUg9YFXq
         uKlWDWVIjUd934kmrI2LtxPUA+j4rod7ATgyneqJKOGMvZkGOi7c8wEZ1/A+Nr6gmqmf
         TEIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1781356849; x=1781961649; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDWWbG77TfNkjz7XBjXHcPIGJKH34gMP30Cj1vfhG0s=;
        b=due1pmfL5nc1SIaka3iWn30ho2P+4PGswG5kiUSOUQPNs6qzoxBT4Klf0aEVO5a3tP
         Adm8RCMQx3+jgT4X4HChSE/CYehSVXJ/mviSiffeQXfrf/lDCScyCVJfTW8aYk30mYn2
         s0VhgvZFtuHc5h/Ga74Ub85Mj7L/3BFakWJDMrhGCkioCetQS/fXGkT8MZuoYXD67u27
         Ok3eTDiYB95Whof7dF2JJyR4xIfzb5EzPKlxr9WmFv6ROjOMJWjPRvaWRJXGXKhfJI/X
         iL9jnd0DylroI0+2Z2EjqftnwPv30RJ8iKTGwbFbWP3GItMfuz9mkvqRjt9ujCIbu7Ur
         IZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781356849; x=1781961649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mDWWbG77TfNkjz7XBjXHcPIGJKH34gMP30Cj1vfhG0s=;
        b=bsOh8VwFgGSTgzwEZp2MtUxegfmgweVNhJIcb1jSa739nFMMn6tvHsFSv3yb0mmjb4
         ESiBUpz913DRYlacE7Iq2y6f3hfjv1EgxYyapXDphaJaNXy40bwM2Q8q4ORY7eIbtfZD
         66v2DT9OyOMqwzOxiHSDmLuwqRn/gg+Vye9cxWfGQVOlJb+Unvyw/uZeB7h4mOJmYq2Q
         G6GnBFmcWJ58Hv39iKRoKG2BslTfL0p7lubd1+/GDVhsIsYfc8hHwkP71UfvUU5M8tt1
         gmAIt++d9C9ipVVS5obbgnnCyEmKT+xiYhQTuwKK2aDEM+MRlHf9Rhaf9vsA5Q1XIrKj
         ryWQ==
X-Gm-Message-State: AOJu0YznDgeW3CgWT46wp+xknRswqVLIVFYs01quARMyIzGIM0ga6D3W
	HTpmdsBXy18kMSf2CfvYTw+zZIqoASbmytoQ0DzDVNpVBevLSdGe2+G5hLfyCepMHV3BGmtO5KS
	K2qmrJnGZ1YYPuPYR6y0hBbHRtY2bzhg3WWHVOBYllQ==
X-Gm-Gg: Acq92OFEePYM2LANcmKrmUdZDotYdcb3TgQmKpXdgO25LGkxIJlTiSJqBsemSaSAYFV
	c3J/MJd8gY2GQXRjQ5qmcgAt3zfuPpQrqXqUSuvqq8Vp6+DHOcnY+MNMi8tna9z6ItpUMldVnLa
	XowFnIYwOuxbwjT/XltPmgw2Lg4Jc8/xON+2j1RlU1WsU5ONY/eZOucBfHWjtfru7Vdwje8okur
	ihRFVB/lKHUKskRN1p2/BLqMDtTCnFDgDgC7qglNDxx8HkJ4sgZcJsQcLiasJLv++ShW0NQkDQX
	M4pFh9jaR0LR6q7LUBkmyVwsMYLB4VNUkwQVKZpR2G50iuDo4o54
X-Received: by 2002:a05:651c:50f:b0:394:1192:5e0c with SMTP id
 38308e7fff4ca-3992b27dd51mr21453541fa.21.1781356849287; Sat, 13 Jun 2026
 06:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
In-Reply-To: <edbce78c-71a7-41d7-aa81-3fa57241644a@iscas.ac.cn>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 13 Jun 2026 18:50:38 +0530
X-Gm-Features: AVVi8Cc5Fk9C3nypSHVXRdy3E4SNFKZoNzScdFEbpiQZJLJOy7VdPkCuvchG8KU
Message-ID: <CAK9=C2XGzAM+Qh3hXX78G6KjW7XxKOAd3Gwz9GBM6OdviYLPyw@mail.gmail.com>
Subject: Re: [PATCH] include: sbi_platform: Increase default stack size
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Michael Ellerman <mpe@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Bo Gan <ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_062051_838713_EC69EE5B 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

T24gU3VuLCBNYXkgMjQsIDIwMjYgYXQgMTE6MjjigK9BTSBWaXZpYW4gV2FuZyA8d2FuZ3J1aWth
bmdAaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gc2JpX21pc2FsaWduZWRfdl9sZF9lbXVsYXRvcigp
IGhhcyBhIGxvY2FsIGJ1ZmZlciAobmFtZWx5IG1hc2spIHdoaWNoIGlzCj4gODE5MiBieXRlcyBp
biBzaXplLCBzbyB0aGUgZGVmYXVsdCBzdGFjayBzaXplIGlzIG5vdCBlbm91Z2guIERvdWJsZSBp
dAo+IHRvIDE2Mzg0LgoKSW5jcmVhc2luZyB0aGUgc3RhY2sgc2l6ZSBpbiBvbmx5IGEgdGVtcG9y
YXJ5IGZpeCBhbmQgb25seSBkZWZlcnJpbmcKdGhlIHByb2JsZW0gdG8gc29tZSBvdGhlciBkYXku
CgpXZSBhcmUgcHJlZmVycmluZyBsYXJnZSBkYXRhIHRvIGJlIGFsbG9jYXRlZCBmcm9tIGhlYXAg
c3BhY2UgYW5kCnVzZSBzY3JhdGNoIHNwYWNlIG9ubHkgZm9yIHNtYWxsIC8gcGVyLWhhcnQgZGF0
YS4gVGhlIHBlci1oYXJ0IHN0YWNrCmlzIGFsc28gbGltaXRlZCBpbiBzaXplIHNvIHN0YWNrIGNh
bid0IGJlIHVzZWQgZm9yIGxhcmdlIGRhdGEuCgpNeSByZWNvbWVuZGF0aW9uIGlzIHRvIGFsbG9j
YXRlIG1hc2tbXSBmcm9tIGhlYXAgc3BhY2Ugb24tZGVtYW5kCmZvciBlYWNoIGhhcnQgYW5kIHN0
b3JlIHRoZSBwb2ludGVyIGluIHRoZSBzY3JhdGNoIHNwYWNlLiBUaGlzIG9uLWRlbWFuZAphbGxv
Y2F0aW9uIGNhbiBiZSBkb25lIGJ5ICBzYmlfbWlzYWxpZ25lZF92X2xkX2VtdWxhdG9yKCkgb3IK
c2JpX21pc2FsaWduZWRfdl9zdF9lbXVsYXRvcigpIGJ1dCB0aGUgc2NyYXRjaCBvZmZzZXQgaXMg
YWxsb2NhdGVkCm9uY2UgaW4gY29sZCBib290IHBhdGguCgpJZiB3ZSBydW4tb3V0IGhlYXAgc3Bh
Y2UgdGhlbiB3ZSBrZWVwIGFkanVzdGluZyB0aGUgaGVhcCBzaXplIGVzdGltYXRlCmZvciBnZW5l
cmljIHBsYXRmb3JtLgooUmVmZXIsIGZ3X3BsYXRmb3JtX2NhbGN1bGF0ZV9oZWFwX3NpemUoKSBp
biBnZW5lcmljIHBsYXRmb3JtKQoKSSB3aWxsIHRyeSB0byBzZW5kLW91dCBhIHNtYWxsIHVudGVz
dGVkIHNlcmllcyBzb29uLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
