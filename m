Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091FEC44506
	for <opensbi@archiver.kernel.org>; Sat, 11 Jul 2026 20:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/A+28cjgIqqDZ082PjfmuyFydyXNS2CgEZAAGo5HEnA=; b=Ckr5n7pbTPHGMd
	Ca/ftjLbpD3txIiBKX92XtZ3jurUuY/mEeeUgAEBEJzTlP2WAcRuElaF2n/QknrIExiwjP+GXX2hT
	xDn52h/T7Qm30dl7A6UED4BI5c0SyjvnmAmi0OR/R1Xk6LKaYQyut+sZHKDhRlNMPzZidP9lj+hpi
	bEOd/tayDX5VwAeM43ll+8GsCiRt6HYBGzkJDgZ15pXYJQZBHI61ty1lO5H3JlpuotZssw7iDTKav
	4x6vJJEIacr4OnNQNmrVJmFVBDIzWX/ZFRAEYUvB36B6yasRj0Pr2GMntPDT+vPuLVIIsEBZXirNC
	1CjvGU5W+K0NeR+LaFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wie5b-00000006qk3-11R3;
	Sat, 11 Jul 2026 20:14:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wie5Y-00000006qhj-2ijO
	for opensbi@lists.infradead.org;
	Sat, 11 Jul 2026 20:14:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHpkK2342547
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o5vcghjRbpng621dYXxm43
	SWitv/98CLLKlvgrggKx0=; b=jcznSk82p2fyLl3hZzAMr/MLONDk4J1+fwPD7v
	KNNwJNl43orPaGARDEa4vvu/9fGE8b0B3KLqbqhszGflyTa/I5nM+NoJRWyPHyP0
	XOZhoz/aCKlXwpDEqmNeRJZKLYaI9WjwhLdsJXjdI4OnzndO92FJSDiSLRpOPLUS
	UwMlKFbkSab4SH02957JNstm95RSm5GvrrBwgYhnKWRptllwMpg1QeeFHojo4uuM
	d30gPmdZztBUjB8KVvAy4xbd+IyVS3gw1CPPOD414vSuAo+u0Zi33+24MmQvjVk2
	EQ3bl2FImp61PrjT6AMtM/Cy5dexwfYdL0Jz3cQ+19q3gdjA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8v9ghq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:15 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66BKEFbe015353;
	Sat, 11 Jul 2026 20:14:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4fbewhcymq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:14 +0000 (GMT)
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66BKEELg015341
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 20:14:14 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 66BKEEFa015336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jul 2026 20:14:14 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 8C85820AE8; Sat, 11 Jul 2026 13:14:14 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v3 0/6] RISC-V AIA: APLIC and IMSIC irqchip framework integration
Date: Sat, 11 Jul 2026 13:14:00 -0700
Message-ID: <20260711201413.2931099-1-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: XFzwqbP5FIW_7AmirMUJpuKGAqP834E1
X-Proofpoint-GUID: XFzwqbP5FIW_7AmirMUJpuKGAqP834E1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDIwNiBTYWx0ZWRfX6kqqI0+P+ptZ
 m3tLcse1ioUI5CEttBCbMny4DE+H+bsXSz+XsV5R5URiz2ZTZp4+hmXgZ3WVoY2oFnROSrazxh6
 sidNuPakoxb1DzkEHEXr0yeIqrdwsuY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDIwNiBTYWx0ZWRfX0ElOfAaFeLpf
 hlVkYLygyr0xPeSqQoWR9hCLsep1+AHe21eEfwkIoo3TiCI+OGkNoZBiHUyQagfMVqSanxiQL/B
 xZiA4/XbxgOQpKc4YM9odPWD4ee+TygAhzRERzffY3f5E8Q4oQ840KHMjeSu4ZamXPe2rp0yVIv
 rapAqqV33Pagh7q5yK5axdS1jXrFHr3jUOfj9DV5rqYX5TGrUiCThQrKclBIItCNUy6PtNsTJzd
 JPytJL7TS5+ogu8ww5gVZevBoZl1itHWsjooNiVf0Wnidu4LYYtNbvNJUoSgfGscA7XUzWSsBkp
 qEQbP9kdSrR51MDKqRXffii27FcTtpdkF/FVPMR0cLFDiol0orfrfjRFqaRmXP2TgEBzDwCjLlL
 Im8f1DNKPapTwRV9GAdiUCSE63Kxgox/lqXaeB73LSNbpwFnBBhbrlKdLdDBpv35ksVtKnBV5Ac
 6kckYf+gopcl+BeR3Ig==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a52a417 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8MMNWIelmuzNlgHmPHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_131416_692938_BEC97B48 
X-CRM114-Status: GOOD (  11.96  )
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
cm9jZXNzX2lycSBub3cgcmVhZHMgQVBMSUNfSURDX0NMQUlNSQoKUGF3YW5kZWVwIE96YSAoNik6
CiAgbGliOiB1dGlscy9pcnFjaGlwL2FwbGljOiBpbXBsZW1lbnQgZGlyZWN0IG1vZGUgaXJxY2hp
cCBjYWxsYmFja3MKICBsaWI6IHV0aWxzL2lycWNoaXAvYXBsaWM6IGFkZCBNU0kgbW9kZSBzdXBw
b3J0IHdpdGggSU1TSUMgcGFyZW50CiAgICBsaW5raW5nCiAgbGliOiB1dGlscy9pcnFjaGlwL2lt
c2ljOiBlbWJlZCBzYmlfaXJxY2hpcF9kZXZpY2UgaW4gaW1zaWMgZGF0YQogIGxpYjogdXRpbHMv
aXJxY2hpcC9pbXNpYzptaWdyYXRlIHRvIGlycWNoaXAgZnJhbWV3b3JrCiAgbGliOiB1dGlscy9p
cnFjaGlwL2ltc2ljOiB0cmFjayBJUlEgZW5hYmxlIHN0YXRlIGFuZCByZXN0b3JlIEVJRSBvbgog
ICAgd2FybSBpbml0CiAgbGliOiBzYmlfaXJxY2hpcDogZml4IE1TSSBFSUlEIGdhcCBhbmQgdGFp
bCBhbGxvY2F0aW9uIGxvZ2ljIGluCiAgICByZWdpc3Rlcl9tc2kKCiBpbmNsdWRlL3NiaS9zYmlf
aXJxY2hpcC5oICAgICAgICAgfCAgIDQgKwogaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9hcGxp
Yy5oIHwgICAyICsKIGluY2x1ZGUvc2JpX3V0aWxzL2lycWNoaXAvaW1zaWMuaCB8ICAgMiArCiBs
aWIvc2JpL3NiaV9pcnFjaGlwLmMgICAgICAgICAgICAgfCAgMzcgKy0KIGxpYi91dGlscy9mZHQv
ZmR0X2hlbHBlci5jICAgICAgICB8ICAgMSArCiBsaWIvdXRpbHMvaXJxY2hpcC9hcGxpYy5jICAg
ICAgICAgfCA1NDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCiBsaWIvdXRpbHMvaXJx
Y2hpcC9pbXNpYy5jICAgICAgICAgfCAzMDkgKysrKysrKysrKysrKystLS0KIDcgZmlsZXMgY2hh
bmdlZCwgODAyIGluc2VydGlvbnMoKyksIDk1IGRlbGV0aW9ucygtKQoKLS0gCjIuNDMuMAoKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
