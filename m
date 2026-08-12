Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F85BC5B56A
	for <opensbi@archiver.kernel.org>; Wed, 12 Aug 2026 11:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuZAeY/4tvjzVOHIGMg9+XDa5oPdbRq2M2B13l5Dtr0=; b=tE5y1oGAE5W/to
	OFIRq+dbxEM362kvPufU3r5sMv3n+RSZd41xidssJdAYmF25LU2IaYhbvYbyz0Vjii2bcwNnQ51SZ
	st4e8W5qqumF55FWpXkDgZsv24Yr81YsEBlcqBlTAa8pxgCTlQUCFC7FAH/04bwWGmlbSNSjWE26i
	gVB/+q4PGV9ET1PpEUY5QGO8GFJJueSYd+ocHvqhmemjtM6BdwWfMO5RVwDQg7Ad5kizOZtN8zcqy
	Zp43NXoCj4Si0roLVrnjnTG2jF/eLKPwM+iNI92f7MfECRLAa1Zoe3rKQxrf/b2Ml1ywGP0G5pgm6
	qCzZAZd4X3MI2wfpDIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7NL-0000000G7bc-3c81;
	Wed, 12 Aug 2026 11:44:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7NH-0000000G7av-1l7t
	for opensbi@lists.infradead.org;
	Wed, 12 Aug 2026 11:44:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4AXB3319967
	for <opensbi@lists.infradead.org>; Wed, 12 Aug 2026 11:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MZWmxA2bMA5T9jQJvoxtxVcFcxjYugCvz+sS5X0tBQA=; b=XD9cCTKRfiRpl5zq
	jLejSpfReUGXbupBcEvssmoCzhxWSvPRT8sFuBFitR5AwAKQb+lIO7CBYtAddspD
	/qnF/nhCVL0DbJQDBO/zmF1T0mphI9N+bsfywXebLRlVzPPS4oVZTrmlEYimWy9m
	vNY/xKYA2SL/RfRrdL9bN29oyCiLKzTECZnyHirUGnAyPJEXatmkT6/8RJPW1H1F
	y9JY5ZuslgLdXovE5GIQl4O5myegwJ+U8V9bC+uMjyVm6qL9+l6GPX1NfM17NtAd
	f6nXt0kirWTYDGqtwgWpIP8QCwj8lGN1ZiJ0ES/Dc+818Q+ldtPH140Uj1zj43cp
	6QFRyQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmyrc9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 12 Aug 2026 11:43:58 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44ce386fe90so710078fac.2
        for <opensbi@lists.infradead.org>; Wed, 12 Aug 2026 04:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786535038; cv=none;
        d=google.com; s=arc-20260327;
        b=TOC5jKR7YGM6n0cOVtDldLVW23zA5Dn1yuk79Ux461RlhN0FenG0G59XWfSoKmvM+g
         inzV2A+oMXGPA73yJYKE9NPBMxLHK5QlKXHYUGUpSh4A/OgE9dFSflvXpRqoCybZJuN0
         f7+4gjfXUOPtLvXg1xvECf3qSfjLdVGW+2AFn7ZW+SAbCCnv3tGxrbEruRGUfiZL4Nki
         xlQQgiIMf/ZYL3HYSseuoHAZkFOnTf0cC0BcXmMlbz4xaeihwGxoLLcBMZVaaMcngKQT
         9n4cM3oAs9X4GtZEaX7zk0V8/vs3x3xrrsZFNlhthX1xlst8ew8Ob80lriAR369nvDL/
         c7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZWmxA2bMA5T9jQJvoxtxVcFcxjYugCvz+sS5X0tBQA=;
        fh=jBi6q3c0jPZZ8f2T1PitH0+5EdxFFD7Br+SzWdXAce4=;
        b=H2YnSsCsdAOBRrWutOE7Iyfa7Wx4VAwvH+GE3Qr5YQQsRVQRwP7X0AhMoRAj98IEvR
         Q7zNXrLKoWMLeeAyqGle+QXUikuPqOFcBpvFIXzxanyQr8ZqXwK1mpOeVSIH3penYyIF
         Qw3x1zzbjBGqbYQ6Gmqjg8qNB3GIHVwXbQfbx0CfuMGU1eplDRX9vawDjz4BJAsor6o1
         /cJ1sGst0E9dYe0ZnXHWp39pl6mq2H0glGAOetZ/6bDhvdoM8MlSh82uHsLXRhHfudTl
         ojFJjIscYQFofXu43vn1w42kKVoCpzug8ZMSF2zL/Y1KFjQmCpr5Ou5HZ2icy0lbTwb0
         v8UQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786535038; x=1787139838; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MZWmxA2bMA5T9jQJvoxtxVcFcxjYugCvz+sS5X0tBQA=;
        b=hbim+rtZMFG44tcJsK9WVWP8kLqBYf6cc3Xjz7XPgFTTQuiysQZOhgXsbBD+m/HDrF
         eQZmnLwwYDesEjFurdUyYJRpRbUv/l2k5j7oOUTt3dCAqpIPHb8k+xNOc+m+gdN7JH1l
         au1KYcjStdW+5Fzelb3xZlPxwRUCDsOh4RFCg7gT/9K8YHglMiNjN7Kp5JNVW4Yjpvau
         k8oYiKTV9M/83fA4CmlQ3bbMt3ZG2U9Bm9/XxfH/y3bTuxT9tI1fZzcaY6O/PDjHK//Y
         ePwBvAaiYKb4r7kX0zLNn5qiybUr5Yq6VO2cUVENVnt+AW0btuaqPn8XS7MhZZ4iV/8n
         twyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535038; x=1787139838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MZWmxA2bMA5T9jQJvoxtxVcFcxjYugCvz+sS5X0tBQA=;
        b=LaiMdwa3oBmbguOHJ1WC65W7unMHh8ALhCfoIPOF25b6Y3lxsgV0d+1bvJJO+7UH3O
         +k+Zf/S58QEWg4+6mxm4RFDgQynZ8Hh7YiCi9m58u2qPsOSIpGW7dkQsY9Bc0AWS/L8w
         MnItEHlH2qTfHFqb8equC6x+8r5+S3y7d/GKILYLVEwFMFRkgE9/FjBI6mG8kh0OIXmU
         tSG2KJhhUYYoox0bbT2LCalQbIWAd8fAEXs1k0Jy+BtPG/zhnVBoBZ7baUqZSPbhRqZP
         kbz/g8+StAU6l3Qjx90e6j3jT16EAe8T72WwUEhgF+RXLq079/dZZEzEPPnyjvykJMiL
         gG3Q==
