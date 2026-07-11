Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3EBC43458
	for <opensbi@archiver.kernel.org>; Sat, 11 Jul 2026 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiO2xvWAj1tqG6Ve7APiHJe1634YQ7T0f1dX2af92J8=; b=pE7LJbU9D7hLBb
	AUhBwVlGqPH72l8Vjzt5cgQn08p95cMBlw5aXln4EVse4dd/qBZiCCloId4E4jSOVTqIoIM74pOnI
	JbudXDHEfzUjlyIUuAZTXfbvAVyJuHOx06nEjfvYbq4q2y2nmkzxYyKfuOG35g7knv+9E4vh2/z7W
	aRoGPcqIJi6k3qfF+Qzv5tF6eHHLki6PR7JxF++eOT60JUrAIwFyw6PhMQgj9vIm4lVvrwvSnOQ8Z
	YVUN/fjbr19LZR0qTtsSMbS1fvXcfEEcf8ehnoIPwszzoKFMz9XD3MtxqJewRe4mzf1MAnsazYVGy
	JRmwEB4pfcypGYU5Tg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wid7e-00000006nDo-2nYU;
	Sat, 11 Jul 2026 19:12:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wid7b-00000006nDC-10dE
	for opensbi@lists.infradead.org;
	Sat, 11 Jul 2026 19:12:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHo2Eo147007
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 19:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkvuYm4pNjqftUx/QW53IfxXOEbg9Vw4P3P9aYKqUTo=; b=WKhcQFPC93RgldYj
	jUPB6vRzTSL85ixjmNrZ61HKyPUS16G+ju7uPIqnrDYpD86+D/7+PJAp/7FgE3Da
	eWNKWitb8X+IX2Fd3KEuV72h4+UQ4/tBHkYGkrEzY8DuqTCwTmMv25bXHe8zUahh
	2s60AsZ0Uq0PlAbLDA19RbKEMQ0ABJj6QqiGb8UWYeud2rHGZ1SQcKo5OBlTXkAR
	nP/RUmCblAef74DvfPK96ARnkZ77NtxdbDpR63Pm8TVQCuMABHS5UovAVkxUkRXR
	/R44ytmdyz7d/53M9ULxvb+3rkyCX6I8PHdKRRVgs9uijie01hdIV2Qf1TT336Yg
	px3/rA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9hesv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 19:12:16 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb650e79adso2009570a34.3
        for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 12:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783797136; cv=none;
        d=google.com; s=arc-20260327;
        b=cfME8itx974oqG+UuU9a8+CVncCQ7KeOzYyTxbOPxlP0JBuWEF5Z7gAtnZCzIv8/j0
         QLvjwWOEnrzRrxDjbkTmEwNDgX4hggj/mP0UuXkNGx5r4BYGrXKEeUCROEYKBAFsXrO3
         vPF7D9xvkQCtItMVmSpeZvzz1m4CNSbf4/Hz8sYpMZreQRT6eeKOTnmkn6UfBYeC+P5k
         5+y2hIenK269J231EUCAmWDTrxvWOZ+jFN1EBvPkjjtM+uoOQS4zOXTwdnKpBN2BsBZY
         N5c4vKPAZxEsGnvzgEJ7o0PbcS38dn+DOVLUQPSqcuaYlvNcmtiPJXxuCIXTTE0z6nft
         WH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QkvuYm4pNjqftUx/QW53IfxXOEbg9Vw4P3P9aYKqUTo=;
        fh=ovkByJOk++qG9liXiAM9JcztM449mYrrUHx2X1Srwso=;
        b=AvdXqFDzJut0x6BFe3enQFugCJfsTrK1KJF6OKlPAFz48xrXoDR/hERQ/NJEwElSvz
         O1SgrrQkgMVgmlPDPG2zLPWVSiOQzzrk+DKjU9LOg6Dt4kSnvuU8uwMUkKvSP3z1Obn/
         2rvFiIH+gEwX//IJTtzBKUXqvqPTvRkf+c4RTAR4yxVhrdZYZZbMfjJRNsSof05Xwx/E
         xpONRVGvLiIxYAG/6AwfLvH/DuhDLa2hvrLNaluu2HoV48imvlvA8FjjepmZxFWYy+gh
         n46xtNh3PbQjOCtLt+Xte5jXhJcqiA0mfVz1ixL/aexqBK6wyyR0OVqjhdFQp2dWZyr0
         3qNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783797136; x=1784401936; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QkvuYm4pNjqftUx/QW53IfxXOEbg9Vw4P3P9aYKqUTo=;
        b=TZOK4lkuRSmftN1BYeMrl5eM6PNK574jVLBn0fUlQ9jDBwznkLw+P5lkusee1V8d58
         56wNMiS/d2q9gnv+sB60MkVrOPkdZ+gqTdIJJZeUyAeMouINbuXt8ZOcHe9P9Z+8HODb
         Oou3Zgut9ibMzoMW3BzGzYGdsxK7YFlTQ4XQiKcp2ebmNAuX0e5Fhx4RsBKJQ77l3ub5
         hJdJK9cBqKlmQVwRe5ub9pA6hg6jxGYkLjdsnWd9+c23W7d7sYvbTWbL+HLehZWCH58S
         pOytt+WJnpJO1lAQbu6/BRPATaWQYIDmygmOIMdrZztyPEvsVWQKQoTOyhnM6XtZwrTn
         Ms4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783797136; x=1784401936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkvuYm4pNjqftUx/QW53IfxXOEbg9Vw4P3P9aYKqUTo=;
        b=oM37LvZl8p690JQPsVh3PG/e4ogRX0Wugt2fe2QW1keoXCLBpOY+SyD4flP8sVoOqt
         zo7u6jMCgQuBXpQTrvn//4+2J84DVQvFSGnMEC0E9IX+ZTQ0QLF8znuigsgDkBEGHPnR
         Os0r7JmYu1ofyumkMYh0Lr+u/XnIdiXvDaAu/E58wirBAMD5e29G4zwB/nyhH7v7TQC9
         NH/KN2AegapGtzb7deG2hESUiJTt4GH+0h9SDpXG2A1eJogpd0unZaocRc23+dAtRuFP
         8efduO/DwVrx7iLrUVyqSHZ+MmayX2ZsF1E+DoNZFaSv1Qiwg8recp6PjnYbZx644uoS
         24yw==
