Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF89C44512
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 05:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KD5rS9CQgZgXqnGbbAn0BVyUZRJbusP/8yUeGXyzxC0=; b=IOGm5lZBYm/j+e
	WIlf+33XUqSut4a79FUINB7cHWJpN+Ldbmvfkn8k/o9xecmaJHLlUplRo5HrezQdT4ZxU5UVcJD5l
	g5kQED/qfi0ermaZsfnfvDL5lvrFYGdg2sngMFWeOET+cUlt0tR/djEdrAJKwsGng4cnqalHsq7Eb
	LgoBx7qm+05hICDhCkjkkapjEJmTDvwuTDpTcOneGnaSLjW15VB4OufGFtYWyUq6xZOi6CkkXQyfW
	iTD04MmixsdYBIFe/afBxsS6LOaCWmsnKSzWKcnuRM2PNRIHpsRiwJomZzNe357yUE9xayu8XwIuA
	XW34W/KvoQzAbsnU2yBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPBm-0000000AuKl-3Pgg;
	Wed, 22 Jul 2026 05:08:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPBj-0000000AuKR-2QsT
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 05:08:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53Yix3882913
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 05:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yKWcKy38PSwUP0xy4INba9NwjJMuLyUMsA8oPa9LykU=; b=fTYMxUEslh8tqN6b
	gAh+fUVas1jgCHpOnVpBAMI+WdPJuOVsRhUyGvqZ8aCuYmGwPRAbnrD+zLBtFpX1
	ceZPXLT1vT6GnOo6isR4xH/mhqugRFtS2WuiD4Ac7enS2qJkxcZVRiVM2QfP8lMA
	OjDOYBjEhEeT5bAJHg84EulV47cYgU9RdO47cOKaN2v1ofRh5KUiYXGOULc12ORK
	t0OWhrrnub+7gmbpLSKvUtqRZFxE+skFw9EAz6L3n2CB5AiL31DBmXQ7rNF1y8GO
	LLba88+7dB/Y1V4mt6+23hXRDWKbcS2uywibOYHjDgpS/CihYwwA2n7cujqnuH5X
	PYi+MQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn0brv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 05:08:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so16606221cf.2
        for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 22:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784696888; cv=none;
        d=google.com; s=arc-20260327;
        b=RMFlZOYbw71i7C3YCJLlWRCC8vgyHa7PTgx0Xy0GFdwrXAd4/i0YDCooJzwwvjpioJ
         a60tfui0/TlLZh4QsLKALCNQC3bQwFyqBAg3I+XzLB6x7zbje4QWQtzVJythvLvWfk2e
         2DAQ80Rox8YENJ4ACmsTbWGmjTxUr1OWzFVKUwWaWDfOgIboOIw42gIUAOG/uyQaV9fV
         AOE2ZeZP6tVU04tKB9/4LINNv4aUwKBxHj25G49w6pzRIl6qykM6rCo/sEGp+ZQ1cdT7
         myYqtUpST34k2V/Zsats14sPNUULuxdjdcVZAvZoTBDHwo6/T1fxh2B8k9EBJZg27TH0
         jwBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yKWcKy38PSwUP0xy4INba9NwjJMuLyUMsA8oPa9LykU=;
        fh=auwy3+uibyFc2S5TgcZ1/qBCa5Akx8sgG3O4Qmj4HbI=;
        b=IRHIlcuARY9W3neeQUtAJedPF0ySayvlWqifO5Q4MuQBq3FZI4v6HhJErggxwWYUW8
         bAlZlyiiukJbjDRSQqeaYBeH73vTe+CmL7DwzdFs82usOrKy1p7ML5HxtiToubGZjXC2
         ZOyYdKK2b9i5jdhDUDY+/b1bCrAPa9xfA4Cu86EOU7nb8ARnz2x/iTzAP/4LYV2f0Gjq
         XTgO6JhlBEKRsxdjqL4diD9GN+P9fHlUiUWPA06ePvTZZm3UtngiSq5Nvw2vb67tpUtq
         Ls8o70Rj3NDzk8hk9Nw0Eqn/94hbhST7aks3sZUrxRA+hDzlH+MknJvQsf8kRto3M/5k
         GrRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784696888; x=1785301688; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yKWcKy38PSwUP0xy4INba9NwjJMuLyUMsA8oPa9LykU=;
        b=DL8rcu36d1GkO7ckVkIgIeToShXATdNXFI0+Mn/2rnHndjWWFOIPHkHQPLAgVTHzqJ
         bDNjNyBtJSwwwge68/d197DyHt5ooKPP8k3h+R6xca5sFnZMEhzMGYmUvvPBjXTf3UP8
         Z7/JBe4U4sJLi1hR4FY+Ilb1Tw6MpTvPk44IHFNtnZgm3DyvoID9IaRut/G+c6hhYjIT
         geVr0lrvc+YSJa1rQW4EQ4mdkOlXR1IGm0gq0MKz4WEm3fJd7DAyjN2qOWD15Z5l/TJ0
         rPWyWrrJselILmgGdIu8evKDt/kDFgzw1hA2OV4lpQEzZfaAjbGZLCpbOfvO61tSOBDp
         kxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784696888; x=1785301688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKWcKy38PSwUP0xy4INba9NwjJMuLyUMsA8oPa9LykU=;
        b=R1wh8UhfIykHe3VqI+pOW5FTEkWRJgFqcUO29sUSSBPjSRhe2zKhXJpoUoNJ3ZJzZB
         r0zUt+dFrYPQcP6TMx6M0H1bJe/a920WmWFBtpwuFByZyTxt+L0+MZ+AyvJQEkWlG9PI
         ere/K0BlqPReyyR7c1NNYq+ax1b5wqYoyBQFLx+P9+fOHMXyYG8CRLpTS4+odKfvHbI8
         BieNaXPTVd6bpWx6vfK1HU5F7YCRjG8k+7M0PGnesKqS2nlApsgozA/qLNtpj07OVN5R
         KLgCsloikiyQPqB/eAJqowrcCroJa86USPl0APiPtVm/93fCUPFZCg+2zsF/Jmyyr7/K
         PL8g==
