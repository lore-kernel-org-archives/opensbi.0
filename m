Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AA0CA5FE2
	for <opensbi@archiver.kernel.org>; Mon,  5 Oct 2026 03:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMA9OrAHVePHFZivWg3c+MoPclayXsrydkypSAt1eak=; b=ABbeV8SKrwGsTr
	jVeZZ3hszBQTahKP4n2yAHjXiJ3ZzOLuh3Wvw73ia7ewjDMDpVHJDCznFt/KZggBO5ifUojfGUFhI
	Qe8HH9HaA19cJQJZyWHeBwEMBd2bxR4kCaO5ZfeRr3Oih+8e+cWjyC9qDjCxXtnKIJO0k9TbiAFVz
	TWVDSJur4oau9kez6L+18wuLbW00yZ/Ns/sBj7gzZepKzOly2MVViP9LvzmLoG3MD7lTOxwGR7y8w
	Vi2OXp7eBJ1XPqlB7VC9Cb1dF6afITIWkESDSkyaC0DyXONujNxarJPRvEUO15e4BcTYZLmDbVUpf
	HeEqUNrABilKMBvI75pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZS5-0000000Fctb-2p9y;
	Mon, 05 Oct 2026 03:33:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZS2-0000000Fct1-2T5S
	for opensbi@lists.infradead.org;
	Mon, 05 Oct 2026 03:33:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695103Oc3242343
	for <opensbi@lists.infradead.org>; Mon, 5 Oct 2026 03:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJDSmP4pNeSbmhDAK34463A1bAbu1trBSxA4KLoo+Tk=; b=D2zWDdTVPAHHj3Rb
	I2oLeOhRlM7DT4zJ6Tu5NQltJHbCAK2TOLVMD4eCX84GXDTJUihMAjLFeiDtW38r
	hoKMRAWnYrtVxWnFu3eqSGIB6oPJQoIXW53vokVNCtaUIYOHfeC0DXGrNeyii9Ww
	IrzPYcJq/FzdjJmUD8qgBCIJQCOOM/JD75zm4fTYpWpO4xSb90QyKK8eOAuUdsqQ
	cWT1Cg4nvvIT2TfOMCY4GQUn0CIL6GpodsxCmkcyAwuRrRvFVYngBTRBwtICdb9O
	7wZq401gvivvPwEvS06GSqMjca93EjE5AdbXMSeTFJ5zoTLE/9NRXl52B6lC5o2j
	VuoT9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvev661-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 05 Oct 2026 03:33:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbacbb996so197758285a.2
        for <opensbi@lists.infradead.org>; Sun, 04 Oct 2026 20:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791171197; cv=none;
        d=google.com; s=arc-20260327;
        b=P7+ky4rMNA9HHMoRbeBEsdAIzwW27HT/EwO/krZTaGlB05GoUQhK0DhkSQbsJldLIV
         jX6PFqqaE7U2RFJn11TPRF7FOOzZIVlPsjbYBLi6TCIugDORRgwpNznjYWv6AiKrcP4T
         hP0FEtiyQqIixGCqAFqA6WWecpghzJjWtHhEKgbFZF+tWwtcOqCL64x7HEQ3UASXEQvL
         RxXuIlFvEGLJQlPC9ZsxtKe165PMKhLmwsuFvEZm79W75yHFUY5ajEDT5XjASkxLoUrh
         tymm9ofRm3jHCu8tSIEfMqpN52syV67ZCTjC5h7EWp3iRfiXLK02ihC2x9MWgAztiJwO
         mO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CJDSmP4pNeSbmhDAK34463A1bAbu1trBSxA4KLoo+Tk=;
        fh=UZXLRBBVdZWPFKdfh94uzv7+mkg3d0PDkLfoz/n7Ruk=;
        b=RfGRQQJggQ4/QNENbyyHw8hn3Nzq8X4hZT03b2sz4A9mC7USnsECKs4f2Hcdvx8n2p
         5NcHOBIg9Su60vhFT6g7StBEX+amy8sxQyoS4fl1tx2IMfef0CkMIP6ppInFrefykzIB
         WB+R2VfXnOeX1mw3SoyhyzZ2jDkGTjElLLqfA1jSGf24lL+r8AA4AlXAhRWCjeOWlyzx
         U9YZfthXDCgK631P/iuGAHhvt5s2SeZ+zYeIVAn5x7uZ4Q3wGwg1HrPYndylmEgi0lNo
         7CeE+sMo3Mnv6MGdZJLV9+7Vra+Nn+gfeZWXx+Qv3DY57VA4aqSfZgLeulhMyOe82ZN8
         ZXbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791171197; x=1791775997; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CJDSmP4pNeSbmhDAK34463A1bAbu1trBSxA4KLoo+Tk=;
        b=X/vOskGTkQkdjDy0NvR4wse/Sk6Q71vwaRkkOZNLks6Tp/V3383L5MH1AqsvraI94U
         R5IM21t+nVmqjcJsdckbak6QdtFNTUe4VyL4pEco/IrBEaWjHSVhyCGEMVpUAcUHdQkt
         2dSTVMDpkuWX2ySL9RxWB17zpZXBoXGq1GMMj+NMoYUzeS0jW807qmUJWjmXctpEX93D
         3NYsc2bNRoMssWccZkez6zmNNiq2el9Tj8Zc/2HS6262Cd/TABRj2T0EFlFliAZ3JBwF
         MyB9zk5u1L6owH4yweg9eA4t17OAQrigEgZVUJIcFRd7KnpjbPRH36JQO1TklLff9K+0
         bpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791171197; x=1791775997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJDSmP4pNeSbmhDAK34463A1bAbu1trBSxA4KLoo+Tk=;
        b=u630I+waokcGGu4IzLX+6t4e1rCyDBO3VdNJj9lc5/mCMu6zeG9JN/v43PSw609dDa
         NMEoBpSOrHr2vulvGMJv01X/p+ING9F6RmeT7jJgV3n1DsQTJjyKd5lJOx+UUPIjnDh9
         /5xTFAaQbnV2QX3qOacqIFvZ9kgT8tMRWqRcAFMueBU+IEcJ6ndM8bf5sNKQOlp9lxFF
         c0CtU30Xehon0Zi5nj59ocuZZlfUTDHWO4VJ4uYmIGkbxZokr1AQEc33mt5bWpiT+ebt
         pXtVAy8JoI7QB4XPN6L71D43N/6u3JPZ0QPQUFbQtGJCwGlQFQBOEY/875F6O35/mtjM
         hASg==
