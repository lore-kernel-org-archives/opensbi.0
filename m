Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17013C4453A
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 21:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SB0UTsKq2yg4Q+iNPAPb/RoXUvl5IoEK93nOTqEb3gU=; b=Ol/cwvef5I8jnd
	wgbKMiz65yCANBttxmKh34qnYB4amQrLTVUeBOOXnW7mzgbgmVN/HgvT3v7uP3Jy5qSGl/48GzCRh
	eLPqX5WF118QPCJAIfc3UqyouvYTXcEjhI+S0l7FAlM5YuCiTnGzYiLqelpo9nhCoTd4Oqv6NEfDT
	Boiq9g5C8XQlUYoi/jShhxU34DtxXZdQ9LOtn6KgDey2JEClD2j0rfAMZUEOs/a4f3PckvejumeAD
	RuNJpod70KFyH1gnvgd1LCJsNf8I+4QIc9Ni6oFd/HAXXLXhiAW3WOo3W/At7knIYpwD0LrYu6KTT
	PXAl88Rwx68I0ZOwH9UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmehq-0000000CqPc-1Q5z;
	Wed, 22 Jul 2026 21:42:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmehn-0000000CqNX-0AKR
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 21:42:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MHqxZE1385493
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 21:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBJTFT3d+N5bDCG5bSjAstqBhVcc51o1qWsCCkL20Ug=; b=nmmsvgAGuvkZHKcq
	C0EFMGBb0Objl/Fo/njiMOJfzY/NV5gzBaA/CG6BC0QAxtG616oZ7IDnWP3H/gjO
	X2aO2VN4WWBpnPJvl2akpwedjvRhu2JJtzZ9kb9Apr89uhlImg1IVTHxHonDYpe5
	4kK6N5H4o1Gcl9yB4AgxrtqJ285mfidmDzo4+BvIg4pXoo7oJTcWzOZ/Jh63diSy
	V1x50XOZZ0gdfaiTmXG0yjIxsuETZnSov5EuazQ+Y5MFXW/QwWImSGI8EsDHD7Cf
	XopNPeXg0fZA8iI88sBEeQqcBh8TSYcKVLbOyss+2u+yTf2JjrQqM0j+TTI18Pga
	YyFMIw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjtn2u8w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 21:42:17 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6b5976d74so17556439a34.3
        for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 14:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784756537; cv=none;
        d=google.com; s=arc-20260327;
        b=mwdAqiaY/74eIsQVPcG5Bj+GbOwTF/VlDbw0/6qgSULwIYH13yLn3s4Et+DBmgmvjb
         xOuBbzasnyDZ+gjaEg4qAHS99ja4EaBeyzzaA5M6wbjlmDXrZg3pZBJFacxo49QO8/IG
         XyGFJRJoLUXRNGXmRaTIVLB0l/Z2Hg+PpREyny6vmq8Wdjf29Lk0qkcxQtxh+pSxEOfU
         IocjByv/NWpIqlhvDl3M5Pb/MW361yVZWvGUhw7CbGjBXTQxkBezkmcwPi5+kIiWJuJu
         jzjhhH11cM6lnz/UY9AofVSniddQGwSPnFjpYCNKnC7JXClTva6mJL7ez58Q1P/7yzFo
         7jww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bBJTFT3d+N5bDCG5bSjAstqBhVcc51o1qWsCCkL20Ug=;
        fh=MdmvXSUFENyCa9IM0o2OrD48qc7mts4Xf6MuVA5kyZ4=;
        b=i9J9y/mICP7mYql+9hHpP27xS+TqGxmsa3XS/M5u58i07F6CrnCMOfghZV+qNfxHNe
         uxSxWxCwgA/CAjeArWB1mRnAKtOmfXzZYHvDTK7etjMop5mFRz8rUhuMatGOklU6NlCF
         6D8qS0GnYJ9hf5I+7pQBzEAWCRLwiuSu0gdG/YjdCu/2pEMeKI4XAbE0JI9HuO3OPGbq
         FdQpqQSBKRMB1vDrrnjBrYxGBeSOtgD+jqQnvpN52GolNzXjEbY8RvF3+iiL+wjJ7Zci
         rJp1ENWvJ7DconKd9txDOqAqqLErMlXbbgjMu/B8vQs+Z7NB100pnOcZBZMtZVU9jpjz
         8dPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784756537; x=1785361337; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bBJTFT3d+N5bDCG5bSjAstqBhVcc51o1qWsCCkL20Ug=;
        b=RkvPhlaZqaqqk0uJqPikCmMAFosrU+HRljMDtxa/6SVKZQ+J4ZnYgKF/n9KZ6hjNld
         Hl/XHfpaQYU00XqesESg3SbTmaWXjc69KrxLjHiFEgvd3rwnqmBBvH77I4lL1uLJ51x7
         dt0WSTNFKwFD6PMX5MU4Z9D2Pv23amWTzIIoeLpEWvtC68QnGxpArxGiwfuFy9fkpGdd
         Nr4iMPWTiUO5x+QGcIhsCVfjQxe3N/cpMNAkPGRlB8w+xANIbxcXuI2z5+Gkbm/fLVIl
         o8bGQGJGg3269BImpdop9xxKUoyLugzCx0leoH2DtIgdmLzAGiAH+w+jz/hiX/6S/JPI
         yStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756537; x=1785361337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBJTFT3d+N5bDCG5bSjAstqBhVcc51o1qWsCCkL20Ug=;
        b=OegUMHcjilQRP9agHUqx5MgdQGaIsjZ5kp6nr4qzQoYHbaI/Rfc+L9wkJpDs5DGHHQ
         ESmRJ2XJKqXAKNOQZfRacNPjo0JG8DU8oLVL8c6eliaRyBzF9I0J1llHB209v7HgVpGV
         LEc2qBZn0oAdhZ95AAZph0+/lsZOYfP7XtePasowAIcpe7z3YjXVcqDGdYEjVtR3QEbM
         kDZa3bkHY0pVFJS/fq8SzDvX6T6BqEnd9CaA7ERsVaPPR4rP5A976iZWWAw7UqJFAJzN
         szJsHDGL+BtP4uHr/2GYF+ZsqdOQ45ilf9iErMuYwXrQAn15Gh2/Frb/iUX/Yt7jrZQ9
         KyGg==
