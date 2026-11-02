Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A3606A324
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tnoKrynO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Oihi4QXI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0PY8dZic5AETlMRdkR9GqI3Xk/Lag/Rc+KZOOOicFpQ=; b=tnoKrynO1ux09GBJSkZo24LbxL
	D0wWT2NY4BH1zbNtx2eMBP938dv70bwysRhR6zTlSEv/q8JELXMMHSW3ZJTn2tXepyJNhlZrTE5gc
	oMNBCz1XeIAHHdGPsQYdx+sVtlqi0F7+YsRYl56np6dNhjl9VdrB6x1WvIaaOKdbD8f/QnAT1iqZr
	fUCvRhfqyfmGam8DoFaGUYPCCT2gFuJHyM8MJaB9ZBi38HdfQnfH44cDUYBkLDKNSEzU+ptCS92gA
	l5HE/heSVCroe0TQ6D81fmSxep+zXPYL9TwNHtqLFJMICOw1XOb8bsk5pV8JmHsvya/uKMdnU6F5W
	CrK8EHvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmyo-0000000FolZ-3okh;
	Mon, 02 Nov 2026 08:01:22 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmym-0000000FokR-2kYc
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 08:01:22 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so4351904a12.2
        for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 00:01:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793606479; cv=none;
        d=google.com; s=arc-20260327;
        b=Ea5lcy0XxbXK9l6sa2XkcRdkcvpCrdxsoUdlYSzrnqmsJxVYp7EFDtOuHxOuUt1aPL
         ivPW8lXPzKWW3OxE3EB2rMLcIdUEnVYfbxZzKNVrNTNfM4Nflk6GNJEBmfIZ0ezC6DiT
         Y7SbLTTSCn2Uf/PkEUmeJGFVS8XIhzigEn8/sC+yj0MMCsA4MijwAzKmkOlL+FeRjtK9
         w68gegX15vY45tBUJ5+rhuWegsh9iXWO8b+z5O0nkHruwa2vUkZMJ7li3HoIlz0d06ot
         XVavbLWul0+cW4Qp6EushBGWwNiOaWsffPXCtdTIFzk+HHSD3NXeUB2AeFBLMycXRozw
         qvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qf/MtWr+9qWWqRd8meMpLTe6icpPVuJYxnAG91Ihgms=;
        fh=iji92DeIuaGGavMKwQqF6n0ZR9xlaOCjjk+9aeUqBuA=;
        b=i0tvHzLdnToO0m6CiWDx/alC0UIt0BNCshMQWY0sPvi9vvHNBCadismG4neZ6WwveM
         yfivplbhLIHXvWuXelaF/y+cTMNdn9DfbMyEKmtHdf4AfgaPo2fwc93UAa9/YGHirQw6
         Q6IYi0khcpHRwJ8zpJTUiO6gk8RjSQW0U2Y2U3330pSO49n1bY6eUPdmh9It0ZWZDYCK
         r9A/wxB0WZZF1al52h6ndTen7rdO0xm7RqLndX5jGuHL7iDHldVFOiZCd7x/EydPV+5E
         XIJ/9AfcH7T1G50uc8oAu76t0eLxsaAsl/fzcUX+pItLbc+iuBB+vAlfBILkOJMNt4na
         w/CA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793606479; x=1794211279; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qf/MtWr+9qWWqRd8meMpLTe6icpPVuJYxnAG91Ihgms=;
        b=Oihi4QXIhFPv/qLRd0xcwH0vy3hXcaVyINMVW4lWZmQV9M3lpnM6lDvS7r0NT42eys
         bo7W5eTxfWMwnlfjiFt9AEM4aH1hb8/w+UZR8dF5xj+Zn6JbFoOGkojcYMmSJbLy3iY/
         yjVOd0u5KpD5bW6qIG+lb2w6ct5xhAeEo2Uz+tNNnxQOKleKxWs2qr1Xp7Cr2xt6r/5B
         o0iTUdcCgBlUYRfsZw5W7fzrbEB5KrOaB2+WOAjvLHDiUulzCvWYkK/X4x661hT6+Xnn
         dfA6dMXr4tee39/Te59GH8QOdmkdFctMHSeMLXPS8WH6EvaBJZOdr37CQNePswSxDTWJ
         Svug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606479; x=1794211279;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qf/MtWr+9qWWqRd8meMpLTe6icpPVuJYxnAG91Ihgms=;
        b=OSePFzf0xrl1Ww2SzI+q+uK4RwLGoLePZU0Auh9CnOnIvfAmXFOl7UeUP5/1DXKrMY
         sjk46JmHpKEayVgUNAZwVjObeeONiSHjT14b32CXaOT4E2rqCrbGseYs6Cb3bJswBkW9
         QD0Q226PHzlYsgL+9yTrt2YE7V1ch6AuBRDMOD9g9jcnJ1y8ZTsm8M87JnFPkYBZYk1L
         esO1au+O0Oa16UQiVAfInWtRI/m089BUav/jUKiBl0jjwOaAJqFm1GBld/plcQ8uLB/S
         NrFBqUbXxjF7K6pz8q+oDq5QvA+9kvfHtbWQvSvZOko/Usl6RI21haUIRB2xWtq//VGp
         qykg==