X-Gm-Message-State: AOJu0YzaLFaLjqUBpicQQhmkYdi3qq/bdQdGT2Nf+204Gpm098VXEF5G
	uVO9JFVVGp9/pwUhv9b0+QAJs3Yjpga3buOHNWwDLwuukjRYqtrnnRa0AVlLQEDFdQLGtntJFa+
	h42Lw44kiGBu6MrT2/CxJR4alRIDpPUCmfKnNmQR3MF0qyvA20aHFKv/5Jv4xtcDvs8g+uhBalo
	X2SsCiqQ/11MaK6mQz0pBWva6/O0b3IU6PFnQzRfxR
X-Gm-Gg: AfdE7cnwt87MITdO12pHuFForcJ/NM8yKrVme28ikbK4t7K0zIB5dM2ha0VyAiCrNrl
	hk+KVoxj12i4224FWHuvDZBRumW8QggRLSAAA8MOyoVD0TPU4dnL2znfbrrIN+NWKqqP7EUFPmz
	86ZN48E6gepalAgC2L8R8YtYCtWfbLAqEwwHhLOZVO2Zg2O9DIrlxTCSXAJTW1mjXDZtmtDw==
X-Received: by 2002:a05:6830:2543:b0:7e9:e0f3:b914 with SMTP id 46e09a7af769-7ec09693f06mr2521847a34.13.1783797135800;
        Sat, 11 Jul 2026 12:12:15 -0700 (PDT)
X-Received: by 2002:a05:6830:2543:b0:7e9:e0f3:b914 with SMTP id
 46e09a7af769-7ec09693f06mr2521836a34.13.1783797135363; Sat, 11 Jul 2026
 12:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260617184047.70388-1-pawandeep.oza@oss.qualcomm.com>
 <20260617184047.70388-4-pawandeep.oza@oss.qualcomm.com> <CABBgwmsYOHK7twXEpfXs72graLLz8HhADqMDp+-S=OiOX-M7bw@mail.gmail.com>
In-Reply-To: <CABBgwmsYOHK7twXEpfXs72graLLz8HhADqMDp+-S=OiOX-M7bw@mail.gmail.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 12:12:04 -0700
X-Gm-Features: AUfX_mzpa13wsgfDL4ChrQvUzMrTNbDGzihl43HWzfa9kxqFY5S5Ji_mAF7-CsU
Message-ID: <CAAVgOkJDz_aj-c_w-W6UVSx-U5vyV0TBfPJvudvXOgfMtwUEJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] lib: utils/irqchip/imsic: embed sbi_irqchip_device
 in imsic data
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE5NCBTYWx0ZWRfX6BmIcbpnr1D2
 WsmQf7ei0UYEGofe2qKIlj43lPvgH7VK3SUAFr5lK5rdsZX8E0WQEa0IH2aruSXjYAWQeZ7H3Rr
 bj5PeKVyNp4UKTpKwETLlyL+ge3d+/U=
