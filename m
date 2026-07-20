Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B8CC44520
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 21:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DzOg/2TwYZ4c0k90KYkExfHmTMpEIW6DQlMRN27F7Ps=; b=juemchI8tZj2DE
	nBe4PbJBLpc1fGvE1uE6ZPYkcHs7caxl1ttjGnKllfHxwKqdTE5P52/e/b4tPwrJhdPO6sF1RzdE0
	YDl0ZiVTn0qI2I0b1Vy/iJPGcycFpW69tiM6Ax1WQ4tQo4AuMppOYfgbm7rtW6MoPp5VxklrWQIfp
	YO4IK1hDEmOQDpuU4JkMbZlPTq/ndylibrCaebqZvG9ZCIpq3T/ELk9wzDTuaMxnr/Z5Nr9Vxqnz5
	AwpxV34kRwCGYMiA3rZCu5bgvmJuBPu14Hj2JkytdeYioSGDOZiVDg8yAysj4RgZh6GxiZrw5CutB
	9kTiqSrpHlNYaDGS/WaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvDS-00000007ukW-1MQU;
	Mon, 20 Jul 2026 21:07:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvDN-00000007ujj-0BDT
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 21:07:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTXqQ3106530
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6bdlvjOg9ecXeG9blrkTQy
	5FOQLG7KSuUDXwkfYUnDc=; b=MQtSBnqgzmYr6UGN/QbQQWQNDDdt/JmiMTJwT1
	CdhxlAxAJUmUDa7Nm6Ia8qOQjK1W2j4tzL1VHy1sMlItyo41UI1x6Kbby1HMhqk+
	uOSMmmkZ1HVP4qu6ruZ4zmp1LalkNuhWW7TW2o663XP8eCFm/necpGpNLGEDIJ1B
	iGJI2Io9MaeI/MsRaEVFVvbZTCgSGVlsebNiDH2HXy6Rfn3Ci33SOSSEdxtyiSfP
	dcIWAgvK2LG3r85ki5NCa6z08+Ceb1egY+PqSV56efHNqIyv5KM0+SLr6OJWjP1g
	KBHtqQTQhqiESm8EtWUOwuAU92S1LZxKxLyTtNFKmcIJshDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs532f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:51 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66KL7o9B030701;
	Mon, 20 Jul 2026 21:07:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4fgj41g0gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:50 +0000 (GMT)
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66KL6M67028479
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:07:50 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 66KL7nLD030695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 21:07:50 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 4AFF021BEF; Mon, 20 Jul 2026 14:07:49 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v4 0/6] RISC-V AIA: APLIC and IMSIC irqchip framework integration
Date: Mon, 20 Jul 2026 14:07:40 -0700
Message-ID: <20260720210748.2893688-1-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX/cbbxUhDwMK3
 wrMQzz2ZEwuyWwQlWsuaojBe6Nd8QaAHM2uTh3YHkjH2DyR0K7ls6uveg1kYaoygxoyxjsHK+i5
 txoXQqql1i0X/Kb+O4WKLGikUd+XPCQ=
X-Proofpoint-GUID: sHpQ_Te8t74P_lOE88U3oZ3NsbrH7LaN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIyOSBTYWx0ZWRfX63uBxIfurnCt
 e8rfjS4iridL61Hr4pmljtg4OFxAFhdoibx8mr6V3nkseh32BuO/GScC8wbyxPfbQZOUnAf2rLA
 IMriRxCPJfNltGXdTHxAw0BG/n/iaQ9yzAkCMyh8CtYeMr02+nBP/q4aTfF8tzpODWBCHVnbNbJ
 AyWFjKN2oOzGz1kKZVnc1Xh64sPyDKBDMkryDJU8GYfBF0/iG3hNdFp3GAHAnfA2B0nW0VkTdW9
 0Oy1VRxSO1u0sO0j2q5SCQdb8VxuJ7OYLjMMXDRrTf84r+x4mfW39igU5tYJvGbMxIFWO+LhCz0
 Ebb2KWFzVrr0BG8DNOBR5k+Dqxlx0zP3i5UHDqZW3XFqpZI+N6H6hUZ8GlsyOwvvxD4ClGKYxnD
 y0mq2rrwZ2cW3KWtUYGQGZsgTnEfKL9jxJ1/SaQWUZydpGGFZUf830Q1bcCYb597vBBFLjHekWY
 FKb5jwyH65rQdqvjuxA==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5e8e27 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8MMNWIelmuzNlgHmPHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: sHpQ_Te8t74P_lOE88U3oZ3NsbrH7LaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_140753_095108_E5F99B42 
