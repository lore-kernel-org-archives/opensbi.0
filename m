Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B933CC6B1A
	for <opensbi@archiver.kernel.org>; Tue, 13 Oct 2026 19:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6LjKaXz2bsLAgKK3Khbx4dJ9b6NaVyTmuPGjdSe0yg=; b=ZQl1+/jcRZXMqK
	WlPYF/GTGE6h1TfExbON6AjrOi7Fw9EMiYiDxxhYmV3up2kiEcs6hdQsl2cPyhkIFxogWeMMTcJR9
	5Evr6S9TBkvWZgjl9utEHh9cHesP+mBULpV7n1ZHlbKmJg0llxZzoKqXqnGSMjKGTllhh2dJ89Juz
	plR1rW4fDOpUQKqiVNNUscGZM19qR2Cm16l/CeeWZrlOkquo5rEab5pgq5+frjTjZnpPUO8RqJoln
	lThCS7og2XsyP9JlEG+CN5pqW/p1MveFels5ml5lIt8UNFNIZS9fl30SYUgUo2Co+Ip3D5pZ/a7pW
	bVJL2qSt+CnYCbpRXRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiRn-0000000DwS9-3HRb;
	Tue, 13 Oct 2026 19:46:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiRi-0000000DwQu-0S5p
	for opensbi@lists.infradead.org;
	Tue, 13 Oct 2026 19:46:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHQXAA1592131
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uuWHebS+iqcQDsfWtwv5BpboNbPIsywwN4DIarulE28=; b=DC8U23MV+SBuCN64
	mlQu+oGdtrthO9edy6fBGC3YjOm1purSaqywe4BldzT3Mybqlk13lL1SnVBSQ7It
	Xg5TwjdpGU9Tu+yuChqccqLXzqmeoQ+mfS3NvEp84ztPHLOcN9+0BEHuW5Z3Q+8G
	fTEVAngMkR7rTL8RFrq+0G/e6ZOKm1C/X3HrVWRMg9vr5mO2Ek5gOFwjJcCcBHd9
	OHEZLTJhiVOPGc9MQxmOiXayI+tFxzebBZ3QbIdSjt9syYeJwTdZi5f63iPO7eM3
	PsmlGYNR3aPZ6jwKkEOxJLTHZUG4qQwR4lm7uQSwE0KvxO3Ww9lm+ybENARZDKFd
	Enrg5Q==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tgmum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:45:57 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46a5954cdfcso4427516fac.3
        for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 12:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791920756; cv=none;
        d=google.com; s=arc-20260327;
        b=jCvZ19UQjlMoQoPn5UG7l6H2X8j8WYTCmZt6jcIVYVM/9HgX45AwbbbJVVum4DMIik
         /1F+fEbWdC5D7LXUgvgM3d8Axicf+Me9WfGFYGECZg7aojxqQhUWzqjTiAHZNRnOhj2w
         03W0oaeFYJebkeqGY0c8SV/ymRVftnOyK0tYZvACIMUcuwNyVBw+4VdRto+G58XS/2Bg
         tIdWfu3vwE30uN7sDO8Yg7BJw5l7wJMu0VA1/L8hzYMNyvRBw4gIw9u9eFFIwHMliPqT
         2Agav0F2rZG6CjZGZQ3KMoyr1jij+ajWb9LL941zwgVhyTibB+qrvnPcugteLGURJSxH
         F2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uuWHebS+iqcQDsfWtwv5BpboNbPIsywwN4DIarulE28=;
        fh=Y31/9kgmOEB5Y9t+4QPxWCJyZnIC74Zgn98+8AOZDs4=;
        b=fMan4yXql6ZbChnPAdwuZudR6shOzQO9F2gAB0B+KnulTzzeaykdqmRbQh7RArh7F4
         z5WdxnKm9OpxhFrbkzPgl5umvE5V1QKIYbcq1KHVgATdq0v+K7TN/yeXqmj7eqxLMP4Z
         QmrjRSwQwi8h0ZUfc9yOatQiQkXp/6UWGaWgNUhdzOGibgkKPj8hVw0KDYGr84Sly1Va
         MVia51AkxcNS5LKiTmN47iaTr281HhpFP2Yc6mjOLRgJuLSuln8NaidJrvXcKez8g+78
         oA4Ewsvq1IWglXlPxd1Nk4d5pBmUcMNY0rNhwQAyI4mwQByjA2xL+1zEqG9siOikF7gR
         0umw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791920756; x=1792525556; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uuWHebS+iqcQDsfWtwv5BpboNbPIsywwN4DIarulE28=;
        b=i8NpRaZutCB1FKGDquuzst4n5g2ej3w1dSarEDW6q1nSttCp1s6r7mve1NCyhAZQgI
         bJ9eLuRjAAB7tBrzETrct99wOH5nTmw6s9bIq9WTi98l+j0z0IzYaGYuOEALQFIMd7tP
         jcFeaEnPeo3rsbk2TYFVtsM0+5t9jMOED7d+QgxHFRkt4u1PDoioEk6grEQQ99Y104+0
         Nfv/LhP0Y4+1ix3uVgdyWbU2BjR+mqiUj8WgM+PSrd0NggCEZHhPFsyR63rckMKhA/fv
         NK5q3wumHdpzKaBtRIiw5hQOAlJew1BOhfyTNFAGKo35YKkBf0Uhg8AvNZEPtS3JnvqK
         uw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920756; x=1792525556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uuWHebS+iqcQDsfWtwv5BpboNbPIsywwN4DIarulE28=;
        b=pL8XwNpFWNRXcPwFM4W0wYEOK/odSZ946FY89wMNgNMmKEgcG7rWpuFxCNMnkwJU5Z
         abjvbqbE3a+0L3SyDOHC+sYN12C3aaEkTHug2yxLvLF8yHoDFBzIJgvOkA7X//5WPE2h
         B5kmn8i+tvzwL3nbwROpsYYQNvtlCOpClhF9JdCPGBn83H/v9qVFsdeDYo5paMkncWz2
         xwGAM08xob+5Qixj0y31HIK0SrXLEkmBlfLCxb8NFaNL1ywMdMlVi3XjY1/U9h9wJ9n3
         kVLDTiXqTLqbu2MNiZx6ud1Sw3pYA4dF/9N534Bc6I7FjhNSfaSe6JTMGSqJAMxDGgXX
         /5+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwMOkVqzS0vrnUg82KvvAJE+JtFWTlj6J/A58jJQ5OGsUYyIiBkCKTIcXrXH4vq9xi5W7X8I6JC@lists.infradead.org
