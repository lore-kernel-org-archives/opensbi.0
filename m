Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74592606A31A
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oz6qBlQy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Vhb7AQxj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S47mgRHQZ/2LdSURyfOAKgOPCgoQecY5XY556ai9yzo=; b=Oz6qBlQyahjKrXZKT+D4fhdwcO
	/VsQTcxpNy7lI9VIz3SYwuiRWVKWshcxry8nyCge7BtCJrwhKVkF9FG0tDBD+sXnXRUaChVEwEezk
	WiWUu9Ht/1Bixq8+TM3Hq29QjQXZHVxfayZS857eTyGHQa6NU4gkOzBT53hhw5/QA06GteiLeKaBS
	1u0M34/qi1icYG5194nWQktLWpNCoxywxUcEinDu9H5eWgfuTi0lcug9lgyxzZf7pWQrY9Kim70M6
	9h1PKiI+9p1PX6ETnxeFLUUqlUezgMHL7eyiYy2jk6/0zhS1YdLaV0FEjdAR7Oky5IrvTCtKGjCX/
	gidNMubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLj7B-00000005Afv-1IVR;
	Tue, 27 Oct 2026 15:29:29 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLj79-00000005AeK-0UaB
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 15:29:28 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3ab53a99771so34656541fa.3
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 08:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114965; cv=none;
        d=google.com; s=arc-20260327;
        b=hk6ZQqWyh2EKjhs39JFcGqLkf4fi7Tnr9gFV/Kb9Ea4KJq6oqY0Rl1SqfUx861/GdG
         XtLFdSu/41G9VaICruSBo6LBbeEzW2Zb0BYou7JeeEj+tHPb2FMPn5VT/7Y3+c73fhMf
         ByND3SjAKhB70/3dZM22jRQOrgO0kL7EZPO5DFz7c135tloUMYShcsNpwCeKYlLA0LDs
         1Ygezyq03Sgv4Crz8lp+PteJJ89Zrv6GZ0BIZARFgqP2SiHKNPDvetMXT/Fov2IzSe64
         U9+GDZInwC4wlnKHwNu7O/SlvBYzHEnjsPuBn/wjbzD5aqR+mLBjmuyZ5DX3A1WWBppZ
         k5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOSzKMEtJVDjcE1spCFl8ff84/1jfQlJmPtTfkP4CLI=;
        fh=A4DX0pRuScviaRe8zJffRYipcyyzGIYIBMxsBIXPKd0=;
        b=Zt6jxJBidjtWbott6qlh3qG5Q0aNwW8hOn4U4A8pQ4cd1ycK1WB4r6i79ArFj6KC7Z
         DQKVi2bIFChFuYx09GuNUzjG9YPUQdnTlKuQcARW2qQt+xa7iAsgg8E4IUrqc20lj6Yx
         XhTFIg8D5grl7aS0L+P+SZwGh0TPp/DjztdIAm4sCTmkfs+AXLzw8uVLlyQevPId1X3n
         EZxTzx+cG0HLf8BhodBI97fyRWOJ/zcqYMT0rKQ9YqUQPSYEXvw4o0wgVI0n4FPviOLp
         V/dFLycL6LkIm00IY0nReZCqZu4abzOjdS3MCarm9TMphdeZSYnUiz+NHoJhsr+gxGCy
         IriQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793114965; x=1793719765; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOSzKMEtJVDjcE1spCFl8ff84/1jfQlJmPtTfkP4CLI=;
        b=Vhb7AQxjkyR6wosojmOr5AouwElkTWSRKDeyTxzjdLf8FWZh8t/kj6aje9kEPUrltg
         Mf9aZStKXFY9Eqes36vYVXURTm+QeQLomcNoS9GvFW9q6LaKubxv3GUx7Ahyu7UFi9B4
         4RoAa+j7CAeAfBgDRxnJmYUMTI9hBvvQteGKxOesLB4Y6lXHZjH4v6wvmyEXfbSeC/ZU
         bt2Cr6mURRZ6HEfX7TX73XYA2toSIw97UyyT2F65jW4q/bAjdqef5iWvB1bIOQWQpNC6
         YHjrJH07+gQm7b6bgEZRQF8gdVZLzIqkozNVtyPbwW3ygSD5ENzfbwnnowbAbunOotBA
         mX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114965; x=1793719765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOSzKMEtJVDjcE1spCFl8ff84/1jfQlJmPtTfkP4CLI=;
        b=eejE9W6xpKWCEp2N6xzc0QqtTMRm0A4+byOEx98tqc+vWVX3gyTmz2nDpZj+6N30KX
         bD+hVxnX+ajT1/2/e36KI88E6AVRp5nDg0PSqlf2Ad/+nIjZLrPU3mT/VxZJBHMQx9Zp
         DIJlmzPEVoPpXGCjw7zrepr3sOMGiG3Kb7uP0cbR6/rpNr8VHIQAATOvA1FJQi/q/Cp/
         ctCVO9OMAX1YH519E3BUL8K/dQaF/10UAaM4wQt/OJDYuHVwNkUop9R5kDyviyyII6DR
         bQkjoZlPXZxypB9YibEWs+jMxg0s02DFz83m41nnYbhOj5vcDEjeerCEhtXaNf8XgTXd
         F/cg==