X-Gm-Message-State: AOJu0YzfyDqsdWr4RsoMxavAtb8nPYBy73KI/0Nqt6W7TF5wloqdlUm1
	8EpkiQSvrmg4SWLWkYaw/6r35xGmUfZ4OLGIEOrwYVIr9PTVhnz7psutP31WdvGY6p9lyUFDnoR
	ILEwIbgklrnPWsIoKXcyyjWpzONz8YyZ9TgddN2k8EZf8NNd2KQ14XKOrX97pOlDSXCsX6X48QY
	h6HDGCxpgFAmkeDW5wscskzkVTJgT+GieGf7+b8v3Xa4XKLnr9UeY=
X-Gm-Gg: AR+sD12KjZed5OPeDGQRldj5REJpcmxgIrRSE68GqAUuKyOwvyrSO5WKaV/9FriOR2O
	WI8dhgKULNw+Mrjwfzj3fWyLTNcEVVFVWiMGqNgN2VcUSHV6c+4s43yXqy5kTtgJAdZHEsKsuDe
	2f5DbBDSBO8SI45qdUlcZvctwLM1ruuFs8/c1mHcWNfz4bLB56uU+nwv2Ing==
X-Received: by 2002:a05:622a:306:b0:51c:439c:babb with SMTP id d75a77b69052e-5213cada127mr207005621cf.47.1784696887808;
        Tue, 21 Jul 2026 22:08:07 -0700 (PDT)
X-Received: by 2002:a05:622a:306:b0:51c:439c:babb with SMTP id
 d75a77b69052e-5213cada127mr207005411cf.47.1784696887191; Tue, 21 Jul 2026
 22:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:37:54 +0530
