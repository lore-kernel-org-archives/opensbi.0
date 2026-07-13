Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E4BC43458
	for <opensbi@archiver.kernel.org>; Mon, 13 Jul 2026 21:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rndEs2i8oEp4BK/aZtEYIE6s0+qfvGx2wnfHhT3aB1g=; b=23tLmgJzgIlNQh
	HIgpebO478xGPK1vsUZI0kGgAVZEz9RP9FQX4yIZGqneUkEKTCVjbzcp7pujmqFfOFNAdy8uoXNpW
	gkxATV9570yHysaOt5I0WzkP78lAw7w3KJAEpAi5QTplfPhTV/V81hPEmX3b7/tr57fJ3sWUr660p
	u5WXml/i6V5V1ejnyXkHmRAv0mDZU1kziq6g17MUgaZX/P2fAccqK9zret1ALVaJQUxISgDgjDRxI
	WDBHi07Yf6kax1oqWrZIsHRO9AV81eSEgv5d6BEtoAaDT56i2rmEeUtsP3cXIIvjElT2HMSHY+TkH
	sVd82rDkhjJyvQxTb1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOD5-0000000ARcq-048O;
	Mon, 13 Jul 2026 21:29:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOD1-0000000ARcH-3meM
	for opensbi@lists.infradead.org;
	Mon, 13 Jul 2026 21:29:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJAeRS2159222
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 21:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HN+N0voUGEa5NyT2REgtHKTZSi4lAx/LInGa2XTJAcg=; b=HGhW/tDvRpWcbHUp
	XkWL6qoEgORR6niE3Eem4wEepvv886EsPdczZjXp5WE9w6oSkakElijzCm3WBil/
	gKXUCJ4vGoN99j2++7s9SGnjHkqrF8OhPQWJlbb0ZVVTu4KIWhOJxYGo4U8ZGLZx
	hViXSJ+kaiziBdk9y8r66EhXfwBI/NRBdojD5cchNi7djgTf7bFbNvRFmGbMh0fA
	YYTpnSqWBeZ9rBaKtoRFX7gfUmMqS88eriUQTeGW/4LqfOv7CxpcX5DjDieBc5La
	n8icTNNZq0adelqXdWiTV33kiIPp26zjPzhITVGb+rG/79sd7CLDfejf8UCqpgca
	zZohVg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qtsxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 21:29:03 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-49f3a97f1caso3941047b6e.0
        for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 14:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783978142; cv=none;
        d=google.com; s=arc-20260327;
        b=sPmQ+ESikh4W8u6JtFvoGaQ7I0HgwJRk2DGX7RAkAoDRgUKv5elUV9y6J6sGDAJkL5
         2EG0s4EFkMimBhS7o85FEHVhRRuUBWc1gDXc3tJGbiXNOIkjGko7DDkiLefOtJ/kRldt
         nJCiDui1MribZuqG+En1hq/BV1hnutzoKJKEBXvIrpDwpSOHYecfAYEEUklAVtnGW3co
         C/pqO5Q5xmbU+nyq1Thkrwp8mrgH+upzMh8Nkmq27NmsQJ7Ug4wjJJnLbMp+Zn4urcHK
         /wJJLJOwy5B1XZTkxx56lVan4W8pE9ZuCWdhG/LUbfaL+ZuEHx6NtjzyfWQ5CaGGVkiK
         ZL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HN+N0voUGEa5NyT2REgtHKTZSi4lAx/LInGa2XTJAcg=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=WLePMHnQFOj0o4OSWTxir2OieWXH5gdAIe7G0z/llUthsQiKd+HBBpDz5dR3uext5e
         Ra+Hd/zTkAsW7FY1G4kJHrGJJGCCdIt4azy5HLEovvihySnrzV8sak6DuScvk1YeQqy3
         m7stHPHN5XTlZJ2shCbSLNTCFNY9Un4ca57WmxJUwtNaGVnLvmxFzmtpYggXcdzsW2J8
         ixEqe20Vxob5YJh4hhZkEVMizVQz8gBbT7cULBwWpPD7kbGoTstkeUHrRozY8vnjQzEF
         pU+SPdG9ltNNQ+EUCfHm2mfG0BQB9+OnkpTUtEAXBekQTdX8PAL4ZWvn4JNn2PpSjZxp
         okEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783978142; x=1784582942; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HN+N0voUGEa5NyT2REgtHKTZSi4lAx/LInGa2XTJAcg=;
        b=CWQsL7NzBiqmYYMyeHuMjnHUNqO65xlDTOb18c9deCOLG7StzkbK+gVVi4PSBFG/4Y
         9apTOnRqVaDuT9UhQKfp3trcuCrQ5L/PkgeddMG0EosIiJkZBRx4q5VL7jUGJgxLor8D
         VKL7YKn7o1ph871DPdCK3ikkpxMTqOwn7O1z1tcQrald6JbWoNKbgsJsbqPPt3ezzLLa
         3dvPyBfTBuHU2F38WFH+P9LpElDRwv/Or5R46xIpdhA2rReyj7Vof2daCecgzA/tRweC
         ZmIPZ+fjecMO3x9MFFFDP/sVbaC95YB+jnYgwEN+pkDlyeHH/iIshrOISA7eNq9jcJ8E
         ythw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783978142; x=1784582942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HN+N0voUGEa5NyT2REgtHKTZSi4lAx/LInGa2XTJAcg=;
        b=aNuxWJcJ+8r7teM3qSfDqyUIz5UFC2BkRWHzB3SYApJshyfqCypx1y2ZpnBYQVpyoZ
         /M7FNrdikHoy+KuHNumICAWzj54h0FuCDOjHAcZ2giheVsKM1AYliYRhiEzm9Jpafo/Y
         ULR6aHwtBOJCWm370xk9q4bnfB7nNGz8KCw6Y/LUMfPFyZrC000oboDXLsB57oPn2EEN
         lUPgA66vDK5GnaKrkyWzCmIF7gp9Hti95Ac7sSfW/h+lvLX5T5cUp+53dfuL3ljUjrXh
         VsS2wi0D2UevioqsTpTn4lRVJNviyMzsthI7z24IKnMWmgIGDxLyJ7xg5Nfn5PFkj9Lr
         Y7Ig==