X-CRM114-Status: GOOD (  11.66  )
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
cnVwdCB0ZXN0IGNsaWVudApleGVyY2lzaW5nIHRoZSBHRU5NU0kgcGF0aC4KCkNoYW5nZXMgc2lu
Y2UgdjE6CkFQTElDIE1TSSBEZWNvZGluZzoKUmVmYWN0b3JlZCB0aGUgaGFydF9pbmRleCBkZXJp
dmF0aW9uIGxvZ2ljIGluIGRlcml2ZV9oYXJ0X2luZGV4KCkKdG8gdXNlIFBhZ2UgRnJhbWUgTnVt
YmVyIChQUE4pIGJhc2VkIHNoaWZ0cyBhbmQgbWFza3MuCgpDaGFuZ2VzIHNpbmNlIHYyOgpBZGRl
ZCBTQklfRUFMUkVBRFkgZ3VhcmQgdG8gZmFpbCBpZiBod2lycSB3YXMgYWxyZWFkeSB1bm1hc2tl
ZAphcGxpY19od2lycV9lb2kgaGFuZGxlcyBvbmx5IG1zaSBtb2RlIGZvciBhcGxpYwphcGxpY19w
cm9jZXNzX2lycSBub3cgcmVhZHMgQVBMSUNfSURDX0NMQUlNSQoKQ2hhbmdlcyBzaW5jZSB2MzoK
cHJpbnQgZm9ybWF0dGluZyBjb3JyZWN0ZWQKcmVtb3ZlZCBhcGxpY19tc2lfcHRyc1tdIGFuZCBh
ZGRlZCBzYmlfaXJxY2hpcF9nZXRfaGFuZGxlcl9wcml2IGhlbHBlcgpyZW5hbWVkIHNiaV9pcnFj
aGlwX2lzX2lycV9lbmFibGVkIHRvIHNiaV9pcnFjaGlwX2lzX2h3aXJxX2VuYWJsZWQKClBhd2Fu
ZGVlcCBPemEgKDYpOgogIGxpYjogdXRpbHMvaXJxY2hpcC9hcGxpYzogaW1wbGVtZW50IGRpcmVj
dCBtb2RlIGlycWNoaXAgY2FsbGJhY2tzCiAgbGliOiB1dGlscy9pcnFjaGlwL2FwbGljOiBhZGQg
TVNJIG1vZGUgc3VwcG9ydCB3aXRoIElNU0lDIHBhcmVudAogICAgbGlua2luZwogIGxpYjogdXRp
bHMvaXJxY2hpcC9pbXNpYzogZW1iZWQgc2JpX2lycWNoaXBfZGV2aWNlIGluIGltc2ljIGRhdGEK
ICBsaWI6IHV0aWxzL2lycWNoaXAvaW1zaWM6bWlncmF0ZSB0byBpcnFjaGlwIGZyYW1ld29yawog
IGxpYjogdXRpbHMvaXJxY2hpcC9pbXNpYzogdHJhY2sgSVJRIGVuYWJsZSBzdGF0ZSBhbmQgcmVz
dG9yZSBFSUUgb24KICAgIHdhcm0gaW5pdAogIGxpYjogc2JpX2lycWNoaXA6IGZpeCBNU0kgRUlJ
RCBnYXAgYW5kIHRhaWwgYWxsb2NhdGlvbiBsb2dpYyBpbgogICAgcmVnaXN0ZXJfbXNpCgogaW5j
bHVkZS9zYmkvc2JpX2lycWNoaXAuaCAgICAgICAgIHwgICA3ICsKIGluY2x1ZGUvc2JpX3V0aWxz
L2lycWNoaXAvYXBsaWMuaCB8ICAgMiArCiBpbmNsdWRlL3NiaV91dGlscy9pcnFjaGlwL2ltc2lj
LmggfCAgIDIgKwogbGliL3NiaS9zYmlfaXJxY2hpcC5jICAgICAgICAgICAgIHwgIDQ0ICsrLQog
bGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgICAgICAgIHwgICAxICsKIGxpYi91dGlscy9pcnFj
aGlwL2FwbGljLmMgICAgICAgICB8IDU0MSArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0K
IGxpYi91dGlscy9pcnFjaGlwL2ltc2ljLmMgICAgICAgICB8IDMwOCArKysrKysrKysrKysrKy0t
LQogNyBmaWxlcyBjaGFuZ2VkLCA4MTAgaW5zZXJ0aW9ucygrKSwgOTUgZGVsZXRpb25zKC0pCgot
LSAKMi40My4wCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
