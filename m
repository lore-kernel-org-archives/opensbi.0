Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A8EC44520
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 21:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmPJ96/AFoU7vFhlJFHU+Rq2S43yRmXy1ETL1c77oPY=; b=wIVF98fSldnD1f
	x5zF4m9KgOf64kptWr4Q7Va8ufxzQPI7uh84YTu2ArnCwdrfOQ0IfqbpwO7jD164Dp8aKbS1s6ijc
	nWFp+iXguLfYUaTT46ixkPFcYoVEdKtlRWEBkIUdIC9KPe/Gm8e1qmtVDnpJoqoVHlPLoq6BcKuY/
	Y/15yTV7bfszRGrK7tkOWWj6qJThP4q1s2eXGtWzZsqQt+DYge36TDFXQSJR91uQtPRZr+lQauCJc
	q3SBcppjQm2RudtpNhgj4ZykOPPKNjVgg0ZmX2bf3n9qozuW/3jpjZMZvWF/OLYsksUR8aLI6rg5J
	5POFzszIb2ru8nJDS5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvJp-00000007vyT-3X0l;
	Mon, 20 Jul 2026 21:14:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvJm-00000007vxj-15cI
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 21:14:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTb6J3397296
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6C4TQi61LoO6iVVOM/KChbWkuW4gxU+p6r8zk+ZD87U=; b=lqxNJlwjozLl8gFq
	EtgtzUYBFPwvGpzZW0pS2tC//anFciAP4DK2LbMNAlK0XCTPhD8Qn7UZu3RfXQG4
	et7jPLlIJS8Ab6fwEervJ2kuLSyc6SspScrSCoxEzhUd/CK0FNUyplUR6n1fy1r1
	uhpEhRH5t5RJpSBA2ZEybDdtA4Lkb6D/wcsuNJLVCjR5yUeGn2RtFTJLfiu+2cWW
	Q9/0uF6ZYhv184LGl8oLp6YS/LS/uJPDpRBWSkhglwuY0nK5TBbZTU1OrP1gkCs8
	DefFlU5uSzf+dfgXwzXFPDY0V+cgp7sqzzZPl/wfnGATpIVcisQauCdwBCS2n8h3
	gFolbQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvc8y8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 21:14:28 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e0e71e05so8720567a34.2
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 14:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784582068; cv=none;
        d=google.com; s=arc-20260327;
        b=e1aQdKc4dxrB9ExEOjBmHZmF9Mn28ql0UTpMEBW+/wNogJTs5FbDOfC2L9+6y5UAsS
         EOXsRyt9qlFf1Y/3GiwgaCIIU8k2zDamRnGUpuBLh4OoNrjnR2T0fWVVo43pzp6y56Dh
         iFSwINAB0HzIS5AkffScZejRyjX2MgtZoPYG8kD0UM91+WyDgt1ZMMrf3HtKDZNuewcB
         C6LRA3pXTJeLAJ7UA3vn2Fxt7ehzjs3j+y9MG8YoeZgrA+hLG5fsZm/bc/isbiP3vAUj
         D4hGvzylV6FmYa/AlWdmFosseQdJ+pm8SHW11w0B5Yssv8jeQaiU8uuWlS6bgOdBre42
         zY5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6C4TQi61LoO6iVVOM/KChbWkuW4gxU+p6r8zk+ZD87U=;
        fh=4kMsKh1UoINO4HdU989tuXIo5BJhlD7JEs384Mxs+x0=;
        b=V3ZAL+xWiliBRFbORM58rQYEkhLBFHJPcyfukriMatnLQvrM0V8JsxE7ulNxDdNxj/
         XiYh1q301VpS8XLajG/t+6krXv2rkM/dAogcmTEXVCd/yhU9TTvkszdlbwoRibCItLS2
         MNnZlBvV3s6BBcSUBkjYZDZLpTNCe6Txv3T6fnUYb6aLWmuDE9RCLSARd31wQF09G0oJ
         MPEcI/54hfaaXXSOter2uxLBoW5tpHyxLHBlOKH+7PfHwFBV3yvBSLFq5VLoVHC4Vj9x
         3Eujqt9wG/NoM1fAEqNn/wJGZp7zUZsPJUYs/XnUszeCZgzF1Nfx6A4fN9LeVg8d4s12
         Pjpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784582068; x=1785186868; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6C4TQi61LoO6iVVOM/KChbWkuW4gxU+p6r8zk+ZD87U=;
        b=NttG6YonGNCBohStJbBaG6ZsvI23KgC3cF7FOddPLCe9rcjfYMM0OQSt1bz0ghPmkW
         h3Ye4GLwIxwD2roZ7eb3cKJZmucN3TWaO3xMcvhi1Gx31l8lsUrx6+LN9cy/kkRUC+Kt
         Ox/5lWZD62/uiwBj6L155AJFLYN54G+MFHMdY0Yns5O1vNxJNO8CvJpkQg+PyMat2lvV
         sKKRbC2QJ3fvGW2tvlrCRDXfYJ/0uefKGCb3SWLH7Z0xdhNcm/i1TQ5BXS7pxgJurv0q
         9VQjmxcLjRixm+vlwGMGF3UprEeR19nBy2MHsCM1D8G/j6nBnx4CwP0DZuUw8+ol/so3
         cmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582068; x=1785186868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6C4TQi61LoO6iVVOM/KChbWkuW4gxU+p6r8zk+ZD87U=;
        b=bOEK8YKuqYk+YFnfHQyKz2ARfXNTuchi8qWG2CPdjAygbz25YiXDdodz/evJ61+yTF
         h2H9YzSqgxjyvjyBIT7cew1uR5/hBZzyaZZz/cOflHKgsyLcmnJ7P515Ew0mEZXvCojx
         8KfQnjjn3UWvYdkDwHOmSrSNg9AUpEv2UrdsurQKrH9SdPfqOfL/rrFsRwEC2Q+boEk4
         0dIulXZWEOMbnD0KG+Ydl0uGj8pJOj+vLWmYvIey1Vjmk1knlSsR4vfH/GqCY5+6diLw
         cqGTlhqF8ixRnr+byCUV2lQsjJRK75ygNO57mN52CtdeS/lrS6l4ypz5BXsw/PS6w/wa
         H2lQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbtPrgjlszz6JYUdB5E53cVauu9n/GMIO7xRVbFnkfpcv2V8kJY8NlYbLk1JgjHtSnxcTFhJBE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3wNl/UX/Su2ZDx0FR9cwUbfXCUTgg1MjHOHRIiMBGKEm7aLtD
	B9lRza+C3UrfQ8k8VMfUTuAoLVHnCis0ihF0WxEF+KK7tIMiPZ2By3rtbJInauh3xKjah+npaqT
	QNXKZIMGDxTTgjT9t3M5p9FZ8OqaPl+1kWdHqtdYRQHGAfJF7QENsC9GKlzUiN3N9NWOEJ8zekc
	A4Gm4DSQLI6OaUYBlX9EJfFzjfm6MgzfSvawNgrpal