X-Gm-Message-State: AOJu0Yz5eu9WkLakGLciQG3jwW0aWxTjbe3a00PNFjVTvl3YGsXGnkgV
	XlcamQunm5kkgXHeoZuY0qhTflZvzRpEOA2fnCj7IOaMYTIgi0nR2oEBFKUCeHXcRmNNDkzkeEj
	ilk/rxOOkfH0c4W/CqqItVRogMzI0Qx1TMrWIpehUnheuLFHEkmyjWqkDFEe9Xu1pPewtrJLErJ
	ye9X95s2/m2r83zfJFO3lpkdf0KRtB1GNGjlmHt8gd
X-Gm-Gg: AfdE7clMHI4nrlyxCYt1oxajMeAYzgObluxRGaPvUxPftE/Wj4sQiLiTRyx5twArSRh
	vQ+LlwSaSIJVHBvEu73NRZCdI3zb1kRMCvp9X6GZ34Xt2KVRrkZ4DgtG7oYVrulT8ES+fjr3HR7
	xU/9MuKrECHB7B8Rs97Vl0J4GasGbY1/Ki8y8SjsvvosaLZIglRObBuP9QJqATPOOpxIj2
X-Received: by 2002:a05:6808:2386:b0:496:2b3:4a85 with SMTP id 5614622812f47-4a42ae924f8mr7286844b6e.22.1783978142315;
        Mon, 13 Jul 2026 14:29:02 -0700 (PDT)
X-Received: by 2002:a05:6808:2386:b0:496:2b3:4a85 with SMTP id
 5614622812f47-4a42ae924f8mr7286823b6e.22.1783978141971; Mon, 13 Jul 2026
 14:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com> <20260626101433.3133466-5-peter.lin@sifive.com>
In-Reply-To: <20260626101433.3133466-5-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:28:50 -0700
X-Gm-Features: AVVi8CdxWnAICBkMV4LoZS1UlLa9TrSciV6WEasTAhn70VNjEuY_a-s5M94PDlA
Message-ID: <CAAVgOkK0ccb2L2SGtx-LFRhjt83t9jN-e7AmCH0S_do-=yX-0Q@mail.gmail.com>
Subject: Re: [RFC PATCH 04/12] lib: sbi_hart: lock mwid CSR for RoT immutability
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIyMSBTYWx0ZWRfX4LbtkK74VCGN
 WsJ/UtUaeFSUbhtq5pmH44AZUIE3pFrIcQAbGmHIaD4uoZCUzbltnSwWjYZVxCV/ybp+hFfKNfY
 LStr1kXxNUW7k8r6Y1CL6rOuCF8CS55qUQqUdN9Q1t+eyMyxc5z/KAQyxGWr3CbnGQ3qt2FgFKN
 lm/aoEsUzS3V3lG7tO3mKbaPTqPldBNqgFAR2qHJeqedakZXxE/XMDvSDERLrFpViCnXtJ+ulUs
 kIrE9oj5DA/5PPQXVTU8wYESSGR2aw8GRuhJ60/8XMKyJrzrR1KxB0dQDDtelVy7CFMsTiDxCng
 feSCjKc6ew5PmOUltCeT17yxAWnO1VBwTlgYdZ2K7EfE2MTLQPfdrYBJ+nfHIFV+VGCS7mdW+y1
 yAjc7i5YuhG25X2DSCjOuSTeNpq7IL+ZiGsyGUQZRLKDrKoMYTSAs+e2gCtj4Xizpkln7xbA59s
 RJYjieS+yW2VVaI0wVg==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a55589f cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=JfrnYn6hAAAA:8 a=pFyQfRViAAAA:8
 a=cwQEnzW-4i6HU328WOAA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: gWO9NDGXBLH95McayKBfiYz9R4xqXeyT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIyMSBTYWx0ZWRfX85Lu+aUViOAI
 lA94XS5WKtjO/xeTyyYDUKGl6PKpYvYIl8imYonI3fZeDn9v4TY+MQbRfGOXfNHymEUdKvqFRie
 kjQykBYqNi21GUQuzNjOvbMwrZT4G98=
