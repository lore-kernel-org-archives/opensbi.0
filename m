Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C63606A326
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5DjI7/Pb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AQgjIE5m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I1rvcwzx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pA5PZ3AJvKCeRszSnh/rjzSHjYD25eh44et5RNsESEw=; b=5DjI7/PbHbOuSx1VaXYJxi1BIt
	ZWDiTd7y3OA3L1TlO4zy3+BCN2rcmKEQWEPMF0uaXes5hlrUD61Ekxy5SdUS327MAsQH49kfMYvho
	Lob2SeYUR/MNmT2/PsoU9qnImcwTFh9VaLUCiWCe+DXDMYnGHWXBM88nxEAqXj1pj5Rs2q5BRw5kG
	D5+SUlfOTbrZtuPSZUQU/kW1fTaZCz3oQaWghGf9kj5SqVnL8qaQ+p5CxR/eQeGkzteI34bCbQ1UU
	FzymzybxgimbBKibCW7185l2WoheVQV7ZZAAvxvH0LuaZxHhgl3qX2ovWWBvf24DMOBUjW2AzIEze
	QKXPmD5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQquw-00000004qAn-2nLj;
	Tue, 10 Nov 2026 18:50:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqut-00000004q9E-4Ayg
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 18:50:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIbOLR019066
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cYQbTlTvbnd/uA9A5A/vhNS+eDAUnQsFo2Ehi+fyEg=; b=AQgjIE5m7ZUnuyya
	JuXcgXm6116UNze17OMBOlAIOrPHlV4pLxaYoCl+mz6jdSttcfkJl+JmkCO6/dZK
	KMJ+0Pt2ttjv1cBlIJK3tdBoMkv20KcHGufK09YzynyucX1LyWIb0E8cqvlbxpb/
	nanK98gmj6DkNjyQFI/5wCD7Szk+F2v1MStrisWPxh2tL3nirhUVC+ZbpPz6GYBw
	gr6ze2RGaQ2anRBOY9+j1bKHt0XheUpC5y2/hjGQB2Wah3NLDYuV2phi9Tny9/hq
	4UwWa7Gc/w27PlGNz/WyBQI5sDNQUpIjdJFGTDm1jvb1z8S8+QmMyNV22SxTNB+6
	bUYl1Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5dahph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:49:59 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-7026e2e80f0so2475313eaf.0
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 10:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336598; cv=none;
        d=google.com; s=arc-20260327;
        b=NujgOQpXScjgJIyGkwc59YBoy7krjc1dLWL0FzT6DCvYq2xu6iRhuZgeToIsuQQxHt
         9jRbLx6pepyylF9im+U2c6+1g6HKwdg9KSf73A5xkmMYNpvQzhrsOEl7lWyWjsmpA7ov
         /Q9FW4fauI2Y71+K03jDmXXy8v/aHLS44wdSLnX2DgIhO3qfyLJqlRecrUGq6S6HgMuj
         sQPNgNtqCbR+FL8wXJ5ucCY4Y8FrGb7oVkK2cm2jr3YFwyQ24BSYwuFbh4v494i6eWN+
         7LgWps4QLGwbxCIGmEgOOkjxmu9BO36ZynnZBd/TydfJKz/ZE3XuqDcUH42bAOMVML/u
         2XgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cYQbTlTvbnd/uA9A5A/vhNS+eDAUnQsFo2Ehi+fyEg=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=Kg673bZKPCVI4fVqZalHEmFLE1dc8xDbeSz+e7WhqQCK4C4yNj3xXoMWwoGcgikkfo
         qVGW6vMrvrYlLEWqyj0UlA4GF2uomNkFPnTSweEY8NtasXJ6d5XUGkZq3Yt4haIK0PR+
         nKf6uJM/WqRL39wRfZWDk/QnlZfGTWN2InkC30zkNUVKA5HT5HQW0h7hpVhTqeNnch2n
         f7+53EXcagleII+vRftjlUAEadailH/1kMHPKnf6Z67DaI0mZxVdghybB+ZUwkDbo3Qs
         3vqXrHod7qETG+VjBjjbEwlxtLfIzkKswE0wrOMQV1Tfe39pgXPqASU83URkPX5hakdE
         mFBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794336598; x=1794941398; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cYQbTlTvbnd/uA9A5A/vhNS+eDAUnQsFo2Ehi+fyEg=;
        b=I1rvcwzxMWlDgeVzsSrlXbbEvHZpV6qAS5mn+kgrU304/RRlpu4xTj3xMsQvFFxDFR
         nf8uhlYfuB5EA2L4LhqxtNDghZaqqSP81e2wjheD1ImicN4o9L2JdN2yT/qFDO8G/Mg1
         OTnnnT5RFNKxkQ79Ro4g9m0yr71ivIcgfh+TcQWXG1ETWttSuSQNwkGQd/uIAn7KNnV5
         ymoK4Q1O0/0y53R8alfKBywRH8DE68vdAM5lIG4ziA4GVI4mJ6yKZUNhDyhSSOzszkcL
         aM5hhu2oLvzvQ1BGUf3kHm76KHeKt+iNRkVC9rq1dF3mHvaXuJD+6GqlogLVAhol6Bwi
         d91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336598; x=1794941398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cYQbTlTvbnd/uA9A5A/vhNS+eDAUnQsFo2Ehi+fyEg=;
        b=ChjVX+ElBFFsTdkSebzGEXOkY5Ch6d+8TkAUtONw/guyaNFNgm58siWVAGkzn61FtW
         7xkgAamd4qAh8KTr8kp9iCNr8/t/+SS70BWXgJksIK03E8U5qGWsIm9UgzfeQmE93eR7
         POnVHUjZBeig/sg1gyGSb1wM9OXBrYvxRpz7hcid/QllXifqF8vhWAjvO7awSfQIK5LF
         z7E1DHi9E8yNjA1wDH/qeeTsyMY2jDYJ1XMmnshFW7SgQWLpegc2XZwYbxjro/X27STl
         pTc8m29JAmLqlt1qPVbMIWXYSi1qYbND9JiB/mBw8OAII2IdIUY8x/MgAg/BnDF6uxSL
         6WrQ==