X-Gm-Gg: AfdE7cmI68LDI4pTxL+3f4in7SLa44PlvwrlBHdwYv8YI4ve/B4UMUe5NtqyBHVejKk
	JRZHKagOl9D/GoZNPEA2pDZrIt3+inVn4WpBhRxQRGHg1vkCtuh91Q8DU+hd17vMsOasa3w7s6X
	b7sFfI9GfAjU9xvn5hhmNdO7TbrklYEV78syNAD10RIThRatcw2bJNY01opSI=
X-Received: by 2002:a05:6820:16a7:b0:6a3:ce2:3312 with SMTP id 006d021491bc7-6a5366cb367mr8609656eaf.21.1784582067723;
        Mon, 20 Jul 2026 14:14:27 -0700 (PDT)
X-Received: by 2002:a05:6820:16a7:b0:6a3:ce2:3312 with SMTP id
 006d021491bc7-6a5366cb367mr8609636eaf.21.1784582067318; Mon, 20 Jul 2026
 14:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-10-peter.lin@sifive.com> <CAAVgOk+==we31kXGJxG0XQeRY4B0e9rR3e_4PLT22WwVy-e-dQ@mail.gmail.com>
 <al3iXVFNChVjXsHa@plin-1878> <CAAhSdy2D_6CFkMztW96UxitGNy07zyw812kDa8js2VmvSKgF6w@mail.gmail.com>
In-Reply-To: <CAAhSdy2D_6CFkMztW96UxitGNy07zyw812kDa8js2VmvSKgF6w@mail.gmail.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:14:16 -0700
X-Gm-Features: AUfX_myETAxYeYu8tzAff5oJ930Bi7Yt5Klk0AVXteqbIG4-PXxypCTYGkE2Cuc
Message-ID: <CAAVgOk+YPQNyTzYFaEyihzSdtuDLXSC0z_-nf5fL+BaB6WshTg@mail.gmail.com>
Subject: Re: [RFC PATCH 09/12] platform: generic: parse root domain WID config
 from DT
