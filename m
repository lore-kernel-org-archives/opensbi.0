Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7722606A31A
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 18:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fgAoxLGR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpYccLf2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Talj8NdE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4vRmnkD7nRth67I+BaD9BSe/CyxLtPoj0ccROpfMTaw=; b=fgAoxLGRz6FURUqmN8GZCmqbJg
	3YQ4x8ecsDHA+WyhPwBCsINdYfxwG52MkvGilbdwfYhKJaGgqs19C/LLTBOnUWqx69TvKas5bStG8
	/+YgPhADAQDqN//Nykgw83cI8A67OMn5XW1my+pNXG7YCk3MNVzwKUf/N1Wm2f/pgSpSYEwFDyXes
	qC8DyxSG3vioZBF12MIcZw4Of39ZyDtpsA74Q+eIsylmt/QEp7FBdcD6Au8EbgidwHDxRunH8x2QU
	FyLWRDY1WtkkbEJRGMg3UlHFFV1/q1Elu6LIsjw1Mumn1hUdS8tcdHBwWkwpfJGffxUB1JsiKXKvD
	ecCHa6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlqg-00000005YT2-2VC3;
	Tue, 27 Oct 2026 18:24:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlqe-00000005YRw-2PHx
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 18:24:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHOTP2945727
	for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 18:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxSJpdIvofW7v+CpWSIN/EiI1PcZo7UKvV/zb5PBR8E=; b=MpYccLf2x7nHLiA3
	xyv7XJ6kvo0r25vJkZkwZoh/knLPyB3bGOsCJ2zANTsZMitCpP1DXbqGfGF3iboz
	lqkQ1asM6u998dxC2TpLejHPy/urdlMWJ84+yZ2wHSU3lFOxQpwezFf//eSJy+sy
	VTnrUDXLG1LERNCXvFs+yViBLVuYRtPq4LnUy8SQ+j0q7wj8r6JGiXR5E5Y71RAY
	D50T+kFIH5cGOC/VFkqKUh/06omUNzWlJOsr/HBeuxnzkoYXHB0xIP3J+p18tFnA
	8HtyVGb48xEBiJ+xn9t+hR64azG/ZAl3UXS0fsyIaI04nLA732mFl/z7KOU+VDxY
	UEYvrA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6aeqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 18:24:35 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6f2b837ad5eso167704eaf.3
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 11:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793125475; cv=none;
        d=google.com; s=arc-20260327;
        b=nx684Dn5Mlus8tWejfAztSiwhhvAW9aui4qvH2kGwKOHKXRF9VWGI+MesOBenErViE
         BmhMAiuR7TnvRZXi4qMwtBMT4oUx7/+wdR5tCSITMe5NRLC+aI3bvEz5WGmjJ56xvgsB
         Jk6ZCqD/E6nA02eljn49NAMaxXblLBzxswyeDgYAtZGGwWhB9GFFrLqruEnW3D19Ob7I
         pEsjjeOn2E4XmywYFarJHYMa/QTkHsXhAei/Tl5jdYR5ct6N/keQ/Mu4QDMysEXvJ6OQ
         AwIUMJDzI4rtysKFTkll4fuS1Bu+bQYJCzgTCWMIpZ47wpx0fPI6hgJQXGlGoQ2Qg6Sd
         NVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NxSJpdIvofW7v+CpWSIN/EiI1PcZo7UKvV/zb5PBR8E=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=LfepZO9uGXj9mHx+FeioP9W+SbmA/uVB0B12o5yV+sIIr+tnR8+zex8ILaytYdtHLN
         9ZrvSqS72WPLPmGDDd5ZofMxCYkUH4GjB8cMt6FVhJQtooidNNZgQaL3CN57luyo0ADi
         v3lM3McPoQPsipmoFuEcS7l0UqlY8yW8t5gd3ycQpesAdnhmuhwhHj/5mtQd1JpDRHZr
         uPHuUesLjxwXV401X8gFq619Ceb5C3SYJp3joyAbuy5aTiroMCobIR7IZGcYRGI8CJ7l
         Bs3462OV/Db0/Yt7CYNwF5DJPMUj/b+Fz4kSnC1h/CJM6GG+6yOXpEBAyi5YdrbCYFZX
         Nfxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125475; x=1793730275; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NxSJpdIvofW7v+CpWSIN/EiI1PcZo7UKvV/zb5PBR8E=;
        b=Talj8NdEIiMRgHlj+fxwZBOw+uktweL8NUAR3DcwrZPkxkgN98KGgkiaUN4dqDn6fv
         o3TeAe0HF+RwGpUvGvN9ApdJFydfHfF+cGwsnOrZHig5nJpED/PkaRU2Nmu16bfp6M3Q
         p8TqHdbfxW35npKPr8IaReVte5KDlxdx8oAEpgNJhoglnJvVouNLrtmbFcLTjzXJUbOA
         HZGY+MaQVP6FTBe8YwZ9nxaaVWIOfyDNj7kYPi+aSzbXNKjMNacfeIXCGFO3JThDCDt/
         x3mN3gmtPvmmbkDq2as7Nf4VuDnBsWbsbm7gMjTzzTlpJfr3m9VvFI1yoyNVuFQP2h3c
         Pjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125475; x=1793730275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxSJpdIvofW7v+CpWSIN/EiI1PcZo7UKvV/zb5PBR8E=;
        b=1Dg9W/TsrOhaIKawQnfdbJnKu+QKNgu9RpM1LD1fv4nKWZ7CoG2/IGQVfHQOXNhJ/x
         9WIDritI2NgMX03XKVwdmTSlMO6eHAtPb6ZRkBysJySGHHJuBmgiwcJ21yDrlGaQxYUo
         SS0cuX5ujnoueMl6FAdzTqfsRNPZa46Bn45wBfJJkwHMPj7PVHA/o2rTjq+DZIjH+RyK
         tjHHtu9/1Us5tspVCv9tLnJo8lxHxCHyL+xszQ9sxtTNHpsKF973NJx11VhvAuEZmkgE
         p2NRF2uJLkm8R3NInoD82FeVdZToItQOCfqbjAkQ9Et+XvuX8TtB7R3O3nc84GmjHnGz
         PX8g==
