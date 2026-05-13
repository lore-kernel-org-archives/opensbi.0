Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945EECD4F3D
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFLlCstSi28bux+EdREDZA9ePaR2F1cqvOenkZpXAsM=; b=SRGsFC/csYYZmc
	2Z5rcXjOle36lEc7MOzxBSRFNwmUsJBh5kcWhmDSFmdiWPGux/jWdW1N2upystDHsOAwu5/758qY+
	pZ2SvbZFVepMcqkuq258bqxzFA8yr7HegDzB7nVGI/yAoKfMqchha4gnbn1FAqZL+lou4xGwqmAxh
	HvqsQTlGB6yZnzcSz92TRqk1Dng2/+1PbM+hJhslS+s6gjECG75jJPGtfzRnXukFGTJk0YkBk6+Ky
	e8tFtoFz0DbZ8qUN5Gi/9iai6HeuH+1R6lpSmaSr7HwJ+MdPnM5hCO8mSh0iXXxIWhJat+4wTTiQU
	ZN9yly5FQGkYpnftaf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4QK-00000001eYd-0XZp;
	Wed, 13 May 2026 07:54:32 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4QH-00000001eYH-22a7
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 07:54:30 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7de431da8fbso5161283a34.1
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 00:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778658868; cv=none;
        d=google.com; s=arc-20240605;
        b=Ww3wmWB7HaVufn0tVGW9I6q2mR3TKhCoGQ8P54Ya5sJCalmCUJQ0vJYN0nTm9hLtbr
         K3Mcod5xGBP/kNUIUWyJg/YlP2P4WTPMVwqgbGRPow/G5wH5fTxjk6KaVFnSBLbx+TgW
         /FnpKh6c27pivPyQIoTmGvBeS5i94PaP9V8MGpv7wFpfC3Uqiqm0ab3WY6dNxACh0ZPE
         faILba/j6LNk/08b1+qzINTxlb7Zynv1ILWKHNZd0Uq/kudYVvCSJaila8gnAb7dxQS7
         BeC4KakLHDYLCMOc2EZnXZaecCeDCie277stRuL2Bd91Ht0wNdxjb4WCZxfO4qfnTpss
         RoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLyFeXfOEvzq/U3o/qVVJkE3KazZ9TmQ2ugfkJRztf4=;
        fh=Pqj7HP85rjHfX/WUuMCRQkQZuVcVmDsjIgImfVJ1crQ=;
        b=UINhYS//5c4sTuKphTba0fbmiKjJqhZq8dI0uYG3RnWy2gFkLrexw4QyCVGhaP6KVE
         P9GmJmZkMLbG/7W+0ti5e7Cs8ugj1hk6iOwh4A9yI1QR5m/rINR4NDle70nvuTY+cl81
         ef5y38JIhnQ7fQWWpolICVSSoORyQdzL5SODXxXYNX35rBo2KQGO9BArAwyEFU4aZFpG
         8xl/3ez1XvecGNlu6v37f+2rbUNRnWaQwUtV0NyaAYGXYLkTyNkw7DSMiHl/w/1an9Tb
         nutic0nJJQQzbHY40ZXBOg1HwRWid2v27HfQaSWDbqCNZuazpZpceCFmbnHEVl6j5/zR
         rbFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778658868; x=1779263668; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLyFeXfOEvzq/U3o/qVVJkE3KazZ9TmQ2ugfkJRztf4=;
        b=uFtpIVHbq5RmIpSewazy0pOH/QoovKpAKUY8/z6widcR/TkR6+sSqQCK+/ycv2d3Ki
         2Z5seKYuonrGT35XQu8rqfqcq7pmzzvKzi4Y7wBBt+JQm65V0F6obRKld2THGFoJphx8
         RcElRkLKXSE1VLLrLTMHvcUHZHLeP0IdmgOtbnodCDA8HzlLruICvONB99NJH7LAWEMf
         DoTLzI7HYMKbGbChbfwUierDCQ2XLWGTlROTDUuzvlhmww6Phumpvml1z6Tzvbk/xKYz
         KdgCEhyk0+9Ig/ab2hvr32tCrbc7/OQe2puhpqDTHTquDPiX4ix4e5fmFEHlxXPoHhak
         g87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778658868; x=1779263668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TLyFeXfOEvzq/U3o/qVVJkE3KazZ9TmQ2ugfkJRztf4=;
        b=Zz5EGusPlLbcD8pf/jTMIYMDn+t+BvWUOdEPHQ35l9cmY1yIXQ/n4ADEU/+mV97HJA
         3zCo6lveq8tETLI1r37bxd+Go3lWyzk7eZhEXlysq61g1dFaDZPPnxfwJDiFeSSCT5Sn
         tmSoEd31MVJ4mPOCUFqpAGzNDHTApjkvX4zn7X/CYZQyVNv772BZm3BIpxKNumHuX06T
         SHA+0RVbsIXPWI6wzyOqMxuzmlSiyrP2eOqWk0ZK9OAQgWIEsLoiKvBSZXNSdTbqvzIw
         4YNV5GOiXbwfIVuaLQtgojJaMHHQSvrRuRphLdP8Wx4pxAWSu3USqd3dtIsw1xjM1gO1
         J40A==
