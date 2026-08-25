Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D666AC61DB9
	for <opensbi@archiver.kernel.org>; Tue, 25 Aug 2026 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpgBQcw8Mgf5I8+/0Ab9K6DTzKOMDCtvYzgwlkCLD2k=; b=HNMp8NpICjjXej
	14vEGAu42CLsJfkzr3H13SOMTtx84DGHpVsKMoMduHYbPNS4dtYDiirNqnCz9YIVeWl7Ur2TG+mvp
	EqB5B5TrlN/0xv1QmCUmORmtuSGipi2csETOHMklA3YmM8DqoGdIrLH8Jb8Oehsn2EubCSwq0CXz4
	D/W83UOHxV8K2dcJ4CtUVP61Uk/E+Cmb99OcI3nfuzjDfTL9OwM9cP1jyMzG0TCx6zc4H8xhDX+b2
	Tei+fDTFdEofABfXaIwbAGb1yeFP2OB9AP+qCZEhBHqrbIAdhAAnPg/gjbzw6J7spbD1r8RT5jWbq
	L6qYHA/vBf+XqXbTaZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyts9-000000016PJ-0p2G;
	Tue, 25 Aug 2026 16:19:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyts6-000000016Oh-1aWV
	for opensbi@lists.infradead.org;
	Tue, 25 Aug 2026 16:19:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEUfhK2023691
	for <opensbi@lists.infradead.org>; Tue, 25 Aug 2026 16:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6mOFeIvCdkv6/tThIEZMZZG4Lc0Yt7ESXQ+7Vn1VDTc=; b=GTrZmNsO3HC0E5Ry
	RBCjBpUTiCl8sc+KDiz8o9kMaRIEdzk1jU8vzV46XjO9R//7UP6uX4J62B/P204M
	KjABlfqm4GxK1i6+atMaMOGJFjoEeEefHlpHZOL5bd/C0JGueRk8hy/u9YjLwUuT
	P7Wl2IE4aW5b9PelKWn3InzCBE2nJCqy+5ck58YUtQsJiVN46Y5Hru4OGgh7o4BA
	6mBgyI2LE6CQKrdKX4mi9Tn27y4S3Eilm0qTFAdqpiGPdWpL4FtLbtMZn1Wm4dQz
	N4833uy8f37nln3ggNebbsuMPDxwhx/CTCmGwJ6XdTKMDDtMCmfLsb1UfFGtOcc/
	mFwnVA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jkr05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 25 Aug 2026 16:19:32 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb641eaf5eso9270612a34.1
        for <opensbi@lists.infradead.org>; Tue, 25 Aug 2026 09:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787674772; cv=none;
        d=google.com; s=arc-20260327;
        b=H7npfyUI1x0eyZyJY+r2Gz6aOyEZaAA8W40rEqQsyKjxcgMvhpfqh+lZInA5dce+TC
         +0QAVURIaI2kERHldc2MOXyumiAO1u+lfVxgxZhjSWy520dG0AYXDxp8ydAqalrolNp5
         0FRgf46MisXlwp1rkujfG97KvQvp9E2zDIX0E9AsiV1CLVKHAzJpqC13uRRF7MrsL9yF
         W6vV7UCZHjudxoRprA37S0C4bxR8YFSKRN1WN1bGkzvatMUfMpUr0xEtB5Vgdqh8mWt7
         mdBPaOhbHPz1pZJ6YwJ5FTrXj+6uPA5GLC8WzTSQEcoLRgAb+R+TtYEIx+mIEfAEvbWu
         FzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6mOFeIvCdkv6/tThIEZMZZG4Lc0Yt7ESXQ+7Vn1VDTc=;
        fh=4iwF7ic2TRKRyZKQ0F/rMtdoAV3AbkN5ZtSvCXJtTcs=;
        b=BKWYXZPgzt+SqqPCfkx3YecaObnZVzidSZ4V7Ccv6aw7n2YFItSURcqOjMPLbqxwOR
         GwYQyKcQICuRw5fkWcxXx4Ux/Slx2IM90ODmDyDHrNWlQFKCW7WoscVHf7c34bqMcdJk
         UgYLrFWxe+pUhJHWHj3eGvCWSH/0Iy5us4k1PwZP6YUfc1sPC2pdd9fBPD7ZKA5pTlIT
         672/AM7+cAHosdwGELyyB8jw1Gyva8UM9440NTnaHlMeYiTGcsu4QcNI1eX4oY0Pq86h
         f2KQFXDqkPoAK0h7nJHwALBCPJWO8+5Dpq86j3dLAY4fb6+W06SU+zwKwlfHiTKzf42P
         jC7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787674772; x=1788279572; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mOFeIvCdkv6/tThIEZMZZG4Lc0Yt7ESXQ+7Vn1VDTc=;
        b=BG6EN2wU7Jh/kcMIVKixhydn3M8Zc6k6XqPYBl7C1Tl64kkhQ8s+bfaodCmXc8jsUx
         eTCSBt0X6LQR615rZSYZmZDem/VcAJ1eBMqlDmx9NmGlYPgw+4EJzleFcGvP+YIl65sp
         gmgZJWlqqDfJl9bKQ4zQ9pLWwDRRAZNU62RuB/nSV6HA1pZEI2MZDpuPAzaE2tQ8D/HZ
         lmyLZgn+XsoFbBsHXwiRxYEXACh2W3X5a/QZ6TYKV44sXHwgsvbqO7VXDCTg7xGG2ozI
         Nj9ypvvhpgEggO2tsDAjH5af/4Q2wnNtTwNT7hxjp8Ji8Sq2wOMQcVF2bQWeAhammArE
         y2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787674772; x=1788279572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mOFeIvCdkv6/tThIEZMZZG4Lc0Yt7ESXQ+7Vn1VDTc=;
        b=d4mU1jK72EExfe2cMfBmI4PYEvQl6LZGyPH+nBxRVaJN0Qiv+RthYae8dknf18YjLm
         P/1GaxrwfI8xXjgcSUdsUQuCzko5oq6iAmYlVCjw2u8qL4YpfevkvIxoy95TMj99o5nv
         b9OycAlOIqpW8lV1bhHZJon0qIfri93S1BOT+pcDfHWZJ2POuiW9FoGgexzx6nfgD7Q0
         JRhbT6tWtvmvjGJsdixDc3gwtDNoU7L3OG1t75Ka0EYLbPvQo2gwDKmibdCmoJTcXAYW
         haMPSsP9BtztuKZ3vWp0ab4q9SM92EtrxBK8pYs4D2gAl27emNlFWJGM9zYcl9dfSz/A
         4Cdg==
