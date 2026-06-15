Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A98CD98C5
	for <opensbi@archiver.kernel.org>; Mon, 15 Jun 2026 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w08QENiG2Tc8OJolp7CA2pyD4bJzY5vABntp/aLBrEE=; b=ONcbHLrQQ+//9x
	jBsahMztesaD6vjQPYIl9oXPh5HqchxsHiYUwgaEGIureW1C9t1Pona8S8nb4nMyy5Fvh55CL4DDt
	eay62zJJXExKq9amnF4lpwJpnAKMgYUywfRJ6xLRG0K3kVD7pCAmuF0JHr0jqPFTReF/ioaYQ1ykG
	SPXe5EeGHy54an4pylSMjg7iMKctM5fBeHmzyb1Y5y3Tx/SS9n6TRCrm+TCjzLxO0QEQA3+TOvLpB
	2hLAGBfYBOSYKpoEu6ZEPq3uQTkM22XuRGd8KQTh0wXJTtmJZV3/OopjI6Qx5wzP+qBnRBAyCBA0J
	SLlxaelrXf1lgKnMzdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxg-0000000EdXu-0kNv;
	Mon, 15 Jun 2026 17:19:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAxc-0000000EdV4-3mgA
	for opensbi@lists.infradead.org;
	Mon, 15 Jun 2026 17:18:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhLxX430394
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UmwZhRUaltcN/xzhnA5dXQ
	fCm+JXvjww0TcF6akIoSI=; b=ZYIZyrfOV3u76BvS0A6gCtUVFDdHeVi2Mi7K/p
	lZDeAOwJNQCdZZLQSfxutZ5fIfNvY5pBTvZxmcNegWZ0KTAhYdsAXgsr4gheIeWQ
	kYflrqYgBNFiuXO00PStEchRICLXZsyzAnQ+FAWxhIcJlVEvuTSyGI3RC5aCp4PN
	eMT5Iiy24XxlBtn0LgKd0a+BjildRvxWPda2Z8TRR46LUkHzflcKIcpnit1GnOH2
	woi7e/0VPCH5/Mh8CDs0aEYmcjFg8qVy2mjEMyFX8VcuypW+Gu2B2VEcsZOBXXaJ
	bs44e2uFbvB50x7YBPx47NGGY1XWMvn306o+KuPKl7E2QWbw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyd9yx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65FHItFl005220;
	Mon, 15 Jun 2026 17:18:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4es09je7u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:55 +0000 (GMT)
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65FHIs95005214
	for <opensbi@lists.infradead.org>; Mon, 15 Jun 2026 17:18:54 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 65FHIsLO005213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jun 2026 17:18:54 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id A74AF234B5; Mon, 15 Jun 2026 10:18:54 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH 0/7] RISC-V AIA: APLIC and IMSIC irqchip framework integration
Date: Mon, 15 Jun 2026 10:18:45 -0700
Message-ID: <20260615171852.447545-1-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 2AaK83kvgmczF4l-oAEzhPUJ7fSvAY4g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfX5Sds00Yb8pAv
 fyfRqPv6bjAP6Qzgd4z5l1Kn6InGQB5CYF5ua8bFE/nEPu/svDSZxfkbL9QJgt7oemQmOs38mOw
 5Ph+l6aZUGFVYCQY0PHiZ2HoJiAeXBU=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a3033ff cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=w1bIHubSxrm2gzmSLwYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2AaK83kvgmczF4l-oAEzhPUJ7fSvAY4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE4MyBTYWx0ZWRfX8XOVXVciefLq
 o4GK9/YYG72pehP3rGz4oaau8394dhZGaI6vAydeEB6zTE0mlkLYt2FgAbm6j3f7n2reyjxtNGh
 CmTXkLbqDcz9S4YKjdd9g/ehwD6/xT5tkkl9UAE4tDWP9iMrZzM9ldDtkfheF2MZTzdhuPUNy9A
 raHb1nY0pmBLTU1jPI97FSIH0RXCESptz2w8fMYmgo7OOxupAQX/lwlUVTVCwn3DY2PHhrWS6sz
 f4F4uTYowbnMxw/L/NHm/w0obwDXAesgOt2FxpO0Hsi6PGYqwS0kchvKeIUjle7LLwDbsXiq7Rj
 qpTWTo6E1viYHjoj/XBSgtNhRYAXOuFghs0lzy0z8LcdOmpB0L0LSSX+pq8AKNB524bqwXV4oFk
 NTNvuWTWyMqk98v8ZdAcn36bIOMtbjtae0vY0z5hse7tJG43Oks5KXQXamRA2yxzFCZaImdtodR
 Tzmno70VdP7uknxaJIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_101856_946061_96E183DE 
X-CRM114-Status: GOOD (  10.87  )
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

