Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2EAC43458
	for <opensbi@archiver.kernel.org>; Sat, 11 Jul 2026 08:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHfL4YclnzndXXx7/h3MwhZtVSp7hTYuc73dv+3UMR8=; b=Eu5HXXhiiEzPzZ
	1BkIcmbEDy2OGcva6d/bKIMXC2CEatok6WWMEXpz5LGI++ZQvYRM2vzaYsrsnvk3h0EdIGyKjuXBe
	dqdnjFDl8UlL+B8C/HyDO0XW2f57apXCVpVr9obOFKIz47fEM/M6mrLHdjFlRwgShLZcvatunVD0S
	ppo4bYtKuVcYU0QooN3feCix4ROBam6LEn1L+V4x5hY1QQdLqqK5DGX1PJ9SDF87GYE6400Cvvtmw
	jN8MuMD07nyy6U5ZPWDTVEw6mEG8M4GhnFDS9imal3pLl6U92Zdnd5M55kt7nJ0B4j6xJfnHl2PSi
	d/OSVP6kSWKG2fQfe65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiT8y-00000006OL2-0lsD;
	Sat, 11 Jul 2026 08:33:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiT8v-00000006OKd-2s98
	for opensbi@lists.infradead.org;
	Sat, 11 Jul 2026 08:33:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B6xYbr2967787
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 08:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7mF7k4LD1latlJMIWLQ+dh+gBwIgV8aW1rjvBGOtfg=; b=gsbmbykcaWY2OSSR
	kBGbbb9fmYUtsSTgD0QjL7JIpzp2Xo7+i9NCgmQXY6qXY7NYwP5XjAbm8HQOzxbr
	rc81a+YgJ3Ip4L/9Mc2OoYKD8THkU1Q7j7jFf6UjkWbATHOUSpWl2u8O0QzC4/g2
	06952rz7qvAdMjBg3wRNy/4QGLjKYz6EW4wafqnECLqaVkwY9nwubG0KQSsBHnPq
	xW6KRskHu6SgP5tZUu23tajkE3kwpnuggWNne+XNBEp8fK83B3BhuPHdC2y1AdMt
	ZTEL4HIOUUp3wz5OPfxeivMJQluk7q3y3VJrIDX2EmLqFjlRvoooL/qAX2Ki+g27
	5Yhasg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0ggbse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 08:33:00 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e688de6beso57915477b3.0
        for <opensbi@lists.infradead.org>; Sat, 11 Jul 2026 01:33:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783758779; cv=none;
        d=google.com; s=arc-20260327;
        b=Dyh/MwH0bZfGOf6D16DnFtMhs7w9EloTM05Ctgh0dmGMDGNOPcJYVMe4YR0gN6TQk8
         la3cLPvTMP0a++XxMsg84lTQ+W+RKpdOvHflP+sWokCr81mLfL0tgdXLptMD/krZ7GHN
         vBMMs3Ea52cK1REiZn6xJGdwUPJvXpFEdssfedO81Qtxke8ndns8xT11u+Z/PbhvLFZn
         V71QNDeRk0iC8RrXnr5vt/YPIsj52sFR3wu4uyJtKHnIrdcBykG3lWArxY8lJ/ANe9jD
         gQo1eI5IQyaMslmImqg3daJRd3OO2M3rPjTJ6TAfWA+NPC+MFDEa0MBlkosgmp7U1TsD
         c1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n7mF7k4LD1latlJMIWLQ+dh+gBwIgV8aW1rjvBGOtfg=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=JA3c6VivtdzzYeypgPW1EcZKiMjJcRy27a4MPZRoXOqM4u+zj/MUFdUceqrWdkJ77Y
         nikeM3v6s/2Eo97zW80b52tSD9fmT37aPnm6SF3QHwnY3miSo49/diYO8olS8nUhKOvi
         PnKzL5+6/WvMQ2+Rs3Rh6jbJTKHOE4M4SlQNo12pzJ1UVQrZePgvRnp5brqfZPPaCzGQ
         tiF91IintOM2QNuf4lRLfWLFgZRbZukpOlmPKmOkn6iGGpLgnrI22+Vto5LskS9KikM3
         A58kOEGn3MPhPXCfO52SnRkYJJQVCp7XOLhkzwJFixOKJWAYiZJHfcagpMRnSbUlfmVS
         51Tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783758779; x=1784363579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n7mF7k4LD1latlJMIWLQ+dh+gBwIgV8aW1rjvBGOtfg=;
        b=CoqgcTBs2Lk7EM+NQQEJ7kuS+hH2i3Tx6CM/RxDEH3n79jMpgnrc1NWZtZxzgxcTw9
         NeqBBNvD2zA9Pw1KxJgqXyr9z5L6FnebQdahyx4V6t5fylSXUbm8blj/9LqcmT79aQJW
         uVV+wZx0PeYjRfGFzTHnE/O2m8N6TJnZ9MtoBQKw3MHhqGYZ6F4uyxbvnawmEwlcAAWC
         a5XyhoizBk8eyE30PsPwSZKek0DcvrEA1IkywGLie7yN8VfMMBIsQZ/BUK7/XbUugcSu
         2b/AkB+dpPfDBEeL+CbOp3byg/WzSy5wZr0GMGHzLLJTeEu3kv0YIf228VQchk/lcWbq
         hHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783758779; x=1784363579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7mF7k4LD1latlJMIWLQ+dh+gBwIgV8aW1rjvBGOtfg=;
        b=XiMcvzC5w2ukV1W8vNcknGvOgEdsKPPnchwbdzjX/vzhaK1W94MAitnbj6skgNzP7X
         Ea9QWU8dNXi6Uw9D255l8E9O/NOz/j0jU/g4ut0a9ErKw0yeAnpY40UxRK1LczFDmDLF
         6eD8B2B3qcm1pmR8qbQPZyrU7GjvUf2BBrh7ScbAsyF/DZ2aN98Sy1Y7jhHqsUUl9/RP
         sDRDf33hMzJWXg7r0i4ASAeTzANgoAO+5bDNMYSi/zVxOYJpqMivZeJ26QNjzZ1ZQ+EK
         qi5fCKHNmS7AOGlqnLaL9IWojF8Ic1T41FRFoI1VmWkj2QeOgOs9rXZ4CJmWT3hUPYKk
         Q9iQ==