X-Forwarded-Encrypted: i=1; AKwUvBxVQuXTz8ntHceWKsgJl5X2xZQ122FsLFVoNUzu2q9okxvNplGriBS4RpcW/KaWOffZGaxlG13Q@lists.infradead.org
X-Gm-Message-State: AFuF++kgKz5sHLvs+2Cxif9zfCHFthkeJ0r4ugcF3IiZECFJKsgaFATt
	6P3PKzvkzrv+5DDoi7mfAnxHX0/VaibvZAGW/bZ0Sd+QyJTtRZ/AtjBXXi7T8+qcgoTH6WC+vu6
	/ZHbKD0AhrsI20Rkl7AdFfoEnmrbCMdmvNJojv+rZwrVOMsiNVrwBWG1/LTZgpkL8q41J6wlq5o
	jVvttRWPwrqQdmGdZ7U7XJ2CPbcIMdf72WvUhexeia
X-Gm-Gg: AYBFou2rQDBxU8bJoRzeW+DcwoZULITxGlomT+Bp2tKijlL5qOpzDRtWSpn6UPg8Rtx
	dLZt0FkMZ3oPvW0pjAw6s0G+0JexSFRd4yHek2pUXCLD74uwdaBLSochE8HH24CaxWIC2jt+rMp
	u35X5JmsAnSl5tpgVcT2p5FEH6bP2YeKyyo+LVdyaIDCNGSmO7u1xI0sI56ySy3K8u4X5n8ieuL
	5bjsgq3fU4Efv8iaA==
