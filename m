Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51316C982FA
	for <opensbi@archiver.kernel.org>; Tue, 22 Sep 2026 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hx54AFKeoYCufvDIoniYovR/90//Jqu8QRyKfBkdUzU=; b=O096XNgj5Ibmiq
	/7ZkdyeasJJzArSAS9ZHaeMQUHaT9ruVmOvXckegvGA9epXXCtesLZhghafQhsa+4ZPrM62Js0lb3
	o5U9LSK4tIaMd5klo0zpqnOjmCyP0f+dxNKfbAeiyaVPDlNVvDffCiqnxdMIwI+/H8LzLY/zpH0p3
	OC+C1C3N7q5Ybj+hUBJqJCd4TNGSQxnXNb5TeG6UdH57+TW5/CXxwaj7QuD721g0r6sioQjWBscyn
	XgL17cffZRCEWejUs+AOOVKW+iauT654qjoahp79q3FUuN8h0ID97ZWhyS1XkizvTEpy0GtGDQPea
	iaGlG8Y7doCfAJvkuzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vT9-00000004bZL-1bro;
	Tue, 22 Sep 2026 08:03:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vT5-00000004bXp-3KxA
	for opensbi@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nHql2d4yL/gem3svcs18VJpCGr6Z6BcJHFk0ZBmE3kM=; b=LW2xOM+9ZTw48oI6VKktMZK7XQ
	KysMktWjA11ueUPwqUVHM6HPb2eiUvuhOOCdxYtQ/aEENGHx98KTMzOgriG/sod0KjQFxdfKhTzxH
	OkhOJ2KnOhKdQDUm9JCEHESshKBsQImH0FFpQrE14TnhWaL8dRK940oKhQjA9LYmRf4gU9CKSrKK+
	Kt89uG1bNKdeBSRkQKqHZxniXgDwfeeynyxAL66/Q6QcOzO61KZz1DzSTD7aPYt8U8kKV0EBmTHjO
	WOkZXoNaWYNvdi5JgxcseRck1i9sWCsx8+F5fYYJ1Fm8F40KzuH2BhWRduGOE5gn4eSJZB1Fy+J9K
	3S8mNZeQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8vT0-0000000DExZ-3ljv
	for opensbi@lists.infradead.org;
	Tue, 22 Sep 2026 08:03:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2sR5X3675300
	for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 08:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHql2d4yL/gem3svcs18VJpCGr6Z6BcJHFk0ZBmE3kM=; b=kE9mTXhxbHuikt6e
	VgMa66yp8KvGrWhgzAjo3CXkje0CFOiHFl5+4QWy7taqzD71D0TlNGpk3xXT0lHS
	xXjFiolzpmiVwmO376ln5jgNqj+OsOPMc3JJRIneZXTE2oNAbe2U69DcglNOGvbE
	943tRhb3Tbp6f0ubFiLp6PKWn8QzezATyhp01oiwsj1H+YLg0LYcAuhCZVR/FJ6v
	cmsCqOzmQpds8jVrGeLV2qlphzH3K0jAIK6Hb17dCWnEtU9cxrdgnH0TBAJ3Qhgs
	CMfbNmfYHjea/q6P1zwzEEZUlJTQkJMeC/n/TSgvu4XfOQKS0g/NAvEUxoeeGlZN
	UBWD8w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5s3vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 08:03:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so54761365ad.3
        for <opensbi@lists.infradead.org>; Tue, 22 Sep 2026 01:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790064182; cv=none;
        d=google.com; s=arc-20260327;
        b=FTrm0lJKUzCTXawaYZm+1WXyd6kBGGxERejDHj6TMO8yvtN/CMoinPzcr2BFOx07c6
         MX+JqkJZZednJ1hL3gszia/IDv944Oo79i4pOZVSVO4rh9aVcZg4H91HO11YCmE6bqDg
         KT+D/iMjTUmGiO6S4lJCyYet3n+iEsHNUDdUUPL5ojex7Wlf1LIF8IDTEeQFiejP/tL9
         9sA5zygvD4JBnvqrIHk7aDHq8ywhHC4FU4p1jj5ulPdn3DFNw+6kJtBJ1f8QMeS4OeA/
         vuTZHQZMRu52D2v2Ck4cBAwfRs9+Ya1JZiF5ssU+QhQsLvZYYBkJNVmEafu89NJ0b02D
         pv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nHql2d4yL/gem3svcs18VJpCGr6Z6BcJHFk0ZBmE3kM=;
        fh=4iwF7ic2TRKRyZKQ0F/rMtdoAV3AbkN5ZtSvCXJtTcs=;
        b=UnN/8LzgEyVeBGMRvrVU2BikT2AOj5PpOeNAHinzcOQ4YDm3U5YnB1VjGY7SdgfCE5
         nTLqzEACKRqQgSBd6P6cHa5Lg6k6p/DL+gWpM1MmeexxEhLJRY3722632uKaFjx/7dFb
         Z+Ef5Qx8SxZ/2oti4GtvpwPAk+kO+d0Q9BHKWuqhtgGRx9J5Ztuk232dnUipbqZrxtoa
         rPdoy3rpyY1QpRgLjMnkqjor0zqkteqfqrzZ6HOIE8DfuqzUxP9/46HAxA+XuEkKSwZ3
         XFk43SCbfQurTNyKluSM2w3YxJUWHIXZSPTrgutIvGGK8OK+OlCBu20N6eFHl88ZSJkt
         Oc/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790064182; x=1790668982; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHql2d4yL/gem3svcs18VJpCGr6Z6BcJHFk0ZBmE3kM=;
        b=Z1tPvdfE2vg38LWDSMUPlwwmdodVMYE8L+0YbFBPUS6ylsfhhGhK7EuGDnm9hzAKjs
         unCJmMRU9Gk18mYNpxcuNL1sx4KQmJGLUBiM18+JLQSTbc66yb0IxJLFNblnqI1Uqkkm
         joIFRmRf2ycybIMG2x0drqn6Y3M2QVmQU6TA2Hml2Vkf7MprcCC8QWDNU0/uLKgOoIb+
         KF8ZMpOXkInFIFQewXlcovkUyU+QOzCOTpAFqw4q2tcYKUuN0lKszGQ6+vy+XtJyt1lY
         esheTscvCQ88hguue0vnn2pPxnGqIzZSuYQr++HYq5VM83orr0ZfgeMP6gWkuSkmQaX3
         Yv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064182; x=1790668982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHql2d4yL/gem3svcs18VJpCGr6Z6BcJHFk0ZBmE3kM=;
        b=YLM+v7ffNkpyKXq9Wc9sfYhNhBql+jJX/x7KIWVxC+fnuSJset+mw2vr02kZ4bPQBl
         seBm0CaACkHPpTp7ez5kQX9874HBgf/0Lta63x/7wEZkJblOwiQ80ozSgJJX1oKUeZ4h
         rDF5TMFGofzeteENZ9RH90J3Qe0qCWezaxs3ER5PGP3jlUJF6fegbt+J16ph0+qxRxU3
         ZBCPtA5vE5FQ8FGepXpPeY29vMCgD/btNNiXdedeALA1xKlKCrVT0K+y+upCfB2/3MiH
         bGJd5wfdObuk+u582RMclMpSuJUnvf0MMuod2QjLqOvS2PDLF0gXMXpSfj4/rdyU16Fv
         1+yg==
