Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71362CD3427
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 04:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJ00f8bubOcUqyb2Ovb7mZk/xSmnPj3DGYZqP4LWjNI=; b=35k/9nhx3tZOUV
	jO6DvwpyOmjT9x8l0l1fGzPELa584MWDgijPg9VwSBIA99EI2tLS2v7WBswtnU3Kb8be9rExYijjT
	c9yH6XkLT9N6Gsm7beJ2N0LKr6H0jBFwWmFvcol+5G5/hKSlTKYaRMk02EedwtEt5/1sP0LVvK+EX
	QCBXCAFFSJ/xBCNwEL0N284fZjRfpmM1nWkJ+gHAlcoOzDUKa1FSDx38lVnWFfzWkH85HyqDuCOFP
	+9i6kGqOqmgk7x8U+7RajCXDlOaqYjs4BvC2mgfZ+zvDAZidoCAttx8cgB1R2FFBvPiOB6sTLsOkA
	XtY6OzRR0ruGVw4yzQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIOd-0000000CHS0-0I8O;
	Mon, 11 May 2026 04:37:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIOa-0000000CHRG-0gEe
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 04:37:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64AJJlZs3152331
	for <opensbi@lists.infradead.org>; Mon, 11 May 2026 04:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0vkYCuGapSrWpGg/Bu1np4ALnxEBIsyZ0FuyukoPAw=; b=SH1BDPJ5vBv3TdNW
	qU4cp53sZZMCNtgmDZ30Jx4tpk1FgC56iaHmTGGWYrWhW4hTiXRuramiKr3ad78J
	h7wF0qHxix2y+srvDuN/r2Cu+sHwkOrkb81kPFmaAe7iwEg4S/K29JXIzncQ55w0
	X1viW9CZznxkITYXAE/0cOvJChLXEkFO3l9OJ4CxxkxzvUQK43Xhr37g46z+fO6o
	/ROuT4tegYfOkF0zqYs99okhhM/8pegEj8B7z4BTkEeZoqSdg1fuXlrndSj7Kuv3
	jL3/9C+9x0tVLwAcvhSq1C7EovzPHcXzve9ZXrVCIyB6RUeJwRur0/hCy9r7FaiS
	xnR3LA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dksjjyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 11 May 2026 04:37:30 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6948c46e69aso3896957eaf.1
        for <opensbi@lists.infradead.org>; Sun, 10 May 2026 21:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778474249; cv=none;
        d=google.com; s=arc-20240605;
        b=K4qHf0hP9uem8Z/ePnPR/daukgMdkZLBOPDIerjbKAdvQJipXGpch8mB5vYo7Effc9
         Q8kBHslC/XjnJj/hOQsFqVu7wVuSKnx0K8jlar9yPbo+6w0N4nR09d2cPS4NTJNaJPMC
         2YMSSoqZcyEEoSotdVDA96wVLhQKOpSbEQh/0T04FVz0yTepO4/71mcTTkYlbm3kKua5
         KkoGrnaiwbnDFwI14THbDLRsQZhUpL7Hl9z/ntm9wtDYUk0mvaieuqKEEBRikemuknIs
         C3JsAWunLeMLmwCGSLOxpgptcr8F9xIaxX0w3V/wv5yCxHDmNbWYxuN0i9yQy5DEJfM1
         qLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0vkYCuGapSrWpGg/Bu1np4ALnxEBIsyZ0FuyukoPAw=;
        fh=938d33QMqbrLRwjaZpubPfBSn72yIDoaEkAuS0iC7n4=;
        b=VyEqQ9D8c6VwYkM0ECiZANcyI8R0RGhVQMq/b5a7cW09e/NybpzBf1vVmJZXZp6zo3
         owLr9ahMMZ+3ruQHtVDxfxQDPc11N9zROWj2rLt1CjbUqHAcMsvIW4lzrK70pSJYWmEA
         K86oOg99kN7Q87SIBhdl71Bl77TwKU/GoEoBq9LoBK708MRTaRC79V1Ar9ettZFEzyAn
         8U6RE7ed0AdiQa7Dha0lBD4DpsvQt/T/YEqVaxN3iCcIqWyOa7IdEIIiGIrWEITu3vZX
         PHXeromKDdSyIZU3ZtxVknkNAgP2QFTPVd0XSE8fMRLXMvf/K5VzAnHu25SSYIw2bu51
         fTNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778474249; x=1779079049; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0vkYCuGapSrWpGg/Bu1np4ALnxEBIsyZ0FuyukoPAw=;
        b=kHkkoKXp0Pq0lpkiFTSjuB5AvqYRzjxW1gWTmlbULzYeTd1lovxGqTmPdtVcSXUwUD
         43rZo/X1ba+bQQ0Y4eaugHAPrB9I+JD2i6W2O+CpfkmxVsTZpGaS5lCeg1Qzk6kYd5da
         mQkOLbxhUApO1WHhAZeRoApAO5oTllzxuxPXy1PlsK+LUZQ9UZT61+1zde12I0nexWyy
         fElogxZ0D0hbR/x2mrGxdKIjULFl0fjnY7qfeiZ0g6vW8+R06/FOI5GK8ghSCV0ysgUi
         7S9V9O6KjZNzsNFaYg0Q25mlupZpbaiMTN6L8skRoGFLEfsx3oaGBLi3JOfbMjQEJ2IN
         BAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778474249; x=1779079049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X0vkYCuGapSrWpGg/Bu1np4ALnxEBIsyZ0FuyukoPAw=;
        b=kwi7T/qVBxFQzUXxSDO2jMzbXXgLzT+3c8nr2mQK+i48qJZ8PM51DGxNMV1c1yRCYk
         8bragtjZJ6tRQhALoiiiajzI0BdhP7KLWt2BLvAvgDwuwlgyj2lRnM3oUloXzKtgY8ht
         AhuBfEkMEJs/xAo05EyfHkDcNpm7Alu0GdADE35SlGRHO7KIa57Cv2+RZK4o+KG2JftE
         vIUMN96X3xN0Ek6TPoJMic4O0XyQkuFM/lIuf2r1ONx+JL+YG9M1Y5NDseVwA8Du5MVc
         eK4tg5nDbnNsCm13cFdIySUL/HJlZB7CL1ccOpR5vSw8T2g7qkgmDMhT7FdrMJTs/8E3
         5I2A==