X-Forwarded-Encrypted: i=1; AFNElJ/m3kNnJnBdPkARnstPmbseKEw9EofYg4v7GtclryYKRnRRp+M0btuOd66jElyaKx2dGXzGhroO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Lt47qa9Yd7Q3wS8owzodw53NZfF8yzULM7pqLzrVlTvpl814
	HObJ2v78fWQvZ7C+NN/70SktuffbTV7P9qTq6M/c03mf6f5fGNWC/S4qB7byuFsk8MfFrtE1Ieb
	PDPZhh352X2zEKqEoJcCMbUVY8MB0+M+2PcpU1k9hXw==
X-Gm-Gg: Acq92OGenZCUb/s9DTd4wmzY0rOy1dE5uPmznqU7uR+MYzqBXPmgCsnr38L43Rx9hd2
	KpmZqwHk/BsygMQdrjYjMAjd4ehJPxGRrs+Px/Q8+pMkCfVOVGz1ADoeCy3cUwhhLD0TVKwG8tF
	Kg1fLB/W02u+xPswvnEE2FZRnSAZhVv8VuseIm3M2rexf4woUbi5XNdu6Mk1wGUfqscPIzd8Hzr
	BO1NcD72c8oCRVjJcsUGV4KM3lqjjqC7P84A6vfYno6GdFlH6bNifRtnfnG+3xOkSckDFuvsJZD
	d+G1bPRAQqZEim6u7bmgNtyaDRdPIyR0N7c0qTjhs6sgHlltpQs0e+Gb16H+bn+IS433hxnPfn5
	2c/GM9BhgxmeuHaaX7d5d0beycA==
X-Received: by 2002:a4a:ee06:0:b0:694:914f:c18f with SMTP id
 006d021491bc7-69b78cc52ddmr1210940eaf.3.1778658868257; Wed, 13 May 2026
 00:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260513071418.50957-1-dave.patel@riscstar.com> <20260513071418.50957-4-dave.patel@riscstar.com>