X-Gm-Message-State: AFq9FYIFkqUmfduoM/elKp67ZFyMHepECvwhEwWExbXfC/lGtrELhFim
	r4AKQkNBs562K+dgntN4G4EV6M4XNYQE03gYlKsZggl+qppY/s1VjYn6Jb7J4uryGC01+aPxxnS
	HqPWnJAZ4xbseqx8Z3tT31XFaBXn7Cq4DKVvE3duFFzInrESZnQTRziYIHPYtpkGXVB1/QD6P/w
	j6x3k0y6DGzW8I8GisAWkFXXhBpu8ZHDaw+ce8HzJa
X-Gm-Gg: AYBFou1M1kyQ8Hj9RN92KEEKWdFCsyBnuErLAqm1nKo89Ot5tZ4Q6mjXF0xDxmaUmGh
	0HzVgt6JCr7tq488PbhGoUD3vt7cXgKZIr22PY5/Dktg2a/+t76Xhq4lYGgi0tUZK3hu/+iHofK
	eOPtezhUAMvRwUlkQukrS5jN+rlTTDwf0nEofYVJTgeHnhptVAbxIDzav8nlw=
X-Received: by 2002:a05:6870:63aa:b0:493:ab63:38b2 with SMTP id 586e51a60fabf-4a2a8b0cf44mr11880323fac.57.1791920756368;
        Tue, 13 Oct 2026 12:45:56 -0700 (PDT)
X-Received: by 2002:a05:6870:63aa:b0:493:ab63:38b2 with SMTP id
 586e51a60fabf-4a2a8b0cf44mr11880306fac.57.1791920755928; Tue, 13 Oct 2026
 12:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com> <20260923032359.4041876-3-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260923032359.4041876-3-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:45:45 -0700
