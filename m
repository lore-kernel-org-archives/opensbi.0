Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ACAC44512
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 05:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6m6yO5jHAWbtkyBLw/wnjgOCLI//lLCz8nkRdbQEAJU=; b=Lv8hnAw1ZTuD+c
	M9/riaLh9B7opvbLp+9hk9zKTJTZIuvErx7SNJQFr8lRmjODc3fUlfORlX+BCfGEpKiV5c7AQKLxx
	Siuh5tRHUkcGh3QZrR23IM++GHzOCD9/h9kDwUuMQJjATLhIVgGGmKCq/z9T3B+wRZl6oL8Gd9MWO
	Y3bXBgXMuumLtc82ElcvqIZxu1djb5TPSUVsRekBjRgdldahbFuKTlfOfK+dxMsddFc+w/xCC2QZd
	/Op9lR48jMjhs+Hk+RV5/cG3ODx0lNCfFUWI+4w3+P6jk6PAlgLPEveayB2SbyWbhHqBLNZxSHDQb
	n7NBVTaBbOff7fpFu19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPpt-0000000Aw8W-02EY;
	Wed, 22 Jul 2026 05:49:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPpp-0000000Aw8A-2W81
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 05:49:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53uD83996092
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 05:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCNrmFaW0VglYTEWlCse83wgyOsOE7rJrbK7xkIkGug=; b=QS3EkDWzUVsJkg3P
	9834u4uDqbew/1RrqV6smJkfAXSYuwLjBXDnOfh0nR3lTGi1cCHgOXKDG9XLxTXn
	b+o8Q6VSgShNp10SLehza5RSyhK/SWXAmxpYSc4T4H8fOX5a9TKXLVmd/XJRTnTa
	ppYX1baUTVrepsbByJ7MODSex1xwOQa29yZS8wXMeCnpkKs/K54n+7I4W2xVtVmJ
	oZ/On1pLMP2Xw4vmV37xW97jz06SfAxzg2Ri3zkCHyVM6/Qs2ih+JvGBYEZjCvY5
	b1lvaP/QgqxsZmKMiaubRk6POZkF7oEM1oJV0o2f0x+siT27PSwNdTOUGtzjsqNA
	OkvwHg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d2dd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 05:49:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso318735456d6.0
        for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 22:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784699375; cv=none;
        d=google.com; s=arc-20260327;
        b=JQ2iagtS5sOQZNhSfeetLhB+slRW3yN8ZifNkzgFsEnDO7pvQAwvTzmXpOX+Dq624F
         Ve8Asi65YE1lmvMRLtmuoccdEjCgftXJ1/qU2OjC3qbOIw5p6wMV/fDu+EeXqhctBQPn
         JguVJVgtGXeas3jcNqbzYIsKAQ8XDeUecpifI4TDcYfaDf7lUYBkM5U96CxGX5K2HMlY
         uskUUKK07Z2KVCgP/6HX4zd4Yvi6PKJzASAJFZttXyf0axCxM+47mHPQDIA4Nj88LW+4
         EQASY/sFZfWHgCyieJMXwr6yoscUne9mZv4M/nSoQS/3HNdgB4u6pk+6FpA9W2Ll0K84
         eK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BCNrmFaW0VglYTEWlCse83wgyOsOE7rJrbK7xkIkGug=;
        fh=ZUTfy4K9dP08M0JghozI1RGDYR7A3bSPbXTXkV1CfjA=;
        b=MUlr9MMo7M5UisnVrRP6qOMQuycxPryAb/JPSo7dM0a5UtPG3HIITbKMZ2i5MK4L/k
         gYj4lt9aSKFTeLDZh4eFCqv6pUmyvKxsQ59h/37nAGtH+HEmnQbEJnzEBj739nMHyR+3
         wVpW9hkoWiSKxeZNp9vfHy4fCXY+gA3i9soHgidS2rr+xwcfB7hl0MS0JrxgttiwojKO
         +md9S6OsVLwqU23xm8Ue2vGu/xffZeTzgHfwKvXFSLL4ZuzzGR8kUKF/Vcg/3EIuosuI
         KiBasE1nyjA8wRNwcy5+PJ24mgTvcRRswxXEwF4YF5IKwA5wumT1iU7FjDcdonyBWadb
         CTrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784699375; x=1785304175; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BCNrmFaW0VglYTEWlCse83wgyOsOE7rJrbK7xkIkGug=;
        b=IAHosHEb7LFsy7yx+b3UKkwdn/SpdOoy0TaZD5oYwnFDe3Z9d890K3qM54HKSHHGgH
         ogZAg/+WBLMoFyh5ce+dMFQMcu8KmfWps120F8o9KYRFfnbyDfwFjcEdiCHZoJMYyDNB
         ryADhtb5TyASFu+KHlkwBLN1sV46dtZOhICnFiXG0CQpVbfiQaaqyi2B/TPHlLVPXPrb
         OlHUomGOYRPJz8Gowdm4EJiSDADyIar4II0qW0RyMlwcpyWL/29hpXXaABQf1kzOOasD
         wiEFJqiuKwqHKc494tL7bGE/eNdGMdlne1VEaOH7vhPwc+GLNByWKseYCngmyoek1QAh
         tITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699375; x=1785304175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCNrmFaW0VglYTEWlCse83wgyOsOE7rJrbK7xkIkGug=;
        b=O4mM9XSlKbiqzNMNDl89R8wbLBop88kK6cs8zzkAvvIFjexHv8kEYk5TcCIOmv+ReQ
         rZJWKOIepVnuXkxVmwN0gxgtHOd2OsnGRJV0rzgwQN9KEQhS56zo0ZPme6u+80XpWDr7
         V5wXKHotq3cKtI4hG4nSzPXtdFe728eCgYGxx+gLiqrmRFzhoGzU19EivO9SmDc9lq3a
         uSQcXnVh7nbLiZHjs2VZ8au01+qrZtRnTy4A77DMis/t4B8YKIueXe9U7KX/CwHySj4l
         0AzMmBfPWQ6EwJcMOrbJHDZPNKvydQNEasBaknbuqZghjtsKfHwduub0ZKrlgkAE4ize
         zfpw==
