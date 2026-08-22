Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EC0C5B572
	for <opensbi@archiver.kernel.org>; Sat, 22 Aug 2026 12:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWNEH6LcssO3y4vlGtGQdGVLkgjm4WyNV1Fqbh+aUww=; b=xw576dGVNx+0f6
	U/KmyA1CE2YV6KR1eZtAm3PdB7vstXlwd7LqvGuZaQJDzKHWcGM3Ruqy5g6eYIS1mtBofonbsoqag
	cXjpvgk5cWyFZykSyJbAFJYLSnz9ZiNUJPwHscdtk572Ru1DTIgky22pIfoQmt9M08mdE+tKI59RP
	xEbdnKA0JECjB7BHsDaB/K5m/XtVDojD2BUxjV6P1RQmiuaSS5P7PczSj1sN+FX7QDElFwGciHJqn
	FJyFlUFUWBZxZ2j35K/0bGIQseSxBYVv09h/bdmZtG6AozaCBjYeZbyPYD4AgN6WJ/Ico3LMqwzHf
	c6I/H2ym8HYRcHbLHeFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxki3-0000000EVoX-1q1Z;
	Sat, 22 Aug 2026 12:20:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxkht-0000000EVnv-48UL
	for opensbi@lists.infradead.org;
	Sat, 22 Aug 2026 12:20:25 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67MB718T638034
	for <opensbi@lists.infradead.org>; Sat, 22 Aug 2026 12:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8YWnWkx9krdTtjDuqpd57itLCd9drQZEUFVub6GZZM=; b=dsOeQQXcHXY+tQqv
	wC6UDMk3eH9DtWPSuQteUw8rKrydRm//vM/wsmjdvNLJceTfmvA6wYaBR8F4Yw6m
	/GfRHmY9Xca1psni3OH8i8e25mQBqDbPmCF2xEVjyBqMzd6Le8OMmzK0/EeWrVW4
	hiHNXwEqw6i/yL5C7dWequpozUhipVNR8cDO1X2+wILxT3Kslm7eD6a6Nx1UCUmq
	y9IaZGVxLu0GoBxRGX+RBa1L8BmPJc9fhQiLVMuflKwMcDsRdnyevj+Rv+LoP/3S
	N/SOAv4LBeTX1qqZMck3DrJTUrRTejRKAsZxyMX5BUBcMxdIgkC986zAdJN+Ln2f
	NVZ9QA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7456s604-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 22 Aug 2026 12:20:16 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f582244e9eso65906457b3.3
        for <opensbi@lists.infradead.org>; Sat, 22 Aug 2026 05:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787401216; cv=none;
        d=google.com; s=arc-20260327;
        b=j5SegF7CMOGoK6R/gC7a6ymvH4G2NkHaUD7L61qERwT4Th/XDGGVKdgDv3DcIrfsH2
         +h0rFMWo1ekN0BTDjU2qkRRy+mRi/S4yaUn30rIvm0afoiCOGoF2QRpA4VjITfk4TL40
         AVXgYI3OOlDhZrDPRIxmzXRnO3+KbFE3L11V/lAZ/uUI9v28NoxgEeqyfruGVmYBV2FW
         J7M4/8GRNjyB80/eDh6cNAtvPe9fJ5QK0J2TRPPkUGnsyUIelWxhf7jgOhEdQhnySvkQ
         EHLb9hjHclHxfBUdzNL1h8tbgmxPcBfRT57LsLTAf2bwB/H/sPwj9MGmmT5QSqS8uWoy
         Ildg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e8YWnWkx9krdTtjDuqpd57itLCd9drQZEUFVub6GZZM=;
        fh=jsCfxR4rjiXuH8wp5t/ZUPpQDjIYd9Sx0AzGEcvb5wA=;
        b=Dml5j2g+q8zlxnPdUD8XudSc2hXy+h1uTktvA3V3mbBaFLQZUll8UZeyKpop+wm/kv
         qQ7J4CqZKxBx9EXPRAlJfJj4hM4HJuU5fhNhg031UCvAhuJHxaMl21XX1A34lO8R5vZj
         Ch9i+xZMrfx2emgZLSmr2NBha9LS022OOvFFOlgzuM2S4+wLNw9AXn+aoKcvT29By0oH
         KCmnDydVVgAH0QR7o89za+8rBgUQXarJ/qLfAgcEGrjj+nZBiKbPFeTD06pGUBFLvy9J
         bPNJdov2xcoVBuNghOda8gSFEohzdHsqD1NyVzpYcyQjsRYXiZg9DBjD6q02Gihe7pMU
         chbA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787401216; x=1788006016; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e8YWnWkx9krdTtjDuqpd57itLCd9drQZEUFVub6GZZM=;
        b=Q9ALTt7ABTiemVe/4Y6RGde4sIXurGloHybmtYUS7Lz7o1NhQ0m1D7ZG9prwpvm6ES
         CO3oG1vDplFaanf7DSSaVCf5xZBcjhuRwsvSyedm7zAXD7iA4JX082/enbd4+cIeaAeL
         yzK1/ykA76MnSxIvqW/iXGMewYR/dqd9XjrB8VjUtPh0EbcwypyrmTaLY3VTc4Az+KH6
         C3mW8zfqy3yC7HzT9zTc3UzHPtNIGmO+jy75BTTiLpjS5/+QtosF5//A7pRS0DXuvjOF
         YlxEGCI/ShaYu1o4lqLeRBEEVfzrQJw37geM/cz9ILoBKwFZ9olNyLAtAWeS2pq1DhvH
         ix8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401216; x=1788006016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8YWnWkx9krdTtjDuqpd57itLCd9drQZEUFVub6GZZM=;
        b=Pg/sy3qk7BJ+C/p1e6C1TmRsf5LMZKoZOfhM39t82QCNv1zo4/Yu499qFbFXMjQU4l
         JMVo8vXZIQn7z3vdHR3gUy5gp2mw9JSo69fs0GMs8l3NmuPYtqXlZZE07VzoYO8aVU3z
         vxFMoDyf97/0EWNz/Trj53bSN+QRzwArVTcg6/Ku4NYs9cUI22BPRhaM6sTGCROCV7TN
         e7fyEXCLjGXjTqqkmLnerJf1FK75+Xo6BYY3j2zw59pi2F3AEviHMNefEgCuSbm1XmD+
         DwgVgZXcfuuPgxlKdKrdj4ouNJ1vyPj5kURlzAcS3I0hqokplHDBsmfoAh79ciZ9Efpy
         UgUg==
