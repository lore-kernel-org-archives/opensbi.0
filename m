Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B028606A31A
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 05:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FhwxNQmD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=g1xZUYst
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Eu95gngJRvGoiRBuRBXgpYnU3x34qhHKSnh1De6j144=; b=FhwxNQmD2yd3n2JX5o19dDTvlU
	C+1YgIkU2TQMZ4RGo98dyPp8LFfTmhIYuifg3bbxZJ5uVDcZQLmsMJ+1wrRBkKiiOKlMvSIVz++55
	7hu8VxoYt3WsQLv7XkeqXaQWqASlobtwcJBkXZyI42ZvTMkeOju0sg21V/O/pBgnNt6a67cSxRlRn
	DPZdAq9tWcMrmXzrGOTC8boEymFaCtkLDJJA9CjhpEXxb+KIJ48ej1pB7o0XarvopkUk+siaTpkhl
	4MKhihK3H46N0f7sJTy/nnKKjvtfxP7tvVcg6P4KzF5EuNMhRXgNPXzY+jrb86eOM5gh9bXF1n+ZQ
	AgZ1AG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIqD-00000008P4N-1Sis;
	Thu, 29 Oct 2026 05:38:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIq9-00000008P3u-45eb
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 05:38:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e4831c028so1421798f8f.0
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 22:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793252295; cv=none;
        d=google.com; s=arc-20260327;
        b=k4LkUwOvmtsq75hMeZdxrWaCUvy8EDAvLMZDhYHVzcUaJrFVo7LE3DtcfVr0bLNJvU
         Z6281tW+scak5F8ckzXJ6O8vjp0pBu327qzcStLsNtNDEOfG14ebjAQVxIk9juNuketa
         PQCQ8DcQbONCQLr1/bPFrepRpYaed1vGy7+hYLe/qyYEOMCuFcENdXferMk1PGVjAHsA
         E5aIx1IAfNM4gpwrymSKdUoS9ydIt5NN4xGfnRhCuafrpKL7llA71rWOvAovP2K1HLJg
         z5HVtFmUW3wx+EEDOLztdiGHKi3QJimqG9R9TH88JicgEe5aFs8ItpsEmbQlvnKRurWI
         yFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S3wyQYQOukr8rGZwtbVmVBkSLLOqKBoynXwyi9b9cgk=;
        fh=OdKzR+t4CGsmYABsmv9V2x5YhUYBlz3pjiLjfjRfoWQ=;
        b=QI8n87rUun8ovfFjP45vzwQbsZZs6qLvg/RDOVjrWZSHn++UXsPRmypBTiIe57UOSz
         9VFnLd0+e28eBaW1B9RX0X1FrWgwUnV89XNVON5mpoph4v9NbN05tuEH/rcBRV83w+qR
         h6gJadgzJxtoXgYjJIyV5QRHlPN3lWhZ29UNfKMbLthDmI0z7BIQzDKRVfs29pPfMwgy
         AbE3zrBEhkZkkzsWEYYSRUxfo5N1rmvDaUMHPDFgcSFqqB8A2xVnLlkDUg7jNkAHZS/l
         FgtkEgYqZ7Ol/eZOoNcqHkcB9/Wfk+S2mPtZRx3LQnmmgw6wfHfgayIq0lUWlClTx7az
         ks/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793252295; x=1793857095; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S3wyQYQOukr8rGZwtbVmVBkSLLOqKBoynXwyi9b9cgk=;
        b=g1xZUYstYhLQy/a3K8frfa6dvS6RU7cydjCdw3tSyX8HDkpfwgW903At2Xg2IAJ9Wx
         2tEowltpO4peE1RChG9LxqZmeziU3pCE2bPiTdhSZTYauiM0j7VSHwMUW5/ySIe4AG1B
         NPqRbKgCsR5P3KjpUM6rQZMWtaiRx8UmZoYrG2tSvkUbTz4ZrVnZGYcbK0IHjIEdyO3O
         2G5t5bqUaPAGIujTlV3m4CTCpS8oIrnUvHPoG+CxJg4id3wFUPf5HgqdEmhFGxsuNb8Z
         nd2OITm4qsFSgGGOgk7Y3KeNczRun1ZIBFvy4xhUeDui2oU14ytKcDgY/pufC+HOEXBo
         WgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252295; x=1793857095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S3wyQYQOukr8rGZwtbVmVBkSLLOqKBoynXwyi9b9cgk=;
        b=WcnnC+gbvo7DuSF+f7qYv4Zf9OLKdtWv4+Yif/XXiAKxtO0iqm4KwEUrf9lKfMN8lB
         +ykSz/qYhjPCOaiu58PF+fv9sX5oF0TcvGXDxhJviBZQEacLhLXRmreHIWDc+rBRnMw8
         u0TMssc19KYBMBUaVW8HhmEiVWZobb2QorUEfogtzWpNJZkzkjTrdPM7QsvX8P9TA//o
         rrLcUwvthxgdowEu4uXzWV5peO8D+4TAVpi8y57XW+fBuhaRmQ6yDVyuRiREY2MgP+Ms
         v058BaUO52zwut8lKBzWTgZxNy1tpN8YPf8OwOUwCZv7uC0cZP0JfBa++kH3omKoTHTY
         2xtw==