X-Gm-Message-State: APuU4Z9dC3RBXCDnH3acvJiEIE8dAEOeUrFwgRW70dEJmQ0GjXMhDyYa
	epL/Icj/lqMS7afixn1JvUz07IbigCVT6HE4s23ExC5S7CA/YDvl/Cvy8AVqfZ9Nr1M13LaQJ6f
	ubwd0P8XX++W0LvufRWncuNdVaIt9JXUqvIV9ZQUAIFIm2pll0cA5Orbi0PhB/PQ1qXjeDA/wR4
	U2iTMx3nrL7QlWfDcWdFRaTK+2D0XBTMacPlqPBeVR
X-Gm-Gg: AYBFou3wTdQp6dGeMIGB//vUUjoH0eO6MizLIRllzF4GmRSPWI3QD7clg0ocSdI3fUm
	MiDOzaRC6qDYZxZS30NT7Et8+sqLNtpo4fXJkajoyAGEDzY6+23YwGskPbXD7amTwMj7UFZkiNS
	zc0ks352npZ5lFhm/SxEkDL2OjoRAg3/OsZidR6GAC4pfwiO5yajq7H4P+8w==
X-Received: by 2002:a05:6820:c3d5:b0:716:ddaa:40f2 with SMTP id 006d021491bc7-718a5386ebamr1149681eaf.46.1794336598483;
        Tue, 10 Nov 2026 10:49:58 -0800 (PST)
X-Received: by 2002:a05:6820:c3d5:b0:716:ddaa:40f2 with SMTP id
 006d021491bc7-718a5386ebamr1149664eaf.46.1794336597955; Tue, 10 Nov 2026
 10:49:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-7-peter.lin@sifive.com>
