Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E10BD6AAE6
	for <opensbi@archiver.kernel.org>; Thu,  2 Apr 2026 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUhNGJ2F5dhD954Uy476dONCJHDFVSMUwc8gemgtu9g=; b=gkhuyp21wYznfI
	3EfVCyROXgd0tDKHceAwCDm/fmOT8VOwGr9mBOpS/5q0InTyMU+ezA0EbYiVDZWeCLYdPe6oW/LVq
	iFJuFJX6vFPxqxkKaK+qa8/nQbdjXWhb3DABA8WCCRaWdAuhfhzzbNIIqeD1mqjoChGk/o3iSWnlf
	r4KRmHfVZM2XkjV9Xm9UffXotC7ecmGBBCbbNmkDsMOZWTn7WnOK9VtBi1LpqiN4zNWrumIBJ8fGb
	ILFspKGf61lx3qhC3p1sYhOK17BnQtQBPZGGVn6+o2Gxx5rL6qgIToJIvSKqWP3q/OqRzZbQ3jPJe
	MNYtr8fWPNh9WgYFxwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KqL-00000000VkL-41Ea;
	Thu, 02 Apr 2026 16:24:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KqI-00000000VjO-0HqG
	for opensbi@lists.infradead.org;
	Thu, 02 Apr 2026 16:24:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4UMx2922037
	for <opensbi@lists.infradead.org>; Thu, 2 Apr 2026 16:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aje96nFKenGxeNYWA4OTyyibBL/qQMLNqwsSK4P1/8g=; b=pd9qhv0W4nVZqOpP
	o+XaT1PfO+3LGsIaB9Rf7aiX5yDg7QtWwwhuZvl1QcrC7VahsvowaNQVbAVHWxT7
	Zz1uDrma3RWhTrqFOxrbECMn13Kb3TTJDtEYgmbWcJYXS6nYBvzQIeaexkeB2UqO
	c3+uDZ7wP/O8FB2aM1qYt1lCPrY0F2jtwB3CzazQJ/prCsGG9+IsDJf/4YQq66VW
	u2soAvuJjAwzhyMOQXus5l0JcxTRkMMpwa+iX8YcvsiexuTOQvF98ZO4YryIboBg
	bk29elSkJjI0SQvO3jID5lTj9PO1boChPfezA/4/evBlW2VtJDCN0vS++fdPPPF8
	zsET+g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9qw094wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 16:24:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1279caef718so1728080c88.1
        for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775147063; x=1775751863; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aje96nFKenGxeNYWA4OTyyibBL/qQMLNqwsSK4P1/8g=;
        b=BcSEfyAdv1pvWPtKtXLqsdnsoY8uljb6zt5VSR7X+o8Rmu4XiQ4N8FBwDgLign9CHl
         LfT/3SqQ9UunGpD3C65LWHZZgYKRvz03b1SysNpf0AdMPdXh76FOkK0AH7FL2b6lH0z0
         H8vuNK9TgZ6oEMpLGLkhdNT5M6YbTtHFoL471sE9PWqCteld4Z8e8uXS8K0+jNEv0rod
         6Q+1wUJw8BnPeZK7fvMbGCo5VzdyRv4YT/9alV2haZ2wHasoRIcGcNJXwgeAuXUURqJu
         yLb0G/49KYhvPIAgLWUw9WIo6S23+zjV0wiXsfN0llDjqrpXDEEFxC3H8m4+3Rz2mJCB
         ubGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775147063; x=1775751863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aje96nFKenGxeNYWA4OTyyibBL/qQMLNqwsSK4P1/8g=;
        b=G63Sa7TQJRi7vHr675JnFgr7B93Eu26CjFYuK1YAgezKC+6iJ4oMcUJVcz7fK1XkDs
         xicjsdLPwEEyMY9XdkJrHcbq6VYZDd9tUEuHipTi9x2sko0CJGvFuVlTrpmmoTDkqlRa
         K+I7N5fpBc3x3qJQOenpGJ8CDZQeYRzVJ4Z7rXQMJ7luGNNG/clVIqyPcJKbLKU6e6F4
         nHLcvcTQIAt+pUij7itR1IJAuTogiLW+Ufuhae75dxT7VZv0befakO4W+4l6MNNgdRAL
         DuhxxVqoaHOeaU+U7/j36YXSs/mxt7ENvtcIGaCHV1Fc+P6F1YUkAc8IF/YpdmMWP6Jd
         xfTw==