X-Gm-Message-State: AFq9FYIA/Q7hexQLzGzhedtZHwNnJ1Z6D27Dfpe8KsiqTjbMZz6d4UGd
	+g1NQh93TcsBOaoDmFufSCN1Chk+Y0g3gLCBt+Y0P6gQduRqx5zvrH2Ph+X3JwPEklXF+FGDWPn
	S/k6mpzPqJ2DQuSkqichLX5LnKQiWULJlnCtdOCbuFgQ0yaE0EdTJ
X-Gm-Gg: AYBFou1n/E+DmA1L9+JQaircR4jJf32HGSuJDvNrrA35NuFK4VkKUdlRNkUh6W6IJ1u
	GJGmSdgdrae6anJF+qg5EH6g6ARyzV0ouvdd+fKcF6sfKr0R0P967aTh7J3yJOcRHOfS+P9oReh
	HRepYh7kF5zklsmm3R06eYhYTJSDRcbDXqYYpYJssjqtAbMEXdaykJDJIBxQqdvqHdo1sc8m+aj
	YXFqrgqnWLj9FNe/9++OAPmefzyCt5M9sQrp1NkITNkkPczYd1h996OKLWtTg4+U5jCgwvTNTnd
	NIaGk/q/IptXUrpMoOuispcO3rlvNfVHwiHU+cbZVpJnWfaNpSJqs1ogE5p6awkOzc/CJLLaEv3
	y30zYGh+PoVMvGzUcJjMli8uaoHDckoh/OoOyWeTKYQWqces2RbYvEuN/oh7YJylNjKJjfE2BNN
	s0lC85wXdSfpLl5GNQ4fmctyb5gnmC+0lU7EpfsTgRbpy4SqbWyzDjEwzwj4TeFNskAdEUO/MOC
	BoY8A==
X-Received: by 2002:a05:6000:1862:b0:48d:fbe1:bb17 with SMTP id
 ffacd0b85a97d-48e5d4681femr10588138f8f.41.1793252294897; Wed, 28 Oct 2026
 22:38:14 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <SY8P300MB0041D04649621E79FE950B43B58E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
