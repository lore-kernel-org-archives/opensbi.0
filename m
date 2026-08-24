Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406AEC5DF9B
	for <opensbi@archiver.kernel.org>; Mon, 24 Aug 2026 05:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udvjCe1XIAOezQfQYnIdBUxjFZxoZaVduCnyOuQbVpA=; b=qNIjK9VwVFd+x6
	eg8NUSlNoWqVfWrdpXfWyMPUOLEy8BuqeFgszhXUYUOctA0ua/5F0kWRHaR7V1ZLGP3hk5pK0ld+j
	zeuoQGjAfoLH5v3zKN/TYAVHf+WlYfK1RiETPFlZgmmiiBkQxAg6C6Y8kgm7BmZO8W11Mt0jhhLDR
	tgAras+z5G3HLpI7loovlivSpcL2y9n+yGB+JsJuBfzcd3VR84AV5D/l7yctmaM6tBg7elftVdlkT
	mDKHR0h2MlvFAXTd0AxGNsNdb8M/BMDkNKf3ErvuKM5jQXuIbgFptgjfE77/0Q5NbFcgJM0gp8i8l
	UjGRFTbCmtS4MiqWxhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNGI-0000000FwI5-0Xrr;
	Mon, 24 Aug 2026 05:30:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNGF-0000000FwHk-0Fa3
	for opensbi@lists.infradead.org;
	Mon, 24 Aug 2026 05:30:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9sD1937603
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 05:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	75JUf9my01Fyv/6Jo7s9sJp2q6eNVzxocXIIRM1gJr0=; b=hExHFqOAR42I4Geb
	A1SOFcIb8GlNfrRYPcbxew8GnHMoQehtOlhwdfpQnNReDXMR6+PodFNSjs68tb//
	gckULJ//PoThOp3ESGrzEGvQV+0FqqjvoWQsaZHjcsQGaIYs0xMDRvILOrn6UKof
	/ibJm9pl1+KNMFWEatONDl1omghiCSMnkwlKCdqW9xnBTgMLYMT2DcxsLhk+Pmku
	Ip3q/1a74zFR84IOi2jCDZYDVglO117PTz+62HTM45ARIFVoGSkNLF/DQO9SvgMs
	JSXY1+MticYOH2xroZiTX05gtPfzJtkXrTUrHxXPlekQm07bFasJr/xgyRBYQpkn
	0CwyJw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qwfsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 05:30:14 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e7624e584dso7402261a34.2
        for <opensbi@lists.infradead.org>; Sun, 23 Aug 2026 22:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787549414; cv=none;
        d=google.com; s=arc-20260327;
        b=fGRwIdgj3NzSeedfm1uuga7NVGZxDn+KvUfBayiZErLWEduBeDhh+3Gs4aThRou9sH
         93EPrHjiLAEwd13tnOq311t5PEn+VPJwkPJ7hBM/+kYGakXNuoc/CMBkMQOHl2ePOdnu
         zngS+khRFEFIdTzn/vU+rPX6DhXjWXtVWOgkZc2tq8mReREITwFG8aVsRFf6nPruv3Ha
         TtiGQUJNxF7VdwOOg8lUo5cJ07DV6XSqWwry8rMiZDw2xIgkzoMrb1osabmRab5oH5CJ
         meWTECsnUkLhNr+WiWq5eam6XbEj7KCexO2nXZcMWOI7mepl5I1b6Pl7J6pKqQ0w9Lci
         xZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75JUf9my01Fyv/6Jo7s9sJp2q6eNVzxocXIIRM1gJr0=;
        fh=4iwF7ic2TRKRyZKQ0F/rMtdoAV3AbkN5ZtSvCXJtTcs=;
        b=ISXNFx/PP/xYAgOOr0T7tzCe01mK0D/2rG0WuUB4nBc+9VDxM2s+F92k6icmI9gg5z
         twYyiTcei4xezrfD2p5ZPB4WSrYwrkR9pJH+LzSbMS4fzuQMvODUuIZxnCXkDSuPQEKJ
         MFsZhaTl44FPcxaxis1C2+0CjfCGfBnUKcadtolI6NGy8bfVMyJUp48gW6PVtX4LeRvv
         8xS3i39IsDB9Sa5OsQr2Uc1FrgwtD+nIf98Zs8lQS6Nuxf/tcgfXH0eOUUJTTQi40tEk
         POqrKJQlfwGLXf+R8SR2x93UHycr9hzomjJLNCt3ht4TNYFNkgihgkz9CaHnfaIOWPv4
         yOiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787549414; x=1788154214; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=75JUf9my01Fyv/6Jo7s9sJp2q6eNVzxocXIIRM1gJr0=;
        b=IHbybjaKiIX1D7E0VNum4NjUk1DMpRrXNPewN8QNuccg6ukPyGewuvY05ecVMCwwLt
         XiXYwvA0jIltiPKNX92tye+vsQ6z72fYpd+qtopaYjL2LPE0YJCEVSsFqaYQ6YaYapKd
         jZ2Hvr8+20s4G37SD6M0qu1u2gUOBnyTi7NexcxF+b6WJyEGKewRQp0QpOuC36MDP4Bx
         f/zAXgGeqWALdGt9CQl6uhPSFL7gJR2V8R4o5qgjElpsLK/GyxncW9NPeSxU3I6vOwAb
         02A4lE+Aw7U65g6kq7BTABCGPqXlYbVH+DMF3RdC2NsQdA4RSGDit9HGQ2RFPgIKNQZ1
         YrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787549414; x=1788154214;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75JUf9my01Fyv/6Jo7s9sJp2q6eNVzxocXIIRM1gJr0=;
        b=DK9awhvQYy5aVVmCKKQVNGTNw1dRbz7okI7sntLbG+vANrwpZzgSAXrvE8M7aCIyb3
         mG3BzL6ifIVSQrHdFDiiyGj2pEbuf/HlxHet/2ikppssVGObSUCIZBNGk6GcSFCac+Qi
         lI/kA694cAoMB6uoHSnYPtbs4fkUQlcEbUqYu9qAFjYISneiXm+oi6zJNABzw5TQ4E9A
         fhfkpw+ZwZpdgJXIByBvv7LB9cby5K7Tl7eeUn2Ii8/m4pP96kTamrv5pwDCbqHebibX
         XWlc4IriGQRkAko2Bdn4iyg/RTbJD45wKeSL853+NI+n2Xn4ka6Uwlk5NlMNOv+8K++8
         frAA==
