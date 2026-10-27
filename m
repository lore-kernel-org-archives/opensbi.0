Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463ED606A31D
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 18:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DbI/rAKx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NYvcTNay;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wc0q7En8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v2P2Z2HEniDDs7Xl2EaZECjmcOcNDTCzI/OV14nHWQg=; b=DbI/rAKxKyXUXkMLBevDRx0zCo
	e0kMbExdmgyg49tF7bF0B6uf/mQp6joeTxPHKEvDlUhEVezCIZwOksy4uIYyjwAZziBnyPYvNxbpk
	Ql1POzHvWF6qHq0uv0Z0h++x6ENr8vYx0zp5l2hlZXpk9V1lxtJSUwst24M6MKMDd3K1iYyfhgENk
	KDaEIEHSXlxcnX8TA/C9QJZVWuGJMAkUIdCs+FzSJ0XgFrszfa+FGvr0e3NFMxKMtiScLIwZObgIe
	nnPdWobLMC0SPVS19VoSkgQNh0QoiOD+fxx5CWtpFJoDuPeAkOJIlEgD5lpkGU85GrSla/D9YtW6A
	kFOqGOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlou-00000005Y1M-2NRM;
	Tue, 27 Oct 2026 18:22:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlos-00000005Y0k-1dki
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 18:22:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHqDT2960471
	for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 18:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e1hKAmkiYKxYtMOtIx0YJQhC6GwqZd/I4dCFLB9DGRw=; b=NYvcTNayhbdDMPPo
	laP1L7QdEFp+M+39nP1KGCBHu3RT7i9yYRmjQzXLKEqbW5x1hFI4kKbskq20dEBP
	Tq6Inh9UdFMd2IKYZu7o1XX29pwwZzspDhheY4F/cJ/JTsRu9FX2Ems/ilkaZ/4y
	cTHuko4/lgK7INTMfwnFAcUxgBA7gjSiDFifsoo2a06OxAMF6UTIHEmLmtshxU8P
	i6SunEDW+4u1M1/OtKsWoa/A1nrzEITQOMx8+7fdKPvitEOq968aKbUIzP5z+3iq
	J6RZw7k46E80J1WLIaoALpcwiDbrcY7CjCnGpZYhB1qWMVa2/pBUNSQng+as7QKe
	vuwdIQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy670mh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 18:22:44 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-704aee0b7b2so255851eaf.2
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 11:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793125364; cv=none;
        d=google.com; s=arc-20260327;
        b=jca0UjvHKuNZqlRFLhFy8yTVE0EdgNyYYuEvpgnrCkjHM5kpnDsqjMfzt5LHaH26j1
         9HZOrIfzPAmKuQLk3n7dlVyz6xAk6cH/23T8P89STWXDViZrv/qRr4sZOTNrcBK5dDh2
         RaW+mzCrVYRmbYOZQnJIIPnFxZ6ypNZUc7Kd16n4Gj4fAPWkDS4TRGNkhleBP51hOo3o
         92rCF9McJjSM4ew6synhZOty4K+QcsMqYQPS5SZYDp4XAJNnIhd+f4EGCdZvBv2Pi7TL
         Em2k0dRQxtS8adVF0zfHbU8B/T2HaAIeBJQymEHtUyr3EltYOHnGfLFe2xNFKMBmZDzG
         vxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e1hKAmkiYKxYtMOtIx0YJQhC6GwqZd/I4dCFLB9DGRw=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=eAtM6yT1lBDcF0aNZIIZfrwEG6tSelJFtHkn22Imxl2Boa+I4/mJb6ERgW9faS9Wg8
         0YVRhJHuFWonghB9DEBVPM2WbpUIZkMijGXsxzr0AE8HV79CXCaFumYpHo/e1fWN8Txh
         TtTkm6K8ogBHxz1qVugZn8goxbLld7gexjHSA8wqsvDihIiCtaFsN6fuys03vfiz7no+
         Lu74fN5ldPxP+JTGTsJygu+lhFOPrMaN4TP0XdZK6zS1gIV9xIYlNqiq2gJLKv66u54/
         kr7If6BdZooSY037csblubzmZtbHmSJaPxUQ1kzF3AyfVxwAoWjOEP1rW2Z0nLqiIjHP
         rDtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125364; x=1793730164; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e1hKAmkiYKxYtMOtIx0YJQhC6GwqZd/I4dCFLB9DGRw=;
        b=Wc0q7En85sRqNDncIfCQccOLwDF6Hsj14wXP2WVVKhrdKqDu50mqidin5mNsCmbhpl
         NTvJYOa1gr0Gjn7vrO2kwu3UDiGUdc0n6xv/4frS8PWKxYNLDwibtLUDu2rEn+R3cJIa
         +Q9bgxvog4f0aWK+q+mMvn40LtlXWQe6ojJJjjb2LkILR7gkI01PfWDYcnvYtYDUgXZK
         KKfM7hNiViqOpSjwN3knzc003L4mMdANK9sxrP0owMI7dNgU4c1sgczpUl3VhLtPXVp+
         kN+p7kGSHTMk3NqTvwlPHvb+iUzqXXL56n/EL3DoJYIe492PtBWICF7NNAUPsZCIy0qo
         mdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125364; x=1793730164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1hKAmkiYKxYtMOtIx0YJQhC6GwqZd/I4dCFLB9DGRw=;
        b=JwuZYmSprnlg4U1MDHPY8bHhzuIUBw1g6bDfT9ibDxBz8fh4M77q/Hof6VFO26Z8W4
         T4nQ8R0BKcl6QWeV16OpF2CohEtlCTlxpokM49mEWFLd7Kz4gGnP3yicTSpBiOJduAF4
         UVDYwNF/9oJeGhCzDkXHEQePtVPB/Z9I6mfo607UmPbwL/oJj9bGFEFgbW0QbIMFrbjK
         oBEP7/iq5HrB61QXoPOqeRXBd7ei6mxXY5sGy2hrY7YYJwCNkUGPhojPPOwdBRQxgmKh
         8MrP1FpPf7v24rd3GyRxRp1V0LKM2muAS+MJ9f2PreYHSWnNV69MROajI0EEX1maUoN8
         quVw==
