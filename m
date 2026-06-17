Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A120ACD98F9
	for <opensbi@archiver.kernel.org>; Wed, 17 Jun 2026 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fa72Rr7HI3pbSdE/RrbCEIFykBpncpDGS+IAotq5kvo=; b=SBgQoe/Vic0oaP
	bM6a9u3ORYUPmp5EpV0ufB8xJANO0ZAOl2/1OoUeClC9K5+pEGtPTeDu6GzBf3PvfoxlDlkoQhK/o
	oyywIiiQ46Vv2Y3fdrVoogxfKjJoOmEOf7pRsEtydyXBy/M9wta+pPwzZqrsujQF+dv1tIPbcrF0Y
	IBO8vRo1gt2kG9k/ZQv9PXeE7DbAm47cepZ8rORpB5nPjrpqfP0fWkuuS+f4jOUzqpqGKokN8+whc
	HHdTkuNtrB6+VHQvLjKpHiWCBXz2pdvZJxXxWFhLSF8uK2l/Cz+PQcs+k6YDRiB1c6fSjSmPsNN84
	hwdll6edQ2Bp44ubG2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvC4-00000000B7Y-2pbQ;
	Wed, 17 Jun 2026 18:40:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZvBz-00000000B3I-2ZvP
	for opensbi@lists.infradead.org;
	Wed, 17 Jun 2026 18:40:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HI14Jc3577334
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n3pkbSj/UTVubfcRiaynZL
	cut+ydS446jeYPRJfi8fw=; b=jmAxLjASNZY0tikKcWX92Xf5ySF7jJ6f9h3CgO
	Un6eV4fCGtqtT6O/JBcSLgFdaIYzjqY8fSJpQrSQjZMWY6s8F99rZcpCwqbKDpOO
	e8zTzfJmaOmGc3r4v4UihjATJTv/zO/ysJNmdN695bRbfyjB7SJl3OZ6JS2ykrqs
	XcNno76lzEBvbgzydFLg73w5U1e9vcaSTpf+mFjneAOewhwm/b+HYm32ioDA4nTB
	RdlaXkKgQh/RzAV8eN6++dkKFDRLdRnqEMTudWpbFWQByBwL1c+GPdY44xiSlLYS
	PbsFlggPv3KeWhK8cAQTaLIHd/YHVInmGWqBnkG4bPWiSz9Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7g5dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:50 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65HIeexq002035
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4eux5j9nyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:49 +0000 (GMT)
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65HIenbP002170
	for <opensbi@lists.infradead.org>; Wed, 17 Jun 2026 18:40:49 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 65HIen0Q002167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 18:40:49 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 1AD7F24E2F; Wed, 17 Jun 2026 11:40:49 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v2 0/6] RISC-V AIA: APLIC and IMSIC irqchip framework integration
Date: Wed, 17 Jun 2026 11:40:32 -0700
Message-ID: <20260617184047.70388-1-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE4MCBTYWx0ZWRfX1qTjp0IRVh82
 S+tlathrlJvOY7yMnQERsmoSqZItFj3G2VDkkrvovuVAJR4/WacBQCZdCp1U5glKq2k4Nd9eFle
 QN9ZiWZSF4ZInA6Xw27tNShyWRuHjreQ/Nu78ixFLQ7V7Lr3CRJ9oHASyV1RUOyFV6kO7tpFRdL
 d1EYWgBsjG1rANQ6ww9Iuf3LZTsr6dUL095i4IHBQmb+zjiH1ZKYUasTxPPfU9QH1BLmasAsKAV
 qbbbnU2SMNdPcx5qjQJOk9GSColP9gTvwc2v8lfDPfU1kaeGTbwrYUDMr8rke6JiG0FDm+WdOIe
 4fES5P5YbWKl1kPv78pWPoTbefax5h3Ppr3q0cDiKYTH3OxGTwadMMfKthalN8KFMqDWePTkXxY
 QuGKa/3UFznj/cr/ZRIXOKN1PN6aCES7CYOEUJVzSDg+nCvUFGCudDzlHdKwBhtFDa2BdedkBeH
 RZ7DTIhQFGMznMZVGGg==
X-Proofpoint-GUID: yues1rHSw--gzgdhPVbYZtdE-w5xHqfn
X-Proofpoint-ORIG-GUID: yues1rHSw--gzgdhPVbYZtdE-w5xHqfn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE4MCBTYWx0ZWRfX+si97yfk74uL
 m8kRHmnodP61zuHY/+AnyOlRMvjCGxE/TpByQslx4xokKu1gfRC6nc2Be9GCFI0d3+THdIDuIqY
 YyzC2OIqOwA9fAt4VLoPBS/Po4IlAc8=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a32ea32 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8MMNWIelmuzNlgHmPHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_114051_773311_C5652189 
X-CRM114-Status: GOOD (  11.34  )
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
YmVyIChQUE4pIGJhc2VkIHNoaWZ0cyBhbmQgbWFza3MuCgpQYXdhbmRlZXAgT3phICg2KToKICBs
aWI6IHV0aWxzL2lycWNoaXAvYXBsaWM6IGltcGxlbWVudCBkaXJlY3QgbW9kZSBpcnFjaGlwIGNh
bGxiYWNrcwogIGxpYjogdXRpbHMvaXJxY2hpcC9hcGxpYzogYWRkIE1TSSBtb2RlIHN1cHBvcnQg
d2l0aCBJTVNJQyBwYXJlbnQKICAgIGxpbmtpbmcKICBsaWI6IHV0aWxzL2lycWNoaXAvaW1zaWM6
IGVtYmVkIHNiaV9pcnFjaGlwX2RldmljZSBpbiBpbXNpYyBkYXRhCiAgbGliOiB1dGlscy9pcnFj
aGlwL2ltc2ljOm1pZ3JhdGUgdG8gaXJxY2hpcCBmcmFtZXdvcmsKICBsaWI6IHV0aWxzL2lycWNo
aXAvaW1zaWM6IHRyYWNrIElSUSBlbmFibGUgc3RhdGUgYW5kIHJlc3RvcmUgRUlFIG9uCiAgICB3
YXJtIGluaXQKICBsaWI6IHNiaV9pcnFjaGlwOiBmaXggTVNJIEVJSUQgZ2FwIGFuZCB0YWlsIGFs
bG9jYXRpb24gbG9naWMgaW4KICAgIHJlZ2lzdGVyX21zaQoKIGluY2x1ZGUvc2JpL3NiaV9pcnFj
aGlwLmggICAgICAgICB8ICAgNCArCiBpbmNsdWRlL3NiaV91dGlscy9pcnFjaGlwL2FwbGljLmgg
fCAgIDIgKwogaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9pbXNpYy5oIHwgICAyICsKIGxpYi9z
Ymkvc2JpX2lycWNoaXAuYyAgICAgICAgICAgICB8ICAyOSArLQogbGliL3V0aWxzL2ZkdC9mZHRf
aGVscGVyLmMgICAgICAgIHwgICAxICsKIGxpYi91dGlscy9pcnFjaGlwL2FwbGljLmMgICAgICAg
ICB8IDYwMyArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIGxpYi91dGlscy9pcnFjaGlw
L2ltc2ljLmMgICAgICAgICB8IDMxNiArKysrKysrKysrKysrLS0tCiA3IGZpbGVzIGNoYW5nZWQs
IDg0MiBpbnNlcnRpb25zKCspLCAxMTUgZGVsZXRpb25zKC0pCgotLSAKMi40My4wCgoKLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
