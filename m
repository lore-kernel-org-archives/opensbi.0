Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADFBC61DD3
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4bDQgEmDHPDp3GLHYCviA7qZOlX0xef5Xvxox7W3cg=; b=2MTc3zUGCj+v5w
	0GOqboQ+O7nhoz9XAZfzUOovJiUKK4yAYnxXo6ZIYgtCQPc90N2KLv2Xx8X3FTytWpDpmzy+q/2KK
	11z7GuzQ1IIOuABuLCExcM64dFU7e+oSY7vm1ZKbTF7YlavkiN1y4j328YKub2GXTJ/2ohA8ifIC/
	3trFfMeT6SJQbM0KgCGHWy9NLfw8znQc9y48rh9QpX/ahAu7T9QbAFz7t/URM2hOUM3GEmXTiLqG1
	/SjIQNzPGsHZb/EC06dyNs1pYWB6J51fE/5qYmajZlXc0MLYsxpkhyDsrDKp7ifuMWIPqOzh+ujCe
	TOGuJYtwZLwXUbcj/gLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Q3-0000000GtfM-1M1l;
	Thu, 03 Sep 2026 09:07:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Q1-0000000Gteo-0hvT
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 09:07:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683923Ts155420
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 09:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0Hvw/0mQTyBWV164LjAk9Vdw8G9licCRQjeXayYngQ=; b=At2um3yv1AZdJtIH
	bEIQiCgdudiVpXx7JCZoqMi+nI9EmChqp7fE1sg3JiNvAFL8m/nARhVEuIFybAiE
	/c/uuaGvGUmsfaTGL4QWJG/zZlx3+eRCSLyb/IM63RK9yIlUW1n0FRVP/TS1iiO9
	4Gp6CU3/Em0JWoC+MqE1+bhgCu2Zw0AiXnx4i17Jmn9/UHDiKNdWtUATvcCVJvBJ
	HvPwhd0+XavEo3B7yxWionzk83GPYrG6HZ95DI3wlvc/LkcLSCUEUZAvFnUduv8D
	5SNNi1JoXbmHzofaXdgQzLh1+snihJZc6gIWhUXiSPJx0r6Tq/icSWUIRJAgBCGb
	7v4fEw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgdes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 09:07:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so2876505a91.3
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 02:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426455; x=1789031255; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O0Hvw/0mQTyBWV164LjAk9Vdw8G9licCRQjeXayYngQ=;
        b=DMpIYBWt1vdBTmJLLzzy8sEjVvKNS4BucZUCtb1OqfBcUIbyk5bzZW5HkNF97qictW
         PX4FPbR0VkK/57TuPksQ2Cxla4/YimKwTRfkd42LZRfjhx+qSLPP3Y4NnRC/41ytvWSI
         ISwI8LvL3hG0iYt8u38LFSpQzvceZKG15QNtuyoh1AyQZmZsCBsR4TVf8js1ZfVSgqz3
         mtgj4KwiP4vRkymW9LHxF6vBq+prTdjTg49mxdkrscNTDHrhPAgVzBGIDnm+KUQYuZHa
         iBe8EKt85cQMfrOJISycJeTMQwOHhKOcjIBFNvbJPdmNhRnnVBCut3b5IkBq6znYi9Qm
         J8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426455; x=1789031255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O0Hvw/0mQTyBWV164LjAk9Vdw8G9licCRQjeXayYngQ=;
        b=MrsXbX9a3KRYsUM0mAQmJl8Ejs78m8AXK0g+dGp/LxfceSxMEDfShMQkTyqq/HJGvn
         hVDoOJ+Xy1/yhMFBGyvDUHnzjO1g5CeTuwkDFhwL3I53468/Ol3MvCokJe4Q6wokeqKN
         5qkqSRgWOvTDmHg6S+QOhu7nHY4icGDN2Kz0gJhGF6TG+8J5TCa/e/xovZ+By6W/Wljb
         B1DE2RDg1ogWzqjDnALDvYb/tNw4huBFZpebhnnbbKM8AuSZErtmZpSMrXo6Y3MI+79c
         UOeAa3KX1Q2s5AnDxdGl1Oy29YxKIoSssarS4GPQ6h5j6faGig6fi7A2tv4wOgj+T4O1
         NxeA==
X-Gm-Message-State: AFuF++l92SK/4AUR2PnmxqIq3Rsim1/kExBF1tm3kR2oNI/zLwn6S7B7
	uvJ3XADQ56H55wm2NbcsWBqo7/9SacdVMrP2TvgT7hYPultblDRrMejZR4bzCWIeEVqQyXIKhQz
	1K8305VX6MBxZUtjG89mvTKQh3to/rLA29ToxLTM/sL+L7Q7FVSRCJUPnDQJ7cqMJkQ==
