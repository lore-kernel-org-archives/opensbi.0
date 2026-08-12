Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A08C5B56A
	for <opensbi@archiver.kernel.org>; Wed, 12 Aug 2026 11:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydD/R96CC2DfgupnYJtN1GNzzuO+SUlEYWvIAlGpbtY=; b=0gXAJywKIg0qIF
	q+B5xNq69SRoODezOwaOQ+jsNoc/14T1Gz7gJromJ/GXZMAL1VxtMeGqBkyvOCLBWCEQ8crmR6Vls
	SJx3cQNQfjq099wTW7KjOzRVbpIZF5u1syPilqE7JrDn75WD3OjsfBRoDDKnJLB0dtePTke/KpDHB
	klIIH65D1YVwa1FzFqVWuxhWC8J6YDptvfEb68H0nyd7S0CcMbRF+qeX4J1kC9QaSm0YBoWNF6bh4
	L39pJ21ZyFLna7jn9fnjycBnzIEZqm2ZRCw18pB3yHuRnMh8bbdgo+KtkuLLjdTXnVSQnsKGshmvq
	1Er0eAnxfaa0FIkq1AHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7NR-0000000G7e5-04P5;
	Wed, 12 Aug 2026 11:44:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7NM-0000000G7cR-3Aoz
	for opensbi@lists.infradead.org;
	Wed, 12 Aug 2026 11:44:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4QZW2395873
	for <opensbi@lists.infradead.org>; Wed, 12 Aug 2026 11:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qxiII+7KyK3Dr5IXpkx7OTwlg3XjIhZKgKzxTvI5eA=; b=cYne18lwJekS/EIO
	EbGUtgwJ6A3KkzE8HuDmxaRacn2ba+6MZaGPrx/rIfctDd8bmpS/qnBrdpf0N3iI
	A3+9zv6yeJaX6aqeVzbWbCG3IEg38CEonwBqnyyLecqh1lkoDv5zkspHe7AA5TFR
	aFWGmz6riXW/EiZMM9NjAF5zSj1Ldaq3gL1sC2N0D75VKe0Gxq2PjncU7b1xGlRb
	Uj69bZTweT+7DkqCSg5sEJcS6TsyG4fMBnXnzXqZep5WwmMJjIH445xMEJxUiyoc
	/+4zPh8wXkP7IQfR2CUrvDYTLmD2ztuk2+i/tqN5XwS2aEUUEkjl0luHrTHl27mt
	8e5tYA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw1m6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 12 Aug 2026 11:44:03 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-451d8064053so1033174fac.0
        for <opensbi@lists.infradead.org>; Wed, 12 Aug 2026 04:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786535043; cv=none;
        d=google.com; s=arc-20260327;
        b=IvSWeXOdQiO8GYoKROU6aqRdwT8CgkqyBway43Ow3ZodSWErXhqRAhTXeyZ5FTO+XU
         6qjUf7W9utWcxFRB6dlxoDrs1MQ5rnYhVoig0tPv7e3eMEu+wpS7pWfVunnVk9WQKuSJ
         wjs0+CmzEdnDtNHE2pj6o6SH53gqHCcGIJHL3sA+yJiTQs7XMDxZHVc2EJoZ7SgIr/St
         5AmPgIWRVm0jJ8P3tVu7qau9uFPSiRlgMhFr5mKSCmY3mBrMRkALIvCV2FLGRjv6HJNg
         y4UG9RjKLX09lFKfCKKDdH2E20vcCHdPQY1gVUAKCjOoqf9xaphD0FtfPcVioEljbNMh
         vq9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qxiII+7KyK3Dr5IXpkx7OTwlg3XjIhZKgKzxTvI5eA=;
        fh=MdmvXSUFENyCa9IM0o2OrD48qc7mts4Xf6MuVA5kyZ4=;
        b=Q/LtsBvl3vuGLcuYm+hoczCEvgUkwa56cWDpj4a0Fckis/IAdQ3lZ6f6LvxpW8tNNv
         VyB1FgzlMvafbnzOT8NExUFD0mr8RHsT8fZ+lueMQNoVcwyeKYLNEVpy4g/HJFzv8AKe
         2qPzNkUppV7J6ipMh2Uh3ri2zg5Z0mASDM82LXAF5WT3XL3XZ83nPXnlNphVvrmjt2Pp
         XXnUhGeqXR7b6o4YjT3y5X7nBr6ySb7tt7rt7eJhW6ScrCr1gRUB1pSZre8XTE/q6pJU
         +DDNJGmGUimL5Bd/IuEhXCQnC0uVEwycX7VyTQcOaPHOUem4mk3w5uZfG+TdZjlg1OEy
         cBXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786535043; x=1787139843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qxiII+7KyK3Dr5IXpkx7OTwlg3XjIhZKgKzxTvI5eA=;
        b=evFb7x3K6ECMQ5+gA+4MPErvYMQqPbC8vZOpk62uEXY9ovJ/jhQIfMfxJdI8RFQ8Tz
         seetdaRzL+Iqc5SZWK0Wxwu4na7KXBGPK9HLncyIISnMoxsvPkXMkggi/ln1siCD4MdZ
         EdOadF9HStzDCdhiVnrw8fdeNW82lM7ojoNhgUD1b2at8zuycf8wle8WQYzOQKRDKCz5
         RXK9oTB7hFAWqGAtjr747Ocggnk/GypWTmNb36Glh8bLFI9Fm/8kw93LMua85zwz281T
         9KqxBbvqZrxzu584EulOaP8yHARNzqmFv9hulu298udJRBH6N006GVXuYKtpBtnRm2Zr
         /Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535043; x=1787139843;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qxiII+7KyK3Dr5IXpkx7OTwlg3XjIhZKgKzxTvI5eA=;
        b=XVNv+hTEk1pMe5I+kPJAnxmmmMC0fvtOqoli4kmX5cxgqydMQiYW5Y9HYGW1yBpUzU
         yUa+i9eu7rAHsQnioyb+ZVG9dS4cET1IpQVC5ApHfLqUzQo62+xvKFZCAtyd4t0Tbj0R
         TEFrhbHtsdjXInaj80XLMShkZX9MwdyjvfHHyQpzu6tO3E+UFenTG38XRCEooF+fUo7d
         MOq4v0UhPbbHZAIZyflnpPOnWLgx7Gx5Kc/TYFlq6TVvLCISpdX08+ErLZIlEqCqlPrt
         ExAGvc9A1peDu3+x2WMuaxDf5ZlJJJzdwVKq9DFOozkQ1BJjEuDwGFTfqdBEXlN7w7+4
         fxLQ==