X-Gm-Message-State: AFuF++nsX9zU5UK0tWK1G30LBqRrR0xf/nDzwTGkITYo/c5xk1gV3Sb1
	Fw2Av7DqmuTySAIKSk9oSo4HDWy9FVpCG6WczIwZ2ID+CR1R8gZbQ2GGIav6BHRZC/CZ5+VAL0D
	Qd97fE6JMbHh20oFR5bzPlJ2W5p1qHMPxLFX0vjEc8/dDHvbIkq1ILdmf5zqnRKYOUpUIYRfB43
	3Ol6OlB/RJobWaYztMeflkhB9VpCaJPnUwqDR9w4Mv
X-Gm-Gg: AR+sD11o35pePxdPt0ppb4QOPScYIROeKo3eccs3IicegLdChADHqX9/LhEWDKiitNr
	r1NkwAS+aiHAFzUYazdOJ7zjeObfMDTp0fXQeGLntJLF8A8fMjJ0tUfhZSbkmMtGi/XU9f2Sjfn
	1iP3op1uBPZgEi0YGlUlFyr+0iTV1SDviM8bvYoA60jMFdfQZeWnUXr1uc+JQ=
X-Received: by 2002:a05:6820:c085:b0:6aa:d13c:a709 with SMTP id 006d021491bc7-6b16ad247fcmr10461269eaf.31.1787549414100;
        Sun, 23 Aug 2026 22:30:14 -0700 (PDT)
X-Received: by 2002:a05:6820:c085:b0:6aa:d13c:a709 with SMTP id
 006d021491bc7-6b16ad247fcmr10461228eaf.31.1787549413717; Sun, 23 Aug 2026
 22:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260824020953.2438946-1-rahul.pathak@oss.qualcomm.com> <20260824020953.2438946-5-rahul.pathak@oss.qualcomm.com>