X-Received: by 2002:a05:620a:7119:b0:93c:b721:b108 with SMTP id af79cd13be357-93ce7a9e861mr1754601585a.3.1791171196765;
        Sun, 04 Oct 2026 20:33:16 -0700 (PDT)
X-Received: by 2002:a05:620a:7119:b0:93c:b721:b108 with SMTP id
 af79cd13be357-93ce7a9e861mr1754598885a.3.1791171196311; Sun, 04 Oct 2026
 20:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261002083040.2533097-1-prajwal.n@oss.qualcomm.com> <20261002083040.2533097-4-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261002083040.2533097-4-prajwal.n@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 09:03:04 +0530
X-Gm-Features: AclHuK-Dg3as8Kf9J99SCjApN2A7r9oeDl-QLnEiT1o2gZeqwLRjcJ3ym7l_TnU
Message-ID: <CAFR3w35vjbgg+sUfoQ4zVr-ph=VW9YrfiTcG5PaF9chvQeDBmg@mail.gmail.com>
Subject: Re: [PATCH 3/4] lib: sbi: Add SBI watchdog framework
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: anup@brainfault.org, opensbi@lists.infradead.org, prajwal.n.oss@gmail.com
X-Proofpoint-ORIG-GUID: 6xESNWvxJ03zX1sxHdE3FpI04CGI6PfY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxMyBTYWx0ZWRfX3PoONcYWADfA
 wTp0tpPaSepcq2Eor9usNbG8XD3LHQWO5fIv13/rgbtMqtlN81mkMAV+FT4ZoCgX49lX04xGesB
 nxpZgTAhTqzY5TetHwF/IigvJddsNlQ=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac31a7d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=YYaSXDX7Al_ZmEXQ4kMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxMyBTYWx0ZWRfX2ijJD/hmK4o+
 /9VolsPXBJMhrKn5dDQKnMyfGl2ICExX7rJj9JoGvmDARVsC5aa1YHwx6XUWSzLSYtHt41ABEzy
 yLhgeqn6n+hnl1/VcqPUjtWwxcB5LO35qLVlgHC2wLPnI1uCyILjb3Tf51f1Cmhsu5FmlU+gJ2p
 6T79gQ5QsReuRg4cqHi633/I4GSsX0NYE9asqGq+X7HGi2SxI6wKdR/7SQWy1bililBr4e4XmlH
 BiJFFydj7CMfqW6BuJUg710Df1MHGCDG9e25jojZCCFehokRmkg74/LE7LBWEDy/cFERLm/gAD3
 zSVsJU0LXrCB9/VbqvuEuaCY70cn3r5jMEe85TzLN5EHbW3G2pOkj6HPqwVa1vE0D4sAQuHYClW
 qnB/ebXEdammMDRd5fS0BcsfdZSkVS9MsxctIPhXe5OFSQH5Nknml53otnMDnYn+YgEfl2TP7d2
 P3O60+jSWAsblwGw9Sw==
