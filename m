Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D60CC6B12
	for <opensbi@archiver.kernel.org>; Tue, 13 Oct 2026 19:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIUyCFeReT+K34ef9RnDfgU7wf47dQLyISVGw+EZhNk=; b=uh4SgINOGggtQv
	qvERi0SEs0bXdXrpuZTXUOKxLmlyUN9jMZKjMAYWh1qPhRuqtwR9ZY2JTuJ2nPgQlx66TGpMUPRGa
	NbZvgKtoz8zx2+k6dVIs6eSmu2kwTZkcnRm9+1UpVjpL3bO0tSnvpXZgDumIXZLFpxYLciElrHSRH
	zPJzetGoXsasvMhsTO4DhyvHUVUilUTK/swSrthIWwzaXmaYvZVXrTqfmfOfzUcpwpNHd6/QoINmR
	Hw9Os0ey7I3IztZsW4I1p2LEB4Ot59liXxa+9dDuHafO0R7HgY4DoH0RZEuVnFK3UFSZ+msmVcA93
	0l6CWOkyvGB/7riwrn9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiTX-0000000DxE4-4AyU;
	Tue, 13 Oct 2026 19:47:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiTV-0000000DxCk-0GtV
	for opensbi@lists.infradead.org;
	Tue, 13 Oct 2026 19:47:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3xFa900121
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GOopc7jM8GKXP7vHT7jo9+38kXS0DniF5VrYooERDY=; b=IKVSjlCz6Fn+1Uww
	z9wxjRsq+EFAhNs9y8aZF2n1JYJBQGdzJ+czDQslRLZ3eDSAIqk6dTSzFAgWJ+Pc
	NvQkySz6YWHGBO1lDiAD5be6FZusga3pgnnyJ7Ff0I1qItzbbPRNsDhNSVmElwxU
	ULm8M36vWAVgHJJoUZJFOrvkDE8h0hHVB6pLgtO+V1Jpo8FpYKXEHhmcynMKg12n
	Ga06kMfNsCNGI92nwMrH6pK0B0aLFhmKE/SZlDilVLPSt+Zn+TwRJEAdq5kcZRin
	52QF/5TyDRoZUpC4iEugtBLoHjzdIASUwSAdAyKEzNVkzLxSo7gRyPqbCOr6btRc
	fU70FA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uk9f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:47:48 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6f508fd6f44so2310185eaf.0
        for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 12:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791920868; cv=none;
        d=google.com; s=arc-20260327;
        b=Vq86vxAQtOO3EqHO4IL61T+MInJyv+mjbvS2Br3iiMEqwa2E+nYf6ayB/S1uX58qV/
         g9CvON3tcKe+N1KlxuG7301wADMy7UxsDogXoY7SAYW8vzOkOSlRBQg67sxyh+SrgdNT
         EfC/pDfvjNPkzN1Pq8NKAjVNWMDXRC9rWA032dsb26GQFEh07pCFo+HS3zBY6EqZe8zK
         p2AqwDZlrMvjhvd5S6kP0g4A4wMLrPX7va54XxIbr4UAYKaJCSgZxqEfBe90Qzh3G46B
         ORWjkUtjeZ6FZo+lsF85LcO/dXIdsVB/iDW//0W5qqtPglzGzPxsMx8oTpBI8BzufH8a
         qQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+GOopc7jM8GKXP7vHT7jo9+38kXS0DniF5VrYooERDY=;
        fh=TmMrfdxDfssPWdDFPbAH7hjfIZ/b6pGiBrAKJbXdWwc=;
        b=mwuIgo5q/ebbiG9sZJ7ywuQKJaHaSBjpdyvGLMkaQTwpfEcoMozWNmhFpOgr3uPI+e
         WpXCo52MfOtvamxSLMHI3lJtteMxXXuGSRHsxzz5eHaskrKcmf2Wj+OB0Ce7DqUaRKRH
         x+Zee42+Ob/+aqBqJXAWY/CFPeM3AScnf8IrBfbL+qhnbkmC++9MS6Du2ASF6cbVQVex
         m5HVN1I75oWK6mxFR8IgarqzHcNqCmks3v2WxuRRACf+kS3fvikb5+xg09j5+7cKJ+A1
         B20f3BGidVWtVMI2oYTwWgXYTH3+jk4l5QNXqQOuAJ6gtNgyQENwrKxyjnGP5XXtpVi2
         f8Cg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791920867; x=1792525667; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GOopc7jM8GKXP7vHT7jo9+38kXS0DniF5VrYooERDY=;
        b=AJaMccx7v7t3XICIfLbp99A1/2XMYUa4Ncam5t4avUtA8JAG0Z+ckkNHzJUrNGFojo
         Ygqdn+JchH2UQTfYHybuxm7awu/4daD9mjAkPPYfUWypynhKaYnvn1GOWMmYNRlNjrCf
         F75qfGGgBro7uqvMXFr3Hsp97hoEiQdV7mkXYrJ/IHFC/fZSkUhfwI/9zCWl5qJs0oth
         +ChFU0jhMjMa5LiGTDzMmmKsQTTIPFyneSmgegOJFi9HRPIHZTJH2EUWM2SZ0wjz0eb7
         tQ4zLetDnt1MVhVl5WyXa+b++a+8t6Xn9k8yi7+gQXNWzxCmtdHr7X1SYJlCRzlZDRuM
         Ky9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920868; x=1792525668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GOopc7jM8GKXP7vHT7jo9+38kXS0DniF5VrYooERDY=;
        b=NkYFP/97am9l0MWZGkZCsKBhedL9p5ydaiAachgA5SKgI0J+yh2Mz8SMaQCWounj21
         GQQNy9PxSRgtxbj4tQqVpC0jFbbyi54AgVCI28i6DaGmUHB3iBzOzcklYUWvuLjqcUrm
         9Z58wYpvrrcdP3qONNN+P6IwnBCMJUM1ZG+eb3NTS1xpcxe+CVGxEvGXJfKwY0S2cwB6
         fa+qvdUzlAvW3ZiDMLB0jt7rXOjG94oJiPAksbR4l+QaXBRR9wSuv67tkrydJ/shq8B7
         5fMiLKEWOs8cvix1cMihYdUdwDIyr4df9NNJyzsC2rbApVB/QCS4mLIjjSlgBOdO3H5k
         rIHw==
