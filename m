Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBC3C44538
	for <opensbi@archiver.kernel.org>; Tue, 21 Jul 2026 21:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C3/s0icPnVma3Ap2ehzSA8fax4IHgHLpD/Llsv/8IzM=; b=Swxofoh2+JDiRP
	3XyyVdKjMW87FoiSllolT2/YPTQjZ2dfBzH5D9NM8DcOwh3Ab6NPUwaLSBgCrTSiet4ZxAp3u71I+
	IEss0lv561qU2kTSYWXRxGoP2DAam0ABxfDPBUR+mlSgLh6q6u7AnZTs8zkkq96GhJRLy5iWlP+57
	1NMB8C+ZEsXjS9DkKb+5jPTLGwjAimbWIJtLh59VqtQvDu44IZtma4sChA7l612Jit/mWLsOkTljr
	ANfK/+emOdSwEAqFy2agFM1pTTYwJ5j3CBE6S3Eo7HkTcqoDYPVnqOOx7qpK7jyeFrYEtBcEJejk+
	IZO2aMBSdW3Pmf/RnqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIKR-0000000ATWV-1Bic;
	Tue, 21 Jul 2026 21:48:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIKN-0000000ATTl-0gZl
	for opensbi@lists.infradead.org;
	Tue, 21 Jul 2026 21:48:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlfRQ2701787
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wt+x++G34fbjvcIY73rZco
	On/p3NvuqVkgNwokPqfJU=; b=CIVer+99f6fNzzUTgAXnKh5V1nLtiRMz+pdazQ
	FYLCb5vUSw1qXufeUBuhO8VAHU6kzv5MnMUi+A3JVq529Ap8kE8GYCnf0HMFJ1LD
	kjCG7D/3e5yfFrVg3TZZ2S10OmakZ/t6a7gvqBiw/iflsMC0OzVT/fFwa2cYlvGT
	p8o02adhN+WQOf2LgijBMJo5y15+9xKATwGi0aqCRBcv8fcszSiSFB/0EVz4GwVj
	Dylq69Ly7gRICsF/R/Lt4AvTotDQOmJv41AR7yQ5iNn9E+CPTtg88y3v7GLYFSLw
	1EBuN/c748VeBlATTHMrkMsmJLFjUSxIBfKLwn5qm4NgouSw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeadaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:48:36 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66LLmZeb021771;
	Tue, 21 Jul 2026 21:48:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fgj6ju8gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:48:35 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66LLmZ9N021759
	for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 21:48:35 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 66LLmZfs021757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:48:35 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id 6A3BC21C28; Tue, 21 Jul 2026 14:48:35 -0700 (PDT)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v5 0/6] ISC-V AIA: APLIC and IMSIC irqchip framework integration
Date: Tue, 21 Jul 2026 14:48:24 -0700
Message-ID: <20260721214833.687361-1-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 7U4j0ZWOSh84qfslXU-54UWsEMWjWlGn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfX7/dfAt6jH34x
 ZTcgADuCBDWo2ZK1QlEWVM5zcEg+vcqdKbnkhoLxvjfnsxbjEyki+VODxuGe4k1h7qWbWrjLXBv
 X8L87ns4Lg0Z+ypdyI+EExWPCWy9IaA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNiBTYWx0ZWRfXw43W3hm4jCRx
 Epo2VHM4J5rCK94VfLqB1/u0WGXcAbf96+gL3NhbmtyN7kAZfvrdX7mV85ookar0le7HLVVmkjE
 WBXgGqKMysOYv3n8F/1SmvDBybMGtf1L4TsaAPxQVl3UDIZ/n/yHjrrY9dAw0MXKG1jW0/l+ubR
 9JOXqNTo+PbaanQS/BhJfw04/GpwS7xb78xX0JMd5rNueZGpPsVHFxh/6ayX8FiVuV5VvI8pY+j
 4oGMQhQ+PCm7X6Yzm7m0Q0AxbuNIgTDuWNUksP5bbmFLcLCSSjNfGr9ULEsDX5aZZ+xsscsT7Xj
 yuiOkeYL0pe+0o3jsTRQXtpwSX+Vnb9sfsWgLoAmsjFOQusw6YD4lWAf1BJuV8LlfXRafnoYiom
 3zbhPLyJKZIl+pmF8zHGY81sxXCXiL1JjQw1JHZmCwkOU5HEvc9kiwhLYOjPUEnRDiKWptzBuAK
 l7h/wRekAk+zm0MYSLQ==
