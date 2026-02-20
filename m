Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962D0C53213
	for <opensbi@archiver.kernel.org>; Fri, 20 Feb 2026 05:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CL7whO/uR5c5fsgq3zJxDxVS8KUZnlAlebzJpMp1cmU=; b=FS5gQh4fkFIQyV
	CegXa9DDgOCfToydGcbtEWhZUtpnU5jGB9Qcxz2FjmuOePuVAAgP4DFgNYpTjQDC0Spph6J6bAhBj
	XeuXoYqmeYS2IlPzqV3CCqOJJpqcY2Lr0ekf9uamfMljzEByJsac6CWS/cJYupiqllKSuKpJqwmYd
	j6Fh7vy50LMegzXq8Foad0mD281plj2jtZbsYg0F44fqVZg6z0Z2c3+HXcM+nWLOEllkhBpkzYhEu
	ahtlw40J6h/e36Ljwa4bPsilCI8pgau7JBbVdVq3b1t3qEtOigraa5DuN2wqvHKONxRo3DI0FxY9X
	6Clfus7BPjRWV7IAX4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtIzi-0000000DHUF-06vu;
	Fri, 20 Feb 2026 05:24:02 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtIzf-0000000DHTn-17D1
	for opensbi@lists.infradead.org;
	Fri, 20 Feb 2026 05:24:00 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7d18d02af68so1147696a34.2
        for <opensbi@lists.infradead.org>; Thu, 19 Feb 2026 21:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771565037; cv=none;
        d=google.com; s=arc-20240605;
        b=MNE/raYSH8vO5BCedsosmITFB8LiTOKGyHV89QrKASQy2BpiZ6s21CrNSbnI7yYUP2
         8OeyJ6+VgN+WhBZtx6eAD9J3IH+lyYKRo/wMPn5imOVvIh/nJXdr9C5nLCeYyhz9U3vK
         nYBtIvi5WHfoA9EBG3/F57I7+YC1kmI+78DvQnIuXtVdwKGr1Gx5fPFBUxKlRpgWB3GO
         nlBhoMsYj0Jri27DpCalhnU50nkHnugWxkURy3va34eTSvl0VKEGk4Mb40ekbB9Nfm3S
         swmMbDQZQmsHhXIN7OwfqG1G4rYJ07xfRNjo2tsub0zliYor0mGIyJBL5qG2/FEYFt9+
         rgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YcImLZE94GgQM0GflOYjZh7faatbO1TU3SmiVT0QqUU=;
        fh=Fohf9eX2rjsi6AJGJK5dqrRE9c+cx5SCcu03oShE1+k=;
        b=gKiPIK45JoeW1kRrtkemJWA8j4rnBwRnEnZLFTZAayhflyvpby7E3Cl74Wo/VXxhEy
         LG4CONFs2kVZnip+iygrvVJ7cf2SO5X6BAtRDB4MtpCUad6DSOQLFd8Lz1kXBtoky6Ak
         lJjXBN6Uw8xJ9LTzBNzaq2ohpPw1tv+ZXH25bF6zRzZtej5BfT0pGGEpNJSdljs893M0
         RkpwDkMm9xdUFLpJAl/PQ1YAHeD8fG7BLCDSmE1jaNy/s7dG2Ayh05L2nwM8HQIiDSmg
         Mvw1yHIF+5X/Heh3uT6FuMOpP1OxbNKbtJurIobDUqwxxQ+T6phbXUOJ+IS7b9I8Ikeh
         AnNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1771565037; x=1772169837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcImLZE94GgQM0GflOYjZh7faatbO1TU3SmiVT0QqUU=;
        b=ueIpXKGoIg/LgkdSwOVf+OkF2jp9kzk5iF2a5AYbQoEnYordSF0g8Msm3yRB5UVSuy
         VFmhFbBULxpN0o3L70AYL15jAUSGEe5ZLWVekLSn/KHH0UszjjF9HIEEywsEhMmQ61ns
         PM85vZKZVq3bnxdcwpwKM0fcIlda8u5AlL+QMV2Kmu1Nxfa0TU5S3mogxjXUc4sWbw3o
         mkVW4TbpFNnegp+F1MHhdv45h5gE2j7d5up+FS0dEILbDxwsgfU44Nd+rFH0bkk4fAkj
         Rpnoucu4JipgkkmjFQuI5AM0KmZFH6LcXVnt4lRlo6YWgOCuDwS9cKf3mCR3/MtOrPhx
         FXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771565037; x=1772169837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YcImLZE94GgQM0GflOYjZh7faatbO1TU3SmiVT0QqUU=;
        b=iJq/yNG/YsAPqcjZgKIZchbLPkmiuNqryqXbqAAvanrZbq3MPgIxo2JrbbKtOeF2Ck
         6K+Qs99OcmSM2n1K1REscGQk8Hl7//O5KIQ0AMl4/G6cxT+dqMi/yOVmcwznRByYFIPH
         QWBbtkrT7VNPoB3OnR1fxOA7GYtGmQwaBokRFD5Or0muDEZwrHwLpP4CpwKpnvdVzLuU
         lw4e6ej+KoHLZ3j1qFmpNrBsnlD8sqsq6ipclhICwkeKV/dN7D8suWJwkmTKlbRC0Pja
         QAqIrh34RN3EnqdPagXcW3Y/POzXP26fYyIB4D0GrytCj6OxisLC0Hqqf6n81vfmdm/d
         KZ4g==