X-Gm-Features: AUfX_mys0vQbxUTOLBCqS1f-MhyUckYCHsblAk8ZBKzj41yJA-7G5gba0jy_MRQ
Message-ID: <CAFR3w35Uke4F5pSsGaFLnJ482LvZqQthzLBGXX1kut3tNeOBVg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Add Smsdid and Smmpt supervisor domain protection
To: opensbi@lists.infradead.org
Cc: rahul@summations.net
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a605038 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=xvfqbYfxAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=MMxL3egQxB1LGiTv6NkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: _OpgiwSt5RTh7p82wTB9SNj6nTqK87RY
X-Proofpoint-ORIG-GUID: _OpgiwSt5RTh7p82wTB9SNj6nTqK87RY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0MyBTYWx0ZWRfX1z5JHqq32QNG
 Hv/evHzuERC36AG+AJjQAEcnDYtMzfCGGtjIKu+mnC1Le/A56lyqzFRfwtZ/NaHdqAKGZPbeLbf
 pkLPAXrfC8MHTHLj+aXeongGOnpgY1o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0MyBTYWx0ZWRfX32q3I0zxbsxx
 mLFbndaSjArJEe6AGU3g9HV95CweYHwi/SguEK/mYwsq7w1exKMKIKEbgRrr+evPBzS26WCBWtf
 7sGNo4veF/AW25IUaRxAMF6CylvgtTllwIfRyAqXwx5mWfJf1rFR2TlmToIH4QNFU7W8Wig7hp5
 CKEso+Aim3k8/5N3/OitYqekpY+sZAsDkr1n1SZ9GcrRv0iOH3IsA0exxf8qbm2uY2GlTao2Gnc
 0v68BzIEVZNQKXLSsEpyjyXctOldOMgGHOlRO0xHu4L42p0r4ug0VG7SKDS4chYEaMQsrEUecbC
 K/Kaz88mxI4SJz5msBm+SBCB/TFlCimTvM45BOcnlIhm+1b/HpowPHFTY4eel4HBp2bcBZmGy6H
 FQSP7zNySwozxWbFOiWUihtdmXRh4G2jnkjL8Hj0VN/jszDONqMzuJIOQYRp/u6mKtz73+mMjF6
 memMXuEPBCEGqDiEDVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_220811_792344_9DAA414C 
X-CRM114-Status: GOOD (  27.30  )
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

