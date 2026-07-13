Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7CEC43458
	for <opensbi@archiver.kernel.org>; Mon, 13 Jul 2026 23:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVjY2RIPDWbmgMnAIccS+dMRO0WSaEU4Z9JZviwFjKI=; b=YrqNdt6ge4Fpaf
	DbHtIYErfHLhFXMknbSUUqT5XDq9XJGjZINtkoIo1pckbPulIKwyPvfjHTmVvdLn4ZpsG7awCJuTX
	V/jTZYCKysNTwo4nbv0J+CaiIS3KQylprLksnx83d548AE0d2NMUMIFuv27N68CC4W6rj0XbHdANN
	HXU67xW/zDKNOIETojRNhyeSCK+KMmahlnniZL/5ltbz68qgKbOAHqSYKDF/a7iKdUleoiRg+Vqrt
	CG6DGETrEqUTz3BAqyoAkrIpmB2a7uhadGefqkmQS88JtubpLxtpoiMiEWiH+lvVxEoospyCyRH30
	u2FMjCc/Qb47xf0+9JDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQNj-0000000AZQK-0AOj;
	Mon, 13 Jul 2026 23:48:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjQNg-0000000AZPz-3Xl6
	for opensbi@lists.infradead.org;
	Mon, 13 Jul 2026 23:48:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9Btx2519391
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 23:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpD4CQGECuMrBV7WPGlk1aayqTVgEXOwJB1uOLhRKI4=; b=WxQB7j2Hq2YNNDKh
	Et0gribMVq5O7bpqU2quGifoE46m7HCMT+etjes+tAZ9RU0+9OWrura7XLkOKjXP
	pBSaNgIqVpdg4Rb9p1E9QbuJjTkRvfVAsaXQAuG/mQn5MIr4yTpZp7v5cdP2LEOb
	QNOQT1Wuq5u/y2qivyFpeSRk+jXwDnVe+VSl/Wl9lDuOB2TJkyvGRT8Bw2kEhtPO
	kpAhXNZvmIkYYz0XFDOhMqvaRzN2hNp1/GL0DaFJLBBrgRSPErmAYdIOvBY9/R3q
	iOCV5LmeNzMFcF8CsVNvO7iewD9cDah4WrQAe2vudrUy1wkV74T8vTuGXHQ6IGwr
	ahkMWg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44cs5w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 23:48:11 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-49001defc4dso5863572b6e.3
        for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 16:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783986491; cv=none;
        d=google.com; s=arc-20260327;
        b=E46yZVseHPYQUzTCkN0IC0zX+jWYzXDXZbX92TO4O1PLXLNg3+XcgAXCaI4ihghP2o
         eeW05HeIvhIJSB3i48iUlwQ9vZ7bTpisclAbJOCtZhf6xo+/C7gpxN91LXHj5geal0zh
         zjWEEq6Heqc3oNX2jEfTY7XppzlEiS0MezIdB74vgIdvzDlSu5uVhSnQ89bP3erfNX0j
         EVMayP3oKFTR9W5YJmmYrRIRPQ2DC0dFjFc8rM/J+9BSHWZGo5SxxrcMLGKt6Y1D2MUF
         lbpSyButM2lqnx2yczjMExpNKMvFMhBMB8HMV3YcECG0oVEo3t3Ev8Hc8K3Cs15iD8Ik
         +fEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VpD4CQGECuMrBV7WPGlk1aayqTVgEXOwJB1uOLhRKI4=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=oC68VTRol1Y3hjX1vAi//9urfPu7d02UXobdQiqvWKKJjXLdH5XjExRNHIl60bEKb+
         vQ7MQ6WGCLzGxcGN4tAjoAGDskolSyZlwpQQcfezRME/dft5CB7DSj+n5orA8Rszjmd8
         aH4hJ5L/D2QqTjB2lWWwp2OjnV7sdubik4f3vZc43dys+tahYxyWob61G4G09v4FsyTw
         0RdIwq8Aa/885s08zpctW+nforkR9kxhUr9RXYKdACrZRYH59VpgKT25O+ldPpDPIwP0
         rqZyaUHf/toRa5D8CAFVpCHopmcH1TijOM1qQh1Inf/5CvWw8+SkSMd3qanzCPCmWi3r
         znYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783986491; x=1784591291; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VpD4CQGECuMrBV7WPGlk1aayqTVgEXOwJB1uOLhRKI4=;
        b=Pixy+LOvKTNB5KhvGXcMOHXW0gd6blAeRea2iDHFdFYFmm1kSrOfrXh+B/r7DKOhSI
         mym83MSM3Lfq4FFHeGR+Yix+le0T+wubZl5nyJyyL3NUtEGHLsbCKnh+pZoitQdo5kkz
         q7Ae2qNR57FIYOp9lTX/OhqB4L2RDLUj0Bt2EDo0Mpa5hGXux0jIKfZACSqccQ33MtZo
         H+/qbLi6mpQxZBHOQ2Q+3XYyx+zimrXwbkAieVeNWz5cvGRMiJrck0Ir4zdyQ/zg/x3X
         xJ1SDUcnOlOX65YVy7NhExdy5XB0i3iSODuB2e9y3K8oYWCK+4h8xr8v+eKEUzNkSG6L
         a10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783986491; x=1784591291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpD4CQGECuMrBV7WPGlk1aayqTVgEXOwJB1uOLhRKI4=;
        b=nTIYD4f5ODBMcRYPcQunGcguWYDNVdUMJat28PIWt7kXXYcI9ZiI75sWUFRLBujssp
         p/HW+glB/JcgepsbcP3zD57oxpkYGGjRr09Ti/i8fuknlvu5t3be7wDsfk57woQbPfuY
         F6ePG3Y4RfwE+dbKyrwuM7eq6RKln/RxxOAValCOMO+1VufM010y+xBdbpnDDyUPhJKB
         XhTySjUiqXvSGsey2ojCBsWlgM6KUACtxZ0yrVYtQRn4UA1oDd7tjFIzxD72ckK4YCqW
         0YAP/TeEY7kJ4pKtPC7DSwOe2cNV0MM4PsFB7fpIKfMrMrNRxA70/eSe9leiKHStIK4B
         2Fcw==