X-Proofpoint-GUID: ZUbs1Zt66SSQAtdBr0Wj3LNkyVfiGpvi
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a529590 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=7Ao0ZELOncdEKYlwrrYA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE5NCBTYWx0ZWRfX8JTIO9cDEiQR
 5H1k09Z3l63tSEhHbzZsQlehkGBgyTNhp2EriCnMDCjp4SKFAWH4YzFVoBeLimzdyGbnsHz8czh
 P4pBV7GPqlBjW8i8eH2V5OO+07Xt321blTh2cJTE8ar0EfCJmER3K/f6M5r4ZWkLuhoM0CDqTtd
 RImrxuuRkPaNI5p5WDZKxInr7nlNvMPb1TuEJGsXX+s/5In2mDUjGbWdtdxHki9tLGqRtoGrHgy
 7ZA6vuLYe+x+8YdfYR/sqS2EWYZYCzv4fvQ7czhtzhJiflJQb4DRihfnUi3GJcTRYjfhPhJO+y2
 86YKQTiK6jT+8s0di6SghZfIuLtpX08MlbL/Ml1oYR/CeJYtUC2FQXV/hefMS4ZDY0zJUsGHWSW
 Z3VZ9Q6C6pev1xMlWMXQmqPWjQy02lwsewu8o3bGVJNIPgn9nOdowXtHlJ/Wdz8Avx1CCQn+q0o
 qjQCjUcxFEWHzbDzj4g==
X-Proofpoint-ORIG-GUID: ZUbs1Zt66SSQAtdBr0Wj3LNkyVfiGpvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_121219_415024_98837891 
X-CRM114-Status: GOOD (  26.09  )
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