X-Gm-Message-State: AOJu0Yzi2xybzCjdoziyfvYI+mG7udUThoFRQts90zyy7n6kYZIFR8ef
	w2lBCCWpjWQAk51cJzFh48DoVc5jX1ZFTRtg7TNgiWbJgtqdiBS2aoBdJ6PCvGzc2wmfGBSyhYF
	2xHJ4cLANg5YxuJeciBCOIomqT5BRdLGZqpqgPX/XEDTkv5PMovthBrdLgtDs7uPV41SgymuUjG
	xtRD0kGuJjvYSZwsap24RYSoKXytA8SdbQPJGjNAk0
X-Gm-Gg: AfdE7clLKBFksjfasLjRk6WvOmh3OTc4Jf56PGmhDlwzBghjLoCaErhilVjLHnorc1t
	m+i3Kv15KMf/hgmP1YbubqoeNlgllkNYbxrvTdc9LN1+H8T5Ne948dRQFUxEI6LCadpOyUzwWpP
	RRSiSOrG21+IovS4vFht+7nd9QcTpk7kVmbR7gCkhMoNXuKEgjfJa3JzYiEgvIxsp5CINHnQ==
X-Received: by 2002:a05:690c:3744:b0:812:9e6d:d47c with SMTP id 00721157ae682-81e907223bbmr14432287b3.10.1783758779573;
        Sat, 11 Jul 2026 01:32:59 -0700 (PDT)