X-Gm-Message-State: APuU4Z9MCKHqVwLidgu7R1ZaZX1iv/5qGgRyl1dkeYc4wf9VLIA8DW+b
	ThMw+0hAoAI8evCtWj85vgRIHE5LGGZHBxJl6DLjP9inTU3uJTlqMDQRtlTO/QwiOh2olvwq9Jz
	Pai9bd/GOPZNOF2+kVtlx5zNLS6GXWeHJ1iv9qR9XOhvLaj5gL+u8
X-Gm-Gg: AYBFou1Hm5zEr4lmXLFSEyGZLJwoCVeodd8B38KQaDSWn+7HasZcrFokTrFlI8sJBGQ
	h+hjXzPR7CZMzi0wNoTL93DQ9M/9kdnwpuYxvQ+PdW2Ui+N+gEsZBcg6YX6SkCynzAldzgeQ8fj
	U47ondoeLha82I/UJB7tfUMSuLXv1NJhFcS60Y+FGFCVHTqjyQTAz0vj+vRr41YFGxlcIPtNw5h
	QGwHAWkoXD7NxUp5g/FUZudcu0+u9h3eBSHAURgn3Aelx2OQx5Z+21T1hlMd3fNp4ULXJ2qZr6d
	5qoQWPW0Rr8B3cq0DzStX5Oq97kZzsBXxytQtECc+FN164WaKt448iopwXdFu6YZVEYyI0lUFaU
	M1kPtfdNQKhDpUcL/E9+G0MzXm4dlaE4jsShMC8zKKpVZzXCS/o8+FTp1tv8iZd2b8XW7FVjBri
	ekz1ihYbmnSCVHV3LLEnVmK1ddg0gjfqlAZyuqcA9L4As1hTZbk4lqUSsP
X-Received: by 2002:a05:6402:c4cf:10b0:6b4:203:a183 with SMTP id
 4fb4d7f45d1cf-6b4d4d84ce7mr4443805a12.36.1793606477052; Mon, 02 Nov 2026
 00:01:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260928032414.4125686-1-zhongyicheng241@mails.ucas.ac.cn>
In-Reply-To: <20260928032414.4125686-1-zhongyicheng241@mails.ucas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Nov 2026 13:31:03 +0530
X-Gm-Features: AclHuK_o3p1x8YobXVHCB5O8CB_WwxfgcBpEt7shjSHlLjs1QbNl_Mu3Hu_-j4g
Message-ID: <CAAhSdy1aCn++NG7Da09hVTLjNJZBayxu=yFKmbfrqnNWe5Ea5g@mail.gmail.com>
Subject: Re: [PATCH] platform: generic/starfive: deny S-mode access to the
 JH7110 firmware alias