X-Forwarded-Encrypted: i=1; AKwUvByBQuC2exHO3TKN91F46J22rKpLfTjiQFNfdmJHyvW3wwwSh1YkTT4nmUzXGB3eUrnUHpcWyLrr@lists.infradead.org
X-Gm-Message-State: AFq9FYLLlON2O0R5MkhvEzxbbpnmgRI5MtAJNUmoRXz6yw6ncT6dCljo
	jpBSIqFnzZSYbJhWALZ4SIjTG7gRzHowKSutzIplOZVk+HwI56l43tXGkaFIdTLCVtZCGXp4oXJ
	aAr6VeW3toRbJCKids5AYZ4N2sUcqVJ0KuEtMJAh1aefXOWZYr+ygWwbXh7eKcb/D/v9EVT1x4N
	PG3K+TXa2EUAWN7f6P6+9kUatm0PA9Z3LaRA4JrORn
X-Gm-Gg: AYBFou1Uw3j837bGogV0sAb9+omja/ljFu8aVEte7bPcFHOdSpz0kO/80QgaTf6T1pS
	3LQSN/kZkRptnd8K/5tynefA8m/mSQCQHBeZERnT+6iUOitshvUeWutM/C9tKg15//A4M5nsqqJ
	OfuXQ8nPBHeUSDinHL65TMOpV0kf7q1yXZKWTap/YEC69IlkcsWjY6Jzpegbg=
X-Received: by 2002:a05:6820:f030:b0:6f8:ab9c:344b with SMTP id 006d021491bc7-6f8ab9c355cmr3448253eaf.28.1791920867580;
        Tue, 13 Oct 2026 12:47:47 -0700 (PDT)
X-Received: by 2002:a05:6820:f030:b0:6f8:ab9c:344b with SMTP id
 006d021491bc7-6f8ab9c355cmr3448229eaf.28.1791920867178; Tue, 13 Oct 2026
 12:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com> <20260923032359.4041876-10-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260923032359.4041876-10-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:47:35 -0700
