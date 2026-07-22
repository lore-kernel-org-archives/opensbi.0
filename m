Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EE0C44539
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYhwQ3ZR0P/lbcM2pXZ3i9Xgcq6ixLyDV8BlRqrHHME=; b=3Gzx/FonMvcXhs
	ZBxXRLMBJodgTUkA1jVgHFctUzuV42fJbvlCGqzZ1XenxrO9uVVXHe2dfkdcvX+UlM06MN98G328d
	0VjwB5PwDtHFXc2NEpv7XKYRwdFskiqsTEQmpggDZSyl24kQvRewQCvOa/uVGXxHFNKF1SeFkobYs
	RETx90HbXEMRQxNCpXK9GlAYGlRNpLdJ6fy3U2I3rPImlGpmQg04y1XAOO1RpKUySAGp/l+fpOYwu
	IID/e88eNn+5wQW5fC0TbDLMU7O4lZxIGVJj80vdb4zXSbNNlH3hvRF464KvhJwG6VcIj9hRVY6Fg
	B9HtTrTPZ87NlAWW/Amw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUgM-0000000BbXU-2bg9;
	Wed, 22 Jul 2026 11:00:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUgK-0000000BbWt-0vZZ
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 11:00:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xaF6269720
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 11:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZNE0XZ8kz7V+5A8Uf20tdMqO+tgZ8Ep4vA27OFWv/k=; b=JLEwzqfNMZlHxbGk
	Un2dLpDA3SOeIzB4k2+boxPQwzWzbGToA30cW5QV6bFlvZAWiQgnivHWjgD+pS3I
	scPR/w6jeQDBWWckD1A2f15fVvBbVrP33J35omEsxoW6J2PD/l6MWohSvPK8h9mc
	KuFQxF3DQTUgfVoArQ1QFcbeXbI4/vwaH5ann3ADMn3oRdb2+CkkQcaUOYzsMiIN
	lko4UomFA1UTXaWftRP/ztSvlgocuAQUqEv00aDq1RmMA8Gw+8EA1oXIoD45syKP
	l/mY88lN6WiS1wshmw2eoEN4Yg1Ec3GijRIxDSYBBptQ6fmY9rx9de0KY/+ISu0t
	cjD8RA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6abmrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 11:00:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so1707703985a.2
        for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 04:00:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784718006; cv=none;
        d=google.com; s=arc-20260327;
        b=DLsuVGU04AhXqBUW8Coam7XbNZxWbY1Gd3oFpOHXL+tvHZvF8I/5IxA7sjzPleTvnw
         Tga8HKFqdzqNzU2YofmLluk8OkTwmF7YBWrAWnBuYdsz9S9uNBZaD1aPbyIc8VTyT6g6
         nx7BgOGILTuKtIB3+H+CbegknSZwJNmo2Pehn8fOdqLI2ugaVr97BRp224RhxCix25c0
         J8P0uTfXG6hbdJGCpSpIZF1hGuot6JR0RUta1BeQSN79Io5jIp53jK6XAauPO8mvpKVm
         +olP2BwdEuNJ5DZFuVIPyRAa3fTglC7jzrfFxStIOZbEA/tRCNVr8RPa0jh28WHexDgP
         VURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nZNE0XZ8kz7V+5A8Uf20tdMqO+tgZ8Ep4vA27OFWv/k=;
        fh=x7E/Vg6XBcLwUXVdnpip29z/PDECkDSGima/e+FC+tk=;
        b=oRVNmBCpezYpA+Jtl0gq94qqFkSTjRMgrfWIPzhtkATMo1kw8DVa5YDxa++AxUT9Cc
         obHFbBLgdrz8tdLD3goii8t8zobHaFWK2QMF6oJzkt00XNWHwN99/al6o0oPXa3Tx1/u
         pAjRUm91LYqfOEMiU7v39Ig6gXkCn/aJgTXJTy2dggICHK7ekUwmyJIQJ+XO1jTiglvD
         ill6dnCvxZv32iThU0XouQUcWaHJw7svbDBm7qHjLiQ2zb3vcj4fb95Z0NqAwtUPQijE
         Uv5KDFwu5gjSVJyqWImrH4NaafS1I0KjB4iitqXXGmGWOiG17y/se19P5vYyih3yLdwl
         l/xQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784718006; x=1785322806; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZNE0XZ8kz7V+5A8Uf20tdMqO+tgZ8Ep4vA27OFWv/k=;
        b=B7jINtCpen7c/omP92nnOqP4QXMuO7eUp9wweRCAxacuVR5dfr3xbqhs4hPLjrc42/
         OzUJfKcAqKIDR5XN9JNNc4B/6Jf+3fAvdX1Av7bZNAUXznTaLvt5A7URgxZKuzzHGmgK
         bhEUmUbCiZe2oagT/3JbLhk0UEwWiFVy5th1fY47pcOCuALr9otrQuL73yELu9X+By7k
         EOqK+u53gxwdqiVqWs+GoBTKfh7sJbBv3Xxn2m4n+QNdeLUoNuPMtgeXcIi3j+1g755e
         lpQq90k5RprYi4pVvDPHrN964OY/dffmI+EPej8I37Arr3sG8aOxJmxy+QlImDJl4wWF
         axCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718006; x=1785322806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZNE0XZ8kz7V+5A8Uf20tdMqO+tgZ8Ep4vA27OFWv/k=;
        b=sHK35HtMzi7N+ZcvXfZ/RtilkC1BcKns2PCRKT3LaA3emHtuR+J6BZz6rhg2lRYXNU
         xO9NIaauITks0+Z8dPJR+rJZmjJNKT4J62M+zdci6LTOp1CAyDY+BLNWup3UitKJpIoM
         ZLmCCgSEQ2Qj8Oe8HD3/4DFzm9DfBvm+CbBKYLWxeApV21tSaiztui/NdHU76y8m6v8j
         o9VqIdmDiJOZdfE4jxqkfoh/1sB/xke64WBwGGyVuztz1X5xKuG2koXnpfZN7g5t8Tfr
         ShSbl08hmaOEZoD+/t74gC1ewOaBfJjx72/E19jDdQ4JAlY6SJestPExU5NV4cwL1wpa
         Kk1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqiSe81YI0RnFRB2qsCDvgDCONO7nerPd7g70U+gd3FIbtRRqKbBDOyVu7HBu6ThC0+0SsyLBCN@lists.infradead.org