RnJvbTogT3phIFBhd2FuZGVlcCA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgoKVGhp
cyBzZXJpZXMgaW50ZWdyYXRlcyB0aGUgUklTQy1WIEFkdmFuY2VkIEludGVycnVwdCBBcmNoaXRl
Y3R1cmUgKEFJQSkKQVBMSUMgYW5kIElNU0lDIE0tbW9kZSBkcml2ZXJzIGludG8gdGhlIE9wZW5T
Qkkgc2JpX2lycWNoaXAgZnJhbWV3b3JrLApyZXBsYWNpbmcgdGhlIHByZXZpb3VzIHN0YW5kYWxv
bmUgZXhwZXJpbWVudGFsIGRyaXZlciB3aXRoIGEgY29tcGxldGUKY2FsbGJhY2stYmFzZWQgaW1w
bGVtZW50YXRpb24uCgpUaGUgc2VyaWVzIGFkZHMgZnVsbCBzdXBwb3J0IGZvcjoKCiAgLSBBUExJ
QyBEaXJlY3QgTW9kZSAoSURDKSBpbnRlcnJ1cHQgZGVsaXZlcnkgd2l0aCBwZXItaGFydCBJREMK
ICAgIHJlZ2lzdGVyIG1hbmFnZW1lbnQsIHByaW9yaXR5LWJhc2VkIHJvdXRpbmcsIGFuZCBzb3Vy
Y2UgZGVsZWdhdGlvbgogICAgdG8gUy1tb2RlIGNoaWxkIGRvbWFpbnMuCgogIC0gQVBMSUMgTVNJ
IE1vZGUgZmFsbGJhY2sgd2hlcmUgSURDIHN0cnVjdHVyZXMgYXJlIGFic2VudCwgcm91dGluZwog
ICAgd2lyZWQgaW50ZXJydXB0cyB0aHJvdWdoIElNU0lDIGJ5IHByb2dyYW1taW5nIEFQTElDIFRB
UkdFVCByZWdpc3RlcnMKICAgIHdpdGggaGFydCBpbmRleCwgZ3Vlc3QgaW5kZXgsIGFuZCBkeW5h
bWljYWxseSBhbGxvY2F0ZWQgRUlJRHMuCgogIC0gSU1TSUMgaW5zdGFuY2UtYmFzZWQgaXJxY2hp
cCByZWdpc3RyYXRpb24gd2l0aCBwZXItaGFydCBpbnRlcnJ1cHQKICAgIGZpbGUgbWFuYWdlbWVu
dCwgRUlFIENTUiBzdGF0ZSB0cmFja2luZywgd2FybS1ib290IHN0YXRlIHJlc3RvcmF0aW9uLAog
ICAgYW5kIE1TSSBjb21wb3NpdGlvbiBmb3IgdXBzdHJlYW0gQVBMSUMgYWZmaW5pdHkgcmVwcm9n
cmFtbWluZy4KCiAgLSBBIGRlY291cGxlZCBhcmNoaXRlY3R1cmUgYmV0d2VlbiBBUExJQyBhbmQg
SU1TSUMgZHJpdmVycyBtZWRpYXRlZAogICAgYnkgdGhlIHNiaV9pcnFjaGlwIGZyYW1ld29yay4g
QVBMSUMgcmVnaXN0ZXJzIHdyaXRlX21zaSBhbmQKICAgIG1zaV9jYWxsYmFjayBob29rczsgSU1T
SUMgcmVnaXN0ZXJzIHRoZSBpcnFjaGlwIE1TSSBzaW5rLiBOZWl0aGVyCiAgICBkcml2ZXIgZGly
ZWN0bHkgcmVmZXJlbmNlcyB0aGUgb3RoZXIncyBkYXRhIHN0cnVjdHVyZXMuCgogIC0gSVJRIGVu
YWJsZSBzdGF0ZSB0cmFja2luZyBpbiB0aGUgaXJxY2hpcCBmcmFtZXdvcmsgdmlhIGEgbmV3CiAg
ICBpcnFfc3RhdGUgZmllbGQgYW5kIElSUV9FTkFCTEVEIGZsYWcsIGV4cG9zZWQgdGhyb3VnaAog
ICAgc2JpX2lycWNoaXBfaXNfaXJxX2VuYWJsZWQoKSBmb3Igd2FybS1ib290IEVJRSBDU1IgcmVz
dG9yYXRpb24uCgogIC0gQSBmaXggZm9yIHR3byBhbGxvY2F0aW9uIGJ1Z3MgaW4gc2JpX2lycWNo
aXBfcmVnaXN0ZXJfbXNpKCkgdGhhdAogICAgcHJldmVudGVkIGNvbnRpZ3VvdXMgRUlJRCBhbGxv
Y2F0aW9uIHdoZW4gcmVzZXJ2ZWQgaGFuZGxlcnMgd2VyZQogICAgYWxyZWFkeSByZWdpc3RlcmVk
LgoKRHJpdmVyIGluaXRpYWxpemF0aW9uIGZvbGxvd3MgaGFyZHdhcmUgZGVwZW5kZW5jeSBvcmRl
cmluZzoKCiAgSU1TSUMgY29sZCBpbml0IOKGkiBBUExJQyBjb2xkIGluaXQKClRoZSBJTVNJQyBp
cnFjaGlwIG11c3QgYmUgcmVnaXN0ZXJlZCBiZWZvcmUgQVBMSUMgc28gdGhhdCBBUExJQyBNU0kK
bW9kZSBjYW4gcmVzb2x2ZSB0aGUgcGFyZW50IGNoaXAgYnkgdW5pcXVlX2lkIHZpYQpzYmlfaXJx
Y2hpcF9maW5kX2RldmljZSgpIGR1cmluZyBod2lycV9zZXR1cC4KCkFQTElDIERpcmVjdCBNb2Rl
IGFuZCBNU0kgTW9kZSBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlIGFuZCBzZWxlY3RlZAphdCBjb2xk
IGluaXQgdGltZSBiYXNlZCBvbiB0aGUgcHJlc2VuY2Ugb2YgSURDIHN0cnVjdHVyZXMgKG51bV9p
ZGMpCmFuZCB0aGUgSU1TSUMgZ2VvbWV0cnkgKGhhc19tc2ljZmdfbW1vZGUpIHBhcnNlZCBmcm9t
IHRoZSBEZXZpY2UgVHJlZS4KClRlc3Rpbmcgd2FzIHBlcmZvcm1lZCBvbiBhIFFFTVUgUklTQy1W
IHBsYXRmb3JtIHdpdGggMTI4IGhhcnRzLCB0d28KQVBMSUMgZG9tYWlucyAoTS1tb2RlIGF0IDB4
MTAwMTAwMDAsIFMtbW9kZSBhdCAweDEwMDE4MDAwKSwgYW5kIHR3bwpJTVNJQyBpbnN0YW5jZXMg
KEhhcnQgMC0xIGF0IDB4MTllMDAwMCwgSGFydCAyLTMgYXQgMHgxOWYwMDAwKSB3aXRoCjMxIHdp
cmVkIGludGVycnVwdCBzb3VyY2VzLiBFbmQtdG8tZW5kIE0tbW9kZSBpbnRlcnJ1cHQgZGVsaXZl
cnkgdmlhCkFQTElDIE1TSSBtb2RlIHdhcyB2ZXJpZmllZCB1c2luZyBhIHNvZnR3YXJlIGludGVy
cnVwdCB0ZXN0IGNsaWVudApleGVyY2lzaW5nIHRoZSBHRU5NU0kgcGF0aC4KClBhd2FuZGVlcCBP
emEgKDcpOgogIGxpYjogdXRpbHMvaXJxY2hpcC9hcGxpYzogaW1wbGVtZW50IGRpcmVjdCBtb2Rl
IGlycWNoaXAgY2FsbGJhY2tzCiAgbGliOiB1dGlscy9pcnFjaGlwL2ltc2ljOiBlbWJlZCBzYmlf
aXJxY2hpcF9kZXZpY2UgaW4gaW1zaWMgZGF0YQogIGxpYjogdXRpbHMvaXJxY2hpcC9pbXNpYzog
dHJhY2sgSVJRIGVuYWJsZSBzdGF0ZSBhbmQgcmVzdG9yZSBFSUUgb24KICAgIHdhcm0gaW5pdAog
IGxpYjogdXRpbHMvaXJxY2hpcC9pbXNpYzogbWlncmF0ZSB0byBpcnFjaGlwIGZyYW1ld29yawog
IGxpYjogdXRpbHMvaXJxY2hpcC9hcGxpYzogYWRkIE1TSSBtb2RlIHN1cHBvcnQgd2l0aCBJTVNJ
QyBwYXJlbnQKICAgIGxpbmtpbmcKICBsaWI6IHNiaV9pcnFjaGlwOiBmaXggTVNJIEVJSUQgZ2Fw
IGFuZCB0YWlsIGFsbG9jYXRpb24gbG9naWMgaW4KICAgIHJlZ2lzdGVyX21zaQoKIGxpYi9zYmkv
c2JpX2lycWNoaXAuYyAgICAgICAgICAgICAgIHwgICA0ICstCiBsaWIvdXRpbHMvaXJxY2hpcC9h
cGxpYy5jICAgICAgICAgICB8IDQwMCArKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGxpYi91
dGlscy9pcnFjaGlwL2FwbGljLmggICAgICAgICAgIHwgIDMwICsrCiBsaWIvdXRpbHMvaXJxY2hp
cC9pbXNpYy5jICAgICAgICAgICB8IDM1MCArKysrKysrKysrKysrKysrKysrKysrKy0tCiBsaWIv
dXRpbHMvaXJxY2hpcC9pbXNpYy5oICAgICAgICAgICB8ICAgNSArLQogaW5jbHVkZS9zYmkvc2Jp
X2lycWNoaXAuaCAgICAgICAgICAgfCAgMjAgKysKIDYgZmlsZXMgY2hhbmdlZCwgNzgwIGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi40My4wCgoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