X-Gm-Message-State: AOJu0YzPcRBwKCSKTy5H8LxvsH8JQNxMyfxbXQaNMRCCeOcteDoHW+Nv
	/DOUYyV8TJn6AGLtAX5AW5Qi49erVYtmnYJtaOVMwiI65bTQTajeLKAX2H/vEGshRyY2f/+XN/d
	nKvfvXzmuAuU1U2OTIY9e86FWeDrAllbNRU7GOVA0VA==
X-Gm-Gg: AZuq6aKeD3+McnGjB+HUSmuW0Oowj+jzbJvcNl763+HOx6IfP+nooUND7vx8l2Lvol9
	M5Vjy75Mmfvn32x4+V4UabpNZD3YhkIcGTSNA/8rkYQwvuHLaMpWZxc6ZDPG+/57nCVAdoRr3XN
	2xBxwwNOnODL0FFtuivAq6PlHIYHug3cHBHBOC1FnGnr4EeSnVcjnH6Xh1Oq00jyri5ITq7GID+
	Yhi3aP/iYa2zxkFy/rxd05xYhlheZNvoETWhjIGJN/Tn2N/+oGg4n5vsvc/4NCkvq7Aiul/szFZ
	273FPbPY7HBVQZhULeUGCI4s4WdMXjHm5dTd57ghJoGLIPO0t2LvZLUQwyKUmH+8Tvdo8yZW2a7
	BEPLpyw==
X-Received: by 2002:a05:6820:f004:b0:662:fd69:e0d4 with SMTP id
 006d021491bc7-679bd33de76mr318029eaf.70.1771565037373; Thu, 19 Feb 2026
 21:23:57 -0800 (PST)
MIME-Version: 1.0
References: <20260104063742.148141-1-wxjstz@126.com>
In-Reply-To: <20260104063742.148141-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Feb 2026 10:53:46 +0530
X-Gm-Features: AaiRm50lQT7K2VsQRSXb424fNXoRTMpVlhZufc_cdFpsFvJjaa0ZeF29tkCNZL4
Message-ID: <CAAhSdy3hSSBjhTtkFwgOTAOF6Z0KC5rrghm4_fEqefyjcxO8jw@mail.gmail.com>
Subject: Re: [PATCH] firmware: generate __stack_chk_guard at compile time
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org, Xiang W <wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_212359_582204_68D83CFC 
X-CRM114-Status: GOOD (  12.68  )
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

