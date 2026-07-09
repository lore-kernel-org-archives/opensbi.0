Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F25DC43458
	for <opensbi@archiver.kernel.org>; Thu,  9 Jul 2026 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlichO7LTZYqANWOipAndgUuo15pwLlFNCLvMInOja0=; b=H7en0GUoo0/723
	GObK8jWvI4FsyMtQsuJZ7udN60t5sJGXiEF5znTmK44FRS81Bwy7Dg9Ll2Klo+dkMtPthFkULlnlv
	dtzZvVuXlsOJ+Q8StkgGju6FbPtnRPUn+s8vspR1kly+WEXVjeOC9WnlBi2CWIUPsGp2alESztKR3
	bg+R/vUNrA3pfni4r8iP/KIt/4U2KlgCYJBcgNQAWyOsazJUqaDxt3JcCcPQ752V9A2mHIV1A6+fN
	SFqLrjeO7EawXP7/zbFmwK8Hgv9QvSxnHVoIVqTODfHRsFovskT9K4DtMt9B+s53D5wtaChx17Faf
	Wfg/Qb75u6D/iD1z22bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkH1-00000001RfL-2cFG;
	Thu, 09 Jul 2026 08:38:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkGz-00000001Rf0-19VJ
	for opensbi@lists.infradead.org;
	Thu, 09 Jul 2026 08:38:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669602a9929553
	for <opensbi@lists.infradead.org>; Thu, 9 Jul 2026 08:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3C607HAlqkKpaajK36I4ZjbDTU1RZRTJucVWU4T5nP0=; b=V1FzM1JHZMPscXoQ
	lHvpU/nkZTswdrZo4vKiGS8mhAnrLjjGZM72lgJ3vk73FbGzzw89BJJs5ucV2zEZ
	SYHUj92y4onEYYdzHsd3tZf+KVK1kT4ksuhUeeAwruo4nq4XC8OhFs0OpKSgcaOh
	KV0SQvYcJhoxMuhcVrEDAMsRZm97UBOmjEhn5D7eb86Sbkg/60LwBANmFQu0Fyfe
	dUpE1Hp5x9lKb3q95UrSBoO4BwuLzLSK4MZUygPE4QvhITnQXJ+g45LNFHySWgC3
	BWR813dQzzEDU4aSol900pB8HAQHEgM8qrvyP9jMHcMv9v1CGE21UD4yivn+G2F0
	0WInrw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418h2pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 09 Jul 2026 08:38:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so2040293a12.3
        for <opensbi@lists.infradead.org>; Thu, 09 Jul 2026 01:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783586300; cv=none;
        d=google.com; s=arc-20260327;
        b=AC+e28eIMVHLZkrKAplOh3m3mbndzWj4ondwTSQcQJr4zr39iDHffRjscmFTv+8Xu6
         WNQzm9BdmheZk3vmqnD9vKHRjPWIs34PuJImpwC2w4G9LrsOTkOmjQ/DCmvPSPUHISGj
         ThNosOywm1qyVnwUYt6btc/DBg0f45YPEabFVWysZMMgVELcIoOeIO1SqFFnEXfZBUv9
         E2N07kvB+n2EAtCVe4izMsScJ0MPLvX7l/T7D0Aw4nEb537uDqdMYeAGhn4BBpAc7PBN
         snBwc2JaRqDJmoYBvQR6uT1Too60yq5A1L05K4uHkJXa0oqF5fQr2cLe4xWeGZlhHRrA
         q+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3C607HAlqkKpaajK36I4ZjbDTU1RZRTJucVWU4T5nP0=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=oC5bvjGV337etHuz4etz8GqiF0awA4rK64Nzhmc104U0PxfD45nMQhD7v6o/xj1Afl
         nQH9sBQ18JTSivgSiteVyLr68YuYiHc/0RnPwhFzyVwYtzytQeRzybH40PvSlSK7bg2Y
         /hOgTb80qTzj+ayyt9v1mZ69KcLcrTy/N8UqEB1Xv0NKcCytRcLKCixo0hc6aIrYfS/Y
         9hK9O2qU495o+57kCbjPfxAsMCRkMNQ00fPZv/m/anKh5T4jcl/8jNW4Uhwei+yJi6h1
         0Ji3sYYYXF20pMNe4fxUINd3pezyMbMfWdqI7h9oJaoo8r1Kr1D3HbV9qF3oeR+v5M3T
         YgNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783586300; x=1784191100; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3C607HAlqkKpaajK36I4ZjbDTU1RZRTJucVWU4T5nP0=;
        b=fplOicT8K4P9PNdPfEZU8pkZnQINGNBGMgZv+BoI6rO+VoeMjSn69rgkLn9001NFy0
         QdYsqfCQJ4ydYCm7bbWjlAXCcQpRz88rv4lNLIq5cswwBQEVHG2XZw9kO7mZndqiOYOJ
         B9A74gMaROl8nlhYUUc6NfVS4LRnDEbNIDdOatyxhrzb99b+Xx3IhnawcTm3/43zZx1U
         BpdsuJ4YXj1kUruUOBAktIdUHFvxPNM8V0SnBpUr8pNzGkNmbDQxaz5jv3Fe88RKTjfA
         KpHstf2ZcpW5wGBSBNDUd1Wzlx1jQQFPEVt4hF3LcqFg8YgvSvIBMoV7+HznwOCIHDzo
         AD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586300; x=1784191100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3C607HAlqkKpaajK36I4ZjbDTU1RZRTJucVWU4T5nP0=;
        b=DOaGN/Dt3YzsET9+DzxhE1ZE+wy3m+85gS3jdRdHgE9B1VD6CCDbhE3smw3VaBpp5x
         kOG7qvmRV/2loY/eP1OKI7zQQMjpf9dzgCglsXKefsq0OQZJkuW2fDkrJMJAFERntJkt
         Bd3jRtLfi5XctiHgtrsofUQU7gk8yVrtpvjRBNZRbXZUgyROmShFqAltcmgF3v8465m7
         ANbHWq4o5o5BUJWVfmRfDmfskDkRn9fK6kR853/2LJf7gjnR0frQ+AnHP9UJWcn5R7I1
         oGcriFwM8+HbATWrJytoRWRUUwTm3O9C6w+n077m0IrLVdAFPIEO6fqYCV9T9Vy/pPpk
         ubEw==
