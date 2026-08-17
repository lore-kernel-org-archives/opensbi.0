Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD786C5DF66
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 19:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8nv7fo5JpgmpYEHbb8AP6ghXT4PEHT+RF/xnjLEFWQ=; b=aBX/66S07ipdLJ
	fW9+swzuVpgbmzGZjLxKxtVS0WPBRYSwI0z8aMJNxWY/nVEaKNCVxu+0CdKgbhePs92ZZOT+CbLv3
	E8B13+Nd0g2o4KSH9vMBs+MpMRcy6bvzEdk3StttLIfHuMI7dhw7sATNYFq5B23b+43G87A8y+Y98
	0Fhns/aKGX54AHFN11cY5OrIRBE8oMf8qwk18I+nky3E8hCaG3vVJf4xE5YDsI5WmhLFJkbCn9VPJ
	9VK6tTXQmyxQVe0/pRA0ypCq4LF8YASf1ouNHvYABBX+zSbUGzbQ0OK3/LQT3VCkEvDXbBR2y4CRb
	3ubsFUAV9Ue8nKNdSOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww2hY-00000006hIS-1XAq;
	Mon, 17 Aug 2026 19:08:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww2hV-00000006hI3-1u6q
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 19:08:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HIR6ZF3143225
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pICjzetUICylUZPrkR1DOkKMMzPbrdUQnslk63nBHYk=; b=JTqu4zoIp7qTpDuv
	CYqZQdmfJOPQRdrmYUpu+833xaKLhIFBE1yTbvQ45ojFNAlyJBRSqXm1X9Se2Gud
	RUkZGE1RcVzXwrQAS1Y04iIxAeLFfjQImH6a9LvPxbGh7n/9lQnJt4+qgV86O1xZ
	tVeR3rRqjDgF/517oD8etVb9wijpknRq53pEKDFCxWJY4KUYiLGxuTDFDv5+2r/m
	aXt2gwJ4bSLgiKPmCbHSDgvfj/NZUqNAHEoSYLJqhyGl1dOO3Pp3THtmfmK/0puj
	yWY8KUWn7z0LnRqwaJxJaPfT5eyWU6HQ1yyHbucYsItuhrEpo40xxDXjOB5HA/it
	aA9HEg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wrejw95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 19:08:47 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-43cd2d12617so5707507fac.3
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 12:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786993727; cv=none;
        d=google.com; s=arc-20260327;
        b=HnGzvWaqvpmG/1axLgqi8JT5Bq2MoKN902AKlD8gRBQsgYrP6Sx7QiBPfwnhSjOE6M
         7z2QN/OMOS6G+qYOrlPCMVq0a58SpKAp1Uq5SlFTeVNIWdBhZhKrFUxy7yrBuel3aa7L
         nVzvpOauJb1tiuJWPF57e2Lo/lvTqbtrq3Sqe76hWvU7OFYSCCfCzutOnA36Z74tyi9g
         Iact4CjpS9k60QsqC+HunIxACjrgU87JgVHPhNEYKg7aHCILeR71cEMk7IQVFwIlhYtu
         YHoR4FeyLVPfCrGswJEfnfGakECtvYk+4xRiZcSiGG6ngJKfHfIxlTvLi9F/QlXgpo3i
         uwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pICjzetUICylUZPrkR1DOkKMMzPbrdUQnslk63nBHYk=;
        fh=A3Nfz0ULW3SAQgTXgf7vpa8lR2hSwrinkX7/KF9XCw8=;
        b=bHSQRQuJp4nNS5zhNL4TUpNEQP9afqSxJX+O9F+snwekDqyhIp+YpjHgUBmnbAXeEM
         tsDd5ow8ZR+SkM7DWMeGUevdkF8CWsoCN8q+RQ2OYu7e7fJCsjXDN8YE2Z7ZKh4A/775
         Ko4+CfnXk2Q6qk1k1IobTLJASCgApfaFZ6/t4PbZ1VtXprv3N7qq2mL9MHzPMYWc1q5l
         I9XxHuptR1DsjJOR0q44fmQ9FbHZz8FAdtv6u5GsQd1bXRYHdZW0EcDgrdbROiLSmzaH
         byeOgFcvq+pZIS4QzZOAM1TulDAtk17yAwTNzCwOxxMw7D0fyRaJb6ubYCbvyTYCCNkP
         b6MQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786993727; x=1787598527; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pICjzetUICylUZPrkR1DOkKMMzPbrdUQnslk63nBHYk=;
        b=frdvMTf8YgyfqcsFQAsiU4ScEz3wp5MvPp7jDMx6pU2XzqgQ5AgN69tdNArrKrOgDO
         1M3aGJGt9NxxM/H/+nes35yNFbSt1bkIreO04GZs0d1Lvba9CB5L4t4yV/Nt4fACMZ3d
         eCD1e9YxRv9xN7sAMJZ3WygzYlgm4lkzx+xKObFAPskbzJ5D7AvoXcjjxLX4Nerc7Sla
         ncgQQmn5xZtSnuiNFrpw3m2abI+tshdXIRkZwLr135YSl3DVw8bsx8mxq7sfi7cGVmG+
         vIrUBnA+gjX9d3k4G1Co2KiEuQ9SDqKpp/P5uYuQP5IXpo2w8zV+uKv5pE4yH8kRF3md
         2Xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786993727; x=1787598527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pICjzetUICylUZPrkR1DOkKMMzPbrdUQnslk63nBHYk=;
        b=ix2xjAvQW9xME74u9GJ2Sa2uXx6n07RO06xZ7+mMnQlpn8d0WROnsV0MBR5jmmmWkw
         rZXHKGs+HSyjmfJl5rUPYms3mbBRCpp1SWp24JMKhs5hNHH5DBat/awFRLwrCFrEVP+T
         2WG3/2IiUxUgLut/MrIVrfuJ/MPSsbxR0zVpCWrA3VxTqF+jq7s4lLgg07tXHqVYFd9C
         TBIUPEAknxm7y+dOdq+LePycgN4u1+HEo4v6g0F2IIOe92U/mH0YFowtV5J9bIdKFXPm
         +cjAYG/AAzr21OOJk8D3wrfPyXEW/cX6JlUWCPzwzru/FaHAZ7/OlWEs0c/1mpKv3vbT
         rUKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq48qH5FrMldFvuNh42eInsP6f0OMilO/Am4hnYR7i6y8WOIp+TMXWhJQDihqwCz865MYS8h873@lists.infradead.org