X-Proofpoint-GUID: 6xESNWvxJ03zX1sxHdE3FpI04CGI6PfY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_203319_689921_CA85DD97 
X-CRM114-Status: GOOD (  16.42  )
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
dGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfd2R0LmMKPgo+ICsKPiArCj4gK3N0YXRpYyB2b2lk
IHNiaV93YXRjaGRvZ19leHBpcmVkX2NhbGxiYWNrKHN0cnVjdCBzYmlfdGltZXJfZXZlbnQgKmV2
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlf
dGltZXJfZXZlbnRfcmVzdGFydCAqcmVzdGFydCkKPiArewo+ICsgICAgICAgc3Bpbl9sb2NrKCZz
Ymlfc3lzdGVtX3dhdGNoZG9nLT53ZHRfbG9jayk7Cj4gKwo+ICsgICAgICAgc2JpX3N5c3RlbV93
YXRjaGRvZy0+d2R0X2F0dHIud2R0X3N0YXRlID0gU0JJX1dEVF9FWFBJUkVEOwo+ICsgICAgICAg
LyogVHJpZ2dlciB0aGUgc3lzdGVtIHJlYm9vdCovCj4gKyAgICAgICBzYmlfc3lzdGVtX3Jlc2V0
KFNCSV9TUlNUX1JFU0VUX1RZUEVfV0FSTV9SRUJPT1QsIFNCSV9TUlNUX1JFU0VUX1JFQVNPTl9O
T05FKTsKCkJldHRlciB0byBjYWxsIHRoZSBzYmlfc3lzdGVtX3Jlc2V0IGFmdGVyIHRoZSBzcGlu
bG9jayB1bmxvY2sKCj4gKwo+ICsgICAgICAgc3Bpbl91bmxvY2soJnNiaV9zeXN0ZW1fd2F0Y2hk
b2ctPndkdF9sb2NrKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgc2JpX3dhdGNoZG9nX2VuYWJs
ZV90aW1lcl9ldmVudHMoKQo+ICt7Cj4gKyAgICAgICB1NjQgdGltZW91dCwgcHJldGltZW91dDsK
PiArICAgICAgIHUzMiBwcmV0aW1lb3V0X3VzOwo+ICsKPiArICAgICAgIC8qIFJlc3RhcnQgdGhl
IHByZXRpbWVvdXQgZXZlbnQgb25seSBpZiB0aGUgd2R0X25vdGlmX3RpbWUgaXMgbm9uIHplcm8q
Lwo+ICsgICAgICAgaWYgKHNiaV9zeXN0ZW1fd2F0Y2hkb2ctPndkdF9hdHRyLndkdF9ub3RpZl90
aW1lICE9IDApIHsKPiArICAgICAgICAgICAgICAgcHJldGltZW91dF91cyA9IHNiaV9zeXN0ZW1f
d2F0Y2hkb2ctPndkdF9hdHRyLndkdF9wZXJpb2QgLQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2JpX3N5c3RlbV93YXRjaGRvZy0+d2R0X2F0dHIud2R0X25vdGlmX3RpbWU7Cj4g
KyAgICAgICAgICAgICAgIHByZXRpbWVvdXQgPSBzYmlfdGltZXJfdmFsdWUoKSArIHNiaV90aW1l
cl9jb21wdXRlX3VkZWx0YShwcmV0aW1lb3V0X3VzKTsKPiArCj4gKyAgICAgICAgICAgICAgIHNi
aV90aW1lcl9ldmVudF9zdGFydCgmc2JpX3N5c3RlbV93YXRjaGRvZy0+d2R0X3ByZXRpbWVvdXRf
ZXYsIHByZXRpbWVvdXQpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIC8qIFJlc3RhcnQgdGhl
IFdhdGNoZG9nIHRpbWVvdXQgZXZlbnQgb25seSBpZiB0aGUgd2R0X3BlcmlvZCBpcyBub24gemVy
byovCj4gKyAgICAgICBpZiAoc2JpX3N5c3RlbV93YXRjaGRvZy0+d2R0X2F0dHIud2R0X3Blcmlv
ZCAhPSAwKSB7Cj4gKyAgICAgICAgICAgICAgIHRpbWVvdXQgPSBzYmlfdGltZXJfdmFsdWUoKSAr
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBzYmlfdGltZXJfY29tcHV0ZV91ZGVsdGEoc2Jp
X3N5c3RlbV93YXRjaGRvZy0+d2R0X2F0dHIud2R0X3BlcmlvZCk7Cj4gKyAgICAgICAgICAgICAg
IHNiaV90aW1lcl9ldmVudF9zdGFydCgmc2JpX3N5c3RlbV93YXRjaGRvZy0+d2R0X3RpbWVyX2V2
LCB0aW1lb3V0KTsKPiArICAgICAgIH0KPiArfQo+ICsKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
