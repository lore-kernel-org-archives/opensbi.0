Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C1CC982D0
	for <opensbi@archiver.kernel.org>; Thu, 17 Sep 2026 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CVSMr9JhcjL5iuO/lL4CXlcMAk8/JpSrkA4nPc7b1I=; b=X2NK6+eaEOHeVv
	+lxqDbfH3bQp6f6dw4UWbb7beV0urvXvVSg5/9yYKP5NFaqrjmV2Clg4ggItODaCf8TR2PigQS1pN
	SPzRu8QJ68CtbDqa4yDaCyMuHwh0dyLccD5iOa0BrsfCkpKf8khxlqQGmRBW3i/P1xR28lE/4dUmu
	YdxnYqxyu/lYwxRPewAOmdK8bEVi9ZaiRGWcpPMg2GM/vE8OvrthYVdAVXzUcgKgjNzm/giDvTz7b
	mufDHtDeZuzHY7s7vh1S1MQkiWuAwqQ4zDeNZcG5BA84/cgYbMSO2XIT3YObzmy3izRAdH6WjGrXy
	1uxXT/hC5bW+Y0gFkv0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78Hi-0000000Azhs-33EJ;
	Thu, 17 Sep 2026 09:20:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x78He-0000000AzgX-33GA
	for opensbi@lists.infradead.org;
	Thu, 17 Sep 2026 09:20:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Jvb11223004
	for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 09:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMLg8eZzT+HXzyfPc+AZRfCICb/+Qsa/ULjUt3lAv7M=; b=fhf61RVDw6ZBZfrJ
	/UIbzP6gbTvVHoaS1TCojj6oseWW+xkQ/rgjxSdo2bXpeILHHFJL33hPaMMtM4sJ
	a0KWcmy1ZKvFqZVfaaNEr2l/O0SNCRmJhX4owO3yBARkjBJT7SwwbeJl4qxG+4eA
	zqRHgjDS/ZyKKCO/0iNAzcGofTGip6/gKRL99mpxflpynzBbjUlnWUF2kkd6neaC
	hQgGnfR+8HTY8m6Tx7rEkhGmt0aLShec1aOVCmgaya1+MFS+xCSVr+zP6fm1RajZ
	UlQn4shaEhvLrZ6zkxp90Ge2mZ4dxuaBh0XREWIFDmV0V+9H/Ev5wK+Wy0ILjVlj
	fAui/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftg01q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 09:19:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso90114685a.2
        for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 02:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789636797; cv=none;
        d=google.com; s=arc-20260327;
        b=ovxbWhsrZ3Go6mx6+kCZ/Mw95xMy36pD3q9un+axatMdOjuDT1q7oRnUTp1e8mQSvt
         qJDwwfo7EI45tID4EYliXpYr/PfkEbvbkdks+fQureuzG4e3ZqEgmYZ5eh3h39Z5XFmx
         jhR97lP9uk+ZtKgi6bQ2UAuNf8keoOaU+HJK6ZD1QMf7F13tYTPankTjMalInSIB5tZL
         8X3evD2IDnN1gKdsNFMwb/dWHrFAvHLL0YSuG7KSOnlk5y9fbUXsOTfwap0ZZVdOc/Rj
         hm5sFdPXNdVw+tTFxPOt4WeY1SmwjTuGaMLfsfEB6yhb3R2lxpreOuqRnkNPBVZseKQV
         t0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GMLg8eZzT+HXzyfPc+AZRfCICb/+Qsa/ULjUt3lAv7M=;
        fh=Ck9X1cQ6zEXteMjVk79ib6BKr+LbI80fo5ky5B2JXhI=;
        b=BLDHsCuNXHzVzNSwbdoemWZczuXp2gSLium+J6bGB4109oyMuTvyoP0ERrz5hO6qW+
         cKzYAbGy3X+L8SftZeP/0bZD4NvpIr1pXFHFUpALEj2bDQNMxV/CuwN/T/xKCNmaQ7Xb
         fiAD8AhFb0spmrN3GDYVEb3C0+4g770wfHFast+vUm2JXVtgFxLoAZ1DJGi9HR0Gj1mK
         VzVrRNP2O4XTuHUtgGP4YaKLSfsH2GPTsLg/ZJrSV+jPbuwYj5ioxI5jDnFQNFbxtxik
         ql1R1hODecAJrgTVFQRin6e2orcx9IFCZSP/w/V1scYhjCcMYX0bkTEKJwdaWU72gDao
         SxzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789636797; x=1790241597; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMLg8eZzT+HXzyfPc+AZRfCICb/+Qsa/ULjUt3lAv7M=;
        b=O8MiRJFoWCsjYezWTzFUhrfJkcL3bxU3Hm4Tddkoc5NBIu+d4go4csJscSDE5Bp8rM
         0SoKaG8LTo/wH+KlBViZGpRM7fiCTB3xyqDaK8TgKoko5RHIXIxUIyOmwjlb+bjjUntj
         d/0BzCR6A0kd2GwsORIrb8l372xvpdosALXbR0o+cowDvlGtAk9/JmecKLCdy9eon8hR
         YK8XmIJ+e3hOLpuUG3J6CgvA1b2zHTHBqxzEFCNDDLnjGzlWsLq7Dijn9XjDj/VUIBNz
         RvELp+bAsriaI6GtH95Ri2XWdS+R3DdYu4UEy16HvZwbD/J57qHirUMdPO5TUKXPx3+e
         HNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636797; x=1790241597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMLg8eZzT+HXzyfPc+AZRfCICb/+Qsa/ULjUt3lAv7M=;
        b=TzTD+9hOw6zPdrECWTz1cgU3HF3vdSQeOopiE6944EjdHcpQ+a6GAYkJEO19sqr9OG
         ObyTXrITS/q3UelBEuP4BoHRexG4r4jquCA3puMseQxf7cALQrFXoi13n/hO2P0ZHuuN
         IN0wEw68ok9/zo4DZCT4kzlpjwUQLJtklr8SPwMq/oXMeqjxXbWE1W3p3HJkP+ZWEepb
         dgh+66kZgCWaygwMxC1jbSKQ1QmdZTG1bbWOPumdlPU4wUdYTEU/N6MsmwIRMR0hM/Jz
         AFBFj6VgKd2L9UBJp43Mm6MlwncUx5l5/PCm9zo9O3X4CnmcgxJ+S5nDM0pNARCWI3SJ
         cB/w==