X-Gm-Gg: AYBFou3MnsbwsGCFRCWPh17E+ckmOT/riNQihrtqmCrwpA0SxLThqPDZnT2sI1LBDBO
	FJMhPfi15b6iQeHryoUzjLDp47WOcBbBnA05rq4oB7smosKu4rQwgFdMG/NnHv1BMQxCW8zSKG+
	zIIir8nadv/BtR5HFJ9o1Me0qxjkbz+cz8lcouge8fumNogqGKkUfqF1jMGib9IdLJ55qr+TQ97
	wpywyLIUeR02kZ+G5kV5gpE0REtE9uAqEFlpPBWTeyp5wH2BsS8pHXe36Jbytinv8UUBVZwKuqK
	zhminPa7X0d4b9bCnj4DZW0EhKNL7l29OiU0jVf5znbAbVXoCubPJdQrT5Tqhrothdt36MfiIMy
	Qhgb8pkwVXIWHXcoDA85jnUjmxd8lAON/AWkeomNVIl1ynFhi89EXgUiXsIezqowozDF2VtrBd7
	axWzrMet+apLJoUHmE2rK/1VmU
X-Received: by 2002:a17:90b:1d4c:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39aedf0956bmr16470052a91.6.1788426454892;
        Thu, 03 Sep 2026 02:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4c:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39aedf0956bmr16469985a91.6.1788426454421;
        Thu, 03 Sep 2026 02:07:34 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994db8csm4275558c88.9.2026.09.03.02.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:07:34 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:37:29 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, Rahul Pathak <rahul@summations.net>
Subject: Re: [PATCH v2 5/6] lib: sbi_sse: fix shared memory double-fetch in
 sse_write_attrs
Message-ID: <apk40dEm_inOWZmk@hu-himchau-blr.qualcomm.com>
References: <20260731103405.1535818-1-liutong@iscas.ac.cn>
 <20260731103405.1535818-6-liutong@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260731103405.1535818-6-liutong@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: PdjTaC8tVZ9L5583AZpnvBCRqo4TdUje
X-Proofpoint-GUID: PdjTaC8tVZ9L5583AZpnvBCRqo4TdUje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfXyp6RPpHZMcbQ
 jrHEB0w9fbdLA8d+XYFXBlgXMjxuE8RFn96z6OOk+ywxlSGnhUNMBB2Kp5ZnQZylLYmtnCFHdjl
 S76+UB7y//qD0MHUmSnaQP4gkQymIwHGfqoxvMk27ZKgqN0rogZ+Ulp3IJHX7BY9Uhn1Xot4mTG
 CXKIoDDRypOAyrMoyLgc5Tc+AtGVUjN6F0EeggXBnyU2xCah9b8EkqV2CtXqnfpGjt0Q3qguojq
 7SIIuw0z5oNsp3g5rTCnTa62CH0ZT8QrVnzF4SVV6cs/k0be0OQ1B0SMMPvD5/Rc9b046lnYMul
 WTNBXe5chM7hAv+UmVpAGDDHGQCsfgIQuhC4Mk0wzv++nZUfdeT5K4lKMG/CnzTdA5U/IveaBhv
 ZdKyhmvalZzDwh8dttKx+tMm4mXpkpRK1Ykbtdy5VupNDjLoJ2qJOdTBR/a3mDjbLpMJ9MhVOhg
 3Ffnkw+rWh4q3oSFkNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX55KAlw42JaLR
 cDb/p7E/unpogb1jqYoTbgw8Igp2xVn0np2xlZrgxaCAY8Y3i0d1VWHVcGSuLW5WB0tifBrVUiC
 McEugtEzLVSw6kcCP7OigufKlATZvtk=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9938d7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=JfrnYn6hAAAA:8 a=O1jIsR52pQywj3l-79gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_020737_321260_C9CFA3DC 