X-Gm-Message-State: AFq9FYIvr/hC7drQn/JwhSRjqbUmbjzL+8XPWOhv9pSO7h1t3eJKJ28n
	uxb8R8AIswWG9qUXfRJeyUbiJGm5emAqkjB9P3EhQ+ez53bTLzL2iNfTjvg6f9nZ5aCYeVn2DVF
	LL2Ofp+rm7yd6ygzh5Y8jVsADKaOaL+Vac0gdasA8SXpiWQYuq820LeXmKEm28i7UdFnhg1Va/P
	UDHJJrpD5+nGO9pYrtACK8lNi8Hdy2H4F0MnPlSri2sBsnIybxhkE=
X-Gm-Gg: AYBFou0WWFnkiY528sws8Ghrxr5o//UyIrQw0DgHqE5wL5UiR86NhMWi1Mp75wJeW0x
	eiG7asQqAOwfZY0uBNi8fDr5L0nK7wtWwuS0GHS799FJ/luPtd7C8b9L3r/4VUyHiGTNzoVmaVd
	pj0eTwxL+zdgL9lMxzS67SazDaj7gYrmDh2KJn9PK8WoVFAgJ1Th0NBVnNyw==
X-Received: by 2002:a05:6820:83d6:20b0:6cd:3ffc:ad04 with SMTP id 006d021491bc7-70ba0ff6f64mr4118695eaf.84.1793125364012;
        Tue, 27 Oct 2026 11:22:44 -0700 (PDT)
X-Received: by 2002:a05:6820:83d6:20b0:6cd:3ffc:ad04 with SMTP id
 006d021491bc7-70ba0ff6f64mr4118681eaf.84.1793125363539; Tue, 27 Oct 2026
 11:22:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-3-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-3-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:22:32 -0700