X-Gm-Message-State: AFuF++nypmLtDms1Ybq0ZGfJ8ux9M8m9VMkMhyCdsZklZncpif1GYImo
	PamS/h728R2wNipVXOvfsJrvF/8NSIclMYpd0ouIZb30syg+QDhYZgsqWyWBRDfQ9dJvNgcO0OK
	B9YCHw87O2iUADDFkPiTDMzgxtlMPgtAlI0crTWuZvldzXNTsZXTQVCUS3xXZeh7MZhRtnUVBkM
	VWIBcOHQp1xZFI6cXSfqGzyCJHpSA49Pqf3sgoL63N
X-Gm-Gg: AR+sD11WOf7qQcRcCc6svMZOjCNTpho0LYXMV2yjtN/MfpG7yFa8aCASodFob68o2QX
	QAuUHSjiIgANtW0+HwDCRY+1VR0oKVC7OQRSwQuSO8k4r2vVxCCoXaFoLAwsV7r3kndrdgMqhhK
	mCjUoh05RN3OlxvNwykrkmkMyE2WJqi/4bh/2tSzMFWZCCXUmGWm3yGROd0ZE=
X-Received: by 2002:a05:6820:610:b0:6b0:ab1f:ec16 with SMTP id 006d021491bc7-6b1904407c0mr5846860eaf.23.1787674771737;
        Tue, 25 Aug 2026 09:19:31 -0700 (PDT)
X-Received: by 2002:a05:6820:610:b0:6b0:ab1f:ec16 with SMTP id
 006d021491bc7-6b1904407c0mr5846789eaf.23.1787674771281; Tue, 25 Aug 2026
 09:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260824020953.2438946-1-rahul.pathak@oss.qualcomm.com> <20260824020953.2438946-2-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260824020953.2438946-2-rahul.pathak@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 09:19:19 -0700