X-Gm-Message-State: AFuF++n/7jB79BbCo72CqjjrQCsGzIp/n3BL0xBMexFuXj5NaMAOU3wM
	ByH7QuIg12XEkF5/K+miQEAFKN4YBsKRWfMRgrqsDPC0cyIKxBUWboHsTeNJQxgPFpOX0TpRHO7
	shqKXKUadaXatAqeLRaHUqBUQQJHy+AYI7DXFu31C0CZq8EhMccXYbLyI5oEblYBspRE5wiGRmg
	itrXmI/W4WE8tQEBbS0VmdmEuphO+Qu0GC9mCnC26S
X-Gm-Gg: AYBFou3ayNzOt+weR4jJhPSD5AsSkW+oOIB0yHntvTqAeVWGrlMf8OYq/az2An5CUDt
	/Cx3J6psLXI2AFxqWXlpUjm4SAQj5N7+KPrSsP70v6LvtcvRg2obJ0dHd3F2oy4bZwOPxR/QzJ/
	Ibbb+4VFjQcIL8Cg/UpGwbrT4T9IqyBucwk63sDyWBIR5R1minJqrMUMK7hSY=
X-Received: by 2002:a17:902:f550:b0:2da:e967:7953 with SMTP id d9443c01a7336-2df609a91b1mr3666695ad.12.1790064181893;
        Tue, 22 Sep 2026 01:03:01 -0700 (PDT)
