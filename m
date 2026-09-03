Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8159C61DD3
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 21:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2u6cC65tzhws7K80s9Ympk9TxAYMYRudifCZ+MAekk=; b=q/lQW5IOF8P3qZ
	ezBDY21uJIWbC9uoGTnXtnqFmGmNigJbhStsF7RzuWqVUFlH7F36MW6/8MKFOCED2wYDy3MmZ/+TA
	5qMXS1e7gBxB3us45GjpGLUGEAFbgvYKNrStf8Y2salbKwTERqV47LWMyA+87cPh7r0zFxs5nadqv
	b7VI428v1948qqXYAVm5ksvU7OHswkI/UfFsBCWIMqirHJXkbDUyYH98QYZeQdvLemfGyhA6ITYtr
	mO5MvCgfjhW8oOdnmzswqNW0FgVCAXZ8dUgu44l6p3QSHts7tnfghO+Jv79+ETxAzu0Kp0fhmOzlM
	0yaBERKY6sWfqqarHiGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EmS-00000000cWm-3CqL;
	Thu, 03 Sep 2026 21:15:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2EmQ-00000000cWO-0wPb
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 21:15:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683JgRt12183938
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 21:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lHxc2mgabG9JLK43QVTzzxOx1FSeBnK5w4u4F/ItouY=; b=ebSfyP4/NnIY9q16
	jWTbMXkMuTjskOROWMK4p2xlKlcOSxMjTGDeJ4o0Wk+qIuhlu99zsF9P3I1ZexBH
	dUH8ohsYosapRO+MyMGdfgTBi4oLr+kdx/+FroExXE3Al2hxbSTk60Oqz2fHCVa4
	3dQjsDDXtcg7wdPHgUGgTH8fZsdKvsiJfGKwAvYnhcjIib2+7JLu1xZNOHoRGKZJ
	+hCDWrsSgrRJ8eESVUdALIZwUr7NS0nT4JH/WWTOp0s9oEmpgI0lWu2/+AdAX2eb
	gb/5ENOR5vBNfN5UvTwmKkdssmOi3Rai5wO9E+l74wzJNFpqyaJg8GX4KOie96Qy
	ewS/8A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfbyvhgp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 21:15:29 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1a220dfc7so134393eaf.3
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 14:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788470128; cv=none;
        d=google.com; s=arc-20260327;
        b=HiqQ4pOUxx9vCTpab4VUcYqjE3suQSaM/DqB5C4DmZEEM8bXYXMflqDCpfKZ0l5v3v
         KbJ1Ni4YBrKQoyhDsW+Z6dnDdD2hXvfQiiju4wxo747HpKPmKnO8PBm9z6ZsKmgJ6zbu
         458ka3hmBn6at20DqypkoV/FWApRBxuALVHPx+maEFFCJU9Tc6oD6BnniXt2wBoSmiaX
         AhUN/VGJ7UAetCSlYl2Dn4DyLTYtC+KLmxyLv2p46HVEKtV4zkJEDZCm5gCXz0V0LxHl
         kC/A0eWGzy+UrALUitczmj1AGQDPGwkAL8oWLIWdqcx80woPz1PA1AJX0mzXhfAS7d6d
         qZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lHxc2mgabG9JLK43QVTzzxOx1FSeBnK5w4u4F/ItouY=;
        fh=4ewBQFYQm5N+QAVC2yDkcGgJqnoV8H9Ixi/6ZlMkFAE=;
        b=i5nm/cgXxq4ai0+Vag51kGhBulfLkEpEiQKdUPa78oYoG3D74zArg45myDT+jxBvwI
         QbJv/bWYevYwrNKqomOPkojsgxGb7xorAWc50BJQbXBO/CMn+afijldYdhcr/mXMFJN/
         AQT4HWv5nI0TI46ocs4vd5VKAaVaM7f/l6n6T7BLLxVYHefful0MWhCgAs5e0Oe7qqDN
         tvh2KW0+fg051mgcFdWQl0JE9UCtKN6I/heighPI1moVb/mhipJsKUdsi7MA8isBRlQ8
         79ghDMRxyLNrACWZhnxy11RC231N8KqTLcb3nsCNAx7thN13tYDj7M1SvByt61h3Or3E
         71dg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788470128; x=1789074928; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lHxc2mgabG9JLK43QVTzzxOx1FSeBnK5w4u4F/ItouY=;
        b=KFaiL4zaR+XNXCeIt11oK1OMKj1u8q+ptQp5234ocWXZT6lWrGRwI4WEY6D8ZN6639
         X+FxjxQzr+ZTl6y9BLozWXjGLKbT5RTESYJEHLFb3T0KjN+VPDoWTrC1TaBzx0p4f5Ht
         v1dhKjrXUgGTWQlbPI5tj4p3fQ0Yi2SWttWL5a952FYqjz7zhBkRr9q2JRZ7PkSBGJkq
         0UtUKB+SG0wUAb7onxZwHvtRk8j6fY6FCmWQ+cpoaUO7xx3ZELKFmO5c7v+uGdeP4ZGM
         1xFPov+V8Ix8w85ROK5T72nOw5KG7gcx6JkZSjjzBYwAxSW99R3YlZ5YB+hgG3RaqSpO
         5HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470128; x=1789074928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHxc2mgabG9JLK43QVTzzxOx1FSeBnK5w4u4F/ItouY=;
        b=IN5Rmm7vjYbd4RESQz3aFpraCml/RUxSy+mszFTMM1dSzcxHxPyek7c4IPc14iknVx
         m8ffHgmcDXyfxelIwXQbulchHH5VR1tpLxWLE7cQC4x1YxnaQNii+WWto3X1Hmbv3IT4
         RtFfkDxBhLLMvDt+40wjCEgnVGKKCD96vOAwB3cXQnsEmHIzOQuVB06LmjmumumDMQ1E
         TJONOaDmEC++fO1StnZFyqiFKcgvE3E+xkeeN+T4lDcGB5/2OM9aL+TyrrwY0k6WiwU9
         JCqkr69pl5WKe0JOOz49DvxjSgtdOnVaebjFxufiMR0UTMMvxC8wuK7AdBHt1FMGcNnP
         SkpA==