X-Gm-Message-State: AOJu0Yx6LGdaii5fK/mATsX4ECTZ+eRmk9UzL+M9zLGVAgcBfryB+GQY
	jqnQYAOevRuqFD/R9kD3HykGOxdTk9UWZXCxtXd5xLIlqZrYd9T0RrG0gnZRRGkQUFHuryatZ/e
	kQDPSLJW1A0MtWcoDan/YwLRwfQjuxwbGFD+7jBg+XpH3IKCOgb0uW/bNquw5OgNGt2yMIBsRpn
	9Odho3fNTgAXyhkKcTbj7RAKw4tlfFc7n0U1k+xJxW
X-Gm-Gg: AfdE7cmtalB2ri3mQoa7ToeWsL9BXg1K2TmRaUoLDpKR27+zSJ0MTpAkvOBRDO3kbrY
	zx9yu7R8dl79BQcPku2FVCdi1IeMRVCxwHiD2dm9Bn1htjEl4QtPTzEJ4ViuMu/o68GojQ67ouo
	A2TGMEdoLo96cJPRwZuR7hMpZMJB1lKT59XnPxUNEyVP3dmkmfzDBvsloC8YM2ojjeqZLRxg==
X-Received: by 2002:a05:6a21:1f83:b0:3c0:9c19:65b0 with SMTP id adf61e73a8af0-3c0bd3ad019mr7244639637.72.1783586299974;
        Thu, 09 Jul 2026 01:38:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f83:b0:3c0:9c19:65b0 with SMTP id
 adf61e73a8af0-3c0bd3ad019mr7244613637.72.1783586299511; Thu, 09 Jul 2026
 01:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260617184047.70388-1-pawandeep.oza@oss.qualcomm.com> <20260617184047.70388-7-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260617184047.70388-7-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:08:08 +0530
X-Gm-Features: AUfX_mzzXPddF1j_XQt7He8jy9MyzpQ7DQzYVuMHgUmaGIvdAIF7wi6xxC8MsnY
Message-ID: <CABBgwmtT09jZnXoSnK0Kv+1-bZp2X9OAmfx0VtB0v5X+Py32BQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] lib: sbi_irqchip: fix MSI EIID gap and tail
 allocation logic in register_msi
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f5dfc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=nln6zk6g-nMBeO9wuAMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfXy27dN1GjNpa/
 cxNaWIMlDaJ8/F4BaspXaDXlh95rQfpabkq5grnIu5og4btAj9hda4J+BVDojIxeESR048+OBIL
 qSnqw9wjdH1MumpzHoxGztYTJ0cheoH1/psbeN2vZt8xlBRyuIgGNAKDRGqqV9yUbTKZatr2sMy
 okT4X0G9SD/RJdzkxCt/7Z4sB0roCN7Yilh1hOZeTBWgBimpBI2xhvBXRnd4WSCzSJfAHfN+Gi1
 9pa1xwx8bLsGMhkEABZj+JprBZU7NjxsmvlSOhMUVBvN8uUByPvwTgnT5vxNBfS5KqCOZYwhCqy
 XMH6PpTr3JJlrxamijj1iXcHEK7PKmHzQBr3g6+f/uTmwyxMCikDW2qmb3DHA/BCznx1Z5NpK2+
 6WeiT+cQRfLhROW75L1WkrpvdTK0/eiXvi9HqdyFS2fNX0z9KC8+cerCjO5ReSyQs644G5kUVon
 wZoX1txtfVNNeyNlXyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfX+WgdeHO33jcu
 jc/Qlw3/0XywTCIKAwBD+b1tEyRpTbWNFjFsljSrDDrhWHQ/jXq/MV4L8ERyhjgWSyDzYxQmmh5
 SWdjqoTQOTSkrsWhQPj0dTYCYzIreog=