X-Gm-Message-State: AOJu0YzW9l6pu2IJ7BQs8Kh73c6TqneR2ofvkycWEN/liDdmf+P6tIdU
	iYxFApiXCj4v6QoQtdA6tdqDausN/UGECvwazKsL49/ovsa5BMwa/Y6sIfWUhlZ1tb3CYru9De1
	KKsBZGACHPi5cefGrwaX7x8D59BZtU5R6dXG7mX8FiM5Af8xFoIzA6mHnz4ZdnjfYS1mGOOU7qL
	UJ8ON8hDNFL3n3KMoPIORHhrq8ILf4AfemfBXaJMmE
X-Gm-Gg: AR+sD11ogRq5PuGVeNrZCp5+6thqCex83S2oqykULi3UKdp9ZmAYo5gc4VRNY8CvFjl
	tc3bUxKqMnS6yvJ43SlVj14e6jVFEQaPjuvu4//P6k0WQQS1ayMIym4LQIjHQq0UYp77XM+9gAj
	8PD4QSDTbaAnSP3t2MFavIRXuRi3OoN9/MCHC1494cWY75LnpV6zuQ3+XTnA==
X-Received: by 2002:a05:6214:5c01:b0:8f3:e97:59c6 with SMTP id 6a1803df08f44-907783339cbmr245316946d6.20.1784699375489;
        Tue, 21 Jul 2026 22:49:35 -0700 (PDT)
X-Received: by 2002:a05:6214:5c01:b0:8f3:e97:59c6 with SMTP id
 6a1803df08f44-907783339cbmr245316826d6.20.1784699375144; Tue, 21 Jul 2026
 22:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260721061459.1422227-1-ranbir.singh@oss.qualcomm.com> <20260721061459.1422227-2-ranbir.singh@oss.qualcomm.com>