X-Gm-Message-State: AOJu0Yy6zfA1oz7W7jLxWhxKvG8SBVW0Dx3UqlYMxZRD2JLIZ2fQUITf
	IIGKUB9DfGlvMJlcaf3hVi8ozlxS7M0vDysWi0N5O8+YGPjX97zzfoFg1de46VGt/Jj4KN5te6P
	23njDH7Qya0iBRQ+u80OE8T2746tJr4BavN4CoaYcUCqUeHxl24hnkZYW/ucFzlE58P6/pD3vHL
	PWfc0jQ/j0HKibf0Ek6LnyGB6vJdcFtutpFeF+9M47iqQ3yNW0
X-Gm-Gg: AR+sD100/Rh/DsV0Nx6aSL3JVbs1QDD902GAB5icLwsu77/C1VdO7WUzIkkmOJh/J+T
	8wmkW969H6yRH/nfz8fJZJp/7ZaYtp/D5fF+zH5uVltfx5NLXHPKw/VDoRzYd5laW4F2G6Tfzvm
	O3bqeCVlq6GIJEj2k4BRmCZJBX5ttRk4mj/02uCf6ur4hwcvFlR4+kcyw+6Q==
X-Received: by 2002:a05:6870:a18f:b0:459:fab4:70af with SMTP id 586e51a60fabf-45e3ea85649mr3539157fac.13.1786535037941;
        Wed, 12 Aug 2026 04:43:57 -0700 (PDT)
X-Received: by 2002:a05:6870:a18f:b0:459:fab4:70af with SMTP id
 586e51a60fabf-45e3ea85649mr3539132fac.13.1786535037560; Wed, 12 Aug 2026
 04:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com> <20260805183839.2576691-3-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260805183839.2576691-3-rahul.pathak@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 17:13:44 +0530
X-Gm-Features: AUfX_mzZRPQfhixIzTWuxlvy96174zoK4ZcjInJnTlua4Z7BvaBOIADBi-djtZ8
Message-ID: <CABBgwmvnamuuuUX6xL0yuJeU-nhB_QLPCiuAThHXK-zch=fipQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/5] riscv: Add Smsdid and Smmpt hart extensions
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Ranbir Singh <ranbir.singh@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA5NSBTYWx0ZWRfX3vwA5YkOCE6q
 IEC8igST2wyySEHl+qc/RLJa7tBMb0uXsAqwX9/NKXFkNlQWYOmC2JlCFwvGO9GGk7BHyX+AgLT
 3/muVuLhicRWJMcbGdPoepLdH73lBkI=