X-Gm-Message-State: AOJu0YwhPILAjPyDtTFGXB7wnczMebFDDew6eyQlfItWT6criRXXftg6
	fuDJBO5NediUJrv7FyhJhuHSgq7sEnp+LfUljelryla0oi95Xqxtnfzy8sba+z4hF9Ggkgo27ox
	lupNl6OdEwG3G7lMMnqeERvx0ccgOropJKbaPgLVRDVEgHFz0ADUmL6YDv51937okZs886+X6af
	VlU77zaVjNouoJ4tcQyPyj2luCJB+gBaRBWsI4rKLnwBqcz8smXYs=
X-Gm-Gg: AR+sD1336YmspqOkGCnC46th8bzC9fTE9jKx/vEY3kC/w1V6PSvmjdrRsECiQeAp3fn
	sXPHvxPlkRgSphRxkGhQaz5zwbOoJkmG4M2buHF0Reh3FGhZxgZuT68IEFdYbTpMzykMnqfFAhj
	RiS1KtVOHxPqggwnqGU0fTU8v+qcGaUiI1f+nEevfIrgV0GEFlDtMXd4I1TA==
X-Received: by 2002:a05:620a:2793:b0:92b:6805:91b7 with SMTP id af79cd13be357-930b4363334mr2169371385a.63.1784718006183;
        Wed, 22 Jul 2026 04:00:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2793:b0:92b:6805:91b7 with SMTP id
 af79cd13be357-930b4363334mr2169366985a.63.1784718005678; Wed, 22 Jul 2026
 04:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com> <20260717074413.2536416-3-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260717074413.2536416-3-anup.patel@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:29:54 +0530
X-Gm-Features: AUfX_mxy8_e2dkPmJL880u0iDJ3te8pPDb7SA7R7HfMeVLR4pnqwN0WxmgIU-bA
Message-ID: <CAFR3w36fjrhaciTGX+fTNL+NGy3kp-HR+9kdOXSeHG06mun+Kg@mail.gmail.com>
Subject: Re: [PATCH 2/5] lib: sbi: Introduce sbi_hart_protection_reconfigure() function
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX76TLdFvSIbbI
 Nbvx1cvT18w0vemmCv2YATRx1NV+NTEKKrNdmHVGOugd+5Ig9VJjX8BdSJV/slhixzf4WyPpauH
 3Bpa8li3URxN1CUFUq5ogm3LMqk2S0xHFLdQwMObxN28N3LGHOUSWL3+G2UJ26mUE34wO64ggt3
 PfRxjgQ4jU7adzDm9Gl5OSYdRm3dQglrIv+TPpR2c1j9pbrLN8mEYnkPZUnG+Q2OkhJmZhL1rJh
 lbXrcqkZPPO3zatR2hnJ2Oa7pcwU7dMmpi5aI2Xj9uZnvQEEI2Ffe9VIT12RgXqG2L9OnYPORWd
 H6DFUeunNQHzLE+8xOuWiq148fJEW33gBEh7mBApwxvS/w8lqXVaYfc46lULQl3UF7eL6hpqTTV
 Kt/6uTHB/pEiVglF/KxlM5J0Tp3V6LxG/wgX8xb3ElCV6MLUffJCVLsxMy1pf50cRr6c+WxbxDx
 I5suAOqffEJNNgC25yA==