In-Reply-To: <20260721061459.1422227-2-ranbir.singh@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 11:19:24 +0530
X-Gm-Features: AUfX_mw6rEtXmWLK0oFhkBy1tERvhW4_qBnVOjdr4CcN3RllN0BY8p9dXDR9Xuw
Message-ID: <CAFR3w36A0RW9WPcTQtUi4Yvwb=zCLEkYOz-h9gb7BH6rUdXYKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib: utils/mpxy: mm: Add missing RPMI_MM_SRV_ENABLE_NOTIFICATION
 entry
To: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Proofpoint-GUID: obM69kwrmIAk79NI9m7KOe-ayqWk6BfB
X-Proofpoint-ORIG-GUID: obM69kwrmIAk79NI9m7KOe-ayqWk6BfB
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a6059f0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=8dGyJ6yJ_08JxO04hQ4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1MSBTYWx0ZWRfX9syBGx5BEDT8
 EdA0bTAGKeJPLK/hD+vv4u75bq2gF+2qnYWTSgNKSIXb1s2cNvcjIbSaeZnGBJ50Mqbt2Tdvdng
 CE4tEEKNH5QsFKxKvhYOFJsuSEKyy/60NFCLG14tQL4Y6f87J9JgmEEaOLH2K1XYYZ48iTPLump
 1oF5BBlaX26deGSCbmrjAB9eWCUp5/+sFlZ47tw/uX9Bfu2RJXthlNLY5o/T8HTWMg7BM2uY/wD
 XMs4qDtTkK8+BGAUoY/42FtWy40ZttBYh5jC4wrSs2K0imabuxVuxXtxvLV/RcqbSfOD9jo+y6k
 O6k90vQUGpV55QcfEeLnLub0YPSJX+G563AKJWUPbcwXqKlmVso1mJMjAGDiliSILLW4IFroKdO
 w+f3jKAYeM/Jx+sPLLfZMdaaN00pp+uBWvwEZaUa58POzb+Zafh+U43c60nUMx8HO8Bpu0Z+UX4
 VlZ9K74l3vS2Kb+rHSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1MSBTYWx0ZWRfX4Fa1u7p70jRw
 FwPo8rLZETI8XJvNKZfpegUiMGMvhcg7kCbpECmAyh4lgi3Dukv3xIGIi2xxHs0kld9Uv9IktR9
 jyvD+mCaV//LviTuIa9m2Bmby+w79t4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_224937_837374_EC5562FC 