T24gV2VkLCBKdWwgOCwgMjAyNiBhdCA5OjMw4oCvUE0gQW51cCBQYXRlbCA8YW51cC5wYXRlbEBv
c3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDE4LCAyMDI2IGF0IDEyOjE2
4oCvQU0gUGF3YW5kZWVwIE96YQo+IDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdy
b3RlOgo+ID4KPiA+IEVtYmVkIHNiaV9pcnFjaGlwX2RldmljZSBpbiBzdHJ1Y3QgaW1zaWNfZGF0
YSB0byBlbmFibGUgaW5zdGFuY2UtYmFzZWQKPiA+IGlycWNoaXAgcmVnaXN0cmF0aW9uLCByZXBs
YWNpbmcgdGhlIHByZXZpb3VzIGdsb2JhbCBpbXNpY19kZXZpY2UKPiA+IHNpbmdsZXRvbi4gSW5j
bHVkZSBzYmlfaXJxY2hpcC5oIGZyb20gaW1zaWMuaCB0byBtYWtlIHRoZSBlbWJlZGRlZAo+ID4g
c3RydWN0IHZpc2libGUgdG8gY29uc3VtZXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE96YSBQ
YXdhbmRlZXAgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KPiA+IC0tLQo+ID4gIGlu
Y2x1ZGUvc2JpX3V0aWxzL2lycWNoaXAvaW1zaWMuaCB8ICAyICsrCj4gPiAgbGliL3V0aWxzL2ly
cWNoaXAvaW1zaWMuYyAgICAgICAgIHwgMjUgKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9pbXNpYy5oIGIvaW5jbHVk
ZS9zYmlfdXRpbHMvaXJxY2hpcC9pbXNpYy5oCj4gPiBpbmRleCA4OGRkM2NmYi4uMTkxMGI2MmEg
MTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3NiaV91dGlscy9pcnFjaGlwL2ltc2ljLmgKPiA+ICsr
KyBiL2luY2x1ZGUvc2JpX3V0aWxzL2lycWNoaXAvaW1zaWMuaAo+ID4gQEAgLTEyLDYgKzEyLDcg
QEAKPiA+ICAjZGVmaW5lIF9fSVJRQ0hJUF9JTVNJQ19IX18KPiA+Cj4gPiAgI2luY2x1ZGUgPHNi
aS9zYmlfdHlwZXMuaD4KPiA+ICsjaW5jbHVkZSA8c2JpL3NiaV9pcnFjaGlwLmg+Cj4gPgo+ID4g
ICNkZWZpbmUgSU1TSUNfTU1JT19QQUdFX1NISUZUICAgICAgICAgIDEyCj4gPiAgI2RlZmluZSBJ
TVNJQ19NTUlPX1BBR0VfU1ogICAgICAgICAgICAgKDFVTCA8PCBJTVNJQ19NTUlPX1BBR0VfU0hJ
RlQpCj4gPiBAQCAtMjUsNiArMjYsNyBAQCBzdHJ1Y3QgaW1zaWNfcmVncyB7Cj4gPgo+ID4gIHN0
cnVjdCBpbXNpY19kYXRhIHsKPiA+ICAgICAgICAgdTMyIHVuaXF1ZV9pZDsKPiA+ICsgICAgICAg
c3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSBpcnFjaGlwOwo+Cj4gTWlub3Igbml0OiBtYWtlIHRo
aXMgYXMgZmlyc3QgbWVtYmVyIG9mIHN0cnVjdCBpbXNpY19kYXRhCk96YTogc3VyZQo+Cj4gPiAg
ICAgICAgIGJvb2wgdGFyZ2V0c19tbW9kZTsKPiA+ICAgICAgICAgdTMyIGd1ZXN0X2luZGV4X2Jp
dHM7Cj4gPiAgICAgICAgIHUzMiBoYXJ0X2luZGV4X2JpdHM7Cj4gPiBkaWZmIC0tZ2l0IGEvbGli
L3V0aWxzL2lycWNoaXAvaW1zaWMuYyBiL2xpYi91dGlscy9pcnFjaGlwL2ltc2ljLmMKPiA+IGlu
ZGV4IDBlN2YzZTZiLi4yYWJkYzhlZiAxMDA2NDQKPiA+IC0tLSBhL2xpYi91dGlscy9pcnFjaGlw
L2ltc2ljLmMKPiA+ICsrKyBiL2xpYi91dGlscy9pcnFjaGlwL2ltc2ljLmMKPiA+IEBAIC0xNDks
OCArMTQ5LDEzIEBAIGludCBpbXNpY19nZXRfdGFyZ2V0X2ZpbGUodTMyIGhhcnRpbmRleCkKPiA+
Cj4gPiAgc3RhdGljIGludCBpbXNpY19wcm9jZXNzX2h3aXJxcyhzdHJ1Y3Qgc2JpX2lycWNoaXBf
ZGV2aWNlICpjaGlwKQo+ID4gIHsKPiA+ICsgICAgICAgc3RydWN0IGltc2ljX2RhdGEgKmltc2lj
Owo+ID4gICAgICAgICB1bG9uZyBtaXJxOwo+ID4KPiA+ICsgICAgICAgaW1zaWMgPSBjb250YWlu
ZXJfb2YoY2hpcCwgc3RydWN0IGltc2ljX2RhdGEsIGlycWNoaXApOwo+ID4gKyAgICAgICBpZiAo
IWltc2ljIHx8ICFpbXNpYy0+dGFyZ2V0c19tbW9kZSkKPiA+ICsgICAgICAgICAgICAgICByZXR1
cm4gU0JJX0VJTlZBTDsKPiA+ICsKPiA+ICAgICAgICAgd2hpbGUgKChtaXJxID0gY3NyX3N3YXAo
Q1NSX01UT1BFSSwgMCkpKSB7Cj4gPiAgICAgICAgICAgICAgICAgbWlycSA9IChtaXJxID4+IElN
U0lDX1RPUEVJX0lEX1NISUZUKTsKPiA+Cj4gPiBAQCAtMjU4LDEwICsyNjMsMTUgQEAgdm9pZCBp
bXNpY19sb2NhbF9pcnFjaGlwX2luaXQodm9pZCkKPiA+Cj4gPiAgc3RhdGljIGludCBpbXNpY193
YXJtX2lycWNoaXBfaW5pdChzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpkZXYpCj4gPiAgewo+
ID4gLSAgICAgICBzdHJ1Y3QgaW1zaWNfZGF0YSAqaW1zaWMgPSBpbXNpY19nZXRfZGF0YShjdXJy
ZW50X2hhcnRpbmRleCgpKTsKPiA+ICsgICAgICAgc3RydWN0IGltc2ljX2RhdGEgKmltc2ljOwo+
ID4gKyAgICAgICBzdHJ1Y3QgaW1zaWNfZGF0YSAqaGFydF9pbXNpYzsKPiA+ICsKPiA+ICsgICAg
ICAgaW1zaWMgPSBjb250YWluZXJfb2YoZGV2LCBzdHJ1Y3QgaW1zaWNfZGF0YSwgaXJxY2hpcCk7
Cj4gPiArICAgICAgIGhhcnRfaW1zaWMgPSBpbXNpY19nZXRfZGF0YShjdXJyZW50X2hhcnRpbmRl
eCgpKTsKPiA+Cj4gPiAgICAgICAgIC8qIFNhbml0eSBjaGVja3MgKi8KPiA+IC0gICAgICAgaWYg
KCFpbXNpYyB8fCAhaW1zaWMtPnRhcmdldHNfbW1vZGUpCj4gPiArICAgICAgIGlmICghaGFydF9p
bXNpYyB8fCBoYXJ0X2ltc2ljICE9IGltc2ljIHx8Cj4gPiArICAgICAgICAgICAgICAgIWhhcnRf
aW1zaWMtPnRhcmdldHNfbW1vZGUpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5W
QUw7Cj4gPgo+ID4gICAgICAgICAvKiBEaXNhYmxlIGFsbCBpbnRlcnJ1cHRzICovCj4gPiBAQCAt
Mzk5LDE2ICs0MDksMTcgQEAgaW50IGltc2ljX2NvbGRfaXJxY2hpcF9pbml0KHN0cnVjdCBpbXNp
Y19kYXRhICppbXNpYykKPiA+ICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgLyogUmVnaXN0ZXIg
aXJxY2hpcCBkZXZpY2UgKi8KPiA+IC0gICAgICAgaW1zaWNfZGV2aWNlLmlkID0gaW1zaWMtPnVu
aXF1ZV9pZDsKPiA+ICsgICAgICAgaW1zaWMtPmlycWNoaXAgPSBpbXNpY19kZXZpY2U7Cj4gPiAr
ICAgICAgIGltc2ljLT5pcnFjaGlwLmlkID0gaW1zaWMtPnVuaXF1ZV9pZDsKPiA+ICAgICAgICAg
aW1zaWNfZGV2aWNlLmNhcHMgPSBTQklfSVJRQ0hJUF9DQVBTX01TSTsKPiA+IC0gICAgICAgaW1z
aWNfZGV2aWNlLm51bV9od2lycSA9IGltc2ljLT5udW1faWRzICsgMTsKPiA+IC0gICAgICAgc2Jp
X2hhcnRtYXNrX3NldF9hbGwoJmltc2ljX2RldmljZS50YXJnZXRfaGFydHMpOwo+ID4gLSAgICAg
ICByYyA9IHNiaV9pcnFjaGlwX2FkZF9kZXZpY2UoJmltc2ljX2RldmljZSk7Cj4gPiArICAgICAg
IGltc2ljLT5pcnFjaGlwLm51bV9od2lycSA9IGltc2ljLT5udW1faWRzICsgMTsKPiA+ICsgICAg
ICAgc2JpX2hhcnRtYXNrX3NldF9hbGwoJmltc2ljLT5pcnFjaGlwLnRhcmdldF9oYXJ0cyk7Cj4g
PiArICAgICAgIHJjID0gc2JpX2lycWNoaXBfYWRkX2RldmljZSgmaW1zaWMtPmlycWNoaXApOwo+
ID4gICAgICAgICBpZiAocmMpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ID4KPiA+
ICAgICAgICAgLyogTWFyayBod2lycSAwIGFuZCBJUEkgaHdpcnEgYXMgcmVzZXJ2ZWQgKi8KPiA+
IC0gICAgICAgcmMgPSBzYmlfaXJxY2hpcF9yZWdpc3Rlcl9yZXNlcnZlZCgmaW1zaWNfZGV2aWNl
LCAwLCBJTVNJQ19JUElfSUQgKyAxKTsKPiA+ICsgICAgICAgcmMgPSBzYmlfaXJxY2hpcF9yZWdp
c3Rlcl9yZXNlcnZlZCgmaW1zaWMtPmlycWNoaXAsIDAsIElNU0lDX0lQSV9JRCArIDEpOwo+ID4g
ICAgICAgICBpZiAocmMpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ID4KPiA+IC0t
Cj4gPiAyLjQzLjAKPiA+Cj4gPgo+ID4gLS0KPiA+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gPiBv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo+Cj4gT3RoZXJ3aXNlLCB0aGlzIGxvb2tzIGdvb2Qg
dG8gbWUuCj4KPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
Pgo+IFRoYW5rcywKPiBBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
