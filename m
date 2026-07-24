Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BFAC531FA
	for <opensbi@archiver.kernel.org>; Fri, 24 Jul 2026 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aq0ykLwDAE6NDpUoRTMN/HXiH/OYR57nwrcCM+W93v4=; b=BUVD+wMzD+0m7V
	W4V+uD+gEJf56+I/iT0JntMPuGwkWpx42+Rc24M9oJ9arPHRyFlZb4xeEJfq2JoLexbvktqDop6Iz
	mkZiMnsgFsnQxgXXO6mnGZcZdCr/RQk0kS2tz9VfX+ZMIl5YUpiPUr1ll+0+M8yCV1OjgdFMSJJ5G
	5aLPqqzmZE6y0RYT524BtIhv0E9uoFwHa+cwRlYxbbj+LKq1vEaUZKbbEjK46EUyklhD4a610c9Fk
	lUxYy5kfCZrIdVQXqYs7piOWPyx7Yh8O7xgktmT+OKdrMftOf74kmIChPYvhxueE9ToX7/yTEbv6l
	TdzOJiTy8YqzwS9hXwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHWF-0000000GeSP-0eOe;
	Fri, 24 Jul 2026 15:08:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHWD-0000000GeS3-06t2
	for opensbi@lists.infradead.org;
	Fri, 24 Jul 2026 15:08:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbTXm3336479
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 15:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdGGMZNVRjoHrLgaHOT1j/HftIZF+pypUlfzPfQRAJw=; b=PH700bitOqmdX0BS
	W2WHfE8ZX1SDFbul/T79DhpGRCyEx2G2rM6io3Hw6w9TIXoylspB94zyeJCaxZUj
	EcHuTa0NGdnpYgumJdRIQi6QeGZcRRK9/o4FnrJSrN1c1mxTczHupnOHQOgFE7om
	AGF8CrlthrN2c7klVE8L8/ApyOefyvG3bpEtV22CUMzKuwSQlgJGORF1CrRD8jB6
	MKxpPcViYuEWX7IJ82gy+66nCq15NPNNJxa9SlJPc3VUpsBT4RH0owW8TvwyhV2j
	kVcgyeJ8sS5JvOU1x4z3urC+Pmnf5WZlrOw3j8uNcAcYW11V0xJbYSsIMSWTjeoa
	sc3dCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5bys9au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 15:08:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso10973251cf.1
        for <opensbi@lists.infradead.org>; Fri, 24 Jul 2026 08:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784905735; cv=none;
        d=google.com; s=arc-20260327;
        b=Xg6Ue9/TjlkPtZ0ZuQiKrKwXLe/K4gpnCt/MN7Eqiy5baENuFmMxLaLBY2wzGIjGwi
         Sr1hOvrVIXWavhRWhaSbOuMQdpvEFXmq3bbbEmaNGGJ5SQ+c6noboH0051tcnihyIavV
         ziO8HomSR/nPWt7gvBVs0ZUzbbIbnOTAowjeEFFaJkjjVCfkprdOSrf1lSvEAx40nSH+
         RngfJ9VlEFAxHXY1yQPdDdO8dA9aSbS1llGTVPISLRJGaianhiIlEsmm/GiHB6Ps0+l7
         32h5+fqB5cdxwgbgt47h9JWZTIBx6JvGldUR7zKxrAXNUS2xjDGIMurLwaaDYnURINk8
         E+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wdGGMZNVRjoHrLgaHOT1j/HftIZF+pypUlfzPfQRAJw=;
        fh=fDZmcnKH2BXio2XIM5hmPiNhoW3JvHX/9n2I7tsILrg=;
        b=XI5QFt53C3ulIl0rV6jY9aibknJ+TsRvxV5PvdcnGTSKriK5+dlB8cZ6LBmpRXURZS
         J0+Mxjx1wLzSN9GOUZ2rkWZB54K0Ugkussfpe8BvISefT0vjs1le3rMnIwxUsjSK8LEq
         lmwLpsaLDWhmw5Y0Hsg7rxtgwfPXX+Ayzr7gVwgwPsGMW6URAWQ6oRwm36ImmqLmWSje
         QrpS+v3qNes9HyKQ6gD8JlEWRrQ+bncGTcXNV4u2Li3VCFfye5Kp08KJWbdwJ0X5t9+h
         D3/2lz+aDf0J6Gy7N4UWK73+Wihpnt4Rvl3nV5eCQa+EcfoanyfQnq2UTKfjVYNcmBpk
         vfXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905735; x=1785510535; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdGGMZNVRjoHrLgaHOT1j/HftIZF+pypUlfzPfQRAJw=;
        b=RQwhOQg7SfeEMkBJXT3ElW0MP55Z4/KQiq5pRUaNpwPd2VkvAY+lWRKn+QocUqNGkr
         /ynuaFJepsMq9Pd0M7sAENZfugbwoGHc6N+GP8knhfJCRNZ48j4JD+fbl9eqSnYafa5+
         YJhmQcDwATTWrTqDahcm206CwX04OlNxtYirkZw8zeWUPiDsmcUsy52Odb8grb1GaeYv
         z4JOLtMFipUqVq2oZrgXafg/6yMsPXQVlFaSh76mqK6Jc8EQE4hM1yyUvkpU7bvLAd8d
         xDz5GX+wDxT5FtWVJl8yoR++ItLBLG04JiUFRyM77w0QaS611EsyUHHAir2DvEcrpmZa
         hAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905735; x=1785510535;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdGGMZNVRjoHrLgaHOT1j/HftIZF+pypUlfzPfQRAJw=;
        b=fBV8KsaWs5OyqIflZ1feiyycZ9zKy85B6/uD9aMsnCo+g1ymhxHZ7d99C/BhHaMoQI
         wuQ0P5s69C66VtU9Awz7JdPzZMrWeNYzTc7v1UHWuJcvZTujTrkd8Na09ZZiDkuX2JFV
         r0NSaJ0RNDXPUiRuhSAiRwjnkjMcCsb4xrIs0AS5IS5vzQih7EClxekZjJuMHOxJ3Eae
         W2ktIOCY13Vy9bDdHWTn2NKJHzjRVtm5/yS/Px+q8hO5AsG36SIsFc7TzV+djOjr377H
         FPmn9xfhyBZHEX26bUZYN619IJeaYqvOOoXhrUat920zp9kFLhP/oOzbdKh5ExJuvVkH
         mpag==