X-Forwarded-Encrypted: i=1; AFNElJ/ZzwDG8qJkbc1vw/VDC67ezcJ8DBcQ/vY/DgqYIroTAcL/5kVIQXHOL+dr62zfA9xkCxVMF93i@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxs5TKBYlDG1ZePiHI6ph/VjP0qbZv8vkyNheddG2/lS7uiOFy
	HOEcbiJxIPwry8Phx8zcwbrDUtkhzQxb18HDh9alL1gPFnNdyrFNfujyTbI+dxbiTmg8AXWyYN8
	xfXxAZBv89pxzLS/Jj5f+xaOv33zBrLamEViLIFy9sh8jvizzyDSYQEp6/z/14YCVpT0hZCw3IM
	0oeDllwAYuz7A/6Hu80nSZjs5iS6NqO7pxgsCAMaxP
X-Gm-Gg: Acq92OHPOt0TATeYLHNczZI6br9g5EP6OU7Z2du/GyvC8XI8LMa4sXWOmjhCCEpnu5T
	W9NmOguw5Vs+PZ3MC7QQYWh9fXDA6LxR6ebdGIR7/qYf79+OuqAudf3XOjcOVfSLik4ceSGRpoe
	Xe6t+vQTqSq4pH9NEMze8LEKDtSbIo2nevmmqVlYLoFz3xkT18L3x8gTDg3wZcxuXGvry5Xc0vT
	KpZ+e8=
