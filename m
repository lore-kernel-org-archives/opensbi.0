Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1048CD8CB2
	for <opensbi@archiver.kernel.org>; Tue,  9 Jun 2026 17:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvwy/CemT0D1UjHo36jmFTb/t3VnDkX5wlMepFu+xqg=; b=lAPV3OjY92QTvT
	aHus1+3IH5hW+i4K1Xkt+yhI4EoWvU3FUSwubR+PUxck+pfXTQVAt2AObPnR4tD9OeTMwkDu1qb1j
	YdUSZNGPwJ9MsgOFB4rQ8F0FtmDesODPAb89tS/79HkDqqJG8SbiSjeKNsQ8sLwDUpPWsrELQwVq9
	ltTi4tvKtiHoy7pwGVkA4wmh0b2DI3tWBmIuRYpmVz3D0rsluOW/0RAIrzilXfUWnRzTRpKLgPqtL
	F3uZMULNEsF4dMRauUqsZ0IT5AI2jQLDh/Qr8oKZ4Q0xdOhO6iRdtm30j1AoECT+NIwAh1jRYn4ts
	zDEX880acNgfzRNMgsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0dD-000000069Mb-2rGE;
	Tue, 09 Jun 2026 17:52:55 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0d9-000000069M4-4BLo
	for opensbi@lists.infradead.org;
	Tue, 09 Jun 2026 17:52:54 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5175cb5946dso38396211cf.0
        for <opensbi@lists.infradead.org>; Tue, 09 Jun 2026 10:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781027570; cv=none;
        d=google.com; s=arc-20240605;
        b=JN0BIG92BQcQm/iyg/Xlz+WTodH1hA0FBQXbBrVUFAYcAXAXXpH7XVeqUyzMa2LuJx
         PC3e3zLp6A7/WEajvwxGyGM/9pHcF6lgp9TcpUE2tQ1YkwRVdcKO/GkUNcHBR5Lr2c14
         5MSe7ePLBYSXnIfqFk8T0hGFp7DqUhReUcvL2qX/vZkKqMbUxKOJb0d8xFygBbuiORWi
         c4SAm0Le12vt8l+FNCJhnlXYixImADAGilzguEv7u1C4QHWa2OhE3doOTByDs1Kx7NV5
         pA7jXQYxxgZO59pcEAojRxPesGV9Jj+sflBTy+L0NwC7V4qecnFySZG2BQvBrFgfiOzd
         L64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zIsI5NOecTSa/PV5aPPUve5geL/9rNPpHM3RFMoxiu0=;
        fh=xvG/ztKrAhFPyooGp7IeDCZPlp06+J2jVEvv5rXJ95w=;
        b=Kz3bwEmArOT93zcPAVyV2qN94VsWADmZZbsn99+1q/izK96ZpXZssrOPKeAaaCIUJg
         X9p79XE9nqBDydoVdYFR0nD21L9m1avR89rBmSvqB1hxFr6547oi2HUCP3neEXZGQy6/
         vdQI6JBunT6LzCwhJwhNtqess6EJMQ/YmUVhyxcdOFKj1I8T/R6Wnan2LxSDvhbCgKp2
         N779Noh9YF2mk9b9fSui8O2crUiQDXbYto76+ZUpY6iKBVkHxzf5Net0YTL/n1Sh+7cO
         TnKMX8NtqTCUVfMhe/bmsOZFp9TRZM9tMhA23i2svxpV4+5bIO12nlLqWbhu2Ti3/PZH
         AB/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781027570; x=1781632370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIsI5NOecTSa/PV5aPPUve5geL/9rNPpHM3RFMoxiu0=;
        b=VsiMVP2u/PVPPNXsQ2Esx5e2VqD6NfKNPBz8i8kYnv/7FIXODBdOZXIhzprHDog6HV
         gcLYy22KS1vC5ND9JD/kOADpX9qbq7C00RJP569og3nu9KUnXViM0idG7UDVPxedT/uG
         1mQ9LRA3lORxcM4nEZ1mgZQLASjMVCu8ygHD3ZK9SDlMGybHjG9v8xqhKOVxmDIchiQz
         nTLOdiYhj3c6Vpb3154U5vpQRegkjjxFSIRtSWfhSt4tTOPeevsiEu1Ni+S3AC0i9sL6
         Uj+FyiqEiO4eouLOlU8ffWxgloMOGnoBk8+ur46/YfITrKr5H8lWoKOWevIsOcy11KiT
         xrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781027570; x=1781632370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zIsI5NOecTSa/PV5aPPUve5geL/9rNPpHM3RFMoxiu0=;
        b=jjp1PJbO/VVy4AwSfcGVsDfKVGR0aIiaRVrgdBt8rE8eedO+qRtA0Da7SYdThZW5dM
         nCHh9hN2HYRPmcLE4mdv+d9X1Z1kSvaiIxY28ncS/9sxdoRiPP/HQsRrP6nmtUrubJLU
         TMg9u15YorPCo8au3Yny78fLgMFScnCDRqmk/UtxxN+Z6to9A66EojnVUPlB/kTvPdg8
         EtF819u6T0IUlXGnXFwlBzfRhi93iuK6kfQ/VlT38VTFS9MTVUkjwxP3XmgBE2qEmfm+
         WTzm8MT0Xa3GJdx56CQQhDqoN88Ec5Hmm5tInxwjq7B/06KHRO6i7HcptyYOHyDxKJ8/
         Tm5w==