X-Gm-Message-State: AOJu0YzmoasaLRngqCQkX4uxdTltMowtCW59XgznTsWw9AlSGQzJgy7z
	kQ2dso7XaGeHUTfEObA/r+9BwBHsIdZ1CERT011kNtQoYLYp1UrBtqYKKVESPJJ9rVEpTa8UT9k
	Uc3gGcey+lOYlmoMI0v4gvCEUZ4mi03/AsmmxHtAsl8dSF1SoQjb26g/E/PnHMQTj0Pu0s527CX
	ziA4Yghke6zk6J+rUfrFaOgyunBSbqT/ILsw1mTz0+aP/YFzLb
X-Gm-Gg: AR+sD12b8hTR3+dwhgIn3IkZBY+iacLq8lirmNqnHaau+k9tSuNJ4D1l/FTnIC63wTR
	L7jApDJ7QpGOa/g2V7JUX0FUG53vjcSQaQ0ad25LAITx9cStywdziVWguIR4P4B3a7AoP+xBSAf
	bZUFU+v6T2qOBjB9XYvfxFi8cU7yuTxtGMjkbGfAd3J9inqhu/20nccRB3uw==
X-Received: by 2002:a05:622a:164f:b0:51a:8c86:bd40 with SMTP id d75a77b69052e-5283df95813mr77430571cf.61.1784905735221;
        Fri, 24 Jul 2026 08:08:55 -0700 (PDT)
X-Received: by 2002:a05:622a:164f:b0:51a:8c86:bd40 with SMTP id
 d75a77b69052e-5283df95813mr77430171cf.61.1784905734798; Fri, 24 Jul 2026
 08:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
 <20260722033455.2658178-2-rahul.pathak@oss.qualcomm.com> <CAPPZMLEKB_tj4eXBPjc3nMWX67c0UHesTKROPjV3ih3L=aSp8w@mail.gmail.com>
