Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B16CA5FCE
	for <opensbi@archiver.kernel.org>; Mon,  5 Oct 2026 03:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlIGyA1UIwSo2aN4ICmvWoVkpZpbB+5bNxcwq7tU504=; b=F0RtxcRY93nJw4
	HJpH0FqtAhOuiZCXBnzwKh3fvTWLq/XyAgeqgat6xiySCintdTc3EB/iWYBdVpX3NC0ffriRTDJqL
	tpziEPWdLXTAQqbGpX7Anp+9+rqD0+wcB+1BlL1mrl1bEYE6HAGY87Gnmi9qrU2DiJC/1L+R0TyZK
	HiLUI9f1Y2kwTrxOFic5+9VlWLp4MpE4weC6e5HloVE+zSUbKTJ61lt8DwDS8hFyF2OvMCXK1RoWh
	KJIXcJyrqZQqCx3HjQsbp7FDOyaC+xYBSBDq57V6zIZrinVCsG3ZrOfRXgQug/k2I3MxfQqBz735o
	f5ZMAHAbXfeXacfTESRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZ8T-0000000FcMt-3oX1;
	Mon, 05 Oct 2026 03:13:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZ8R-0000000FcMX-1zK1
	for opensbi@lists.infradead.org;
	Mon, 05 Oct 2026 03:13:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510I8H930986
	for <opensbi@lists.infradead.org>; Mon, 5 Oct 2026 03:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8d3SRiDySHOKhCK5Ff0XjuWsFnZXFF2JBLuouyFOgDE=; b=MmJOH9Spice9Zodo
	gTriSZeCTYUkrKt2OrL+IoIQG5wwmyKmBXdP8ISxRt0enGdtX46Y/DaOT3u+6WBG
	pgF3uQ2u4AkiYY407fSOq7+U1guxJQYWAR3LMoPJWRVKuSTuq+VDgm0T1tdY3qSM
	hC+kGlP0b2oajuYQZ0u9ywum7HqscZGpKZFBahZJKOqwAICcLagRFAykR3nSFohM
	8M8Vm9L9+oJbPoMWZQf6d464EbO1OtMWgYbdwL2FcTMNZlb3dZsBXXELvC/yJaLL
	RhetNo1RGY9138TTdpfsTS4e98w1YEjElmzQORjy54vQUeTi2yc4biGVM8LebOwH
	IlFW2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sq8v9rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 05 Oct 2026 03:13:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso259055285a.3
        for <opensbi@lists.infradead.org>; Sun, 04 Oct 2026 20:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791169981; cv=none;
        d=google.com; s=arc-20260327;
        b=Yg5m2opCdArVHF6U/lucx7bdbjYnmz8wqyYNoPm9GmnYPcrzmPIW67OvQ80sU+l1pR
         pJ4xy3sbtix5Fu3S/AzSd2EjJT9Gm4ayCeB0s3ghtmpaBZHyPmq9WPU1xbHtg5u7G0SK
         K5OhLgVR+o/N82sTrKUgQ/dw//pAeHdYIEuybz/2/Pzwbwciw7RQpK7+JU7h1xlml4u6
         H7F3Ey4eS3rRa944UQsn0iM4FoZJA6DvD1vxDd6K4uA2JRS2ki703vwSKs9uy7rSbD3K
         4LRsKQ1UF7zcO7C/+VQErS8HaSRqw9yt6OskNaofVYPfX6/93PKVl4hu/xUqWKaICVrt
         hgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8d3SRiDySHOKhCK5Ff0XjuWsFnZXFF2JBLuouyFOgDE=;
        fh=cD4e9DS5Lh/PI2c9sPa45OA5kQKVljyy6AYNPVfcnv8=;
        b=LBsSPUnalnj7POrcaeEqWZ3koyQAHzWXJrdiOupoE3IAtf9CUeKKKykffcNf2S+VhP
         WnRUncqYBMRublyNPAMmQZvi8XzlqWukicHNsfWEoXs6hOjOBvMOSdt2YQC6S0ZFrQKr
         O6aVxGVua9EgTcdB2iH+P5KVDBQXsiZtgBBOuH1GJjsFxWWutIaUGKcr6iFSCyW4nA8z
         euis79PTes3qOkfBwCoq764kT/Nu8L8kD8tx3SZ/m6YAuvvG+0JBoXdqsfdY/iLp7xnT
         fdZQXO0fKO7wzUWy5Qv6v0MD5kHJ3hc1PGz9j3YByMGLeQ8ODWV22SVlg93uhVQRb2nI
         aUwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791169981; x=1791774781; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8d3SRiDySHOKhCK5Ff0XjuWsFnZXFF2JBLuouyFOgDE=;
        b=c4NMX3QUJPNQuUTBoBWDkpmbX3Y9sR7U2TCp7hX6cgd9xDvzhpBe9/VokTb9DgK4QF
         0iOBAZ81/+QSnnkbG7p/0Ab97UT1IaeBK5O7VabMQYC5VFU+NwZ/ntd9bpfUN8fvFkr2
         jNiRHFx6EBWc3gAFgpuPjS+qGpi7QmytNofRzTBVa44cgOGZFPKo3dYtJTLJZtEacnmK
         nfrhJqwM65rsuNXeCVgb5BF+kekKIvicvfRta3VWeB0Gd8LaGmXV4BW7extQ5NlvmFQq
         iHrurq9fjKwbHP1qEXA1tivHTMLhJTe6f6xCQ8u0PIKFxSWZlXfi7dxNdPZyj0X3El+F
         HI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791169981; x=1791774781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8d3SRiDySHOKhCK5Ff0XjuWsFnZXFF2JBLuouyFOgDE=;
        b=BnTdNzHKaVD5VsGFsNXWoxuChpYhR4ION/6KbMbEnrRaw+fgacpIl10yFlD+Rp5jmG
         vpvjeAdE8gh0DoA0I253jJSWXqTyVtwP5F1I6H+gJeCXsP5GDVVRFah2RfUGMs0OCtYi
         Cn3wODxQ+p9T4PqqfcS2wfnvT/BIlfIfIkeeGL0T6K35PwgO3Rd922hE38PR/CO3NObM
         0qfjKvorbq6p2A84Bi7E0P/khMGp2h0g+uu+9H00Iks7ERm2+Vb3hcIaaSgGV5gzKMMr
         1FPOrWg6deUs3QyU7nGjKtvCwGOBtPDDJ6tPU9/GA2bh8RijECm6o78XtZcJvBOP/NMd
         r1UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBvsMS5tPOBJtxmN7RlW5jK8KQjh6VNkHKBw73uC5EuO825N9ORUtQcJATBkfmMQ9oGajI9hg9@lists.infradead.org