X-Gm-Features: AclHuK9-mFZrAsNHE1sjXLiZheI5mPHTx-7C6RuRN5wCrUS-EIoLdhWTJfy6vEo
Message-ID: <CAAVgOkJ7peh9_UYydqo=DQDdw8Nh=GUUm2bSauc1F3O3CXMMNg@mail.gmail.com>
Subject: Re: [PATCH 02/11] lib: utils/mpxy: Setup group early in fdt_mpxy_rpmi_init()
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6ace8a75 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=VpGPWe1XjA0p3YQaRWwA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX86Y+GNCMVcCM
 tByuxw12yJ0dMiZjzsAZ8arGs100150AzytFG3/qgv/ly5ulOh9Ogegn+G8n7KMI9Kdxqwx2088
 Dq1M2tHvQv/P9yw/kE9AJqSvu0CuB7g+lpUpP4WJ6agp5HThG+Dn2VzOsngJhOmZMU45RYjV+Bv
 64QjtC1+bAzDF/7MN3jAnruJQXfg11HooW8Er4Aj4qTY5pNr7Zqk5+piGvu5ewOKR5hEAfnYHSw
 MYPdKd/TnG/6aBAZYHWl/F0yTY7VnPQwRM7WFcVgOq5lWUw1rVMfOG8ddQXCKJNRU7GJj1PuuoD
 JCsy4WWi1NGzRnMr2W8AoluM20IyprjqcC8HwCPrrvO/heLLAmX8zqOFU85c/x+gA2dbLZ3iP17
 Q0/dvRiQLFHKjHDQ5HXuvbslDosWgGpno9l0PeQnxSpNClCfcgNzPUfz7NyBc16OQSNZLq/dc/X
 Dw1LUkT/tC+prve04jg==
X-Proofpoint-ORIG-GUID: _WzQNfKBWYejpBGDiSRVBT1RLyccUHUO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX0odW8jd5A2U2
 A0cLQFpAdWU/k4UojSWYpRbtoWLlJuMydLTiJqK9ej9dw3GtnqppOkmvvy89MQu3sOL9pLjTy7T
 V8oJgyQUFei1i/mwsq5irgQ5E2192iE=