X-Gm-Message-State: AFuF++mpaJ6aXnTZrpL35df0JYaoz6K6XqE9UMW7k2leAA3bptD6WcPa
	d2x85tLy/WymC2/qc2ltA76MuSVVr5hgy+wtnGfTkcCqXkgaiz3JFEB+fNyIDS/1vNzMOlnY8OQ
	PYYHtxeni1BGSmJJprrqofvla9lYHw6xbcoidnCklO7rzm0a9Z2Y6xtWSRJm8GvF3xaC7ZRU76l
	RhtoDN8qhDJ4JOocH/dCicf4jPiQthzfQwoAFhDqWZLxmAhTJ9CnM=
X-Gm-Gg: AYBFou3Oxg/YpmErVbiL5EJTywhLlnpVi/1g4RAm5XspxDW5lOtQOKCaeJBYgS9IYHj
	cywir/oRD6FqxDzC5WA9GUhalRqy5ARyuvQRvMnFq3eNCDrG6lRz4rZWgfZgJpL6MLK4Cr/2bzf
	kc0hd8DZNopZ2cqCrj07su87MQSRRvyuT2yAINx8LwGn7VEKetPDLaTf6vYA==
X-Received: by 2002:a05:6820:1501:b0:6b1:31f:b0c5 with SMTP id 006d021491bc7-6b6fd3c8278mr1157463eaf.26.1788470128221;
        Thu, 03 Sep 2026 14:15:28 -0700 (PDT)
X-Received: by 2002:a05:6820:1501:b0:6b1:31f:b0c5 with SMTP id
 006d021491bc7-6b6fd3c8278mr1157436eaf.26.1788470127787; Thu, 03 Sep 2026
 14:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com> <20260817090503.2104998-3-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-3-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:15:16 -0700
X-Gm-Features: AcwNN1UexaAgMkJ2B0ee0wzj6l89GKoj7RZ6aRKtg2EEN-nqgTBfbE6wau3bccU
Message-ID: <CAAVgOk+t1aF6AQHSRkseKEBNc_UGhvjxPJ5KwbSQPJwdD-Cnrw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] lib: utils: fdt_helper: parse RISC-V Worlds
 per-hart WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com, krzk@kernel.org