X-Gm-Message-State: AFuF++kTpiBk/y0OzrIZ0MjHdDCc3+Ixvz0Jny9LXHZ8JHZhm8wtjjsb
	akxDjRKZk4Acen6I62W0j8aYmbiMw6Ov7wEF5zcUDpULfig5qRCp3/i+2m39XNe5Yx+GUDE5I6T
	u1WikMYSRyv39L6JWNdMIcBmP0vLVx8UoJ/GOGQL/MzZj8Cqg/F+1e8IighvI2EDSRp7DWc/fR/
	Ei5kTQxWPEzLCO5fmem57xX47xo+2p1J6VnEpOMDoD
X-Gm-Gg: AYBFou2FEk7llkndexJ7sm2NPyIDIlQtChGgmo8j55C2GMqTSaNixE9mcp/Z+kSt6xe
	BTlqwFTVLIM+OXc8rTyFGAP+z9hu+3z1Zdofb2qV+VdcUEsDOv2hEy7gSbcmNMCW6zPcoINd8kl
	WhEF8HhpwTHT9hvhHmtU4iUCmku2k+IAN3vHY/TsQjLPA4FRQlcmFS4i7hz0xsp0uPJXSYsnKyo
	1haLZEfe1vh7tCReA==
X-Received: by 2002:a05:620a:2b42:b0:93c:5eef:baf5 with SMTP id af79cd13be357-93e50f81de4mr1039707485a.14.1791169980954;
        Sun, 04 Oct 2026 20:13:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2b42:b0:93c:5eef:baf5 with SMTP id
 af79cd13be357-93e50f81de4mr1039705385a.14.1791169980521; Sun, 04 Oct 2026
 20:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261001084412.1383854-1-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261001084412.1383854-1-prajwal.n@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 08:42:49 +0530