X-Gm-Message-State: AFq9FYJpEFHjgScK0XOp3sk4Y3/c1P9+Ml4BwNKYlRtRRJY2Nmmp0NGK
	ZpdJ0oboiA6GhGWbk3iOX92DAmiWySDqrvVB3ufq2IUs3MqWDAnMNjFvAuGfw6rYgE/TUZHmzTb
	XltBdYG0au2SwrU+rRG47JPdYhUTXX4n8GgNRKRvYGmoDiTGyF9PIeCbvOIRYwNSJ9L50EwpdN0
	6Pdbok+p8Vw7qPrWZ0AO3OpqiwF8qbpBfBKA4f4Xdn
X-Gm-Gg: AYBFou2g6rMxOqA9T2OXEqCsVGR0wI+1435v6AQApFMpJNbVIkho4eXZcYOdpFkMuWk
	djOd4ey6E6sdnKRIfwkDlA46SijfqxmO9+LpGf3Oo8Unt9wdz5YktCGAddWsrp7qyRdWz9mOhuw
	HkBqQkFWZ6O3hAnN3DGq8lHPZAmal5NsNpJH6Dn5IedQiFgWw5xTtcJaDCEA==
X-Received: by 2002:a05:6820:2ac1:b0:70a:347e:4e9f with SMTP id 006d021491bc7-70ba0ec0a21mr4338324eaf.59.1793125474748;
        Tue, 27 Oct 2026 11:24:34 -0700 (PDT)
X-Received: by 2002:a05:6820:2ac1:b0:70a:347e:4e9f with SMTP id
 006d021491bc7-70ba0ec0a21mr4338301eaf.59.1793125474216; Tue, 27 Oct 2026
 11:24:34 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-10-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-10-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:24:23 -0700
