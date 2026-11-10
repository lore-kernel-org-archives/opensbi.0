Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC8B606A321
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 18:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q2d+cfEM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ln+kdgvG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RP47lNrz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q/pKsOmplPdZAmIC0s+/uCW2NvZAIN+J6SYKT8SX8NU=; b=Q2d+cfEMYZN7ArwuUGly3kI/LU
	4TGhPucrcyOMyH29kflEJqU9t3rdW/W6HpG5v3XeezVHVYvBi1PdY8yd2y/bgnGCOUFwzZJQKM6iZ
	ygfTfecY2h3YKDMF5Pr1IUKRscPNgoXIVf3hkqYt4+pEOMI+odc1jb1giCT2H50pVOcevrKgg1pOQ
	OxYKGtt0kz8w1aOQrAXFeYJKZ7qi37qIKm+A/arAlfuN9CZ4WujbN7peYZUlil9BkQYvRl+G0eW6H
	BaWkMCPiINsmxnHwVckk9teKpPRMRRb+9DhHEB+CQLjtTE7TqKZhXZVFxuHRrx6g51BfHVNm0Dlme
	KoehtkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqtx-00000004pnH-18nk;
	Tue, 10 Nov 2026 18:49:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqtu-00000004pmi-2b5I
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 18:48:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIcSL0632868
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SrUXQwE1CwUyPt1Qv+Yz3DoI+UIYEMoQ9JbxctuN0cA=; b=Ln+kdgvGB1zKNJVo
	O4efwlfx0p1ttZZBrYC+ouySXHv9657QnU+1cD1IzvMOdk4SJztHAL1gk0b7jzQR
	ISiGiI4Z+cgMhnRt/zfM0775LESiJr4Hh/ZGQ9Gt7YFt+DBjpuYFdj+lv+lHAZFX
	kXJW/I2nmN7ygIDaOo+LPa0Z8pLo7rL/MUvZbvGIvIPcEtA1dcWbrFr/awrDCbgG
	66y+dEJmWsX7/oxQRANGoiY90Pf3MTawIeNlahKMjCNxSiGkTuOMhZhqmPFc6+vr
	D2tGvTY1pkvY0rP2+tCpFZTLXi22U7oWdS/Iy+kLgHlBL9AH49kyTsAeZg6TvSLe
	ApmI0g==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg4ygf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:48:57 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45eb9967696so2451602fac.1
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 10:48:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336536; cv=none;
        d=google.com; s=arc-20260327;
        b=WAVPZkLFLGVj72KQGyVIrvLH0IZUfFjgLFbkeCbLvKQL9OqsKgHc5m6p6wrYUz3Nwa
         M7rjK7HlJiB/ji2pII8+vvkPLtpu76NNXjeej/b7XrbvTAcT3Uz2BUopRhoSLkyySTR4
         oMWIGK5n3ItyDMDCe6Wr0r7PrBUPep62hoBRFdARK+7RlnivPTgEPS1vVoIi24sZ9IiW
         +8Vszqsrm/nqzHskkSh9vAhlmY/ejjRPXce1lKsUIgqRsb9AlZyNig6aQGnOsokUMfjC
         /O+hKx5WDVoo47lc2LY5zF6OZcf82MHAPad31ZpAnQdUcDA2QkQk8+WUm8FtoMFxxz9A
         21mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SrUXQwE1CwUyPt1Qv+Yz3DoI+UIYEMoQ9JbxctuN0cA=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=qSRFbLdr6rldUOcvvLz70RL18xBIfLgqIvFW3ZbOuipp4152TahgtznUK8KUf03cG4
         dCwY1nr7sgovcbfbXd0bau3DHALynuJAJltzW+68aU2Xlo2JvFvUJblEGZK+NL2TCP2V
         Xm2RyamRm80rkSFty1RjACeE3m+5Z+WZidW+y2/UFPYwpWvhD4+0+nbXOG1VJZXa7fUY
         4KcSuo6N33bDMRxn0TKNv0Yu1OjXjU/EDTTU/vm+Nbpy0Ad9jcLTyosohuEjPnoJ3Z+f
         Ya3E0FO/hXy5pOShg0naQvxPp313gGI5owsgCxgZ3WcuZo0eLmAitg7esbuDXArZec6H
         JfoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794336536; x=1794941336; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrUXQwE1CwUyPt1Qv+Yz3DoI+UIYEMoQ9JbxctuN0cA=;
        b=RP47lNrz5mfqSkM3/yYu8LOyu/sNjtrb9eXkV0jf5Ozsa6VW44gsOTbHAdcwTyRqMA
         P7qAMrJw1sQ1XsnBaxg4M5BFXv8rXRHQzNzOmEH2FTQk347WZzwWvvquNXQ4tcbHwY9J
         Pl4V2pPV0BVgfc6Viq3Dyx6pycvA+IwKGQI80/o2Hvp5N6rUOTDuSf1++twABUIO5bkh
         DYatDy9DjS1hAJGckjRqmBfKPnTk/qD3kE1diZENvAgHI5+tXb2AePodB3Y8u9e/nCD6
         FvcqxQpGxIqijzv3tgsg896vjGbGAy3S38zGB1y1CB8yThRDf/ANUspWoMSGRwHQ+5cB
         hePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336536; x=1794941336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrUXQwE1CwUyPt1Qv+Yz3DoI+UIYEMoQ9JbxctuN0cA=;
        b=WDK16cgl0z/2g9VUEvEr1bv7VKwtoF+Zi/kJZ6tBUHjaG2KKcNo1VfYZeNz82VbTsZ
         kwvVJOPTzfgEBEdsjj2kM0JcWW4JvjLk1FnAYnpkzsCS/LFXc/+BiK57DbxI+RnXD8P8
         JRuntsaz6Nw8hXP7pE3/F2AkmyLIWKWLbPWiTeO9w6gcIV6g66raVF/c52zi+lPMeOwG
         l+ZbGDetyBWY/kvx//CVxDhKig2lKNn7Eu5OiXT8bhZtvMNzX8eW2a40Ti9EaIWfnWlE
         JUh3TkVlOW+9iMNy+6K7jM3gtCH7KyeetzQqwT0LaAm1/ZkoQKnM/s8ZBRrPoaeA0yjH
         BtQw==
