Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79E4C531D0
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0+H7I3lBgzs1xELBFoF3+u5Xr45ipc8KlLEU3sdyGU=; b=OSWVljyWnJTxEu
	yqi7bdne+VUyFQeAHy/vKfAoLVb+mo38DlarmCnouACeD/rO09fkx70i01+7odaYOrzFKs/uSyvbw
	pL7Y89umP0wo4X6OD/1n7yK2CJZAQcJf/T37iceRArX1wR8p/luGI+woB/F0n3cyqFYKDaSXs4i6h
	M2m+We6rP51l7RBkESrM0OBAIFd0Gf6XZFEkuQzfE/+K/XehDXr9YmYXu83CozMvw7dcsBLGnm5YG
	SPeQTvQqO9qp7H+zf/Ejp5ZbKG7OlbB6dbTgGsjKs53lOrmnH/bzYIBep/xxpdlRqt7XY3t47aosr
	VJR8pBoB8CU+qpycmJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKv2-00000002lHU-2YRP;
	Mon, 27 Jul 2026 12:58:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKv1-00000002lHO-2bZE
	for opensbi@bombadil.infradead.org;
	Mon, 27 Jul 2026 12:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fHH4MResJh5bEMuEASbY1Um6CeD5xpppBWayhy46Ugw=; b=ngKRCIvz6Uh0MMMEo2fKvQ+0if
	q4E7ybrW0B+PPsCIxT1XjJ79hZlpmD2MNDRMev1hkVBhp1ZzxZjFtTLuIDnROfhOK1wyYMRnEHrzU
	YT/2PgZZB19qTSE1KpLfNaEpj6nzDYLdX9j3uIc3VJrb/uvYfzHJFQcYDkQtarxDPJRa2z8ke4I+x
	E8ile33EDq5TblFQe+pXfVb2sAUgu+uzIAQ0lZ1BcbpxFihVwTEIyLJo9HxqUWjRhCs61p1OzeYwC
	vhxSJZv+R7f9ty8PF7Gqo6Os8yuRFntjhPuNvm8XtInfkxNVK9cVnZIjfd9AYgO5nG6EuOGRyTkCk
	zsvgRhmg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1woKuy-0000000465c-1c5A
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 12:58:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMCLx3439173
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 12:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHH4MResJh5bEMuEASbY1Um6CeD5xpppBWayhy46Ugw=; b=RHJ77HWZ7JHS6NVX
	NojBZQ9J8dkqZRrqTYXj+UBcSu8UqzfJegsw4n5nPV1YhYai3XLLs20cxVDHDnSB
	zFAnnOwwmctAQnWZ0coJuf/a2BQI6MM+I8wSryoxTLPVyQcNB6B6HO3yU84gm9pI
	Y3XGnGFEZmSNRzwOL3DInW8u+zU8Tt8aa1M/IQ0b9PJgx2wqB8R6Mno+9klcRJJN
	ZpDDuXinHwEsBwRGm6+z+Kcnq1jNZWNrUEk5zyjkZXCucemP5CVo/rvWol+symsQ
	t0joTqLIlrloxyZ+8V96t7+gbuspIY9hZ0s6R8YA0oKNm3qzTe84i7gl6sE26udj
	6w/fuw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4ukrq4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 12:58:46 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e8a76a273so69167307b3.1
        for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 05:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785157126; cv=none;
        d=google.com; s=arc-20260327;
        b=PjOzHPGUycqhrghU+dP59rtNOaG3+tsLicv7w6RE2COvGa/U+1kQpXC4FMpCeyZSBa
         TnkjNluq6oxTHWEkImy/WOlS0kReNL7ri9+zxObp+OCVsN6e4K5MnUZhnC1OI72kVQ7A
         c0bJ0/gfvikAzVMxl18rxo5SMUr3xdvH1XeSqKtKB+eu7Ff/+QpMyYxZ5mulrBIYZIEd
         u87BtFKJbiwrVKdtta7IZGO1FahW/R1RcQicYHX1vb+VEd1C4Tz3VGfupzGKooURHiRe
         eq2THDQMTN6Nd1TSjXuBzQg80+bJkXvP7lzrk2tHtCe+QQchUH3yMlKR34bjfk9ws2O1
         XioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fHH4MResJh5bEMuEASbY1Um6CeD5xpppBWayhy46Ugw=;
        fh=GyVyD2T6XBDGnnZeezVBHcGjko+v52SlcQCT2RN5Gfc=;
        b=LuUGQHzLXuJ3En+q8DhITFcoaPQh4Pv2myhGa8ZitP1SQv9iqkrGidgkj4d/DeYcRs
         F/WD/oU8aObjrHA5Eiydv4xBJiywnPbM4ZEwZk7nlTXe8jej0mEc+eVaE8tGpCuAed5a
         NAhtCvMP2FMJuO22VjpDdMMsv4IQRHrY6YQi+6cLWtZdb4QQ5Ekbuh4Uysi9F+pAYlHq
         4yvkBwEKteAlsPyMMRjTVqIAILeiOhdrRgzRJHlrGjwqnam6SZrrg+ymT0drzUSppzAM
         EARWlV1eRwn+FIIDlg0Zi8090MpneY1FJDsYGgmErsrKl2ywRHA5Njn+mph+BVSTXpkx
         67EQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785157126; x=1785761926; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fHH4MResJh5bEMuEASbY1Um6CeD5xpppBWayhy46Ugw=;
        b=O266dK7i8fbDMiCsDFYzRSOf3EhNnILAIpJ0ob3X3QO3/KtNPB4Q441yCydCLoMdtv
         oZnj3ZOxjDR95lMuJjiqC0uXTRQTZavhDAj+ctXpWRe4SQ2DutjIroREM8v5jvM902lp
         g6RxC2MdchZz3yX8oXRX4RpngwFKJK6JCK7vqUjufNuNL+Y9PnTaDiKtWoNUVAHh+ADo
         1L+ZmKpFakMswDLhnW6i1rhT/7xd5su8Mc7WGFW/RiiL+Ur/PWGO17ZR2t5z7k3FQccU
         mjd4VlG4fB77okqETUmDvUFlQ4vfrv9KJz0jz6+yluN9kiKmwsnlRqJKWi0yheP5dh+6
         90ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157126; x=1785761926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHH4MResJh5bEMuEASbY1Um6CeD5xpppBWayhy46Ugw=;
        b=m/xOEtcMaHIx3smLxzfraWKXmuJKF4e8HASx8EoseoSuoEP/FI+KIVjVx6ey8vcsnD
         7YrO7ZdAbUVSsFLgPZBi5xrhImC9+K3ORrM7rXU9FGkvlK6bHLFP1fhqXhKX1TihiHxC
         wbVovyk/NkodplXgXs28uOccuJerujFkrUBGPar2j0QM76vQcACMOXIXuS/97aa44Hjv
         0qOR5oHUD2+uw/FHnppEMnuL+o8zcBJRD9Ge5m7cYnlZGG5+1S4Z4Xwz6aqnagOvupqm
         x7zD052QlBe91mrZbI9m9mxWI5YjHOZV7J6c4UZK4+Z+EN77kVd+t8s0yPJWDu8SIp8T
         030A==