X-Gm-Features: AcwNN1V-CjAiauEWdg6NvhPItOu_hNY1_qYxmV7Z9MZ5YVEue1gg6h-mv19VIWA
Message-ID: <CAAVgOkL128sFFq61UMr8dXUYR2-tegrmhCo5imgKgp2W09x3vg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/4] lib: sbi_domain: Add finalize callback for
 per-domain state
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul.pathak@oss.qualcomm,
        rahul@summations.net
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8dc094 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=kwSyQUu3akuPSVlWUBgA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzOCBTYWx0ZWRfX/rQKKv3jZaay
 g1H1/eI6Mkr481+3SQFGu0ZE4qu4Hd0MZGisx+2/a/VaSx1Ij0VlPvwm/N4O6xFKyso662F6M/O
 cJXItZsanU4KDCSt0qUuI2OOA3yBpjFrvRFaNT5vidB24yOfl2A8rjZ8/iyNh2Dl11YhtGuPs3X
 b68VDiQTZd+zp9VVflmJqArq5SkN4BJRWWFbUUkv4gJy24bpFEAO6hvv3k4PA6cuXxHDSzENNjy
 qj6mKk0imS1pbd/EWj7ox0l21fsF/3s6HOjEyk123scaGjQxvj4q/zatA98AOCfAfIixFjZXUiS
 P09BTtXE2dGiJ937e9Z7VCQj7cOG6Iu8qqTle3Wa4Fs/U0vvwNh2ixrNlawTbhujK/qyo7DPa6n
 ID3PwAdL0YfLbfopqDFsnh7R3rIfw4skmu89wMHgdhdxTsm9z6+M6zZmoqBvjIK4u06bmf4HvAG
 7oVuglBgVO3MmJzqSsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzOCBTYWx0ZWRfX4dbEn2ylVJuK
 pxdMHLsFF7CaCnbgLor+0qADqiQLzZqyutezZ0YMuMOQLiC+GD5Ee2u3gEJQMtxykGgdGQYxhxS
 Hh24ExRtby+TB3cUanoaalyMrWJJvfc=
X-Proofpoint-GUID: 13z0vAsrrNcCoSJM2ro9xseAcHhSyahA
X-Proofpoint-ORIG-GUID: 13z0vAsrrNcCoSJM2ro9xseAcHhSyahA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_091934_556628_C59C043B 
X-CRM114-Status: GOOD (  32.24  )
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