To: Zhongyi Cheng <zhongyicheng241@mails.ucas.ac.cn>
Cc: opensbi@lists.infradead.org, samuel.holland@sifive.com, 
	anup.patel@oss.qualcomm.com, minda.chen@starfivetech.com, 
	hal.feng@starfivetech.com, weiliang.lim@starfivetech.com, vulab@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_000120_722959_EA947584 
X-CRM114-Status: GOOD (  28.11  )
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

T24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgODo1NOKAr0FNIFpob25neWkgQ2hlbmcKPHpob25neWlj
aGVuZzI0MUBtYWlscy51Y2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBKSDcxMTAgRERSIGNvbnRy
b2xsZXIgZm9sZHMgcGh5c2ljYWwgYWRkcmVzc2VzIGJleW9uZCB0aGUgOEdCIEREUgo+IHdpbmRv
dyBiYWNrIGludG8gRFJBTTogUEEgKFggKyAweDIwMDAwMDAwMCkgcmVzb2x2ZXMgdG8gdGhlIHNh
bWUgY2VsbHMKPiBhcyBQQSBYLiBQTVAgZW50cmllcyBtYXRjaCB0aGUgcHJlc2VudGVkIGFkZHJl
c3MsIHNvIGFuIGFsaWFzZWQgUy1tb2RlCj4gYWNjZXNzIHRvIHRoZSBmaXJtd2FyZSByZWdpb24g
YnlwYXNzZXMgdGhlIGVudHJ5IHByb3RlY3RpbmcgdGhlCj4gZmlybXdhcmUgYW5kIG1hdGNoZXMg
dGhlIGFsbG93LWV2ZXJ5dGhpbmcgcm9vdCByZWdpb24sIGxldHRpbmcgcm9vdAo+IHJlYWQgYW5k
IHdyaXRlIHRoZSBmaXJtd2FyZSB0aHJvdWdoIHRoZSBhbGlhcy4KPgo+IEFkZCBhIHJvb3QgZG9t
YWluIG1lbW9yeSByZWdpb24gY292ZXJpbmcgdGhlIGFsaWFzIG9mIHRoZSBmaXJtd2FyZQo+IGlt
YWdlIChmd19zdGFydCArIDB4MjAwMDAwMDAwIC4uIGZ3X3N0YXJ0ICsgZndfc2l6ZSkgd2l0aCBN
LW1vZGUtb25seQo+IHBlcm1pc3Npb25zLCBpbiBwbGF0Zm9ybSBlYXJseV9pbml0KCkgc28gdGhh
dCBpdCBpcyBpbiBwbGFjZSBiZWZvcmUKPiBzYmlfZG9tYWluX2ZpbmFsaXplKCkuIFRoZSByZWdp
b24gc29ydHMgYmVmb3JlIHRoZSBhbGxvdy1ldmVyeXRoaW5nCj4gcmVnaW9uLCBzbyBpdCBnZXRz
IGEgbG93ZXIgUE1QIGVudHJ5IGluZGV4IGFuZCBkZW5pZXMgUy9VLW1vZGUgYWNjZXNzCj4gdG8g
dGhlIGZpcm13YXJlIGFsaWFzLiBUaGUgcmVzdCBvZiB0aGUgYWxpYXMgd2luZG93IGlzIGxlZnQg
dW50b3VjaGVkLgo+Cj4gVGhpcyBmb2xsb3dzIHRoZSBzYW1lIGFwcHJvYWNoIGFzIHRoZSBSWi9G
aXZlIElMTS9ETE0gcHJvdGVjdGlvbi4KPgo+IFZlcmlmaWVkIG9uIFFFTVUgcmlzY3Y2NCAocm9v
dCByZWdpb24gbGlzdCBhbmQgUE1QIGVuY29kaW5ncykgYW5kIG9uIGEKPiBWaXNpb25GaXZlIDIg
Ym9hcmQ6IFMvVS1tb2RlIGFjY2Vzc2VzIHRvIGJvdGggdGhlIGFsaWFzICgweDI0MDAwMDAwMCkK
PiBhbmQgdGhlIGZpcm13YXJlIHJlZ2lvbiAoMHg0MDAwMDAwMCkgZmF1bHQgYXMgZXhwZWN0ZWQg
YWZ0ZXIgdGhpcwo+IHBhdGNoLCB3aGlsZSBub3JtYWwgYm9vdCBpcyB1bmFmZmVjdGVkLgo+Cj4g
UmVwb3J0ZWQtYnk6IFpob25neWkgQ2hlbmcgPHpob25neWljaGVuZzI0MUBtYWlscy51Y2FzLmFj
LmNuPgo+IFNpZ25lZC1vZmYtYnk6IFpob25neWkgQ2hlbmcgPHpob25neWljaGVuZzI0MUBtYWls
cy51Y2FzLmFjLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8u
CgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBwbGF0Zm9ybS9nZW5lcmljL3N0YXJmaXZlL2poNzEx
MC5jIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9zdGFy
Zml2ZS9qaDcxMTAuYyBiL3BsYXRmb3JtL2dlbmVyaWMvc3RhcmZpdmUvamg3MTEwLmMKPiBpbmRl
eCA3MDA4Mzg2YS4uMDdmYmVkNWUgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9zdGFy
Zml2ZS9qaDcxMTAuYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvc3RhcmZpdmUvamg3MTEwLmMK
PiBAQCAtMTAsOSArMTAsMTIgQEAKPgo+ICAjaW5jbHVkZSA8bGliZmR0Lmg+Cj4gICNpbmNsdWRl
IDxwbGF0Zm9ybV9vdmVycmlkZS5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9kb21haW4uaD4KPiAg
I2luY2x1ZGUgPHNiaS9zYmlfZXJyb3IuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfYml0b3BzLmg+
Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2hhcnQuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfbWF0aC5o
Pgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9zY3JhdGNoLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX3N5
c3RlbS5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9jb25zb2xlLmg+Cj4gICNpbmNsdWRlIDxzYmkv
c2JpX3RpbWVyLmg+Cj4gQEAgLTY5LDYgKzcyLDEzIEBAIHN0YXRpYyB1MzIgc2VsZWN0ZWRfaGFy
dGlkID0gLTE7Cj4KPiAgI2RlZmluZSBJMkNfQVBCX0NMS19FTkFCTEVfQklUICAgICAgICAgQklU
KDMxKQo+Cj4gKy8qCj4gKyAqIFBoeXNpY2FsIGFkZHJlc3NlcyBiZXlvbmQgdGhlIDhHQiBERFIg
d2luZG93IGZvbGQgYmFjayBpbnRvIERSQU0gb24KPiArICogdGhlIEpINzExMCBERFIgY29udHJv
bGxlcjogUEEgKFggKyBKSDcxMTBfRFJBTV9BTElBU19PRkZTRVQpIHJlc29sdmVzCj4gKyAqIHRv
IHRoZSBzYW1lIGNlbGxzIGFzIFBBIFggKGZvciBYIGluIHRoZSBERFIgd2luZG93KS4KPiArICov
Cj4gKyNkZWZpbmUgSkg3MTEwX0RSQU1fQUxJQVNfT0ZGU0VUICAgICAgIDB4MjAwMDAwMDAwVUwK
PiArCj4gIHN0YXRpYyBpbnQgcG1fc3lzdGVtX3Jlc2V0X2NoZWNrKHUzMiB0eXBlLCB1MzIgcmVh
c29uKQo+ICB7Cj4gICAgICAgICBzd2l0Y2ggKHR5cGUpIHsKPiBAQCAtMjgzLDYgKzI5MywzMyBA
QCBlcnI6Cj4gICAgICAgICByZXR1cm4gcmM7Cj4gIH0KPgo+ICsvKgo+ICsgKiBEZW55IFMvVS1t
b2RlIGFjY2VzcyB0byB0aGUgYWxpYXMgb2YgdGhpcyBmaXJtd2FyZSBpbWFnZS4KPiArICoKPiAr
ICogUE1QIGVudHJpZXMgbWF0Y2ggdGhlIHByZXNlbnRlZCBhZGRyZXNzLCBzbyB3aXRob3V0IGV4
dHJhIHByb3RlY3Rpb24KPiArICogYW4gUy9VLW1vZGUgYWNjZXNzIHRocm91Z2ggdGhlIGFsaWFz
IHdpbmRvdyBieXBhc3NlcyB0aGUgZW50cnkKPiArICogcHJvdGVjdGluZyB0aGUgZmlybXdhcmUg
YW5kIG1hdGNoZXMgdGhlIGFsbG93LWV2ZXJ5dGhpbmcgcm9vdCByZWdpb24uCj4gKyAqIEFkZCBh
IHJvb3QgZG9tYWluIHJlZ2lvbiBjb3ZlcmluZyBmaXJtd2FyZV9hbGlhc19iYXNlIC4uIGZ3X2Vu
ZCBzbwo+ICsgKiB0aGF0IGl0IHNvcnRzIGJlZm9yZSB0aGUgYWxsb3ctZXZlcnl0aGluZyByZWdp
b24gYW5kIGRlbmllcyBTL1UtbW9kZQo+ICsgKiBhY2Nlc3MgdG8gdGhlIGZpcm13YXJlIGFsaWFz
LCB3aGlsZSBsZWF2aW5nIHRoZSByZXN0IG9mIHRoZSBhbGlhcwo+ICsgKiB3aW5kb3cgdW50b3Vj
aGVkLgo+ICsgKi8KPiArc3RhdGljIGludCBzdGFyZml2ZV9qaDcxMTBfZWFybHlfaW5pdChib29s
IGNvbGRfYm9vdCkKPiArewo+ICsgICAgICAgc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoID0g
c2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCk7Cj4gKyAgICAgICBpbnQgcmM7Cj4gKwo+ICsgICAg
ICAgcmMgPSBnZW5lcmljX2Vhcmx5X2luaXQoY29sZF9ib290KTsKPiArICAgICAgIGlmIChyYyB8
fCAhY29sZF9ib290KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgICAg
cmV0dXJuIHNiaV9kb21haW5fcm9vdF9hZGRfbWVtcmFuZ2UoCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgc2NyYXRjaC0+Zndfc3RhcnQgKyBKSDcxMTBfRFJBTV9BTElBU19PRkZTRVQsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgc2NyYXRjaC0+Zndfc2l6ZSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAxVUwgPDwgbG9nMnJvdW5kdXAoc2NyYXRjaC0+Zndfc2l6ZSksCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9SV1gpOwo+ICt9Cj4gKwo+ICBz
dGF0aWMgaW50IHN0YXJmaXZlX2poNzExMF9maW5hbF9pbml0KGJvb2wgY29sZF9ib290KQo+ICB7
Cj4gICAgICAgICBpZiAoY29sZF9ib290KSB7Cj4gQEAgLTMxNiw2ICszNTMsNyBAQCBzdGF0aWMg
aW50IHN0YXJmaXZlX2poNzExMF9wbGF0Zm9ybV9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5v
ZGVvZmYsCj4gICAgICAgICB9Cj4KPiAgICAgICAgIGdlbmVyaWNfcGxhdGZvcm1fb3BzLmNvbGRf
Ym9vdF9hbGxvd2VkID0gc3RhcmZpdmVfamg3MTEwX2NvbGRfYm9vdF9hbGxvd2VkOwo+ICsgICAg
ICAgZ2VuZXJpY19wbGF0Zm9ybV9vcHMuZWFybHlfaW5pdCA9IHN0YXJmaXZlX2poNzExMF9lYXJs
eV9pbml0Owo+ICAgICAgICAgZ2VuZXJpY19wbGF0Zm9ybV9vcHMuZmluYWxfaW5pdCA9IHN0YXJm
aXZlX2poNzExMF9maW5hbF9pbml0Owo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAtLQo+IDIuNTQu
MAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