X-Gm-Message-State: AOJu0YxeTTZoEQeWlof+Uh2iQzPwIhNxQC3SchSfXonilK6SyAZ/ShHg
	OXWnmdetFwqo1lKmn2l2/W0E+McCqdYHMp+iGVztx7Q0ACjj+DH7fxs6X4GN7+UdspzU9vBWKG4
	dVWh7k8i01wTnuNe+Ks5SncNh/q1remx2v/Otbp5LVzfmfdrvUFb17JJ18qdamgDsYFa8F5hPmP
	uepnyYY8TLjZhGnXPQDaBNfjIaVSXJb1oOURqPkC706bBj8Zpz
X-Gm-Gg: AR+sD13tEM64jWuhPY5Lu9bXZKaYxdkYBLmiDSLDTd2CQM6Rnfge81J6uLQVqh06zZ4
	bexOdkyLfclVj7EjykwrILHZZPBLU9DR4JI8Ce++NVW5gPS3UuNWjmSC3ubU3ABcBvB8LlZmBR+
	Mk8p69TdrjM7AsPZeekZ38a6jV3E6R/tIyWyepYYl5XFU+LJEVRDw4GKof/w==
X-Received: by 2002:a05:6870:26b:b0:409:5241:8abc with SMTP id 586e51a60fabf-45e3ebb4b51mr3456129fac.20.1786535042777;
        Wed, 12 Aug 2026 04:44:02 -0700 (PDT)
X-Received: by 2002:a05:6870:26b:b0:409:5241:8abc with SMTP id
 586e51a60fabf-45e3ebb4b51mr3456071fac.20.1786535042205; Wed, 12 Aug 2026
 04:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com> <20260805183839.2576691-5-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260805183839.2576691-5-rahul.pathak@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 17:13:50 +0530