In-Reply-To: <SY8P300MB0041D04649621E79FE950B43B58E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 11:08:03 +0530
X-Gm-Features: AclHuK9GUsqI9uILDpwuE98Ee382IfdeXzrRiJ8VKij3Pp-Lyv-r_cFQGDjib0Q
Message-ID: <CAAhSdy3tTG4Kgz5ciJDzCxtLEbjG4kNOgWrNPL0-Mk_hqWBQGQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: Fix fixed-counter events reported as unsupported
To: Fengwei Tan <tfx2001@outlook.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_223818_038853_86F6A84C 
X-CRM114-Status: GOOD (  18.72  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBTZXAgMjcsIDIwMjYgYXQgMTE6MjXigK9BTSBGZW5nd2VpIFRhbiA8dGZ4MjAwMUBv
dXRsb29rLmNvbT4gd3JvdGU6Cj4KPiBPcGVuU0JJIGFzc2lnbnMgU0JJX1BNVV9IV19DUFVfQ1lD
TEVTIGFuZCBTQklfUE1VX0hXX0lOU1RSVUNUSU9OUyB0bwo+IGZpeGVkIGNvdW50ZXJzIGR1cmlu
ZyBQTVUgaW5pdGlhbGl6YXRpb24uIHNiaV9wbXVfY3RyX2NmZ19tYXRjaCgpCj4gcmVjb2duaXpl
cyB0aGVzZSBldmVudHMgd2l0aG91dCBzZWFyY2hpbmcgaHdfZXZlbnRfbWFwW10uCj4KPiBIb3dl
dmVyLCBzYmlfcG11X2V2ZW50X2dldF9pbmZvKCkgb25seSBjaGVja3MgaHdfZXZlbnRfbWFwW10g
d2hlbgo+IGRldGVybWluaW5nIHdoZXRoZXIgYSBoYXJkd2FyZSBldmVudCBpcyBzdXBwb3J0ZWQu
IEFzIGEgcmVzdWx0LCB0aGVzZQo+IGZpeGVkLWNvdW50ZXIgZXZlbnRzIGFyZSByZXBvcnRlZCBh
cyB1bnN1cHBvcnRlZCB3aGVuIG5vIHJpc2N2LHBtdQo+IGRldmljZSB0cmVlIG5vZGUgaXMgcHJv
dmlkZWQuCj4KPiBDaGVjayBmaXhlZC1jb3VudGVyIGV2ZW50cyBzZXBhcmF0ZWx5IHVzaW5nIHBt
dV9jdHJfZmluZF9maXhlZF9odygpIGFuZAo+IHJlcG9ydCB0aGVtIGFzIHN1cHBvcnRlZC4KPgo+
IEZpeGVzOiBlNDM0NTg0MjE2OGIgKCJsaWI6IHNiaV9wbXU6IEltcGxlbWVudCBTQkkgUE1VIGV2
ZW50IGluZm8gZnVuY3Rpb24iKQo+IFNpZ25lZC1vZmYtYnk6IEZlbmd3ZWkgVGFuIDx0ZngyMDAx
QG91dGxvb2suY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8u
CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGxpYi9zYmkvc2JpX3BtdS5jIHwgMyArKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2Jp
X3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKPiBpbmRleCBlNzlmNmI2MC4uYjRhYmZhMWUgMTAw
NjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfcG11LmMKPiArKysgYi9saWIvc2JpL3NiaV9wbXUuYwo+
IEBAIC0xMTE5LDYgKzExMTksOSBAQCBpbnQgc2JpX3BtdV9ldmVudF9nZXRfaW5mbyh1bnNpZ25l
ZCBsb25nIHNobWVtX3BoeXNfbG8sIHVuc2lnbmVkIGxvbmcgc2htZW1fcGh5cwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGVpbmZvW2ldLm91dHB1dCA9IDA7Cj4gICAgICAgICAgICAgICAgIH0g
ZWxzZSBpZiAoZXZlbnRfdHlwZSA9PSBTQklfUE1VX0VWRU5UX1RZUEVfRlcpIHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBlaW5mb1tpXS5vdXRwdXQgPSAxOwo+ICsgICAgICAgICAgICAgICB9
IGVsc2UgaWYgKGV2ZW50X3R5cGUgPT0gU0JJX1BNVV9FVkVOVF9UWVBFX0hXICYmCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgcG11X2N0cl9maW5kX2ZpeGVkX2h3KGV2ZW50X2lkeCkgPj0g
MCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVpbmZvW2ldLm91dHB1dCA9IDE7Cj4gICAg
ICAgICAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZm9yIChqID0g
MDsgaiA8IG51bV9od19ldmVudHM7IGorKykgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdGVtcCA9ICZod19ldmVudF9tYXBbal07Cj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogNWEx
NzUwMTcyNjFhZjk3ZTkxMjJmY2I5ZDkwMTI0ODFjZGI1YWE0MQo+IGNoYW5nZS1pZDogMjAyNjA5
MjctZml4LXBtdS1ldmVudC1nZXQtaW5mby1jNGE2ZTJjNTcxN2IKPgo+IEJlc3QgcmVnYXJkcywK
PiAtLQo+IEZlbmd3ZWkgVGFuIDx0ZngyMDAxQG91dGxvb2suY29tPgo+Cj4gLS0KPiBvcGVuc2Jp
IG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