X-Received: by 2002:a05:690c:3744:b0:812:9e6d:d47c with SMTP id
 00721157ae682-81e907223bbmr14432097b3.10.1783758779113; Sat, 11 Jul 2026
 01:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260709005819.1783002-1-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260709005819.1783002-1-pawandeep.oza@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 14:02:47 +0530
X-Gm-Features: AUfX_mx4eVzoWszFf5JFFItALBX9FTciAfsgc0O18O-e-SyzjvAkF4qhYF9_xRQ
Message-ID: <CAFR3w37TW2q=QzMvD-aiSASucc+aCUoVzyV_DA=g90iUHU+Mxw@mail.gmail.com>
Subject: Re: [PATCH v2] lib: utils/mpxy: bind channel access to owning domain
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a51ffbc cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=EwiLXQTX8sYWes5SSWgA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: mPvoq9MX6aIhwtH0jRaxfSKk5DEM1w3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDA4MSBTYWx0ZWRfX3HiGVMQ/J1oL
 mED6I/3YzctHlMq2H0zR85q8f5I2XEzfjPJIar5+hs8aoIHEVsaHHyqlzONpc9KOWTigap1itsW
 Lt53abXywF/a5UxR9s+SCJl+4en/nmSDaKFuWt0h7W26O6i+LQ1pxyXb+aj8PhmcK2iecN+73X0
 kOzbCDRfnNWZD1pvYg3xdqX2t9DZcp54ly3JjaVyE9ApeqyE2mjlFwmvcM8QJKrPJEKcqgySTRf
 kR+3kijR0h+MXg7DxGcWA78UnsAbmlt+5p1Sjjrk5JiGh8RkJ4zJFk8dIQcTPDIborE4JdbBSHj
 O7CiiOUZCZ/KrZzpJLQo8IvKVw28DsiEjL5NVA9Jncx2NATsIIK8IRWE7wnYRz6lkMON5oMOzwm
 Gi5yCZfeOkgOHEe/fffuddFqxIyQ1fJaGMzLGmaKB8ngRTlZlzIeY7c8/mZRtbTICQtKAlOAwAZ
 F6zWI4jvyp5CESDjz4Q==
X-Proofpoint-GUID: mPvoq9MX6aIhwtH0jRaxfSKk5DEM1w3B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDA4MSBTYWx0ZWRfXx6rv2bkLNphk
 wX9r/rjZSWYtHjxbQvHZkpiNV7wWgFGzoievOMjjLhd+mM4nCytLUK4dmBHU0Q/1SxDxgTt1cWx
 hqDu+ztQITFEa6K5m2fvinykjbeYzno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607110081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_013301_731176_A9EF12FB 
X-CRM114-Status: GOOD (  20.15  )
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