X-Gm-Features: AclHuK9QH9ldBf6hsv_l9p-aKyaT50x2CBHlUq1KU05CT2OYLjRQ3I76aR8X04w
Message-ID: <CAAVgOkJ3LMB-+ePt0zBQDicFqg=sTCtKTYsx7Oq-7QA0tcLw+g@mail.gmail.com>
Subject: Re: [PATCH 09/11] lib: utils/mpxy: Add domain parameter to
 setup_group() callback
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX3etDvaiB2y/o
 TCSzq2p6zK94ixO+SIxe4U7HsPMwOaL0ODRT/wq31n7djTEMF7cOcq01yhGqCFXuco963V/h8d2
 c0R/ZFq58Olm+VCFLD8HwZP7Xmq0Ktk+BD5Axvu3oknYKnjIKN7ce+mY015c0U8u4zpNBQmjCGT
 Un3GKZ1IdDzC4TwsSxJJTFqqOMeGeCRWm4LTx79s5dbZilkBkrD4i8xkdYV2ExrAT3W7y7jWfBW
 H1je3tKrhCtdt6Nf9GdvLUQdOPn2BnW9N/aU6Dg7bnJU7zMcLXR2H4GkVjNyXaIbs4KQ9T9Jt+2
 f5jTyO+5TXxbiMID+TWVm2mwLUf2IzqY4/BxRbSOLEZvr4dj6xHlpQ70eiJqCefVEBN9bUrKyuz
 omOwjnStjoHVRwwQAN2apI8BSt2SbTe44j2R4prhJQxnLvXOGqJix5nPW7jeKUyWDG9BzoAerh6
 xZCyL9Z4rft2MJ1OiKQ==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace8ae4 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=LxSat3AEFAdCe8hibfAA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: V4U6U2XBic68YG4jF3Ab9LW4etEAau5O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX5YMc4PAm1S4L
 glxNUjrH1APT5ZSUsPuVU+PwLgNYoZwXLEQJtySKNrRs8LQu6AL8DmfKq63n90QzwS2rSAiB7ae
 o8mFIG+H/YL6psp9nn6WTCPOfZPQaqM=