X-Gm-Message-State: AOJu0YyB80rGpxgD3tBsY5n0CPX0wTJkgb90qmrzv1+PTc3CxPV22HLn
	2HCPkzzi4mSX+hIjz931dGMiZ7vd+3+3cS+PqWQBdhxKjtBIPZdAsKUu6PN+oYSvfLsnBlesQC7
	dZ9SepjvUkauGRWcvp9tX0yb2CoqbQZh5HJ6yozpvteGtkvS+rhbJo+Zx88w+rQP4+LktY2LjcY
	PSqPTJRRsKR7rXZDMZ7/6J/wEPnFPb2VIkwMVk4w+YDqUOnWD/6zQ=
X-Gm-Gg: AR+sD10RUHPII2er6UYblZnftP93nHKzv60Nq7Hsk2HqzoaLXgcAhSaLpLfqkpymMaf
	dIviUI7s21dfQJg14ZB8Iz95iTVMkWFIs0hE04kHbdn5iL/OJ4tBro/TaQmpjDrYCq9rdYLSCK1
	5ZWRzlb2oPONRveZrnl4zHqGAAl7itbVq3K3ESamU6GhVtT4QZTzF/e71XDUg=
X-Received: by 2002:a05:6820:81f:b0:6aa:51d4:95d with SMTP id 006d021491bc7-6aad41da038mr88696eaf.60.1784756537212;
        Wed, 22 Jul 2026 14:42:17 -0700 (PDT)
X-Received: by 2002:a05:6820:81f:b0:6aa:51d4:95d with SMTP id
 006d021491bc7-6aad41da038mr88687eaf.60.1784756536889; Wed, 22 Jul 2026
 14:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com> <20260722033455.2658178-2-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260722033455.2658178-2-rahul.pathak@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 14:42:06 -0700