X-Gm-Features: AclHuK-dMXDsS3euVzJTxrbeCmdErIDzTWJqLJsDPworfmQ7Aw6ISlhTOpcZKJo
Message-ID: <CAAVgOkK1kx_o-FmzbpJ-TaX3h4a9cHs-a70KqeH=9S-xwz=KQw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] docs: document WID DT properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0ec63 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=RuobVizrNxJ9wQL8hBwA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: -Kx0Tjk2BEwamxiqOa6R_Gs7ONfobseW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfXwkhZd16C7Ehr
 cLUKUCV8bZb40Cml2RAI2QE6cSe0yhnanxWxd0w9vnYKlHA9EN5hxqtMzIhpx1cJD4ssWg2TXbp
 B1jq9cDyNyVWBBagmIk6aefBGQhXwLc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX3YqPNkML3sH6
 JYIKz8+M7lIRlw7oFWrcMowq+ambER7UGJTUEYUtOA0wTm2ng+erY/s840pOtdx8NyWFfeOXsQP
 Qn/WcEJvnNS0Gd93xuWIqzRN5awpiBP8IT1DpMoCjtTvHwYN3mP2gZSzHeXykNwOaI0aFN+UFdN
 mWQ666JxeNyRAllQJAutH7qoT3jKWBSORkbYSKQdoZBgOP7fud+2SMb2LqLU4w54PFCPbbr//t+
 4x1OCXWzjWM32ovZox0XqAnjV1DTKWs2p562dr+Bcw8ml89JQH0EibAvTvOCc20RPiTlWtJ6xHn
 076EprjMTp2HEfwB0GYBG7dqI1UdCPEf8+yTBY7uLOPXAe4Sjf3JiEgWT32jRaztFyrgTLxj4Gw
 nSKxTk/+utxGe/uZV3HRQe1gwu9H3No7sOgW0DmmafFSVpaPuJ0xHRgOVGQnpySvPuWxTOyEd74
 +ukknvbydEuYKLpyEuQ==