X-Proofpoint-ORIG-GUID: LWWTVPANnKlrlRwp2Ez3xhQ_q1_u31Bg
X-Proofpoint-GUID: LWWTVPANnKlrlRwp2Ez3xhQ_q1_u31Bg
X-Authority-Analysis: v=2.4 cv=C8vZDwP+ c=1 sm=1 tr=0 ts=6a99e371 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pFyQfRViAAAA:8 a=enVdmfMJxx45wN3EQCAA:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE4NSBTYWx0ZWRfX/sARIKmPsaoV
 zHyYL65scLLYKh2QHphNiOh87OFvYNYc+V4seGpClV0FWZwPECKNEGuwsjDiNonzPiEKIDzHQ28
 tV26Y5kjFGrJ0l6U7SP2bLpWzzgScrh+aSX812jOJeVXCjgqIHQMs9lZw5+Vk24U7vnB5AfrSia
 b2a+bKSX7TWfgzjXTmE6DPa2o/A6E1HtiJbERVyt6Rz7mLonVVp2SBEAhEhZj9lM75Y1NY+U3KZ
 Y8/8Am0/wm25GxOMwLhHbWt8ZcnMlc3RkePlTqUW4aD1+Si+j2do/Q/YNa67Wt8kIGJqbsbpNZY
 KZ/0j8egHDaeq1sBNibkTqNQYYFRdCt2IqYVtGMURspUHJJZlprfxpHRsmyfqOVB0xwiYeqo0d6
 vtMt8P6YUcVCKZPNO6TaE7j34bD+ouAmr0/gAtN8m51VIQa2Go3zEUY6y/QizKP9/Ck7LvmqZYH
 n4QQzyLu7zQLaGeOvIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE4NSBTYWx0ZWRfX6Q6YB/Uwo1pz
 avcmJkWXl2DqNEoJFd4sARIcAExJn/1PmAbXApqUeexGMaA07wQTPyFgg0LXVFVWAE1Zx/SPMSs
 iWN+stn8yWv6AcWlG080bXO8jhESNzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_141530_283984_61748B82 
