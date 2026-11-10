Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A6F606A31C
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QgdfT2xk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A9ABcQ3l;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AnVzbTP3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VcxuoJd7eoabVjFo5E6YsrWjArBrrgxJld263Kty+ls=; b=QgdfT2xkD7ba7JATdJnLKTYqYX
	tt6kdoSO+bGfLh964Aqxh+UgcuZeyks7cdg8f/x/Cg9GlN+AddyvNghiMASR7JNiWOsz2m9heNK7u
	SuIfa4Rr7gjSE7uve1L6LkwQLyPZqv4UgxflsWZXZ08QcgtGxUel+YOiUubLmj9Eah6QI+R77pgHd
	n4JbRtEotzK4L2SeeEtg+toZarpY1Yhg7D2ASAmBrMRMngeDEPrRP3Au2w3EATB2JqC5v9ApJ6XRr
	odyb12kB1qpEX8xQZoCYrjn3mS0uz+rS9/qmEZGssraHywdk+z4+7BmrmM9Q/vrZ1Mfpj7ZSeQl5/
	o2AfKu2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQquA-00000004psO-2B1z;
	Tue, 10 Nov 2026 18:49:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqu8-00000004prU-1wLi
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 18:49:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIbZ3I638220
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UCD8EcWct63ZeIhMdtboPrlykvZtXo3+Ut4KJCO5ASk=; b=A9ABcQ3lZpg3iKLy
	XFocxH1cSyU2xGgqdlqMXSqMFf6G8mrzT0TdJ/cCQTJz0u9gtxQZ0qjuy5lQsATe
	dr3XYWzRGqyPfOWht8ofvYT+QruuJaXIFdPtjXZxcWDKtGZE0C3qwKPgJYvz7pmC
	TJp6WNZo5pRl5WpX9N2QGgX7UT4rJQWvVqNQoVXf47w5NhIP2xykuSagJigHcVL0
	T0bRwN+EZL6TpoaPYsyZCA8h5zGWBtgJ843q0b+w3SNKOKHDxebbIoyYD5nGgyeP
	qAvS4IkRSge9WUKxsmpLE5Lf+LJssz7HO/3yhsQD31MrJtVtSzUaDJ4dccPmA4B3
	x58iIg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv980r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:49:11 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-70377b23231so1057333eaf.2
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 10:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336551; cv=none;
        d=google.com; s=arc-20260327;
        b=PLlzey7RYpHJYvqg+wfhpV+DPbf6YOR3B67hD1GpPTF8evBBtx6tydQRcdF73X9R5R
         kgE+FpBpzZ/VPee2zgSZLmQVEU63bw+x4IL8U0lqTtD78Ol0xZDCltft99YhKlvV5KRJ
         uDjOQudnf8Eddy7D6c7IrFv4rRb8ewUIgcN5/wVndfXGKoyIcfnPisVnmuuWhzVkwqd5
         Ie2ADXddpcPAztaH0QohJTeiMSlpVMoH4cWCWtspzZoC1BKirSC125By+1dlgpItAcJK
         X73H8kDSfSaVNKS5qM/yLaGLy6u8peLYCYCeWiEIRR42KHACxpnUpcnrjyKVFSS8O/2S
         L4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UCD8EcWct63ZeIhMdtboPrlykvZtXo3+Ut4KJCO5ASk=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=T8FaWbUP6gjaK2I/jFj/Xe8ePzQsuI/d4B4I8BsER+I1yQD4DUKKUn0jC7zYIn9EOO
         J0JrcOV42mwIcKomIc0XFeVh0PYISop6ufAlhfjrnNPAYK0PltVlYRkIVn8yt+CsBHp3
         xGpndWpuECAcdPfQCOOIVG86K1uinihZMrmCy/uYEWKLp4/wzkifkmBBz1m3piIt1nfo
         kUkERdN2nMqhiN8Hta9GApKsDoktN3+l+5RELcN+Q8p2npD4uVf270rLxiw4HqGzWrwb
         kBvc+pNC1g6m76jqsLkrlbXrXF/Ezi4rDo/peMpSvHnBTWv6+zRz2Y4843BOvY/N34vI
         gw8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794336551; x=1794941351; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UCD8EcWct63ZeIhMdtboPrlykvZtXo3+Ut4KJCO5ASk=;
        b=AnVzbTP3PqGse85TQj6rUrU7JJNuLGfBmDDx5rRZRQMABFWcQyKHov/Af+OMznU387
         i5ERkk+knLLqI8N5pMSGbtFrURxqH02nCie7e+aEvgC3/Ig82kZj9k0o6bX+nyob1Np2
         BGxKrSSTtk1H4/ovKux69AsFFmhjic1zRQXx9x3aKjHxgUOtc8O+kOD4pr40myX7tLhW
         bBj+CBb9VpImYRVBG0D0Vl01pkc1PFu6PjY//VCe9wm/z36tRRy4lveY7WhFxb7EkPg0
         gfvtIQ8W9J0yi674s4Tgy4cKznHHt0uoS7qd9jHxHLCRgI5TAP8wdHX/EWhP3XEj2agd
         WAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336551; x=1794941351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCD8EcWct63ZeIhMdtboPrlykvZtXo3+Ut4KJCO5ASk=;
        b=sQ9bCpuC/QFDQoM/RRYZueLKfvbnzPkp1TvVqnYSFFHSBfQJe4bxjzoRSSv90nZpAz
         Cg3pcNJcUrzucYbhY6mvmsS90WGA5li9GxHbk2rE91Xp0RkwbVgRktIbohBcrOV3Kc5D
         3t6WGKYggN8OxzUk5QmX0xx20Bow0FO2LmitfOweqQlOTQPbkmBcYGFa9A4oGwhOLf/2
         xBA7m40GXA9EuSJP5u5v109U9uj8Bawj/lM1CEuV2XSk5F8m9yK74XpQZpB+7QGZXdLX
         nv2fXEg9Sot4mDA+xjEwdReh2daCAbG34Tgh279HkMCSOo//ls+UtfRHcC1BDxOlYzEp
         FHuA==