X-Proofpoint-GUID: _WzQNfKBWYejpBGDiSRVBT1RLyccUHUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_124558_268972_48B82565 
X-CRM114-Status: GOOD (  20.03  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgODoyNOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBJbnN0ZWFkIG9mIHNldHRpbmcgZ3JvdXAgbGF0
ZSBpbiBmZHRfbXB4eV9ycG1pX2luaXQoKSwgaXQgaXMgYmV0dGVyCj4gdG8gZG8gaXQgYXMgZWFy
bHkgYXMgcG9zc2libGUgcmlnaHQgYWZ0ZXIgcmVxdWVzdGluZyBtYWlsYm94IGNoYW5uZWwKPiBz
byB0aGF0IHdlIGRlZmluZSBuZXcgY2FsbGJhY2sgZm9yIGNoYW5uZWwgYXR0cmlidXRlcy4KPgo+
IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4K
PiAtLS0KPiAgbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5jIHwgNDAgKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KSwgMjAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL21weHkvZmR0X21w
eHlfcnBtaS5jIGIvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5jCj4gaW5kZXggOWEzN2Zi
ZGMuLmJiZWI3YTc5IDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWku
Ywo+ICsrKyBiL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuYwo+IEBAIC0yMzUsNDcgKzIz
NSw1NCBAQCBpbnQgZmR0X21weHlfcnBtaV9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVv
ZmYsIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdAo+ICAgICAgICAgICAgICAgICBnb3RvIGZh
aWxfZnJlZV9jaGFuOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICAvKiBTZXR1cCBSUE1JIHNlcnZp
Y2UgZ3JvdXAgY29udGV4dCAqLwo+ICsgICAgICAgaWYgKGRhdGEtPnNldHVwX2dyb3VwKSB7Cj4g
KyAgICAgICAgICAgICAgIHJjID0gZGF0YS0+c2V0dXBfZ3JvdXAoJnJtYi0+Z3JvdXBfY29udGV4
dCwgY2hhbiwgZGF0YSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9jaGFuOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAg
IC8qIEdldCBjaGFubmVsIHByb3RvY29sIHZlcnNpb24gKi8KPiAgICAgICAgIHJjID0gbWJveF9j
aGFuX2dldF9hdHRyaWJ1dGUoY2hhbiwgUlBNSV9DSEFOTkVMX0FUVFJfUFJPVE9DT0xfVkVSU0lP
TiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnByb192ZXIpOwo+ICAg
ICAgICAgaWYgKHJjKQo+IC0gICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9jaGFuOwo+ICsg
ICAgICAgICAgICAgICBnb3RvIGZhaWxfY2xlYW51cF9ncm91cDsKPgo+ICAgICAgICAgLyogR2V0
IGNoYW5uZWwgbWF4aW11bSBkYXRhIGxlbmd0aCAqLwo+ICAgICAgICAgcmMgPSBtYm94X2NoYW5f
Z2V0X2F0dHJpYnV0ZShjaGFuLCBSUE1JX0NIQU5ORUxfQVRUUl9NQVhfREFUQV9MRU4sCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZtYXhfZGF0YV9sZW4pOwo+ICAgICAg
ICAgaWYgKHJjKQo+IC0gICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9jaGFuOwo+ICsgICAg
ICAgICAgICAgICBnb3RvIGZhaWxfY2xlYW51cF9ncm91cDsKPgo+ICAgICAgICAgLyogR2V0IGNo
YW5uZWwgVHggdGltZW91dCAqLwo+ICAgICAgICAgcmMgPSBtYm94X2NoYW5fZ2V0X2F0dHJpYnV0
ZShjaGFuLCBSUE1JX0NIQU5ORUxfQVRUUl9UWF9USU1FT1VULAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmdHhfdG91dCk7Cj4gICAgICAgICBpZiAocmMpCj4gLSAgICAg
ICAgICAgICAgIGdvdG8gZmFpbF9mcmVlX2NoYW47Cj4gKyAgICAgICAgICAgICAgIGdvdG8gZmFp
bF9jbGVhbnVwX2dyb3VwOwo+Cj4gICAgICAgICAvKiBHZXQgY2hhbm5lbCBSeCB0aW1lb3V0ICov
Cj4gICAgICAgICByYyA9IG1ib3hfY2hhbl9nZXRfYXR0cmlidXRlKGNoYW4sIFJQTUlfQ0hBTk5F
TF9BVFRSX1JYX1RJTUVPVVQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZyeF90b3V0KTsKPiAgICAgICAgIGlmIChyYykKPiAtICAgICAgICAgICAgICAgZ290byBmYWls
X2ZyZWVfY2hhbjsKPiArICAgICAgICAgICAgICAgZ290byBmYWlsX2NsZWFudXBfZ3JvdXA7Cj4K
PiAgICAgICAgIC8qIEdldCBjaGFubmVsIHNlcnZpY2UgZ3JvdXAgdmVyc2lvbiAqLwo+ICAgICAg
ICAgcmMgPSBtYm94X2NoYW5fZ2V0X2F0dHJpYnV0ZShjaGFuLCBSUE1JX0NIQU5ORUxfQVRUUl9T
RVJWSUNFR1JPVVBfVkVSU0lPTiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnNlcnZpY2VncnBfdmVyKTsKPiAgICAgICAgIGlmIChyYykKPiAtICAgICAgICAgICAgICAg
Z290byBmYWlsX2ZyZWVfY2hhbjsKPiArICAgICAgICAgICAgICAgZ290byBmYWlsX2NsZWFudXBf
Z3JvdXA7Cj4KPiAgICAgICAgIC8qIEdldCBjaGFubmVsIGltcGxlbWVudGF0aW9uIGlkICovCj4g
ICAgICAgICByYyA9IG1ib3hfY2hhbl9nZXRfYXR0cmlidXRlKGNoYW4sIFJQTUlfQ0hBTk5FTF9B
VFRSX0lNUExfSUQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZpbXBs
X2lkKTsKPiAgICAgICAgIGlmIChyYykKPiAtICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVf
Y2hhbjsKPiArICAgICAgICAgICAgICAgZ290byBmYWlsX2NsZWFudXBfZ3JvdXA7Cj4KPiAgICAg
ICAgIC8qIEdldCBjaGFubmVsIGltcGxlbWVudGF0aW9uIHZlcnNpb24gKi8KPiAgICAgICAgIHJj
ID0gbWJveF9jaGFuX2dldF9hdHRyaWJ1dGUoY2hhbiwgUlBNSV9DSEFOTkVMX0FUVFJfSU1QTF9W
RVJTSU9OLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmaW1wbF92ZXIp
Owo+ICAgICAgICAgaWYgKHJjKQo+IC0gICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9jaGFu
Owo+ICsgICAgICAgICAgICAgICBnb3RvIGZhaWxfY2xlYW51cF9ncm91cDsKPgo+ICAgICAgICAg
LyoKPiAgICAgICAgICAqIFRoZSAicmlzY3Ysc2JpLW1weHktY2hhbm5lbC1pZCIgRFQgcHJvcGVy
dHkgaXMgbWFuZGF0b3J5Cj4gQEAgLTI4Nyw3ICsyOTQsNyBAQCBpbnQgZmR0X21weHlfcnBtaV9p
bml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2gg
Km1hdAo+ICAgICAgICAgICAgICAgICBjaGFubmVsX2lkID0gZmR0MzJfdG9fY3B1KCp2YWwpOwo+
ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgcmMgPSBTQklfRU5PREVWOwo+IC0g
ICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9jaGFuOwo+ICsgICAgICAgICAgICAgICBnb3Rv
IGZhaWxfY2xlYW51cF9ncm91cDsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgLyogU2V0dXAgTVBY
WSBSUE1JIGNoYW5uZWwgKi8KPiBAQCAtMzI5LDIzICszMzYsMTYgQEAgaW50IGZkdF9tcHh5X3Jw
bWlfaW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLCBjb25zdCBzdHJ1Y3QgZmR0X21h
dGNoICptYXQKPiAgICAgICAgIHJtYi0+ZGF0YSA9IGRhdGE7Cj4gICAgICAgICBybWItPmNoYW4g
PSBjaGFuOwo+Cj4gLSAgICAgICAvKiBTZXR1cCBSUE1JIHNlcnZpY2UgZ3JvdXAgY29udGV4dCAq
Lwo+IC0gICAgICAgaWYgKGRhdGEtPnNldHVwX2dyb3VwKSB7Cj4gLSAgICAgICAgICAgICAgIHJj
ID0gZGF0YS0+c2V0dXBfZ3JvdXAoJnJtYi0+Z3JvdXBfY29udGV4dCwgY2hhbiwgZGF0YSk7Cj4g
LSAgICAgICAgICAgICAgIGlmIChyYykKPiAtICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGZh
aWxfZnJlZV9jaGFuOwo+IC0gICAgICAgfQo+IC0KPiAgICAgICAgIC8qIFJlZ2lzdGVyIFJQTUkg
c2VydmljZSBncm91cCAqLwo+ICAgICAgICAgcmMgPSBzYmlfbXB4eV9yZWdpc3Rlcl9jaGFubmVs
KCZybWItPmNoYW5uZWwpOwo+IC0gICAgICAgaWYgKHJjKSB7Cj4gLSAgICAgICAgICAgICAgIGlm
IChkYXRhLT5jbGVhbnVwX2dyb3VwKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGRhdGEtPmNs
ZWFudXBfZ3JvdXAocm1iLT5ncm91cF9jb250ZXh0KTsKPiAtICAgICAgICAgICAgICAgZ290byBm
YWlsX2ZyZWVfY2hhbjsKPiAtICAgICAgIH0KPiArICAgICAgIGlmIChyYykKPiArICAgICAgICAg
ICAgICAgZ290byBmYWlsX2NsZWFudXBfZ3JvdXA7Cj4KPiAgICAgICAgIHJldHVybiBTQklfT0s7
Cj4KPiArZmFpbF9jbGVhbnVwX2dyb3VwOgo+ICsgICAgICAgaWYgKGRhdGEtPmNsZWFudXBfZ3Jv
dXApCj4gKyAgICAgICAgICAgICAgIGRhdGEtPmNsZWFudXBfZ3JvdXAocm1iLT5ncm91cF9jb250
ZXh0KTsKPiAgZmFpbF9mcmVlX2NoYW46Cj4gICAgICAgICBtYm94X2NvbnRyb2xsZXJfZnJlZV9j
aGFuKGNoYW4pOwo+ICBmYWlsX2ZyZWVfY2xpZW50Ogo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4g
b3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKClJldmlld2Vk
LWJ5OiBQYXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+ClRlc3Rl
ZC1ieTogUGF3YW5kZWVwIE96YSA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