X-Proofpoint-GUID: VWPkYVqQWV0xTywWOGyQG8I-mYSRLmtJ
X-Proofpoint-ORIG-GUID: VWPkYVqQWV0xTywWOGyQG8I-mYSRLmtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_013821_336667_6B0FB768 
X-CRM114-Status: GOOD (  21.49  )
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

T24gVGh1LCBKdW4gMTgsIDIwMjYgYXQgMTI6MTbigK9BTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRml4IHNiaV9pcnFjaGlwX3JlZ2lz
dGVyX21zaSgpIHRoYXQgcHJldmVudGVkIGNvbnRpZ3VvdXMgRUlJRCBhbGxvY2F0aW9uOgo+Cj4g
LSBHYXAgY2hlY2sgY29uZGl0aW9uIHdhcyBpbnZlcnRlZDogdGhlIG9yaWdpbmFsIGBoLT5maXJz
dF9od2lycSAtCj4gICBod2lycSA8IG51bV9od2lycWAgaW5jb3JyZWN0bHkgc2V0IGBmb3VuZCA9
IHRydWVgIHdoZW4gdGhlIGdhcCB3YXMKPiAgIHRvbyBzbWFsbCB0byBmaXQgbnVtX2h3aXJxIGVu
dHJpZXMuIENvcnJlY3QgdG8gYD49IG51bV9od2lycWAgc28KPiAgIGFsbG9jYXRpb24gb25seSBw
cm9jZWVkcyB3aGVuIHN1ZmZpY2llbnQgc3BhY2UgZXhpc3RzIGJldHdlZW4KPiAgIHJlZ2lzdGVy
ZWQgaGFuZGxlcnMuCj4KPiAtIFRhaWwtc3BhY2UgY2hlY2sgYCFmb3VuZCAmJiAhaHdpcnFgIG5l
dmVyIHRyaWdnZXJlZCBhZnRlciBpdGVyYXRpb24KPiAgIFJlcGxhY2Ugd2l0aCBgKGNoaXAtPm51
bV9od2lycSAtIGh3aXJxKSA+PSBudW1faHdpcnFgIHRvIGNvcnJlY3RseQo+ICAgYWxsb2NhdGUg
aWYgaGFuZGxlciBsaXN0IGlzIGVtcHR5Lgo+Cj4gRml4ZXM6IDc5ZTYzYmM4MzQ4ZCAoImlycWNo
aXA6IGFkZCBzYmlfaXJxY2hpcF9yZWdpc3Rlcl9tc2kgc3VwcG9ydCIpCj4KPiBTaWduZWQtb2Zm
LWJ5OiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+CgpMR1RN
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cgo+IC0tLQo+
ICBsaWIvc2JpL3NiaV9pcnFjaGlwLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9p
cnFjaGlwLmMgYi9saWIvc2JpL3NiaV9pcnFjaGlwLmMKPiBpbmRleCA0OWZhNDgwNi4uYTQ0ODA3
NTEgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaXJxY2hpcC5jCj4gKysrIGIvbGliL3NiaS9z
YmlfaXJxY2hpcC5jCj4gQEAgLTM1NCw3ICszNTQsNyBAQCBpbnQgc2JpX2lycWNoaXBfcmVnaXN0
ZXJfbXNpKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UgKmNoaXAsIHUzMiBudW1faHdpcnEsCj4g
ICAgICAgICAgICAgICAgIGlmIChoLT5maXJzdF9od2lycSA8PSBod2lycSAmJiBod2lycSA8ICho
LT5maXJzdF9od2lycSArIGgtPm51bV9od2lycSkpIHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBod2lycSA9IGgtPmZpcnN0X2h3aXJxICsgaC0+bnVtX2h3aXJxOwo+ICAgICAgICAgICAgICAg
ICB9IGVsc2UgaWYgKGh3aXJxIDwgaC0+Zmlyc3RfaHdpcnEpIHsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoaC0+Zmlyc3RfaHdpcnEgLSBod2lycSA8IG51bV9od2lycSkgewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGlmIChoLT5maXJzdF9od2lycSAtIGh3aXJxID49IG51bV9od2ly
cSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm91bmQgPSB0cnVlOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgfSBlbHNlIHsKPiBAQCAtMzYyLDcgKzM2Miw3IEBAIGludCBzYmlfaXJxY2hpcF9yZWdp
c3Rlcl9tc2koc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcCwgdTMyIG51bV9od2lycSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAg
IH0KPiAtICAgICAgIGlmICghZm91bmQgJiYgIWh3aXJxKQo+ICsgICAgICAgaWYgKCFmb3VuZCAm
JiAoY2hpcC0+bnVtX2h3aXJxIC0gaHdpcnEpID49IG51bV9od2lycSkKPiAgICAgICAgICAgICAg
ICAgZm91bmQgPSB0cnVlOwo+ICAgICAgICAgaWYgKCFmb3VuZCkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIFNCSV9FTk9TUEM7Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxp
bmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKVGhhbmtzLApBbnVwCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