X-CRM114-Status: GOOD (  27.36  )
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMjowNeKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIGZkdF9wYXJzZV93b3JsZHNfYWxsX2hh
cnRzKCkgdG8gcGFyc2UgcGxhdGZvcm0tZGVmaW5lZCBEVAo+IHByb3BlcnRpZXMgaW4gdGhlIC9j
cHVzL2NwdUBYOgo+IC0gcmlzY3YscG13aWQ6IE0tbW9kZSBXb3JsZCBJRAo+IC0gcmlzY3YscG13
aWRsaXN0OiBiaXRtYXAgb2YgcGVybWl0dGVkIE0tbW9kZSBXSURzCj4gLSByaXNjdixwbWx3aWRs
aXN0OiBiaXRtYXAgb2YgcGVybWl0dGVkIGxvd2VyLXByaXZpbGVnZSBXSURzCj4gSW5pdGlhbGl6
ZSBwYXJzZWQgdmFsdWVzIGluIHNiaV9oYXJ0X2ZlYXR1cmVzIHdpdGggaGFzXyogcHJlc2VuY2UK
PiBmbGFncy4KPgo+IFRoZXNlIHBsYXRmb3JtLWRlZmluZWQgdmFsdWVzIHNlcnZlIGFzIHRoZSBy
b290LW9mLXRydXN0IGNvbnN0cmFpbnRzCj4gZm9yIHBlci1kb21haW4gV0lEIGFzc2lnbm1lbnQg
ZHVyaW5nIGRvbWFpbiBjcmVhdGlvbiBhbmQgY29udGV4dAo+IHN3aXRjaGluZy4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+Cj4gLS0t
Cj4gIGluY2x1ZGUvc2JpL3NiaV9oYXJ0LmggICAgICAgICAgICAgfCAgNiArKwo+ICBpbmNsdWRl
L3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oIHwgIDIgKwo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9o
ZWxwZXIuYyAgICAgICAgIHwgOTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHBs
YXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyAgICAgICAgfCAxMyArKysrLQo+ICA0IGZpbGVzIGNo
YW5nZWQsIDExMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBpbmRleCAy
OTQxODA5ZS4uNGZjZjUzNzIgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+
ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBAQCAtMTM1LDYgKzEzNSwxMiBAQCBzdHJ1
Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgewo+ICAgICAgICAgdW5zaWduZWQgaW50IHBtcF9sb2cyZ3Jh
bjsKPiAgICAgICAgIHVuc2lnbmVkIGludCBtaHBtX21hc2s7Cj4gICAgICAgICB1bnNpZ25lZCBp
bnQgbWhwbV9iaXRzOwo+ICsgICAgICAgdTMyIHBtd2lkOwo+ICsgICAgICAgdTY0IHBtd2lkbGlz
dDsKPiArICAgICAgIHU2NCBwbWx3aWRsaXN0Owo+ICsgICAgICAgYm9vbCBoYXNfcG13aWQ7Cj4g
KyAgICAgICBib29sIGhhc19wbXdpZGxpc3Q7Cj4gKyAgICAgICBib29sIGhhc19wbWx3aWRsaXN0
OwoKT3phOiBkbyB5b3UgbmVlZCB0aGVzZSAzIGJvb2xlYW5zID8KCnlvdSBjYW4gZmluZCBvdXQg
ZnJvbSB0aGUgdmFsdWUgaXRzbGVmID8KcG13aWRsaXN0ID09IDAgbWVhbnMgbm90IHJwZXNlbnQK
cG1sd2lkbGlzdCA9IDAgbWVhbnMgbm90IHJwZXNlbnQKYW5kIG1heSBiZSBwbXdpZCA9PSBVSU5U
X01BWCB0aGVuIG5vdCBwcmVzZW50ID8KCj4gIH07Cj4KPiAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcg
aGFydF9mZWF0dXJlc19vZmZzZXQ7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpX3V0aWxzL2Zk
dC9mZHRfaGVscGVyLmggYi9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oCj4gaW5k
ZXggNzVhNTY0ZDEuLjNmM2QwOTFiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpX3V0aWxzL2Zk
dC9mZHRfaGVscGVyLmgKPiArKysgYi9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5o
Cj4gQEAgLTU2LDYgKzU2LDggQEAgaW50IGZkdF9wYXJzZV90aW1lYmFzZV9mcmVxdWVuY3koY29u
c3Qgdm9pZCAqZmR0LCB1bnNpZ25lZCBsb25nICpmcmVxKTsKPgo+ICBpbnQgZmR0X3BhcnNlX2lz
YV9leHRlbnNpb25zX2FsbF9oYXJ0cyhjb25zdCB2b2lkICpmZHQpOwo+Cj4gK2ludCBmZHRfcGFy
c2Vfd29ybGRzX2FsbF9oYXJ0cyhjb25zdCB2b2lkICpmZHQpOwo+ICsKPiAgaW50IGZkdF9wYXJz
ZV9nYWlzbGVyX3VhcnRfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2Zmc2V0LAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBsYXRmb3JtX3VhcnRfZGF0YSAq
dWFydCk7Cj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgYi9saWIv
dXRpbHMvZmR0L2ZkdF9oZWxwZXIuYwo+IGluZGV4IDc0N2JhMDI4Li5kNjAyNTcwNSAxMDA2NDQK
PiAtLS0gYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYwo+ICsrKyBiL2xpYi91dGlscy9mZHQv
ZmR0X2hlbHBlci5jCj4gQEAgLTQ1Nyw2ICs0NTcsOTggQEAgaW50IGZkdF9wYXJzZV9pc2FfZXh0
ZW5zaW9uc19hbGxfaGFydHMoY29uc3Qgdm9pZCAqZmR0KQo+ICAgICAgICAgcmV0dXJuIDA7Cj4g
IH0KPgo+ICtpbnQgZmR0X3BhcnNlX3dvcmxkc19hbGxfaGFydHMoY29uc3Qgdm9pZCAqZmR0KQo+
ICt7Cj4gKyAgICAgICB1MzIgaGFydGlkOwo+ICsgICAgICAgY29uc3QgZmR0MzJfdCAqdmFsOwo+
ICsgICAgICAgc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoOwo+ICsgICAgICAgc3RydWN0IHNi
aV9oYXJ0X2ZlYXR1cmVzICpoZmVhdHVyZXM7Cj4gKyAgICAgICBpbnQgZXJyLCBjcHVfb2Zmc2V0
LCBjcHVzX29mZnNldCwgbGVuOwo+ICsKPiArICAgICAgIGlmICghZmR0KQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArCj4gKyAgICAgICBjcHVzX29mZnNldCA9IGZkdF9w
YXRoX29mZnNldChmZHQsICIvY3B1cyIpOwo+ICsgICAgICAgaWYgKGNwdXNfb2Zmc2V0IDwgMCkK
PiArICAgICAgICAgICAgICAgcmV0dXJuIGNwdXNfb2Zmc2V0Owo+ICsKPiArICAgICAgIGZkdF9m
b3JfZWFjaF9zdWJub2RlKGNwdV9vZmZzZXQsIGZkdCwgY3B1c19vZmZzZXQpIHsKPiArICAgICAg
ICAgICAgICAgZXJyID0gZmR0X3BhcnNlX2hhcnRfaWQoZmR0LCBjcHVfb2Zmc2V0LCAmaGFydGlk
KTsKPiArICAgICAgICAgICAgICAgaWYgKGVycikKPiArICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPiArCj4gKyAgICAgICAgICAgICAgIGlmICghZmR0X25vZGVfaXNfZW5hYmxlZChm
ZHQsIGNwdV9vZmZzZXQpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsK
PiArICAgICAgICAgICAgICAgc2NyYXRjaCA9IHNiaV9oYXJ0aWRfdG9fc2NyYXRjaChoYXJ0aWQp
Owo+ICsgICAgICAgICAgICAgICBpZiAoIXNjcmF0Y2gpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIFNCSV9FTk9FTlQ7Cj4gKwo+ICsgICAgICAgICAgICAgICBoZmVhdHVyZXMgPSBz
YmlfaGFydF9mZWF0dXJlc19wdHIoc2NyYXRjaCk7Cj4gKyAgICAgICAgICAgICAgIGlmICghaGZl
YXR1cmVzKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5PRU5UOwo+ICsK
PiArICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBjcHVfb2Zmc2V0LCAicmlz
Y3YscG13aWQiLCAmbGVuKTsKPiArICAgICAgICAgICAgICAgaWYgKHZhbCAmJiBsZW4gPT0gc2l6
ZW9mKGZkdDMyX3QpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaGZlYXR1cmVzLT5wbXdp
ZCA9IGZkdDMyX3RvX2NwdSgqdmFsKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVhdHVy
ZXMtPmhhc19wbXdpZCA9IHRydWU7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAg
ICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgY3B1X29mZnNldCwgInJpc2N2LHBtd2lkbGlz
dCIsICZsZW4pOwo+ICsgICAgICAgICAgICAgICBpZiAodmFsICYmIGxlbiA9PSAyICogc2l6ZW9m
KGZkdDMyX3QpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaGZlYXR1cmVzLT5wbXdpZGxp
c3QgPSAoKHU2NClmZHQzMl90b19jcHUodmFsWzBdKSA8PCAzMikgfAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZkdDMyX3RvX2NwdSh2YWxbMV0pOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGhmZWF0dXJlcy0+aGFzX3Btd2lkbGlzdCA9IHRydWU7
Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIHZhbCA9IGZkdF9nZXRw
cm9wKGZkdCwgY3B1X29mZnNldCwgInJpc2N2LHBtbHdpZGxpc3QiLCAmbGVuKTsKPiArICAgICAg
ICAgICAgICAgaWYgKHZhbCAmJiBsZW4gPT0gMiAqIHNpemVvZihmZHQzMl90KSkgewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGhmZWF0dXJlcy0+cG1sd2lkbGlzdCA9ICgodTY0KWZkdDMyX3Rv
X2NwdSh2YWxbMF0pIDw8IDMyKSB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGZkdDMyX3RvX2NwdSh2YWxbMV0pOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGhmZWF0dXJlcy0+aGFzX3BtbHdpZGxpc3QgPSB0cnVlOwo+ICsgICAgICAgICAgICAg
ICB9Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiBTYW5pdHkgY2hlY2tzICovCj4gKyAgICAgICAg
ICAgICAgIGlmIChoZmVhdHVyZXMtPmhhc19wbXdpZGxpc3QgJiYgIWhmZWF0dXJlcy0+cG13aWRs
aXN0KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGhhcnQldSBy
aXNjdixwbXdpZGxpc3QgaXMgZW1wdHlcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBfX2Z1bmNfXywgaGFydGlkKTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gU0JJX0VJTlZBTDsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArI2lmIF9fcmlzY3ZfeGxl
biA9PSAzMgo+ICsgICAgICAgICAgICAgICBpZiAoaGZlYXR1cmVzLT5oYXNfcG13aWRsaXN0ICYm
Cj4gKyAgICAgICAgICAgICAgICAgICAoaGZlYXR1cmVzLT5wbXdpZGxpc3QgPj4gMzIpKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGhhcnQldSByaXNjdixwbXdp
ZGxpc3QgaGFzIGJpdHMgYmV5b25kIFhMRU5cbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlkKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAg
ICAgaWYgKGhmZWF0dXJlcy0+aGFzX3BtbHdpZGxpc3QgJiYKPiArICAgICAgICAgICAgICAgICAg
IChoZmVhdHVyZXMtPnBtbHdpZGxpc3QgPj4gMzIpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgc2JpX3ByaW50ZigiJXM6IGhhcnQldSByaXNjdixwbWx3aWRsaXN0IGhhcyBiaXRzIGJleW9u
ZCBYTEVOXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18s
IGhhcnRpZCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4g
KyAgICAgICAgICAgICAgIH0KPiArI2VuZGlmCj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoaGZl
YXR1cmVzLT5oYXNfcG13aWQgJiYKPiArICAgICAgICAgICAgICAgICAgIGhmZWF0dXJlcy0+cG13
aWQgPj0gX19yaXNjdl94bGVuKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpX3ByaW50
ZigiJXM6IGhhcnQldSByaXNjdixwbXdpZCAoJXUpIGV4Y2VlZHMgbWF4IFdJRFxuIiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBoYXJ0aWQsIGhmZWF0dXJl
cy0+cG13aWQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+
ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoaGZlYXR1cmVzLT5o
YXNfcG13aWRsaXN0ICYmIGhmZWF0dXJlcy0+aGFzX3Btd2lkICYmCj4gKyAgICAgICAgICAgICAg
ICAgICAhKGhmZWF0dXJlcy0+cG13aWRsaXN0ICYgQklUX1VMTChoZmVhdHVyZXMtPnBtd2lkKSkp
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCV1IHJpc2N2
LHBtd2lkICgldSkgbm90IGluIHBtd2lkbGlzdFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF9fZnVuY19fLCBoYXJ0aWQsIGhmZWF0dXJlcy0+cG13aWQpOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsgICAgICAgICAgICAgICB9
Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRpYyBp
bnQgZmR0X3BhcnNlX3VhcnRfbm9kZV9jb21tb24oY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9m
ZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwbGF0
Zm9ybV91YXJ0X2RhdGEgKnVhcnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGRlZmF1bHRfZnJlcSwKPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0v
Z2VuZXJpYy9wbGF0Zm9ybS5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gaW5kZXgg
MWRmMDI4MGQuLjUxZTlmMzQyIDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZv
cm0uYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+IEBAIC0yNTUsMTEgKzI1
NSwyMiBAQCBpbnQgZ2VuZXJpY19maW5hbF9pbml0KGJvb2wgY29sZF9ib290KQo+Cj4gIGludCBn
ZW5lcmljX2V4dGVuc2lvbnNfaW5pdChib29sIGNvbGRfYm9vdCkKPiAgewo+ICsgICAgICAgaW50
IHJjOwo+ICsKPiAgICAgICAgIGlmICghY29sZF9ib290KQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gMDsKPgo+ICAgICAgICAgLyogUGFyc2UgdGhlIElTQSBzdHJpbmcgZnJvbSBGRFQgYW5kIGVu
YWJsZSB0aGUgbGlzdGVkIGV4dGVuc2lvbnMgKi8KPiAtICAgICAgIHJldHVybiBmZHRfcGFyc2Vf
aXNhX2V4dGVuc2lvbnNfYWxsX2hhcnRzKGZkdF9nZXRfYWRkcmVzcygpKTsKPiArICAgICAgIHJj
ID0gZmR0X3BhcnNlX2lzYV9leHRlbnNpb25zX2FsbF9oYXJ0cyhmZHRfZ2V0X2FkZHJlc3MoKSk7
Cj4gKyAgICAgICBpZiAocmMpCj4gKyAgICAgICAgICAgICAgIHJldHVybiByYzsKPiArCj4gKyAg
ICAgICAvKiBQYXJzZSBSSVNDLVYgV29ybGRzIENQVSBwcm9wZXJ0aWVzIGZyb20gRkRUICovCj4g
KyAgICAgICByYyA9IGZkdF9wYXJzZV93b3JsZHNfYWxsX2hhcnRzKGZkdF9nZXRfYWRkcmVzcygp
KTsKPiArICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICsKPiAr
ICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAgaW50IGdlbmVyaWNfZG9tYWluc19pbml0KHZvaWQp
Cj4gLS0KPiAyLjQzLjcKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