To: Anup Patel <anup@brainfault.org>
Cc: Yu-Chien Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org,
        zong.li@sifive.com, greentime.hu@sifive.com, scott@riscstar.com,
        conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIzMCBTYWx0ZWRfX1dwMF870ha0a
 0RUE5tPybBcjaM1xaji9PdETbcXYHfZnWFFTfP8Ukk9KuuMoaE8x509ZDYHwfOzR38eFf2sMaX/
 7eTjyZqkZFF6VnL51ezEtUZKAdH2S0o=
X-Proofpoint-GUID: fR3S-_GrKRY9I4IlqAU1B6rwzSNqRpHn
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5e8fb4 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=JfrnYn6hAAAA:8 a=W-_n0kkjAAAA:8 a=pFyQfRViAAAA:8
 a=4pLtSA7d-c7Gk9Hr488A:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=qeNa2pbTr82C0GpJEZFS:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: fR3S-_GrKRY9I4IlqAU1B6rwzSNqRpHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIzMCBTYWx0ZWRfX9Fj+t9VAV/xC
 am0tw65tEKe+ZVpmVNUrXrrI9wgRq07ORerkZgtoc2wfecFyJVlxCWKT1tuM4fLeQkkV8oNgDik
 40oFKq8iGA/3oVo8a3P6B2zk6NoGcIExegrMKiqjoI8pw2glIdCTTsSi72ev1UZARdHvgaW66Ls
 vGm8z8roRXo1S5KvXF8ibHCMMi0Uw5J2tEfARDrZ+mDx7TNZ4CH3p57Y3DPZbdbq06dKjo1xTPa
 8DtnwQ1tjCW+TPiEc4nCfRX4orchTHAcT8Z47RQudl8aJ50sBQuX6hJq4ZwoXb+Zo4cA7DiNItY
 btNdQku3JgZdnby2jnPm6Ja7IWCM+LVrkfqo+R/+EJhurWigG5s6NhvIBpYBrQG1MzX14weDUa9
 iOUKzLySr7G0noCGre9p64RETyAMHU6U7Pkc8l8O0/yJ7/CqV3BlXd60+Wb9/Gy2LyPBt+YWYHm
 tzJcJ8LF8ZqrQFBBqNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_141430_503907_96CC7299 
X-CRM114-Status: GOOD (  27.06  )
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