SGksCgpJIGFsc28gc2hvdWxkIGhhdmUgbWVudGlvbmVkIHRoYXQgdGhpcyBpcyBiYXNlZCBvbgpS
SVNDLVYgU01NVFQgc3BlYyAwLjQ5IC0KaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXNt
bXR0L3JlbGVhc2VzL3RhZy92MC40OQp3aGljaCBpcyB0aGUgbGF0ZXN0IHZlcnNpb24gY3VycmVu
dGx5LgoKVGhhbmtzClJhaHVsCgpPbiBXZWQsIEp1bCAyMiwgMjAyNiBhdCA5OjA14oCvQU0gUmFo
dWwgUGF0aGFrCjxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGlz
IHNlcmllcyBhZGRzIE9wZW5TQkkgc3VwcG9ydCBmb3IgdGhlIFJJU0MtViBTTU1QVCBzcGVjaWZp
Y2F0aW9uCj4gc3ViLWV4dGVuc2lvbnMgLSBTbXNkaWQgKHN1cGVydmlzb3IgZG9tYWluIElEKSBh
bmQKPiBTbW1wdCAoc3VwZXJ2aXNvciBkb21haW4gbWVtb3J5IHByb3RlY3Rpb24pLgo+Cj4gVG9n
ZXRoZXIgdGhlc2UgbGV0IE0tbW9kZSBmaXJtd2FyZSBjb25maW5lIGVhY2ggc3VwZXJ2aXNvciBk
b21haW4gdG8gYQo+IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgdGhhdCBpcyBlbmZvcmNlZCBpbiBo
YXJkd2FyZSwgdmlhIGEgcGVyIGRvbWFpbgo+IG1lbW9yeSBwcm90ZWN0aW9uIHRhYmxlIChNUFQp
IHNlbGVjdGVkIGJ5IHRoZSBtbXB0IENTUi4KPgo+IEV2ZXJ5IHN1cGVydmlzb3IgZG9tYWluIGdl
dHMgaXRzIG93biBNUFQgYnVpbHQgZnJvbSB0aGUgbWVtb3J5IHJlZ2lvbnMKPiBvZiBpdHMgU0JJ
IGRvbWFpbi4gUGVyLXJlZ2lvbiBYV1IgcGVybWlzc2lvbnMgYXJlIGRlcml2ZWQgZnJvbSB0aGUK
PiByZWdpb24ncyBTL1UgYWNjZXNzIGZsYWdzIGZyb20gU0JJIGRvbWFpbiwgc28gYSByZWdpb24g
dGhhdCBkb2VzIG5vdCBoYXZlIFMvVQo+IGFjY2VzcyBpcyBtYXBwZWQgYXMgYW4gZGVueSBpbnN0
ZWFkIG9mIHNraXBwZWQuCj4KPiBUaGUgUm9vdCBkb21haW4gbWFwcyBhbGwgcGh5c2ljYWwgbWVt
b3J5LCB3aXRoIHRoZSBmaXJtd2FyZSByZWdpb24gZXhwbGljaXRseQo+IGRlbmllZCB0byBTLW1v
ZGUuIFJlZ2lvbnMgbWF5IGJlIHNoYXJlZCBiZXR3ZWVuIGRvbWFpbnMsIGVhY2ggc2lkZSBrZWVw
aW5nCj4gaXRzIG93biBwZXJtaXNzaW9ucy4KPgo+IFRlc3Rpbmc6Cj4gQm9vdGVkIExpbnV4IHdo
ZW4gU21tcHQgd2FzIGFjdGl2ZS4gVGhlIGJvb3QgZHVtcCBzaG93cyB0aGUgZXhwZWN0ZWQgcGVy
cmVnaW9uCj4gcGVybWlzc2lvbnMuIEFsc28gY2hlY2tlZCB3aXRoIGEgc21hbGwgc2VsZi10ZXN0
IGluIFFlbXUgd2hpY2ggY29uZmlybXMgdGhlCj4gZmlybXdhcmUgcmVnaW9uIGRlbmllZCBhbmQg
dGhlIGtlcm5lbCByZWdpb24gcGVybWl0dGVkIGZyb20gUy1tb2RlLgo+Cj4gVGhlIFFlbXUgUklT
Qy1WIFZpcnQgbWFjaGluZSB3YXMgdXNlZCB0byB0ZXN0IHRoaXMuIFRoZSBuZXcgY2xpIGFyZ3MK
PiByZXF1cmllZCB0byBiZSBwYXNzZWQgdG8gUWVtdSBhcmUgLQo+Cj4gLi9xZW11LXN5c3RlbS1y
aXNjdjY0IC1ub2dyYXBoaWMgLU0gdmlydCAtY3B1IHJ2NjQseC1zbXNkaWQ9dHJ1ZSx4LXNtbXB0
PXRydWUKPgo+IFBsZWFzZSBub3RlIHRoYXQgZXh0cmEgc29tZSBsb2dzIGluIE9wZW5TQkkgYW5k
IFFlbXUgYXJlIGFkZGVkIGZvciB0ZXN0aW5nCj4gd2hpY2ggd2lsbCBiZSByZW1vdmVkIGxhdGVy
Lgo+Cj4gVGhlIFFlbXUgbG9nIGZvciBzbW1wdF9jaGVja19hY2Nlc3MgaXMgY3VycmVudGx5IGNv
bW1lbnRlZCBpbiB0aGUgcWVtdQo+IGJyYW5jaCB0byBsZXQgbGludXggYm9vdCBsb2dzIHByaW50
LiBCdXQgaXRzIHByZXNlbnQgdGhlcmUgZm9yIGFueW9uZSB0byBlbmFibGUKPiBhbmQgY2hlY2su
Cj4KPiBCb290IExvZ3M6Cj4KPiBzYmlfbXB0OiBtb2RlPVNtbXB0NTIgICAgU0RJRExFTj02IG1h
eF9kb21haW5zPTY0Cj4gcm9vdF9zaXplPTB4MTAwMCByb290X2FsaWduPTB4MTAwMAo+IGZ3IDB4
MDAwMDAwMDA4MDAwMDAwMCsweDE5ZTAwMCAgcG9vbD1nbG9iYWwgaGVhcAo+IFNESUQgIDAgcm9v
dD0weDAwMDAwMDAwODAwOTgwMDAgcmVnaW9ucz05IGRvbT1yb290Cj4gUy1Eb21haW4wIFJlZ2lv
bjAxICAgICAgICAgIDogMHgwMDAwMDAwMDgwMDAwMDAwKzB4ODAwMDAgICAgICAgICAgIDogeHdy
PTAgKC0tLSkKPiBTLURvbWFpbjAgUmVnaW9uMDIgICAgICAgICAgOiAweDAwMDAwMDAwODAwMDAw
MDArMHgyMDAwMDAgICAgICAgICAgOiB4d3I9MCAoLS0tKQo+IFMtRG9tYWluMCBSZWdpb24wMyAg
ICAgICAgICA6IDB4MDAwMDAwMDAwMDEwMDAwMCsweDEwMDAgICAgICAgICAgICA6IHh3cj0zIChS
Vy0pCj4gUy1Eb21haW4wIFJlZ2lvbjA0ICAgICAgICAgIDogMHgwMDAwMDAwMDEwMDAwMDAwKzB4
MTAwMCAgICAgICAgICAgIDogeHdyPTMgKFJXLSkKPiBTLURvbWFpbjAgUmVnaW9uMDUgICAgICAg
ICAgOiAweDAwMDAwMDAwMDIwMDAwMDArMHgxMDAwMCAgICAgICAgICAgOiB4d3I9MCAoLS0tKQo+
IFMtRG9tYWluMCBSZWdpb24wNiAgICAgICAgICA6IDB4MDAwMDAwMDAwYzQwMDAwMCsweDIwMDAw
MCAgICAgICAgICA6IHh3cj0zIChSVy0pCj4gUy1Eb21haW4wIFJlZ2lvbjA3ICAgICAgICAgIDog
MHgwMDAwMDAwMDBjMDAwMDAwKzB4NDAwMDAwICAgICAgICAgIDogeHdyPTMgKFJXLSkKPiBTLURv
bWFpbjAgUmVnaW9uMDggICAgICAgICAgOiAweDAwMDAwMDAwODAwMDAwMDArMHgxOWUwMDAgICAg
ICAgICAgOiB4d3I9MCAoLS0tKSBbTE9DS0VEXQo+IFMtRG9tYWluMCBEZWZhdWx0ICAgICAgICAg
ICA6IFJlc3Qgb2YgdGhlIGFkZHJlc3Mgc3BhY2UgICAgICAgICAgICA6IHh3cj03IChSV1gpICAg
W2Jhc2VsaW5lLCBvdmVybGF5IGJ5IHJlZ2lvbnMgYWJvdmVdCj4gQm9vdCBIQVJUIElEICAgICAg
ICAgICAgICAgIDogMAo+IEJvb3QgSEFSVCBEb21haW4gICAgICAgICAgICA6IHJvb3QKPiBCb290
IEhBUlQgUHJpdiBWZXJzaW9uICAgICAgOiB2MS4xMgo+IEJvb3QgSEFSVCBCYXNlIElTQSAgICAg
ICAgICA6IHJ2NjRpbWFmZGNoCj4gQm9vdCBIQVJUIElTQSBFeHRlbnNpb25zICAgIDogc3N0Yyx6
aWNudHIsemlocG0semljYm96LHppY2JvbSxzZHRyaWcsc3ZhZHUsZixkLHNtc2RpZCxzbW1wdAo+
IEJvb3QgSEFSVCBQTVAgQ291bnQgICAgICAgICA6IDE2Cj4gQm9vdCBIQVJUIFBNUCBHcmFudWxh
cml0eSAgIDogMiBiaXRzCj4gQm9vdCBIQVJUIFBNUCBBZGRyZXNzIEJpdHMgIDogNTQKPiBCb290
IEhBUlQgTUhQTSBJbmZvICAgICAgICAgOiAxNiAoMHgwMDA3ZmZmOCkKPiBCb290IEhBUlQgRGVi
dWcgVHJpZ2dlcnMgICAgOiAyIHRyaWdnZXJzCj4gQm9vdCBIQVJUIE1JREVMRUcgICAgICAgICAg
IDogMHgwMDAwMDAwMDAwMDAxNjY2Cj4gQm9vdCBIQVJUIE1FREVMRUcgICAgICAgICAgIDogMHgw
MDAwMDAwMDAwZjRiNTA5Cj4gUUVNVTogc21tcHRfY2hlY2tfYWNjZXNzOiBhZGRyPTB4ODAwMTAw
MDAgbW9kZT0yIHNkaWQ9MCBtcHRwcG49MHg4MDA5OCB4d3I9MCBhY2Nlc3N0eXBlPTAgLT4gREVO
WQo+IFFFTVU6IHNtbXB0X2NoZWNrX2FjY2VzczogYWRkcj0weDgwMjAwMDAwIG1vZGU9MiBzZGlk
PTAgbXB0cHBuPTB4ODAwOTggeHdyPTcgYWNjZXNzdHlwZT0yIC0+IFBFUk1JVAo+IFFFTVU6IFNF
TEZURVNUIGZ3KDB4ODAwMTAwMDApPURFTlkob2spICBrZXJuZWwoMHg4MDIwMDAwMCk9UEVSTUlU
KG9rKQo+IFFFTVU6IHNtbXB0X2NoZWNrX2FjY2VzczogYWRkcj0weDgwMjAwMDAwIG1vZGU9MiBz
ZGlkPTAgbXB0cHBuPTB4ODAwOTggeHdyPTcgYWNjZXNzdHlwZT0yIC0+IFBFUk1JVAo+IFFFTVU6
IHNtbXB0X2NoZWNrX2FjY2VzczogYWRkcj0weDgwMjAxMGQ4IG1vZGU9MiBzZGlkPTAgbXB0cHBu
PTB4ODAwOTggeHdyPTcgYWNjZXNzdHlwZT0yIC0+IFBFUk1JVAo+IFFFTVU6IHNtbXB0X2NoZWNr
X2FjY2VzczogYWRkcj0weDgxYzI1MDAwIG1vZGU9MiBzZGlkPTAgbXB0cHBuPTB4ODAwOTggeHdy
PTcgYWNjZXNzdHlwZT0xIC0+IFBFUk1JVAo+IFFFTVU6IHNtbXB0X2NoZWNrX2FjY2VzczogYWRk
cj0weDgxYzI2MDAwIG1vZGU9MiBzZGlkPTAgbXB0cHBuPTB4ODAwOTggeHdyPTcgYWNjZXNzdHlw
ZT0xIC0+IFBFUk1JVAo+IFFFTVU6IHNtbXB0X2NoZWNrX2FjY2VzczogYWRkcj0weDgxYzI3MDAw
IG1vZGU9MiBzZGlkPTAgbXB0cHBuPTB4ODAwOTggeHdyPTcgYWNjZXNzdHlwZT0xIC0+IFBFUk1J
VAo+IFFFTVU6IHNtbXB0X2NoZWNrX2FjY2VzczogYWRkcj0weDgxYzI4MDAwIG1vZGU9MiBzZGlk
PTAgbXB0cHBuPTB4ODAwOTggeHdyPTcgYWNjZXNzdHlwZT0xIC0+IFBFUk1JVAo+IFFFTVU6IHNt
bXB0X2NoZWNrX2FjY2VzczogYWRkcj0weDgxYzI5MDAwIG1vZGU9MiBzZGlkPTAgbXB0cHBuPTB4
ODAwOTggeHdyPTcgYWNjZXNzdHlwZT0xIC0+IFBFUk1JVAo+Cj4KPiBUaGUgY29ycmVzcG9uZGlu
ZyBRZW11IFNtbXB0IHN1cHBvcnQgd2FzIGFsc28gYWRkZWQgd2hpY2ggaXMgcHJlc2VudCBoZXJl
IC0KPiBodHRwczovL2dpdGh1Yi5jb20vcGF0aGFrcmF1bC9xZW11L3RyZWUvcnBhdGhha19zbW1w
dF92MQo+Cj4gVGhlc2UgT3BlblNCSSBjaGFuZ2VzIGFyZSBhbHNvIHByZXNlbnQgaW4gZ2l0aHVi
IC0KPiBodHRwczovL2dpdGh1Yi5jb20vcGF0aGFrcmF1bC9vcGVuc2JpL3RyZWUvcnBhdGhha19z
bW1wdF92MQo+Cj4gRnVydGhlciBEZXZlbG9wbWVudDoKPiBUaGlzIHNlcmllcyBhZGQgYmFzZSBp
bmZyYXN0cnVjdHVyZSBmb3IgU21zZGlkIGFuZCBTbW1wdC4gRGV2ZWxvcG1lbnQKPiBhbmQgdGVz
dGluZyB3aXRoIG1vcmUgdGhlbiBvbmUgU3VwZXJ2aXNvciBEb21haW4uIEV4dGVuc2l2ZSB0ZXN0
aW5nIHdpdGgKPiBhbGwgdGhlIG1vZGVzIGFuZCBvdGhlciBwbGF0Zm9ybSBjb25maWd1cmF0aW9u
cy4KPgo+IFJhaHVsIFBhdGhhayAoNSk6Cj4gICByaXNjdjogQWRkIFNtc2RpZCBhbmQgU21tcHQg
aGFydCBleHRlbnNpb25zCj4gICBtcHQ6IEFkZCBTbXNkaWQgYW5kIFNtbXB0IHN1cGVydmlzb3Ig
ZG9tYWluIGNvcmUKPiAgIHBsYXRmb3JtL2dlbmVyaWM6IEluaXRpYWxpc2UgTVBUIGF0IGJvb3QK
PiAgIHNiaTogaHNtOiBBY3RpdmF0ZSBNUFQgZm9yIGRvbWFpbiBvbiBoYXJ0IHN0YXJ0L3Jlc3Vt
ZQo+ICAgc2JpOiBpbml0OiBQcmludCBzdXBlcnZpc29yIGRvbWFpbnMgYXQgYm9vdAo+Cj4gIGlu
Y2x1ZGUvc2JpL3NiaV9oYXJ0LmggICAgICB8ICAgNSArLQo+ICBpbmNsdWRlL3NiaS9zYmlfbXB0
LmggICAgICAgfCAzMjEgKysrKysrKysrKysrKwo+ICBsaWIvc2JpL29iamVjdHMubWsgICAgICAg
ICAgfCAgIDIgKwo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgICAgICAgfCAgIDIgKwo+ICBsaWIv
c2JpL3NiaV9oc20uYyAgICAgICAgICAgfCAgIDcgKwo+ICBsaWIvc2JpL3NiaV9pbml0LmMgICAg
ICAgICAgfCAgIDQgKwo+ICBsaWIvc2JpL3NiaV9tcHQuYyAgICAgICAgICAgfCA4ODIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgbGliL3NiaS9zYmlfbXB0X21vZGUuYyAg
ICAgIHwgODkxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBwbGF0Zm9y
bS9nZW5lcmljL3BsYXRmb3JtLmMgfCAxMDEgKysrKwo+ICA5IGZpbGVzIGNoYW5nZWQsIDIyMTQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9zYmkvc2JpX21wdC5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvc2JpL3NiaV9tcHQuYwo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfbXB0X21vZGUuYwo+Cj4gLS0KPiAyLjUx
LjAKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