X-Gm-Message-State: AOJu0YwnphWlriPPs1p4fNHs35Rer9Ky+GImsguF2Y7fqVSz7dAZojTq
	wwBrZNrUa/ATYFwZPNthMu4TdrVl3XBQlai6G4VZ4FGkECIxDQQsZj7QtH4bfdvSFqkGHX39oZg
	WWAqtD6NcZeuqCGORBDIhTg9TQIvSw4ifClqbqoms3FimkRKB6N7Wih1aiQR9BRO9wg==
X-Gm-Gg: ATEYQzzdJFMBr1Ij7wHNDIWZ5bXgAuCaobjvhgBhJbcI796pwvmvSP0r3YEEApcM9Gz
	gOjOQ6gDJ1Y4eG5Bd4W9gumvgoPqXadoadIHXVZ/54CNYJ5CJEmaSQFV7WnvdpIaezqd/zU3zQD
	JFhqXKFq/lDBiUIsNJH+RGXJTdD4WbCcXCuzfWasWYRSu5ZwCfZQ860oRWmlYZ4r6w3QaHRTJfr
	sYD4XntNkgvhu7/1bOSJjtuT8TP08EFALj3JpvPAfTso6or+7e/rjdJWDiTsGnPDgp0gD0DxjdW
	UaM4qxT431M01ekKocMnEe1Nbme6619FVYaBNANcwdAOmZ8QhfJ27v10LVr5QIrXmiH/hgNPQqE
	OE/uePs8jNI9aCIFNx5GfWaZfmqEWWtE=
X-Received: by 2002:a05:7022:384b:b0:128:d6c3:9b27 with SMTP id a92af1059eb24-12be6595c75mr4110299c88.37.1775147063070;
        Thu, 02 Apr 2026 09:24:23 -0700 (PDT)
X-Received: by 2002:a05:7022:384b:b0:128:d6c3:9b27 with SMTP id a92af1059eb24-12be6595c75mr4110281c88.37.1775147062467;
        Thu, 02 Apr 2026 09:24:22 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm3849267c88.10.2026.04.02.09.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:24:22 -0700 (PDT)
Date: Thu, 2 Apr 2026 11:24:20 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>,
        Atish Patra <atish.patra@linux.dev>,
        Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>,
        opensbi <opensbi-bounces@lists.infradead.org>
Subject: Re: [PATCH] lib: sbi: Fix hw a/d updating defaults
Message-ID: <wtpswj3mvxnnfxbabm4vm74yl344bu7rixkjevcqomn6zp373b@4n54jk7mh6xu>
References: <20260401220845.190680-1-andrew.jones@oss.qualcomm.com>
 <DHIR92KV91LY.2IYTK8T6RQAJC@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DHIR92KV91LY.2IYTK8T6RQAJC@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE0NCBTYWx0ZWRfX6uGjTCLVt4BA
 0ohH+/If1mE+2FoXH/kFuBhWJexSB0fDj69yQFZnInRgRYyz82zGBhkDZFCP4ckEkjoiDxia0M4
 rfY+1zrWpyw1EB5oR3gYCHc/HPmy0l6Dr6j3fT0p1Va5ZlGiwysyrMFofno5o2GEowdS0KI/9p0
 uHGZ+fpuZ+WpBseY++NWHLIuaLixpu9IeERI8JIm0CqPHvfULIL0ut28a3CMK5/HYXOdp1BCq3K
 pXP8QbXmKcmvkipPWNdt8NkjDn7dvSUyDxQP25NcRefE7RWaUDLxtdcIONNFDiJ+doDIHdr4z9q
 O0sm0TggzzOjgvvyQ1k6QeIMuf8TdLpA33RrL0nHhulkkucpFl8Hhc00Tu/JDlq+0GrJaQ7N0Km
 biasMX73Ai3KG0Yk/NcMOcu7sHWUHttUy99X9e8NPV54UlNiP5wjYXSQZwMHCqv2DBrc6NJkoi7
 N8upGEJcM/NRECIf2mQ==
X-Authority-Analysis: v=2.4 cv=PNICOPqC c=1 sm=1 tr=0 ts=69ce9838 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SEEu8CymeSVuQ4ycUysA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 0p3eKjeMjVUXi7xroQa88hZt7excm5DS
X-Proofpoint-ORIG-GUID: 0p3eKjeMjVUXi7xroQa88hZt7excm5DS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_092427_913681_B20F5FB6 
X-CRM114-Status: GOOD (  19.23  )
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