X-Gm-Message-State: AOJu0YxcNBJ4FGR9sYz13+fiMiIR64kW2ifyCgeCqFnrajYFbTEtDUDE
	6SfRM9ajopExJk7ShXd+1n03ijBGYS1rpSXJieNWc8HQwKuBVsJ0hZPMXbZgz3YP0CtZRCi86AC
	gdOR8a3RAZR2Ag+nwQRvvz1Jjk1YpgP4ty4qRM5gYWs4eU6XwN0D1U4EZ8GZtAdXc5U7I8BVftu
	TxfzA0xHLt5wuHyxQK+gS/5JB3N66zP1SK+3DZ91Ec
X-Gm-Gg: AfdE7cnzWQR6D6icnTQ7hT+7Mn1lK6Ej8mzD/BzlF1vX5B7RgnZXPLPbmHhN8/wveDu
	p+Wax0F1UArc3BkWyTWa9NOdd9hFj4AJ9/G8eHrETZauJduZgCFvnwBs7KvfoB1tdVVeSyUZ60O
	iFFJERTNbZG7GrLbHLKiz6eReN03KlbfbSW2p3+fF0/rQgkWDA3Nywuo+ZRqKbCpAjqQs57Q==
X-Received: by 2002:a05:6808:300f:b0:497:e069:964b with SMTP id 5614622812f47-4a42ac1bf54mr7050634b6e.9.1783986491127;
        Mon, 13 Jul 2026 16:48:11 -0700 (PDT)
X-Received: by 2002:a05:6808:300f:b0:497:e069:964b with SMTP id
 5614622812f47-4a42ac1bf54mr7050622b6e.9.1783986490782; Mon, 13 Jul 2026
 16:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com> <20260626101433.3133466-8-peter.lin@sifive.com>
In-Reply-To: <20260626101433.3133466-8-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 16:48:00 -0700
X-Gm-Features: AUfX_myXSCecMtynQosARd-a97qIkA8FA4PmWO-MiC7BfzxsDm0-_zyM0GKSfqU
Message-ID: <CAAVgOk+HDHENppd2G=_aqAv+kyk+-QAMnsVZ1qMuTKaick0MrQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/12] lib: sbi_domain: print World ID config at boot
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Proofpoint-GUID: 1_EQE3FBAnOKuCtAKvE-BnWTwRzVZHR9
X-Proofpoint-ORIG-GUID: 1_EQE3FBAnOKuCtAKvE-BnWTwRzVZHR9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDI0NSBTYWx0ZWRfX59rbKz1fBB5k
 emZzbyEY+dJ+BYgYw2p1FawWtDAia5o0I8eDRN/qnZdjZ272iPq908TADhAXcFp9vpD+rSTrVXH
 mRX0Shvzzh5C2SiRrew5Z0CIYTfDFUU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDI0NSBTYWx0ZWRfX34Jh46bzrMjp
 Yehb00oRatDhC41I9QOvACyd1cu9kusz2lbgLw9vP5Un9yh0pArdbFLEL8kgJVaWaindXUeCgnO
 ffHNvhL5JdSX3TrzgwpnoRJPfVx73UftIjszfyRFxUJALuD7/WHR6JYk9x3/RFhNlYHlUbwVfOh
 yavP3nU5xaSmg8K66xX7hmffA0aiB6oMcB3g7hfj3hVAOMVWHoEXREO3MEW7/kSOwBEOhQK4exH
 Mtgr6Kb6XHeZ3mElOSV3xQgl5w4SQk7TEKKalUPznc+Rddpi19WDfqbtMFQgs4J9NV48uf6gstc
 z0SXvXKx4ixox47SFvDLugjDw0aS5JxG3rxU9+opxtKBs+GXqOmDir1xYAgfiNPP8yGOqTCFWTt
 ubPLwODeT7eW80jmPjX+fAIMjtSP69HIOiCZFONkneXVLU/czmcjKkmVmdvVKrC2sq14+GUPiUe
 RGyhZpXsnYO0cnZdCxA==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55793b cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=JfrnYn6hAAAA:8 a=pFyQfRViAAAA:8
 a=Nlebn74x2XDDxRsALKkA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_164812_913335_967DB4F0 