X-CRM114-Status: GOOD (  17.55  )
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgMTE6NDXigK9BTSBSYW5iaXIgU2luZ2gKPHJhbmJpci5z
aW5naEBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEFzIFJQTUlfTU1fU1JWX0VOQUJMRV9O
T1RJRklDQVRJT04gaXMgYSBtYW5kYXRvcnkgc2VydmljZSBmb3IgUlBNSSBNTQo+IHNlcnZpY2Ug
Z3JvdXAsIGl0IG11c3QgYmUgYWRkZWQgaW4gaXRzIE1QWFkgY2xpZW50IGRyaXZlciBoZXJlLgo+
Cj4gRml4ZXM6IDBiMDQxZTU4YzA3OCAoImxpYjogdXRpbHM6IEFkZCBNUFhZIGNsaWVudCBkcml2
ZXIgZm9yIFJQTUkgTU0KPiBzZXJ2aWNlIGdyb3VwIikKPgo+IFNpZ25lZC1vZmYtYnk6IFJhbmJp
ciBTaW5naCA8cmFuYmlyLnNpbmdoQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGxpYi91dGls
cy9tcHh5L2ZkdF9tcHh5X3JwbWlfbW0uYyB8IDkgKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRp
bHMvbXB4eS9mZHRfbXB4eV9ycG1pX21tLmMgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1p
X21tLmMKPiBpbmRleCBkNzE3NmFjYS4uNzE4NWYzZjMgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxz
L21weHkvZmR0X21weHlfcnBtaV9tbS5jCj4gKysrIGIvbGliL3V0aWxzL21weHkvZmR0X21weHlf
cnBtaV9tbS5jCj4gQEAgLTE1LDEzICsxNSwyMCBAQCBzdGF0aWMgc3RydWN0IHJwbWlfbW1fZ2V0
X2F0dHJpYnV0ZXNfcnNwIHJzcDsKPgo+ICBzdGF0aWMgc3RydWN0IG1weHlfcnBtaV9zZXJ2aWNl
X2RhdGEgbW1fc3J2Y2RhdGFbXSA9IHsKPiAgICAgICAgIFswXSA9IHsKPiArICAgICAgICAgICAg
ICAgLmlkID0gUlBNSV9NTV9TUlZfRU5BQkxFX05PVElGSUNBVElPTiwKPiArICAgICAgICAgICAg
ICAgLm1pbl90eF9sZW4gPSBzaXplb2Yoc3RydWN0IHJwbWlfZW5hYmxlX25vdGlmaWNhdGlvbl9y
ZXEpLAo+ICsgICAgICAgICAgICAgICAubWF4X3R4X2xlbiA9IHNpemVvZihzdHJ1Y3QgcnBtaV9l
bmFibGVfbm90aWZpY2F0aW9uX3JlcSksCj4gKyAgICAgICAgICAgICAgIC5taW5fcnhfbGVuID0g
c2l6ZW9mKHN0cnVjdCBycG1pX2VuYWJsZV9ub3RpZmljYXRpb25fcmVzcCksCj4gKyAgICAgICAg
ICAgICAgIC5tYXhfcnhfbGVuID0gc2l6ZW9mKHN0cnVjdCBycG1pX2VuYWJsZV9ub3RpZmljYXRp
b25fcmVzcCksCj4gKyAgICAgICB9LAo+ICsgICAgICAgWzFdID0gewo+ICAgICAgICAgICAgICAg
ICAuaWQgPSBSUE1JX01NX1NSVl9HRVRfQVRUUklCVVRFUywKPiAgICAgICAgICAgICAgICAgLm1p
bl90eF9sZW4gPSAwLAo+ICAgICAgICAgICAgICAgICAubWF4X3R4X2xlbiA9IDAsCj4gICAgICAg
ICAgICAgICAgIC5taW5fcnhfbGVuID0gc2l6ZW9mKHN0cnVjdCBycG1pX21tX2dldF9hdHRyaWJ1
dGVzX3JzcCksCj4gICAgICAgICAgICAgICAgIC5tYXhfcnhfbGVuID0gc2l6ZW9mKHN0cnVjdCBy
cG1pX21tX2dldF9hdHRyaWJ1dGVzX3JzcCksCj4gICAgICAgICB9LAo+IC0gICAgICAgWzFdID0g
ewo+ICsgICAgICAgWzJdID0gewo+ICAgICAgICAgICAgICAgICAuaWQgPSBSUE1JX01NX1NSVl9D
T01NVU5JQ0FURSwKPiAgICAgICAgICAgICAgICAgLm1pbl90eF9sZW4gPSBzaXplb2Yoc3RydWN0
IHJwbWlfbW1fY29tbXVuaWNhdGVfcmVxKSwKPiAgICAgICAgICAgICAgICAgLm1heF90eF9sZW4g
PSBzaXplb2Yoc3RydWN0IHJwbWlfbW1fY29tbXVuaWNhdGVfcmVxKSwKPiAtLQo+IDIuNDMuMAo+
CgpMb29rcyBnb29kCgpSZXZpZXdlZC1ieTogUmFodWwgUGF0aGFrIDxyYWh1bC5wYXRoYWtAb3Nz
LnF1YWxjb21tLmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCg==
