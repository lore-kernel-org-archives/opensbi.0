Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83F5CA5FFC
	for <opensbi@archiver.kernel.org>; Mon,  5 Oct 2026 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GwPYY5aHTbBM+K1ik9ENYUvAJLXbh8QePiyYgWQUWRE=; b=Zkf3CjfBCGNeV7
	N+1ql5z/K4b60xaT31KgZM1ynoacJ0ttY3z+2jweyZje7nDT02koJa2IdrKRU/I5Ptv8vVbynvnch
	03j8N27JGHrBcYYub8HK8xoMiKaJ+SNt7nAWdyvR3zXdv1pqqLn8DACUt4cX7IA6DIUbunyK0E4kX
	54sZGcgQPXyvPS70e590+CzkseNEf3vRwpsB6JhS1a/gkNHxwazdeE/mMNdM8kUR1v/JHBlkD09gJ
	d6t+3FY/eJM6SMzjnpLmRFWdxs/NRjWukwUw9WJlj3eoazLDLIgqPff/ZZDkgexQxRV/3U7TkM4Pz
	uRrUNBgNE21M7jDE3NEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeom-0000000FzAv-3zsD;
	Mon, 05 Oct 2026 09:17:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeok-0000000Fz7k-00Rf
	for opensbi@lists.infradead.org;
	Mon, 05 Oct 2026 09:17:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xdPs1802490
	for <opensbi@lists.infradead.org>; Mon, 5 Oct 2026 09:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LjflD3+To0gyC4pzYtNlhaS8yJF+NsuQlZOZ2FVnCUo=; b=HYRxFJ7RCt+eK5Nv
	1zgCW1CjbssnJNAT5Nh1ToqpGssrqhCsZ9tpw3Twmn7ksBSsGOoNTcXF/gIxuY57
	hvVTExg0Y0O0lOaXSxHT6fZ6LWyjhZEDIDoiWAWXdaaeT9Ido0mUDU8Qsw+dMTcO
	p8Yc5kvjREjbvstnDLpGgStkv7m6Dz59kGbhA93VOlcN+k/txlsuLUctTZVM8sRP
	z0ktmWvFeViBDLersdiLpP+bcqUHNdRy09xvZM86OPhzjd2TBfSDG+XIbc3YRDkE
	57kQAItikfqeBdglNozOc/Jkt1PMa2UPGThZ77CEJpqz9TkjY1YhdlLlHqb01NnP
	11novg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa58ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 05 Oct 2026 09:17:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so356939185a.0
        for <opensbi@lists.infradead.org>; Mon, 05 Oct 2026 02:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791191824; cv=none;
        d=google.com; s=arc-20260327;
        b=Q9XVH/GUSdK/OYJuYmkBPpEninIdy/UZQFiHmBQPbMr+Kz4nSTMF4ROo3Qn/iye0ZX
         /wmS160ULJuVE0zuMkNHPXuiS+7IZOwyBej6WFFKoVVCjNd10SJC5vbCKgtF7A3k9wHH
         5HkOhR9V2CTxWBzwl5REQkTnfF+45GZHJL/lxVEatJYUIyOrA8k7FqoONWRZQLLYbrnQ
         8qtON/t7JsNDCDGXzuhaHGoF4Yun9foz8IUwvDo4ECz+qmYr4wKrX7hZiDrcUdSaY85S
         YDmEn/edcoInOYc2For+EZay/WRH/tA+FBKqjDKg/s0UPd8TRpaxd+23zkLpvCyog5sU
         5Zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LjflD3+To0gyC4pzYtNlhaS8yJF+NsuQlZOZ2FVnCUo=;
        fh=oUsPlIbYgq2Yxpr45o+3abGPhtzpKYe27kk/oYPUYGM=;
        b=YeYkMTO0L3G5CrV766dokOe60NyUcQC9gejblY01G5jRQy0ca14bTLiz3yxOBVwpD4
         rBRL5yEENBA4AvDhbXa08WTefR+/afcC/0VmmCMvioBlpRlc9TR6uC79jXDD0w308wz1
         /04tqHg7t4Liwy4LbExj2nZpRD/ry6Co/OLSW06bcp9v7kDGLRBGCJBWDBoIN2TeU1bs
         VklNPyBbCuzMaB+JMOBpVWi+lEeftq8IqEVOQLozpOxnIq5eV53zeP9yJZfCy8b3fOVL
         FK0en0qm+6kjRYNP32UyqDRaB/eBjgZ/+e8X2nQ5L8KlQsv7bqeqjWxGEGGa3kNqprXL
         T3Jw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791191824; x=1791796624; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LjflD3+To0gyC4pzYtNlhaS8yJF+NsuQlZOZ2FVnCUo=;
        b=AnhAtl/AOg0osoXOKvwQxIovUAd5TBnXM3uHrORqOENC6ZSacIAzzgzZXzWd6dU9Zy
         LUwx8nhlxSGwpRH091NOYCc4wnWX8Rnw9NxLNEVMWeMEXeJfZfP10KtbNpnWwhWxpRMX
         M5rP1VTFp67bDj7lst/GvSONrClMPCAt7Srw6UqX03SkKMjXTXNF9xgdzNwBb6iNHEfU
         P9nY01MGw3YoZ/X6Yf29kFRtLc8HgNUeNE8QJ98WaU2IaJy8iuqUNcpqnBPYG5rm/OJt
         UgY0YqW13pgXUznGFkFO/3ZenI7VNxLgERvvthWJoXQCgZrrNvUDNW2925o9tuMt+z0M
         O6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191824; x=1791796624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjflD3+To0gyC4pzYtNlhaS8yJF+NsuQlZOZ2FVnCUo=;
        b=fcBN2mKOLNDoJd2A1LEYGWPq792/Et5oV6gkAynqeFmEFgYW+fAXxaFAgjsgNqd7C3
         vQE++tOJHyY7XVzm9Xu+OiXMcOPcvBfv3ZpT18LKC1dd5PK00n4K9f2ZHoVrygtUrQsZ
         JB1Rj5p6p6pYQjddMDlhJSIfBfGtMr7CBN8SVfexmIGfQTbowOkAqbF2MhgHbWZlzrNT
         k6g1Txqg4zbBef2F0zw3l5uEmZ3f5k+bXpa0nrGflbdq5+ok4IsK4+niue2BCnbVEZ2j
         +mDsQd84OgSh6SI+NomjZqAmSoao/vLCcC3WkKYWGECDFV7UlHmReX9HGUtF/UDKNPX2
         OLJw==