X-Gm-Message-State: APuU4Z8gmVErhbP/DBfY1dCo8yr7ny+pXvOjVM/D83N1Vr+k0nVxOj4e
	eN+vVzfaglKJ7I/olVDEIgth0YxzBpPjFZNZ9K/Fs0EUXr+Wjov9oFOLJa6uj8+hrbHCEQn0pOQ
	UA8ioxB4Rqwmr5n1GhF7UoNRNGgD0uYWTVd2E8F0ioW57/9pEHrwdBJM1igxlnzsagsldTDeLFg
	ReQs3K/xsAqrbaxqRLs9SX9dt805TWxeZ7O0GMu340hbYY7VWX2eQ=
X-Gm-Gg: AYBFou0raEzKlBilzLXGUu5eXFKxzV/eIJVUZIOOGncPuXZZzSy1IridDtPznqz2YvT
	EenrS8pdVNup+ORZYrt2lyA7wHbO7mGjQJ0CIL3A05EGhwtXJTz4DVhYSzpojGlo3uvRl/0KKu4
	MQ+Df6GF5noaNLmuIJNiwbKP+vy8wLYFihnTbJyWbOQOVBp1N2K40v9adnug==
X-Received: by 2002:a05:6870:2047:b0:4a8:a36c:f3e2 with SMTP id 586e51a60fabf-4ae45584566mr234632fac.0.1794336536217;
        Tue, 10 Nov 2026 10:48:56 -0800 (PST)
X-Received: by 2002:a05:6870:2047:b0:4a8:a36c:f3e2 with SMTP id
 586e51a60fabf-4ae45584566mr234618fac.0.1794336535627; Tue, 10 Nov 2026
 10:48:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-3-peter.lin@sifive.com>