X-Received: by 2002:a17:902:f550:b0:2da:e967:7953 with SMTP id
 d9443c01a7336-2df609a91b1mr3666305ad.12.1790064181414; Tue, 22 Sep 2026
 01:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com> <20260918030955.3902993-2-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260918030955.3902993-2-rahul.pathak@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 13:32:49 +0530
X-Gm-Features: AcwNN1UWCfN3-m_A7imvqf_h7WF4_sUIY7PeHILo8hdfl60xiAwKGliznOrDrMI
Message-ID: <CABBgwmvkdGoiZSWVhXqwzsWTLy4veQUn1xLYC_tthx6BTEsC=w@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/4] lib: sbi_domain: Add domain register finalize notifier
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul.pathak@oss.qualcomm,
        rahul@summations.net
X-Proofpoint-GUID: bneOwZxadfPIF8I_0TuqYWnIZ15vMuC2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExNCBTYWx0ZWRfXxpq9iQKJBK6S
 IDZgz/+Tkz89sKF+wHT8FDboIKAp+3DHDAKNS0uc75CG7c2wAIQygf7zIsFge/FVaYps8QoTGA3
 1+kFFYC8Vnza3U7PreYlXAk33X/ex5M=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab23637 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=UehlXk_4YzKFVNiV-FsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: bneOwZxadfPIF8I_0TuqYWnIZ15vMuC2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExNCBTYWx0ZWRfX4s4xcxBpnMX6
 SnLZtvgawI7f5FtCF0xsjLCRpjeeKfzvGQ1Q16Ry2KNsI2Q4rvHCZXmSoEv5iGJRv25kHBjQXqU
 2fiavmIaXz807g0r+y0KhiJZN2ibz+yvjcQvEVhJ9DqJ9aLD6YjPHBGSm+sQJE12Uy8OimSZpp4
 EscCeJD1tPc+RYmLE/NtcS1mozcG7MAc2O/7cy2b7IfNF8eW17USOe8ooso2qcuFjZSzkUa1dMq
 2WdJA6KL9jEX0YHQabI6IF01003P6+FBUSKqPIeoAezF9t+AOg+efU1L1yLCzqI3KTsYvQ0neVV
 3eI4SJaCNbuA74DzWzFTexrXS5hbCmRUVlKg6JPvO+UU6oDuNVs1xZ3EEjcVBHi02lqdziB7CmM
 RHu7XjZfo5mYdfadnRKPZ87KSEzEkoYL5dXSNljtr8Iw5KeMEodWNcjBNVIL7Gb+UyZnMxLuxwK
 De4ZAcjpJq808+Fmb6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090307_452688_34F53321 
X-CRM114-Status: GOOD (  28.58  )
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