In-Reply-To: <CAPPZMLEKB_tj4eXBPjc3nMWX67c0UHesTKROPjV3ih3L=aSp8w@mail.gmail.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 20:38:43 +0530
X-Gm-Features: AUfX_my0YXaHgC4uLFActpMWDlzT_zgb8QF_xJdvnX1Vs2fSd8QdkEZuz8CSsiE
Message-ID: <CAFR3w37a-mW=NAJNy+ohPK8MTjSqTo7pn09BMMX8BuuMrq=tJA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] riscv: Add Smsdid and Smmpt hart extensions
To: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-Proofpoint-ORIG-GUID: 6VpX2acS_YoSPW9p6AW2XbjJ29-gEtf0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX2eD79lAItnCA
 LtcUxHIuY7ZUDCNI+wgSWHGL1KS7OgM3wFOrKdIVaFGVdCwDkrXznxTCTzDXyOgMOHhVIQhO9Gj
 L++9ED/BWX3Wuf6X+rzGS/0As/0muL0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX+7MYtEQ1Q1wa
 iLwT6LWhiay8mM9MIw+TYC0I0vV4Xx8ZbWwGC5qKmsqrh0q1Fv+i4NOTkk1HlblcHFMbr+n6CfX
 yae2dbGS1rPz4XNdD2Hg5QBz6vsBdjH0cIdpmnOi2CfIOT+DY8n47K2S0XeEYESfwcW6NaroaYo
 AvaoUqHMycs1VT03zEw3EECqSX90q3G0Mg2sFcc7ku69VcQ/CIxUW4llJC7somctmg54bPSA7AT
 Ch8nIw+iafEjPNOo9v37/g86e/IpH0rlWWd1ie9Rd8OXAQBVgqhGCh29vNmncjU+LWMbnxTLlGg
 mpDoGge0UCMo6ToiYpdRksqHy0FbpDeb7FOVEjxFB0VBRovs2rCRJJsb+f7BNZzaitNp4sFJwYC
 /f/uqFuNN2zbFjCamKX/W1oBnrHWC/+RYE4jNtfK3Mbx4mjDg3/40QduRs5r0YaqZ8JUrOfWI/s
 N10NHw8wXdPwExM11AA==
X-Proofpoint-GUID: 6VpX2acS_YoSPW9p6AW2XbjJ29-gEtf0
X-Authority-Analysis: v=2.4 cv=GMA41ONK c=1 sm=1 tr=0 ts=6a638007 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=zaN_a_3ogWJLq2iYbF0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_080857_209514_2ADAA610 
X-CRM114-Status: GOOD (  17.02  )
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

T24gRnJpLCBKdWwgMjQsIDIwMjYgYXQgMTA6MDHigK9BTSBSYW5iaXIgU2luZ2gKPHJhbmJpci5z
aW5naEBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDIyLCAyMDI2IGF0
IDk6MDbigK9BTSBSYWh1bCBQYXRoYWsKPiA8cmFodWwucGF0aGFrQG9zcy5xdWFsY29tbS5jb20+
IHdyb3RlOgo+ID4KPiA+IEFkZCBoYXJ0IGV4dGVuc2lvbiBpZGVudGlmaWVycyBmb3IgdGhlIFJJ
U0MtViBTbXNkaWQgKHN1cGVydmlzb3IKPiA+IGRvbWFpbiBJRCkgYW5kIFNtbXB0IChzdXBlcnZp
c29yIGRvbWFpbiBtZW1vcnkgcHJvdGVjdGlvbikgZXh0ZW5zaW9ucy4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBSYWh1bCBQYXRoYWsgPHJhaHVsLnBhdGhha0Bvc3MucXVhbGNvbW0uY29tPgo+ID4g
LS0tCj4gPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCB8IDUgKysrKy0KPiA+ICBsaWIvc2JpL3Ni
aV9oYXJ0LmMgICAgIHwgMiArKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0
LmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gPiBpbmRleCA1NDMzOTNiYi4uMzhhYWNkNzAg
MTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gPiArKysgYi9pbmNsdWRl
L3NiaS9zYmlfaGFydC5oCj4gPiBAQCAtOTUsOCArOTUsMTEgQEAgZW51bSBzYmlfaGFydF9leHRl
bnNpb25zIHsKPiA+ICAgICAgICAgU0JJX0hBUlRfRVhUX0YsCj4gPiAgICAgICAgIC8qKiBIYXJ0
IGhhcyBEIGV4dGVuc2lvbiAqLwo+ID4gICAgICAgICBTQklfSEFSVF9FWFRfRCwKPiA+ICsgICAg
ICAgLyoqIEhhcnQgaGFzIFNNTVRUIC0gU01TRElEIGV4dGVuc2lvbiAqLwo+ID4gKyAgICAgICBT
QklfSEFSVF9FWFRfU01TRElELAo+ID4gKyAgICAgICAvKiogSGFydCBoYXMgU01NVFQgLSBTTU1Q
VCBleHRlbnNpb24gKi8KPiA+ICsgICAgICAgU0JJX0hBUlRfRVhUX1NNTVBULAo+ID4KPiA+IC0g
ICAgICAgLyoqIE1heGltdW0gaW5kZXggb2YgSGFydCBleHRlbnNpb24gKi8KPgo+IFRoaXMgc2Vl
bXMgYW4gdW5kZXNpcmVkIHJlbW92YWwgYW5kIHNob3VsZCBiZSByZXRhaW5lZC4KClllcywgdGhp
cyBpcyBhbiB1bmludGVudGlvbmFsIHJlbW92YWwuIFdpbGwgdXBkYXRlCgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