X-Gm-Message-State: APuU4Z8OWfQY9yK0y1SwCnNfVV2sEA7HSNwdJi+pwuyGxsgEx/33K4sD
	sV6k1Hb+GoANwzh1TdiDdqVhhYsOaONVxnkOo9qoWo7SqnukIOuLuJZu77342cYPkOYcq+JpP2Y
	TVxyLoVegWgNq4zSiCaAFry5rcYziwIZs9Tob4r9t3V1i2+WrGqkk89ze7R1vUJGRO1TjeTY42E
	sSAoFpdppuqbCeOdvJ+Na8A3TjeIxrqZMyL0X0iUPK
X-Gm-Gg: AYBFou0gARZlS9ShgxJpbqMa1TZ9DIACvTcwE0jKMbDNuwW/kHnFPLqDZ1U9ucWWoJM
	tXwNUxpfQd20G/5NRazzUhGGbJq1sPTxx6w/8soP8thY3OseOn25Vi9oMjNpdzXKu1H7Dy5PP0Y
	2fOH4LGZAIXYNaV0wMJneB6WH3YZSd4iU2MF7ci1/FQz3Zaxocni1AlH1DqQ==
X-Received: by 2002:a05:6820:c2d4:20b0:70c:8247:fc90 with SMTP id 006d021491bc7-718a459d96cmr1148463eaf.32.1794336550505;
        Tue, 10 Nov 2026 10:49:10 -0800 (PST)
X-Received: by 2002:a05:6820:c2d4:20b0:70c:8247:fc90 with SMTP id
 006d021491bc7-718a459d96cmr1148452eaf.32.1794336549912; Tue, 10 Nov 2026
 10:49:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-4-peter.lin@sifive.com>