X-Gm-Features: AclHuK_IQPn_rlfnG7g_LxXDstEmA5VhsM-TgBdPc3I9NQBzcP_O7bcwbCzvWK4
Message-ID: <CAFR3w36Re8X05Bz5rxePH4J63r4qDq+mY2yUKB=gW8+CU=xU7Q@mail.gmail.com>
Subject: Re: [PATCH] include/sbi_utils: Fix warm reboot failure
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: anup@brainfault.org, opensbi@lists.infradead.org, prajwal.n.oss@gmail.com
X-Proofpoint-GUID: 450yRiq1X5d8iMxbkpfGEnmnf4ba9oWO
X-Proofpoint-ORIG-GUID: 450yRiq1X5d8iMxbkpfGEnmnf4ba9oWO
X-Authority-Analysis: v=2.4 cv=TKzQ2Fla c=1 sm=1 tr=0 ts=6ac315bd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=daA4EM5conRRRDXGXpkA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxMiBTYWx0ZWRfX/IBzVIRGhWK0
 pdJn33bNMQ9xPoRH6tLVRGOHNocowGToRvjLZMoZyLYZy9dSH/7W3pl1Hw8PnzDA9C2PiEHxCVx
 ro4L9Y7dci1OhCP33rQ9u+MxcIeNM/CyRT7o3iltkrjri/MmpyRT3ptfcMB9i2Eq+caE7GPXFsy
 3Q3HL3VyGVzqPsgTU2Emozr+UmKBahFYlI+h4wjS/6CDIjkiU6FTFRxJ8QcrwDe6lNHynjd4KVO
 Uu5P9jn7e46wDlsgyDpZbD7SkhQ+qBVkvQP5rVfq2RMrraXL5jgvDQU3Zev7knukqbXFjOHNyqP
 NOi6ptzyDdyU0IZBq8EnoMIcLKnZC78xbS9a8hEuinKD+MSgJDcUngcJN/ZDaShKsRtj0z31XIP
 fD/vTJgi0CT5U6K1keevFFh6k9IsupnQr8ndfIjVvd+8WMajx8QG/K3fLtpJfjvxeNDJbUicU6m
 w6+i+5HaCH+w1+3kgBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxMiBTYWx0ZWRfX9yhTgk9Qr4LR
 O4T4I/W7XbDawl+AIDzoG911HL2h3JayjSkBD2nJy+eKoHA/7P7K9M1sEnaDbkmjWXjThqgWnSW
 0aYMQ+S+DZQh9hToSSTyh2N2x0DdxJE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_201303_641332_9DD5E0D9 
X-CRM114-Status: GOOD (  18.16  )
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAyOjE14oCvUE0gUHJhandhbCBOIDxwcmFqd2FsLm5Ab3Nz
LnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIHNiaV9zeXN0ZW1fcmVzZXQoKSBpcyBpbnZv
a2VkIHdpdGggU0JJX1NSU1RfUkVTRVRfVFlQRV9XQVJNX1JFQk9PVCwKPiB0aGUgUlBNSSBzeXN0
ZW0gcmVzZXQgZHJpdmVyIHJlcG9ydHMgd2FybSByZWJvb3QgYXMgdW5zdXBwb3J0ZWQuCj4KPiBU
aGUgZHJpdmVyIHdhcyBjaGVja2luZyB0aGUgd3JvbmcgYml0IGluIHRoZSBGTEFHUyBmaWVsZCBy
ZXR1cm5lZAo+IGJ5IHJwbWlfc3lzcmVzZXRfZ2V0X2F0dHJpYnV0ZXMoKS4KPgo+IEZpeDogQ2hl
Y2sgdGhlIGNvcnJlY3QgYml0IHRvIGRldGVjdCB3YXJtIHJlYm9vdCBzdXBwb3J0Cj4KPiBGaXhl
czogNmEyNjcyNmUwOGU0IChsaWIvdXRpbHM6IHJlc2V0OiBBZGQgUlBNSSBTeXN0ZW0gUmVzZXQg
ZHJpdmVyKQo+Cj4gU2lnbmVkLW9mZi1ieTogUHJhandhbCBOIDxwcmFqd2FsLm5Ab3NzLnF1YWxj
b21tLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3Qu
aCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3Qu
aCBiL2luY2x1ZGUvc2JpX3V0aWxzL21haWxib3gvcnBtaV9tc2dwcm90LmgKPiBpbmRleCA3YWU0
YWJlMC4uYjQ3M2U1ZjYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9y
cG1pX21zZ3Byb3QuaAo+ICsrKyBiL2luY2x1ZGUvc2JpX3V0aWxzL21haWxib3gvcnBtaV9tc2dw
cm90LmgKPiBAQCAtMzkyLDcgKzM5Miw3IEBAIGVudW0gcnBtaV9zeXNyc3RfcmVzZXRfdHlwZSB7
Cj4gICAgICAgICBSUE1JX1NZU1JTVF9UWVBFX01BWCwKPiAgfTsKPgo+IC0jZGVmaW5lIFJQTUlf
U1lTUlNUX0FUVFJTX0ZMQUdTX1JFU0VUVFlQRV9QT1MgICAgICAgICAgKDEpCj4gKyNkZWZpbmUg
UlBNSV9TWVNSU1RfQVRUUlNfRkxBR1NfUkVTRVRUWVBFX1BPUyAgICAgICAgICAoMCkKPiAgI2Rl
ZmluZSBSUE1JX1NZU1JTVF9BVFRSU19GTEFHU19SRVNFVFRZUEVfTUFTSyAgICAgICAgIFwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAoMVUgPDwgUlBNSV9TWVNSU1RfQVRUUlNfRkxBR1NfUkVT
RVRUWVBFX1BPUykKPgoKTEdUTQoKUmV2aWV3ZWQtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