X-Gm-Message-State: AOJu0YwkbvmrxYK5YRCVwr+PR+9PoPWVrPJb8u75s7IbtZ/RieL6Dg2/
	Hnxa6Gof1Yd14+sQqzQxQK0bAOJCsHgsqlPGU5JxG+qRdeXsxxNbxTF1AfCreoJrRSSFO368KTu
	t8ZsYJlYJWoQ80gzmmWXqy+7mW5cC9LS2EMclwFbYhOARJgpzaHaX06q3TSSf/vPxUrODlpQD/D
	kVNxutClC0tFjg8NLpEuiYzZmmCW1JgePBux4ac8HL
X-Gm-Gg: AR+sD13PnZQpt0Eu+nEvoRRPHwlWLB8IYMzCZV3L4VBEXzhJjvxWLHPKq7P6DsunIYA
	l4RhMQu+H9SIb7qtm73OmbqnBIN061IkWuQ0V2nbL8oC7gdrXQWdsfcCj1C+Ct4ubQ7XMlQYx9y
	fDlvhC1b1P4cPVCvwyqGNA7l4PetgZ5d03CHRzTHP7zlNp/5FihOEhPq72ow==
X-Received: by 2002:a05:6870:a547:b0:456:b249:700c with SMTP id 586e51a60fabf-45e920d5883mr24062636fac.19.1786993726686;
        Mon, 17 Aug 2026 12:08:46 -0700 (PDT)
X-Received: by 2002:a05:6870:a547:b0:456:b249:700c with SMTP id
 586e51a60fabf-45e920d5883mr24062574fac.19.1786993726278; Mon, 17 Aug 2026
 12:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260817143025.3068512-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260817143025.3068512-1-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 12:08:35 -0700
X-Gm-Features: AcwNN1VM0qwYrAjytkA9DPIxxwMWjKT-9o-Rvk2h8EaDqhh2oQtXTfE8QPy_pt4
Message-ID: <CAAVgOk+Oj8xS=cvOpQk5M-HedxgpPT8+z=Aa+NGfoHhtpnup=Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] OpenSBI domain initialization order
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a835c3f cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=a95ABtpSmMC8Q04EDMUA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: NpvDpBagVc-iDht56MV18rUYg88jeklg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE0NiBTYWx0ZWRfXyR+JpmjLEFHF
 uof91hTEC1BlusqI4Ej/zzSG8MTZaXIt/Zm20u2ihoINt0cjosa+pYvn51dkEoNQOtpgCs/ofYo
 Rabjz3+UPJjDVHqihaJX5FnXfe55Rv4VmrAuE4Ob9XeitawGshkGVw7Vo874l0RKyaP6i/iDarr
 t0904jsOab7uNW8g1aUsJ3FG/ATuA+Tl2b2X6QORla4qqegzQ/2z2Qso/2qOj5gVhIJFqfweU9N
 0YYIlqcavf7fXhc0wqPjkEFr3Spyf5SSoruNqRTRwRgbIHTlr9XKsOeIWpGs6EO8vyGfwzzXDkK
 SKcNWFnO0UHKIZqtwX46aveRRmcp/03i/fN4IAQEZZRzLXOvdoi080+JbNRT5Fbr59/1SPJeuB9
 uLELPCVcToSUNp8owJ0833TJ7REED6WW+8bWti8/8Hy7jEq8q5t9C7B+0DMcMf2tqM51Ak9Ri8+
 vTlrzJWmga/nG8tZoTw==