X-Proofpoint-ORIG-GUID: -Kx0Tjk2BEwamxiqOa6R_Gs7ONfobseW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_112437_067059_3BE10CBD 
X-CRM114-Status: GOOD (  25.44  )
X-Spam-Score: -2.8 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMTozNuKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkICJ3aWQiIGFuZCAid2lkZGVsZWciIHBy
b3BlcnRpZXMgdG8gZG9tYWluIGluc3RhbmNlIG5vZGUKPiBkb2N1bWVudGF0aW9uIGFuZCBleGFt
cGxlIERULiBBZGQgYSAiUm9vdCBEb21haW4gTm9kZSIgc2VjdGlvbgo+IGRlc2NyaWJpbmcgdGhl
ICJyb290IiBzdWJub2RlIHVuZGVyIHRoZSBkb21haW4gY29uZmlndXJhdGlvbgo+IG5vZGUgZm9y
IHJvb3QgZG9tYWluIFdJRCBjb25maWd1cmF0aW9uCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGll
biBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+IENoYW5nZSB2Mi0+djM6
Cj4gLSBNYXJrICd3aWQnIHByb3BlcnR5IGFzIG1hbmRhdG9yeSB3aGVuIFNtbHdpZCBpcyBwcmVz
ZW50IGZvciBib3RoIHJvb3QKPiAgIGFuZCBkb21haW4gaW5zdGFuY2Ugbm9kZXMuCj4gLSBSZW1v
dmUgbWVudGlvbiBvZiBNLW1vZGUgV0lEIGZhbGxiYWNrIHdoZW4gJ3dpZCcgaXMgYWJzZW50Lgo+
IC0tLQo+ICBkb2NzL2RvbWFpbl9zdXBwb3J0Lm1kIHwgMzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZG9jcy9kb21haW5fc3VwcG9ydC5tZCBiL2RvY3MvZG9tYWluX3N1cHBvcnQu
bWQKPiBpbmRleCA1MTczNzIxOC4uNTQzMjdlOGQgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9kb21haW5f
c3VwcG9ydC5tZAo+ICsrKyBiL2RvY3MvZG9tYWluX3N1cHBvcnQubWQKPiBAQCAtNTYsNiArNTYs
OCBAQCBoYXMgZm9sbG93aW5nIGRldGFpbHM6Cj4gICAgZG9tYWluLiBUaGlzIGNhbiBiZSBlaXRo
ZXIgUy1tb2RlIG9yIFUtbW9kZS4KPiAgKiAqKnN5c3RlbV9yZXNldF9hbGxvd2VkKiogLSBJcyBk
b21haW4gYWxsb3dlZCB0byByZXNldCB0aGUgc3lzdGVtPwo+ICAqICoqc3lzdGVtX3N1c3BlbmRf
YWxsb3dlZCoqIC0gSXMgZG9tYWluIGFsbG93ZWQgdG8gc3VzcGVuZCB0aGUgc3lzdGVtPwo+ICsq
ICoqd2lkKiogLSBXb3JsZCBJRCBmb3IgdGhlIGRvbWFpbgo+ICsqICoqd2lkZGVsZWcqKiAtIFdv
cmxkIElEIGRlbGVnYXRpb24gYml0bWFzayBmb3IgdGhlIGRvbWFpbgo+Cj4gIFRoZSBtZW1vcnkg
cmVnaW9ucyByZXByZXNlbnRlZCBieSAqKnJlZ2lvbnMqKiBpbiAqKnN0cnVjdCBzYmlfZG9tYWlu
KiogaGF2ZQo+ICBmb2xsb3dpbmcgYWRkaXRpb25hbCBjb25zdHJhaW50cyB0byBhbGlnbiB3aXRo
IFJJU0MtViBQTVAgcmVxdWlyZW1lbnRzOgo+IEBAIC05OCw2ICsxMDAsOCBAQCBmb2xsb3dpbmcg
bWFubmVyOgo+ICAgIGlzIHRoZSBuZXh0IG1vZGUgZm9yIHRoZSBST09UIGRvbWFpbgo+ICAqICoq
c3lzdGVtX3Jlc2V0X2FsbG93ZWQqKiAtIFRoZSBST09UIGRvbWFpbiBpcyBhbGxvd2VkIHRvIHJl
c2V0IHRoZSBzeXN0ZW0KPiAgKiAqKnN5c3RlbV9zdXNwZW5kX2FsbG93ZWQqKiAtIFRoZSBST09U
IGRvbWFpbiBpcyBhbGxvd2VkIHRvIHN1c3BlbmQgdGhlIHN5c3RlbQo+ICsqICoqd2lkKiogLSBD
b25maWd1cmFibGUgV29ybGQgSUQgZm9yIHRoZSBST09UIGRvbWFpbgo+ICsqICoqd2lkZGVsZWcq
KiAtIENvbmZpZ3VyYWJsZSBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgZm9yIHRoZSBST09U
IGRvbWFpbgo+Cj4gIERvbWFpbiBFZmZlY3RzCj4gIC0tLS0tLS0tLS0tLS0tCj4gQEAgLTEzMSw2
ICsxMzUsMjIgQEAgVGhlIERUIHByb3BlcnRpZXMgb2YgYSBkb21haW4gY29uZmlndXJhdGlvbiBE
VCBub2RlIGFyZSBhcyBmb2xsb3dzOgo+ICAqICoqY29tcGF0aWJsZSoqIChNYW5kYXRvcnkpIC0g
VGhlIGNvbXBhdGlibGUgc3RyaW5nIG9mIHRoZSBkb21haW4KPiAgICBjb25maWd1cmF0aW9uLiBU
aGlzIERUIHByb3BlcnR5IHNob3VsZCBoYXZlIHZhbHVlICoib3BlbnNiaSxkb21haW4sY29uZmln
IioKPgo+ICsjIyMgUm9vdCBEb21haW4gTm9kZQo+ICsKPiArVGhlIHJvb3QgZG9tYWluIFdJRCBj
b25maWd1cmF0aW9uIGlzIGRlc2NyaWJlZCBpbiBhICoqcm9vdCoqIHN1Ym5vZGUgdW5kZXIKPiAr
dGhlIGRvbWFpbiBjb25maWd1cmF0aW9uIERUIG5vZGUuIFRoaXMgc3Vibm9kZSBkb2VzIG5vdCBo
YXZlIGEgY29tcGF0aWJsZQo+ICtzdHJpbmcuCj4gKwo+ICtUaGUgRFQgcHJvcGVydGllcyBvZiB0
aGUgcm9vdCBkb21haW4gbm9kZSBhcmUgYXMgZm9sbG93czoKPiArCj4gKyogKip3aWQqKiAoTWFu
ZGF0b3J5IGlmIFNtbHdpZCBpcyBwcmVzZW50KSAtIFRoZSAzMi1iaXQgV29ybGQgSUQgZm9yCj4g
KyAgbG93ZXItcHJpdmlsZWdlIG1vZGVzIChTL1UtbW9kZSkgZm9yIHRoZSBST09UIGRvbWFpbi4g
SWYgdGhlIGhhcnQKPiArICBzdXBwb3J0cyB0aGUgU21sd2lkIGV4dGVuc2lvbiwgdGhpcyBwcm9w
ZXJ0eSBtdXN0IGJlIHByb3ZpZGVkLgo+ICsqICoqd2lkZGVsZWcqKiAoT3B0aW9uYWwpIC0gVGhl
IDY0IGJpdCBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgZm9yCj4gKyAgdGhlIFJPT1QgZG9t
YWluLiBJZiBwcmVzZW50LCBPcGVuU0JJIHdyaXRlcyB0aGlzIHZhbHVlIHRvICoqbXdpZGRlbGVn
KioKPiArICB3aGVuIGVudGVyaW5nIHRoZSBST09UIGRvbWFpbiAocmVxdWlyZXMgU213aWRkZWxl
ZyBleHRlbnNpb24pLiBJZiBhYnNlbnQsCj4gKyAgY2xlYXJzICoqbXdpZGRlbGVnKiogdG8gZGlz
YWJsZSBTLW1vZGUgV0lEIGRlbGVnYXRpb24uCj4gKwo+ICAjIyMgRG9tYWluIE1lbW9yeSBSZWdp
b24gTm9kZQo+Cj4gIFRoZSBkb21haW4gbWVtb3J5IHJlZ2lvbiBEVCBub2RlIGRlc2NyaWJlcyBk
ZXRhaWxzIG9mIGEgbWVtb3J5IHJlZ2lvbiBhbmQKPiBAQCAtMjA1LDYgKzIyNSwxMyBAQCBUaGUg
RFQgcHJvcGVydGllcyBvZiBhIGRvbWFpbiBpbnN0YW5jZSBEVCBub2RlIGFyZSBhcyBmb2xsb3dz
Ogo+ICAgIHdoZXRoZXIgdGhlIGRvbWFpbiBpbnN0YW5jZSBpcyBhbGxvd2VkIHRvIGRvIHN5c3Rl
bSByZXNldC4KPiAgKiAqKnN5c3RlbS1zdXNwZW5kLWFsbG93ZWQqKiAoT3B0aW9uYWwpIC0gQSBi
b29sZWFuIGZsYWcgcmVwcmVzZW50aW5nCj4gICAgd2hldGhlciB0aGUgZG9tYWluIGluc3RhbmNl
IGlzIGFsbG93ZWQgdG8gZG8gc3lzdGVtIHN1c3BlbmQuCj4gKyogKip3aWQqKiAoTWFuZGF0b3J5
IGlmIFNtbHdpZCBpcyBwcmVzZW50KSAtIFRoZSAzMi1iaXQgV29ybGQgSUQgZm9yCj4gKyAgbG93
ZXItcHJpdmlsZWdlIG1vZGVzIChTL1UtbW9kZSkgZm9yIHRoZSBkb21haW4gaW5zdGFuY2UuIElm
IHRoZSBoYXJ0Cj4gKyAgc3VwcG9ydHMgdGhlIFNtbHdpZCBleHRlbnNpb24sIHRoaXMgcHJvcGVy
dHkgbXVzdCBiZSBwcm92aWRlZC4KPiArKiAqKndpZGRlbGVnKiogKE9wdGlvbmFsKSAtIFRoZSA2
NCBiaXQgV29ybGQgSUQgZGVsZWdhdGlvbiBiaXRtYXNrIGZvcgo+ICsgIHRoZSBkb21haW4gaW5z
dGFuY2UuIElmIHByZXNlbnQsIE9wZW5TQkkgd3JpdGVzIHRoaXMgdmFsdWUgdG8gKiptd2lkZGVs
ZWcqKgo+ICsgIG9uIGNvbnRleHQgc3dpdGNoIGludG8gdGhpcyBkb21haW4gKHJlcXVpcmVzIFNt
d2lkZGVsZWcgZXh0ZW5zaW9uKS4gSWYgYWJzZW50LAo+ICsgIGNsZWFycyAqKm13aWRkZWxlZyoq
IHRvIGRpc2FibGUgUy1tb2RlIFdJRCBkZWxlZ2F0aW9uLgo+Cj4gICMjIyBBc3NpZ25pbmcgSEFS
VCBUbyBEb21haW4gSW5zdGFuY2UKPgo+IEBAIC0yNjAsNiArMjg3LDExIEBAIGJlIGRvbmU6Cj4g
ICAgICAgICAgICAgICAgICBvcmRlciA9IDw2ND47Cj4gICAgICAgICAgICAgIH07Cj4KPiArICAg
ICAgICAgICAgcm9vdCB7Cj4gKyAgICAgICAgICAgICAgICB3aWQgPSA8Mz47Cj4gKyAgICAgICAg
ICAgICAgICB3aWRkZWxlZyA9IDwweDAgMHgwPjsKPiArICAgICAgICAgICAgfTsKPiArCj4gICAg
ICAgICAgICAgIHRkb21haW46IHRydXN0ZWQtZG9tYWluIHsKPiAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAib3BlbnNiaSxkb21haW4saW5zdGFuY2UiOwo+ICAgICAgICAgICAgICAgICAg
cG9zc2libGUtaGFydHMgPSA8JmNwdTA+Owo+IEBAIC0yNjgsNiArMzAwLDggQEAgYmUgZG9uZToK
PiAgICAgICAgICAgICAgICAgIG5leHQtYXJnMSA9IDwweDAgMHgwPjsKPiAgICAgICAgICAgICAg
ICAgIG5leHQtYWRkciA9IDwweDAgMHg4MDEwMDAwMD47Cj4gICAgICAgICAgICAgICAgICBuZXh0
LW1vZGUgPSA8MHgwPjsKPiArICAgICAgICAgICAgICAgIHdpZCA9IDwxPjsKPiArICAgICAgICAg
ICAgICAgIHdpZGRlbGVnID0gPDB4MCAweDY+Owo+ICAgICAgICAgICAgICAgICAgc3lzdGVtLXJl
c2V0LWFsbG93ZWQ7Cj4gICAgICAgICAgICAgICAgICBzeXN0ZW0tc3VzcGVuZC1hbGxvd2VkOwo+
ICAgICAgICAgICAgICB9Owo+IEBAIC0yNzYsNiArMzEwLDggQEAgYmUgZG9uZToKPiAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAib3BlbnNiaSxkb21haW4saW5zdGFuY2UiOwo+ICAgICAg
ICAgICAgICAgICAgcG9zc2libGUtaGFydHMgPSA8JmNwdTEgJmNwdTIgJmNwdTMgJmNwdTQ+Owo+
ICAgICAgICAgICAgICAgICAgcmVnaW9ucyA9IDwmdG1lbSAweDA+LCA8JnR1YXJ0IDB4MD4sIDwm
YWxsbWVtIDB4M2Y+Owo+ICsgICAgICAgICAgICAgICAgd2lkID0gPDA+Owo+ICsgICAgICAgICAg
ICAgICAgd2lkZGVsZWcgPSA8MHgwIDB4MT47Cj4gICAgICAgICAgICAgIH07Cj4gICAgICAgICAg
fTsKPiAgICAgIH07Cj4gLS0KPiAyLjQzLjcKPgoKUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEg
PHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
