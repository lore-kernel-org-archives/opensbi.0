Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7122606A330
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 00:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3kLzwhg9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GoYtlLND
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GHTQwrwACb98nWwOyJZ8JpikEmIbe8+tFLRxPEuJvww=; b=3kLzwhg92XPOCoVee3ZSFiNG7j
	1yooZEWke/oLUwJd8SG8boZFkf7NApPIQsW/p1iJIAkyqajTueT4HdCN5iLcIdd4Kw04G3trKrgkQ
	Th5/znsTwxKA60IzBzoFUC/Vxv2gAkVg0xA5em8dbuXjyCQLoXQWETgdjStkWEgdQ/UvsIb15jh80
	eANiKRP0q2WOOx+M4ks7PM++FIxTwvk9TSuqpjaaROAYmijyk/QvLYzUBOanAX2paJ9/Ah5qQrXJj
	22Pe2ibLcylOAn7iuMt2iDEqF3hysIl+sLOT/gl4OQr3KGWX55FVPjFAwRKtQm712UrEEPIWj5WL5
	Ib6zlw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZOG-00000001zal-3NBm;
	Tue, 10 Nov 2026 00:07:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZOD-00000001zZB-17Bh
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 00:07:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9L9vet2018040;
	Tue, 10 Nov 2026 00:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AnpfRk4wTzwjolbDFQfNbV
	Uk+Y2u546V+CuZ0UTtYF4=; b=GoYtlLNDR9flSE7Lrj32LDjlmPgCVJRHwIc0Mr
	/vfpMtsXyWPqZZgjaj/gQZ0hT4/gKOTru6RgU4gGvbT4VeosZFnsDh2DeicaLC7d
	cVJVqAEvwjtbmXjSi/rykxTQVRE6azeOtR1jCx501aQQsfgKTVrcGwxLSCm/0rZV
	BRgZ9ZABQQLL29Y9xRu1r+QUW27uGeiZ0KTr4CrPIaCxmIv6Mdwcmae5LmB9x+4y
	WAl1k/+U1mv6vSW84bQF30MFp4vSJQySHbQA9Lgkf5oA4O0y0rGkinIYmHN6TpO6
	2C0WK679Ua0+p0w65Fh9hepiBMseFAvLLj1h3A4ODPiZVpHg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg0sw2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 00:07:03 +0000 (GMT)
Received: from pps.filterd (nalasppmta04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA03VeK2663889;
	Tue, 10 Nov 2026 00:07:02 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 6AA071jR2668130
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 00:07:02 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id CE68624DF9; Mon,  9 Nov 2026 16:07:01 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v7 0/3] MPXY interdomain bridge driver
Date: Mon,  9 Nov 2026 16:06:49 -0800
Message-ID: <20261110000652.1298076-1-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwMCBTYWx0ZWRfX0o7EhN+KGuyJ
 9XEb/MH8YHeaZkljaBycQg4DuvATEwUIxe2ql+L7t+M1mkxeNEhNxfBykxgvu8N8M2Vc/YkoW7Q
 ocJmNABsut4AbCbuoCBGUL0RyLlt24YQC21CEz368n0D2DxVDEePslvoE1HQZ8wtlFis+dU/X39
 D9fV9ptXpnpn+oQUgxO7lkW6EiJLjg31I8y7vHC2RzdJSwGPKOsKwnd9OY1CImXgT1NY3g8qEu5
 9Z7dW16MIVg+zq2ZNiM9MDRhknK+pYYg3wX5MuzYa05nu3Bz1MLRFLgrR4x0x5jNqX5ytG9ZeTq
 se6nKQgZtBK5hN/XltvmakziUlDznRc1mYud9XphC49XXL1tLko1IVM1gUwgzNfWC1ZG06fecva
 yPoD2pv5vgpn2ZRvOjMwakQG1s0tn5R3J5R4NiKzgZiMHRDxysQTFw33pASNVEi28UHiUH/CNZ0
 IjhLbSEEwmK9QUAYW3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwMCBTYWx0ZWRfX959MLuqD9OfX
 9+XLU2ejYQZSjyKG6bFt+TWuIRtMrPu7R8z9i7CIf3j3QkdynuKdmw+Res47nr/gsZUPJ/WaHCk
 G6YgY5XT2w17QDyAOpJgmtVYdQUTVYs=