T24gVGh1LCBBcHIgMDIsIDIwMjYgYXQgMDQ6NTY6NDNQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjYtMDQtMDFUMTc6MDg6NDUtMDU6MDAsIEFuZHJldyBKb25lcyA8YW5kcmV3
LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+Ogo+ID4gVGhlIFN2YWRlIGR0LWJpbmRpbmcgZGVzY3Jp
cHRpb24gc3RhdGVzIHRoYXQgU3ZhZHUgc2hvdWxkIG9ubHkKPiA+IGJlIGVuYWJsZWQgYXQgYm9v
dCB0aW1lIHdoZW4gb25seSBTdmFkdSBpcyBwcmVzZW50IGluIHRoZSBEVC4KPiA+IEVuc3VyZSB0
aGF0J3MgdGhlIGNhc2UuIEFsc28sIHdoZW4gb25seSBTdmFkdSBpcyBzdXBwb3J0ZWQsCj4gPiBk
aXNhYmxlIEZXRlQuUFRFX0FEX0hXX1VQREFUSU5HLCBhcyB3ZSBuZWVkIGJvdGggdG8gc3VwcG9y
dAo+ID4gdG9nZ2xpbmcuCj4gCj4gRG9lcyBTdmFkdSB3aXRob3V0IFN2YWRlIG1lYW4gdGhhdCBi
b3RoIG1lbnZjZmcuQURVRSBvciBoZW52Y2ZnLkFEVUUgYXJlCj4gcmVhZC1vbmx5IDEgKHRoZSBJ
U0EgaXMgdmFndWUgZW5vdWdoIHRvIHBlcm1pdCB0aGlzKSwgb3IgaXMgaXQganVzdCBhbgo+IGF3
a3dhcmQgd2F5IHRvIGNvbmZpZ3VyZSB0aGUgZGVmYXVsdCwgc28gSFMgbW9kZSBtdXN0IGFzc3Vt
ZSB0aGF0Cj4gaGVudmNmZy5BRFVFPTAgd2lsbCBiZSBTdmFkZT8KCkkgY291bGRuJ3QgZmluZCBh
bnl0aGluZyBpbiB0aGUgc3BlYyB0aGF0IGV4cGxpY2l0bHkgc3RhdGVzIHRoZSBBRFVFIGJpdAp3
aWxsIGJlaGF2ZSBoYXMgcmVhZC1vbmx5IG9uZSB3aGVuIG9ubHkgU3ZhZHUgaXMgc3VwcG9ydGVk
LiBJZiB0aGUgc3BlYwphdCBsZWFzdCBjbGFpbWVkIHRoYXQgdGhlIEFEVUUgZmllbGQgd2FzIFdB
UkwgdGhlbiB3ZSBtaWdodCBpbmZlciB0aGF0LApidXQgaXQgZG9lc24ndCBldmVuIHNheSB0aGF0
LgoKPiAKPiBTdmFkZSBpcyBtYW5kYXRvcnkgaW4gUlZBIHByb2ZpbGVzLCBzbyB0aGUgY29ybmVy
LWNhc2UgY2FzZSBpdCBub3QKPiBhbnl0aGluZyBJIGV4cGVjdCB0byBzZWUuLi4KClllcywgSSBl
eHBlY3QgaWYgU3ZhZHUtb25seSBoYXJ0cyBhcmUgYnVpbHQgdGhhdCB0aGV5IGxpa2VseSB3aWxs
IG1ha2UKQURVRSByZWFkLW9ubHkgMSwgc28gSSBkb24ndCBleHBlY3QgdG8gc2VlIHByb2JsZW1z
IHdpdGgganVzdAp1bmNvbmRpdGlvbmFsbHkgc2V0dGluZyB0aGUgYml0IHRvIDEsIGFzIHdlIGRv
IGhlcmUgKGFuZCBzaG91bGQgc2V0CmhlbnZjZmcuQURVRSBpbiBLVk0gYXMgd2VsbCkuCgo+IAo+
IFJldmlld2VkLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJhZGltLmtyY21hckBvc3MucXVhbGNvbW0u
Y29tPgoKVGhhbmtzIQoKZHJldwoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