X-Gm-Message-State: AFuF++kVNNdhDbdArQTCQHZsSQDX1/nQAU0xPoGi8VwsOhtjzbkHSHz7
	mEi7DHpGrrqB6Ij6r/N7p67TPjCree2/hNvls5MhqpiWDA9hFULGzFxhY3pb/q+kQ7cNCvAbBML
	DUBBKPrfAZpQiiNx4IJnKbUqALxQcrRTdGfC4hef3Y+ptACJtCOWd2rzSmiWIL8Kl+ELSLhjuXg
	W7A0O5lJUYKt9HQkqye2XrzMzlt8I3dwTHj1u+RlBLCt/dtqnx
X-Gm-Gg: AR+sD10CjnmtsmGUJif3gisxWcNwHQfOrZwqgKy520vN/qOces8jOumtn7B1kkvljrK
	8i9sHs16Yiy/IPU2Te9EQ9qivcKGcVsDoO9L3nsQxs1ehtNY7rYslSEz0qbbS6umnjoH4CV8QTz
	ZtO0pf1Gd7nM0PJqhV0VX7uoONVwaO85jREd+iMxTitWctqfZlamu5c+//TcU=
X-Received: by 2002:a05:690c:e197:10b0:81d:472c:17a8 with SMTP id 00721157ae682-849ea017381mr42017747b3.0.1787401216534;
        Sat, 22 Aug 2026 05:20:16 -0700 (PDT)
X-Received: by 2002:a05:690c:e197:10b0:81d:472c:17a8 with SMTP id
 00721157ae682-849ea017381mr42017687b3.0.1787401216166; Sat, 22 Aug 2026
 05:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
 <20260805183839.2576691-6-rahul.pathak@oss.qualcomm.com> <CABBgwmvSAxxQXFP2Rm9+gpxDMhTRMNfVsCHVGWDzF8UeW7Kq2g@mail.gmail.com>
In-Reply-To: <CABBgwmvSAxxQXFP2Rm9+gpxDMhTRMNfVsCHVGWDzF8UeW7Kq2g@mail.gmail.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Sat, 22 Aug 2026 17:50:04 +0530
X-Gm-Features: AcwNN1Vm04zelc78feF1ZbBs9BzPek0o_KqsKeHlvb4D0-sRW51as5Eee-Rx6-s
Message-ID: <CAFR3w35yY7Si2hr8FnVtAcUvi6mUOktjvJXKKiSbRAOLQBfBaw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/5] sbi: init: Print supervisor domains at boot
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDEwMSBTYWx0ZWRfX17G8MTL+Eabh
 TjmRDyVj8CtC8y3XBmMZAjqV10kQTA7maVj1wSJc4pf/NAwWR9pslYvQMVBfNVcL++F0t95B+A7
 Xe4kKBji2VlXmirFEUC5+rI+NqyE3Q0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDEwMSBTYWx0ZWRfXwYkl2IkpPjDU
 G3MHW0+s3ueviX8y10cEHGI2kGfdHqm5IqSUdCgmRpiN8xj0qr6Ur+ytJVP1lnaPoC64DUdROWE
 209+fmKrifgNkYO+ZH0bC8V05MnX1QacRAugjSljorO5eMOsuX8/pBGvzaJ5ZvFx+dMhycpgBbh
 bg8YoHTc6CW1glzRVqRLB2RT8kiVCO1N+1TDOsAnoaDngHqoneFPZLAdmxCzah6Mnl+lI28OEm9
 sWOfg1iGPzvhQRoX23NX3impoeEtpIATgq7Wr7zfJdhmrP8p2e/lmtP02cIr3Loj/3idA3qKerN
 V+qMCmrcFRDKSOh38Cz7gulEIw3sCMNMlVAXlugYpARRni+yfPUVBh07TWwYmL3feVSDx26NUQ+
 b9ZUgFBN1atZAhZufL/o+mGuujBtqrNfsurrORe04fjlAeIhKiFyfks/89ZtpZbZ6ESER3wYfnh
 NCNrLuE+roj0Fx6KB2g==