In-Reply-To: <20261110095029.117504-7-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 10:49:46 -0800
X-Gm-Features: AclHuK-vAB91MZ1EuWIt-a_kY4kXfnsag6AlEaeI1YaK8uEpRLOIJPpTlSSdUzQ
Message-ID: <CAAVgOkLzOFhWhhsf0T1zbduA1X5dEywHEU_mBWjw6ko=OqfiVw@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] lib: sbi_hart_worlds: Implement WID hart
 protection backend
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Proofpoint-GUID: xmY3XyDTddJ6BLOocwZnb_oDoNx82Jkr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX2i5di6QLfI16
 bsgfxNnshiv0G009s7DRXr4GVMLC2oFoKL2WRnLXsUmFdH6uN0/VuUxP2tw+9Uzr72UnQfvhY2u
 YoRvTnjCBMg6s1pMCpJsOowVS/v4RZc=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af36757 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=ef5nDf3U2oE6ytQcBtgA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: xmY3XyDTddJ6BLOocwZnb_oDoNx82Jkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX8K7rLlMxetAR
 LouDp/3zF0QvgPdEadEUDG1dAniXFn+L3aNXe78NAPdSk0XA8g4/wkJ6jW8Ma+w0aiAxJ1k9/E0
 ACoRyv1IcMjZ4znPyxrDlt9iq0CrOzsqmK9ALfpWe2EWnTDB1XBKEavxaPcmek5mEtXcDKbRi/T
 Ees7CG73vn8e+QU9TI4HaHnTgbYdU7DzvdLn+cba2GHTH768PDLeIBev0KhNKJSu119Q3DWsoeI
 oa3/HnXYHjY6sfsZkJMxWsX0dp41e7OEM6HAqFEacoQ7rF0ziBwFRfWllaVoku83dR2t+7CUwfu
 ykMTlfBzQSi8QBWkpufbUXbXXHDrEg2xBwA7zqES/y3XlPP1EsGJp5agLlnZ5hBgw6anupXbNqP
 /8tyuvC57jNBfmF3cHM1LhaSlKrHzZueO7xu2Oseke7HLAEc4bvc7D0WZXrQnTpJabM7069g0v+
 MESihvAAu1Q8j6l2YQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_105000_045162_4F712F62 