In-Reply-To: <20260824020953.2438946-5-rahul.pathak@oss.qualcomm.com>
From: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:00:02 +0530
X-Gm-Features: AcwNN1WfLa0cd1Qu7dqTXMcvOYlaC7V4eXmDjTzkdzjHcYs_HsTUadU0GHXWfK0
Message-ID: <CAPPZMLGtYDJG5mV0oHXghWYNsrAq1d4+HbR=LPxnL-UExBU5ng@mail.gmail.com>
Subject: Re: [RFC PATCH v4 4/4] lib: sbi: Initialize SMMPT during coldboot
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, rahul.pathak@oss.qualcomm,
        rahul@summations.net
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0NiBTYWx0ZWRfXyqKkAoBqjBd8
 /hiSt8Oda/4NDWbVrkXNP0uYlZuVuVSlsZqpzB2i9EuT3ujtvAJj6MkNMvIYoN1y3Ryt6Y9eFNL
 E3nVEeA+RISrpAwYal/jBFk/0wB1Qi7jfLfH/KNfcBpuohJmqaD30sd4LqawP07IlpjX1aSeCAb
 X2yMEcqallSO1Kp5tzsVJT1Dtlkm8S7b9BfJFn43M1o0m2luQiPmDtMC3mbZSrCH6wlRx/LZIAd
 vrYl1fJyurKaNlgxNa3HLrlJkrDdFI1HLwgqBVwDAql7fYPRcNGXu2iz4m1tAy2QwavqWdhxJm+
 Vt/Zrav3PInJZiGHBqmHnsqEEXXIOL5IyIiL2YkqtloQUAXLA0VD7HWlUoMzMFmO9sGePo9A1KB
 OCIRDb6ExrxaPXXer6VvUImGSAaBlpAljyVgRfPylJAyzG14SUMv2kGbQh5F1DVBAxT/MEoyfyB
 Z61zmC+g3spPSGtT8zA==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bd6e6 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=usQEftYFaIf-oCF8adoA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: L4pM4n5g3fVvIcbbUzPvOvKKwDsHq6yb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0NiBTYWx0ZWRfX/dvFOzk5j/Oa
 eVZNflpH9PFHIleCB3V5isl85KzzDzkH0V76/Q9i9xrsE4Q0YdsRJezhPPvCpO3Uq3pfnH6gj1N
 YL6SHWEuFLhVVpCBqPvdl8ujzxRGL7M=
X-Proofpoint-GUID: L4pM4n5g3fVvIcbbUzPvOvKKwDsHq6yb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_223019_220351_ACA98509 
X-CRM114-Status: GOOD (  23.99  )
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