T24gU3VuLCBBdWcgMjMsIDIwMjYgYXQgNzoxMOKAr1BNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gUGVyLWRvbWFpbiBzdGF0ZSBpcyByZWdp
c3RlcmVkIHZpYSBzYmlfZG9tYWluX3N0YXRlIGluIHN0YXRlX3NldHVwKCkKPiBidXQgZHVyaW5n
IHRoYXQgdGltZSB0aGUgZG9tYWluIG1lbW9yeSByZWdpb25zIGFyZSBub3QgZmluYWwuCj4gQWRk
IG9wdGlvbmFsIHN0YXRlX2ZpbmFsaXplKCkgY2FsbGJhY2sgd2hpY2ggaXMgY2FsbGVkCj4gZnJv
bSBzYmlfZG9tYWluX2ZpbmFsaXplIGZvciBlYWNoIGRvbWFpbiBhZnRlciBhbGwgZG9tYWlucyBh
cmUKPiByZWdpc3RlcmVkIGFuZCB0aGVpciBtZW1vcnkgcmVnaW9ucyBhcmUgZmluYWwuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBSYWh1bCBQYXRoYWsgPHJhaHVsLnBhdGhha0Bvc3MucXVhbGNvbW0uY29t
Pgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfZG9tYWluX3N0YXRlLmggfCAyMiArKysrKysrKysr
KysrKysrKysrKysrCj4gIGxpYi9zYmkvc2JpX2RvbWFpbi5jICAgICAgICAgICB8IDE2ICsrKysr
KysrKysrKysrKysKPiAgbGliL3NiaS9zYmlfZG9tYWluX3N0YXRlLmMgICAgIHwgMjUgKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluX3N0YXRlLmggYi9pbmNsdWRl
L3NiaS9zYmlfZG9tYWluX3N0YXRlLmgKPiBpbmRleCA3MjAzMDM4MC4uNjUyOGE5NWIgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbl9zdGF0ZS5oCj4gKysrIGIvaW5jbHVkZS9z
Ymkvc2JpX2RvbWFpbl9zdGF0ZS5oCj4gQEAgLTQwLDYgKzQwLDE4IEBAIHN0cnVjdCBzYmlfZG9t
YWluX3N0YXRlIHsKPiAgICAgICAgIC8qKiBPcHRpb25hbCBjYWxsYmFjayB0byBzZXR1cCBkb21h
aW4gc3RhdGUgKi8KPiAgICAgICAgIGludCAoKnN0YXRlX3NldHVwKShzdHJ1Y3Qgc2JpX2RvbWFp
biAqZG9tLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNiaV9kb21haW5fc3Rh
dGUgKnN0YXRlLCB2b2lkICpzdGF0ZV9wdHIpOwo+ICsgICAgICAgLyoqCj4gKyAgICAgICAgKiBP
cHRpb25hbCBjYWxsYmFjayB0byBmaW5hbGl6ZSBkb21haW4gc3RhdGUKPiArICAgICAgICAqCj4g
KyAgICAgICAgKiBDYWxsZWQgZm9yIGVhY2ggZG9tYWluIGZyb20gc2JpX2RvbWFpbl9maW5hbGl6
ZSgpIGFmdGVyIGFsbAo+ICsgICAgICAgICogZG9tYWlucyBhcmUgcmVnaXN0ZXJlZCBhbmQgbWVt
b3J5IHJlZ2lvbnMgYXJlIGZpbmFsLgo+ICsgICAgICAgICoKPiArICAgICAgICAqIFN0YXRlIGZy
b20gdGhlIGRvbWFpbiBtZW1vcnkgcmVnaW9ucyBtdXN0IGJlIHNldHVwIGhlcmUgaW5zdGVhZAo+
ICsgICAgICAgICogb2Ygc3RhdGVfc2V0dXAoKQo+ICsgICAgICAgICovCj4gKyAgICAgICBpbnQg
KCpzdGF0ZV9maW5hbGl6ZSkoc3RydWN0IHNiaV9kb21haW4gKmRvbSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbl9zdGF0ZSAqc3RhdGUsIHZvaWQgKnN0
YXRlX3B0cik7Cj4gKwo+ICAgICAgICAgLyoqIE9wdGlvbmFsIGNhbGxiYWNrIHRvIGNsZWFudXAg
ZG9tYWluIHN0YXRlICovCj4gICAgICAgICB2b2lkICgqc3RhdGVfY2xlYW51cCkoc3RydWN0IHNi
aV9kb21haW4gKmRvbSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlf
ZG9tYWluX3N0YXRlICpzdGF0ZSwgdm9pZCAqc3RhdGVfcHRyKTsKPiBAQCAtNjQsNiArNzYsMTYg
QEAgdm9pZCAqc2JpX2RvbWFpbl9zdGF0ZV9wdHIoc3RydWN0IHNiaV9kb21haW4gKmRvbSwgc3Ry
dWN0IHNiaV9kb21haW5fc3RhdGUgKnN0YXQKPiAgICovCj4gIGludCBzYmlfZG9tYWluX3NldHVw
X3N0YXRlKHN0cnVjdCBzYmlfZG9tYWluICpkb20pOwo+Cj4gKy8qKgo+ICsgKiBGaW5hbGl6ZSBh
bGwgZG9tYWluIHN0YXRlIGZvciBhIGRvbWFpbgo+ICsgKiBAcGFyYW0gZG9tIHBvaW50ZXIgdG8g
ZG9tYWluCj4gKyAqCj4gKyAqIEByZXR1cm4gMCBvbiBzdWNjZXNzIGFuZCBuZWdhdGl2ZSBlcnJv
ciBjb2RlIG9uIGZhaWx1cmUKPiArICoKPiArICogTm90ZTogVGhpcyBmdW5jdGlvbiBpcyB1c2Vk
IGludGVybmFsbHkgd2l0aGluIGRvbWFpbiBmcmFtZXdvcmsuCj4gKyAqLwo+ICtpbnQgc2JpX2Rv
bWFpbl9maW5hbGl6ZV9zdGF0ZShzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKTsKPiArCj4gIC8qKgo+
ICAgKiBDbGVhbnVwIGFsbCBkb21haW4gc3RhdGUgZm9yIGEgZG9tYWluCj4gICAqIEBwYXJhbSBk
b20gcG9pbnRlciB0byBkb21haW4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMg
Yi9saWIvc2JpL3NiaV9kb21haW4uYwo+IGluZGV4IDc5ZDYxYzU0Li5hYTg1ZDczNiAxMDA2NDQK
PiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW4uYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5j
Cj4gQEAgLTg0NSw2ICs4NDUsNyBAQCBpbnQgc2JpX2RvbWFpbl9zdGFydHVwKHN0cnVjdCBzYmlf
c2NyYXRjaCAqc2NyYXRjaCwgdTMyIGNvbGRfaGFydGlkKQo+ICBpbnQgc2JpX2RvbWFpbl9maW5h
bGl6ZShzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gIHsKPiAgICAgICAgIGludCByYzsK
PiArICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb207Cj4gICAgICAgICBjb25zdCBzdHJ1Y3Qg
c2JpX3BsYXRmb3JtICpwbGF0ID0gc2JpX3BsYXRmb3JtX3B0cihzY3JhdGNoKTsKPgo+ICAgICAg
ICAgLyogU2FuaXR5IGNoZWNrcyAqLwo+IEBAIC04NjUsNiArODY2LDIxIEBAIGludCBzYmlfZG9t
YWluX2ZpbmFsaXplKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiAgICAgICAgICAqLwo+
ICAgICAgICAgZG9tYWluX2ZpbmFsaXplZCA9IHRydWU7Cj4KPiArICAgICAgIC8qCj4gKyAgICAg
ICAgKiBGaW5hbGl6ZSBwZXItZG9tYWluIHN0YXRlIG9mIGVhY2ggZG9tYWluLiBOb3cgYWxsIGRv
bWFpbnMKPiArICAgICAgICAqIGFyZSBmaW5hbGl6ZWQgYWxyZWFkeSBhbmQgdGhlaXIgbWVtb3J5
IHJlZ2lvbnMgYXJlIGZpbmFsLgo+ICsgICAgICAgICogU3RhdGUgd2hpY2ggaXMgZGVyaXZlZCBm
cm9tIHRoZSBkb21haW4gbWVtb3J5IHJlZ2lvbnMgaXMKPiArICAgICAgICAqIHNldCB1cCBiZWxv
dy4KPiArICAgICAgICAqLwo+ICsgICAgICAgc2JpX2RvbWFpbl9mb3JfZWFjaChkb20pIHsKPiAr
ICAgICAgICAgICAgICAgcmMgPSBzYmlfZG9tYWluX2ZpbmFsaXplX3N0YXRlKGRvbSk7Cj4gKyAg
ICAgICAgICAgICAgIGlmIChyYykgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9wcmlu
dGYoIiVzOiBkb21haW4gc3RhdGUgZmluYWxpemUgZmFpbGVkIGZvciAlcyIKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICIgKGVycm9yICVkKVxuIiwgX19mdW5jX18sIGRvbS0+
bmFtZSwgcmMpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByYzsKPiArICAgICAg
ICAgICAgICAgfQo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Ck96YToK
CgpJIGFtIG5vdCBzdXJlIGlmIHRoaXMgaW5mcmFzdHJ1Y3R1cmUgd291bGQgYmUgdXNlZnVsIHRv
IHlvdSBmb3Igc3RhdGUKZmluYWxpemF0aW9uLiBidXQgaGF2ZSBhIGxvb2sgaWYgeW91IHRoaW5r
IHlvdSBjb3VsZCByZXVzZSB0aGlzCm5vdGlmaWVyIGluZnJhc3RydWN0dXJlIHdoaWNoIGlzIGlu
ZmxpZ2h0IGF0aGUgdGhlIG1vbWVudC4KCnJlZmVyIHRvIHRoaXMgcGF0Y2guIHRoaXMgbm90aWZp
ZXIgaXMgY2FsbGVkIGJlZm9yZSB0aGUKW1BBVENIIHYyIDEvM10gbGliOiBzYmk6IGRvbWFpbjog
YWRkIGRvbWFpbiByZWdpc3RyYXRpb24gbm90aWZpZXIgaW5mcmFzdHJ1Y3R1cmUKCmJ1dCBpZiB5
b3UgbG9vayBzYmlfZG9tYWluX2ZpbmFsaXplIGNhbGxzIHNiaV9wbGF0Zm9ybV9kb21haW5zX2lu
aXQKd2hpY2ggaW4gdHVybiBjYWxscyBzYmlfcGxhdGZvcm1fb3BzKHBsYXQpLT5kb21haW5zX2lu
aXQoKTsKYW5kIGdlbmVyaWNfZG9tYWluc19pbml0IHdpbGwgZXZlbnR1YWxseSBjYWxsIGludG8K
ZmR0X2RvbWFpbnNfcG9wdWxhdGUgYW5kIGR1cmluZyBkb21pbmFfcmVnaXN0ZXIgdGhpcyBjYWxs
IGJhY2sKbm90aWZpZXIgd2lsbCBiZSBjYWxsZWQuCgpoYXZlIGEgbG9vayB0byBzZWUgaWYgaXQg
bWFrZXMgc2Vuc2UgdG8gdXNlIGl0ID8gSSBjb3VsZCBiZSBtaXNzaW5nCnNvbWUgc3VidGxlIHRo
aW5nIHRob3VnaCBoZXJlLgoKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW5fc3Rh
dGUuYyBiL2xpYi9zYmkvc2JpX2RvbWFpbl9zdGF0ZS5jCj4gaW5kZXggMmQxZjMwZTMuLmY4Y2Nh
YjY5IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2RvbWFpbl9zdGF0ZS5jCj4gKysrIGIvbGli
L3NiaS9zYmlfZG9tYWluX3N0YXRlLmMKPiBAQCAtODQsNiArODQsMzEgQEAgaW50IHNiaV9kb21h
aW5fc2V0dXBfc3RhdGUoc3RydWN0IHNiaV9kb21haW4gKmRvbSkKPiAgICAgICAgIHJldHVybiAw
Owo+ICB9Cj4KPiAraW50IHNiaV9kb21haW5fZmluYWxpemVfc3RhdGUoc3RydWN0IHNiaV9kb21h
aW4gKmRvbSkKPiArewo+ICsgICAgICAgc3RydWN0IHNiaV9kb21haW5fc3RhdGUgKnN0YXRlOwo+
ICsgICAgICAgdm9pZCAqc3RhdGVfcHRyOwo+ICsgICAgICAgaW50IHJjOwo+ICsKPiArICAgICAg
IGlmICghZG9tKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArCj4gKyAg
ICAgICBzYmlfbGlzdF9mb3JfZWFjaF9lbnRyeShzdGF0ZSwgJnN0YXRlX2xpc3QsIGhlYWQpIHsK
PiArICAgICAgICAgICAgICAgaWYgKCFzdGF0ZS0+c3RhdGVfZmluYWxpemUpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICsgICAgICAgICAgICAgICBzdGF0ZV9wdHIg
PSBzYmlfZG9tYWluX3N0YXRlX3B0cihkb20sIHN0YXRlKTsKPiArICAgICAgICAgICAgICAgaWYg
KCFzdGF0ZV9wdHIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICsg
ICAgICAgICAgICAgICByYyA9IHN0YXRlLT5zdGF0ZV9maW5hbGl6ZShkb20sIHN0YXRlLCBzdGF0
ZV9wdHIpOwo+ICsgICAgICAgICAgICAgICBpZiAocmMpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJjOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4g
Kwo+ICB2b2lkIHNiaV9kb21haW5fY2xlYW51cF9zdGF0ZShzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9t
KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbl9zdGF0ZSAqc3RhdGU7Cj4gLS0KPiAy
LjUzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
