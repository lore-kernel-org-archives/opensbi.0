Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86A5606A31A
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 18:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hk9GCSRl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j4yeL2VG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M6iXp04w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y2+mwVYTppRNu89I7qAgozQDLJ/wgwgmY3qxYS7ufaE=; b=hk9GCSRlx4LvRPwpor+/bt4Ck6
	DaBtKJ7wI4T9VFubXbWuSyQEBONp80ODXVXV7vm/ovpKNK7yAqXY+UtGsFPTCLi1TKBuWk+bWE85g
	Chb8HGZfQ+IWSf9RTo6NNqudtAz7s+2htyR2keDvU0JAGexgFVbdKkN42ZkBuyjZ22u6nKaeC4GLU
	L5uVm0LHq2KGkSYjYEdICLrsafWFOkEHI04dT4WZwTBwh800AhhkupZyPbeX5oa/qYV9Id8h5NQMt
	jWk9QwJ5AN4LyWorrt4e4DENlpn3VDzBz1SoIsi5PEYLaxlSXCvsW476n2aFi4HpX2+YTSCwPLeeM
	0WsJ7GqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlpc-00000005YCs-3qjK;
	Tue, 27 Oct 2026 18:23:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlpa-00000005YCA-3jAh
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 18:23:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHHKM4051046
	for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 18:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwYUbadyfhNDb6cZGtR3ntjHrcqV6JUfsRhnJm4Uu1E=; b=j4yeL2VGM1jA3T2e
	9VJILzepQFzckK+84jUc5KKLB/wZEjMm6H0JVGbB+aydx36CXt2qIZwgz7YhBjuX
	o6228Gouezf1dAFYqf2fbNPx7/3zvfnBavrV2TuT29kVxM17rLGN1PZ80yWnwaoX
	ov7dglFDuxOp26cGGhHVQoX0KT2Y1cU054K2xMn77njQlRdD3ifWPDPUSjg2KQjH
	zWBPWMAG3xrj4MzjVckwS1JAgZVHHz5OVccK2IexF3qUVeFDsR1US+FnSM0fysyv
	kc1g5cfWB5XpwVilWn1ezwvTuKQlI0Y9JVrvDIPpMS4MghQ5LKsoAbA//4Ca4A2E
	lxa0QA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pr16g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 18:23:29 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-83f6f9096baso193014a34.2
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 11:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793125409; cv=none;
        d=google.com; s=arc-20260327;
        b=dxo5Mme9TRhuxCOg42bkbKqUFYmELcQxhLWkx5qQE8jDudsGyDgFhxgNCrcuBSOyYr
         4Er8uw01/CCjYPxufwTPLx7rYkAjKOa8bioR3CCtk9raONQswueV3HbUY616CoUXfFH4
         //fvgzBEfmQrjHV9HcMmODpMKVLW6kRGpN/Z7lK4Q2Uv+55E1ysdZtv9Q6+EnbFjk7FB
         Kx/0oijRXW+5ByT42QSZpfmzrhot8Bkc2ipaHe72g/1lHO0ZdL++ulqX6Qe1SdKOJXGG
         E0AP2j2w+5xTXmhy/X77ntN0PEjfp//vDXPzAidfLfR3jNOGRXdEKPINn4WZ6T5zCq6h
         yGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HwYUbadyfhNDb6cZGtR3ntjHrcqV6JUfsRhnJm4Uu1E=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=RKJZtsiJww3dpybspD0fGYeFOdWxBCLBkMlcVSzWuY5p141neJJ5G3jBoQannykCvK
         v4naszedZ+1vvlJl99hhJyVf1Gmj6lXJaFmq3zotSWNv3D91EtFucshEemTEZ7ciHhDz
         BcSeZ9L/imuF7n6c1L0AIzUal5KYOWoCgRypLH+OF53zSNOHXIQJoRucw62+I0mTqFzl
         yaMTqAqaP1C63r85URHb0jYZ9LefqoXn99BH7xwCLXKqv8AjJzQ5Nh1z13F3r+EJyOu5
         NH8AKUx8r6kr8mq4MTdqEOPUpTd8j2FMBwBQmN1gXvb4K/CJRt+9CWE3vdTjAs/YQytI
         QzCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125409; x=1793730209; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HwYUbadyfhNDb6cZGtR3ntjHrcqV6JUfsRhnJm4Uu1E=;
        b=M6iXp04w7a0H3c0YRS3rGgHH4CF/LieotOdbymUFIp01GdnUalqYRFpZBA4EnlO8P0
         MUuG2Jxr1G6E4vDu6Er8y307vPXR7+5JRNiMXkf11CKuHEUG3NiKVdERZY9EPgMunZlu
         iaqz/6wTaBlLuP+wcrJjlJU1JFg8AfErPCdAGHFcza7SPU3QVU7Z4lE1IqIcyTJWwUvR
         mv9OjLNe6Qg3lU+UDy/j/QgG/K8i8YGTyS/kmtJx/DcdGlpGHhOxPQnMS5s5wOcyUv87
         RQrcLVNMHNI/UeOy1NsgMbo0EQ5SgtLX9rKEFbj4lp4yUZgNoouXQgO+onttPvti1mUZ
         mxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125409; x=1793730209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HwYUbadyfhNDb6cZGtR3ntjHrcqV6JUfsRhnJm4Uu1E=;
        b=b/aGcKcwogmf4Qgtxt78taP4I8yMhwJfxlK3vWsMWtThXRJmzJVs2doQh6GTafRJk8
         eO+IZA4Com2qbhDPk0DqPrpXkZHGZx0b/PuuGb8QjJykaB+FB7k1Qzhhn94BHes8ycnA
         u6ksNLu8hUfMnjz0fGcxP9qG+bh0ExABtRXvEVrQy9uqHcec3lPrHPZhLm/4kyTFfoVs
         F1Yk1dh6+qZhtAhJopUXHN3OkT1E48YwBacaMJE09NLPXivsJko1TkmdONRUNkcRsEvL
         TL4FpC9qIwxiEqIeErS2nFeJ2myK5t55O3ihPrBrk5/vqLTPoWSSqRCtu2FkEAMOyp0c
         8Ngw==
