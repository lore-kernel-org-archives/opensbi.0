Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A2B606A31E
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 21:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yzWlzirH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cmmbDTtb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=opRbOgW/t2eFlkjIoTDOeefrZnN9ZKIW0LfMt7tcCMk=; b=yzWlzirH3zKc0VPMdlaU+C+E4X
	GxtuEbTRGTK39Tiu6fIbwgwyiBIEtV6ndPIAWJ31Vmihuqq8h1LPrJ8cYDsPVoqI1gh3PI5OYoTV9
	NpUzwWPGhAWCQv13928BIas+A74QaVKGmL7G3dt6LZlgN5SM+rEcWZNjASntgBcR1MuqlKeNsKGRr
	b2b5qp+14ggQYi5mGLUsxgg+KnPMkrMr4G3mvka0JCA1GaKRM3e6D0vKtun5I+DvTlGIv8cUbCYTy
	2BB+SfqWcg3hDrXvSda1/Ve8dRFYLcbZ+PpvDbstcSsfOQYNu/Iv3gQSY4XiBEyvdq+NQ62kgcSQY
	4VE1Qy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMhj-0000000GzF1-16ea;
	Fri, 23 Oct 2026 21:21:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKMhe-0000000GzDg-3N4w
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 21:21:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NIZXTR463428;
	Fri, 23 Oct 2026 21:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Th3RFYXK1ZRkMHV9Bwgns5
	dGFCb82CM37h+LZh8ISas=; b=cmmbDTtbYJzT3Ie1t/YSjZiBPweIvbmGUZWKut
	SzjD0UcT0Sb7aW6BXlfNbZTxd87Kv1SX3VKxMzMxkhVH7YyPtgeZrgjySaKP5uno
	rBuLaijO0cVgbp5v+mkc/kjscdJzoRycg9nai9c+4elrxyH1VNY/vUb34FzLCtNX
	tu3q2uEb7lMeGV37W/fcemnmWHGGeoE3pP0SeDC4bYfL3/9edz4VNe/FJ7h/YZ6z
	uZqJLz2KK/ltx7F4X+ugd10iozcM8BXhBHFBKmBGwNrsbEihIJYF4rBOU+8pJow0
	FhK6WOQRGX1jDGwewrkXKN1/qcUom05NuuxAgZmKfYU3jCgg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw1y3e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 21:21:28 +0000 (GMT)
Received: from pps.filterd (nalasppmta04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLLSnI2591502;
	Fri, 23 Oct 2026 21:21:28 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 69NLLRiG2591496
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 21:21:27 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id C329D24C82; Fri, 23 Oct 2026 14:21:27 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v4 0/3] MPXY interdomain bridge driver
Date: Fri, 23 Oct 2026 14:21:23 -0700
Message-ID: <20261023212126.1914666-1-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: U-GJsnPudvLOM1YxuHJukpxDNJYH-oqd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA4NCBTYWx0ZWRfXwOFiq2NnVKUr
 DRTZCJnSnp9Ld/VutQQvx2ewisWUtiuB4W6qJP50nd8L856/2sUPgZkPF71RCA+QmcwoQbWwquu
 lC7nu93eD+QYETtffv3SagWO65SaH0s=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adbcfd8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=_VCs-DfyAZsVC4IkTXgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: U-GJsnPudvLOM1YxuHJukpxDNJYH-oqd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA4NCBTYWx0ZWRfX+DEYlRFIzMuc
 UKmpNssFj5D1mukMY8mAlrM8+H664+iojLDjOlY+keMwHW2F7x+G49gFHSHHvciSDFLDv204zj3
 tXDca7+DVjLkbs4fI6ZhMdCA0huAIevsxlFJTQIYMGIWu4HbchYqjgFitqVIQTzhykj9bsrEV4V
 tonMhcMHFGWD/cNSGCzX3CWAH1x6QNpWH918ktIczzi5wQ7NbiU6Hm+8AwT8fKWg5n+iVpiKm/L
 fcuyiZ2PshiNIbPN1+7D8X0p/7AgH7T+0ofFdiTYCzbT4/gTLIlIvw74JXRbbP1G/zxhTzLVKhd
 LuY3qCr4d3HeeeNO64QzRMYgyu+q7CPsnPIYAmF60ZiVJgmHq4Q1fLXZbI9VGR9XRwcf7v7qDO6
 iH0pJNM2S9mmnHAaH/G7mj4zemlZA89jlR5dFIZevxWgCkKpEtLmtvNr9Z7FssOUSfdVEdOmIVH
 ee3TQazNWagF+Spk73g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_142130_853494_8BC9E5E6 