X-Authority-Analysis: v=2.4 cv=RtL16imK c=1 sm=1 tr=0 ts=6a899400 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=7vsQ8q1HRZukVfzhwlYA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: YaqhRyKOq9dgiQKgvYhXZq3TrD-t7VJL
X-Proofpoint-GUID: YaqhRyKOq9dgiQKgvYhXZq3TrD-t7VJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608220101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_052018_145240_71463151 
X-CRM114-Status: GOOD (  17.69  )
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

T24gV2VkLCBBdWcgMTIsIDIwMjYgYXQgNToxNOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyA2LCAyMDI2IGF0IDEyOjA5
4oCvQU0gUmFodWwgUGF0aGFrCj4gPHJhaHVsLnBhdGhha0Bvc3MucXVhbGNvbW0uY29tPiB3cm90
ZToKPiA+Cj4gPiBQcmludCB0aGUgY29uZmlndXJlZCBzdXBlcnZpc29yIGRvbWFpbnMgYWxvbmdz
aWRlIHRoZSBleGlzdGluZyBkb21haW4KPiA+IGRldGFpbHMgZHVyaW5nIGJvb3QuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogUmFodWwgUGF0aGFrIDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNv
bT4KPiA+IC0tLQo+ID4gIGxpYi9zYmkvc2JpX2luaXQuYyB8IDQgKysrKwo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
aW5pdC5jIGIvbGliL3NiaS9zYmlfaW5pdC5jCj4gPiBpbmRleCBhY2QyZjhiNi4uZGMzOTk0OTQg
MTAwNjQ0Cj4gPiAtLS0gYS9saWIvc2JpL3NiaV9pbml0LmMKPiA+ICsrKyBiL2xpYi9zYmkvc2Jp
X2luaXQuYwo+ID4gQEAgLTM1LDYgKzM1LDcgQEAKPiA+ICAjaW5jbHVkZSA8c2JpL3NiaV90bGIu
aD4KPiA+ICAjaW5jbHVkZSA8c2JpL3NiaV92ZXJzaW9uLmg+Cj4gPiAgI2luY2x1ZGUgPHNiaS9z
YmlfdW5pdF90ZXN0Lmg+Cj4gPiArI2luY2x1ZGUgPHNiaS9zYmlfbXB0Lmg+Cj4gPgo+ID4gICNk
ZWZpbmUgQkFOTkVSICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+ICAgICAgICAgIiAgIF9fX18gICAgICAgICAgICAgICAgICAgIF9fX19fIF9fX18gX19f
X19cbiIgICAgIFwKPiA+IEBAIC0xNjAsNiArMTYxLDkgQEAgc3RhdGljIHZvaWQgc2JpX2Jvb3Rf
cHJpbnRfZG9tYWlucyhzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gPgo+ID4gICAgICAg
ICAvKiBEb21haW4gZGV0YWlscyAqLwo+ID4gICAgICAgICBzYmlfZG9tYWluX2R1bXBfYWxsKCIg
ICAgICAgICIpOwo+ID4gKwo+ID4gKyAgICAgICAvKiBQcmludCBTdXBlcnZpc29yIERvbWFpbnMg
Ki8KPiA+ICsgICAgICAgc2JpX21wdF9kdW1wKCk7Cj4KPiBUaGUgc2JpX2RvbWFpbl9kdW1wX2Fs
bCgpIGFscmVhZHkgcHJpbnRzIGRvbWFpbiByZWdpb25zIGluIGEgd2F5Cj4gaW5kZXBlbmRlbnQg
b2YgdGhlIHVuZGVybHlpbmcgaGFydCBwcm90ZWN0aW9uIG1lY2hhbmlzbSBzbyBkcm9wCj4gYm90
aCBzYmlfbXB0X2R1bXAoKSBhbmQgdGhpcyBwYXRjaC4KPgoKV2lsbCB1cGRhdGUgaW4gdGhlIG5l
eHQgdmVyc2lvbiwgSSBpbnRlbmQgdG8ga2VlcCB0aGUgZGVmaW5pdGlvbiBmb3IKZGVidWdnaW5n
IHB1cnBvc2VzLgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