X-Gm-Message-State: AFq9FYKLkbNUrVkQDVg0hKGHyEc6DqX2yoz9j+FmaqW8IL1YCINAo5e5
	VWviedl5zoS1ZnbLm6G2YM5Dx5mvpYdu0cQldASxR8KdDru5uqUeTTD92pxMLOBwICiV5KiC5oe
	2aVrV5+6uaovIVhJmZPNkfiicYPPEoI1nnzJj/UkXrA==
X-Gm-Gg: AYBFou1GFCvMMcyqA6Prz2PD4Y3uSDO/YKQ5DLoU3Pp9a4joIQwcI6/HcR7IPEgI8ZI
	Rt5oivlBCrspeM3XKb6Rn+01flPgu9iWH4WEEjNxoPns15xt44gPa0ez4q8VhNF661crclobQMw
	EJUS9EIL/YM5IOOTSAiAtTFTM+V7ibvHFEnhVyDiUpzplhqaiAXLIZKpNWL0E+iMAc6aoBiqavL
	3o2Fzv5FkI80wJPApCLEQXDEQN7nXtFI/9QyvnmRk9/K+OIfME3q0bzze6oIzVsE49yz67568MO
	2tgbvUbCt0iVZ/6qRhxX8XR/17q27oOrXlgbPZTsI0ffnfu/4kjWbYvrr4s8INK3VgJ255uMEM5
	K8adGsf+KLIqPh1PfOmA4DeofjS5sJTbUGDlfALhPoV1Dtwv0ZBIky9GIa4JFVySI1T2Nw1AsDG
	DUX6iMvM3ZbMF1zkMauZlgXksIxYRz91N+sX5eDCo9HWH0x2F5515voPQ=
X-Received: by 2002:a05:651c:a183:b0:3ab:2a19:8625 with SMTP id
 38308e7fff4ca-3ac6fcf3c93mr24265301fa.4.1793114964384; Tue, 27 Oct 2026
 08:29:24 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260910180217.3256-1-eestelle0626@gmail.com>
In-Reply-To: <20260910180217.3256-1-eestelle0626@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Oct 2026 20:59:09 +0530
X-Gm-Features: AclHuK_6Ksc2b4aAkSszTvIl03YW9qrXw5ZyvmjhLscPIAqz15Lr-vgY7CmXCMg
Message-ID: <CAAhSdy3HK-TsVG+M4b+Su5UoZ2T8U3mpScmRtARW9YV1kc0+OQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_hart: Reset mhpmcounter after probing its bits
To: Evgenii Prokopiev <eestelle0626@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_082927_174149_BB2EDD3E 
X-CRM114-Status: GOOD (  16.62  )
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