X-Forwarded-Encrypted: i=1; AKwUvBw7OiOh2BtkKFLxO1bnH8eSLmyL3kL1E5JDsCgMosP0HaOTtI2YM4sIguDMFZJ719dJ5FpyrAm8@lists.infradead.org
X-Gm-Message-State: AFuF++npDZB/AC1gJAf44RlLwqtY97fvW267BBaT0SDZYThfsiofdVou
	CJk8QMDzMpNokKAI8+5SZXZ6lg484ufEcQMWqTN/zIHiAMRIZAtRYzskcI0FsB4Qnbk/qdg6jlg
	qpH7/pxQEYeXqydmAFJM20jeRrmD+xzba+k015skgQnmUelQXdFl3KrdRqPnXoA9gSjyZTqjqSq
	EWsQA0TbEj33LXDb0IRIFGUNPHLKcVrHhuPhEJF8su
X-Gm-Gg: AYBFou0aASVH4SYny5GL/pgNBP1gPA4xZc+UikIuGOtxh5gsmdkkQn9goYuXMtUpWzF
	9PPFTQL3XrLvK4a+fbmzEiBrQ27tZTqLKeHzBjZ7d8eikf1fm8h3lk2itIHziG/kUXyUPllFXF9
	3G0hUIIxjH2oKpcMNMc+Zm/mVVceWD7KTDIq8r9lzdSEt1kqBRcsb1pvpWafObTCEf2qbmKQ39B
	EyRpJHckS100iAHRQ==
X-Received: by 2002:a05:620a:230e:20b0:93e:6068:7e8d with SMTP id af79cd13be357-93e60688896mr511780985a.10.1791191823792;
        Mon, 05 Oct 2026 02:17:03 -0700 (PDT)
X-Received: by 2002:a05:620a:230e:20b0:93e:6068:7e8d with SMTP id
 af79cd13be357-93e60688896mr511779485a.10.1791191823349; Mon, 05 Oct 2026
 02:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com> <20261002083040.2533097-4-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261002083040.2533097-4-prajwal.n@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 14:46:52 +0530
