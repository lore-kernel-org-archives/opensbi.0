Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EC0606A31D
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 16:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kZbbxWDN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAsVynR7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qLE3TbED4pLXkuIW2Mt+KN7zP8z+702OpJL7MF5H4N0=; b=kZbbxWDNnYQd6kvHxO0bgv57W9
	PbFFvzQkARvEjn3Qy81JkDTzdosEPpcdamz2WbYj+KWhui3NyTgTSlmxCCbiTwlsDNXz0YkAdbi4C
	/qbU8HcyalXpWaNoq6hQJ7WKMowKiyaWqkPY7qhowzaz/Lns9+O6TNElH6o+2cL1m0Ia3AMg5Yule
	YNwQjUcEsxu0D/7LElj8qkaHtmmRbzGTuJD+rZHGhslamWzETm8mU/rwKtwzL2vkJIONtc+h3woOG
	/qNLwe1WDTsN2yHeTyBfFVrN2Fy43hDTAOZZ1739nqhufK4XMTe17iWfRIlOXUiDzLusRWx1F+Njo
	UOKajoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNLc-00000002r2r-2qhc;
	Mon, 26 Oct 2026 16:14:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNLY-00000002r0k-3Y4i
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 16:14:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEw6qj3584367;
	Mon, 26 Oct 2026 16:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s1K85BtqSOPxN+27NVikrK
	DhSPI6j0t4IX89gm4Ll2s=; b=OAsVynR7JoMdxa+alYHtigVBgc+10nMkN7Fzzk
	Uq4wVp4+RkWGRrrumV1KKbeB6Z2HZb5NpA/t+vmMbEJWQIdL1T+LuK1BUEm8JMSV
	s3yJgPw9AjdIkrYfRwtLIQRceC/B603FHGpNA2DSihwuGfAUr6RQcOvBa5GYf0n1
	/z0/iPbiQGAAFlKRsJ8C+PLBakwnr0ZHDnkD8k1lWxsaoMrUxND4Owfx8I07yvWM
	SOoPnXAwdftdoA5+UiB6SOJ1x2HON4+v7BLaH5e9lPLuBvstwFEw7RQ9l0KXmodm
	Ozp9kbZhyqsU6m+j/Hp8aDsiJHODsN8lwHFf6w5nqEgf2Sbw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddb0xr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 16:14:51 +0000 (GMT)
Received: from pps.filterd (nalasppmta04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69QGEox73768496;
	Mon, 26 Oct 2026 16:14:50 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 69QGEn3D3768479
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 16:14:50 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id C809F24C9C; Mon, 26 Oct 2026 09:14:49 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v6 0/3] MPXY interdomain bridge driver
Date: Mon, 26 Oct 2026 09:14:45 -0700
Message-ID: <20261026161448.938375-1-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: g5PEBfhtqQFJVsayZXsA1vQ6QB8QL9EM
X-Proofpoint-GUID: g5PEBfhtqQFJVsayZXsA1vQ6QB8QL9EM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfXyf4JFwnB+avU
 ++zaqxv/x4X49rf4xqE1oHeT3kCgOKFdyZRY0O8wVx9+RD4dRFbrH4WzEKH75puVl6gE8I554hM
 PQiMA6Y7gfA4qSA+ICXcnqRioUw9pz0RgaM5LP4q+UCI2+yMs4HllpPFhHfS5k7W+hQbhJq+rDg
 B72c45ry2N5mZWJKtNoaBwKzdyGpfffOHdGNt6x7dDalCARnb30Uca7YjurgWCM6zC1mHmV7oIy
 yV7gvxi/o1ViRTplfmka6xyb/2lTOc++2quPScahnnzmouotmAuKd7B0Dgj2w21j8xU/u/e3xes
 96z5CHVLRgYr+WfgnrVBagRBAPuZg45ESV8tvgsd4IV7ONOhDhz+tZruPxaA7CldAqNqFwM+oKk
 /DkcZoiEYLpQVV/wczkRTwMCjzxKFj/K1mCEzoq4sbHBXnMvGCAzH3HJb4b1xoZp8PK0KougnSt
 COunMgiLTv4h9+apEtg==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf7c7b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=naag9LVkbFdOZemGQDMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NCBTYWx0ZWRfX88IBSN74Mm1W
 Dxa/YUmb+dox+dkIM+LXzf5qiFb+SJr7beKA2MHhlCJtNwnABpKmtpwgP7O4UV7I05prK9ixX/j
 gQ36GozIbk4MPgaItEvaQZtN5jztZkc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_091453_010696_571C6FDB 