X-Gm-Message-State: AFq9FYJoqaQO6xVCLEtkzprQSUAZgj0U8VfKTDTz3e2tvsS8P4ZcQfJy
	tL2s1QvrdmupsbYY8EHcFa0SNjOg0/I2HTvbbwzl9jHlzjtXWLErI+WIuJJnyf6lOH/kbTp7r08
	hR24I+NbAR+9IjbZr67bXW46lqut714buX5OPpAfBbVfRrdOUp2leulttJgMrrqS6QCOUyviQg1
	reKsRHqEOSmvW0YxLPNY5HwjJUj9AyYy6vYEao6Rm6
X-Gm-Gg: AYBFou2Pi1dk4TH4JKNaelCQ8Qj2xUsLyzIdBUMpEAG8jWD60HNm2Kxm/fS3lbfuLlp
	9z3xK/6p86hBx4oLs5x/GtD3Lw2QNaJ8t32q9YJHst47QBFnqe9w2vKdJBvuJb2Ua6G1RAjRhkM
	Jari+cDisRczShEjXDV0zgKysWntYHQR27zblIN8jO9+jwMLp/l/HVlBhk0Q==
X-Received: by 2002:a05:6870:6592:b0:48f:e0e5:a1fb with SMTP id 586e51a60fabf-4a8bb8d3a35mr269081fac.47.1793125408809;
        Tue, 27 Oct 2026 11:23:28 -0700 (PDT)
X-Received: by 2002:a05:6870:6592:b0:48f:e0e5:a1fb with SMTP id
 586e51a60fabf-4a8bb8d3a35mr269057fac.47.1793125408357; Tue, 27 Oct 2026
 11:23:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-6-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-6-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:23:17 -0700
X-Gm-Features: AclHuK9i93iSOu44baN6Oiijyy_gROWxz8b76312FfK6V0gu0m8GBycN6F8_w6g
Message-ID: <CAAVgOk+4jjK5KTdB0Vjrp2LPyuvW3y3P_9ommFu6xQEz2WCpNQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] lib: sbi_domain_context: propagate error from sbi_hart_protection_reconfigure
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Proofpoint-ORIG-GUID: 6leAoEGb2MlJQsAuTW4xPQ2zeaDqHLCt
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae0ec21 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=wcEsJKMGlaldnP3vZ84A:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX2xNBba0yy2E0
 m0t0RTZECYpt8HNDxxSGpAWUkFZ7T0DJ6bcQCyabLJ9H4jY5qnffEEaPEqKfJusIc85UIqdoY7D
 H8ZNPWhYRNT/2RCo5mWHgKyG7wluPyqz0y+b8Tik/+HVHfH8PVeUW7cRCzNutgO72Je8RTeptge
 8L92bp8U69araziFQA7EYRoWWYbqZWjEz1RmYkX+2KT5YDm1FK5LMc+WhXIfcUGHozalbSQe69J
 4Syty3+TcQTz6Cr08pcfEhJlO2ts2MpXM/eHOBLgFctPLgbXNtkcZd1ivfCnsZx4ntoqQaOxzk6
 itarNb3F2YUvszR696WgiaPTMhFeRgq3it86AKqQvlGmJVRIVUEK9uSb8cNT/mVTiYk0j16dg6x
 X+CEbggGvr28Oq4PWcuhPn68ICp0zYVlSgJc0xywuu1hUU8ITeg5qlw3G+SLsz3Kx79DGo/dgRR
 6Jdn99CL8GpEiGm1KNg==