X-Gm-Features: AUfX_myXXpMjSLKILmFlbQZIpL9I0hcubiANvmjurxdjfvokYSItPWv5xtuJ-l0
Message-ID: <CAAVgOkJYeB-ytdt4cRfGzspXkXv4YC1JE-1NAGbubxjf9-ag2w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] riscv: Add Smsdid and Smmpt hart extensions
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIxNCBTYWx0ZWRfX+0MecrsVKpKD
 OI3GhBK0gqY2JzaE5XS0Txx71DwsqwR0QZnR59m0xv+PNwLRTGJlcwVvW8ivmoqLFF018PKm4IT
 06DjmFOLwCLNpoEzJAMhsm/7MbTmWX9FlGFn8qGcA9CoCmdsdGo12dyapgsY9+VwkKvVOh0P9PU
 QOu4cdS7Cxfm0oXyIKT4eHKxmB/5CF/n+Odn5aXIM1rWW690l10P5dymQhs999OkwUnbnrKkO01
 UDBKdAmFMCrhNbOZAvGgzuxes20rh6RKh5gW7ZRjiyWMqC/RfmXlnlGWHs+pw0AcLZYHN9xJ/xA
 8Y/uw0n0UNYhVv2jcv9BvmMHsLtvTT3+673XG81l8zMcCn9SqqOrh1SQtmpC7OKjzpC5ddFAXHy
 esxElIrDBTad93Ck9m9nb+5o+qWAicYj6OWdn43eFv3LOH24K52tXlBkFdKqaRdOnXcR62kmjx1
 UbX4/JQ6BiPOaa9ZqLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIxNCBTYWx0ZWRfX0K5xUXWhFfBl
 l0RuqvccQx25q2SQikiMUnJRyswy2oIMo3ZWoCS6y2VQzXE12c3IRBiGLyF94xsecw//hl2clWL
 td6C9yDLFngDOfnTqjaLs+4cz7rCVB8=
X-Proofpoint-GUID: blEUvCruko9uQB0czs0VXx2CRN9s2Mxt
X-Proofpoint-ORIG-GUID: blEUvCruko9uQB0czs0VXx2CRN9s2Mxt
X-Authority-Analysis: v=2.4 cv=T+28ifKQ c=1 sm=1 tr=0 ts=6a613939 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=rMjfrZy8gvDLKKaNkeoA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220214
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_144219_204469_C7D2296E 
X-CRM114-Status: GOOD (  17.89  )
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgODozNeKAr1BNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQWRkIGhhcnQgZXh0ZW5zaW9uIGlkZW50
aWZpZXJzIGZvciB0aGUgUklTQy1WIFNtc2RpZCAoc3VwZXJ2aXNvcgo+IGRvbWFpbiBJRCkgYW5k
IFNtbXB0IChzdXBlcnZpc29yIGRvbWFpbiBtZW1vcnkgcHJvdGVjdGlvbikgZXh0ZW5zaW9ucy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFrQG9zcy5xdWFsY29t
bS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9oYXJ0LmggfCA1ICsrKystCj4gIGxpYi9z
Ymkvc2JpX2hhcnQuYyAgICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQu
aCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBpbmRleCA1NDMzOTNiYi4uMzhhYWNkNzAgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3Ni
aV9oYXJ0LmgKPiBAQCAtOTUsOCArOTUsMTEgQEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25zIHsK
PiAgICAgICAgIFNCSV9IQVJUX0VYVF9GLAo+ICAgICAgICAgLyoqIEhhcnQgaGFzIEQgZXh0ZW5z
aW9uICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfRCwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBT
TU1UVCAtIFNNU0RJRCBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9TTVNESUQs
Cj4gKyAgICAgICAvKiogSGFydCBoYXMgU01NVFQgLSBTTU1QVCBleHRlbnNpb24gKi8KPiArICAg
ICAgIFNCSV9IQVJUX0VYVF9TTU1QVCwKPgo+IC0gICAgICAgLyoqIE1heGltdW0gaW5kZXggb2Yg
SGFydCBleHRlbnNpb24gKi8KPiAgICAgICAgIFNCSV9IQVJUX0VYVF9NQVgsCj4gIH07Cj4KPiBk
aWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5k
ZXggYmVlODg1NTcuLjQyNjFmZWE4IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+
ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC0zNjAsNiArMzYwLDggQEAgY29uc3Qgc3Ry
dWN0IHNiaV9oYXJ0X2V4dF9kYXRhIHNiaV9oYXJ0X2V4dFtdID0gewo+ICAgICAgICAgX19TQklf
SEFSVF9FWFRfREFUQSh2LCBTQklfSEFSVF9FWFRfViksCj4gICAgICAgICBfX1NCSV9IQVJUX0VY
VF9EQVRBKGYsIFNCSV9IQVJUX0VYVF9GKSwKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEo
ZCwgU0JJX0hBUlRfRVhUX0QpLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbXNkaWQs
IFNCSV9IQVJUX0VYVF9TTVNESUQpLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbW1w
dCwgIFNCSV9IQVJUX0VYVF9TTU1QVCksCj4gIH07Cj4KPiAgX1N0YXRpY19hc3NlcnQoU0JJX0hB
UlRfRVhUX01BWCA9PSBhcnJheV9zaXplKHNiaV9oYXJ0X2V4dCksCj4gLS0KPiAyLjUxLjAKClJl
dmlld2VkLWJ5OiBwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20KPgo+Cj4gLS0KPiBvcGVu
c2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