T24gVGh1LCBKdWwgOSwgMjAyNiBhdCA2OjI54oCvQU0gUGF3YW5kZWVwIE96YQo8cGF3YW5kZWVw
Lm96YUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEZyb206IE96YSBQYXdhbmRlZXAgPHBh
d2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KPgo+IFRoZSBNUFhZIGZyYW1ld29yayBjdXJy
ZW50bHkgc3RvcmVzIHJlZ2lzdGVyZWQgY2hhbm5lbHMgaW4gYSBnbG9iYWwKPiBsaXN0IGFuZCBl
eHBvc2VzIHRoZW0gdG8gYWxsIGNhbGxlcnMuIEhvd2V2ZXIsIHRoZSBpbnRlbmRlZCBtb2RlbCBp
cwo+IHRoYXQgZWFjaCBjaGFubmVsIGlzIGFzc2lnbmVkIHRvIGEgc2luZ2xlIHN1cGVydmlzb3Ig
ZG9tYWluIGF0IGJvb3QgYW5kCj4gcmVtYWlucyBvd25lZCBieSB0aGF0IGRvbWFpbiBmb3IgaXRz
IGxpZmV0aW1lLgo+Cj4gSW50cm9kdWNlIGZpeGVkIG93bmVyLWRvbWFpbiB0cmFja2luZyBpbiBz
dHJ1Y3Qgc2JpX21weHlfY2hhbm5lbCBhbmQKPiBtYWtlIGNoYW5uZWwgbG9va3VwIGFuZCBlbnVt
ZXJhdGlvbiBkb21haW4tYXdhcmUuIEEgY2hhbm5lbCBpcyBub3cKPiB2aXNpYmxlIG9ubHkgd2hl
biBhY2Nlc3NlZCBmcm9tIGl0cyBvd25pbmcgZG9tYWluLiBBbHNvIHJlcXVpcmUgdGhlCj4gb3du
ZXIgdG8gYmUgc2V0IGJlZm9yZSBjaGFubmVsIHJlZ2lzdHJhdGlvbi4KPgo+IFRoaXMgYWxsb3dz
IE1QWFkgdG8gc3VwcG9ydCBzeXN0ZW1zIHdoZXJlIHRoZSBzYW1lIGhhcnQgbWF5IGJlIHJldXNl
ZCBieQo+IG11bHRpcGxlIGRvbWFpbnMgd2hpbGUga2VlcGluZyBjaGFubmVsIG93bmVyc2hpcCBh
bmQgdmlzaWJpbGl0eSBmaXhlZCB0bwo+IHRoZSBkb21haW4gdGhhdCBvd25zIHRoZSBzZXJ2aWNl
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogT3phIFBhd2FuZGVlcCA8cGF3YW5kZWVwLm96YUBvc3MucXVh
bGNvbW0uY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfbXB4eS5oICAgICAgICAgICAgICB8
ICA1ICstLQo+ICBsaWIvc2JpL3NiaV9tcHh5LmMgICAgICAgICAgICAgICAgICB8IDUzICsrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIGxpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlf
bWJveC5jIHwgIDIgKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1p
X21ib3guYyBiL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfbWJveC5jCj4gaW5kZXggODRi
N2E2N2QuLmQyZDQyMGRlIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3Jw
bWlfbWJveC5jCj4gKysrIGIvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9tYm94LmMKPiBA
QCAtMjk5LDYgKzI5OSw4IEBAIGludCBtcHh5X3JwbWlfbWJveF9pbml0KGNvbnN0IHZvaWQgKmZk
dCwgaW50IG5vZGVvZmYsIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hCj4gICAgICAgICAvKiBT
ZXR1cCBNUFhZIG1ib3ggY2xpZW50ICovCj4gICAgICAgICAvKiBDaGFubmVsIElEKi8KPiAgICAg
ICAgIHJtYi0+Y2hhbm5lbC5jaGFubmVsX2lkID0gY2hhbm5lbF9pZDsKPiArICAgICAgIC8qIFNl
dCB0aGUgb253ZXIgZG9tYWluICovCgolcy9vbndlci9vd25lcgoKPiArICAgICAgIHJtYi0+Y2hh
bm5lbC5vd25lcl9kb21haW4gPSAmcm9vdDsKPiAgICAgICAgIC8qIENhbGxiYWNrIGZvciByZWFk
IFJQTUkgYXR0cmlidXRlcyAqLwo+ICAgICAgICAgcm1iLT5jaGFubmVsLnJlYWRfYXR0cmlidXRl
cyA9IG1weHlfbWJveF9yZWFkX2F0dHJpYnV0ZXM7Cj4gICAgICAgICAvKiBDYWxsYmFjayBmb3Ig
d3JpdGUgUlBNSSBhdHRyaWJ1dGVzICovCj4gLS0KClJldmlld2VkLWJ5OiBSYWh1bCBQYXRoYWsg
PHJhaHVsLnBhdGhha0Bvc3MucXVhbGNvbW0uY29tPgoKVGhhbmtzClJhaHVsCgotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
