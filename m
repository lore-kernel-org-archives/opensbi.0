Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D379C624D6
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 22:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KA3oNe1jQEqpHmDZAaqkUzVS1WNKyITiz61hGzX84lk=; b=JUQWtUuWUKxwhj
	xtIXcCLBVWXE+x7kA+o64ggHRtJDGd3gWcxu5J/jQnIinwAqiiTEzsH8kZr+bFQFV3YPJnigoV7QJ
	lDXsKHX8/qF1NJ1TIxAgG9OoDtIyFQ9osV+np0qzXqCdMagWHm770SrAv0yjfs05sovV2isvvzds/
	iUvps0QUgt93CdbBgqoNlm0FCmwsk+X4YsW7fW3mlPo6XIirF8n0qbUlPEwEiftQazI8Jq+SMtl/D
	GSruGQjbazZZ7O4FrOv2Ni+ILRK3ie4Ef4SDbYhl6nk29oJsdYp8k+/MpzEFbfXhkE1nFIc7wXIf0
	KEQwLkkak8vcXUbQJJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FUj-00000000gel-1JtD;
	Thu, 03 Sep 2026 22:01:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FUg-00000000geB-36GC
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 22:01:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683JgwSv245202
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 22:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+iHZEf2TqNfd8HeJiYKtb/x8eDH50mpiq7UxCv8im4=; b=m4ZxMf3Okqj9ap/F
	zNr7yQXBaUyY8Bc6Xaxs+YypXWB4Win3Rfc6B8KuG3sr4gp2G01Zx4pySica97iI
	s2TSqqDIayOGuCTOOyoiHcTohiyvEG8k6zPhRSFazD793fAWGPCqgJDsSQ3tQnmv
	vkUo7/Wqk1ZdHZaCalb8wVKv8tNIte12EzCzjxH35u6NFV1+I0rAUeUMxkbsE/5w
	0UvR9uCKzrpVhR2nxkasnzoMoLH53Iv46C9Pu2xRnInWY67DQuFzL18eMUaU8FGb
	aQmEtEEyIwHMDd4TykavnTqOiFhoREzaLR87sIfjSIB25HpstrAeZdaIDZDM4Rrm
	kbe9bQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d13enc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 22:01:14 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-451d80641efso396402fac.2
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 15:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788472873; cv=none;
        d=google.com; s=arc-20260327;
        b=TWnrqW3T9EEWkSJqV2rW2OdhtAM2lL7qvRSvA5itW6WZhHV9jPM3jf0UOjDY8cpdlp
         pMrFJ3FL9zSftUjgfRwCyH3XdO1zy03RKp34cEyBppw9L37KlAtv13ReKNaMq7CFU2yq
         yYaFm3bE5GjrkFtyuez478nK+9YHyD6Nm+jFh6B7XEio5WJBaUYbJQ+X2NktZkERyY9f
         AUNIc3LFFnVC4g70HIqXf/e80cib5H1pSqxr7YO3645s5X6HbG2Z60Nh30xJyCHJ0FOF
         1qO0jaQpweiMScTdbrvyxknR3y7y2yC0rhYN13w+Pkz97imleh374rNM4zY/BoSHqDpC
         q0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i+iHZEf2TqNfd8HeJiYKtb/x8eDH50mpiq7UxCv8im4=;
        fh=4ewBQFYQm5N+QAVC2yDkcGgJqnoV8H9Ixi/6ZlMkFAE=;
        b=gA/IurYwx6COBJAmIxdrkzukjF3yQ4v60LjxgXVEM7b/lQ9yuv+QjSeZbaKJzUT0oM
         ML04hgm3vEGMz150EVYGUyRLUsWKPTRjj3CsfmQYSgD7SdFRSPbLgxKbnB8+pGiaDTZz
         rTASIx6mJcVo64QHnYlieAue9fwqTc8Pg7zzVWFz5uC9anlCKdkKyw70slScKbZ0myUH
         TqKsnCR97R2Fy8HydEyqTsuVSOcBo5uAdejEIbf4Uc3Ut/WXVuh/fYM4VnZsTOP4cx1e
         HKWI6amgHO1MmMzehPyqHGvCehY/zjPHLoNTs3K4yvft/prdSsf6UBQsz5zEbzYVakGz
         ELgA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788472873; x=1789077673; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+iHZEf2TqNfd8HeJiYKtb/x8eDH50mpiq7UxCv8im4=;
        b=Tv9Zvtqdll7n51vunJ8JWRt7Q3aacdp78cFvxtwBDZwddpRWoQKd4Ns+sCqeCXNBPE
         Qu7W5V69MINQ/y82w7Emxi5et45I33YlJ/W4ym1NCWvnfwmRPJc5HUHS7WLMHPj2ieLY
         3HW732v9/LIPxs8VLqNoZzPDEMi14V0RfnHyDy86al/ZPytqgPgymgXFVv9lcqouZ+vY
         NwPUJroXf/56O34op6aeNS94PEcZWjCijFJi2usJ1X9hNLjbGLU+Gde3eu8FChll8045
         8sMremYi7lRIFZf5EBc44tDAr4wD3sfFfQcmGTkEjudbixk+254ZXsYU1sKe040NhQlG
         pJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788472873; x=1789077673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+iHZEf2TqNfd8HeJiYKtb/x8eDH50mpiq7UxCv8im4=;
        b=jGmaqGrmm46DGJVb36LOBtRLIPSamKRcncE9AapiWXq3+gFQJX6y4Trp2si/KVZHjO
         uShtjqR7GEq+voyq4PLKt1LbrR26rxNub7n81ZJG2kng1Ka6keUOe2ua1xM8asSr9qd7
         W4feb6mviSEkkhEuKmBvecuyBHFs8zwrrbghaojV6V5Cv591k/4/vrmSXv5EFDQcJHAQ
         cglCTYc9Irho7aNQXPWdnk6jNogCsfHdT+vQyOaAbC52xelJclknaABr9MWmPANHY9tF
         hftJmrW5N6CwgqpSvRO2hElNrNxf2LVJYRpote8wwBayf7wiSb3fYuAdv2vnnb7iTuY6
         XYLQ==