X-CRM114-Status: GOOD (  13.00  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogT3phIFBhd2FuZGVlcCA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgoKVGhp
cyBzZXJpZXMgaW50cm9kdWNlcyB0d28gbmV3IGNhcGFiaWxpdGllcyB0byBPcGVuU0JJOgoKICAx
LiBBIGRvbWFpbiByZWdpc3RyYXRpb24gbm90aWZpZXIgbWVjaGFuaXNtCiAgMi4gUlBNSSBSRVFV
RVNUX0ZPUldBUkQgU2VydmljZSBHcm91cCBkZWZpbmF0aW9ucwogIDMuIEFuIEZEVC1jb25maWd1
cmVkIE1QWFkgYnJpZGdlIGRyaXZlciBmb3IgaW50ZXItZG9tYWluIG1lc3NhZ2UgcGFzc2luZwoK
LS0tIE1vdGl2YXRpb24gLS0tCgpNb2Rlcm4gU0JJIGRlcGxveW1lbnRzIGluY3JlYXNpbmdseSBy
ZXF1aXJlIGNvb3BlcmF0aW9uIGJldHdlZW4gbXVsdGlwbGUKZG9tYWlucyBzaGFyaW5nIHRoZSBz
YW1lIHBoeXNpY2FsIGhhcnQg4oCUIGZvciBleGFtcGxlIGEgdHJ1c3RlZCBiYXJlLW1ldGFsCmRv
bWFpbiBhbmQgYW4gdW50cnVzdGVkIGRvbWFpbiBydW5uaW5nIG9uIGEgc2luZ2xlCmNvcmUuIFdo
aWxlIE9wZW5TQkkncyBkb21haW4gY29udGV4dCBzd2l0Y2hpbmcgaW5mcmFzdHJ1Y3R1cmUgcHJv
dmlkZXMgdGhlCm1lY2hhbmlzbSBmb3IgaGFydCBtdWx0aXBsZXhpbmcgYmV0d2VlbiBkb21haW5z
LCB0aGVyZSB3YXMgbm8gZXhpc3RpbmcKZmFjaWxpdHkgZm9yIGRvbWFpbnMgdG8gZXhjaGFuZ2Ug
bWVzc2FnZXMgYWNyb3NzIGRvbWFpbiBib3VuZGFyaWVzLgoKVGhpcyBzZXJpZXMgYWRkcmVzc2Vz
IHRoYXQgZ2FwIGJ5IGltcGxlbWVudGluZyBhIGJyaWRnZSBvdmVyIHRoZSBNUFhZCihNZXNzYWdl
IFByb3h5KSBleHRlbnNpb24gdGhhdCB1c2VzIGRvbWFpbiBjb250ZXh0IHN3aXRjaGluZyBhcyBp
dHMKdHJhbnNwb3J0LgoKdGhlIHNlcmllcyBhbHNvIGFkZHMgc291cmNlIGRyaXZlciB3aGVyZSB2
YXJpb3VzIHByb3RvY29scyBvdmVyIFJQTUkgY2FuIApleGlzdC4gZS5nLiBtYW5hZ2VtZW50IG1v
ZGUgb3IgdGVlIG1vZGUgZHJpdmVycy4KCnRoZSBEVCBiaW5kaW5ncyBhcmUgYXMgZm9sbG93aW5n
LiB3aGljaCBkZWZpbmVzIGJvdGggbXVsdGlwbGUgc291cmNlcwphbmQgc2luZ2xlIGRlc3RpbmF0
aW9uLgoKYnJpZGdlMDogdW50cnVzdGVkLXRvLXRydXN0ZWQtYnJpZGdlIHsKICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAib3BlbnNiaSxycG1pLW1weHktcmVxZndkLWJyaWRnZSI7CiAgICAg
ICAgICAgICAgICByaXNjdixkb21haW4gPSA8JnRkb21haW4+OwogICAgICAgICAgICAgICAgcmlz
Y3Ysc2JpLW1weHktY2hhbm5lbC1pZCA9IDwweDI+OwogICAgICAgICAgICAgICAgc291cmNlMCB7
CiAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9CiAgICAgICAgICAgICAgICAgICAgICAg
ICJvcGVuc2JpLHJwbWktbXB4eS1yZXFmd2QtbW0iOwogICAgICAgICAgICAgICAgICAgIHJpc2N2
LGRvbWFpbiA9IDwmdWRvbWFpbj47CiAgICAgICAgICAgICAgICAgICAgcmlzY3Ysc2JpLW1weHkt
Y2hhbm5lbC1pZCA9IDwweDE+OwogICAgICAgICAgICAgICAgfTsKCiAgICAgICAgICAgICAgICBz
b3VyY2UxIHsKICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0KICAgICAgICAgICAgICAg
ICAgICAgICAgIm9wZW5zYmkscnBtaS1tcHh5LXJlcWZ3ZC10ZWUiOwogICAgICAgICAgICAgICAg
ICAgIHJpc2N2LGRvbWFpbiA9IDwmdWRvbWFpbj47CiAgICAgICAgICAgICAgICAgICAgcmlzY3Ys
c2JpLW1weHktY2hhbm5lbC1pZCA9IDwweDM+OwogICAgICAgICAgICAgICAgfTsKICAgICAgICAg
ICAgfTsKCk96YSBQYXdhbmRlZXAgKDMpOgogIHNiaV91dGlsczogbWFpbGJveDogYWRkIFJQTUkg
UkVRVUVTVF9GT1JXQVJEIHNlcnZpY2UgZ3JvdXAgZGVmaW5pdGlvbnMKICBzYmlfdXRpbHM6IG1w
eHk6IGFkZCBGRFQtYmFzZWQgTVBYWSBicmlkZ2UgZHJpdmVyCiAgbXB4eTogQWRkIE1NIHNvdXJj
ZSBkcml2ZXIKCiBpbmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oIHwgICAy
MSArCiBpbmNsdWRlL3NiaV91dGlscy9tcHh5L2ZkdF9tcHh5X2JyaWRnZS5oIHwgICA2MSArKwog
bGliL3V0aWxzL21weHkvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAgIDQgKwogbGliL3V0
aWxzL21weHkvZmR0X21weHlfYnJpZGdlLmMgICAgICAgICB8IDEwMDMgKysrKysrKysrKysrKysr
KysrKysrKwogbGliL3V0aWxzL21weHkvbXB4eV9zb3VyY2VfbW0uYyAgICAgICAgICB8ICAyMDgg
KysrKysKIGxpYi91dGlscy9tcHh5L29iamVjdHMubWsgICAgICAgICAgICAgICAgfCAgICAzICsK
IHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgICAgICAgfCAgICAyICsKIDcgZmls
ZXMgY2hhbmdlZCwgMTMwMiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVk
ZS9zYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9icmlkZ2UuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGxp
Yi91dGlscy9tcHh5L2ZkdF9tcHh5X2JyaWRnZS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0
aWxzL21weHkvbXB4eV9zb3VyY2VfbW0uYwoKLS0gCjIuNDMuMAoKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