In-Reply-To: <20261110095029.117504-4-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 10:48:59 -0800
X-Gm-Features: AclHuK-_oa_dSh6zhR6_9lY7NXBmkYsWRYeS_MhYgu5XVW7KIh4DDIMmtMMvXeQ
Message-ID: <CAAVgOkJjX1v18_wuycYxG5=H-wcicFk2KgkZBavxYXQidU6CLA@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] lib: fdt_domain: parse domain WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af36727 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=PBDUiyN1TJFkXdW8PTgA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-ORIG-GUID: E6_INIHOpvrHfnNtrU3Uqo7lLAMVYmow
X-Proofpoint-GUID: E6_INIHOpvrHfnNtrU3Uqo7lLAMVYmow
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfXyiAHvOLGCuSl
 QSMst/NQ29oCNC3i+rZRmHMX+tfS2Zbhi4gx/n0SMCxL5SSBJRcFox9YXxfcq29BWtf5q1XkfRH
 5eFjloWYxR1g/19LTTudr7dBmxo2vM8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX58x+ZKEMFW+X
 DLZgV+mRlkhXxGUvVwtzRH4RSMPcg3Iu0LdS4LAAMGGwg0iO06F+d6gpdSLcwAfXxrnwbWCfDHF
 C2X9nWooAJxUACdEAXstIRCfqnWPeeIvYA2sCbgAdAe7sRJq3UBNuK1V6h/RdRu7tvkapO7TQxB
 VLL/JfjA5r5xFK0AC6TyljZaGZD4dkBH4G+U4QdyEG6EEDnzDzqWtslrHpBRDU6mFA5KsHH4mct
 5xdy18y1p3LfvVsIz8JC6quRH0IROqrglAxUy1NcS4iNFB9FSHX29yHFN+gHbU+CUHPW6wF1rvD
 qDEjbpkeaRtVJlNULHj+zLsF4MZjhXQxZgecYQ2hthmktqhLK20pWBw9QiABCPdwTjWI/L8oliz
 zqkoogLcZ2bs8oTRjehI8xtlx2ojiGUSD+hI29k94+ge6Dp6cyvyJlBTTDm7Yo0uWzumNtUE0G0
 55aQb/nuzUZxFoSsquw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_104912_624907_2D8DB9B6 