X-Received: by 2002:a05:6820:2206:b0:696:6f52:95ea with SMTP id 006d021491bc7-69b36ad6472mr4235578eaf.7.1778474249599;
        Sun, 10 May 2026 21:37:29 -0700 (PDT)
X-Received: by 2002:a05:6820:2206:b0:696:6f52:95ea with SMTP id
 006d021491bc7-69b36ad6472mr4235568eaf.7.1778474249123; Sun, 10 May 2026
 21:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260509161849.2935816-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260509161849.2935816-1-anup.patel@oss.qualcomm.com>
From: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Date: Mon, 11 May 2026 10:07:18 +0530
X-Gm-Features: AVHnY4L-KxnkXmysrQLafhOpkK9-gN6ztE_u4mmYm2wG6cir-GpFcE5Ns_nP8zA
Message-ID: <CAPPZMLFPwL13s09YivtRz7pMhDk5fRvrdZ63XaUqwiJ4aQKkOg@mail.gmail.com>
Subject: Re: [PATCH] lib: utils: Fix LLVM compile error in MPXY client driver
 for RPMI MM
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA0OCBTYWx0ZWRfX9ErEFF6CMZcs
 QRvI375d14vBFIxiKthHx+CGh95vQZEyNynEYf21zLEN1aTpvCaFpTwjdbt9extlKfVCyNbOSOq
 x6U5QQd4K0muN8YFZYunxcXMy3STGkln+ansF8sc6Z7txBK2ojvSd71wc5otLIopY5YQY3XHkFC
 A+PJGuH5LYbRVZfukJp50ThsiAdNE9HGiET2+i4B/7ijzSeCgsBw8gPuhsj/Kp7avfXjDaz/P9x
 oH6uC4wn4QxzarioWoR2RWZP9q4CUnl4Ao0d0KkRggy7UwLp4jcbdo4HYfN7tO5Y1yF6UA938Io
 cXp9bKGU7yp3Jn+lWFvCctOU0UUA0F4c5Ni7lrBw6WzwjLUpIjz7b7VMqhOj74fQJsKKZKIBKUW
 HmbRiZpMwyAa3f4yKVdnVBPYjg3OXutRQgIzkJqqzfOrL2UYbeMGxtxfLzq0cRgVaT0QXCLZQpo
 kp1IC7skKKydgjdRzgw==
X-Proofpoint-ORIG-GUID: dx1S1fQvi02UMIxj88ZBp5lhOGIFWefu
X-Proofpoint-GUID: dx1S1fQvi02UMIxj88ZBp5lhOGIFWefu
X-Authority-Analysis: v=2.4 cv=cKjQdFeN c=1 sm=1 tr=0 ts=6a015d0a cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=gXv8PAPqxzWA6m_An00A:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_213732_251827_152475D2 
X-CRM114-Status: GOOD (  18.48  )
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