X-Proofpoint-ORIG-GUID: XVVouue48NasrkL6kxXbg_rPBJ-AJZM0
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7c5c7e cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=rMjfrZy8gvDLKKaNkeoA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: XVVouue48NasrkL6kxXbg_rPBJ-AJZM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA5NSBTYWx0ZWRfXzHB+wDc9q85B
 HcLJF4d/gEmJwoCkPJ91TuG4IzMrjPqFHOuV8zY1j2I6fr/Ag/tN3V/j3k/wbddfNwIzJstvDkn
 7pzr2PeozxX9f6MWXeDuamg7vleln2+Qh3Tiv56Smb+lptBACay3bojf9y06d8Ng487r3ghuIP0
 tRw686QkVkSA7VrRpinnvl73BPzxz0ENB2U8O/ScFADqyzfWjF35W7AoVV3203J0A3x6+cxR0zh
 7AUs/E5/uBuimQ0+FkJduNtwNnrTY0MJWCSmWbSmCL2i8phrBSzBGON/I9rdsc07AF7OM0J1Hr3
 73aelmv7OgAgqkZoXCMnjg0iCQA3rUhFlb4Sibp61qdteSleKcTcvAvfNsrwEoXdizan2+eZ5uF
 Btdy6feJ9xjscfPy+jpE++Pawfnwfb0lJuTp9erOafLuheOH/EQoHEKidDxtX+HC/3uHGrM/dia
 Z+XN+D12GI70aLeRlSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_044359_484841_D8E1E8DE 
X-CRM114-Status: GOOD (  16.65  )
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
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQWRkIGhhcnQgZXh0ZW5zaW9uIGlkZW50
aWZpZXJzIGZvciB0aGUgUklTQy1WIFNtc2RpZCAoc3VwZXJ2aXNvcgo+IGRvbWFpbiBJRCkgYW5k
IFNtbXB0IChzdXBlcnZpc29yIGRvbWFpbiBtZW1vcnkgcHJvdGVjdGlvbikgZXh0ZW5zaW9ucy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFrQG9zcy5xdWFsY29t
bS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1
YWxjb21tLmNvbT4KPiBSZXZpZXdlZC1ieTogUmFuYmlyIFNpbmdoIDxyYW5iaXIuc2luZ2hAb3Nz
LnF1YWxjb21tLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfaGFy
dC5oIHwgNCArKysrCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgfCAyICsrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2Jp
X2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBpbmRleCA1NDMzOTNiYi4uY2JhZDk0
ZDQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ICsrKyBiL2luY2x1ZGUv
c2JpL3NiaV9oYXJ0LmgKPiBAQCAtOTUsNiArOTUsMTAgQEAgZW51bSBzYmlfaGFydF9leHRlbnNp
b25zIHsKPiAgICAgICAgIFNCSV9IQVJUX0VYVF9GLAo+ICAgICAgICAgLyoqIEhhcnQgaGFzIEQg
ZXh0ZW5zaW9uICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfRCwKPiArICAgICAgIC8qKiBIYXJ0
IGhhcyBTTU1UVCAtIFNNU0RJRCBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9T
TVNESUQsCj4gKyAgICAgICAvKiogSGFydCBoYXMgU01NVFQgLSBTTU1QVCBleHRlbnNpb24gKi8K
PiArICAgICAgIFNCSV9IQVJUX0VYVF9TTU1QVCwKPgo+ICAgICAgICAgLyoqIE1heGltdW0gaW5k
ZXggb2YgSGFydCBleHRlbnNpb24gKi8KPiAgICAgICAgIFNCSV9IQVJUX0VYVF9NQVgsCj4gZGlm
ZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4
IGJlZTg4NTU3Li40MjYxZmVhOCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiAr
KysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBAQCAtMzYwLDYgKzM2MCw4IEBAIGNvbnN0IHN0cnVj
dCBzYmlfaGFydF9leHRfZGF0YSBzYmlfaGFydF9leHRbXSA9IHsKPiAgICAgICAgIF9fU0JJX0hB
UlRfRVhUX0RBVEEodiwgU0JJX0hBUlRfRVhUX1YpLAo+ICAgICAgICAgX19TQklfSEFSVF9FWFRf
REFUQShmLCBTQklfSEFSVF9FWFRfRiksCj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKGQs
IFNCSV9IQVJUX0VYVF9EKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21zZGlkLCBT
QklfSEFSVF9FWFRfU01TRElEKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21tcHQs
ICBTQklfSEFSVF9FWFRfU01NUFQpLAo+ICB9Owo+Cj4gIF9TdGF0aWNfYXNzZXJ0KFNCSV9IQVJU
X0VYVF9NQVggPT0gYXJyYXlfc2l6ZShzYmlfaGFydF9leHQpLAo+IC0tCj4gMi41MS4wCj4KPgo+
IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