X-CRM114-Status: GOOD (  30.64  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHdpZCBhbmQgd2lkZGVsZWcgZmllbGRz
IHRvIHN0cnVjdCBzYmlfZG9tYWluIHRvIHN0b3JlIHRoZQo+IFJJU0MtViBXb3JsZHMgbWx3aWQg
YW5kIG13aWRkZWxlZyBDU1IgdmFsdWVzIGZvciBlYWNoIGRvbWFpbi4KPiBBbHNvLCBwYXJzZSB0
aGUgcm9vdCBhbmQgdXNlci1kZWZpbmVkIGRvbWFpbnMnIFdJRCBkdXJpbmcKPiBmZHRfZG9tYWlu
c19wb3B1bGF0ZSgpLgo+Cj4gVGhlIHJvb3QgZG9tYWluIFdJRCBpcyBkZXNjcmliZWQgaW4gdGhl
ICJyb290IiBzdWJub2RlLCB3aGljaAo+IGNhcnJpZXMgdGhlICJvcGVuc2JpLGRvbWFpbixpbnN0
YW5jZSIgY29tcGF0aWJsZSBzdHJpbmcuIFNraXAKPiB0aGlzIG5vZGUgaW4gZmR0X2l0ZXJhdGVf
ZWFjaF9kb21haW4oKSBzbyB0aGF0IGl0IGlzIG5vdAo+IHRyZWF0ZWQgYXMgYSByZWd1bGFyIGRv
bWFpbiBpbnN0YW5jZS4KPgo+IFdoZW4gU21sd2lkIGlzIGltcGxlbWVudGVkLCB0aGUgIndpZCIg
cHJvcGVydHkgaXMgbWFuZGF0b3J5Cj4gZm9yIGFsbCBkb21haW5zOyBmYWlsIGRvbWFpbiBwb3B1
bGF0aW9uIGlmIGl0IGlzIG1pc3NpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGllbiBQZXRl
ciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+IENoYW5nZXMgdjQtPnY1Ogo+IC0g
UmVqZWN0IHdpZCA+PSBYTEVOIGFuZCwgb24gUlYzMiwgd2lkZGVsZWcgd2lkZXIgdGhhbiBNWExF
Tiwgc28KPiAgIEJJVF9VTEwoZG9tLT53aWQpIGlzIHNhZmUgKFJhZGltKQo+IC0gRHJvcCBSQi10
YWcgZnJvbSBBbnVwCj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgIHwgICA2ICsr
Kwo+ICBsaWIvc2JpL3NiaV9kb21haW4uYyAgICAgICB8ICAgMiArCj4gIGxpYi91dGlscy9mZHQv
ZmR0X2RvbWFpbi5jIHwgMTAyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMTAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvc2JpL3NiaV9kb21haW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+IGluZGV4
IDU2YTIxMzk3Li41YTI5MWQxZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWlu
LmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBAQCAtMTksNiArMTksOCBAQAo+
Cj4gIHN0cnVjdCBzYmlfc2NyYXRjaDsKPgo+ICsjZGVmaW5lIElOVkFMSURfV0lEICAgICgodW5z
aWduZWQgaW50KX4wVSkKPiArCj4gIC8qKiBEb21haW4gYWNjZXNzIHR5cGVzICovCj4gIGVudW0g
c2JpX2RvbWFpbl9hY2Nlc3Mgewo+ICAgICAgICAgU0JJX0RPTUFJTl9SRUFEID0gKDFVTCA8PCAw
KSwKPiBAQCAtMjE4LDYgKzIyMCwxMCBAQCBzdHJ1Y3Qgc2JpX2RvbWFpbiB7Cj4gICAgICAgICBi
b29sIHN5c3RlbV9yZXNldF9hbGxvd2VkOwo+ICAgICAgICAgLyoqIElzIGRvbWFpbiBhbGxvd2Vk
IHRvIHN1c3BlbmQgdGhlIHN5c3RlbSAqLwo+ICAgICAgICAgYm9vbCBzeXN0ZW1fc3VzcGVuZF9h
bGxvd2VkOwo+ICsgICAgICAgLyoqIFdvcmxkIElEIGZvciB0aGlzIGRvbWFpbiAobWx3aWQgdmFs
dWUpICovCj4gKyAgICAgICB1MzIgd2lkOwo+ICsgICAgICAgLyoqIFdvcmxkIElEIGRlbGVnYXRp
b24gYml0bWFzayBmb3IgdGhpcyBkb21haW4gKG13aWRkZWxlZyB2YWx1ZSkgKi8KPiArICAgICAg
IHU2NCB3aWRkZWxlZzsKPiAgICAgICAgIC8qKiBJZGVudGlmaWVzIHdoZXRoZXIgdG8gaW5jbHVk
ZSB0aGUgZmlybXdhcmUgcmVnaW9uICovCj4gICAgICAgICBib29sIGZ3X3JlZ2lvbl9pbml0ZWQ7
Cj4gIH07Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlf
ZG9tYWluLmMKPiBpbmRleCA0MmZlNTYzMi4uYmU5MDIwZDAgMTAwNjQ0Cj4gLS0tIGEvbGliL3Ni
aS9zYmlfZG9tYWluLmMKPiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC0zMCw2ICsz
MCw4IEBAIHN0cnVjdCBzYmlfZG9tYWluIHJvb3QgPSB7Cj4gICAgICAgICAucG9zc2libGVfaGFy
dHMgPSBOVUxMLAo+ICAgICAgICAgLnN5c3RlbV9yZXNldF9hbGxvd2VkID0gdHJ1ZSwKPiAgICAg
ICAgIC5zeXN0ZW1fc3VzcGVuZF9hbGxvd2VkID0gdHJ1ZSwKPiArICAgICAgIC53aWQgPSBJTlZB
TElEX1dJRCwKPiArICAgICAgIC53aWRkZWxlZyA9IDAsCj4gICAgICAgICAuZndfcmVnaW9uX2lu
aXRlZCA9IGZhbHNlLAo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9mZHQvZmR0X2Rv
bWFpbi5jIGIvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMKPiBpbmRleCBlNGNjZThjMy4uMjk1
NTg3YjAgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMKPiArKysgYi9s
aWIvdXRpbHMvZmR0L2ZkdF9kb21haW4uYwo+IEBAIC0xMyw2ICsxMyw3IEBACj4gICNpbmNsdWRl
IDxzYmkvc2JpX2NvbnNvbGUuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4gICNp
bmNsdWRlIDxzYmkvc2JpX2Vycm9yLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2hhcnQuaD4KPiAg
I2luY2x1ZGUgPHNiaS9zYmlfaGFydG1hc2suaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfaGVhcC5o
Pgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9zY3JhdGNoLmg+Cj4gQEAgLTM3LDYgKzM4LDkgQEAgaW50
IGZkdF9pdGVyYXRlX2VhY2hfZG9tYWluKHZvaWQgKmZkdCwgdm9pZCAqb3BhcXVlLAo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsKPgo+ICAgICAgICAgZmR0X2Zvcl9lYWNoX3N1Ym5vZGUoZG9m
ZnNldCwgZmR0LCBwb2Zmc2V0KSB7Cj4gKyAgICAgICAgICAgICAgIGlmICghc3RyY21wKGZkdF9n
ZXRfbmFtZShmZHQsIGRvZmZzZXQsIE5VTEwpLCAicm9vdCIpKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+ICsKPiAgICAgICAgICAgICAgICAgaWYgKGZkdF9ub2RlX2NoZWNr
X2NvbXBhdGlibGUoZmR0LCBkb2Zmc2V0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAib3BlbnNiaSxkb21haW4saW5zdGFuY2UiKSkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsKPiBAQCAtMjkwLDYgKzI5NCw1NyBAQCBzdGF0aWMgaW50
IF9fZmR0X3BhcnNlX3JlZ2lvbihjb25zdCB2b2lkICpmZHQsIGludCBkb21haW5fb2Zmc2V0LAo+
ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBmZHRfcGFyc2VfZG9tYWlu
X3dpZF9wcm9wcyhjb25zdCB2b2lkICpmZHQsIGludCBvZmZzZXQsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNiaV9kb21haW4gKmRvbSkKPiArewo+ICsg
ICAgICAgY29uc3QgZmR0MzJfdCAqdmFsOwo+ICsgICAgICAgaW50IGxlbjsKPiArICAgICAgIHU2
NCB2YWw2NDsKPiArCj4gKyAgICAgICB2YWwgPSBmZHRfZ2V0cHJvcChmZHQsIG9mZnNldCwgIndp
ZCIsICZsZW4pOwo+ICsgICAgICAgaWYgKHZhbCAmJiBsZW4gPT0gc2l6ZW9mKGZkdDMyX3QpKQo+
ICsgICAgICAgICAgICAgICBkb20tPndpZCA9IGZkdDMyX3RvX2NwdSh2YWxbMF0pOwo+ICsKPiAr
ICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgb2Zmc2V0LCAid2lkZGVsZWciLCAmbGVuKTsK
PiArICAgICAgIGlmICh2YWwgJiYgKGxlbiA9PSAoMiAqIHNpemVvZihmZHQzMl90KSkpKSB7Cj4g
KyAgICAgICAgICAgICAgIHZhbDY0ID0gZmR0MzJfdG9fY3B1KHZhbFswXSk7Cj4gKyAgICAgICAg
ICAgICAgIHZhbDY0ID0gKHZhbDY0IDw8IDMyKSB8IGZkdDMyX3RvX2NwdSh2YWxbMV0pOwo+ICsg
ICAgICAgICAgICAgICBkb20tPndpZGRlbGVnID0gdmFsNjQ7Cj4gKyAgICAgICB9Cj4gK30KPiAr
Cj4gK3N0YXRpYyBpbnQgdmFsaWRhdGVfZG9tYWluX3dpZChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFp
biAqZG9tKQo+ICt7Cj4gKyAgICAgICAvKiBXb3JsZHMgc3VwcG9ydHMgYXQgbW9zdCBYTEVOIFdJ
RHMsIGFuZCBtd2lkZGVsZWcgaXMgTVhMRU4gYml0cyAqLwo+ICsgICAgICAgaWYgKGRvbS0+d2lk
ICE9IElOVkFMSURfV0lEICYmIGRvbS0+d2lkID49IF9fcmlzY3ZfeGxlbikgewo+ICsgICAgICAg
ICAgICAgICBzYmlfcHJpbnRmKCIlczogZG9tYWluIFwiJXNcIjogXCJ3aWRcIiAldSBleGNlZWRz
IG1heCBXSUQgJXVcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGRv
bS0+bmFtZSwgZG9tLT53aWQsIF9fcmlzY3ZfeGxlbiAtIDEpOwo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAgIH0KPiArCj4gKyNpZiBfX3Jpc2N2X3hsZW4gPT0g
MzIKPiArICAgICAgIGlmIChkb20tPndpZGRlbGVnID4+IDMyKSB7Cj4gKyAgICAgICAgICAgICAg
IHNiaV9wcmludGYoIiVzOiBkb21haW4gXCIlc1wiOiBcIndpZGRlbGVnXCIgMHglbGx4IGV4Y2Vl
ZHMgTVhMRU5cbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGRvbS0+
bmFtZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZyBsb25nKWRv
bS0+d2lkZGVsZWcpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAg
ICAgIH0KPiArI2VuZGlmCj4gKwo+ICsgICAgICAgaWYgKGRvbS0+d2lkICE9IElOVkFMSURfV0lE
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICBpZiAoc2JpX2hhcnRf
aGFzX2V4dGVuc2lvbihzYmlfc2NyYXRjaF90aGlzaGFydF9wdHIoKSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9TTUxXSUQpKSB7Cj4gKyAgICAgICAg
ICAgICAgIHNiaV9wcmludGYoIiVzOiBkb21haW4gXCIlc1wiOiBtaXNzaW5nIFwid2lkXCIiCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIiBwcm9wZXJ0eSAocmVxdWlyZWQgYnkgU21sd2lk
KVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgZG9tLT5uYW1lKTsK
PiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgX19mZHRfcGFyc2VfZG9tYWlu
KGNvbnN0IHZvaWQgKmZkdCwgaW50IGRvbWFpbl9vZmZzZXQsIHZvaWQgKm9wYXF1ZSkKPiAgewo+
ICAgICAgICAgdTMyIHZhbDMyOwo+IEBAIC0zMDYsNiArMzYxLDcgQEAgc3RhdGljIGludCBfX2Zk
dF9wYXJzZV9kb21haW4oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNldCwgdm9pZCAq
b3BhcXVlKQo+ICAgICAgICAgZG9tID0gc2JpX3phbGxvYyhzaXplb2YoKmRvbSkpOwo+ICAgICAg
ICAgaWYgKCFkb20pCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5PTUVNOwo+ICsgICAg
ICAgZG9tLT53aWQgPSBJTlZBTElEX1dJRDsKPgo+ICAgICAgICAgcHJlZy5kb20gPSBkb207Cj4g
ICAgICAgICBwcmVnLnJlZ2lvbl9jb3VudCA9IDA7Cj4gQEAgLTQ0OSw2ICs1MDUsMTIgQEAgc3Rh
dGljIGludCBfX2ZkdF9wYXJzZV9kb21haW4oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29m
ZnNldCwgdm9pZCAqb3BhcXVlKQo+ICAgICAgICAgfQo+ICAgICAgICAgZG9tLT5uZXh0X21vZGUg
PSB2YWwzMjsKPgo+ICsgICAgICAgLyogUmVhZCAid2lkIiBhbmQgIndpZGRlbGVnIiBEVCBwcm9w
ZXJ0aWVzICovCj4gKyAgICAgICBmZHRfcGFyc2VfZG9tYWluX3dpZF9wcm9wcyhmZHQsIGRvbWFp
bl9vZmZzZXQsIGRvbSk7Cj4gKyAgICAgICBlcnIgPSB2YWxpZGF0ZV9kb21haW5fd2lkKGRvbSk7
Cj4gKyAgICAgICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9hbGw7
Cj4gKwo+ICAgICAgICAgLyogUmVhZCAic3lzdGVtLXJlc2V0LWFsbG93ZWQiIERUIHByb3BlcnR5
ICovCj4gICAgICAgICBpZiAoZmR0X2dldF9wcm9wZXJ0eShmZHQsIGRvbWFpbl9vZmZzZXQsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAic3lzdGVtLXJlc2V0LWFsbG93ZWQiLCBOVUxM
KSkKPiBAQCAtNDc3LDEyICs1MzksNTIgQEAgZmFpbF9mcmVlX2RvbWFpbjoKPiAgICAgICAgIHJl
dHVybiBlcnI7Cj4gIH0KPgo+ICtzdGF0aWMgaW50IGZkdF9yb290X2RvbWFpbl9vZmZzZXQoY29u
c3Qgdm9pZCAqZmR0KQo+ICt7Cj4gKyAgICAgICBpbnQgb2Zmc2V0Owo+ICsKPiArICAgICAgIG9m
ZnNldCA9IGZkdF9wYXRoX29mZnNldChmZHQsICIvY2hvc2VuIik7Cj4gKyAgICAgICBpZiAob2Zm
c2V0IDwgMCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIG9mZnNldDsKPiArCj4gKyAgICAgICBv
ZmZzZXQgPSBmZHRfbm9kZV9vZmZzZXRfYnlfY29tcGF0aWJsZShmZHQsIG9mZnNldCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJvcGVuc2JpLGRvbWFp
bixjb25maWciKTsKPiArICAgICAgIGlmIChvZmZzZXQgPCAwKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gb2Zmc2V0Owo+ICsKPiArICAgICAgIHJldHVybiBmZHRfc3Vibm9kZV9vZmZzZXQoZmR0
LCBvZmZzZXQsICJyb290Iik7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgZmR0X3BhcnNlX3Jvb3Rf
ZG9tYWluKGNvbnN0IHZvaWQgKmZkdCkKPiArewo+ICsgICAgICAgaW50IG9mZnNldDsKPiArCj4g
KyAgICAgICBpZiAoZmR0KSB7Cj4gKyAgICAgICAgICAgICAgIG9mZnNldCA9IGZkdF9yb290X2Rv
bWFpbl9vZmZzZXQoZmR0KTsKPiArICAgICAgICAgICAgICAgaWYgKG9mZnNldCA+PSAwKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGZkdF9wYXJzZV9kb21haW5fd2lkX3Byb3BzKGZkdCwgb2Zm
c2V0LCAmcm9vdCk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEVu
c3VyZSByb290IGRvbWFpbiBoYXMgYSB2YWxpZCBXSUQKPiArICAgICAgICAqIGV2ZW4gaWYgRkRU
IG9yIHJvb3Qgc3Vibm9kZSBpcyBhYnNlbnQKPiArICAgICAgICAqLwo+ICsgICAgICAgcmV0dXJu
IHZhbGlkYXRlX2RvbWFpbl93aWQoJnJvb3QpOwo+ICt9Cj4gKwo+ICBpbnQgZmR0X2RvbWFpbnNf
cG9wdWxhdGUoY29uc3Qgdm9pZCAqZmR0KQo+ICB7Cj4gKyAgICAgICBpbnQgZXJyOwo+ICsKPiAg
ICAgICAgIC8qIFNhbml0eSBjaGVja3MgKi8KPiAgICAgICAgIGlmICghZmR0KQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPgo+ICsgICAgICAgLyogUGFyc2Ugcm9vdCBkb21h
aW4gY29uZmlnIGZyb20gInJvb3QiIHN1Ym5vZGUgKi8KPiArICAgICAgIGVyciA9IGZkdF9wYXJz
ZV9yb290X2RvbWFpbihmZHQpOwo+ICsgICAgICAgaWYgKGVycikKPiArICAgICAgICAgICAgICAg
cmV0dXJuIGVycjsKPiArCj4gICAgICAgICAvKiBJdGVyYXRlIG92ZXIgZWFjaCBkb21haW4gaW4g
RkRUIGFuZCBwb3B1bGF0ZSBkZXRhaWxzICovCj4gICAgICAgICByZXR1cm4gZmR0X2l0ZXJhdGVf
ZWFjaF9kb21haW5fcm8oZmR0LCBOVUxMLCBfX2ZkdF9wYXJzZV9kb21haW4pOwo+ICB9Cj4gLS0K
PiAyLjQzLjcKPgoKUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3Nz
LnF1YWxjb21tLmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCg==