X-Gm-Features: AclHuK_NK4BJjLO9cutEKwphyT90Uzbo44L0s-Tf86Q5fyn6OkqtuqGjmi8Tbmw
Message-ID: <CAFR3w37ezs8AVTBCccCwmeeB5zpwT__ez76iLXF-EaTniCy2BA@mail.gmail.com>
Subject: Re: [PATCH 3/4] lib: sbi: Add SBI watchdog framework
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: anup@brainfault.org, opensbi@lists.infradead.org, prajwal.n.oss@gmail.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXzLDyFVzzu43y
 hxmr/jgNOyFdKhUJxTzxDuGx1SMkRNLroeq9SpBthFr4eGIkzBl61I/fzp0bl/WGJ2FxybqM7TE
 8LsPLamZxpF9/sTMI66EBhOr+qSWRUxE1nIeAfoFqXAwx1zLLZWEx+8mNFgzrAygzN7Ak7EWFxW
 1WOPd/CQsA92WbE7YwLxpaa6tiCQmNmtfh6xz89KnB4mbtajbLf8BKFlE/1D3FzIm9CpoRXXU+c
 4hESZxUlpudrMnu18k+JjFxp0wmUTPxc9IHbf8V9vmbgPu+U0acy5gNqyF3EeBhY6z07tkp1LP3
 E3+ZKvUW7NUvBex3UKK3zMQLpCHvFGAF5dkQpFFS9pjcjb3eHpbTQbuJXi4wXeJomSoPS+motjS
 zxkC9H+lQSYibKMyOcQIdqiLGsTfOSi7Nz+TjdplclnQcF6P6VmuyX2OeNjjkpQcXR2BgYxFF4/
 gCA0LsccQSCVGZvS4gg==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac36b10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=LNNeoB3iRuUXrYXLmZoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ktUMX2qNdhTyLeOG9gYOQdlgrDUqi5Kx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXxivIRF6SBqHs
 HMWFw7fG/zUL390/BL3BGLzcbi1Hvm9c+8GFg8bwEDBqK0oIZJVqYtOcAvp4H1H0LPiCYIb/dDc
 LghK6gC6xDISGAVoJfCnZE2kGaHnrtQ=
X-Proofpoint-GUID: ktUMX2qNdhTyLeOG9gYOQdlgrDUqi5Kx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_021706_165734_A14644E8 
X-CRM114-Status: GOOD (  20.68  )
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