X-Proofpoint-GUID: YWWOjWuOKgj1gB8UdX2sFRx1FGEUZCr3
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af26027 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=naag9LVkbFdOZemGQDMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: YWWOjWuOKgj1gB8UdX2sFRx1FGEUZCr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_160705_432652_7F4C52D1 
X-CRM114-Status: GOOD (  15.55  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
c2luY2UgdjY6CmNvdmVyIGxldHRlciBjaGFuZ2VzIG9ubHkKCkNoYW5nZXMgc2luY2Ugdjc6CmZp
eGVkIHJldmlldyBjb21tZW50cwptYWtlIHRoZSBicmlkZ2UgZHJpdmVyIGNhcnJheSBiYXNlZCAK
d2hlcmUgc291cmNlIGRyaXZlcnMgYXJyYXkgY2FuIGJlIG1haW50YWluZWQuCgpPemEgUGF3YW5k
ZWVwICgzKToKICBzYmlfdXRpbHM6IG1haWxib3g6IGFkZCBSUE1JIFJFUVVFU1RfRk9SV0FSRCBz
ZXJ2aWNlIGdyb3VwIGRlZmluaXRpb25zCiAgc2JpX3V0aWxzOiBtcHh5OiBBZGQgRkRULWJhc2Vk
IE1QWFkgUlBNSSBicmlkZ2UgZHJpdmVyCiAgc2JpX3V0aWxzOiBtcHh5OjogQWRkIE1QWFkgUlBN
SSBicmlkZ2UgTU0gZHJpdmVyCgogaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3By
b3QuaCAgICAgIHwgICAyMSArCiBpbmNsdWRlL3NiaV91dGlscy9tcHh5L2ZkdF9tcHh5X2JyaWRn
ZS5oICAgICAgfCAgIDYxICsKIGluY2x1ZGUvc2JpX3V0aWxzL21weHkvbXB4eV9ycG1pX2JyaWRn
ZV9zcmMuaCB8ICAgMTEgKwogbGliL3V0aWxzL21weHkvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgOCArCiBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2JyaWRnZS5jICAg
ICAgICAgfCAxMDA4ICsrKysrKysrKysrKysrKysrCiBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9y
cG1pX2JyaWRnZV9tbS5jICAgICAgfCAgMjA4ICsrKysKIC4uLi9tcHh5L2ZkdF9tcHh5X3JwbWlf
YnJpZGdlX3NvdXJjZXMuY2FycmF5ICB8ICAgIDMgKwogbGliL3V0aWxzL21weHkvb2JqZWN0cy5t
ayAgICAgICAgICAgICAgICAgICAgIHwgICAgNyArCiBwbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3Mv
ZGVmY29uZmlnICAgICAgICAgICAgfCAgICAzICsKIDkgZmlsZXMgY2hhbmdlZCwgMTMzMCBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zYmlfdXRpbHMvbXB4eS9mZHRf
bXB4eV9icmlkZ2UuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpX3V0aWxzL21weHkv
bXB4eV9ycG1pX2JyaWRnZV9zcmMuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91dGlscy9tcHh5
L2ZkdF9tcHh5X3JwbWlfYnJpZGdlLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdXRpbHMvbXB4
eS9mZHRfbXB4eV9ycG1pX2JyaWRnZV9tbS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxz
L21weHkvZmR0X21weHlfcnBtaV9icmlkZ2Vfc291cmNlcy5jYXJyYXkKCi0tIAoyLjQzLjAKCgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