X-Gm-Message-State: AFuF++lAeycfEgGD9xzzLQDZER3eavcuWvIGIx0n+rcr7QI8PXjtanzY
	t9u7sYMm3uvXvvCFtQWkYNQkstWFR/ONvJ1X7TUrxNnnaCul0bInS42xKzLlpMz4N6vOm9CkcIa
	n7d8v/iVS2aUXzCQQfaMhekX1yei1qOlVLhEKxgcWtYEqwuINOffVOCyEotR73AGsLDMuE6PPZy
	dKDWPYI2DDX/wOD35QapskV081NMd0jHePF89/EobUDpObJOFm
X-Gm-Gg: AYBFou3n975HttniEtOJOPhDmfkZZhdDDwyPhl9MfsSt9a2QemY2q9WjD8zlhedxnbZ
	ZxayymAeCWJL6kGozNPmlqm+C9lAfZMJBatcP12uoNN4jqUpc5qFyB5OwRCSFYcpB08e6Uj2WOR
	iw8qgFI/SdYOPIb5mjZlZLoWfmQaaR9n+9kkpDXwiCl0cMUbrqg7Wmi6o+VA==
X-Received: by 2002:a05:620a:40d5:b0:939:b099:d52f with SMTP id af79cd13be357-93bb773b3c6mr1021671685a.20.1789636796681;
        Thu, 17 Sep 2026 02:19:56 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:939:b099:d52f with SMTP id
 af79cd13be357-93bb773b3c6mr1021668985a.20.1789636796299; Thu, 17 Sep 2026
 02:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260910210819.525538-1-pawandeep.oza@oss.qualcomm.com> <20260910210819.525538-4-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260910210819.525538-4-pawandeep.oza@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 14:49:45 +0530