In-Reply-To: <20261110095029.117504-3-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 10:48:43 -0800
X-Gm-Features: AclHuK8qcn7YJ4AU5BR7632ZGZNnztqlIlzMMxzeFabpXjC8QFqJhvg4Aio2LuI
Message-ID: <CAAVgOk+Mgsmr970WSYi17KVWNTK-i==jn_8keELurRFxbtf4zg@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] lib: utils: fdt_helper: parse RISC-V Worlds
 per-hart WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX4H86P0uvcE0W
 DxgEonkqCaBqmhuRrOEbl7QVXSjujWYwS9A9//LNtm/p/FlQjcVcX5HuApNbVdg4rjbM7S36TjN
 BVF8piHEdu1OlMUtaM1kTiHFYTeNXAk7N+F6PQuhIAY4umCmKe3PoCBOFvZt+ZwW507wJYfCM0H
 sEuFPzymp+vhSVojHs5KvSs/SymXdLpdN9JHhalCG20MV528dUdyFQT87t/XzcmmxTf0YSd37ge
 A3Bwm3aZdvBDD+y0MV/EnWf+n3QGX4Be1tyRqOb5XilJ1/NCDUTH1hFCPl3GlB6E0c+9f1cmdTe
 j0iU59QJiQeNtlE6ejsp/qbjehl96TXHFGcVFv3zShRxv8qmYrqYxyC/lNtRH9Ul6BNwgggEcbm
 2exjEylFlBy+yhbaTv2L9/IDuRu3JRdRxsAKifAx2x7q3K51BH28bpoo3aM1u+QX0VnTdXbhfCy
 1SL8rs24ZjqDcsmZ+SQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX4Lu0/ESEFhVL
 m/2up9CFSiNFdtxgv8A9oRKRfHH1/EUe9NzE5XOWvOaIn/yO1DVPbUcrLYredX1q7dO8f/pjFwO
 QN0uH9fBckV/ZjKa32xdsdUy5obkhBY=
X-Proofpoint-GUID: jDVEXiZZ6rquwWpz_S_fB63shYSImvSj
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af36719 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pFyQfRViAAAA:8 a=W-_n0kkjAAAA:8 a=EUspDBNiAAAA:8
 a=XWOBxEBtQ-P2IjF8cFcA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=oJz5jJLG1JtSoe7EL652:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-ORIG-GUID: jDVEXiZZ6rquwWpz_S_fB63shYSImvSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_104858_781671_D9125E33 