X-Gm-Message-State: AOJu0YzZP5TlG21G4/obbMcdyjMDpi1QXRpd7Wim46NR87WqjCsbLuV1
	EWw57ZqZ0UwFv95od4tmvXU7qvWOt3v8f3sgZVU1n56ld7OryCT81VFXeFi60yodwXSbJXMeL1J
	3iLHlyabJc8yjvJ5HVV06JS+ufU/FO7raXkrd8n/7Ww==
X-Gm-Gg: Acq92OFcU26nx8h0Aaxumpp1N1kvAWOo68oVLtegHFlYA+ZW6y0GrUF0dEX8hYeM9aq
	b6RgY0mD3iwH4yzLsTyyGpINuTnfSPWWP3DhvBt0AEMX7K0pfUKXZ5tTrpjIkUrLfmRfRb/bbui
	nTQnaE+zKisakMiwlP7Z1huL+OGY3nvf2+lYNVZF0uH1Ssqj9HXqbolZOSXvrf+bS5FA8BIqm/m
	szpq20qyOsAIdLF5o1WnzzqpPN8Y8AXBnEGjtsorO1F4LPsVG90gQXaroTe9hwnSk/zs+zJ3tRO
	YQtV1IhMzlh3Ii3lYCQdwdF8g81DNZ4dxUngdbG24eFy7iWTcmfv84p6byESGtFemrqy2zU2Nyl
	xP+Mp6I94sp7mxDBsEsjJL1y8CTZUyxP4k6WK
X-Received: by 2002:a05:622a:47cd:b0:516:e031:932e with SMTP id
 d75a77b69052e-51795a8d9famr293406501cf.4.1781027570323; Tue, 09 Jun 2026
 10:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260429181747.160033-1-vulab@iscas.ac.cn>
In-Reply-To: <20260429181747.160033-1-vulab@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Jun 2026 23:22:38 +0530
X-Gm-Features: AVVi8CeSP84isDuDDUAbb4RoepFp1zwdDq4kDxt63sIHFLv8t0z7D7lH71WigtI
Message-ID: <CAAhSdy3p5yDAdfi4tto8gcDs+-cRds=y4d8hWBdJTpEYfEeqBw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_domain_context: Flush TLB after SATP mode switch
To: Zishun Yi <vulab@iscas.ac.cn>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_105252_174469_2B2A5190 
X-CRM114-Status: GOOD (  10.90  )
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

T24gV2VkLCBBcHIgMjksIDIwMjYgYXQgMTE6NDjigK9QTSBaaXNodW4gWWkgPHZ1bGFiQGlzY2Fz
LmFjLmNuPiB3cm90ZToKPgo+IFdoZW4gc3dpdGNoaW5nIGJldHdlZW4gZG9tYWlucyB3aXRoIGRp
ZmZlcmVudCBzYXRwLk1PREUgdmFsdWVzIChlLmcuCj4gU3YzOSB0byBTdjQ4KSwgdGhlIFJJU0Mt
ViBJU0EgcGVybWl0cyBoYXJkd2FyZSB0byB1c2UgY2FjaGVkCj4gdHJhbnNsYXRpb25zIGZyb20g
dGhlIG9sZCB2aXJ0dWFsLWFkZHJlc3Mgd2lkdGggaWYgbm8gU0ZFTkNFLlZNQQo+IGludGVydmVu
ZXMuICBUaGlzIGNvbnN0cmFpbmVkLXVucHJlZGljdGFibGUgYmVoYXZpb3IgaXMgY2xhcmlmaWVk
IGluCj4gcmlzY3YtaXNhLW1hbnVhbCBQUiAjMjIxOS4KPgo+IEFkZCBfX3NiaV9zZmVuY2Vfdm1h
X2FsbCgpIGFmdGVyIHRoZSBjc3Jfc3dhcChDU1JfU0FUUCwgLi4uKSBpbgo+IHN3aXRjaF90b19u
ZXh0X2RvbWFpbl9jb250ZXh0KCkgdG8gZW5zdXJlIHRyYW5zbGF0aW9ucyBmcm9tIHRoZSBuZXcK
PiBkb21haW4ncyBhZGRyZXNzIHdpZHRoIGFyZSB1c2VkLgo+Cj4gTGluazogaHR0cHM6Ly9naXRo
dWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvcHVsbC8yMjE5CgpUaGUgaGFydCBwcm90ZWN0
aW9uIHJlLWNvbmZpZ3VyYXRpb24gd2lsbCBhbnl3YXkgcGVyZm9ybSBmdWxsIHNmZW5jZSAvIGhm
ZW5jZQpzbyBpbnN0ZWFkIG9mIGFkZGluZyB5ZXQgYW5vdGhlciBzZmVuY2Ugb3ZlciBoZXJlIGl0
IHdpbGwgYmUgYmV0dGVyIHRvIG1vdmUKdGhlIGhhcnQgcHJvdGVjdGlvbiByZS1jb25maWd1cmF0
aW9uIGFmdGVyIHRoZSBDU1IrRlArVmVjdG9yIGNvbnRleHQKc3dpdGNoLgoKSSB3aWxsIHVwZGF0
ZSB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGFuZCBkbyB0aGUgcmVxdWlyZWQgY29kZSBtb3ZlbWVu
dAphdCB0aGUgdGltZSBvZiBtZXJnaW5nIHRoaXMgcGF0Y2guCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlz
Y3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