T24gU3VuLCBKYW4gNCwgMjAyNiBhdCAxMjowOOKAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IFJlcGxhY2UgMHg5NUI1RkY1QSB3aXRoIGEgcmFuZG9tIG51bWJlciBnZW5l
cmF0ZWQgYnkgUHl0aG9uIGR1cmluZwo+IGNvbXBpbGF0aW9uIGFzIHRoZSBfX3N0YWNrX2Noa19n
dWFyZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW5nIFcgPHdhbmd4aWFuZ0Bpc2Nhcy5hYy5jbj4K
CldlIGFyZSB0cnlpbmcgdG8gc3VwcG9ydCByZXByb2R1Y2libGUgYnVpbGRzIFsxXSBmb3IgT3Bl
blNCSQpmaXJtd2FyZXMuIFRoaXMgcGF0Y2ggYnJlYWtzIHJlcHJvZHVjaWJsZSBidWlsZHMuCgpS
ZWdhcmRzLApBbnVwCgpbMV0gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvUmVwcm9kdWNp
YmxlX2J1aWxkcwoKPiAtLS0KPiAgZmlybXdhcmUvZndfYmFzZS5TICAgICAgICAgICAgfCAyICst
Cj4gIGZpcm13YXJlL29iamVjdHMubWsgICAgICAgICAgIHwgNyArKysrKysrCj4gIGZpcm13YXJl
L3BheWxvYWRzL3Rlc3RfaGVhZC5TIHwgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9maXJtd2FyZS9md19iYXNl
LlMgYi9maXJtd2FyZS9md19iYXNlLlMKPiBpbmRleCA2M2JiNDQ3My4uMDQwZmJkMmIgMTAwNjQ0
Cj4gLS0tIGEvZmlybXdhcmUvZndfYmFzZS5TCj4gKysrIGIvZmlybXdhcmUvZndfYmFzZS5TCj4g
QEAgLTc3OSw3ICs3NzksNyBAQCBfX3N0YWNrX2Noa19mYWlsOgo+ICAgICAgICAgLmdsb2JsIF9f
c3RhY2tfY2hrX2d1YXJkCj4gICAgICAgICAudHlwZSBfX3N0YWNrX2Noa19ndWFyZCwgJW9iamVj
dAo+ICBfX3N0YWNrX2Noa19ndWFyZDoKPiAtICAgICAgIFJJU0NWX1BUUiAgICAgICAweDk1QjVG
RjVBCj4gKyAgICAgICBSSVNDVl9QVFIgICAgICAgU1RBQ0tfQ0hLX0dVQVJECj4KPiAgI2lmZGVm
IEZXX0ZEVF9QQVRICj4gICAgICAgICAuc2VjdGlvbiAucm9kYXRhCj4gZGlmZiAtLWdpdCBhL2Zp
cm13YXJlL29iamVjdHMubWsgYi9maXJtd2FyZS9vYmplY3RzLm1rCj4gaW5kZXggYmZlYzQ2NzEu
LmM0ZGFkOWJhIDEwMDY0NAo+IC0tLSBhL2Zpcm13YXJlL29iamVjdHMubWsKPiArKysgYi9maXJt
d2FyZS9vYmplY3RzLm1rCj4gQEAgLTc1LDMgKzc1LDEwIEBAIGVsc2UKPiAgc3RhY2stcHJvdGVj
dG9yLWNmbGFncy15IDo9IC1mbm8tc3RhY2stcHJvdGVjdG9yCj4gIGVuZGlmCj4gIGZpcm13YXJl
LWNmbGFncy15ICs9ICQoc3RhY2stcHJvdGVjdG9yLWNmbGFncy15KQo+ICsKPiAraWZlcSAoJChQ
TEFURk9STV9SSVNDVl9YTEVOKSwzMikKPiArU1RBQ0tfQ0hLX0dVQVJEIDo9ICQoc2hlbGwgcHl0
aG9uMyAtYyAnaW1wb3J0IHJhbmRvbTsgcHJpbnQocmFuZG9tLnJhbmRpbnQoMSwgMHhmZmZmZmZm
ZikpJykKPiArZWxzZQo+ICtTVEFDS19DSEtfR1VBUkQgOj0gJChzaGVsbCBweXRob24zIC1jICdp
bXBvcnQgcmFuZG9tOyBwcmludChyYW5kb20ucmFuZGludCgxLCAweGZmZmZmZmZmZmZmZmZmZmYp
KScpCj4gK2VuZGlmCj4gK2Zpcm13YXJlLWdlbmZsYWdzLXkgKz0gLURTVEFDS19DSEtfR1VBUkQ9
JChTVEFDS19DSEtfR1VBUkQpCj4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL3BheWxvYWRzL3Rlc3Rf
aGVhZC5TIGIvZmlybXdhcmUvcGF5bG9hZHMvdGVzdF9oZWFkLlMKPiBpbmRleCA5YTg3ZTU2Zi4u
ZmRjMWRlYjkgMTAwNjQ0Cj4gLS0tIGEvZmlybXdhcmUvcGF5bG9hZHMvdGVzdF9oZWFkLlMKPiAr
KysgYi9maXJtd2FyZS9wYXlsb2Fkcy90ZXN0X2hlYWQuUwo+IEBAIC0xMTEsNCArMTExLDQgQEAg
X2Jvb3RfYTE6Cj4gICAgICAgICAuZ2xvYmwgX19zdGFja19jaGtfZ3VhcmQKPiAgICAgICAgIC50
eXBlIF9fc3RhY2tfY2hrX2d1YXJkLCAlb2JqZWN0Cj4gIF9fc3RhY2tfY2hrX2d1YXJkOgo+IC0g
ICAgICAgUklTQ1ZfUFRSICAgICAgIDB4OTVCNUZGNUEKPiArICAgICAgIFJJU0NWX1BUUiAgICAg
ICBTVEFDS19DSEtfR1VBUkQKPiAtLQo+IDIuNDcuMwo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