X-Gm-Features: AclHuK8fYxRD-pjTEVIb3_xr9Nwic2_HfQrHfpXCfFDXKJabAZsmUGVe2syXThk
Message-ID: <CAAVgOk+Q+MADkOqAc7qBy9=346dMnd3Tq9bE-8+9f9hqaZf5ww@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] lib: utils: fdt_helper: parse RISC-V Worlds
 per-hart WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Proofpoint-ORIG-GUID: tZCUYogmMxawesyH3TE9IHAGoF_Z9K0w
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae0ebf4 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=PBDUiyN1TJFkXdW8PTgA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXxeEIqWMCC7OR
 dKHTNf50f64s/YCYF9mNgU7MOGsBqf7Ce6NRow19fJCCy2GRtpTSPnPyEU8dvTGjteFTLA2fY24
 kUH41Ia5J770aGQBA5ImrcsplLDqYQg=
X-Proofpoint-GUID: tZCUYogmMxawesyH3TE9IHAGoF_Z9K0w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfXzk9LF4CFQZQ0
 cZdY+o0uSlBuzF03uVwtDI/DwjM9boVSn83h3O78paD5vhHil/MsRVrtJcJeqel4bOZZ3evOLNE
 bAaD32NkTtxRppExdjqj2sJ4BvwYZIHQIwhW+e8VQNJXdVl8bHUNACUDfEIJFWf/3xr+sGj8g9c
 q+JEmpBbzWUVGPJv+QkA8ZFv2BW5zerdWcDBnM1ww3TH4aNiXXb+8PiXyW1zC04OMvGUnHp5rhP
 8CrjPcFRyu3N6ms/w1mQ/PS9d/krVFzgVJxe/0agigt853sMNjVL5RKrFcZUOUiMJmM7QUerXRW
 JeLcF71AGElC1KMG/co1Ip9cvogoOEZPLrAhLzB6cJSUFyyIFArH9ULG2DbTwYFHjT6wtJOvzP+
 5AX5WGG97TakCV2pCjfdb5W5Fq5mqLXs//651uPKtpdpYLgZfTv7R+oubzWXDbQ2PTdnQ7f2RLD
 SCpPT/wJnP+4Hsn4b7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_112246_547052_C2CCCE7A 