X-Gm-Message-State: AFuF++n+bW3qg32fwGpCHM3zzmt5i4qzEJhyTYHitnWrKEM1ChtChIso
	0M54nyCtPBmXo1UL12DTptzAiZ50+XfqQqqZc/3uyoaf81xntudIUtDneOwB4TOIgduaDe7qwXA
	Z7gAvitWVWoBcOzLYr4MwxiCgQtGMp96ebX7Va55WCWgh6snXRfkK5cWKycrWjR2rAigd7idVSC
	HA8KadQIVuE6LV5duRWpICWDubBFq8hPID5Ca0hzlq
X-Gm-Gg: AYBFou2I+MiOFxrCMvEGpUcKiAVSMOmOBeOtJagACyiSGL7+K3C0FIIE1nqk7VNcR/p
	o4Ai61beIPeYaMULTJ7a2b5hVKPvJby2vyqTG+WtznOEvz5wQ7XKXSbFCJ6BqlDcgdj5VZ4rcPM
	zXx8jtFChBmp/+58nkpjKlEs0tk7Gp+kK0816LCUpaM/tbbXDofYNqwb7M1Q==
X-Received: by 2002:a05:6870:328d:b0:475:a153:2dbf with SMTP id 586e51a60fabf-475a1537ba1mr26986fac.21.1788472873237;
        Thu, 03 Sep 2026 15:01:13 -0700 (PDT)
X-Received: by 2002:a05:6870:328d:b0:475:a153:2dbf with SMTP id
 586e51a60fabf-475a1537ba1mr26925fac.21.1788472872779; Thu, 03 Sep 2026
 15:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com> <20260817090503.2104998-10-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-10-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:01:01 -0700
X-Gm-Features: AcwNN1Wgqv0zb33XH7h6pvEM3h9dr-1VQXIzCdo8ZolkQz0dF4Lv-vrwu7vsO7I
Message-ID: <CAAVgOkL1A1yXbqHswahp9y1yT0VAv0arKeuQBAHtoVcmN7vzvA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] docs: document WID DT properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com, krzk@kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE5MiBTYWx0ZWRfX4oPPGRvVFHya
 krFANudqDKgWU8G30d2AwwAsJp95oAa7xznmTuP+qSaApi1K+EainNBrvANo/x2jEqufY3QHEPc
 lUnBJDlNfivmiBt14L8r3jPrh3uLiiouR6LEMczqIEgAgaca+rc42O/ON0smIe9+uKx+xHzBYs5
 032M/CqV4YzNnw/CBvys+0P/K6+o9UHiJi+O+8HGazeWFvK+cRtqK84ytt+9pSS4kjv8yG2WR/6
 QMpJD7GHdO1ibMQOSGTrL61a5fj8WbaTghZyjd1f0tELNxrqbcVrIwzVRtdcUnY6CTHMDEwEjvQ
 WN6NBlhPbPzIavT0H9UxP+MrCJhMI4zVQyXzoRlk50sSYSCFFtnZxG9stq+6kBBMuFc9wWbuV0q
 TqAtG4Hig1c3hLepIEylUFhPsIn3/SAqCNe9UmZHI7FPp4OlUCJavEjSUxtPv8kEtMhs2Os9Fzn
 6knn98TD3VTGk1HHxbQ==