X-Gm-Features: AUfX_mwIf4R840KNcGUwS-65tGqIKK_utrc-MoLGB9ZVws3Eo248vZJVkxohw5U
Message-ID: <CABBgwmup0JLOpMDph7wLCuifrtNv9B0ByWYKN4bbYMqpyCRr4A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] platform/generic: Initialise MPT at boot
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA5NSBTYWx0ZWRfXyi71vhm/8rGW
 zTJ9kkUwWTwxeLBWsDtE8/pqI81eYSiozccsLZboq2CB6ox1kss3XXpTb9rlmQOGVGMGZzzrdlk
 q+0/X0KSwVDXF1a5HHJZBCzR/4UAoF0=
X-Proofpoint-GUID: Z7pH5K0HoIBFogXksEABWc-HvISvIYTs
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c5c83 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=tTq5QqSSbEJAz5J_TQ4A:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: Z7pH5K0HoIBFogXksEABWc-HvISvIYTs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA5NSBTYWx0ZWRfX7b1KghiLOcPE
 rPOrHzyLr5WAuRg8cLFOzzxlAr9NDl1JAUb8jP8rPo4Cw/vXq3vom0KUbl/fRnq2rVPwridjGws
 RQ7135hVQRK9ZSA9LSYJ9HANdDHDJiJKte81hUn5IPHFTc6MClZeIKrz5CAejrqIDuDRIS7DSqS
 Hxx3gnKAh+oVvlc2mi7c3iWA87syLx1d/8knH4KFV0zKHNykVGZlbogGNjTHQoQh3q++T4PY4mL
 bxsDICZiFzWg5oAeOaAblVRpko2YGwUXr6mPXg4noFzsnwvH7ifYYHRwXjOjGzjM26wA7/rWz/u
 JaBICC/STCzphgEeGwjz374HhW0+O4jb2K6UFYLv+//ZhovjD9iEih1+/AgOWsGtt4rRJfiwDDS
 3zySsgKEr6mM9inawG0fCTiH56t+D/DbPmGYhG9lsqvXjewjOMm/ZiT8IgWFkV2B0Mj8UjQP3IH
 GN5E3UsUx+whH4T22Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_044406_262711_46B920BA 
X-CRM114-Status: GOOD (  28.20  )
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