X-CRM114-Status: GOOD (  18.02  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMzoxN+KAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gRXh0ZW5kcyBzYmlfZG9tYWluX2R1bXAoKSB0
byBkaXNwbGF5IFdvcmxkIElEIGNvbmZpZ3VyYXRpb24KPiAobmV4dF93aWQgYW5kIG5leHRfd2lk
bGlzdCkgZm9yIGVhY2ggZG9tYWluIGF0IGJvb3QuIFByb3ZpZGVzCj4gYm9vdC10aW1lIGRpYWdu
b3N0aWMgdmlzaWJpbGl0eSBmb3IgZGVidWdnaW5nIGFuZCB2ZXJpZmljYXRpb24uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0t
LQo+ICBsaWIvc2JpL3NiaV9kb21haW4uYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGli
L3NiaS9zYmlfZG9tYWluLmMgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IGluZGV4IGZhNjkxNzBi
Li40NDNhYTYwYiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW4uYwo+ICsrKyBiL2xp
Yi9zYmkvc2JpX2RvbWFpbi5jCj4gQEAgLTEwLDYgKzEwLDcgQEAKPiAgI2luY2x1ZGUgPHNiaS9y
aXNjdl9hc20uaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfY29uc29sZS5oPgo+ICAjaW5jbHVkZSA8
c2JpL3NiaV9kb21haW4uaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydC5oPgo+ICAjaW5jbHVk
ZSA8c2JpL3NiaV9oYXJ0bWFzay5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9oZWFwLmg+Cj4gICNp
bmNsdWRlIDxzYmkvc2JpX2hzbS5oPgo+IEBAIC02MDgsNiArNjA5LDMxIEBAIHZvaWQgc2JpX2Rv
bWFpbl9kdW1wKGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluICpkb20sIGNvbnN0IGNoYXIgKnN1ZmZp
eCkKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIGlmIChz
YmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0hBUlRfRVhUX1NNTFdJRCkpIHsKPiAr
ICAgICAgICAgICAgICAgaWYgKGRvbS0+aGFzX25leHRfd2lkKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHNiaV9wcmludGYoIkRvbWFpbiVkIE5leHQgV2lkICAgICVzOiAldVxuIiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbS0+aW5kZXgsIHN1ZmZpeCwgZG9tLT5u
ZXh0X3dpZCk7Cj4gKyAgICAgICAgICAgICAgIGVsc2Ugewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCA9IHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0
cigpOwp1c2UgbG9jYWwgdmFyaWFibGUgdG8gc3RvcmUgc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRy
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0X2ZlYXR1cmVz
ICpoZiA9IHNiaV9oYXJ0X2ZlYXR1cmVzX3B0cihzY3JhdGNoKTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBzYmlfcHJpbnRmKCJEb21haW4lZCBOZXh0IFdpZCAgICAlczogJXUgKHBtd2lkKVxu
IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbS0+aW5kZXgsIHN1ZmZp
eCwgaGYtPnBtd2lkKTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfSBlbHNlIHsKPiAr
ICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiRG9tYWluJWQgTmV4dCBXaWQgICAgJXM6IHVuc3Vw
cG9ydGVkXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbS0+aW5kZXgsIHN1ZmZp
eCk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24o
c2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBTQklfSEFSVF9FWFRfU01XSURERUxFRykpIHsKPiArICAgICAgICAgICAgICAgc2Jp
X3ByaW50ZigiRG9tYWluJWQgTmV4dCBXaWRsaXN0JXM6IDB4JSIgUFJJeDY0ICJcbiIsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4LCBkb20tPm5leHRfd2lk
bGlzdCk7Cj4gKyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCJE
b21haW4lZCBOZXh0IFdpZGxpc3QlczogdW5zdXBwb3J0ZWRcbiIsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4KTsKPiArICAgICAgIH0KPiArCj4gICAgICAg
ICBzYmlfcHJpbnRmKCJEb21haW4lZCBTeXNSZXNldCAgICAlczogJXNcbiIsCj4gICAgICAgICAg
ICAgICAgICAgIGRvbS0+aW5kZXgsIHN1ZmZpeCwgKGRvbS0+c3lzdGVtX3Jlc2V0X2FsbG93ZWQp
ID8gInllcyIgOiAibm8iKTsKPgo+IC0tCj4gMi40My43Cj4KPgo+IC0tCj4gb3BlbnNiaSBtYWls
aW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