T24gRnJpLCBPY3QgMiwgMjAyNiBhdCAyOjAx4oCvUE0gUHJhandhbCBOIDxwcmFqd2FsLm5Ab3Nz
LnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBVcGRhdGUgdGhlIGJ1aWxkIGluZnJhc3RydWN0dXJl
IHRvIGluY2x1ZGUgdGhlIFNCSQo+IHdhdGNoZG9nIGNvbXBpbGF0aW9uLgo+Cj4gSW1wbGVtZW50
IHRoZSBTQkkgd2F0Y2hkb2cgZnVuY3Rpb25hbGl0eSBpbmNsdWRpbmcKPiBzdGFydCwgc3RvcCwg
cGF0LCByZWFkIGFuZCB3cml0ZSBhdHRyaWJ1dGVzLAo+IHByZXRpbWVvdXQgYW5kIHRpbWVvdXQg
aGFuZGxlcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQcmFqd2FsIE4gPHByYWp3YWwubkBvc3MucXVh
bGNvbW0uY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfd2R0LmggfCAgNzIgKysrKysrKwo+
ICBsaWIvc2JpL29iamVjdHMubWsgICAgfCAgIDEgKwo+ICBsaWIvc2JpL3NiaV9pbml0LmMgICAg
fCAgIDggKwo+ICBsaWIvc2JpL3NiaV93ZHQuYyAgICAgfCA0NTUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgNTM2IGluc2VydGlv
bnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV93ZHQuaAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfd2R0LmMKPgo+ICsKPiAraW50IHNiaV93YXRjaGRv
Z193cml0ZV9hdHRyaWJ1dGUodTMyIGF0dHJpYnV0ZV9pZCwgdTMyIGF0dHJpYnV0ZV92YWx1ZSkK
PiArewo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICBzcGluX2xvY2soJnNiaV9zeXN0
ZW1fd2F0Y2hkb2ctPndkdF9sb2NrKTsKPiArCj4gKyAgICAgICAvKiBDaGVjayBpZiB0aGUgYXR0
cmlidXRlIGlzIHdyaXRhYmxlICovCj4gKyAgICAgICBpZiAoIShzYmlfd2F0Y2hkb2dfYXR0cl9w
ZXJtW2F0dHJpYnV0ZV9pZF0gJiBXRFRfQVRUUl9QRVJNX1cpKSB7CgphdHRyaWJ1dGVfaWQgbXVz
dCBiZSB2YWxpZGF0ZWQgaGVyZSBiZWZvcmUgaXQncyB1c2VkIGZvciBhbnkgYWNjZXNzLgoKPiAr
ICAgICAgICAgICAgICAgcmV0ID0gU0JJX0VSUl9ERU5JRUQ7Cj4gKyAgICAgICAgICAgICAgIGdv
dG8gb3V0Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHN3aXRjaCAoYXR0cmlidXRlX2lkKSB7
Cj4gKyAgICAgICBjYXNlIFNCSV9XRFRfUEVSSU9EOgo+ICsgICAgICAgICAgICAgICAvKiBSZXR1
cm4gZXJyb3IgaWYgd2R0X3BlcmlvZCBwYXNzZWQgaXMgbGVzcyB0aGFuIHdkdF9taW5fcGVyaW9k
ICovCj4gKyAgICAgICAgICAgICAgIGlmIChhdHRyaWJ1dGVfdmFsdWUgPCBzYmlfc3lzdGVtX3dh
dGNoZG9nLT53ZHRfYXR0ci53ZHRfbWluX3BlcmlvZCkgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldCA9IFNCSV9FUlJfRkFJTEVEOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
b3V0Owo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsKPiAr
ICAgICAgIGNhc2UgU0JJX1dEVF9OT1RJRl9USU1FOgo+ICsgICAgICAgICAgICAgICAvKiBJZ25v
cmUgdGhlIHdyaXRlIGlmIHRoZSBNU0kgY2FwYWJpbGl0eSBpcyBub3QgZW5hYmxlZCAqLwo+ICsg
ICAgICAgICAgICAgICBpZiAoIUNBUF9HRVQoc2JpX3N5c3RlbV93YXRjaGRvZy0+d2R0X2F0dHIu
d2R0X2NhcGFiaWxpdHksIFdEVF9DQVBfTVNJX01BU0spKSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0ID0gU0JJX1NVQ0NFU1M7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBv
dXQ7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIC8qIFJldHVyZW4g
ZXJyb3IgaWYgdGhlIG5vdGlmIHRpbWUgaXMgZ3JlYXRlciB0aGFuIHRoZSB0aW1lb3V0IHBlcmlv
ZCovCj4gKyAgICAgICAgICAgICAgIGlmIChhdHRyaWJ1dGVfdmFsdWUgPj0gc2JpX3N5c3RlbV93
YXRjaGRvZy0+d2R0X2F0dHIud2R0X3BlcmlvZCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IFNCSV9FUlJfRkFJTEVEOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0
Owo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsKPiArICAg
ICAgIGNhc2UgU0JJX1dEVF9OT1RJRl9NU0lfQUREUl9MT1c6Cj4gKyAgICAgICBjYXNlIFNCSV9X
RFRfTk9USUZfTVNJX0FERFJfSElHSDoKPiArICAgICAgIGNhc2UgU0JJX1dEVF9OT1RJRl9NU0lf
REFUQToKPiArICAgICAgICAgICAgICAgLyogSWdub3JlIHRoZSB3cml0ZSBpZiB0aGUgTVNJIGNh
cGFiaWxpdHkgaXMgbm90IGVuYWJsZWQgKi8KPiArICAgICAgICAgICAgICAgaWYgKCFDQVBfR0VU
KHNiaV9zeXN0ZW1fd2F0Y2hkb2ctPndkdF9hdHRyLndkdF9jYXBhYmlsaXR5LCBXRFRfQ0FQX01T
SV9NQVNLKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IFNCSV9TVUNDRVNTOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsgICAgICAgICAgICAgICB9Cj4g
Kwo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBUaGUgTVNJIGFkZHJl
c3MgYW5kIGRhdGEgY2FuIGJlIHdyaXR0ZW4gb25seSB3aGVuCj4gKyAgICAgICAgICAgICAgICAq
IHRoZSBub3RpZmljYXRpb25zIGFyZSBkaXNhYmxlZAo+ICsgICAgICAgICAgICAgICAgKi8KPiAr
ICAgICAgICAgICAgICAgaWYgKHNiaV9zeXN0ZW1fd2F0Y2hkb2ctPndkdF9hdHRyLndkdF9ub3Rp
Zl90aW1lICE9IDApIHsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBTQklfRVJSX0ZB
SUxFRDsKPiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiArICAgICAgICAgICAg
ICAgfQo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArCj4gKyAgICAgICBkZWZhdWx0Ogo+ICsg
ICAgICAgICAgICAgICAvKiBSZXR1cm4gZXJyb3IgaWYgdGhlIGF0dHJpYnV0ZSBpbmRleCBpcyBv
dXQgb2YgYm91bmQqLwo+ICsgICAgICAgICAgICAgICBpZiAoYXR0cmlidXRlX2lkID49IFNCSV9X
RFRfQVRUUl9NQVgpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBTQklfRVJSX0lO
VkFMSURfUEFSQU07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKyAgICAg
ICAgICAgICAgIH0KPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgdTMyICp3ZHRfYXR0cnMgPSAodTMyICopJnNiaV9zeXN0ZW1fd2F0Y2hkb2ctPndkdF9h
dHRyOwo+ICsgICAgICAgd2R0X2F0dHJzW2F0dHJpYnV0ZV9pZF0gPSBhdHRyaWJ1dGVfdmFsdWU7
Cj4gKwo+ICsgICAgICAgcmV0ID0gU0JJX1NVQ0NFU1M7Cj4gKwo+ICtvdXQ6Cj4gKyAgICAgICBz
cGluX3VubG9jaygmc2JpX3N5c3RlbV93YXRjaGRvZy0+d2R0X2xvY2spOwo+ICsgICAgICAgcmV0
dXJuIHJldDsKPiArfQo+ICsKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