X-CRM114-Status: GOOD (  15.43  )
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
YXJpb3VzIHByb3RvY29scyBvdmVyIFJQTUkgY2FuCmV4aXN0LiBlLmcuIG1hbmFnZW1lbnQgbW9k
ZSBvciB0ZWUgbW9kZSBkcml2ZXJzLgoKdGhlIERUIGJpbmRpbmdzIGFyZSBhcyBmb2xsb3dpbmcu
IHdoaWNoIGRlZmluZXMgYm90aCBtdWx0aXBsZSBzb3VyY2VzCmFuZCBzaW5nbGUgZGVzdGluYXRp
b24uCgpicmlkZ2UwOiB1bnRydXN0ZWQtdG8tdHJ1c3RlZC1icmlkZ2UgewogICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJvcGVuc2JpLHJwbWktbXB4eS1yZXFmd2QtYnJpZGdlIjsKICAgICAg
ICAgICAgICAgIHJpc2N2LGRvbWFpbiA9IDwmdGRvbWFpbj47CiAgICAgICAgICAgICAgICByaXNj
dixzYmktbXB4eS1jaGFubmVsLWlkID0gPDB4Mj47CiAgICAgICAgICAgICAgICBzb3VyY2UwIHsK
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0KICAgICAgICAgICAgICAgICAgICAgICAg
Im9wZW5zYmkscnBtaS1tcHh5LXJlcWZ3ZC1tbSI7CiAgICAgICAgICAgICAgICAgICAgcmlzY3Ys
ZG9tYWluID0gPCZ1ZG9tYWluPjsKICAgICAgICAgICAgICAgICAgICByaXNjdixzYmktbXB4eS1j
aGFubmVsLWlkID0gPDB4MT47CiAgICAgICAgICAgICAgICB9OwoKICAgICAgICAgICAgICAgIHNv
dXJjZTEgewogICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPQogICAgICAgICAgICAgICAg
ICAgICAgICAib3BlbnNiaSxycG1pLW1weHktcmVxZndkLXRlZSI7CiAgICAgICAgICAgICAgICAg
ICAgcmlzY3YsZG9tYWluID0gPCZ1ZG9tYWluPjsKICAgICAgICAgICAgICAgICAgICByaXNjdixz
YmktbXB4eS1jaGFubmVsLWlkID0gPDB4Mz47CiAgICAgICAgICAgICAgICB9OwogICAgICAgICAg
ICB9OwoKLS0tIFRlc3RpbmcgLS0tCgpUaGUgc2VyaWVzIHdhcyB0ZXN0ZWQgb24gUUVNVSBTaUZp
dmUgVW5sZWFzaGVkIChzaWZpdmVfdSkgd2l0aCB0aGUKYWJvdmUgZGV2aWNlIHRyZWUgY29uZmln
dXJhdGlvbi4gVGhlIHRlc3Qgc2V0dXAgY29uc2lzdHMgb2Y6CgogIC0gaGFydDEgc2hhcmVkIGJl
dHdlZW4gdHJ1c3RlZC1kb21haW4gYW5kIHVudHJ1c3RlZC1kb21haW4KICAtIHRydXN0ZWQtZG9t
YWluOiBiYXJlLW1ldGFsIGFwcGxpY2F0aW9uIGxvYWRlZCBhdCAweDgwMTAwMDAwCiAgICBib290
aW5nIGluIFMtbW9kZSB2aWEgdGhlIGRvbWFpbidzIG5leHQtYWRkcgogIC0gdW50cnVzdGVkLWRv
bWFpbjogTGludXgga2VybmVsIHdpdGggYSBrZXJuZWwgdGhyZWFkIHNlbmRpbmcKICAgIHBlcmlv
ZGljIE1QWFkgbWVzc2FnZXMgdmlhIEZJRCM1IChTRU5EX01TR19XSVRIX1JFU1BPTlNFKQogICAg
YW5kIEZJRCM2IChTRU5EX01TR19OT19SRVNQT05TRSkgb24gTVBYWSBjaGFubmVsIDB4MQogIC0g
QSBzZXBhcmF0ZSBiYXJlLW1ldGFsIHRlbG5ldCBjb25zb2xlIGFwcGxpY2F0aW9uIHBvbGxpbmcK
ICAgIE1QWFkgY2hhbm5lbCAweDIgdXNpbmcgUkVRRldEX1JFVFJJRVZFX0NVUlJFTlRfTUVTU0FH
RQogICAgYW5kIFJFUUZXRF9DT01QTEVURV9DVVJSRU5UX01FU1NBR0UKClRoZSBMaW51eCBrZXJu
ZWwgdGhyZWFkIHNlbmRzIGEgdGVzdCBwYXlsb2FkICgiTVBYWS1IRUxMTyBzZXE9TiIpIGV2ZXJ5
CjMwIHNlY29uZHMgYWx0ZXJuYXRpbmcgYmV0d2VlbiBGSUQjNSAoZXhwZWN0aW5nIGEgcmVzcG9u
c2UpIGFuZCBGSUQjNgooZmlyZS1hbmQtZm9yZ2V0KS4gVGhlIGJhcmUtbWV0YWwgYXBwbGljYXRp
b24gcmV0cmlldmVzIHRoZSBmb3J3YXJkZWQKbWVzc2FnZSB2aWEgdGhlIFJFUUZXRCBzZXJ2aWNl
IGdyb3VwIGFuZCBlY2hvZXMgaXQgYmFjayBhcyB0aGUKQ09NUExFVEUgcmVzcG9uc2UuIFRoZSBM
aW51eCBkcml2ZXIgdmVyaWZpZXMgcmVjZWlwdCBvZiB0aGUgZWNob2VkCnJlc3BvbnNlLgoKQm90
aCBGSUQjNSBhbmQgRklEIzYgcGF0aHMgd2VyZSBleGVyY2lzZWQgYW5kIHZlcmlmaWVkIGVuZC10
by1lbmQKYWNyb3NzIHRoZSBkb21haW4gYm91bmRhcnkgb24gYSBzaW5nbGUgc2hhcmVkIGhhcnQg
d2l0aG91dCByZXF1aXJpbmcKYW55IGRlZGljYXRlZCBpbnRlci1wcm9jZXNzb3IgY29tbXVuaWNh
dGlvbiBoYXJkd2FyZS4KCkNoYW5nZXMgc2luY2UgdjE6CmRlY29uZmlnIHNlbGVjdHMgQ09ORklH
X0ZEVF9NUFhZX0JSSURHRQoKQ2hhbmdlcyBzaW5jZSB2MjoKc3VwcG9ydHMgbXVsdGlwbGUgc291
cmNlIGRvbWFpbiB0b3dhcmRzIHNpbmdsZSBkZXN0aW5hdGlvbi4gKG1hbnk6b25lKQoKQ2hhbmdl
cyBzaW5jZSB2NDoKY29zbWV0aWMgY2hhbmdlcywgYW5kIHNvbWUgbW9kdWxhciBjaGFuZ2VzCgpD
aGFuZ2VzIHNpbmNlIHY1OgphZGRlZCBjb25jZXB0IG9mIHNvdXJjZSBkcml2ZXIKCkNoYW5nZXMg
c2luY2UgdjY6CmNvdmVyIGxldHRlciBjaGFuZ2VzIG9ubHkKCk96YSBQYXdhbmRlZXAgKDMpOgog
IHNiaV91dGlsczogbWFpbGJveDogYWRkIFJQTUkgUkVRVUVTVF9GT1JXQVJEIHNlcnZpY2UgZ3Jv
dXAgZGVmaW5pdGlvbnMKICBzYmlfdXRpbHM6IG1weHk6IGFkZCBGRFQtYmFzZWQgTVBYWSBicmlk
Z2UgZHJpdmVyCiAgbXB4eTogQWRkIE1NIHNvdXJjZSBkcml2ZXIKCiBpbmNsdWRlL3NiaV91dGls
cy9tYWlsYm94L3JwbWlfbXNncHJvdC5oIHwgICAyMSArCiBpbmNsdWRlL3NiaV91dGlscy9tcHh5
L2ZkdF9tcHh5X2JyaWRnZS5oIHwgICA2MSArKwogbGliL3V0aWxzL21weHkvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICB8ICAgIDQgKwogbGliL3V0aWxzL21weHkvZmR0X21weHlfYnJpZGdlLmMg
ICAgICAgICB8IDEwMDMgKysrKysrKysrKysrKysrKysrKysrKwogbGliL3V0aWxzL21weHkvbXB4
eV9zb3VyY2VfbW0uYyAgICAgICAgICB8ICAyMDggKysrKysKIGxpYi91dGlscy9tcHh5L29iamVj
dHMubWsgICAgICAgICAgICAgICAgfCAgICAzICsKIHBsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9k
ZWZjb25maWcgICAgICAgfCAgICAyICsKIDcgZmlsZXMgY2hhbmdlZCwgMTMwMiBpbnNlcnRpb25z
KCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9i
cmlkZ2UuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5X2JyaWRn
ZS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL21weHkvbXB4eV9zb3VyY2VfbW0uYwoK
LS0gCjIuNDMuMAoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