In-Reply-To: <20260513071418.50957-4-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 May 2026 13:24:15 +0530
X-Gm-Features: AVHnY4KmobXFvWPxCKc2BkJDGHMNfKaSpBG5NRBxQtQOmSsn59Xeokz0qo2zjm4
Message-ID: <CAAhSdy2M2kxyLD6+JFDmsN5-vr6FtZy-B0mSXk45AusgGs8dyw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] lib: sbi: domain FP/Vector context support for
 context switch
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_005429_539810_46DECDF1 
X-CRM114-Status: GOOD (  26.14  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMTI6NDTigK9QTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+
Cj4KPiBUaGlzIHBhdGNoIGFkZHMgcHJvcGVyIHN1cHBvcnQgZm9yIHBlci1kb21haW4gZmxvYXRp
bmctcG9pbnQgKEZQKSBhbmQKPiB2ZWN0b3IgKFYpIGNvbnRleHRzIGluIHRoZSBkb21haW4gY29u
dGV4dCBzd2l0Y2ggbG9naWMuIEVhY2ggZG9tYWluCj4gbm93IG1haW50YWlucyBpdHMgb3duIEZQ
IGFuZCB2ZWN0b3Igc3RhdGUsIHdoaWNoIGlzIHNhdmVkIGFuZCByZXN0b3JlZAo+IGR1cmluZyBk
b21haW4gc3dpdGNoZXMuCj4KPiBDaGFuZ2VzIGluY2x1ZGU6Cj4KPiAtIEFkZGVkIGBmcF9jdHhg
IGFuZCBgdmVjX2N0eGAgbWVtYmVycyB0byBgc3RydWN0IGhhcnRfY29udGV4dGAuCj4gLSBJbnRy
b2R1Y2VkIGR5bmFtaWMgdmVjdG9yIHN0cnVjdCBhbGxvY2F0aW9uIGZvciB2bGVuYiBpbiAnc3Ry
dWN0IGhhcnRfY29udGV4dCcKPiAgIHRvIGFsbG9jYXRlIGFuZCBmcmVlIHBlci1kb21haW4gRlAg
YW5kIHZlY3RvciBjb250ZXh0Lgo+IC0gTW9kaWZpZWQgYHNiaV9kb21haW5fcmVnaXN0ZXIoKWAg
dG8gaW5pdGlhbGl6ZSBGUC9WZWN0b3IgY29udGV4dCBwZXIgZG9tYWluLgo+IC0gVXBkYXRlZCBg
c3dpdGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQoKWAgdG8gc2F2ZS9yZXN0b3JlIEZQIGFuZCB2
ZWN0b3IKPiAgIGNvbnRleHRzIHNhZmVseToKPiAgICAgLSBFbnN1cmVzIEZTL1ZTIGZpZWxkcyBp
biBgbXN0YXR1c2AgYXJlIGVuYWJsZWQgKHNldCB0byBJbml0aWFsKSBvbmx5IGlmIE9mZi4KPiAt
IEFkZGVkIHJ1bnRpbWUgY2hlY2tzIGZvciBGUCBhbmQgdmVjdG9yIGV4dGVuc2lvbnMgd2hlcmUg
bmVlZGVkLgo+Cj4gVGhpcyBpbXByb3ZlcyBzdXBwb3J0IGZvciBtdWx0aS1kb21haW4gc3lzdGVt
cyB3aXRoIEZQIGFuZCBWZWN0b3IKPiBleHRlbnNpb25zLCBhbmQgcHJldmVudHMgY29ycnVwdGlv
biBvZiBGUC9WZWN0b3Igc3RhdGUgZHVyaW5nIGRvbWFpbgo+IHN3aXRjaGVzLgo+Cj4gU2lnbmVk
LW9mZi1ieTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4gLS0tCj4gIGlu
Y2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgICAgfCAgMiArKwo+ICBsaWIvc2JpL3NiaV9kb21haW5f
Y29udGV4dC5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDMwIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlf
ZG9tYWluLmggYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBpbmRleCA4ODJiNjJjMi4uMDVh
NWQ4NmMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gKysrIGIvaW5j
bHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gQEAgLTE2LDYgKzE2LDggQEAKPiAgI2luY2x1ZGUgPHNi
aS9zYmlfaGFydG1hc2suaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluX2NvbnRleHQuaD4K
PiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluX2RhdGEuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlf
dmVjdG9yLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2ZwLmg+Cj4KPiAgc3RydWN0IHNiaV9zY3Jh
dGNoOwo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgYi9saWIv
c2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4gaW5kZXggMTU4ZjQ5OTAuLjVlMTgwNjk4IDEwMDY0
NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiArKysgYi9saWIvc2JpL3Ni
aV9kb21haW5fY29udGV4dC5jCj4gQEAgLTE4LDYgKzE4LDkgQEAKPiAgI2luY2x1ZGUgPHNiaS9z
YmlfZG9tYWluX2NvbnRleHQuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfcGxhdGZvcm0uaD4KPiAg
I2luY2x1ZGUgPHNiaS9zYmlfdHJhcC5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV92ZWN0b3IuaD4K
PiArI2luY2x1ZGUgPHNiaS9zYmlfZnAuaD4KPiArCj4KPiAgLyoqIENvbnRleHQgcmVwcmVzZW50
YXRpb24gZm9yIGEgaGFydCB3aXRoaW4gYSBkb21haW4gKi8KPiAgc3RydWN0IGhhcnRfY29udGV4
dCB7Cj4gQEAgLTU1LDYgKzU4LDExIEBAIHN0cnVjdCBoYXJ0X2NvbnRleHQgewo+ICAgICAgICAg
c3RydWN0IGhhcnRfY29udGV4dCAqcHJldl9jdHg7Cj4gICAgICAgICAvKiogSXMgY29udGV4dCBp
bml0aWFsaXplZCBhbmQgcnVubmFibGUgKi8KPiAgICAgICAgIGJvb2wgaW5pdGlhbGl6ZWQ7Cj4g
Kwo+ICsgICAgICAgLyoqIGZsb2F0IGNvbnRleHQgc3RhdGUgKi8KPiArICAgICAgIHN0cnVjdCBz
YmlfZnBfY29udGV4dCBmcF9jdHg7Cj4gKyAgICAgICAvKiogdmVjdG9yIGNvbnRleHQgc3RhdGUg
Ki8KPiArICAgICAgIHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKnZlY19jdHg7Cj4gIH07Cj4K
PiAgc3RhdGljIHN0cnVjdCBzYmlfZG9tYWluX2RhdGEgZGNwcml2Owo+IEBAIC0xNDMsNiArMTUx
LDE1IEBAIHN0YXRpYyBpbnQgc3dpdGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQoc3RydWN0IGhh
cnRfY29udGV4dCAqY3R4LAo+ICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2Ny
YXRjaCwgU0JJX0hBUlRfRVhUX1NTUU9TSUQpKQo+ICAgICAgICAgICAgICAgICBjdHgtPnNybWNm
ZyAgICAgPSBjc3Jfc3dhcChDU1JfU1JNQ0ZHLCBkb21fY3R4LT5zcm1jZmcpOwo+Cj4gKyAgICAg
ICAvKiBNYWtlIHN1cmUgRlMgYW5kIFZTIGlzIG9uIGJlZm9yZSBjb250ZXh0IHN3aXRjaCAqLwo+
ICsgICAgICAgY3NyX3NldChDU1JfTVNUQVRVUywgTVNUQVRVU19GUyB8IE1TVEFUVVNfVlMpOwo+
ICsKPiArICAgICAgIC8qIEVhZ2VyIGNvbnRleHQgc3dpdGNoIEYgYW5kIFYgKi8KPiArICAgICAg
IHNiaV9mcF9zYXZlKCZjdHgtPmZwX2N0eCk7Cj4gKyAgICAgICBzYmlfZnBfcmVzdG9yZSgmZG9t
X2N0eC0+ZnBfY3R4KTsKPiArICAgICAgIHNiaV92ZWN0b3Jfc2F2ZShjdHgtPnZlY19jdHgpOwo+
ICsgICAgICAgc2JpX3ZlY3Rvcl9yZXN0b3JlKGRvbV9jdHgtPnZlY19jdHgpOwoKVW5jb25kaXRp
b25hbCBzYXZlL3Jlc3RvcmUgb2YgRlAgYW5kIFZlY3RvciBpcyBub3QgZ29pbmcgdG8gZmx5CmJl
Y2F1c2UgdGhlIGdlbmVyaWMgcGxhdGZvcm0gZmlybXdhcmVzIGFyZSBleHBlY3RlZCB0byB3b3Jr
Cm9uIG11bHRpcGxlIHBsYXRmb3JtcyAoYm90aCB3aXRoIG9yIHdpdGhvdXQgdmVjdG9yKS4KClRv
IGFkZHJlc3MgdGhpcywgZG8gRlAgc2F2ZS9yZXN0b3JlIG9ubHkgaWYgdW5kZXJseWluZyBoYXJ0
CmhhcyBGL0QgaGFydCBleHRlbnNpb24uIFNpbWlsYXJseSwgZG8gVmVjdG9yIHNhdmUvcmVzdG9y
ZQpvbmx5IGlmIHVuZGVybHlpbmcgaGFydCBoYXMgVmVjdG9yIGV4dGVuc2lvbi4KCkFzIGEgc2Vw
YXJhdGUgcGF0Y2gsIGludHJvZHVjZSBTQklfSEFSVF9FWFRfRiwKU0JJX0hBUlRfRVhUX0QsIGFu
ZCBTQklfSEFSVF9FWFRfViBpbgplbnVtIHNiaV9oYXJ0X2V4dGVuc2lvbnMgYW5kIHNiaV9oYXJ0
X2V4dFtdLiBPbmNlLAp0aGlzIGlzIGRvbmUgeW91IGNhbiBjaGVjayBmb3IgU0JJX0hBUlRfRVhU
X0YsClNCSV9IQVJUX0VYVF9ELCBhbmQgU0JJX0hBUlRfRVhUX1YgdXNpbmcKc2JpX2hhcnRfaGFz
X2V4dGVuc2lvbigpLgoKPiArCj4gICAgICAgICAvKiBTYXZlIGN1cnJlbnQgdHJhcCBzdGF0ZSBh
bmQgcmVzdG9yZSB0YXJnZXQgZG9tYWluJ3MgdHJhcCBzdGF0ZSAqLwo+ICAgICAgICAgdHJhcF9j
dHggPSBzYmlfdHJhcF9nZXRfY29udGV4dChzY3JhdGNoKTsKPiAgICAgICAgIHNiaV9tZW1jcHko
JmN0eC0+dHJhcF9jdHgsIHRyYXBfY3R4LCBzaXplb2YoKnRyYXBfY3R4KSk7Cj4gQEAgLTE3MCw2
ICsxODcsMTAgQEAgc3RhdGljIGludCBoYXJ0X2NvbnRleHRfaW5pdCh1MzIgaGFydGluZGV4KQo+
ICB7Cj4gICAgICAgICBzdHJ1Y3QgaGFydF9jb250ZXh0ICpjdHg7Cj4gICAgICAgICBzdHJ1Y3Qg
c2JpX2RvbWFpbiAqZG9tOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyB2bGVuYiA9IHZlY3Rvcl92
bGVuYigpOwo+ICsKPiArICAgICAgIC8qIENhbGN1bGF0ZSBzaXplOiBiYXNlIHN0cnVjdCArIDMy
IHJlZ2lzdGVycyBvZiB2bGVuYiBzaXplICovCj4gKyAgICAgICBzaXplX3QgdmVjX3NpemUgPSBz
aXplb2Yoc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCkgKyAoMzIgKiB2bGVuYik7Cj4KPiAgICAg
ICAgIHNiaV9kb21haW5fZm9yX2VhY2goZG9tKSB7Cj4gICAgICAgICAgICAgICAgIGlmICghc2Jp
X2hhcnRtYXNrX3Rlc3RfaGFydGluZGV4KGhhcnRpbmRleCwKPiBAQCAtMTgwLDYgKzIwMSwxMyBA
QCBzdGF0aWMgaW50IGhhcnRfY29udGV4dF9pbml0KHUzMiBoYXJ0aW5kZXgpCj4gICAgICAgICAg
ICAgICAgIGlmICghY3R4KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5P
TUVNOwo+Cj4gKyAgICAgICAgICAgICAgIC8qIEFsbG9jYXRlIHRoZSB2ZWN0b3IgY29udGV4dCBw
b2ludGVyICovCj4gKyAgICAgICAgICAgICAgIGN0eC0+dmVjX2N0eCA9IHNiaV96YWxsb2ModmVj
X3NpemUpOwo+ICsgICAgICAgICAgICAgICBpZiAoIWN0eC0+dmVjX2N0eCkgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHNiaV9mcmVlKGN0eCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIFNCSV9FTk9NRU07Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gICAgICAgICAgICAg
ICAgIC8qIEJpbmQgY29udGV4dCBhbmQgZG9tYWluICovCj4gICAgICAgICAgICAgICAgIGN0eC0+
ZG9tID0gZG9tOwo+ICAgICAgICAgICAgICAgICBoYXJ0X2NvbnRleHRfc2V0KGRvbSwgaGFydGlu
ZGV4LCBjdHgpOwo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QK
PiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