X-Proofpoint-GUID: dCPULx1pk7qc-Y7PycihstahrWBKaMHr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfXwE/HXKh2NOhY
 uzrQHig6ifNEPbHwzdsHMwg37mIuSoBJ7C/DCOgfE097kQnnCV3NkfoTsIIm1PsBp5Hj2VrBdRh
 0s5zb7hrCc+/2rvHtYhyB1j+p1PFlwY=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a60a2b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=EiIeEIq6BTwfkuQ8DOwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: dCPULx1pk7qc-Y7PycihstahrWBKaMHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_040008_385023_C689CDB7 
X-CRM114-Status: GOOD (  15.65  )
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

T24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgMToxNeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBJbnN0ZWFkIG9mIGFzc3VtaW5nIHRoYXQgaGFy
dCBwcm90ZWN0aW9uIHJlY29uZmlndXJhdGlvbiBpcyB1bmNvbmZpZ3VyZQo+IGZvbGxvd2VkIGJ5
IGNvbmZpZ3VyZSwgaW50cm9kdWNlIGEgc2VwYXJhdGUgc2JpX2hhcnRfcHJvdGVjdGlvbl9yZWNv
bmZpZ3VyZSgpCj4gZnVuY3Rpb24gYW5kIHVzZSBpdCBpbiBzd2l0Y2hfdG9fbmV4dF9kb21haW5f
Y29udGV4dCgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3Mu
cXVhbGNvbW0uY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydF9wcm90ZWN0aW9uLmgg
fCAgNyArKysrKysrCj4gIGxpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgICAgICB8ICAzICst
LQo+ICBsaWIvc2JpL3NiaV9oYXJ0X3Byb3RlY3Rpb24uYyAgICAgfCAzMyArKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKPgo+Cj4gK2ludCBzYmlfaGFydF9wcm90ZWN0aW9uX2NvbmZpZ3VyZShz
dHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gK3sKPiArICAgICAgIHJldHVybiBfX2hhcnRf
cHJvdGVjdGlvbl9jb25maWd1cmUoc2NyYXRjaCwgc2JpX2hhcnRfcHJvdGVjdGlvbl9iZXN0KCkp
Owo+ICt9Cj4gKwo+ICt2b2lkIHNiaV9oYXJ0X3Byb3RlY3Rpb25fdW5jb25maWd1cmUoc3RydWN0
IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICt7Cj4gKyAgICAgICBfX2hhcnRfcHJvdGVjdGlvbl91
bmNvbmZpZ3VyZShzY3JhdGNoLCBzYmlfaGFydF9wcm90ZWN0aW9uX2Jlc3QoKSk7Cj4gK30KPiAr
Cj4gK2ludCBzYmlfaGFydF9wcm90ZWN0aW9uX3JlY29uZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRj
aCAqc2NyYXRjaCkKPiArewo+ICsgICAgICAgc3RydWN0IHNiaV9oYXJ0X3Byb3RlY3Rpb24gKmhw
cm90ID0gc2JpX2hhcnRfcHJvdGVjdGlvbl9iZXN0KCk7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsK
PiArICAgICAgIF9faGFydF9wcm90ZWN0aW9uX3VuY29uZmlndXJlKHNjcmF0Y2gsIGhwcm90KTsK
PiArICAgICAgIHJldCA9IF9faGFydF9wcm90ZWN0aW9uX2NvbmZpZ3VyZShzY3JhdGNoLCBocHJv
dCk7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0OwpTaW1w
bHkgLSAgcmV0dXJuICBfX2hhcnRfcHJvdGVjdGlvbl9jb25maWd1cmUoc2NyYXRjaCwgaHByb3Qp
OwoKPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