X-Forwarded-Encrypted: i=1; AHgh+RpmlFFwnMof9UBoHT3TGO9Lv0/niCobRZPCAR/hVpyjzgX9M2VJSm4kRFzZQQgZ5zBNECj6ascs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyejfb+ahGke2fzhO1LjAOW27gQJLKYP+geUYy4IlREnIZM40h
	cwV0oDIyiBDV0RKRcOVAZuFYnp8y0Z04/7siDu314uLI8AirAwZ7CNTlxSX+Ot8iy1vpSw+HOPq
	nNsBEmdEfRrs1F+hO21Gi/8WlNDp7Y3D0shNg1NH6fCzGqvWx1oc7p9F0dzcT3i8J46V9xsBvbR
	pw570V4n4K9I27vn4lStBX6r5wiQJoR0rLnZ7TeXw3
X-Gm-Gg: AR+sD12sXQCmKNb3pl/RaT8sOM6p4p2I5JnoqrNGmaRZNVQAI/lTJziHAAxZ+QBMsZc
	eA3tjdKIID/cuAR+piIKfbKyyKiLxSVODtTtDOxQRF1b3yjteXgnU+tJ8s4K6Dq3jeIc5JIhFIJ
	dfNKgkxC8qzYDQkze3mK0XEAeHUQdvGqlCuFw07Ldv4lTnLYHm26JAi2fJ+4M=