X-Proofpoint-GUID: 7U4j0ZWOSh84qfslXU-54UWsEMWjWlGn
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5fe934 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Dl4vDKS3KgQejNsc4ZgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_144839_326980_684BBE3B 
X-CRM114-Status: GOOD (  14.64  )
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
aGlwX2lzX2lycV9lbmFibGVkIHRvIHNiaV9pcnFjaGlwX2lzX2h3aXJxX2VuYWJsZWQKCkNoYW5n
ZXMgc2luY2UgdjQ6Ci0tLS0tLS0tLS0tLS0tLS0tCiogUmVwbGFjZWQgc2JpX2lycWNoaXBfZ2V0
X2hhbmRsZXJfcHJpdigpIHdpdGggYSBnZW5lcmljIHBlci1od2lycQogIHByaXZhdGUgZGF0YSBB
UEkuIEFkZGVkICJ2b2lkICpwcml2IiBmaWVsZCB0byBzdHJ1Y3QKICBzYmlfaXJxY2hpcF9od2ly
cV9kYXRhIGFuZCBpbnRyb2R1Y2VkIHNiaV9pcnFjaGlwX3NldF9od2lycV9wcml2KCkKICBhbmQg
c2JpX2lycWNoaXBfZ2V0X2h3aXJxX3ByaXYoKSB0byBzZXQgYW5kIHJldHJpZXZlIHBlci1od2ly
cQogIHByaXZhdGUgZGF0YS4gVGhlIEFQSSBpcyBubyBsb25nZXIgdHlwZWQgdG8gc3RydWN0IGFw
bGljX21zaV9kYXRhCiAgYW5kIGlzIG5vdyBmdWxseSBnZW5lcmljLgoKKiBEcm9wcGVkIHBhcmVu
dF9pcnFfbWFwW10gZnJvbSBzdHJ1Y3QgYXBsaWNfZGF0YS4gVGhlIEVJSUQtdG8tc291cmNlCiAg
bWFwcGluZyBpcyBub3cgdHJhY2tlZCB2aWEgdGhlIHBlci1od2lycSBwcml2YXRlIGRhdGEuIEFk
ZGVkCiAgcGFyZW50X2h3aXJxIGZpZWxkIHRvIHN0cnVjdCBhcGxpY19tc2lfZGF0YSB0byByZWNv
cmQgdGhlIElNU0lDCiAgaHdpcnEgYWxsb2NhdGVkIGZvciBlYWNoIEFQTElDIHNvdXJjZS4gaHdp
cnFfc2V0dXAgc3RvcmVzIHRoaXMgdmlhCiAgc2JpX2lycWNoaXBfc2V0X2h3aXJxX3ByaXYoKSBh
bmQgaHdpcnFfc2V0X2FmZmluaXR5IHJldHJpZXZlcyBpdAogIHZpYSBzYmlfaXJxY2hpcF9nZXRf
aHdpcnFfcHJpdigpLgoKKiBGaXhlZCBBUExJQyBNU0ktbW9kZSBFT0kgZm9yIGxldmVsLXRyaWdn
ZXJlZCBpbnRlcnJ1cHRzLiBSZXBsYWNlZAogIGFwbGljX2lycV9jbHJpcCgpIHdpdGggYSB3cml0
ZSB0byBTRVRJUE5VTSB0byByZS10cmlnZ2VyIHRoZQogIGludGVycnVwdCBwZW5kaW5nIHN0YXRl
LCBhbGlnbmluZyB3aXRoIHRoZSBMaW51eCBBUExJQyBNU0ktbW9kZQogIGRyaXZlciBiZWhhdmlv
dXIgKGlycS1yaXNjdi1hcGxpYy1tc2kuYywgYXBsaWNfaXBpX3NlbmRfbWFzaygpKS4KCiogRml4
ZWQgdGFiL3NwYWNlIGFsaWdubWVudCBpc3N1ZXMgdGhyb3VnaG91dCBhcGxpYy5jIGFuZAogIHNi
aV9pcnFjaGlwLmMuCgoqIFJlcGxhY2VkIGFsbCBoYXJkLWNvZGVkIGZ1bmN0aW9uIG5hbWUgc3Ry
aW5ncyBpbiBzYmlfcHJpbnRmKCkgY2FsbHMKICB3aXRoICVzIGFuZCBfX2Z1bmNfXyBhY3Jvc3Mg
Ym90aCB0aGUgQVBMSUMgYW5kIElNU0lDIGRyaXZlcnMuCgpQYXdhbmRlZXAgT3phICg2KToKICBs
aWI6IHV0aWxzL2lycWNoaXAvYXBsaWM6IGltcGxlbWVudCBkaXJlY3QgbW9kZSBpcnFjaGlwIGNh
bGxiYWNrcwogIGxpYjogdXRpbHMvaXJxY2hpcC9hcGxpYzogYWRkIE1TSSBtb2RlIHN1cHBvcnQg
d2l0aCBJTVNJQyBwYXJlbnQKICAgIGxpbmtpbmcKICBsaWI6IHV0aWxzL2lycWNoaXAvaW1zaWM6
IGVtYmVkIHNiaV9pcnFjaGlwX2RldmljZSBpbiBpbXNpYyBkYXRhCiAgbGliOiB1dGlscy9pcnFj
aGlwL2ltc2ljOm1pZ3JhdGUgdG8gaXJxY2hpcCBmcmFtZXdvcmsKICBsaWI6IHV0aWxzL2lycWNo
aXAvaW1zaWM6IHRyYWNrIElSUSBlbmFibGUgc3RhdGUgYW5kIHJlc3RvcmUgRUlFIG9uCiAgICB3
YXJtIGluaXQKICBsaWI6IHNiaV9pcnFjaGlwOiBmaXggTVNJIEVJSUQgZ2FwIGFuZCB0YWlsIGFs
bG9jYXRpb24gbG9naWMgaW4KICAgIHJlZ2lzdGVyX21zaQoKIGluY2x1ZGUvc2JpL3NiaV9pcnFj
aGlwLmggICAgICAgICB8ICAxMCArCiBpbmNsdWRlL3NiaV91dGlscy9pcnFjaGlwL2FwbGljLmgg
fCAgIDEgKwogaW5jbHVkZS9zYmlfdXRpbHMvaXJxY2hpcC9pbXNpYy5oIHwgICAyICsKIGxpYi9z
Ymkvc2JpX2lycWNoaXAuYyAgICAgICAgICAgICB8ICA3NCArKystCiBsaWIvdXRpbHMvZmR0L2Zk
dF9oZWxwZXIuYyAgICAgICAgfCAgIDEgKwogbGliL3V0aWxzL2lycWNoaXAvYXBsaWMuYyAgICAg
ICAgIHwgNTYwICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQogbGliL3V0aWxzL2lycWNo
aXAvaW1zaWMuYyAgICAgICAgIHwgMzA4ICsrKysrKysrKysrKystLS0KIDcgZmlsZXMgY2hhbmdl
ZCwgODYxIGluc2VydGlvbnMoKyksIDk1IGRlbGV0aW9ucygtKQoKLS0gCjIuNDMuMAoKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