X-Proofpoint-GUID: 6leAoEGb2MlJQsAuTW4xPQ2zeaDqHLCt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfXwSde64kA4Jg2
 yywRYnmGSKNvkN9Tu/WNSc7CpX4rpt/aiJ+KZmPW8PZ4yZAjMxSgQlirHJcgATlAF82HSEWUlHv
 0JSMZ0rn9XT7jnE3kw49ydKcsC3ADnQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_112330_935649_1E7232FB 
X-CRM114-Status: GOOD (  19.34  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gUHJvcGFnYXRlIHRoZSByZXR1cm4gdmFsdWUg
b2Ygc2JpX2hhcnRfcHJvdGVjdGlvbl9yZWNvbmZpZ3VyZSBpbgo+IHN3aXRjaF90b19uZXh0X2Rv
bWFpbl9jb250ZXh0IHRvIGVuc3VyZSB0aGF0IGRvbWFpbiB0cmFuc2l0aW9uCj4gZmFpbHVyZXMg
YXJlIGNvcnJlY3RseSBoYW5kbGVkIGJ5IHRoZSBjYWxsZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZ
dS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+IENoYW5nZSB2
Mi0+djM6Cj4gLSBOZXcgcGF0Y2g6IHByb3BhZ2F0ZSByZXR1cm4gdmFsdWUgb2Ygc2JpX2hhcnRf
cHJvdGVjdGlvbl9yZWNvbmZpZ3VyZSgpCj4gICBpbiBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29u
dGV4dCgpLgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jIHwgNSArKysrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYyBiL2xpYi9zYmkvc2JpX2RvbWFp
bl9jb250ZXh0LmMKPiBpbmRleCA5ODdhYzdmYS4uMTc1MWQwMTYgMTAwNjQ0Cj4gLS0tIGEvbGli
L3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250
ZXh0LmMKPiBAQCAtMTEwLDYgKzExMCw3IEBAIHN0YXRpYyBpbnQgc3dpdGNoX3RvX25leHRfZG9t
YWluX2NvbnRleHQoc3RydWN0IGhhcnRfY29udGV4dCAqY3R4LAo+ICAgICAgICAgTVVTVF9OT1Rf
SE9MRCgmY3R4LT5kb20tPmFzc2lnbmVkX2hhcnRzX2xvY2spCj4gICAgICAgICBNVVNUX05PVF9I
T0xEKCZkb21fY3R4LT5kb20tPmFzc2lnbmVkX2hhcnRzX2xvY2spCj4gIHsKPiArICAgICAgIGlu
dCByYzsKPiAgICAgICAgIHUzMiBoYXJ0aW5kZXggPSBjdXJyZW50X2hhcnRpbmRleCgpOwo+ICAg
ICAgICAgc3RydWN0IHNiaV90cmFwX2NvbnRleHQgKnRyYXBfY3R4Owo+ICAgICAgICAgc3RydWN0
IHNiaV9kb21haW4gKmN1cnJlbnRfZG9tLCAqdGFyZ2V0X2RvbTsKPiBAQCAtMTczLDcgKzE3NCw5
IEBAIHN0YXRpYyBpbnQgc3dpdGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQoc3RydWN0IGhhcnRf
Y29udGV4dCAqY3R4LAo+ICAgICAgICAgICogaXMgYWxzbyByZXF1aXJlZCBmb3Igc29tZSBvZiB0
aGUgYWJvdmUgQ1NSIHVwZGF0ZXMgKHN1Y2gKPiAgICAgICAgICAqIGFzIHNhdHAgQ1NSKS4KPiAg
ICAgICAgICAqLwo+IC0gICAgICAgc2JpX2hhcnRfcHJvdGVjdGlvbl9yZWNvbmZpZ3VyZShzY3Jh
dGNoLCBjdXJyZW50X2RvbSwgdGFyZ2V0X2RvbSk7Cj4gKyAgICAgICByYyA9IHNiaV9oYXJ0X3By
b3RlY3Rpb25fcmVjb25maWd1cmUoc2NyYXRjaCwgY3VycmVudF9kb20sIHRhcmdldF9kb20pOwo+
ICsgICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4KPiAgICAgICAg
IC8qIE1hcmsgY3VycmVudCBjb250ZXh0IHN0cnVjdHVyZSBpbml0aWFsaXplZCBiZWNhdXNlIGNv
bnRleHQgc2F2ZWQgKi8KPiAgICAgICAgIGN0eC0+aW5pdGlhbGl6ZWQgPSB0cnVlOwo+IC0tCj4g
Mi40My43Cj4KClJldmlld2VkLWJ5OiBQYXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5x
dWFsY29tbS5jb20+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