X-Gm-Features: AcwNN1VnO6bap-vueavrDWVO11RaRFTg3kY69CTjJfnGTfYQ5i2i6SplV656_l4
Message-ID: <CAFR3w37hKe5FkpWy67QvE-U_YKxR3OzbgkJxj0NYBf1LMBxSdg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] sbi_utils: mpxy: add FDT-based MPXY bridge driver
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfX8sEddGMhpOH0
 uilrxYgZLgw9wLMLevBGxKGEThaoORshz9V5zudd9c7HcgQmaM0t9gk9b4P9QfE3pb4Hc9I5Aml
 aWSYv7TWiYkpodbcNqqe79CKfhoig0u+aYIHbYzo83sOquBS/CUG+N80k0BOi/xo/oXYCRQtK7d
 cAW2RVNxAghsEXlvdBGQH2fdyL/CbzTxTNyGJeKjJ0jQbw3ynpIh8RPLD4EC49byldJUn/UUEG6
 siedjr+Qu6wtYUQXopNEUijuuxZi0uZfzV/9kazJwTJAbVoGbB0l1mPB/L4pSkGQ5Pj+z5MJWaQ
 arE+lIuNEScntVexjYE+w0GZ1EAuY9m9chshFTQCaQJZzyBYDUiMiAnd20ATeXv2gQcD+PrAjqR
 sfR6RqzLrOgKG278aGb7tk/+/fjCw2vppx5huiqDtrM1byq+bhEjBsmvqVQmExQIjw0qh0YOmus
 vlqeMZYsnqdQ9YCHQVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfX8yjfOGs4lohs
 sl9HjEK4C8vGKJW2W/xq0Ou3OkoU8hi3edwAXavlX62EZ6VdzlvTUevhmkf6oQTWm+mhJ84rrO6
 c+2BciDc45JE0eqsohrFeyHJS/fm7tg=