X-Proofpoint-ORIG-GUID: gWO9NDGXBLH95McayKBfiYz9R4xqXeyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_142903_946315_9C334B7C 
X-CRM114-Status: GOOD (  20.37  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMzoxNuKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gTG9jayB0aGUgTS1tb2RlIFdvcmxkIElEICht
d2lkKSBDU1IgZHVyaW5nIGhhcnQgcmUtaW5pdGlhbGl6YXRpb24gdG8KPiBlbmZvcmNlIGltbXV0
YWJpbGl0eSBvZiB0aGUgV0lEIGVzdGFibGlzaGVkIGJ5IHRoZSByb290LW9mLXRydXN0Lgo+Cj4g
T3BlblNCSSBkb2VzIG5vdCBhc3NpZ24gdGhlIFdJRCB2YWx1ZSBpdHNlbGY7IGl0IG9ubHkgc2V0
cyBNV0lEX0xPQ0sKPiB0byBmcmVlemUgdGhlIHZhbHVlIGVzdGFibGlzaGVkIGJ5IHByaW9yIFJv
VCBzdGFnZS4gVGhlIE1XSURfTE9DSyBiaXQKPiBhdCBYTEVOLTEgaXMgc3RpY2t5IGFuZCBtYWtl
cyB0aGUgQ1NSIHJlYWQtb25seSB1bnRpbCByZXNldCwgZW5mb3JjaW5nCj4gYSB0ZW1wb3JhbCBz
ZWN1cml0eSBib3VuZGFyeSBwZXIgdGhlIFJJU0MtViBXb3JsZHMgc3BlY2lmaWNhdGlvbi4KPgo+
IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+
Cj4gLS0tCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIv
bGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggY2IwYzY2ZWEuLjRmYmU0NmQ3IDEwMDY0NAo+IC0t
LSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC04
MDQsNiArODA0LDEzIEBAIGludCBzYmlfaGFydF9yZWluaXQoc3RydWN0IHNiaV9zY3JhdGNoICpz
Y3JhdGNoKQo+ICAgICAgICAgaWYgKHJjKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4K
PiArICAgICAgIC8qCj4gKyAgICAgICAgKiBBc3N1bWUgTVdJRCBpcyByZXN0b3JlZCBieSByb290
LW9mLXRydXN0IE0tbW9kZSBpbiBwcmV2aW91cwo+ICsgICAgICAgICogc3RhZ2UuIExvY2sgbXdp
ZCBzbyBSb1QtZGVmaW5lZCBXSUQgcmVtYWlucyBpbW11dGFibGUuCj4gKyAgICAgICAgKi8KPiAr
ICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9T
TVdJRCkpCj4gKyAgICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX01XSUQsIE1XSURfTE9DSyk7CkF0
IG1pbmltdW0sIGJlZm9yZSBsb2NraW5nLCByZWFkIGJhY2sgQ1NSX01XSUQgJiB+TVdJRF9MT0NL
IGFuZCB2ZXJpZnkKaXQgbWF0Y2hlcyBoZi0+cG13aWQuIElmIHRoZXkgZG9uJ3QgbWF0Y2gsIHRo
aXMgaXMgYSBmYXRhbCBzZWN1cml0eQplcnJvciBhbmQgc2JpX3BhbmljKCkgaXMgYXBwcm9wcmlh
dGUKPiArCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLS0KPiAyLjQzLjcKPgo+Cj4gLS0K
PiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