T24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMTE6MzLigK9QTSBFdmdlbmlpIFByb2tvcGlldgo8ZWVz
dGVsbGUwNjI2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXcml0dGluZyBtaHBtY291bnRlcjMgKGFu
ZCAzSCkgdG8gZGV0ZXJtaW5lIHRoZSBhbGxvd2VkIGJpdCB3aWR0aAo+IGhhcyBhIHNpZGUgZWZm
ZWN0OiB0aGUgY291bnRlciBzdGFydHMgY291bnRpbmcuCgpUaGUgY291bnRlciB3aWxsIG5vdCBj
b3VudCBpZiBtaHBtZXZlbnQzIGlzIHNldCB0byB6ZXJvIGFuZCBjdXJyZW50bHkKd2UgYXJlIG5v
dCBzZXR0aW5nIGFueSBwYXJ0aWN1bGFyIHZhbHVlIHNldCBpbiBtaHBtZXZlbnQzIHNvIEkgYW0K
b2theSB3aXRoIHRoaXMgY2hhbmdlLgoKPgo+IEV4cGxpY2l0bHkgY2xlYXIgdGhlIGNvdW50ZXIg
cmlnaHQgYWZ0ZXIgdGhlIHByb2JlIHNvIHRoZSBwcm9iaW5nCj4gd3JpdGVzIGRvIG5vdCBsZWF2
ZSBhbnkgcGVyc2lzdGVudCBoYXJkd2FyZSBzaWRlIGVmZmVjdC4KPgo+IFNpZ25lZC1vZmYtYnk6
IEV2Z2VuaWkgUHJva29waWV2IDxlZXN0ZWxsZTA2MjZAZ21haWwuY29tPgoKTEdUTS4KClJldmll
d2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBh
dGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCgoKPiAtLS0KPiAg
bGliL3NiaS9zYmlfaGFydC5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFy
dC5jCj4gaW5kZXggYmVlODg1NTcuLmE0MTNiZmUwIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2Jp
X2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC00NDgsNiArNDQ4LDcgQEAg
c3RhdGljIGludCBoYXJ0X21ocG1fZ2V0X2FsbG93ZWRfYml0cyh2b2lkKQo+ICAgICAgICAgY3Ny
X3dyaXRlX2FsbG93ZWQoQ1NSX01IUE1DT1VOVEVSMywgJnRyYXAsIHZhbCk7Cj4gICAgICAgICBp
ZiAoIXRyYXAuY2F1c2UpIHsKPiAgICAgICAgICAgICAgICAgdmFsID0gY3NyX3JlYWRfYWxsb3dl
ZChDU1JfTUhQTUNPVU5URVIzLCAmdHJhcCk7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShD
U1JfTUhQTUNPVU5URVIzLCAwKTsKPiAgICAgICAgICAgICAgICAgaWYgKHRyYXAuY2F1c2UpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICB9Cj4gQEAgLTQ1Niw2
ICs0NTcsNyBAQCBzdGF0aWMgaW50IGhhcnRfbWhwbV9nZXRfYWxsb3dlZF9iaXRzKHZvaWQpCj4g
ICAgICAgICBjc3Jfd3JpdGVfYWxsb3dlZChDU1JfTUhQTUNPVU5URVIzSCwgJnRyYXAsIHZhbCk7
Cj4gICAgICAgICBpZiAoIXRyYXAuY2F1c2UpIHsKPiAgICAgICAgICAgICAgICAgdmFsID0gY3Ny
X3JlYWRfYWxsb3dlZChDU1JfTUhQTUNPVU5URVIzSCwgJnRyYXApOwo+ICsgICAgICAgICAgICAg
ICBjc3Jfd3JpdGUoQ1NSX01IUE1DT1VOVEVSM0gsIDApOwo+ICAgICAgICAgICAgICAgICBpZiAo
dHJhcC5jYXVzZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gbnVtX2JpdHM7Cj4g
ICAgICAgICB9Cj4gLS0KPiAyLjUwLjEgKEFwcGxlIEdpdC0xNTUpCj4KPgo+IC0tCj4gb3BlbnNi
aSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