T24gVGh1LCBBdWcgNiwgMjAyNiBhdCAxMjowOeKAr0FNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gSW50ZWdyYXRlcyBNUFQgaW5pdGlhbGlz
YXRpb24gaW50byB0aGUgZ2VuZXJpYyBwbGF0Zm9ybSBib290IGZsb3cuCj4KPiBtcHRfZWFybHlf
aW5pdCgpIHByb2JlcyBmb3IgU01NUFQgZHVyaW5nIGNvbGQtYm9vdCBlYXJseSBpbml0IGFuZAo+
IGluaXRpYWxpc2VzIHRoZSBzdHJ1Y3R1cmVzIHJlcXVpcmVkIHRvIGJ1aWxkIE1QVCB0YWJsZXMu
Cj4KPiBtcHRfZmluYWxfaW5pdCgpIGNyZWF0ZXMgdGhlIHJvb3Qgc3VwZXJ2aXNvciBkb21haW4g
d2hpY2ggaXMgbWFwcGluZyBhbGwKPiBwaHlzaWNhbCBtZW1vcnkgd2l0aCB0aGUgZmlybXdhcmUg
cmVnaW9uIGV4cGxjaXRseSBkZW5pZWQgdG8gUy1tb2RlIGFuZAo+IGFkZHMgc3VwcG9ydCBmb3Ig
YW4gTVBUIGRvbWFpbiBmb3IgZWFjaCBhZGRpdGlvbmFsIHJlZ2lzdGVyZWQgU0JJIGRvbWFpbi4K
Pgo+IFRoZSBoZWFwIGJ1ZGdldCBpcyBleHRlbmRlZCB0byByZXNlcnZlIHNwYWNlIGZvciBNUFQg
dGFibGVzLgo+Cj4gV2l0aCB0aGlzIHBhdGNoIE1QVCB0YWJsZXMgYXJlIGJ1aWx0IGF0IGJvb3Qu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBQYXRoYWsgPHJhaHVsLnBhdGhha0Bvc3MucXVhbGNv
bW0uY29tPgoKSW5pdGlhbGl6aW5nIE1QVCBmcm9tIHRoZSBnZW5lcmljIHBsYXRmb3JtIGlzIG5v
dCB0aGUgcmlnaHQgd2F5LgoKTXkgc3VnZ2VzdGlvbiBpcyB0aGUgZm9sbG93aW5nOgoxKSBDYWxs
IHNiaV9tcHRfaW5pdCgpIGZyb20gc2JpX2hhcnRfaW5pdCgpIG9ubHkgd2hlbiBjb2xkX2Jvb3Qg
PT0gdHJ1ZQogICAgcmlnaHQgYWZ0ZXIgc2JpX2hhcnRfcG1wX2luaXQoKSBpcyBjYWxsZWQuCjIp
IEluc3RlYWQgb2YgbXB0X2ZpbmFsX2luaXQoKSwgdGhlIHNiaV9tcHRfaW5pdCgpIHdpbGwgcmVn
aXN0ZXIgc2JpX2RvbWFpbl9kYXRhCiAgICB3aXRoIGRpc3RpbmN0IHNldHVwKCkgYW5kIGNsZWFu
dXAoKSBjYWxsYmFja3Mgd2hpY2ggYXJlIGNhbGxlZCBmb3IgZWFjaAogICAgZG9tYWluLgoKUmVn
YXJkcywKQW51cAoKCj4gLS0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyB8IDEwMSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEw
MSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9y
bS5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gaW5kZXggMWRmMDI4MGQuLmI5YTcx
NWI2IDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ICsrKyBiL3Bs
YXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+IEBAIC0xNyw2ICsxNyw5IEBACj4gICNpbmNsdWRl
IDxzYmkvc2JpX3N0cmluZy5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9zeXN0ZW0uaD4KPiAgI2lu
Y2x1ZGUgPHNiaS9zYmlfdGxiLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX21wdC5oPgo+ICsjaW5j
bHVkZSA8c2JpL3NiaV9kb21haW4uaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfY29uc29sZS5oPgo+
ICAjaW5jbHVkZSA8c2JpX3V0aWxzL2NhY2hlL2ZkdF9jbW9faGVscGVyLmg+Cj4gICNpbmNsdWRl
IDxzYmlfdXRpbHMvZmR0L2ZkdF9kb21haW4uaD4KPiAgI2luY2x1ZGUgPHNiaV91dGlscy9mZHQv
ZmR0X2RyaXZlci5oPgo+IEBAIC0zMyw2ICszNiw4NiBAQAo+ICAvKiBMaXN0IG9mIHBsYXRmb3Jt
IG92ZXJyaWRlIG1vZHVsZXMgZ2VuZXJhdGVkIGF0IGNvbXBpbGUgdGltZSAqLwo+ICBleHRlcm4g
Y29uc3Qgc3RydWN0IGZkdF9kcml2ZXIgKmNvbnN0IHBsYXRmb3JtX292ZXJyaWRlX21vZHVsZXNb
XTsKPgo+ICsvKgo+ICsgKiBtcHRfZWFybHlfaW5pdCgpOiBEZXRlY3RzIHRoZSBTTU1QVCBtb2Rl
IGFuZCBpbml0aWFsaXplcyB0aGUKPiArICogc3RydWN0dXJlcyAobm90IE1QVCB0YWJsZXMpIHJl
cXVyaWVkIHRvIHByZXBhcmUgTVBUIHRhYmxlcyBhbmQKPiArICogZG9tYWluIHByb2dyYW1taW5n
Lgo+ICsgKi8KPiAraW50IG1wdF9lYXJseV9pbml0KGJvb2wgY29sZF9ib290KQo+ICt7Cj4gKyAg
ICAgICBpbnQgcmM7Cj4gKwo+ICsgICAgICAgaWYgKCFjb2xkX2Jvb3QpCj4gKyAgICAgICAgICAg
ICAgIHJldHVybiAwOwo+ICsKPiArICAgICAgIHJjID0gc2JpX21wdF9pbml0KCk7Cj4gKyAgICAg
ICBpZiAocmMgPT0gU0JJX0VOT0RFVikKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+
ICsgICAgICAgcmV0dXJuIHJjOwo+ICt9Cj4gKwo+ICsvKgo+ICsgKiBtcHRfZmluYWxfaW5pdCgp
OiBQZXJmb3JtcyB0aGUgZmluYWwgaW5pdGlhbHphdGlvbiBpbmNsdWRpbmcKPiArICogY3JlYXRp
b24gb2YgUm9vdCBzdXBlcnZpc29yIGRvbWFpbi4KPiArICovCj4gK2ludCBtcHRfZmluYWxfaW5p
dChib29sIGNvbGRfYm9vdCkKPiArewo+ICsgICAgICAgaW50IHJjOwo+ICsgICAgICAgdTMyIHNk
aWQ7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLCAqcm9vdF9kb207Cj4gKyAgICAg
ICBzdHJ1Y3Qgc2JpX21wdF9kb21haW5fY29uZmlnIGNmZzsKPiArCj4gKyAgICAgICBpZiAoIWNv
bGRfYm9vdCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgLyogU01N
UFQgbWF5IGJlIHVuYXZhaWxhYmxlICovCj4gKyAgICAgICBpZiAoIXNiaV9tcHRfY3RybF9nZXQo
KS0+cmVhZHkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgICAgIC8qCj4g
KyAgICAgICAgKiBDcmVhdGUgTVBUIGRvbWFpbiBmb3IgUm9vdCBkb21haW4uCj4gKyAgICAgICAg
Kgo+ICsgICAgICAgICogUm9vdCBkb21haW4gbWFwcyBhbGwgcGh5c2ljYWwgbWVtb3J5IHNvIHRo
ZQo+ICsgICAgICAgICogZmlybXdhcmUgcmVnaW9uIG11c3QgYmUgZXhwbGljaXRseSBkZW5pZWQg
dG8gUy1tb2RlLgo+ICsgICAgICAgICoKPiArICAgICAgICAqIHJlZ2lvbnMgcG9pbnRlciBpcyBO
VUxMIGFuZCBucmVnaW9ucyBpcyAwIHNpbmNlIHRoZXJlCj4gKyAgICAgICAgKiBhcmUgbm8gb3Ro
ZXIgcmVnaW9ucyBvdGhlciB0aGFuIHJlc3BlY3RpdmUgU0JJIGRvbWFpbiBmb3IgbWFwcGluZy4K
PiArICAgICAgICAqLwo+ICsgICAgICAgcm9vdF9kb20gPSBzYmlfZG9tYWluX3RoaXNoYXJ0X3B0
cigpOwo+ICsgICAgICAgY2ZnLnNiaV9kb20gPSByb290X2RvbTsKPiArICAgICAgIGNmZy54d3Ig
PSBTQklfTVBUX1BFUk1fUldYOwo+ICsgICAgICAgY2ZnLmZ3X3Byb3RlY3QgPSB0cnVlOwo+ICsg
ICAgICAgY2ZnLnJlZ2lvbnMgPSBOVUxMOwo+ICsgICAgICAgY2ZnLm5yZWdpb25zID0gMDsKPiAr
Cj4gKyAgICAgICByYyA9IHNiaV9tcHRfZG9tYWluX2NyZWF0ZSgmY2ZnLCAmc2RpZCk7Cj4gKyAg
ICAgICBpZiAocmMpIHsKPiArICAgICAgICAgICAgICAgc2JpX3ByaW50ZigibXB0OiBSb290IGRv
bWFpbiBjcmVhdGUgZmFpbGVkIHJjPSVkXG4iLCByYyk7Cj4gKyAgICAgICAgICAgICAgIHJldHVy
biByYzsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBzYmlfbWVtc2V0KCZjZmcsIDAsIHNpemVv
ZihjZmcpKTsKPiArCj4gKyAgICAgICAvKiBDcmVhdGUgTVBUIGRvbWFpbiBmb3IgYWxsIG90aGVy
IHJlZ2lzdGVyZWQgU0JJIGRvbWFpbnMuICovCj4gKyAgICAgICBzYmlfZG9tYWluX2Zvcl9lYWNo
KGRvbSkgewo+ICsgICAgICAgICAgICAgICBpZiAoZG9tID09IHJvb3RfZG9tKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgY2ZnLnNiaV9k
b20gPSBkb207Cj4gKyAgICAgICAgICAgICAgIGNmZy54d3IgPSBTQklfTVBUX1BFUk1fUldYOwo+
ICsgICAgICAgICAgICAgICBjZmcuZndfcHJvdGVjdCA9IGZhbHNlOwo+ICsgICAgICAgICAgICAg
ICBjZmcucmVnaW9ucyA9IE5VTEw7Cj4gKyAgICAgICAgICAgICAgIGNmZy5ucmVnaW9ucyA9IDA7
Cj4gKwo+ICsgICAgICAgICAgICAgICByYyA9IHNiaV9tcHRfZG9tYWluX2NyZWF0ZSgmY2ZnLCAm
c2RpZCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgICAgICAg
ICBzYmlfcHJpbnRmKCJtcHQ6IGRvbWFpbiAnJXMnIGZhaWxlZCByYz0lZFxuIiwgZG9tLT5uYW1l
LCByYyk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0
YXRpYyB1MzIgZndfcGxhdGZvcm1fY2FsY3VsYXRlX2hlYXBfc2l6ZSh1MzIgaGFydF9jb3VudCkK
PiAgewo+ICAgICAgICAgdTMyIGhlYXBfc2l6ZTsKPiBAQCAtNDIsNiArMTI1LDE1IEBAIHN0YXRp
YyB1MzIgZndfcGxhdGZvcm1fY2FsY3VsYXRlX2hlYXBfc2l6ZSh1MzIgaGFydF9jb3VudCkKPiAg
ICAgICAgIC8qIEZvciBUTEIgZmlmbyAqLwo+ICAgICAgICAgaGVhcF9zaXplICs9IFNCSV9UTEJf
SU5GT19TSVpFICogKGhhcnRfY291bnQpICogKGhhcnRfY291bnQpOwo+Cj4gKyAgICAgICAvKgo+
ICsgICAgICAgICogTVBUIHRhYmxlIGJ1ZGdldAo+ICsgICAgICAgICogMSBNaUIgbWVtb3J5IGZv
ciBNUFQgYWxsb2NhdGVkIGN1cnJlbnRseS4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiBUT0RP
OiBOZWVkIGJldHRlciB3YXkgdG8gZ2V0IHRoZSBtZW1vcnkgYnVkZ2V0IGJhc2VkIG9uIGFjdGl2
ZQo+ICsgICAgICAgICogU01NUFQgbW9kZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaGVhcF9z
aXplICs9IDEwMjQgKiAxMDI0Owo+ICsKPiAgICAgICAgIHJldHVybiBCSVRfQUxJR04oaGVhcF9z
aXplLCBIRUFQX0JBU0VfQUxJR04pOwo+ICB9Cj4KPiBAQCAtMjI5LDYgKzMyMSwxMCBAQCBpbnQg
Z2VuZXJpY19lYXJseV9pbml0KGJvb2wgY29sZF9ib290KQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByYzsKPgo+ICAgICAgICAgICAgICAgICBmZHRfZHJpdmVyX2luaXRfYWxsKGZk
dCwgZmR0X2Vhcmx5X2RyaXZlcnMpOwo+ICsKPiArICAgICAgICAgICAgICAgcmMgPSBtcHRfZWFy
bHlfaW5pdChjb2xkX2Jvb3QpOwo+ICsgICAgICAgICAgICAgICBpZiAocmMpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICByZXR1cm4g
ZmR0X2Ntb19pbml0KGNvbGRfYm9vdCk7Cj4gQEAgLTIzNiwxMSArMzMyLDE2IEBAIGludCBnZW5l
cmljX2Vhcmx5X2luaXQoYm9vbCBjb2xkX2Jvb3QpCj4KPiAgaW50IGdlbmVyaWNfZmluYWxfaW5p
dChib29sIGNvbGRfYm9vdCkKPiAgewo+ICsgICAgICAgaW50IHJjOwo+ICAgICAgICAgdm9pZCAq
ZmR0ID0gZmR0X2dldF9hZGRyZXNzX3J3KCk7Cj4KPiAgICAgICAgIGlmICghY29sZF9ib290KQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+ICsgICAgICAgcmMgPSBtcHRfZmluYWxfaW5p
dChjb2xkX2Jvb3QpOwo+ICsgICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
cmM7Cj4gKwo+ICAgICAgICAgZmR0X2NwdV9maXh1cChmZHQpOwo+ICAgICAgICAgZmR0X2ZpeHVw
cyhmZHQpOwo+ICAgICAgICAgZmR0X2RvbWFpbl9maXh1cChmZHQpOwo+IC0tCj4gMi41MS4wCj4K
Pgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