X-CRM114-Status: GOOD (  25.27  )
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

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMTozNeKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIGZkdF9wYXJzZV93b3JsZHNfYWxsX2hh
cnRzKCkgdG8gcGFyc2UgcGxhdGZvcm0tZGVmaW5lZCBEVAo+IHByb3BlcnRpZXMgaW4gdGhlIC9j
cHVzL2NwdUBYOgo+IC0gcmlzY3YscG13aWQ6IE0tbW9kZSBXb3JsZCBJRAo+IC0gcmlzY3YscG13
aWRsaXN0OiBiaXRtYXAgb2YgcGVybWl0dGVkIE0tbW9kZSBXSURzCj4gLSByaXNjdixwbWx3aWRs
aXN0OiBiaXRtYXAgb2YgcGVybWl0dGVkIGxvd2VyLXByaXZpbGVnZSBXSURzCj4gU3RvcmUgcGFy
c2VkIHZhbHVlcyBpbiBzdHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMuCj4KPiBUaGVzZSBwbGF0Zm9y
bS1kZWZpbmVkIHZhbHVlcyBzZXJ2ZSBhcyB0aGUgcm9vdC1vZi10cnVzdCBjb25zdHJhaW50cwo+
IGZvciBwZXItZG9tYWluIFdJRCBhc3NpZ25tZW50IGR1cmluZyBkb21haW4gY3JlYXRpb24gYW5k
IGNvbnRleHQKPiBzd2l0Y2hpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGllbiBQZXRlciBM
aW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+IENoYW5nZSB2Mi0+djM6Cj4gLSBEcm9w
IGhhc19wbXdpZGxpc3QgcHJlc2VuY2UgZmxhZyBhbmQgY2hlY2sgcG13aWRsaXN0IGRpcmVjdGx5
Lgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydC5oICAgICAgICAgICAgIHwgIDUgKysKPiAg
aW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaCB8ICAyICsKPiAgbGliL3V0aWxzL2Zk
dC9mZHRfaGVscGVyLmMgICAgICAgICB8IDkwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICBwbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgICAgICAgIHwgMTMgKysrKy0KPiAgNCBm
aWxlcyBjaGFuZ2VkLCAxMDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4g
aW5kZXggMjk0MTgwOWUuLmExODYwYTljIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9o
YXJ0LmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gQEAgLTEzNSw2ICsxMzUsMTEg
QEAgc3RydWN0IHNiaV9oYXJ0X2ZlYXR1cmVzIHsKPiAgICAgICAgIHVuc2lnbmVkIGludCBwbXBf
bG9nMmdyYW47Cj4gICAgICAgICB1bnNpZ25lZCBpbnQgbWhwbV9tYXNrOwo+ICAgICAgICAgdW5z
aWduZWQgaW50IG1ocG1fYml0czsKPiArICAgICAgIHUzMiBwbXdpZDsKPiArICAgICAgIHU2NCBw
bXdpZGxpc3Q7Cj4gKyAgICAgICB1NjQgcG1sd2lkbGlzdDsKPiArICAgICAgIGJvb2wgaGFzX3Bt
d2lkOwo+ICsgICAgICAgYm9vbCBoYXNfcG1sd2lkbGlzdDsKPiAgfTsKPgo+ICBleHRlcm4gdW5z
aWduZWQgbG9uZyBoYXJ0X2ZlYXR1cmVzX29mZnNldDsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9z
YmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaCBiL2luY2x1ZGUvc2JpX3V0aWxzL2ZkdC9mZHRfaGVs
cGVyLmgKPiBpbmRleCA3NWE1NjRkMS4uM2YzZDA5MWIgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9z
YmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvc2JpX3V0aWxzL2ZkdC9m
ZHRfaGVscGVyLmgKPiBAQCAtNTYsNiArNTYsOCBAQCBpbnQgZmR0X3BhcnNlX3RpbWViYXNlX2Zy
ZXF1ZW5jeShjb25zdCB2b2lkICpmZHQsIHVuc2lnbmVkIGxvbmcgKmZyZXEpOwo+Cj4gIGludCBm
ZHRfcGFyc2VfaXNhX2V4dGVuc2lvbnNfYWxsX2hhcnRzKGNvbnN0IHZvaWQgKmZkdCk7Cj4KPiAr
aW50IGZkdF9wYXJzZV93b3JsZHNfYWxsX2hhcnRzKGNvbnN0IHZvaWQgKmZkdCk7Cj4gKwo+ICBp
bnQgZmR0X3BhcnNlX2dhaXNsZXJfdWFydF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVv
ZmZzZXQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1f
dWFydF9kYXRhICp1YXJ0KTsKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxw
ZXIuYyBiL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCj4gaW5kZXggNzQ3YmEwMjguLjQ3MDE2
MDZkIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCj4gKysrIGIvbGli
L3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMKPiBAQCAtNDU3LDYgKzQ1Nyw5NiBAQCBpbnQgZmR0X3Bh
cnNlX2lzYV9leHRlbnNpb25zX2FsbF9oYXJ0cyhjb25zdCB2b2lkICpmZHQpCj4gICAgICAgICBy
ZXR1cm4gMDsKPiAgfQo+Cj4gK2ludCBmZHRfcGFyc2Vfd29ybGRzX2FsbF9oYXJ0cyhjb25zdCB2
b2lkICpmZHQpCj4gK3sKPiArICAgICAgIHUzMiBoYXJ0aWQ7Cj4gKyAgICAgICBjb25zdCBmZHQz
Ml90ICp2YWw7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2g7Cj4gKyAgICAg
ICBzdHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgKmhmZWF0dXJlczsKPiArICAgICAgIGludCBlcnIs
IGNwdV9vZmZzZXQsIGNwdXNfb2Zmc2V0LCBsZW47Cj4gKwo+ICsgICAgICAgaWYgKCFmZHQpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsKPiArICAgICAgIGNwdXNfb2Zm
c2V0ID0gZmR0X3BhdGhfb2Zmc2V0KGZkdCwgIi9jcHVzIik7Cj4gKyAgICAgICBpZiAoY3B1c19v
ZmZzZXQgPCAwKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gY3B1c19vZmZzZXQ7Cj4gKwo+ICsg
ICAgICAgZmR0X2Zvcl9lYWNoX3N1Ym5vZGUoY3B1X29mZnNldCwgZmR0LCBjcHVzX29mZnNldCkg
ewo+ICsgICAgICAgICAgICAgICBlcnIgPSBmZHRfcGFyc2VfaGFydF9pZChmZHQsIGNwdV9vZmZz
ZXQsICZoYXJ0aWQpOwo+ICsgICAgICAgICAgICAgICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKCFmZHRfbm9kZV9p
c19lbmFibGVkKGZkdCwgY3B1X29mZnNldCkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29u
dGludWU7Cj4gKwo+ICsgICAgICAgICAgICAgICBzY3JhdGNoID0gc2JpX2hhcnRpZF90b19zY3Jh
dGNoKGhhcnRpZCk7Cj4gKyAgICAgICAgICAgICAgIGlmICghc2NyYXRjaCkKPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT0VOVDsKPiArCj4gKyAgICAgICAgICAgICAgIGhm
ZWF0dXJlcyA9IHNiaV9oYXJ0X2ZlYXR1cmVzX3B0cihzY3JhdGNoKTsKPiArICAgICAgICAgICAg
ICAgaWYgKCFoZmVhdHVyZXMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9F
Tk9FTlQ7Cj4gKwo+ICsgICAgICAgICAgICAgICB2YWwgPSBmZHRfZ2V0cHJvcChmZHQsIGNwdV9v
ZmZzZXQsICJyaXNjdixwbXdpZCIsICZsZW4pOwo+ICsgICAgICAgICAgICAgICBpZiAodmFsICYm
IGxlbiA9PSBzaXplb2YoZmR0MzJfdCkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVh
dHVyZXMtPnBtd2lkID0gZmR0MzJfdG9fY3B1KCp2YWwpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGhmZWF0dXJlcy0+aGFzX3Btd2lkID0gdHJ1ZTsKPiArICAgICAgICAgICAgICAgfQo+ICsK
PiArICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBjcHVfb2Zmc2V0LCAicmlz
Y3YscG13aWRsaXN0IiwgJmxlbik7Cj4gKyAgICAgICAgICAgICAgIGlmICh2YWwgJiYgbGVuID09
IDIgKiBzaXplb2YoZmR0MzJfdCkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVhdHVy
ZXMtPnBtd2lkbGlzdCA9ICgodTY0KWZkdDMyX3RvX2NwdSh2YWxbMF0pIDw8IDMyKSB8Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmR0MzJfdG9fY3B1
KHZhbFsxXSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFoZmVhdHVyZXMtPnBtd2lk
bGlzdCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6
IGhhcnQldSByaXNjdixwbXdpZGxpc3QgaXMgZW1wdHlcbiIsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBoYXJ0aWQpOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICB2YWwg
PSBmZHRfZ2V0cHJvcChmZHQsIGNwdV9vZmZzZXQsICJyaXNjdixwbWx3aWRsaXN0IiwgJmxlbik7
Cj4gKyAgICAgICAgICAgICAgIGlmICh2YWwgJiYgbGVuID09IDIgKiBzaXplb2YoZmR0MzJfdCkp
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVhdHVyZXMtPnBtbHdpZGxpc3QgPSAoKHU2
NClmZHQzMl90b19jcHUodmFsWzBdKSA8PCAzMikgfAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmZHQzMl90b19jcHUodmFsWzFdKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBoZmVhdHVyZXMtPmhhc19wbWx3aWRsaXN0ID0gdHJ1ZTsKPiArICAg
ICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgLyogU2FuaXR5IGNoZWNrcyAqLwo+
ICsjaWYgX19yaXNjdl94bGVuID09IDMyCj4gKyAgICAgICAgICAgICAgIGlmIChoZmVhdHVyZXMt
PnBtd2lkbGlzdCAmJgo+ICsgICAgICAgICAgICAgICAgICAgKGhmZWF0dXJlcy0+cG13aWRsaXN0
ID4+IDMyKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0
JXUgcmlzY3YscG13aWRsaXN0IGhhcyBiaXRzIGJleW9uZCBYTEVOXG4iLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGhhcnRpZCk7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgIH0KPiArCj4g
KyAgICAgICAgICAgICAgIGlmIChoZmVhdHVyZXMtPmhhc19wbWx3aWRsaXN0ICYmCj4gKyAgICAg
ICAgICAgICAgICAgICAoaGZlYXR1cmVzLT5wbWx3aWRsaXN0ID4+IDMyKSkgewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0JXUgcmlzY3YscG1sd2lkbGlzdCBo
YXMgYml0cyBiZXlvbmQgWExFTlxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF9fZnVuY19fLCBoYXJ0aWQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBT
QklfRUlOVkFMOwo+ICsgICAgICAgICAgICAgICB9Cj4gKyNlbmRpZgo+ICsKPiArICAgICAgICAg
ICAgICAgaWYgKGhmZWF0dXJlcy0+aGFzX3Btd2lkICYmCj4gKyAgICAgICAgICAgICAgICAgICBo
ZmVhdHVyZXMtPnBtd2lkID49IF9fcmlzY3ZfeGxlbikgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0JXUgcmlzY3YscG13aWQgKCV1KSBleGNlZWRzIG1heCBX
SURcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaGFy
dGlkLCBoZmVhdHVyZXMtPnBtd2lkKTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
U0JJX0VJTlZBTDsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgaWYg
KGhmZWF0dXJlcy0+cG13aWRsaXN0ICYmIGhmZWF0dXJlcy0+aGFzX3Btd2lkICYmCj4gKyAgICAg
ICAgICAgICAgICAgICAhKGhmZWF0dXJlcy0+cG13aWRsaXN0ICYgQklUX1VMTChoZmVhdHVyZXMt
PnBtd2lkKSkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFy
dCV1IHJpc2N2LHBtd2lkICgldSkgbm90IGluIHBtd2lkbGlzdFxuIiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBoYXJ0aWQsIGhmZWF0dXJlcy0+cG13aWQp
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsgICAgICAg
ICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4g
IHN0YXRpYyBpbnQgZmR0X3BhcnNlX3VhcnRfbm9kZV9jb21tb24oY29uc3Qgdm9pZCAqZmR0LCBp
bnQgbm9kZW9mZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBwbGF0Zm9ybV91YXJ0X2RhdGEgKnVhcnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGRlZmF1bHRfZnJlcSwKPiBkaWZmIC0tZ2l0IGEv
cGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5j
Cj4gaW5kZXggMWRmMDI4MGQuLjUxZTlmMzQyIDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVy
aWMvcGxhdGZvcm0uYwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+IEBAIC0y
NTUsMTEgKzI1NSwyMiBAQCBpbnQgZ2VuZXJpY19maW5hbF9pbml0KGJvb2wgY29sZF9ib290KQo+
Cj4gIGludCBnZW5lcmljX2V4dGVuc2lvbnNfaW5pdChib29sIGNvbGRfYm9vdCkKPiAgewo+ICsg
ICAgICAgaW50IHJjOwo+ICsKPiAgICAgICAgIGlmICghY29sZF9ib290KQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gMDsKPgo+ICAgICAgICAgLyogUGFyc2UgdGhlIElTQSBzdHJpbmcgZnJvbSBG
RFQgYW5kIGVuYWJsZSB0aGUgbGlzdGVkIGV4dGVuc2lvbnMgKi8KPiAtICAgICAgIHJldHVybiBm
ZHRfcGFyc2VfaXNhX2V4dGVuc2lvbnNfYWxsX2hhcnRzKGZkdF9nZXRfYWRkcmVzcygpKTsKPiAr
ICAgICAgIHJjID0gZmR0X3BhcnNlX2lzYV9leHRlbnNpb25zX2FsbF9oYXJ0cyhmZHRfZ2V0X2Fk
ZHJlc3MoKSk7Cj4gKyAgICAgICBpZiAocmMpCj4gKyAgICAgICAgICAgICAgIHJldHVybiByYzsK
PiArCj4gKyAgICAgICAvKiBQYXJzZSBSSVNDLVYgV29ybGRzIENQVSBwcm9wZXJ0aWVzIGZyb20g
RkRUICovCj4gKyAgICAgICByYyA9IGZkdF9wYXJzZV93b3JsZHNfYWxsX2hhcnRzKGZkdF9nZXRf
YWRkcmVzcygpKTsKPiArICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJj
Owo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAgaW50IGdlbmVyaWNfZG9tYWluc19p
bml0KHZvaWQpCj4gLS0KPiAyLjQzLjcKPgoKUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBh
d2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCg==