T24gU2F0LCBNYXkgOSwgMjAyNiBhdCA5OjU14oCvUE0gQW51cCBQYXRlbCA8YW51cC5wYXRlbEBv
c3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IFRoZSBmb2xsb3dpbmcgY29tcGlsZSBlcnJvciBp
cyBzZWVuIHdpdGggTExWTSBjb21waWxlcjoKPgo+ICBDQyAgICAgICAgcGxhdGZvcm0vZ2VuZXJp
Yy9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX21tLm8KPiBsaWIvdXRpbHMvbXB4eS9mZHRf
bXB4eV9ycG1pX21tLmM6MTc6NjogZXJyb3I6IHVzZSBvZiBHTlUgJ21pc3NpbmcgPScgZXh0ZW5z
aW9uIGluCj4gICAgICAgZGVzaWduYXRvciBbLVdlcnJvciwtV2dudS1kZXNpZ25hdG9yXQo+ICAg
IDE3IHwgICAgICAgICBbMF0gewo+ICAgICAgIHwgICAgICAgICAgICAgXgo+ICAgICAgIHwgICAg
ICAgICAgICAgPQo+IGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfbW0uYzoyNDo2OiBlcnJv
cjogdXNlIG9mIEdOVSAnbWlzc2luZyA9JyBleHRlbnNpb24gaW4KPiAgICAgICBkZXNpZ25hdG9y
IFstV2Vycm9yLC1XZ251LWRlc2lnbmF0b3JdCj4gICAgMjQgfCAgICAgICAgIFsxXSB7Cj4gICAg
ICAgfCAgICAgICAgICAgICBeCj4gICAgICAgfCAgICAgICAgICAgICA9Cj4gMiBlcnJvcnMgZ2Vu
ZXJhdGVkLgo+Cj4gQWRkIG1pc3NpbmcgIj0iIGluIG1tX3NydmNkYXRhW10gYXJyYXkgaW5pdGlh
bGl6YXRpb24gdG8gYWRkcmVzcwo+IHRoZSBhYm92ZSBpc3N1ZS4KPgo+IEZpeGVzOiAwYjA0MWU1
OGMwNzggKCJsaWI6IHV0aWxzOiBBZGQgTVBYWSBjbGllbnQgZHJpdmVyIGZvciBSUE1JIE1NIHNl
cnZpY2UgZ3JvdXAiKQo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3Nz
LnF1YWxjb21tLmNvbT4KCkxHVE0KClJldmlld2VkLWJ5OiBSYW5iaXIgU2luZ2ggPHJhbmJpci5z
aW5naEBvc3MucXVhbGNvbW0uY29tPgoKCj4gLS0tCj4gIGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5
X3JwbWlfbW0uYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3Jw
bWlfbW0uYyBiL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfbW0uYwo+IGluZGV4IDAxNjNk
MGQyLi5kNzE3NmFjYSAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1p
X21tLmMKPiArKysgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX21tLmMKPiBAQCAtMTQs
MTQgKzE0LDE0IEBACj4gIHN0YXRpYyBzdHJ1Y3QgcnBtaV9tbV9nZXRfYXR0cmlidXRlc19yc3Ag
cnNwOwo+Cj4gIHN0YXRpYyBzdHJ1Y3QgbXB4eV9ycG1pX3NlcnZpY2VfZGF0YSBtbV9zcnZjZGF0
YVtdID0gewo+IC0gICAgICAgWzBdIHsKPiArICAgICAgIFswXSA9IHsKPiAgICAgICAgICAgICAg
ICAgLmlkID0gUlBNSV9NTV9TUlZfR0VUX0FUVFJJQlVURVMsCj4gICAgICAgICAgICAgICAgIC5t
aW5fdHhfbGVuID0gMCwKPiAgICAgICAgICAgICAgICAgLm1heF90eF9sZW4gPSAwLAo+ICAgICAg
ICAgICAgICAgICAubWluX3J4X2xlbiA9IHNpemVvZihzdHJ1Y3QgcnBtaV9tbV9nZXRfYXR0cmli
dXRlc19yc3ApLAo+ICAgICAgICAgICAgICAgICAubWF4X3J4X2xlbiA9IHNpemVvZihzdHJ1Y3Qg
cnBtaV9tbV9nZXRfYXR0cmlidXRlc19yc3ApLAo+ICAgICAgICAgfSwKPiAtICAgICAgIFsxXSB7
Cj4gKyAgICAgICBbMV0gPSB7Cj4gICAgICAgICAgICAgICAgIC5pZCA9IFJQTUlfTU1fU1JWX0NP
TU1VTklDQVRFLAo+ICAgICAgICAgICAgICAgICAubWluX3R4X2xlbiA9IHNpemVvZihzdHJ1Y3Qg
cnBtaV9tbV9jb21tdW5pY2F0ZV9yZXEpLAo+ICAgICAgICAgICAgICAgICAubWF4X3R4X2xlbiA9
IHNpemVvZihzdHJ1Y3QgcnBtaV9tbV9jb21tdW5pY2F0ZV9yZXEpLAo+IC0tCj4gMi40My4wCj4K
Pgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