X-Proofpoint-ORIG-GUID: KWL9BBnGTpwz9JOq2lIWqN9qD9RFSxKV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE5MiBTYWx0ZWRfX31w9WZIVjfqz
 S9MrWL811lsN8P0OZWrG+4BRMssZc/CiwYv/HcVftAsaX/1UI0Y8JRHjvZNSg9ro5huMwTuTBBs
 st3Gh1Mw/epR/2BhBcvxSX8455SYf5w=
X-Proofpoint-GUID: KWL9BBnGTpwz9JOq2lIWqN9qD9RFSxKV
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99ee2a cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=LxUGANOAbtCn31AMumYA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_150114_781913_17243EDA 
X-CRM114-Status: GOOD (  23.84  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkICJ3aWQiIGFuZCAid2lkZGVsZWciIHBy
b3BlcnRpZXMgdG8gZG9tYWluIGluc3RhbmNlIG5vZGUKPiBkb2N1bWVudGF0aW9uIGFuZCBleGFt
cGxlIERULiBBZGQgYSAiUm9vdCBEb21haW4gTm9kZSIgc2VjdGlvbgo+IGRlc2NyaWJpbmcgdGhl
ICJyb290IiBzdWJub2RlIHVuZGVyIHRoZSBkb21haW4gY29uZmlndXJhdGlvbgo+IG5vZGUgZm9y
IHJvb3QgZG9tYWluIFdJRCBjb25maWd1cmF0aW9uCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGll
biBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+ICBkb2NzL2RvbWFpbl9z
dXBwb3J0Lm1kIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZG9jcy9kb21h
aW5fc3VwcG9ydC5tZCBiL2RvY3MvZG9tYWluX3N1cHBvcnQubWQKPiBpbmRleCBlMjY3YTlmNy4u
YzM1YTFkOWEgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9kb21haW5fc3VwcG9ydC5tZAo+ICsrKyBiL2Rv
Y3MvZG9tYWluX3N1cHBvcnQubWQKPiBAQCAtOTMsNiArOTMsOCBAQCBmb2xsb3dpbmcgbWFubmVy
Ogo+ICAgIGlzIHRoZSBuZXh0IG1vZGUgZm9yIHRoZSBST09UIGRvbWFpbgo+ICAqICoqc3lzdGVt
X3Jlc2V0X2FsbG93ZWQqKiAtIFRoZSBST09UIGRvbWFpbiBpcyBhbGxvd2VkIHRvIHJlc2V0IHRo
ZSBzeXN0ZW0KPiAgKiAqKnN5c3RlbV9zdXNwZW5kX2FsbG93ZWQqKiAtIFRoZSBST09UIGRvbWFp
biBpcyBhbGxvd2VkIHRvIHN1c3BlbmQgdGhlIHN5c3RlbQo+ICsqICoqd2lkKiogLSBDb25maWd1
cmFibGUgV29ybGQgSUQgZm9yIHRoZSBST09UIGRvbWFpbgo+ICsqICoqd2lkZGVsZWcqKiAtIENv
bmZpZ3VyYWJsZSBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgZm9yIHRoZSBST09UIGRvbWFp
bgo+Cj4gIERvbWFpbiBFZmZlY3RzCj4gIC0tLS0tLS0tLS0tLS0tCj4gQEAgLTEyNiw2ICsxMjgs
MjMgQEAgVGhlIERUIHByb3BlcnRpZXMgb2YgYSBkb21haW4gY29uZmlndXJhdGlvbiBEVCBub2Rl
IGFyZSBhcyBmb2xsb3dzOgo+ICAqICoqY29tcGF0aWJsZSoqIChNYW5kYXRvcnkpIC0gVGhlIGNv
bXBhdGlibGUgc3RyaW5nIG9mIHRoZSBkb21haW4KPiAgICBjb25maWd1cmF0aW9uLiBUaGlzIERU
IHByb3BlcnR5IHNob3VsZCBoYXZlIHZhbHVlICoib3BlbnNiaSxkb21haW4sY29uZmlnIioKPgo+
ICsjIyMgUm9vdCBEb21haW4gTm9kZQo+ICsKPiArVGhlIHJvb3QgZG9tYWluIFdJRCBjb25maWd1
cmF0aW9uIGlzIGRlc2NyaWJlZCBpbiBhICoqcm9vdCoqIHN1Ym5vZGUgdW5kZXIKPiArdGhlIGRv
bWFpbiBjb25maWd1cmF0aW9uIERUIG5vZGUuIFRoaXMgc3Vibm9kZSBkb2VzIG5vdCBoYXZlIGEg
Y29tcGF0aWJsZQo+ICtzdHJpbmcuCj4gKwo+ICtUaGUgRFQgcHJvcGVydGllcyBvZiB0aGUgcm9v
dCBkb21haW4gbm9kZSBhcmUgYXMgZm9sbG93czoKPiArCj4gKyogKip3aWQqKiAoT3B0aW9uYWwp
IC0gVGhlIDMyIGJpdCBXb3JsZCBJRCBmb3IgbG93ZXItcHJpdmlsZWdlIG1vZGVzCj4gKyAgKFMv
VS1tb2RlKSBmb3IgdGhlIFJPT1QgZG9tYWluLiBJZiBwcmVzZW50LCBPcGVuU0JJIHdyaXRlcyB0
aGlzIHZhbHVlCj4gKyAgdG8gKiptbHdpZCoqIHdoZW4gZW50ZXJpbmcgdGhlIFJPT1QgZG9tYWlu
IChyZXF1aXJlcyBTbWx3aWQgZXh0ZW5zaW9uKS4KPiArICBJZiBhYnNlbnQsIE9wZW5TQkkgdXNl
cyB0aGUgTS1tb2RlIFdJRCBhcyBmYWxsYmFjay4KPiArKiAqKndpZGRlbGVnKiogKE9wdGlvbmFs
KSAtIFRoZSA2NCBiaXQgV29ybGQgSUQgZGVsZWdhdGlvbiBiaXRtYXNrIGZvcgo+ICsgIHRoZSBS
T09UIGRvbWFpbi4gSWYgcHJlc2VudCwgT3BlblNCSSB3cml0ZXMgdGhpcyB2YWx1ZSB0byAqKm13
aWRkZWxlZyoqCj4gKyAgd2hlbiBlbnRlcmluZyB0aGUgUk9PVCBkb21haW4gKHJlcXVpcmVzIFNt
d2lkZGVsZWcgZXh0ZW5zaW9uKS4gSWYgYWJzZW50LAo+ICsgIGNsZWFycyAqKm13aWRkZWxlZyoq
IHRvIGRpc2FibGUgUy1tb2RlIFdJRCBkZWxlZ2F0aW9uLgo+ICsKPiAgIyMjIERvbWFpbiBNZW1v
cnkgUmVnaW9uIE5vZGUKPgo+ICBUaGUgZG9tYWluIG1lbW9yeSByZWdpb24gRFQgbm9kZSBkZXNj
cmliZXMgZGV0YWlscyBvZiBhIG1lbW9yeSByZWdpb24gYW5kCj4gQEAgLTIwNCw2ICsyMjMsMTQg
QEAgVGhlIERUIHByb3BlcnRpZXMgb2YgYSBkb21haW4gaW5zdGFuY2UgRFQgbm9kZSBhcmUgYXMg
Zm9sbG93czoKPiAgICB3aGV0aGVyIHRoZSBkb21haW4gaW5zdGFuY2UgaXMgYWxsb3dlZCB0byBk
byBzeXN0ZW0gcmVzZXQuCj4gICogKipzeXN0ZW0tc3VzcGVuZC1hbGxvd2VkKiogKE9wdGlvbmFs
KSAtIEEgYm9vbGVhbiBmbGFnIHJlcHJlc2VudGluZwo+ICAgIHdoZXRoZXIgdGhlIGRvbWFpbiBp
bnN0YW5jZSBpcyBhbGxvd2VkIHRvIGRvIHN5c3RlbSBzdXNwZW5kLgo+ICsqICoqd2lkKiogKE9w
dGlvbmFsKSAtIFRoZSAzMiBiaXQgV29ybGQgSUQgZm9yIGxvd2VyLXByaXZpbGVnZSBtb2Rlcwo+
ICsgIChTL1UtbW9kZSkgZm9yIHRoZSBkb21haW4gaW5zdGFuY2UuIElmIHByZXNlbnQsIE9wZW5T
Qkkgd3JpdGVzIHRoaXMgdmFsdWUKPiArICB0byAqKm1sd2lkKiogb24gY29udGV4dCBzd2l0Y2gg
aW50byB0aGlzIGRvbWFpbiAocmVxdWlyZXMgU21sd2lkIGV4dGVuc2lvbikuCj4gKyAgSWYgYWJz
ZW50LCBPcGVuU0JJIHVzZXMgdGhlIE0tbW9kZSBXSUQgYXMgZmFsbGJhY2suCj4gKyogKip3aWRk
ZWxlZyoqIChPcHRpb25hbCkgLSBUaGUgNjQgYml0IFdvcmxkIElEIGRlbGVnYXRpb24gYml0bWFz
ayBmb3IKPiArICB0aGUgZG9tYWluIGluc3RhbmNlLiBJZiBwcmVzZW50LCBPcGVuU0JJIHdyaXRl
cyB0aGlzIHZhbHVlIHRvICoqbXdpZGRlbGVnKioKPiArICBvbiBjb250ZXh0IHN3aXRjaCBpbnRv
IHRoaXMgZG9tYWluIChyZXF1aXJlcyBTbXdpZGRlbGVnIGV4dGVuc2lvbikuIElmIGFic2VudCwK
PiArICBjbGVhcnMgKiptd2lkZGVsZWcqKiB0byBkaXNhYmxlIFMtbW9kZSBXSUQgZGVsZWdhdGlv
bi4KPgo+ICAjIyMgQXNzaWduaW5nIEhBUlQgVG8gRG9tYWluIEluc3RhbmNlCj4KPiBAQCAtMjYw
LDYgKzI4NywxMSBAQCBiZSBkb25lOgo+ICAgICAgICAgICAgICAgICAgb3JkZXIgPSA8NjQ+Owo+
ICAgICAgICAgICAgICB9Owo+Cj4gKyAgICAgICAgICAgIHJvb3Qgewo+ICsgICAgICAgICAgICAg
ICAgd2lkID0gPDM+Owo+ICsgICAgICAgICAgICAgICAgd2lkZGVsZWcgPSA8MHgwIDB4MD47Cj4g
KyAgICAgICAgICAgIH07Cj4gKwo+ICAgICAgICAgICAgICB0ZG9tYWluOiB0cnVzdGVkLWRvbWFp
biB7Cj4gICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm9wZW5zYmksZG9tYWluLGluc3Rh
bmNlIjsKPiAgICAgICAgICAgICAgICAgIHBvc3NpYmxlLWhhcnRzID0gPCZjcHUwPjsKPiBAQCAt
MjY4LDYgKzMwMCw4IEBAIGJlIGRvbmU6Cj4gICAgICAgICAgICAgICAgICBuZXh0LWFyZzEgPSA8
MHgwIDB4MD47Cj4gICAgICAgICAgICAgICAgICBuZXh0LWFkZHIgPSA8MHgwIDB4ODAxMDAwMDA+
Owo+ICAgICAgICAgICAgICAgICAgbmV4dC1tb2RlID0gPDB4MD47Cj4gKyAgICAgICAgICAgICAg
ICB3aWQgPSA8MT47Cj4gKyAgICAgICAgICAgICAgICB3aWRkZWxlZyA9IDwweDAgMHg2PjsKPiAg
ICAgICAgICAgICAgICAgIHN5c3RlbS1yZXNldC1hbGxvd2VkOwo+ICAgICAgICAgICAgICAgICAg
c3lzdGVtLXN1c3BlbmQtYWxsb3dlZDsKPiAgICAgICAgICAgICAgfTsKPiBAQCAtMjc2LDYgKzMx
MCw4IEBAIGJlIGRvbmU6Cj4gICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm9wZW5zYmks
ZG9tYWluLGluc3RhbmNlIjsKPiAgICAgICAgICAgICAgICAgIHBvc3NpYmxlLWhhcnRzID0gPCZj
cHUxICZjcHUyICZjcHUzICZjcHU0PjsKPiAgICAgICAgICAgICAgICAgIHJlZ2lvbnMgPSA8JnRt
ZW0gMHgwPiwgPCZ0dWFydCAweDA+LCA8JmFsbG1lbSAweDNmPjsKPiArICAgICAgICAgICAgICAg
IHdpZCA9IDwwPjsKPiArICAgICAgICAgICAgICAgIHdpZGRlbGVnID0gPDB4MCAweDE+Owo+ICAg
ICAgICAgICAgICB9Owo+ICAgICAgICAgIH07Cj4gICAgICB9Owo+IC0tCj4gMi40My43Cj4KClJl
dmlld2VkLWJ5OiBQYXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