T24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgOTowOOKAr0FNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gc2JpIGRvbWFpbiByZWdpc3RlcmF0aW9u
IG5vdGlmaWVyIGlzIGludm9rZWQgd2hlbgo+IG1lbW9yeSByZWdpb25zIG9mIHRoZSBkb21haW5z
IGFyZSBub3QgZmluYWxpemVkLiBUaGUgcm9vdAo+IGRvbWFpbiBpcyByZWdpc3RlcmVkIGVhcmx5
IGFuZCB0aGUgZHJpdmVycyBrZWVwIGFkZGluZwo+IHRoZSByZWdpb25zIHVudGlsIHNiaV9kb21h
aW5fZmluYWxpemUoKSBpcyBjYWxsZWQuIFN1Y2ggcmVnaW9ucwo+IGFyZSBhZGRlZCB0byB0aGUg
cm9vdCBhZnRlciByb290IGRvbWFpbiBpcyBhbHJlYWR5IHJlZ2lzdGVyZWQKPiBhbmQgbm90aWZp
Y2F0aW9uIGZvciB0aGF0IGhhcyBhbHJlYWR5IGJlZW4gc2VudC4KPgo+IFBlci1kb21haW4gY29u
ZmlndXJhdGlvbiB3aGljaCBpcyBiYXNlZCBvbiB0aGUgZmluYWwgbWVtb3J5Cj4gcmVnaW9ucyBv
ZiB0aGUgZG9tYWlucyBlc3BlY2lhbGx5IHRoZSByb290IGRvbWFpbiBpcyBub3QKPiBwb3NzaWJs
ZSBvbmx5IHdpdGggYSBkb21haW4gcmVnaXN0ZXIgbm90aWZpZXIuCj4KPiBBZGQgYSBkb21haW4g
ZmluYWxpemUgbm90aWZpZXIgZm9yIHN1Y2ggY2FzZSB3aGljaCBpcyBjYWxsZWQKPiBmb3IgZXZl
cnkgZG9tYWluIG9uY2UgYWxsIHRoZSBkb21haW5zIGFyZSBhbHJlYWR5IHJlZ2lzdGVyZWQgYW5k
Cj4gdGhlaXIgbWVtb3J5IHJlZ2lvbnMgYXJlIGZpbmFsaXplZC4KPgo+IFNpZ25lZC1vZmYtYnk6
IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFrQG9zcy5xdWFsY29tbS5jb20+CgpDbGVhcmx5LCBN
UFQgdGFibGUgaXMgcGVyLWRvbWFpbiBzdGF0ZSBzbyB3aHkgbm90IHVzZSBzYmlfZG9tYWluX3N0
YXRlCmZvciB0aGlzID8/CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlf
ZG9tYWluLmggfCAxNiArKysrKysrKwo+ICBsaWIvc2JpL3NiaV9kb21haW4uYyAgICAgfCA4MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgOTYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9kb21h
aW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+IGluZGV4IDM5ZTZmYzgxLi5hOTZkNzA5
ZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiArKysgYi9pbmNsdWRl
L3NiaS9zYmlfZG9tYWluLmgKPiBAQCAtMzYyLDEwICszNjIsMjYgQEAgaW50IHNiaV9kb21haW5f
aW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsIHUzMiBjb2xkX2hhcnRpZCk7Cj4gIHR5
cGVkZWYgdm9pZCAoKnNiaV9kb21haW5fbm90aWZpZXJfZm4pKGNvbnN0IHN0cnVjdCBzYmlfZG9t
YWluICpkb20sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAq
cHJpdik7Cj4KPiArLyoqCj4gKyAqIERvbWFpbiBmaW5hbGl6ZSBub3RpZmllciBjYWxsYmFjawo+
ICsgKgo+ICsgKiBJbnZva2VkIGZyb20gc2JpX2RvbWFpbl9maW5hbGl6ZSAgZnVuY3Rpb24gYWZ0
ZXIgZXZlcnkgZG9tYWluIGdldHMKPiArICogcmVnaXN0ZXJlZCBhbmQgbWVtb3J5IHJlZ2lvbnMg
b2YgYWxsIGRvbWFpbnMgYXJlIGZpbmFsaXplZC4KPiArICovCj4gK3R5cGVkZWYgaW50ICgqc2Jp
X2RvbWFpbl9maW5hbGl6ZV9ub3RpZmllcl9mbikoc3RydWN0IHNiaV9kb21haW4gKmRvbSwgdm9p
ZCAqcHJpdik7Cj4gKwo+ICAvKiogUmVnaXRzZXIgZG9tYWluIG5vdGlmaWVyICovCj4gIGludCBz
YmlfZG9tYWluX3JlZ2lzdGVyX25vdGlmaWVyKHNiaV9kb21haW5fbm90aWZpZXJfZm4gbm90aWZp
ZXIsIHZvaWQgKnByaXYpOwo+Cj4gIC8qKiBVbnJlZ2l0c2VyIGRvbWFpbiBub3RpZmllciAqLwo+
ICBpbnQgc2JpX2RvbWFpbl91bnJlZ2lzdGVyX25vdGlmaWVyKHNiaV9kb21haW5fbm90aWZpZXJf
Zm4gbm90aWZpZXIsIHZvaWQgKnByaXYpOwo+Cj4gKy8qKiBSZWdpc3RlciBkb21haW4gZmluYWxp
emUgbm90aWZpZXIgKi8KPiAraW50IHNiaV9kb21haW5fcmVnaXN0ZXJfZmluYWxpemVfbm90aWZp
ZXIoc2JpX2RvbWFpbl9maW5hbGl6ZV9ub3RpZmllcl9mbiBub3RpZmllciwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpwcml2KTsKPiArCj4gKy8qKiBV
bnJlZ2lzdGVyIGRvbWFpbiBmaW5hbGl6ZSBub3RpZmllciAqLwo+ICtpbnQgc2JpX2RvbWFpbl91
bnJlZ2lzdGVyX2ZpbmFsaXplX25vdGlmaWVyKHNiaV9kb21haW5fZmluYWxpemVfbm90aWZpZXJf
Zm4gbm90aWZpZXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB2b2lkICpwcml2KTsKPiArCj4gICNlbmRpZgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9k
b21haW4uYyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4gaW5kZXggYzA1ODNlZmMuLjkxM2Y4MTQy
IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4gKysrIGIvbGliL3NiaS9zYmlf
ZG9tYWluLmMKPiBAQCAtNDIsOCArNDIsMTUgQEAgc3RydWN0IHNiaV9kb21haW5fbm90aWZpZXJf
ZW50cnkgewo+ICB9Owo+Cj4KPiArc3RydWN0IHNiaV9kb21haW5fZmluYWxpemVfbm90aWZpZXJf
ZW50cnkgewo+ICsgICAgICAgc3RydWN0IHNiaV9kbGlzdCAgICAgICAgICAgICAgICAgICAgICAg
IG5vZGU7Cj4gKyAgICAgICBzYmlfZG9tYWluX2ZpbmFsaXplX25vdGlmaWVyX2ZuICAgICAgICAg
Zm47Cj4gKyAgICAgICB2b2lkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKnBy
aXY7Cj4gK307Cj4gKwo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBkb21haW5faGFydF9wdHJfb2Zm
c2V0Owo+ICBzdGF0aWMgU0JJX0xJU1RfSEVBRChkb21haW5fbm90aWZpZXJfbGlzdCk7Cj4gK3N0
YXRpYyBTQklfTElTVF9IRUFEKGRvbWFpbl9maW5hbGl6ZV9ub3RpZmllcl9saXN0KTsKPgo+ICBp
bnQgc2JpX2RvbWFpbl9yZWdpc3Rlcl9ub3RpZmllcihzYmlfZG9tYWluX25vdGlmaWVyX2ZuIG5v
dGlmaWVyLCB2b2lkICpwcml2KQo+ICB7Cj4gQEAgLTk1LDYgKzEwMiw2NyBAQCB2b2lkIHNiaV9k
b21haW5fbm90aWZ5X2FsbChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKQo+ICAgICAgICAg
fQo+ICB9Cj4KPiAraW50IHNiaV9kb21haW5fcmVnaXN0ZXJfZmluYWxpemVfbm90aWZpZXIoc2Jp
X2RvbWFpbl9maW5hbGl6ZV9ub3RpZmllcl9mbiBub3RpZmllciwgdm9pZCAqcHJpdikKPiArewo+
ICsgICAgICAgc3RydWN0IHNiaV9kb21haW5fZmluYWxpemVfbm90aWZpZXJfZW50cnkgKmVudHJ5
Owo+ICsKPiArICAgICAgIGlmICghbm90aWZpZXIpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBT
QklfRUlOVkFMOwo+ICsKPiArICAgICAgIHNiaV9saXN0X2Zvcl9lYWNoX2VudHJ5KGVudHJ5LCAm
ZG9tYWluX2ZpbmFsaXplX25vdGlmaWVyX2xpc3QsIG5vZGUpIHsKPiArICAgICAgICAgICAgICAg
aWYgKGVudHJ5LT5mbiA9PSBub3RpZmllciAmJiBlbnRyeS0+cHJpdiA9PSBwcml2KQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfT0s7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAg
ICAgZW50cnkgPSBzYmlfemFsbG9jKHNpemVvZigqZW50cnkpKTsKPiArICAgICAgIGlmICghZW50
cnkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5PTUVNOwo+ICsKPiArICAgICAgIGVu
dHJ5LT5mbiA9IG5vdGlmaWVyOwo+ICsgICAgICAgZW50cnktPnByaXYgPSBwcml2Owo+ICsgICAg
ICAgc2JpX2xpc3RfYWRkX3RhaWwoJmVudHJ5LT5ub2RlLCAmZG9tYWluX2ZpbmFsaXplX25vdGlm
aWVyX2xpc3QpOwo+ICsKPiArICAgICAgIHJldHVybiBTQklfT0s7Cj4gK30KPiArCj4gK2ludCBz
YmlfZG9tYWluX3VucmVnaXN0ZXJfZmluYWxpemVfbm90aWZpZXIoc2JpX2RvbWFpbl9maW5hbGl6
ZV9ub3RpZmllcl9mbiBub3RpZmllciwgdm9pZCAqcHJpdikKPiArewo+ICsgICAgICAgc3RydWN0
IHNiaV9kb21haW5fZmluYWxpemVfbm90aWZpZXJfZW50cnkgKmVudHJ5LCAqdG1wOwo+ICsKPiAr
ICAgICAgIGlmICghbm90aWZpZXIpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFM
Owo+ICsKPiArICAgICAgIHNiaV9saXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZW50cnksIHRtcCwg
JmRvbWFpbl9maW5hbGl6ZV9ub3RpZmllcl9saXN0LCBub2RlKSB7Cj4gKyAgICAgICAgICAgICAg
IGlmIChlbnRyeS0+Zm4gPT0gbm90aWZpZXIgJiYgZW50cnktPnByaXYgPT0gcHJpdikgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHNiaV9saXN0X2RlbCgmZW50cnktPm5vZGUpOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHNiaV9mcmVlKGVudHJ5KTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gU0JJX09LOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+
ICsgICAgICAgcmV0dXJuIFNCSV9FTk9ERVY7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgc2JpX2Rv
bWFpbl9ub3RpZnlfZmluYWxpemVfYWxsKHZvaWQpCj4gK3sKPiArICAgICAgIHN0cnVjdCBzYmlf
ZG9tYWluX2ZpbmFsaXplX25vdGlmaWVyX2VudHJ5ICplbnRyeTsKPiArICAgICAgIHN0cnVjdCBz
YmlfZG9tYWluICpkb207Cj4gKyAgICAgICBpbnQgcmM7Cj4gKwo+ICsgICAgICAgc2JpX2xpc3Rf
Zm9yX2VhY2hfZW50cnkoZW50cnksICZkb21haW5fZmluYWxpemVfbm90aWZpZXJfbGlzdCwgbm9k
ZSkgewo+ICsgICAgICAgICAgICAgICBpZiAoIWVudHJ5LT5mbikKPiArICAgICAgICAgICAgICAg
ICAgICAgICBjb250aW51ZTsKPiArCj4gKyAgICAgICAgICAgICAgIHNiaV9kb21haW5fZm9yX2Vh
Y2goZG9tKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmMgPSBlbnRyeS0+Zm4oZG9tLCBl
bnRyeS0+cHJpdik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJjKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICsgICAgICAgICAgICAgICB9Cj4g
KyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0cnVjdCBzYmlf
ZG9tYWluICpzYmlfaGFydGluZGV4X3RvX2RvbWFpbih1MzIgaGFydGluZGV4KQo+ICB7Cj4gICAg
ICAgICBzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2g7Cj4gQEAgLTkyNCw2ICs5OTIsMTggQEAg
aW50IHNiaV9kb21haW5fZmluYWxpemUoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICAg
ICAgICAgICovCj4gICAgICAgICBkb21haW5fZmluYWxpemVkID0gdHJ1ZTsKPgo+ICsgICAgICAg
LyoKPiArICAgICAgICAqIEFsbCBkb21haW5zIGFyZSByZWdpc3RlcmVkIGFuZCB0aGVpciBtZW1v
cnkgcmVnaW9ucyBhcmUgZmluYWwKPiArICAgICAgICAqIHNvIG5vdGlmeSB0aGUgc3Vic3lzdGVt
cyB3aGljaCBkZXJpdmUgcGVyLWRvbWFpbiBjb25maWd1cmF0aW9uCj4gKyAgICAgICAgKiBmcm9t
IHRoZSBkb21haW4gbWVtb3J5IHJlZ2lvbnMuCj4gKyAgICAgICAgKi8KPiArICAgICAgIHJjID0g
c2JpX2RvbWFpbl9ub3RpZnlfZmluYWxpemVfYWxsKCk7Cj4gKyAgICAgICBpZiAocmMpIHsKPiAr
ICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGRvbWFpbiBmaW5hbGl6ZSBub3RpZmllciBm
YWlsZWQgKGVycm9yICVkKVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNf
XywgcmMpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKyAgICAgICB9Cj4gKwo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC0tCj4gMi41My4wCj4KPgo+IC0tCj4gb3BlbnNiaSBt
YWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