X-CRM114-Status: GOOD (  21.65  )
X-Spam-Score: -2.8 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMTo1MOKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gRXh0ZW5kIGZkdF9wYXJzZV9pc2FfZXh0ZW5z
aW9uc19hbGxfaGFydHMoKSB0byBhbHNvIHBhcnNlIHRoZQo+IHBsYXRmb3JtLWRlZmluZWQgUklT
Qy1WIFdvcmxkcyBEVCBwcm9wZXJ0aWVzIGluIC9jcHVzL2NwdUBYOgo+IC0gcmlzY3YscG13aWQ6
IE0tbW9kZSBXb3JsZCBJRAo+IC0gcmlzY3YscG13aWRsaXN0OiBiaXRtYXAgb2YgcGVybWl0dGVk
IE0tbW9kZSBXSURzCj4gLSByaXNjdixwbWx3aWRsaXN0OiBiaXRtYXAgb2YgcGVybWl0dGVkIGxv
d2VyLXByaXZpbGVnZSBXSURzCj4gYW5kIHN0b3JlIHRoZSBwYXJzZWQgdmFsdWVzIGluIHN0cnVj
dCBzYmlfaGFydF9mZWF0dXJlcy4KPgo+IFRoZXNlIHBsYXRmb3JtLWRlZmluZWQgdmFsdWVzIHNl
cnZlIGFzIHRoZSByb290LW9mLXRydXN0IGNvbnN0cmFpbnRzCj4gZm9yIHBlci1kb21haW4gV0lE
IGFzc2lnbm1lbnQgZHVyaW5nIGRvbWFpbiBjcmVhdGlvbiBhbmQgY29udGV4dAo+IHN3aXRjaGlu
Zy4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2
ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4g
LS0tCj4gQ2hhbmdlcyB2NC0+djU6Cj4gLSBObyBjaGFuZ2UKPiAtLS0KPiAgaW5jbHVkZS9zYmkv
c2JpX2hhcnQuaCAgICAgfCAgNSArKysKPiAgbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgfCA2
OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDY3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBpbmRleCBlZDM0
NDc4My4uNjI5ZTNmNjQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ICsr
KyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBAQCAtMTM4LDYgKzEzOCwxMSBAQCBzdHJ1Y3Qg
c2JpX2hhcnRfZmVhdHVyZXMgewo+ICAgICAgICAgdW5zaWduZWQgaW50IG1ocG1fbWFzazsKPiAg
ICAgICAgIHVuc2lnbmVkIGludCBtaHBtX2JpdHM7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGV4
cGVjdGVkX3RyYXA7Cj4gKyAgICAgICB1MzIgcG13aWQ7Cj4gKyAgICAgICB1NjQgcG13aWRsaXN0
Owo+ICsgICAgICAgdTY0IHBtbHdpZGxpc3Q7Cj4gKyAgICAgICBib29sIGhhc19wbXdpZDsKPiAr
ICAgICAgIGJvb2wgaGFzX3BtbHdpZGxpc3Q7Cj4gIH07Cj4KPiAgZXh0ZXJuIHVuc2lnbmVkIGxv
bmcgaGFydF9mZWF0dXJlc19vZmZzZXQ7Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9mZHQvZmR0
X2hlbHBlci5jIGIvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMKPiBpbmRleCA3NDdiYTAyOC4u
ZmRkMjU2NDggMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMKPiArKysg
Yi9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYwo+IEBAIC00NDIsMTYgKzQ0Miw3MSBAQCBpbnQg
ZmR0X3BhcnNlX2lzYV9leHRlbnNpb25zX2FsbF9oYXJ0cyhjb25zdCB2b2lkICpmZHQpCj4gICAg
ICAgICAgICAgICAgIGlmICh2YWwgJiYgbGVuID4gMCkgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGZkdF9wYXJzZV9pc2FfZXh0ZW5zaW9uc19vbmVfaGFydCgoY29uc3QgY2hhciAqKXZhbCwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaGZlYXR1cmVzLT5leHRlbnNpb25zLCBsZW4pOwo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgY3B1X29mZnNldCwgInJpc2N2LGlzYSIsICZs
ZW4pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICghdmFsIHx8IGxlbiA8PSAwKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9FTlQ7Cj4gKwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGVyciA9IGZkdF9wYXJzZV9pc2Ffb25lX2hhcnQoKGNvbnN0
IGNoYXIgKil2YWwsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBoZmVhdHVyZXMtPmV4dGVuc2lvbnMpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXJy
Owo+ICAgICAgICAgICAgICAgICB9Cj4KPiAtICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHBy
b3AoZmR0LCBjcHVfb2Zmc2V0LCAicmlzY3YsaXNhIiwgJmxlbik7Cj4gLSAgICAgICAgICAgICAg
IGlmICghdmFsIHx8IGxlbiA8PSAwKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBT
QklfRU5PRU5UOwo+ICsgICAgICAgICAgICAgICB2YWwgPSBmZHRfZ2V0cHJvcChmZHQsIGNwdV9v
ZmZzZXQsICJyaXNjdixwbXdpZCIsICZsZW4pOwo+ICsgICAgICAgICAgICAgICBpZiAodmFsICYm
IGxlbiA9PSBzaXplb2YoZmR0MzJfdCkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVh
dHVyZXMtPnBtd2lkID0gZmR0MzJfdG9fY3B1KCp2YWwpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGhmZWF0dXJlcy0+aGFzX3Btd2lkID0gdHJ1ZTsKPiArICAgICAgICAgICAgICAgfQo+Cj4g
LSAgICAgICAgICAgICAgIGVyciA9IGZkdF9wYXJzZV9pc2Ffb25lX2hhcnQoKGNvbnN0IGNoYXIg
Kil2YWwsIGhmZWF0dXJlcy0+ZXh0ZW5zaW9ucyk7Cj4gLSAgICAgICAgICAgICAgIGlmIChlcnIp
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPiArICAgICAgICAgICAgICAg
dmFsID0gZmR0X2dldHByb3AoZmR0LCBjcHVfb2Zmc2V0LCAicmlzY3YscG13aWRsaXN0IiwgJmxl
bik7Cj4gKyAgICAgICAgICAgICAgIGlmICh2YWwgJiYgbGVuID09IDIgKiBzaXplb2YoZmR0MzJf
dCkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVhdHVyZXMtPnBtd2lkbGlzdCA9ICgo
dTY0KWZkdDMyX3RvX2NwdSh2YWxbMF0pIDw8IDMyKSB8Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmR0MzJfdG9fY3B1KHZhbFsxXSk7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKCFoZmVhdHVyZXMtPnBtd2lkbGlzdCkgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGhhcnQldSByaXNjdixwbXdp
ZGxpc3QgaXMgZW1wdHlcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fZnVuY19fLCBoYXJ0aWQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+ICsgICAg
ICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICB2YWwgPSBmZHRfZ2V0cHJvcChmZHQs
IGNwdV9vZmZzZXQsICJyaXNjdixwbWx3aWRsaXN0IiwgJmxlbik7Cj4gKyAgICAgICAgICAgICAg
IGlmICh2YWwgJiYgbGVuID09IDIgKiBzaXplb2YoZmR0MzJfdCkpIHsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBoZmVhdHVyZXMtPnBtbHdpZGxpc3QgPSAoKHU2NClmZHQzMl90b19jcHUodmFs
WzBdKSA8PCAzMikgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmZHQzMl90b19jcHUodmFsWzFdKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBo
ZmVhdHVyZXMtPmhhc19wbWx3aWRsaXN0ID0gdHJ1ZTsKPiArICAgICAgICAgICAgICAgfQo+ICsK
PiArICAgICAgICAgICAgICAgLyogU2FuaXR5IGNoZWNrcyAqLwo+ICsjaWYgX19yaXNjdl94bGVu
ID09IDMyCj4gKyAgICAgICAgICAgICAgIGlmIChoZmVhdHVyZXMtPnBtd2lkbGlzdCAmJgo+ICsg
ICAgICAgICAgICAgICAgICAgKGhmZWF0dXJlcy0+cG13aWRsaXN0ID4+IDMyKSkgewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0JXUgcmlzY3YscG13aWRsaXN0
IGhhcyBiaXRzIGJleW9uZCBYTEVOXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgX19mdW5jX18sIGhhcnRpZCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IFNCSV9FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGlm
IChoZmVhdHVyZXMtPmhhc19wbWx3aWRsaXN0ICYmCj4gKyAgICAgICAgICAgICAgICAgICAoaGZl
YXR1cmVzLT5wbWx3aWRsaXN0ID4+IDMyKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNi
aV9wcmludGYoIiVzOiBoYXJ0JXUgcmlzY3YscG1sd2lkbGlzdCBoYXMgYml0cyBiZXlvbmQgWExF
TlxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBoYXJ0
aWQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsgICAg
ICAgICAgICAgICB9Cj4gKyNlbmRpZgo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGhmZWF0dXJl
cy0+aGFzX3Btd2lkICYmCj4gKyAgICAgICAgICAgICAgICAgICBoZmVhdHVyZXMtPnBtd2lkID49
IF9fcmlzY3ZfeGxlbikgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVz
OiBoYXJ0JXUgcmlzY3YscG13aWQgKCV1KSBleGNlZWRzIG1heCBXSURcbiIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlkLCBoZmVhdHVyZXMtPnBt
d2lkKTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAg
ICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgaWYgKGhmZWF0dXJlcy0+cG13aWRs
aXN0ICYmIGhmZWF0dXJlcy0+aGFzX3Btd2lkICYmCj4gKyAgICAgICAgICAgICAgICAgICAhKGhm
ZWF0dXJlcy0+cG13aWRsaXN0ICYgQklUX1VMTChoZmVhdHVyZXMtPnBtd2lkKSkpIHsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCV1IHJpc2N2LHBtd2lkICgl
dSkgbm90IGluIHBtd2lkbGlzdFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF9fZnVuY19fLCBoYXJ0aWQsIGhmZWF0dXJlcy0+cG13aWQpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAg
ICB9Cj4KPiAgICAgICAgIHJldHVybiAwOwo+IC0tCj4gMi40My43Cj4KClJldmlld2VkLWJ5OiBQ
YXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