X-Proofpoint-GUID: XEQ0yoEBwNlkt9sy3Sah2eGkcOlzWT5j
X-Proofpoint-ORIG-GUID: XEQ0yoEBwNlkt9sy3Sah2eGkcOlzWT5j
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabb0bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=YkfMJ8Ifu-vfngmQkxcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_021958_878857_5D03BE83 
X-CRM114-Status: GOOD (  24.12  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMjozOeKAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBJbnRyb2R1Y2UgYW4gRkRULWNvbmZp
Z3VyZWQgTVBYWSBicmlkZ2UgZHJpdmVyIHRoYXQgZW5hYmxlcwo+IGNvb3BlcmF0aXZlIG1lc3Nh
Z2UgcGFzc2luZyBiZXR3ZWVuIHR3byBTQkkgZG9tYWlucyBzaGFyaW5nIHRoZQo+IHNhbWUgcGh5
c2ljYWwgaGFydCB2aWEgZG9tYWluIGNvbnRleHQgc3dpdGNoaW5nLgo+Cj4gTVBYWSBjaGFubmVs
cyBhcmUgcmVnaXN0ZXJlZCBhdCBydW50aW1lIHdoZW4gdGhlIG5hbWVkIGRvbWFpbnMKPiBhcHBl
YXIgdmlhIHRoZSBkb21haW4gcmVnaXN0cmF0aW9uIG5vdGlmaWVyOgo+Cj4gICAtIHNyY19jaDog
dXNlZCBieSB0aGUgc291cmNlIGRvbWFpbiB0byBzZW5kIG1lc3NhZ2VzCj4gICAtIGRzdF9jaDog
dXNlZCBieSB0aGUgZGVzdGluYXRpb24gZG9tYWluIHRvIHJldHJpZXZlIGFuZAo+ICAgICBjb21w
bGV0ZSBmb3J3YXJkZWQgbWVzc2FnZXMgdmlhIFJQTUkgUkVRRldEIHNlcnZpY2UgZ3JvdXAKPgo+
IEtleSBkZXNpZ24gcG9pbnRzOgo+ICAgLSBicmlkZ2Vfc2xvdF9wdXQoKTogaW1wbGVtZW50cyBz
YmlfbXB4eV9zZW5kX21lc3NhZ2Vfd2l0aG91dF9yZXNwb25zZQo+ICAgICBzdG9yZXMgbWVzc2Fn
ZSBwb2ludGVyIGFuZCBzd2l0Y2hlcyB0byBkZXN0aW5hdGlvbiBkb21haW4KPiAgIC0gYnJpZGdl
X3NyY19zZW5kKCk6IG1wbGVtZW50cyBzYmlfbXB4eV9zZW5kX21lc3NhZ2Vfd2l0aF9yZXNwb25z
ZQo+ICAgICBzdG9yZXMgbWVzc2FnZSBhbmQgcmVzcG9uc2UgYnVmZmVyIGNvbnRleHQgdGhlbiBz
d2l0Y2hlcyB0byBkZXN0aW5hdGlvbgo+ICAgLSBicmlkZ2VfZHN0X3JldHJpZXZlKCk6IFJFUUZX
RCByZXRyaWV2ZSBwYXRoIOKAlCBpZiBzbG90IGlzCj4gICAgIG9jY3VwaWVkIGRlbGl2ZXJzIG1l
c3NhZ2UgaW1tZWRpYXRlbHksIG90aGVyd2lzZSBzYXZlcwo+ICAgICByZXNwb25zZSBidWZmZXIg
Y29udGV4dCBhbmQgeWllbGRzIHRvIHNvdXJjZSBkb21haW4gdG8gd2FpdAo+ICAgLSBicmlkZ2Vf
c3dpdGNoX2RvbWFpbigpOiB1bmlmaWVkIGRvbWFpbiBzd2l0Y2ggd3JhcHBlciDigJQKPiAgICAg
ZW50ZXJzIGRlc3RpbmF0aW9uIGRvbWFpbiBmcm9tIHNvdXJjZSBzaWRlIG9yIGV4aXRzIGJhY2sK
PiAgICAgdG8gc291cmNlIGRvbWFpbiBmcm9tIGRlc3RpbmF0aW9uIHNpZGUKPiAgIC0gYXQgcHJl
c2VudCB0aGlzIGJyaWRnZSBkcml2ZXIgc3VwcG9ydHMgZG9tYWlucyB3aXRoIHNhbWUgcG9zc2li
bGVfaGFydHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3ph
QG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGxpYi91dGlscy9tcHh5L0tjb25maWcgICAgICAg
ICAgICAgfCAgIDQgKwo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9icmlkZ2UuYyAgIHwgODIw
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGxpYi91dGlscy9tcHh5L29iamVjdHMu
bWsgICAgICAgICAgfCAgIDMgKwo+ICBwbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmln
IHwgICAyICsKPiAgNCBmaWxlcyBjaGFuZ2VkLCA4MjkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgbGliL3V0aWxzL21weHkvZmR0X21weHlfYnJpZGdlLmMKPgo+IGRpZmYgLS1n
aXQgYS9saWIvdXRpbHMvbXB4eS9LY29uZmlnIGIvbGliL3V0aWxzL21weHkvS2NvbmZpZwo+IGlu
ZGV4IGEzZWQxYzIyLi4wMTdhNmIwNiAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvbXB4eS9LY29u
ZmlnCj4gKysrIGIvbGliL3V0aWxzL21weHkvS2NvbmZpZwo+IEBAIC03LDYgKzcsMTAgQEAgY29u
ZmlnIEZEVF9NUFhZCj4gICAgICAgICBkZXBlbmRzIG9uIEZEVAo+ICAgICAgICAgZGVmYXVsdCBu
Cj4KPiArY29uZmlnIEZEVF9NUFhZX0JSSURHRQoKSXQgc2hvdWxkIGFsc28gZGVwZW5kIG9uIHRo
ZSBGRFRfTVBYWQoKPiArICAgICAgIGJvb2wgIk1QWFkgYnJpZGdlIGRyaXZlciBmb3IgaW50ZXJk
b21pbmEgY29tbXVuaWNhdGlvbiIKPiArICAgICAgIGRlZmF1bHQgbgo+ICsKPiAgY29uZmlnIEZE
VF9NUFhZX1JQTUlfTUJPWAo+ICAgICAgICAgYm9vbCAiTVBYWSBkcml2ZXJzIGFzIFJQTUkgbWFp
bGJveCBjbGllbnQiCj4gICAgICAgICBkZXBlbmRzIG9uIEZEVF9NQUlMQk9YICYmIEZEVF9NUFhZ
Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X2JyaWRnZS5jIGIvbGliL3V0
aWxzL21weHkvZmR0X21weHlfYnJpZGdlLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwLi41NzhkYzliMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9saWIvdXRpbHMvbXB4
eS9mZHRfbXB4eV9icmlkZ2UuYwo+IEBAIC0wLDAgKzEsODIwIEBACj4gKy8qCj4gKyAqIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiArICoKPiArICogQ29weXJpZ2h0IChj
KSAyMDI2IFF1YWxjb21tLCBJbmMKPiArICoKPiArICogQXV0aG9yczoKPiArICogICBQYXdhbmRl
ZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4gKyAqLwo+CgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