X-CRM114-Status: GOOD (  23.07  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMTA6MzQ6MDRBTSArMDAwMCwgbGl1dG9uZyB3cm90ZToK
PiBzc2Vfd3JpdGVfYXR0cnMoKSByZWFkcyBhdHRyaWJ1dGUgdmFsdWVzIGZyb20gUy1tb2RlIHNo
YXJlZCBtZW1vcnkgaW4KPiB0d28gcGFzc2VzOiBmaXJzdCB0byB2YWxpZGF0ZSwgdGhlbiB0byBh
cHBseS4gU2luY2UgdGhlIHNoYXJlZCBtZW1vcnkKPiByZW1haW5zIHdyaXRhYmxlIGJ5IFMtbW9k
ZSBiZXR3ZWVuIHRoZSB0d28gcmVhZHMsIHRoZSB2YWx1ZXMgdXNlZCBmb3IKPiBhcHBsaWNhdGlv
biBtYXkgZGlmZmVyIGZyb20gd2hhdCB3YXMgdmFsaWRhdGVkLiBUaGlzIGFsbG93cyBTLW1vZGUg
dG8KPiBieXBhc3MgdmFsaWRhdGlvbiBieSBtb2RpZnlpbmcgc2hhcmVkIG1lbW9yeSBjb250ZW50
cyBiZXR3ZWVuIHRoZSB0d28KPiBwYXNzZXMsIHBvdGVudGlhbGx5IHNldHRpbmcgdW5hdXRob3Jp
emVkIFNTRSBldmVudCBhdHRyaWJ1dGVzIGluCj4gTS1tb2RlLgo+Cj4gRml4IHRoaXMgYnkgc25h
cHNob3R0aW5nIHRoZSBzaGFyZWQgbWVtb3J5IGRhdGEgaW50byBhIGxvY2FsIGJ1ZmZlcgo+IGFu
ZCBwZXJmb3JtaW5nIGJvdGggdmFsaWRhdGlvbiBhbmQgYXBwbGljYXRpb24gYWdhaW5zdCB0aGF0
IHNuYXBzaG90Lgo+Cj4gRml4ZXM6IGM4Y2RmMDFkOGYzYSAoImxpYjogc2JpOiBBZGQgc3VwcG9y
dCBmb3IgU3VwZXJ2aXNvciBTb2Z0d2FyZSBFdmVudHMgZXh0ZW5zaW9uIikKPiBTaWduZWQtb2Zm
LWJ5OiBsaXV0b25nIDxsaXV0b25nQGlzY2FzLmFjLmNuPgoKPiBAQCAtMTA2NCwyNSArMTA2NCwy
NyBAQCBzdGF0aWMgaW50IHNzZV93cml0ZV9hdHRycyhzdHJ1Y3Qgc2JpX3NzZV9ldmVudCAqZSwg
dWludDMyX3QgYmFzZV9hdHRyX2lkLAo+ICAJdW5zaWduZWQgbG9uZyBhdHRyID0gMCwgdmFsOwo+
ICAJdWludDMyX3QgaWQsIGVuZF9pZCA9IGJhc2VfYXR0cl9pZCArIGF0dHJfY291bnQ7Cj4gIAl1
bnNpZ25lZCBsb25nICphdHRycyA9ICh1bnNpZ25lZCBsb25nICopaW5wdXRfcGh5czsKPiArCXVu
c2lnbmVkIGxvbmcgbG9jYWxfYXR0cnNbU0JJX1NTRV9BVFRSX01BWF07Cj4KPiAgCXNiaV9oYXJ0
X3Byb3RlY3Rpb25fbWFwX3JhbmdlKGlucHV0X3BoeXMsIHNpemVvZih1bnNpZ25lZCBsb25nKSAq
IGF0dHJfY291bnQpOwo+Cj4gKwljb3B5X2F0dHJzKGxvY2FsX2F0dHJzLCBhdHRycywgYXR0cl9j
b3VudCk7Cj4gKwo+ICsJc2JpX2hhcnRfcHJvdGVjdGlvbl91bm1hcF9yYW5nZShpbnB1dF9waHlz
LCBzaXplb2YodW5zaWduZWQgbG9uZykgKiBhdHRyX2NvdW50KTsKPiArCj4gIAlmb3IgKGlkID0g
YmFzZV9hdHRyX2lkOyBpZCA8IGVuZF9pZDsgaWQrKykgewo+IC0JCXZhbCA9IGF0dHJzW2F0dHIr
K107Cj4gKwkJdmFsID0gbG9jYWxfYXR0cnNbYXR0cisrXTsKPiAgCQlyZXQgPSBzc2VfZXZlbnRf
c2V0X2F0dHJfY2hlY2soZSwgaWQsIHZhbCk7Cj4gIAkJaWYgKHJldCkKPiAtCQkJZ290byBvdXQ7
Cj4gKwkJCXJldHVybiByZXQ7Cj4gIAl9CgpPbmUgdGhpbmcgSSBkbyB3YW50IHJlc29sdmVkIGJl
Zm9yZSB0aGlzIGdvZXMgaW46IGF0dHJfY291bnQgaXMgb25seQpib3VuZGVkIGJ5IFNCSV9TU0Vf
QVRUUl9NQVggKDEwKSB2aWEgc2JpX3NzZV9hdHRyX2NoZWNrKCkgaW4gdGhlCmNhbGxlciwgc2Jp
X3NzZV93cml0ZV9hdHRycygpIOKAlCBzc2Vfd3JpdGVfYXR0cnMoKSBpdHNlbGYgaGFzIG5vCmlu
dGVybmFsIGNoZWNrLiBUaGF0J3MgZmluZSB0b2RheSBiZWNhdXNlIGl0J3MgYSBzdGF0aWMgZnVu
Y3Rpb24gd2l0aApleGFjdGx5IG9uZSBjYWxsIHNpdGUsIGFsd2F5cyByZWFjaGVkIGFmdGVyIHRo
YXQgY2hlY2sgcGFzc2VzLiBCdXQKdGhpcyBwYXRjaCBjaGFuZ2VzIHdoYXQgYW4gdW5ib3VuZGVk
IGF0dHJfY291bnQgd291bGQgZG8gaGVyZTogYmVmb3JlLAphdHRyc1thdHRyKytdIHdvdWxkIHdh
bGsgb2ZmIHRoZSBlbmQgb2YgdGhlICpzaGFyZWQtbWVtb3J5KiBtYXBwaW5nOwphZnRlciwgY29w
eV9hdHRycygpIHdyaXRlcyBhdHRyX2NvdW50IGxvbmdzIGludG8gYSBmaXhlZCAxMC1lbnRyeQoq
c3RhY2sqIGFycmF5LiBJZiB0aGF0IGNhbGxlci1zaWRlIGludmFyaWFudCBpcyBldmVyIHZpb2xh
dGVkIGJ5IGEKZnV0dXJlIGNhbGwgc2l0ZSBvciByZW9yZGVyaW5nLCB0aGlzIGlzIG5vdyBhIHN0
YWNrIGJ1ZmZlciBvdmVyZmxvdwppbnN0ZWFkIG9mIGFuIE9PQiByZWFkIG9mIG1hcHBlZCBtZW1v
cnkg4oCUIGEgbWF0ZXJpYWxseSB3b3JzZSBmYWlsdXJlCm1vZGUsIGludHJvZHVjZWQgYnkgYWRk
aW5nIGxvY2FsX2F0dHJzLgoKR2l2ZW4gdGhpcyB3aG9sZSBzZXJpZXMgaXMgYWJvdXQgbm90IHRy
dXN0aW5nIHZhbGlkYXRpb24gdGhhdCBoYXBwZW5lZApzb21ld2hlcmUgZWxzZSBhZ2FpbnN0IGRh
dGEgdGhhdCdzIHVzZWQgaGVyZSwgSSB0aGluayBzc2Vfd3JpdGVfYXR0cnMoKQpzaG91bGQgZGVm
ZW5kIGl0c2VsZiBkaXJlY3RseSByYXRoZXIgdGhhbiByZWx5aW5nIGVudGlyZWx5IG9uIHRoZQpj
YWxsZXI6CgoJaWYgKGF0dHJfY291bnQgPiBTQklfU1NFX0FUVFJfTUFYKQoJCXJldHVybiBTQklf
RVJSX0lOVkFMSURfUEFSQU07CgpyaWdodCBiZWZvcmUgdGhlIGNvcHlfYXR0cnMoKSBjYWxsIChv
ciBlcXVpdmFsZW50bHksIGNsYW1wL2Fzc2VydApiZWZvcmUgc2l6aW5nIHRoZSBjb3B5KS4gQ291
bGQgeW91IGFkZCB0aGF0IGluIHRoZSBuZXh0IHZlcnNpb24/Cgo+ICsJc2JpX2hhcnRfcHJvdGVj
dGlvbl91bm1hcF9yYW5nZShpbnB1dF9waHlzLCBzaXplb2YodW5zaWduZWQgbG9uZykgKiBhdHRy
X2NvdW50KTsKPiArCj4gIAlyZXR1cm4gcmV0Owo+ICB9CgpSZXN0IGxvb2tzIGdvb2QuCgpSZWdh
cmRzCkhpbWFuc2h1Cgo+ICAKPiAtLSAKPiAyLjM0LjEKPiAKPiAKPiAtLSAKPiBvcGVuc2JpIG1h
aWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