X-CRM114-Status: GOOD (  28.75  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMTo1MOKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSW50cm9kdWNlIGEgV0lELWJhc2VkIGhhcnQg
cHJvdGVjdGlvbiBiYWNrZW5kIHRoYXQgc3dpdGNoZXMgV29ybGQgSUQKPiBjb25maWd1cmF0aW9u
cyBhY3Jvc3MgZG9tYWlucy4KPgo+IEFjY2VzcyB0byBzbHdpZCBpcyBnYXRlZCBieSBtd2lkZGVs
ZWcgKFNzd2lkKSwgd2hpY2ggbWVhbnMgc2x3aWQgY2Fubm90Cj4gYmUgaGFuZGxlZCBieSBnZW5l
cmljIGhhcnRfY29udGV4dCBzYXZlL3Jlc3RvcmUuIEluc3RlYWQsIG1hbmFnZSBzbHdpZCBhcwo+
IGRvbWFpbiBzdGF0ZSB3aXRoIGV4cGxpY2l0IHNlcXVlbmNpbmc6Cj4KPiAtIGNvbmZpZ3VyZToK
PiAgIC0gVmFsaWRhdGUgYW5kIHByb2dyYW0gbWx3aWQgYW5kIG13aWRkZWxlZyBhY2NvcmRpbmcg
dG8gZG9tYWluIHBvbGljeQo+ICAgICBhbmQgcGxhdGZvcm0gY29uc3RyYWludHMgKHBtbHdpZGxp
c3QvbWx3aWRsaXN0KS4KPiAgIC0gUmVzdG9yZSBzbHdpZCBhZnRlciBtd2lkZGVsZWcgaXMgZW5h
YmxlZC4KPiAtIHVuY29uZmlndXJlOgo+ICAgLSBTYXZlIHNsd2lkIHByaW9yIHRvIGNsZWFyaW5n
IG13aWRkZWxlZy4KPiAgIC0gUmVzZXQgbXdpZGRlbGVnIHRvIDAgdG8gZGlzYWJsZSBTc3dpZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5j
b20+Cj4gLS0tCj4gQ2hhbmdlcyB2NC0+djU6Cj4gLSBNZXJnZSB3aWQgYW5kIHdpZGRlbGVnIHZh
bGlkYXRpb24gaW50byBoYXJ0X3dvcmxkc192YWxpZGF0ZSgpIGFuZAo+ICAgcnVuIGl0IGJlZm9y
ZSBDU1IgdXBkYXRlcywgc28gYSBmYWlsdXJlIGRvZXMgbm90IGxlYXZlIG1sd2lkCj4gICBob2xk
aW5nIGFuIGludmFsaWQgd29ybGQKPiAtIERyb3AgUkItdGFncyBmcm9tIE96YSBhbmQgQW51cAo+
IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydF93b3JsZHMuaCB8ICAyNCArKysrKwo+ICBsaWIv
c2JpL29iamVjdHMubWsgICAgICAgICAgICB8ICAgMSArCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAg
ICAgICAgICAgIHwgICA1ICsKPiAgbGliL3NiaS9zYmlfaGFydF93b3JsZHMuYyAgICAgfCAxNzQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDIw
NCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3NiaS9zYmlfaGFy
dF93b3JsZHMuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfaGFydF93b3JsZHMu
Ywo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0X3dvcmxkcy5oIGIvaW5jbHVk
ZS9zYmkvc2JpX2hhcnRfd29ybGRzLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwLi45MWIxMTAyMwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlf
aGFydF93b3JsZHMuaAo+IEBAIC0wLDAgKzEsMjQgQEAKPiArLyoKPiArICogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjYg
U2lGaXZlIEluYy4KPiArICovCj4gKwo+ICsjaWZuZGVmIF9fU0JJX0hBUlRfV09STERTX0hfXwo+
ICsjZGVmaW5lIF9fU0JJX0hBUlRfV09STERTX0hfXwo+ICsKPiArc3RydWN0IHNiaV9zY3JhdGNo
Owo+ICsKPiArLyoqCj4gKyAqIEluaXRpYWxpemUgV0lEIGhhcnQgcHJvdGVjdGlvbiBmb3IgY3Vy
cmVudCBIQVJUCj4gKyAqCj4gKyAqIFJlZ2lzdGVycyB0aGUgV0lEIHByb3RlY3Rpb24gbWVjaGFu
aXNtIGlmIFNtbHdpZAo+ICsgKiBleHRlbnNpb24gaXMgcHJlc2VudC4KPiArICoKPiArICogQHBh
cmFtIHNjcmF0Y2ggcG9pbnRlciB0byBzY3JhdGNoIHNwYWNlIG9mIGN1cnJlbnQgSEFSVAo+ICsg
Kgo+ICsgKiBAcmV0dXJuIDAgb24gc3VjY2VzcyBhbmQgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBm
YWlsdXJlCj4gKyAqLwo+ICtpbnQgc2JpX2hhcnRfd29ybGRzX2luaXQoc3RydWN0IHNiaV9zY3Jh
dGNoICpzY3JhdGNoKTsKPiArCj4gKyNlbmRpZiAvKiBfX1NCSV9IQVJUX1dPUkxEU19IX18gKi8K
PiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9vYmplY3RzLm1rIGIvbGliL3NiaS9vYmplY3RzLm1rCj4g
aW5kZXggYWUyN2QwYzUuLjM1NWFlNmU5IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvb2JqZWN0cy5t
awo+ICsrKyBiL2xpYi9zYmkvb2JqZWN0cy5tawo+IEBAIC03Nyw2ICs3Nyw3IEBAIGxpYnNiaS1v
YmpzLXkgKz0gc2JpX2Z3ZnQubwo+ICBsaWJzYmktb2Jqcy15ICs9IHNiaV9oYXJ0Lm8KPiAgbGli
c2JpLW9ianMteSArPSBzYmlfaGFydF9wbXAubwo+ICBsaWJzYmktb2Jqcy15ICs9IHNiaV9oYXJ0
X3Byb3RlY3Rpb24ubwo+ICtsaWJzYmktb2Jqcy15ICs9IHNiaV9oYXJ0X3dvcmxkcy5vCj4gIGxp
YnNiaS1vYmpzLXkgKz0gc2JpX2hlYXAubwo+ICBsaWJzYmktb2Jqcy15ICs9IHNiaV9tYXRoLm8K
PiAgbGlic2JpLW9ianMteSArPSBzYmlfaGZlbmNlLm8KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9z
YmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggYTcyMWJlZjQuLjZjNDNiZDk4
IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hh
cnQuYwo+IEBAIC0xNyw2ICsxNyw3IEBACj4gICNpbmNsdWRlIDxzYmkvc2JpX2Vycm9yLmg+Cj4g
ICNpbmNsdWRlIDxzYmkvc2JpX2hhcnQuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfaGFydF9wbXAu
aD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydF93b3JsZHMuaD4KPiAgI2luY2x1ZGUgPHNiaS9z
YmlfcGxhdGZvcm0uaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfcG11Lmg+Cj4gICNpbmNsdWRlIDxz
Ymkvc2JpX3N0cmluZy5oPgo+IEBAIC03NjksNiArNzcwLDEwIEBAIGludCBzYmlfaGFydF9pbml0
KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgYm9vbCBjb2xkX2Jvb3QpCj4gICAgICAgICAg
ICAgICAgIHJjID0gc2JpX2hhcnRfcG1wX2luaXQoc2NyYXRjaCk7Cj4gICAgICAgICAgICAgICAg
IGlmIChyYykKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAg
ICAgICAgICAgICByYyA9IHNiaV9oYXJ0X3dvcmxkc19pbml0KHNjcmF0Y2gpOwo+ICsgICAgICAg
ICAgICAgICBpZiAocmMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICAg
ICAgICAgfQo+Cj4gICAgICAgICByZXR1cm4gc2JpX2hhcnRfcmVpbml0KHNjcmF0Y2gpOwo+IGRp
ZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0X3dvcmxkcy5jIGIvbGliL3NiaS9zYmlfaGFydF93
b3JsZHMuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAuLmEwOWY5NmQw
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnRfd29ybGRzLmMKPiBAQCAt
MCwwICsxLDE3NCBAQAo+ICsvKgo+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTIt
Q2xhdXNlCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAyNiBTaUZpdmUgSW5jLgo+ICsgKi8K
PiArCj4gKyNpbmNsdWRlIDxzYmkvcmlzY3ZfZW5jb2RpbmcuaD4KPiArI2luY2x1ZGUgPHNiaS9z
YmlfYml0b3BzLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2NvbnNvbGUuaD4KPiArI2luY2x1ZGUg
PHNiaS9zYmlfZG9tYWluLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2Vycm9yLmg+Cj4gKyNpbmNs
dWRlIDxzYmkvc2JpX2hhcnQuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydF9wcm90ZWN0aW9u
Lmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2hhcnRfd29ybGRzLmg+Cj4gKyNpbmNsdWRlIDxzYmkv
c2JpX3NjcmF0Y2guaD4KPiArCj4gKy8qKgo+ICsgKiBJbml0aWFsaXplIHRoZSBwZXItaGFydCBz
bHdpZCB2YWx1ZXMgb2YgYSBkb21haW4gdXNpbmcKPiArICogdGhlIGxvd2VzdCBkZWxlZ2F0ZWQg
V0lEIGFzIHRoZSBpbml0aWFsIHZhbHVlLgo+ICsgKgo+ICsgKiBTLW1vZGUgT1Mgc2hvdWxkIGNo
b29zZSB0aGUgZGVzaXJlIHNsd2lkIGZvciBpdCdzCj4gKyAqIFUtbW9kZS4KPiArICovCj4gK3N0
YXRpYyBpbnQgc2JpX2hhcnRfd29ybGRzX3N0YXRlX3NldHVwKHN0cnVjdCBzYmlfZG9tYWluICpk
b20sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNiaV9k
b21haW5fc3RhdGUgKnN0YXRlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZvaWQgKnN0YXRlX3B0cikKPiArewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyB3aWRkZWxl
ZyA9IGRvbS0+d2lkZGVsZWc7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nICpzbHdpZCA9IHN0YXRl
X3B0cjsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgaW5pdF93aWQ7Cj4gKwo+ICsgICAgICAgaWYg
KCF3aWRkZWxlZykKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9PSzsKPiArCj4gKyAgICAg
ICBpbml0X3dpZCA9IHNiaV9mZnMod2lkZGVsZWcpOwo+ICsgICAgICAgc2JpX2Zvcl9lYWNoX2hh
cnRpbmRleChpKQo+ICsgICAgICAgICAgICAgICBzbHdpZFtpXSA9IGluaXRfd2lkOwo+ICsKPiAr
ICAgICAgIHJldHVybiBTQklfT0s7Cj4gK30KPiArCj4gK3N0YXRpYyBzdHJ1Y3Qgc2JpX2RvbWFp
bl9zdGF0ZSB3aWRfc3RhdGUgPSB7Cj4gKyAgICAgICAuc3RhdGVfc2V0dXAgPSBzYmlfaGFydF93
b3JsZHNfc3RhdGVfc2V0dXAsCj4gK307Cj4gKwo+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyAqc2Jp
X2hhcnRfd29ybGRzX3Nsd2lkX3B0cihzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKQo+ICt7Cj4gKyAg
ICAgICB1bnNpZ25lZCBsb25nICpzbHdpZDsKPiArCj4gKyAgICAgICBzbHdpZCA9IHNiaV9kb21h
aW5fc3RhdGVfcHRyKGRvbSwgJndpZF9zdGF0ZSk7Cj4gKyAgICAgICBpZiAoIXNsd2lkIHx8ICFz
YmlfaGFydGluZGV4X3ZhbGlkKGN1cnJlbnRfaGFydGluZGV4KCkpKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gTlVMTDsKPiArCj4gKyAgICAgICByZXR1cm4gJnNsd2lkW2N1cnJlbnRfaGFydGlu
ZGV4KCldOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGhhcnRfd29ybGRzX3ZhbGlkYXRlKHN0cnVj
dCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gK3sKPiArICAgICAgIHN0cnVjdCBzYmlfaGFydF9m
ZWF0dXJlcyAqaGYgPSBzYmlfaGFydF9mZWF0dXJlc19wdHIoc2NyYXRjaCk7Cj4gKyAgICAgICB1
bnNpZ25lZCBsb25nIGFsbG93ZWQgPSAtMVVMOwo+ICsKPiArICAgICAgIGlmIChoZi0+aGFzX3Bt
bHdpZGxpc3QpCj4gKyAgICAgICAgICAgICAgIGFsbG93ZWQgJj0gaGYtPnBtbHdpZGxpc3Q7Cj4g
KyAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRf
U01MV0lETElTVCkpCj4gKyAgICAgICAgICAgICAgIGFsbG93ZWQgJj0gY3NyX3JlYWQoQ1NSX01M
V0lETElTVCk7Cj4gKwo+ICsgICAgICAgaWYgKCEoYWxsb3dlZCAmIEJJVF9VTEwoZG9tLT53aWQp
KSkgewo+ICsgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogZG9tYWluJWQ6IFdJRCAldSB1
bmF1dGhvcml6ZWQgZm9yIG1sd2lkXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIF9f
ZnVuY19fLCBkb20tPmluZGV4LCBkb20tPndpZCk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBT
QklfRUlOVkFMOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBtd2lk
ZGVsZWcgaXMgYSBNLW1vZGUgV0FSTCByZWdpc3Rlciwgc28gYW4gUy1tb2RlIE9TIG11c3QgcmVs
eQo+ICsgICAgICAgICogb24gdGhlICJ3aWRkZWxlZyIgRFQgcHJvcGVydHkgdG8gZGV0ZXJtaW5l
IHdoaWNoIFdJRHMgaXQgbWF5Cj4gKyAgICAgICAgKiBkZWxlZ2F0ZSB0byBVLW1vZGUgdmlhIHNs
d2lkLiBJZiBwbWx3aWRsaXN0IG9yIG1sd2lkbGlzdCBzaWxlbnRseQo+ICsgICAgICAgICogZmls
dGVycyBvdXQgYW55IG9mIHRob3NlIFdJRHMsIHRoZSBTLW1vZGUgT1MncyB2aWV3IG9mIHRoZSBX
SURzCj4gKyAgICAgICAgKiBhdmFpbGFibGUgZm9yIGRlbGVnYXRpb24gd291bGQgYmUgaW5jb3Jy
ZWN0LiBUcmVhdCB0aGlzIG1pc21hdGNoCj4gKyAgICAgICAgKiBhcyBhIG1pc2NvbmZpZ3VyYXRp
b24uCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNj
cmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVdJRERFTEVHKSAmJgo+ICsgICAgICAgICAgIChkb20tPndp
ZGRlbGVnICYgfmFsbG93ZWQpKSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBk
b21haW4lZDogd2lkZGVsZWcgMHglbGx4IHVuYXV0aG9yaXplZCBmb3IiCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIiBtd2lkZGVsZWdcbiIsIF9fZnVuY19fLCBkb20tPmluZGV4LAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpZG9tLT53aWRkZWxl
Zyk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICsgICAgICAgfQo+ICsK
PiArICAgICAgIHJldHVybiBTQklfT0s7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgc2JpX2hhcnRf
d29ybGRzX2NvbmZpZ3VyZShzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gK3sK
PiArICAgICAgIHVuc2lnbmVkIGxvbmcgKnNsd2lkID0gTlVMTDsKPiArICAgICAgIGludCByYzsK
PiArCj4gKyAgICAgICBpZiAoIXNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hB
UlRfRVhUX1NNTFdJRCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfT0s7Cj4gKwo+ICsg
ICAgICAgcmMgPSBoYXJ0X3dvcmxkc192YWxpZGF0ZShzY3JhdGNoLCBkb20pOwo+ICsgICAgICAg
aWYgKHJjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgICAgY3NyX3dy
aXRlKENTUl9NTFdJRCwgZG9tLT53aWQpOwo+ICsKPiArICAgICAgIGlmICghc2JpX2hhcnRfaGFz
X2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01XSURERUxFRykpCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBTQklfT0s7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEVuYWJs
ZSBTc3dpZCBiZWZvcmUgcmVzdG9yaW5nIHNsd2lkLiBBIHplcm8gbXdpZGRlbGVnCj4gKyAgICAg
ICAgKiBkaXNhYmxlcyBhY2Nlc3MgdG8gc2x3aWQsIHNvIHRoZSBvcmRlciBoZXJlIGlzIHJlcXVp
cmVkLgo+ICsgICAgICAgICovCj4gKyAgICAgICBjc3Jfd3JpdGUoQ1NSX01XSURERUxFRywgZG9t
LT53aWRkZWxlZyk7Cj4gKwo+ICsgICAgICAgaWYgKGRvbS0+d2lkZGVsZWcpIHsKPiArICAgICAg
ICAgICAgICAgc2x3aWQgPSBzYmlfaGFydF93b3JsZHNfc2x3aWRfcHRyKGRvbSk7Cj4gKyAgICAg
ICAgICAgICAgIGlmICghc2x3aWQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNC
SV9FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU0xXSUQsICpzbHdpZCk7
Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIFNCSV9PSzsKPiArfQo+ICsKPiArc3Rh
dGljIHZvaWQgc2JpX2hhcnRfd29ybGRzX3VuY29uZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAq
c2NyYXRjaCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHNiaV9kb21haW4gKmRvbSkKPiArewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyAqc2x3aWQ7Cj4g
Kwo+ICsgICAgICAgaWYgKCFzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJU
X0VYVF9TTVdJRERFTEVHKSB8fAo+ICsgICAgICAgICAgICFkb20tPndpZGRlbGVnKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFNhdmUgc2x3
aWQgdmFsdWUgYmVmb3JlIGRpc2FibGluZyBTc3dpZCBzaW5jZSB0aGUKPiArICAgICAgICAqIENT
UiB2YWx1ZSBtYXkgbm90IHJldGFpbiB0aHJvdWdoIHRoZSBkaXNhYmxlZCBwZXJpb2QuCj4gKyAg
ICAgICAgKi8KPiArICAgICAgIHNsd2lkID0gc2JpX2hhcnRfd29ybGRzX3Nsd2lkX3B0cihkb20p
Owo+ICsgICAgICAgaWYgKCFzbHdpZCkgewo+ICsgICAgICAgICAgICAgICBzYmlfcGFuaWMoIiVz
OiBkb21haW4lZCBoYXMgbm8gc2x3aWQgc3RhdGVcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICBfX2Z1bmNfXywgZG9tLT5pbmRleCk7Cj4gKyAgICAgICB9Cj4gKyAgICAgICAqc2x3aWQg
PSBjc3JfcmVhZChDU1JfU0xXSUQpOwo+ICsKPiArICAgICAgIC8qIERpc2FibGUgU3N3aWQgKi8K
PiArICAgICAgIGNzcl93cml0ZShDU1JfTVdJRERFTEVHLCAwKTsKPiArfQo+ICsKPiArc3RhdGlj
IHN0cnVjdCBzYmlfaGFydF9wcm90ZWN0aW9uIHdpZF9wcm90ZWN0aW9uID0gewo+ICsgICAgICAg
Lm5hbWUgICAgICAgICAgID0gIndpZCIsCj4gKyAgICAgICAucmF0aW5nICAgICAgICAgPSAxMDAs
Cj4gKyAgICAgICAudHlwZSAgICAgICAgICAgPSBTQklfSEFSVF9QUk9URUNUSU9OX1RZUEVfSUQs
Cj4gKyAgICAgICAuY29uZmlndXJlICAgICAgPSBzYmlfaGFydF93b3JsZHNfY29uZmlndXJlLAo+
ICsgICAgICAgLnVuY29uZmlndXJlICAgID0gc2JpX2hhcnRfd29ybGRzX3VuY29uZmlndXJlCj4g
K307Cj4gKwo+ICtpbnQgc2JpX2hhcnRfd29ybGRzX2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpz
Y3JhdGNoKQo+ICt7Cj4gKyAgICAgICBpbnQgcmM7Cj4gKwo+ICsgICAgICAgaWYgKCFzYmlfaGFy
dF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTUxXSUQpKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lv
bihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01XSURERUxFRykpIHsKPiArICAgICAgICAgICAgICAg
d2lkX3N0YXRlLnN0YXRlX3NpemUgPSBzaXplb2YodW5zaWduZWQgbG9uZykgKiBzYmlfaGFydF9j
b3VudCgpOwo+ICsgICAgICAgICAgICAgICByYyA9IHNiaV9kb21haW5fcmVnaXN0ZXJfc3RhdGUo
JndpZF9zdGF0ZSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChyYykKPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmM7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIHNiaV9o
YXJ0X3Byb3RlY3Rpb25fcmVnaXN0ZXIoJndpZF9wcm90ZWN0aW9uKTsKPiArfQo+IC0tCj4gMi40
My43Cj4KClJldmlld2VkLWJ5OiBQYXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFs
Y29tbS5jb20+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