X-Received: by 2002:a05:690c:6e89:b0:7fd:4ef9:e5a4 with SMTP id 00721157ae682-81f69d516bamr27943677b3.29.1785157126231;
        Mon, 27 Jul 2026 05:58:46 -0700 (PDT)
X-Received: by 2002:a05:690c:6e89:b0:7fd:4ef9:e5a4 with SMTP id
 00721157ae682-81f69d516bamr27943627b3.29.1785157125889; Mon, 27 Jul 2026
 05:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com> <20260727042504.1743250-3-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260727042504.1743250-3-anup.patel@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 18:28:34 +0530
X-Gm-Features: AUfX_mx1q019Xs9f9CKnmZztaHuxTl1SOmyXn7GM05Hfrw4UVenLUpMmPF_DmBk
Message-ID: <CAFR3w373JqfcNrsNx4JYSBkez-V3ucXu7UACeGnCfhq8006npA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] lib: sbi: Introduce sbi_hart_protection_reconfigure()
 function
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-GUID: s7CEOJ7iyhJJxU6HtM7eq7MfNvfhceS1
X-Proofpoint-ORIG-GUID: s7CEOJ7iyhJJxU6HtM7eq7MfNvfhceS1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNiBTYWx0ZWRfXzDSKkkPg4j4g
 MpGnUGkCZWn69Ca++1YMa2wYr387vJ6vJAOZ+UIoTdC3W3Zd6NHk+HuiQ2R1Gy00QtH6i9pexU5
 OTGBXjAFnjwHRnfPH8s+sBjW0N6acno=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a675606 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=RHNhL5g0lvWtOJ5sFeoA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNiBTYWx0ZWRfXzo/g6KlPfHDi
 50gHXQKmzMYcnIAohqrUzdqPKD9DUtYkR37BwebvzL7j9+EWsug6YLVwcl2EN+bnX6svmGysDvo
 zBU4nrLLobnk7GmxZHzPAvp5bgrHIt49wzLdRU6CbPj7U952u7Zdw7+VOAnq1GLdJnA3CqDncDf
 ukD+oIOBljxCUBUECBt6xk0pE1R9S5fmXryvXr8s2uA5qIsRC8gakZj7o3wlyz1U5WT1uwo7o4U
 YcxBM8KNxkI99JmPDoDH8pCZvM+eqIxUuD5NdWeL/EV37z8aDQNM+N+ltWOWPGdVQarQ/kZn3Cu
 ACtmjsD5THHCNQQ7JYcmhRbkPLqLfAa5Tamc7A+4naodcJnc9kDOgnHZrUNKh535pZj1Qt2vTrt
 eIdfEsJZ6aBfd7d+qLUfY2TuO8CcPgVkMgP5k+zsbsZ9iRWVkrffSoxAuGvxvB/SZDt0Q3bA8lh
 QmAE61Ppa+qyoBZ4nOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_135852_774579_D293640A 
X-CRM114-Status: GOOD (  12.73  )
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

T24gTW9uLCBKdWwgMjcsIDIwMjYgYXQgOTo1NuKAr0FNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBJbnN0ZWFkIG9mIGFzc3VtaW5nIHRoYXQgaGFy
dCBwcm90ZWN0aW9uIHJlY29uZmlndXJhdGlvbiBpcyB1bmNvbmZpZ3VyZQo+IGZvbGxvd2VkIGJ5
IGNvbmZpZ3VyZSwgaW50cm9kdWNlIGEgc2VwYXJhdGUgc2JpX2hhcnRfcHJvdGVjdGlvbl9yZWNv
bmZpZ3VyZSgpCj4gZnVuY3Rpb24gYW5kIHVzZSBpdCBpbiBzd2l0Y2hfdG9fbmV4dF9kb21haW5f
Y29udGV4dCgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3Mu
cXVhbGNvbW0uY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydF9wcm90ZWN0aW9uLmgg
fCAgNyArKysrKysrCj4gIGxpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMgICAgICB8ICAzICst
LQo+ICBsaWIvc2JpL3NiaV9oYXJ0X3Byb3RlY3Rpb24uYyAgICAgfCAyOCArKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKPgoKUmV2aWV3ZWQtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFrQG9z
cy5xdWFsY29tbS5jb20+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