SSBnYXZlIHRoZSBjb21tZW50IG9uIHlvdXIgY292ZXIgbGV0dGVyIHdoaWNoIHdhcyBkZWZpbmlu
ZyBEVC4gcGFzdGluZwppdCBoZXJlIGZvciB0aGUgcmVmZXJlbmNlLgoKT3phOiBsZXRzIHN0YXJ0
IGEgYml0IGZyb20gaGVyZSBmcm9tIGRldmljZSB0cmVlLgoKY3B1cyB7CiAgICByaXNjdixud29y
bGRzID0gPDQ+OwoKICAgIGNwdUAwIHsKICAgICAgICByaXNjdixwbXdpZCAgICAgID0gPDM+OyAg
ICAgICAvKiBNLW1vZGUgbGl2ZXMgaW4gV29ybGQgMyAqLwogICAgICAgIHJpc2N2LHBtd2lkbGlz
dCAgPSA8MHgwIDB4Zj47IC8qIE0tbW9kZSBjYW4gYWNjZXNzIFdvcmxkcyAwLTMgKi8KICAgICAg
ICByaXNjdixwbWx3aWRsaXN0ID0gPDB4MCAweGY+OyAvKiBTL1UtbW9kZSBjYW4gdXNlIFdvcmxk
cyAwLTMgKi8KICAgIH07Cn07CgpjaG9zZW4gewogICAgb3BlbnNiaS1kb21haW5zIHsKICAgICAg
ICAvKiBXSUQgMyDigJQgTS1tb2RlIChpbXBsaWNpdCwgdmlhIHBtd2lkKSAqLwogICAgICAgIHRy
dXN0ZWQtZG9tYWluIHsKICAgICAgICAgICAgd2lkICAgICA9IDwyPjsgICAgICAgLyogV0lEIDIg
4oCUIHRydXN0ZWQgUy1tb2RlICovCiAgICAgICAgICAgIHdpZGxpc3QgPSA8MHgwIDB4ND47IC8q
IGNhbiBkZWxlZ2F0ZSBXSUQgMiB0byBVLW1vZGUgKi8KICAgICAgICB9OwogICAgICAgIHVudHJ1
c3RlZC1kb21haW4gewogICAgICAgICAgICB3aWQgICAgID0gPDE+OyAgICAgICAvKiBXSUQgMSDi
gJQgdW50cnVzdGVkIFMtbW9kZSAqLwogICAgICAgICAgICB3aWRsaXN0ID0gPDB4MCAweDA+OyAv
KiBubyBkZWxlZ2F0aW9uICovCiAgICAgICAgfTsKICAgICAgICByb290LWRvbWFpbiB7CiAgICAg
ICAgICAgIHdpZCAgICAgPSA8MD47ICAgICAgIC8qIFdJRCAwIOKAlCByb290L3VucHJvdGVjdGVk
ICovCiAgICAgICAgICAgIHdpZGxpc3QgPSA8MHgwIDB4MD47CgpPbiBNb24sIEp1bCAyMCwgMjAy
NiBhdCAzOjM54oCvQU0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4K
PiBPbiBNb24sIEp1bCAyMCwgMjAyNiBhdCAyOjI04oCvUE0gWXUtQ2hpZW4gUGV0ZXIgTGluIDxw
ZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBKdWwgMDgsIDIwMjYg
YXQgMDU6Mzk6MzRQTSAtMDcwMCwgUGF3YW5kZWVwIE96YSB3cm90ZToKPiA+ID4gT24gRnJpLCBK
dW4gMjYsIDIwMjYgYXQgMzoxN+KAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNp
Zml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gUGFyc2Ugcm9vdC1kb21haW4tbmV4dC13
aWQgKDMyLWJpdCkgYW5kIHJvb3QtZG9tYWluLW5leHQtd2lkbGlzdAo+ID4gPiA+ICg2NC1iaXQp
IHByb3BlcnRpZXMgZnJvbSAvY2hvc2VuL29wZW5zYmksY29uZmlnIG5vZGUgZHVyaW5nCj4gPiA+
ID4gZ2VuZXJpY19kb21haW5zX2luaXQoKS4gU2V0cyByb290Lm5leHRfd2lkL2hhc19uZXh0X3dp
ZCBhbmQKPiA+ID4gPiByb290Lm5leHRfd2lkbGlzdC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+Cj4gPiA+ID4g
LS0tCj4gPiA+ID4gIHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyB8IDIwICsrKysrKysrKysr
KysrKysrKystCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9w
bGF0Zm9ybS5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gPiA+ID4gaW5kZXggNTFl
OWYzNDIuLmRlMTJkZWI1IDEwMDY0NAo+ID4gPiA+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvcGxh
dGZvcm0uYwo+ID4gPiA+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ID4gPiA+
IEBAIC0xMSw2ICsxMSw3IEBACj4gPiA+ID4gICNpbmNsdWRlIDxwbGF0Zm9ybV9vdmVycmlkZS5o
Pgo+ID4gPiA+ICAjaW5jbHVkZSA8c2JpL3Jpc2N2X2FzbS5oPgo+ID4gPiA+ICAjaW5jbHVkZSA8
c2JpL3NiaV9iaXRvcHMuaD4KPiA+ID4gPiArI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4g
PiA+ID4gICNpbmNsdWRlIDxzYmkvc2JpX2hhcnRtYXNrLmg+Cj4gPiA+ID4gICNpbmNsdWRlIDxz
Ymkvc2JpX2hlYXAuaD4KPiA+ID4gPiAgI2luY2x1ZGUgPHNiaS9zYmlfcGxhdGZvcm0uaD4KPiA+
ID4gPiBAQCAtMjc2LDcgKzI3Nyw5IEBAIGludCBnZW5lcmljX2V4dGVuc2lvbnNfaW5pdChib29s
IGNvbGRfYm9vdCkKPiA+ID4gPiAgaW50IGdlbmVyaWNfZG9tYWluc19pbml0KHZvaWQpCj4gPiA+
ID4gIHsKPiA+ID4gPiAgICAgICAgIGNvbnN0IHZvaWQgKmZkdCA9IGZkdF9nZXRfYWRkcmVzcygp
Owo+ID4gPiA+IC0gICAgICAgaW50IG9mZnNldCwgcmV0Owo+ID4gPiA+ICsgICAgICAgY29uc3Qg
ZmR0MzJfdCAqdmFsOwo+ID4gPiA+ICsgICAgICAgaW50IGxlbiwgb2Zmc2V0LCByZXQ7Cj4gPiA+
ID4gKyAgICAgICB1NjQgdmFsNjQ7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIHJldCA9IGZkdF9k
b21haW5zX3BvcHVsYXRlKGZkdCk7Cj4gPiA+ID4gICAgICAgICBpZiAocmV0IDwgMCkKPiA+ID4g
PiBAQCAtMjkwLDYgKzI5MywyMSBAQCBpbnQgZ2VuZXJpY19kb21haW5zX2luaXQodm9pZCkKPiA+
ID4gPiAgICAgICAgICAgICAgICAgaWYgKG9mZnNldCA+PSAwICYmCj4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICBmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgb2Zmc2V0LCAic3lzdGVtLXN1c3BlbmQt
dGVzdCIsIE5VTEwpKQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9zeXN0ZW1f
c3VzcGVuZF90ZXN0X2VuYWJsZSgpOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgICAgICAgICAg
aWYgKG9mZnNldCA+PSAwKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdmFsID0g
ZmR0X2dldHByb3AoZmR0LCBvZmZzZXQsICJyb290LWRvbWFpbi1uZXh0LXdpZCIsICZsZW4pOwo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICh2YWwgJiYgbGVuID09IHNpemVvZihm
ZHQzMl90KSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcm9vdC5u
ZXh0X3dpZCA9IGZkdDMyX3RvX2NwdSh2YWxbMF0pOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcm9vdC5oYXNfbmV4dF93aWQgPSB0cnVlOwo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIH0KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBvZmZzZXQsICJyb290LWRvbWFpbi1uZXh0LXdpZGxp
c3QiLCAmbGVuKTsKPiA+ID4gT3phOiBSb290IGRvbWFpbiBXSUQgY29uZmlnIGlzIHNlbWFudGlj
YWxseSBpZGVudGljYWwgdG8gcGVyLWRvbWFpbgo+ID4gPiBXSUQgY29uZmlnIGJ1dCBsaXZlcyBp
biBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IERUIGxvY2F0aW9uCj4gPiA+IHJvb3QgY2FuIGJlIGFu
b3RoZXIgZGVmYXVsdCBkb21haW4gdW5kZXIgY2hvc2VuIHsgb3BlbnNiaS1kb21haW5zIHsKPiA+
Cj4gPiBTdXJlLCBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSByb290IGRvbWFpbiB3aWQgY29u
ZmlndXJhdGlvbgo+ID4gc3BlY2lmaWVkIHVuZGVyIHRoZSBvcGVuc2JpLWRvbWFpbiBwYXJlbnQg
bm9kZSBhbG9uZ3NpZGUgb3RoZXIKPiA+IGRvbWFpbnMuIEkgYWxzbyBhbSBwbGFubmluZyB0byBp
bnRyb2R1Y2UgIm9wZW5zYmksZG9tYWluLGluc3RhbmNlLHJvb3QiCj4gPiBjb21wYXRpYmxlIHN0
cmluZy4KPgo+IEFub3RoZXIgYXBwcm9hY2ggaXMgdG8gdHJlYXQgRFQgbm9kZSBuYW1lZCAicm9v
dCIgdW5kZXIgcGF0aAo+ICIvY2hvc2VuL29wZW5zYmktZG9tYWlucyIgZm9yIFJJU0MtViB3b3Js
ZHMgcmVsYXRlZCBEVCBwcm9wZXJ0eS4KPiBJbiB0aGUgZnV0dXJlLCBzYW1lICJyb290IiBEVCBu
b2RlIGNhbiBiZSB1c2VkIG90aGVyIHJvb3QgZG9tYWluCj4gRFQgcHJvcGVydGllcy4KPgo+IFJl
Z2FyZHMsCj4gQW51cAo+Cj4gPgo+ID4gVGhhbmtzLAo+ID4gUGV0ZXIgTGluCj4gPgo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICh2YWwgJiYgKGxlbiA9PSAoMiAqIHNpemVvZihm
ZHQzMl90KSkpKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWw2
NCA9IGZkdDMyX3RvX2NwdSh2YWxbMF0pOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdmFsNjQgPSAodmFsNjQgPDwgMzIpIHwgZmR0MzJfdG9fY3B1KHZhbFsxXSk7Cj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByb290Lm5leHRfd2lkbGlzdCA9
IHZhbDY0Owo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgfQo+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICByZXR1
cm4gMDsKPiA+ID4gPiAtLQo+ID4gPiA+IDIuNDMuNwo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAt
LQo+ID4gPiA+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gPiA+ID4gb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