T24gTW9uLCBBdWcgMjQsIDIwMjYgYXQgNzo0MeKAr0FNIFJhaHVsIFBhdGhhawo8cmFodWwucGF0
aGFrQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQ2FsbCBzYmlfbXB0X2luaXQoKSBmdW5j
dGlvbiBmcm9tIGNvbGRib290IHBhdGggb2YKPiBzYmlfaGFydF9pbml0KCkgdG8gaW5pdGlhbGl6
ZSB0aGUgU01NUFQgY29yZS4gSXQgd2lsbAo+IGNyZWF0ZSBhbmQgdGhlIE1QVCB0YWJsZXMgZm9y
IGVhY2ggU0JJIGRvbWFpbiBhbmQgbWFwcwo+IGl0cyBtZW1yZWdpb25zIHdpdGggYXBwcm9wcmlh
dGUgcGVybWlzc2lvbnMgaW4gTVBUIHRhYmxlcy4KPgo+IEFsc28gZWFjaCBNUFQgdGFibGUgcmVx
dWlyZXMgdG8gbWVtb3J5IHRvIGluc3RhbGwgdGFibGVzCj4gc28gcmVzZXJ2ZSBtb3JlIHNwYWNl
IGluIGhlYXAgZm9yIE1QVCB0YWJsZXMKPgo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFBhdGhhayA8
cmFodWwucGF0aGFrQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGxpYi9zYmkvc2JpX2hhcnQu
YyAgICAgICAgICB8IDggKysrKysrKy0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jIHwg
OSArKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlf
aGFydC5jCj4gaW5kZXggNDI2MWZlYTguLmNjMThiMmM1IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkv
c2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC0xLDQgKzEsNCBAQAo+
IC0vKgo+ICsvKnNiaV9oYXJ0LgoKUlM6IExvb2tzIGxpa2UgdGhpcyBpcyBtaXN0YWtlbmx5IGFk
ZGVkLgoKPiAgICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ICAgKgo+
ICAgKiBDb3B5cmlnaHQgKGMpIDIwMTkgV2VzdGVybiBEaWdpdGFsIENvcnBvcmF0aW9uIG9yIGl0
cyBhZmZpbGlhdGVzLgo+IEBAIC0yMSw2ICsyMSw3IEBACj4gICNpbmNsdWRlIDxzYmkvc2JpX3Bt
dS5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9zdHJpbmcuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlf
dHJhcC5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9oYXJ0X21wdC5oPgo+Cj4gIGV4dGVybiB2b2lk
IF9fc2JpX2V4cGVjdGVkX3RyYXAodm9pZCk7Cj4gIGV4dGVybiB2b2lkIF9fc2JpX2V4cGVjdGVk
X3RyYXBfaGV4dCh2b2lkKTsKPiBAQCAtNzMxLDYgKzczMiwxMSBAQCBpbnQgc2JpX2hhcnRfaW5p
dChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsIGJvb2wgY29sZF9ib290KQo+ICAgICAgICAg
ICAgICAgICByYyA9IHNiaV9oYXJ0X3BtcF9pbml0KHNjcmF0Y2gpOwo+ICAgICAgICAgICAgICAg
ICBpZiAocmMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICsKPiArICAg
ICAgICAgICAgICAgLyogU21tcHQgaXMgb3B0aW9uYWwuIENvbnRpbnVlIGlmIHRoZSBTbW1wdCBp
cyBub3QgcHJlc2VudC4gKi8KPiArICAgICAgICAgICAgICAgcmMgPSBzYmlfbXB0X2luaXQoKTsK
PiArICAgICAgICAgICAgICAgaWYgKHJjICYmIHJjICE9IFNCSV9FTk9ERVYpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICByZXR1cm4g
c2JpX2hhcnRfcmVpbml0KHNjcmF0Y2gpOwo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmlj
L3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiBpbmRleCAxZGYwMjgw
ZC4uY2NmNmY3NTYgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4g
KysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gQEAgLTQyLDYgKzQyLDE1IEBAIHN0
YXRpYyB1MzIgZndfcGxhdGZvcm1fY2FsY3VsYXRlX2hlYXBfc2l6ZSh1MzIgaGFydF9jb3VudCkK
PiAgICAgICAgIC8qIEZvciBUTEIgZmlmbyAqLwo+ICAgICAgICAgaGVhcF9zaXplICs9IFNCSV9U
TEJfSU5GT19TSVpFICogKGhhcnRfY291bnQpICogKGhhcnRfY291bnQpOwo+Cj4gKyAgICAgICAv
Kgo+ICsgICAgICAgICogTVBUIHRhYmxlIGJ1ZGdldAo+ICsgICAgICAgICogMSBNaUIgbWVtb3J5
IGZvciBNUFQgYWxsb2NhdGVkIGN1cnJlbnRseS4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiBU
T0RPOiBOZWVkIGJldHRlciB3YXkgdG8gZ2V0IHRoZSBtZW1vcnkgYnVkZ2V0IGJhc2VkIG9uIGFj
dGl2ZQo+ICsgICAgICAgICogU01NUFQgbW9kZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaGVh
cF9zaXplICs9IDEwMjQgKiAxMDI0OwoKUlM6IFNlZSBpZiBpdCBpcyBiZXR0ZXIgdG8gZGVmaW5l
IGFuZCB1c2UgbWFjcm9zIGhlcmUgbGlrZQogICAgICAgICNkZWZpbmUgTUIoeCkgICh4ICogMTAy
NCAqIDEwMjQpCgogICAgICAgIGhlYXBfc2l6ZSArPSBNQigxKQoKPiArCj4gICAgICAgICByZXR1
cm4gQklUX0FMSUdOKGhlYXBfc2l6ZSwgSEVBUF9CQVNFX0FMSUdOKTsKPiAgfQo+Cj4gLS0KPiAy
LjUzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