X-Proofpoint-GUID: V4U6U2XBic68YG4jF3Ab9LW4etEAau5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_124749_114477_0D23DA55 
X-CRM114-Status: GOOD (  22.08  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgODoyNOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgTVBYWSBjaGFubmVscyBjYW4gYmUgZG9t
YWluIHNwZWNpZmljIHNvIHRoZSBzZXR1cF9ncm91cCgpIGNhbGxiYWNrCj4gbXVzdCBrbm93IHdo
aWNoIGRvbWFpbiB0aGUgTVBYWSBSUE1JIGluc3RhbmNlIGlzIGFzc29jaWF0ZWQgd2l0aC4KPgo+
IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4K
PiAtLS0KPiAgaW5jbHVkZS9zYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmggfCAxICsKPiAg
bGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5jICAgICAgICAgfCAyICstCj4gIGxpYi91dGls
cy9tcHh5L2ZkdF9tcHh5X3JwbWlfbW0uYyAgICAgIHwgNiArKystLS0KPiAgbGliL3V0aWxzL21w
eHkvZmR0X21weHlfcnBtaV9zeXNtc2kuYyAgfCAxICsKPiAgNCBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmlf
dXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmggYi9pbmNsdWRlL3NiaV91dGlscy9tcHh5L2ZkdF9t
cHh5X3JwbWkuaAo+IGluZGV4IGFlN2U1MzdhLi43MTkzYTVmZSAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL3NiaV91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuaAo+ICsrKyBiL2luY2x1ZGUvc2JpX3V0
aWxzL21weHkvZmR0X21weHlfcnBtaS5oCj4gQEAgLTQxLDYgKzQxLDcgQEAgc3RydWN0IG1weHlf
cnBtaV9kYXRhIHsKPgo+ICAgICAgICAgLyoqIFNldHVwIFJQTUkgc2VydmljZSBncm91cCBjb250
ZXh0IGZvciBNUFhZICovCj4gICAgICAgICBpbnQgKCpzZXR1cF9ncm91cCkodm9pZCAqKmNvbnRl
eHQsIHN0cnVjdCBtYm94X2NoYW4gKmNoYW4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHNiaV9kb21haW4gKmRvbSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgbXB4eV9ycG1pX2RhdGEgKmRhdGEpOwo+Cj4gICAgICAgICAvKiogQ2xlYW51cCBS
UE1JIHNlcnZpY2UgZ3JvdXAgY29udGV4dCBmb3IgTVBYWSAqLwo+IGRpZmYgLS1naXQgYS9saWIv
dXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmMgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1p
LmMKPiBpbmRleCBjMDQ5M2VjYi4uNjlmZDYwOGEgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL21w
eHkvZmR0X21weHlfcnBtaS5jCj4gKysrIGIvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5j
Cj4gQEAgLTI4Niw3ICsyODYsNyBAQCBzdGF0aWMgaW50IF9fbXB4eV9ycG1pX2luaXQoY29uc3Qg
c3RydWN0IG1weHlfcnBtaV9kYXRhICpkYXRhLAo+Cj4gICAgICAgICAvKiBTZXR1cCBSUE1JIHNl
cnZpY2UgZ3JvdXAgY29udGV4dCAqLwo+ICAgICAgICAgaWYgKGRhdGEtPnNldHVwX2dyb3VwKSB7
Cj4gLSAgICAgICAgICAgICAgIHJjID0gZGF0YS0+c2V0dXBfZ3JvdXAoJnJtYi0+Z3JvdXBfY29u
dGV4dCwgY2hhbiwgZGF0YSk7Cj4gKyAgICAgICAgICAgICAgIHJjID0gZGF0YS0+c2V0dXBfZ3Jv
dXAoJnJtYi0+Z3JvdXBfY29udGV4dCwgY2hhbiwgZG9tLCBkYXRhKTsKPiAgICAgICAgICAgICAg
ICAgaWYgKHJjKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZmFpbF9mcmVlX2NsaWVu
dDsKPiAgICAgICAgIH0KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBt
aV9tbS5jIGIvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9tbS5jCj4gaW5kZXggMDI2M2Ex
MDUuLjU3ZTY3MDdlIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlf
bW0uYwo+ICsrKyBiL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfbW0uYwo+IEBAIC0zOSw2
ICszOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgbXB4eV9ycG1pX3NlcnZpY2VfZGF0YSBtbV9zcnZjZGF0
YVtdID0gewo+ICB9Owo+Cj4gIHN0YXRpYyBpbnQgbXB4eV9ycG1pX21tX3NldHVwKHZvaWQgKipj
b250ZXh0LCBzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20sCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3Qgc3RydWN0IG1weHlfcnBtaV9kYXRhICpkYXRhKQo+ICB7Cj4gICAgICAgICB1
bnNpZ25lZCBsb25nIG1tX3JlZ2lvbl9hZGRyID0gMDsKPiBAQCAtNjMsOSArNjQsOCBAQCBzdGF0
aWMgaW50IG1weHlfcnBtaV9tbV9zZXR1cCh2b2lkICoqY29udGV4dCwgc3RydWN0IG1ib3hfY2hh
biAqY2hhbiwKPiAgICAgICAgIG1tX3JlZ2lvbl9zaXplID0gcnNwLm1tYS5zaG1lbV9zaXplOwo+
ICAgICAgICAgbW1fcmVnaW9uX2ZsYWdzID0gU0JJX0RPTUFJTl9NRU1SRUdJT05fU0hBUkVEX1NV
UldfTVJXOwo+Cj4gLSAgICAgICByYyA9IHNiaV9kb21haW5fcm9vdF9hZGRfbWVtcmFuZ2UobW1f
cmVnaW9uX2FkZHIsIG1tX3JlZ2lvbl9zaXplLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFBBR0VfU0laRSwgbW1fcmVnaW9uX2ZsYWdzKTsKPiAtICAgICAgIHJl
dHVybiByYzsKPiArICAgICAgIHJldHVybiBzYmlfZG9tYWluX2FkZF9tZW1yYW5nZShkb20sIG1t
X3JlZ2lvbl9hZGRyLCBtbV9yZWdpb25fc2l6ZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBQQUdFX1NJWkUsIG1tX3JlZ2lvbl9mbGFncyk7Cj4gIH0KPgo+ICBzdGF0
aWMgaW50IG1weHlfcnBtaV9tbV94ZmVyKHZvaWQgKmNvbnRleHQsIHN0cnVjdCBtYm94X2NoYW4g
KmNoYW4sCj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfc3lzbXNp
LmMgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3N5c21zaS5jCj4gaW5kZXggZjdjM2Mz
ZGIuLjYyNjhhNDM3IDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlf
c3lzbXNpLmMKPiArKysgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3N5c21zaS5jCj4g
QEAgLTg1LDYgKzg1LDcgQEAgc3RhdGljIHZvaWQgbXB4eV9ycG1pX3N5c21zaV9jbGVhbnVwKHZv
aWQgKmNvbnRleHQpCj4gIH0KPgo+ICBzdGF0aWMgaW50IG1weHlfcnBtaV9zeXNtc2lfc2V0dXAo
dm9pZCAqKmNvbnRleHQsIHN0cnVjdCBtYm94X2NoYW4gKmNoYW4sCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20sCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBtcHh5X3JwbWlfZGF0YSAqZGF0YSkK
PiAgewo+ICAgICAgICAgc3RydWN0IHJwbWlfc3lzbXNpX2dldF9tc2lfYXR0cmlidXRlc19yZXNw
IGdtYXJlc3A7Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+
IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBh
d2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KVGVzdGVkLWJ5OiBQYXdhbmRlZXAgT3phIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