X-Proofpoint-GUID: NpvDpBagVc-iDht56MV18rUYg88jeklg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE0NiBTYWx0ZWRfX1XtHZeKha9ro
 dXN/zS4g+/YXgFfXd9NSzC8g07ZoRBRQIhwSDrMfK5fXA6GRdA4/JCDDeGUhzHjKSjudK9oaBZx
 PZzQ+LgsXm8skgTVam/MPUHG5dr66y4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_120849_674834_7ED14988 
X-CRM114-Status: GOOD (  16.63  )
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgNzozMuKAr0FNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIHdlIHJlbHkgb24gdGhlICJv
cGVuc2JpLWRvbWFpbiIgRFQgcHJvcGVydHkgb2YgQ1BVIERUIG5vZGVzCj4gdG8gc2VsZWN0IHRo
ZSBkb21haW4gYXNzaWduZWQgdG8gZWFjaCBIQVJUIGF0IGJvb3QtdGltZSBidXQgdW5mb3J0dW5h
dGVseQo+IHRoaXMgaXMgb25seSBzdWl0YWJsZSBpZiB3ZSBoYXZlIHR3byBub24tUk9PVCBkb21h
aW5zIChha2EgdHJ1c2VkIGFuZAo+IG5vbi10cnVzdGVkLiBGb3IgbW9yZSB0aGFuIHR3byBub24t
Uk9PVCBkb21haW5zLCB0aGUgZG9tYWluIGluaXRpYWxpemF0aW9uCj4gb3JkZXIgc2hvdWxkIGJl
IG11Y2ggbW9yZSBwcmVkaWN0YWJsZSB3aGVyZSB1c2VycyBzaG91bGQgZGVmaW5lIHRoZSBleGFj
dAo+IG9yZGVyIHZpYSBzb21lIERUIHByb3BlcnR5IHVuZGVyIGRvbWFpbiBEVCBub2Rlcy4KPgo+
IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gc2JpX2RvbWFpbl9pbml0X29yZGVy
X3YyIGJyYW5jaAo+IGF0OiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9vcGVuc2JpLmdpdAo+
Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIFJlbW92ZWQgdW53YW50ZWQgImJyZWFrIiBmcm9tIHRo
ZSBsb29wIGluIHNiaV9kb21haW5fY29udGV4dF9leGl0KCkKPiAtIFVzZSByb290IHZhbHVlcyB3
aGVuICJuZXh0LWFyZzEiLCAibmV4dC1hZGRyIiBhbmQgIm5leHQtbW9kZSIgRFQKPiAgIHByb3Bl
cnRpZXMgYXJlIGFic2VudCBpbiB0aGUgZG9tYWluIERUIG5vZGUuCj4KPiBBbnVwIFBhdGVsICgz
KToKPiAgIGxpYjogc2JpX2RvbWFpbjogQ2hlY2sgcG9zc2libGUgaGFydHMgaW4KPiAgICAgc2Jp
X2RvbWFpbl9jb250ZXh0X2VudGVyL2V4aXQoKQo+ICAgbGliOiBzYmlfZG9tYWluOiBSZS13b3Jr
IGJvb3QtdGltZSBhc3NpZ25tZW50IG9mIEhBUlRzIHRvIG5vbi1ST09UCj4gICAgIGRvbWFpbnMK
PiAgIGxpYjogc2JpX2RvbWFpbjogSW50cm9kdWNlIGRvbWFpbiBpbnRpYWxpemF0aW9uIG9yZGVy
Cj4KPiAgZG9jcy9kb21haW5fc3VwcG9ydC5tZCAgICAgICAgICAgICB8ICAyNSArKysrLS0tCj4g
IGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgICAgICAgICAgfCAgIDYgKy0KPiAgaW5jbHVkZS9z
YmlfdXRpbHMvZmR0L2ZkdF9kb21haW4uaCB8ICAgMyArLQo+ICBsaWIvc2JpL3NiaV9kb21haW4u
YyAgICAgICAgICAgICAgIHwgIDQ1ICsrKysrKysrLS0tLS0KPiAgbGliL3NiaS9zYmlfZG9tYWlu
X2NvbnRleHQuYyAgICAgICB8ICAzMSArKysrKystLS0KPiAgbGliL3V0aWxzL2ZkdC9mZHRfZG9t
YWluLmMgICAgICAgICB8IDEwMyArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICA2IGZp
bGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDEzNCBkZWxldGlvbnMoLSkKPgo+IC0tCj4g
Mi40My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkKCkxHVE0KClJldmlld2VkLWJ5OiBQYXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3ph
QG9zcy5xdWFsY29tbS5jb20+ClRlc3RlZC1ieTogUGF3YW5kZWVwIE96YSA8cGF3YW5kZWVwLm96
YUBvc3MucXVhbGNvbW0uY29tPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
