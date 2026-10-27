Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD4606A31A
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 18:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w1mTOHGY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YUIwzecy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dvf72nVT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IoTBWpGCxaDrsczQY37wef0F6bXiqCAXCaXH+aqoXKk=; b=w1mTOHGYTPmD/2u3GmyA8qMiEj
	QW+ZHXHXUX6GR3Wa3rpM4j5YMXsr2XV4e2vl5utC8CN6azcewyNK5F3L+zC3hYgPv46rC8ctDG4GA
	6jOj386J9EA5l+BFzApBQWFUaqvpM4mtk3mW4T9rV7qNUaSP2ieaj20EXiltVnUSRkaFD0VUIhlja
	445vUCXlRujlZr5CBrN7YHETtH5itqSGf6DDzzL9PlklfxJfLA8GbPqm+LDpC/XOXOEu+iYxMsFpY
	b0yknNGRYC1x5RihFZJUrve4ehcgkEkN5GneC/hNq424BriGsNs6Y3EK8OW8YaIUixnrdfyD1jEwk
	8GnddtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlp9-00000005Y50-35Ua;
	Tue, 27 Oct 2026 18:23:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlp7-00000005Y4E-2Vqk
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 18:23:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHOBJ2945703
	for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 18:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63g4sQtnDDQ4L7denu/lGO5nBvYqIUPjWtzJ4/WfoL8=; b=YUIwzecyEWfsqj2k
	h+q95PpridYNeaFGVmBwNyUZIHAGlaqtc/d+Rk01IsIU3mGTDPlVwBiqft8dY1KD
	Oji7FXT7g8Zt5hwQJo1uu+6lhmgVrXGeHMm4/CG5JDnqMdbjItLVGmSEnyaY+ofI
	H5xIIcCMiL7ilo5W8ifNCBR9wlXGCBsmkkV79xEIUtiXPUR47nO8u8MS2VRw9D0c
	j+69Ae4rZaqcdiWQ1HyGp7BpAjXHtAb70h+lCyLsQNVOgiXH9qJoDTVSj2DxrbI3
	OfcpgOzmYGevOrtF2VnHKluQb5iXc7e1kNSYyifiM/+wq87o9BWRrBc1mcxs4pe/
	XqZmew==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6aeh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 18:23:00 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46f178d813bso234801fac.3
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 11:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793125376; cv=none;
        d=google.com; s=arc-20260327;
        b=mi5OzsnZN7+AO4mebEZ38dQCwcQyqAP6jHR6BzjsRhQWhrnDRZh5w5maLYRz18PBuG
         UOvfbw76/MhAphJ55DzMyOhKsODzOrVfqDRtrstWBN02+0+O+Dlu/GWhnwSD9mRmwZq7
         OVb5QYK7pFr/LdyeEMYfsaCsDQ5ImWnF/jlh0hF38n0Ubp66tYppwcy4Q/b8KnifSxoY
         xN2tq5jtjb+yUAytA3IPRTW3TY2uz8JHwZ39FkKW4Pb2h+46KTr1tVidD3L4LA3g8TB8
         zKQ3hMsrie9YQf70kmGZ2XC2KeACEz8ByOPk/yaiC2xzekxeq7WUxMuamSugpbyh5H+i
         YaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=63g4sQtnDDQ4L7denu/lGO5nBvYqIUPjWtzJ4/WfoL8=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=XcVTrNG5+1MTJxjv2oh5NorbTewPsSaA0gFCVuV7zW6GQHHOiDNXMFfbI2j4ezSvfc
         M4rgPOC/QHi5sqwuluQY5YpKCwIdpflTN3X+hCyAq2A7+dbf9brrUGfwJ1e86xGQ14LR
         OwWthrsSywkz6mPluB9wKI3anV2zOeBISw8agFJQGKtHsWc9sIuK6TZjva0CqJ/pQaL1
         0NWHPogj1KkFQFWRV9K+vLMuldnUxlA8Aw9qYmU3bbEn5Z4WOrboW5bK9vilUVZPUXZZ
         rvj1vqLDzdCzEYDQhRwr8Mynl8SO5LuyMGCS7RwZrVJ+3HN1vHBZzrXDoLSNLIqLQKdN
         8/IA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125376; x=1793730176; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63g4sQtnDDQ4L7denu/lGO5nBvYqIUPjWtzJ4/WfoL8=;
        b=dvf72nVTQ/745rhnt8Vv7aeYKjD+Cy5NRQ0+PDelnDUWwXSYgK3/DYJNASH8PVJanw
         enpZ8V7GiRcdWWASV0BtOurszaRWL59Cu3dov/aLyUgaZTpLJP8G/MEKRD0R+hJHRy9z
         U++FMTYsAF3hA2qDarrfjIFAdpK/10xaf/C1LRAMyGCv8DoWTrZOYQvF6UpFo+Q17xzy
         tSEiiRqlxvJRtKkIl2y73zGp/FHuC+i0L60G35n9B/+H80d0nExEr2dgTGl32dZO+1m2
         XwHjyEAKLbh8rGxKeR5U5ryZ4laDl3+olvHfrnuXAFwRmj8lyiTAyUa2xLYjb0H9v9UE
         U7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125376; x=1793730176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63g4sQtnDDQ4L7denu/lGO5nBvYqIUPjWtzJ4/WfoL8=;
        b=T7+MzQiHwdgPQLPeqmgE53Hm/Ht6DOy/pbBt0HsGaz/pCO5ZK0sNvC+B8dejBhPWS+
         Au4bcmdIt6Q+FKwuq2vb+BAH0puw0zF7nAfTS9dbTMRiOFbomdivFbBDhu/4IPjDglra
         hUbgGBA42uQvStKqztQrDpqClAlhpEIXjFXb7+Hvuy9gMKkaNGSvr3nMymAJ51GB64Ke
         /zmgtQ8cdDZPKcFIssg3wjl4ItSdeGzLcoACj5rbZKSZZNmxnj0mkZqwuImKsnUmZO9S
         NwrW1v/bD0v7rbJnpL3Gl9qofk/JUk9RIXW7Y5bY2GpbWVZqnX4GW2P8DqYC0LKVM21K
         jrpQ==
X-Gm-Message-State: AFq9FYKbIcOcRpXGX/ycsHUs9XQhMzSTYJskyb08lxIWgKf3EsQ1oUUV
	HAk3YVcyKwiHWAX+TwjRItR5icMbvu6Th3VHsF0rZ10LPtGS1SKS+E/tCiTV7Tr6DLPrxpfBNmp
	8q1hTouHLasQbLPm+GajjhELAZUpeyjXuQxN+bojYeyZxiIqzWcj5919b9JVdnu9uPIAuF+s4Of
	ZdI/X0DKsVlPdLJaRpCtZJlmZdhYWj3rH9tFxn8RIO
X-Gm-Gg: AYBFou38LcK38SWCdYAyfWePn05osE74ZPPnYsBJvviCzb63G8pSFAc49tdONxazJ4l
	mPbNhZrlJJeFKZo8wFNRGPylnfMyRy8JU5N+GSYSX1a6qnK3S18QLqMbbciwcJpYahnm76nxtkp
	HD+6Ll0QSwlMXYzQ59bYSx8hvMkREZcs/Tz3YypRYYiG9X0kb+DUINOvopfQ==
X-Received: by 2002:a05:6870:b52b:b0:49e:241:5fee with SMTP id 586e51a60fabf-4a8bb613e2fmr314048fac.22.1793125376441;
        Tue, 27 Oct 2026 11:22:56 -0700 (PDT)
X-Received: by 2002:a05:6870:b52b:b0:49e:241:5fee with SMTP id
 586e51a60fabf-4a8bb613e2fmr314028fac.22.1793125376006; Tue, 27 Oct 2026
 11:22:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-4-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-4-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:22:45 -0700
X-Gm-Features: AclHuK9gEY3pz8usVxl4Z3xjLD52j5p2t9PXQlsV8jpa70SGBt5aiGsIpfQNZiY
Message-ID: <CAAVgOkK1CbgTCn4fXP0PCd4CeKidzKu5_mDYsGEcvv5YqyUFjA@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] lib: fdt_domain: parse domain WID properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0ec04 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=g8PG-avZckd0Bp-CdtQA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: s6uvyzN9CHhh86rbaXtQyCd6iAKsX_0f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfXxneST29OjVJJ
 +/ekRr99HaBLkKHX+BUHUO0S5Z8uy8NkV8wyvjv743eo9zh1JjsLqaBUFeGoveoyHll2jGK0hOA
 pwl4bdDAaGSKWk0zA4u3akYDyUPnb6Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX/AA0adQcqHQr
 HWuebbzUERuzB4bKXJ0ZAUhvvLV/n6UsJ1/2pQE5SW178DEYQ0k51o05UaCBYdDew1Lo66QS8C2
 J/E7V1LFWDDfiLoKI34duGp9jwl5TJpI59A1kpsuR9EnGFedXcmk4eMfHFfv+dcD8lsSux2tAK7
 AjLqX2mFm9GOhx+aFyGILGa9afkpJZWTQUeNcTxooJPR2M1k9bLlI4UOxlEUsSkxlwzicpd46NY
 ZoYbwV4VBx+CKAiVTeRGI8sYUTxDFdKtizxoG9v9fqb5V/cOYai+RQCcGBcM7/grPpwNO5SaDVU
 tg1daAjOuFiI5zH7/buyl5uXN/w7caUvwu0dheVLpFNNB27mWLhaYWDBGV8NiGW9fRK+dsDxpH7
 LpnWEifejWq6U8wxcEbYunfnCsq2satNbbHhLvPf6uRWBul2KWjJIc4lABoET9LgN38w7wtPoM2
 +yQyU9Hq2kv9C0hNzpw==
X-Proofpoint-ORIG-GUID: s6uvyzN9CHhh86rbaXtQyCd6iAKsX_0f
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
X-CRM114-CacheID: sfid-20261027_112301_754392_BD3B4046 
X-CRM114-Status: GOOD (  28.01  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIHdpZCBhbmQgd2lkZGVsZWcgZmllbGRz
IHRvIHN0cnVjdCBzYmlfZG9tYWluIHRvIHN0b3JlIHRoZQo+IFJJU0MtViBXb3JsZHMgbWx3aWQg
YW5kIG13aWRlbGVnIENTUiB2YWx1ZXMgZm9yIGVhY2ggZG9tYWluLgo+IEFsc28sIHBhcnNlIHRo
ZSByb290IGFuZCB1c2VyLWRlZmluZWQgZG9tYWlucycgV0lEIGR1cmluZwo+IGZkdF9kb21haW5z
X3BvcHVsYXRlKCkuCj4KPiBXaGVuIFNtbHdpZCBpcyBpbXBsZW1lbnRlZCwgdGhlICJ3aWQiIHBy
b3BlcnR5IGlzIG1hbmRhdG9yeQo+IGZvciBhbGwgZG9tYWluczsgZmFpbCBkb21haW4gcG9wdWxh
dGlvbiBpZiBpdCBpcyBtaXNzaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4KPiAtLS0KPiBDaGFuZ2UgdjItPnYzOgo+IC0gQWRk
IHZhbGlkYXRlX2RvbWFpbl93aWQoKSB0byBjaGVjayBpZiAnd2lkJyBpcyBzcGVjaWZpZWQgd2hl
biBTbWx3aWQKPiAgIGV4dGVuc2lvbiBpcyBwcmVzZW50OyByZXR1cm4gU0JJX0VJTlZBTCBpZiBt
aXNzaW5nLgo+IC0gUGFyc2UgJ3dpZCcgYW5kICd3aWRkZWxlZycgZm9yIHRoZSByb290IGRvbWFp
biB2aWEgZmR0X3BhcnNlX3Jvb3RfZG9tYWluKCkuCj4gLSBTZXQgcm9vdC53aWRkZWxlZyBkZWZh
dWx0IHRvIDAuCj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCAgIHwgIDYgKysrCj4g
IGxpYi9zYmkvc2JpX2RvbWFpbi5jICAgICAgIHwgIDIgKwo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9k
b21haW4uYyB8IDg0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
c2JpL3NiaV9kb21haW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+IGluZGV4IDU2YTIx
Mzk3Li41YTI5MWQxZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiAr
KysgYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPiBAQCAtMTksNiArMTksOCBAQAo+Cj4gIHN0
cnVjdCBzYmlfc2NyYXRjaDsKPgo+ICsjZGVmaW5lIElOVkFMSURfV0lEICAgICgodW5zaWduZWQg
aW50KX4wVSkKPiArCj4gIC8qKiBEb21haW4gYWNjZXNzIHR5cGVzICovCj4gIGVudW0gc2JpX2Rv
bWFpbl9hY2Nlc3Mgewo+ICAgICAgICAgU0JJX0RPTUFJTl9SRUFEID0gKDFVTCA8PCAwKSwKPiBA
QCAtMjE4LDYgKzIyMCwxMCBAQCBzdHJ1Y3Qgc2JpX2RvbWFpbiB7Cj4gICAgICAgICBib29sIHN5
c3RlbV9yZXNldF9hbGxvd2VkOwo+ICAgICAgICAgLyoqIElzIGRvbWFpbiBhbGxvd2VkIHRvIHN1
c3BlbmQgdGhlIHN5c3RlbSAqLwo+ICAgICAgICAgYm9vbCBzeXN0ZW1fc3VzcGVuZF9hbGxvd2Vk
Owo+ICsgICAgICAgLyoqIFdvcmxkIElEIGZvciB0aGlzIGRvbWFpbiAobWx3aWQgdmFsdWUpICov
Cj4gKyAgICAgICB1MzIgd2lkOwo+ICsgICAgICAgLyoqIFdvcmxkIElEIGRlbGVnYXRpb24gYml0
bWFzayBmb3IgdGhpcyBkb21haW4gKG13aWRkZWxlZyB2YWx1ZSkgKi8KPiArICAgICAgIHU2NCB3
aWRkZWxlZzsKPiAgICAgICAgIC8qKiBJZGVudGlmaWVzIHdoZXRoZXIgdG8gaW5jbHVkZSB0aGUg
ZmlybXdhcmUgcmVnaW9uICovCj4gICAgICAgICBib29sIGZ3X3JlZ2lvbl9pbml0ZWQ7Cj4gIH07
Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9tYWlu
LmMKPiBpbmRleCA0MmZlNTYzMi4uYmU5MDIwZDAgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlf
ZG9tYWluLmMKPiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC0zMCw2ICszMCw4IEBA
IHN0cnVjdCBzYmlfZG9tYWluIHJvb3QgPSB7Cj4gICAgICAgICAucG9zc2libGVfaGFydHMgPSBO
VUxMLAo+ICAgICAgICAgLnN5c3RlbV9yZXNldF9hbGxvd2VkID0gdHJ1ZSwKPiAgICAgICAgIC5z
eXN0ZW1fc3VzcGVuZF9hbGxvd2VkID0gdHJ1ZSwKPiArICAgICAgIC53aWQgPSBJTlZBTElEX1dJ
RCwKPiArICAgICAgIC53aWRkZWxlZyA9IDAsCj4gICAgICAgICAuZndfcmVnaW9uX2luaXRlZCA9
IGZhbHNlLAo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9mZHQvZmR0X2RvbWFpbi5j
IGIvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMKPiBpbmRleCBlNGNjZThjMy4uOGNlMDMyMzYg
MTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2ZkdC9mZHRfZG9tYWluLmMKPiArKysgYi9saWIvdXRp
bHMvZmR0L2ZkdF9kb21haW4uYwo+IEBAIC0xMyw2ICsxMyw3IEBACj4gICNpbmNsdWRlIDxzYmkv
c2JpX2NvbnNvbGUuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4gICNpbmNsdWRl
IDxzYmkvc2JpX2Vycm9yLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2hhcnQuaD4KPiAgI2luY2x1
ZGUgPHNiaS9zYmlfaGFydG1hc2suaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfaGVhcC5oPgo+ICAj
aW5jbHVkZSA8c2JpL3NiaV9zY3JhdGNoLmg+Cj4gQEAgLTI5MCw2ICsyOTEsNDIgQEAgc3RhdGlj
IGludCBfX2ZkdF9wYXJzZV9yZWdpb24oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNl
dCwKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIHZvaWQgZmR0X3BhcnNlX2Rv
bWFpbl93aWRfcHJvcHMoY29uc3Qgdm9pZCAqZmR0LCBpbnQgb2Zmc2V0LAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gK3sK
PiArICAgICAgIGNvbnN0IGZkdDMyX3QgKnZhbDsKPiArICAgICAgIGludCBsZW47Cj4gKyAgICAg
ICB1NjQgdmFsNjQ7Cj4gKwo+ICsgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBvZmZzZXQs
ICJ3aWQiLCAmbGVuKTsKPiArICAgICAgIGlmICh2YWwgJiYgbGVuID09IHNpemVvZihmZHQzMl90
KSkgewo+ICsgICAgICAgICAgICAgICBkb20tPndpZCA9IGZkdDMyX3RvX2NwdSh2YWxbMF0pOwo+
ICsgICAgICAgfQo+ICsKPiArICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgb2Zmc2V0LCAi
d2lkZGVsZWciLCAmbGVuKTsKPiArICAgICAgIGlmICh2YWwgJiYgKGxlbiA9PSAoMiAqIHNpemVv
ZihmZHQzMl90KSkpKSB7Cj4gKyAgICAgICAgICAgICAgIHZhbDY0ID0gZmR0MzJfdG9fY3B1KHZh
bFswXSk7Cj4gKyAgICAgICAgICAgICAgIHZhbDY0ID0gKHZhbDY0IDw8IDMyKSB8IGZkdDMyX3Rv
X2NwdSh2YWxbMV0pOwo+ICsgICAgICAgICAgICAgICBkb20tPndpZGRlbGVnID0gdmFsNjQ7Cj4g
KyAgICAgICB9Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgdmFsaWRhdGVfZG9tYWluX3dpZChjb25z
dCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKQo+ICt7Cj4gKyAgICAgICBpZiAoZG9tLT53aWQgIT0g
SU5WQUxJRF9XSUQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKPiArICAgICAgIGlm
IChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0hBUlRfRVhUX1NNTFdJRCkpIHsK
PiArICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGRvbWFpbiBcIiVzXCI6IG1pc3Npbmcg
XCJ3aWRcIiIKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAiIHByb3BlcnR5IChyZXF1aXJl
ZCBieSBTbWx3aWQpXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCBk
b20tPm5hbWUpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAg
IH0KPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIGludCBfX2ZkdF9w
YXJzZV9kb21haW4oY29uc3Qgdm9pZCAqZmR0LCBpbnQgZG9tYWluX29mZnNldCwgdm9pZCAqb3Bh
cXVlKQo+ICB7Cj4gICAgICAgICB1MzIgdmFsMzI7Cj4gQEAgLTMwNiw2ICszNDMsNyBAQCBzdGF0
aWMgaW50IF9fZmR0X3BhcnNlX2RvbWFpbihjb25zdCB2b2lkICpmZHQsIGludCBkb21haW5fb2Zm
c2V0LCB2b2lkICpvcGFxdWUpCj4gICAgICAgICBkb20gPSBzYmlfemFsbG9jKHNpemVvZigqZG9t
KSk7Cj4gICAgICAgICBpZiAoIWRvbSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9N
RU07Cj4gKyAgICAgICBkb20tPndpZCA9IElOVkFMSURfV0lEOwo+Cj4gICAgICAgICBwcmVnLmRv
bSA9IGRvbTsKPiAgICAgICAgIHByZWcucmVnaW9uX2NvdW50ID0gMDsKPiBAQCAtNDQ5LDYgKzQ4
NywxMiBAQCBzdGF0aWMgaW50IF9fZmR0X3BhcnNlX2RvbWFpbihjb25zdCB2b2lkICpmZHQsIGlu
dCBkb21haW5fb2Zmc2V0LCB2b2lkICpvcGFxdWUpCj4gICAgICAgICB9Cj4gICAgICAgICBkb20t
Pm5leHRfbW9kZSA9IHZhbDMyOwo+Cj4gKyAgICAgICAvKiBSZWFkICJ3aWQiIGFuZCAid2lkZGVs
ZWciIERUIHByb3BlcnRpZXMgKi8KPiArICAgICAgIGZkdF9wYXJzZV9kb21haW5fd2lkX3Byb3Bz
KGZkdCwgZG9tYWluX29mZnNldCwgZG9tKTsKPiArICAgICAgIGVyciA9IHZhbGlkYXRlX2RvbWFp
bl93aWQoZG9tKTsKPiArICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgIGdvdG8gZmFp
bF9mcmVlX2FsbDsKPiArCj4gICAgICAgICAvKiBSZWFkICJzeXN0ZW0tcmVzZXQtYWxsb3dlZCIg
RFQgcHJvcGVydHkgKi8KPiAgICAgICAgIGlmIChmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgZG9tYWlu
X29mZnNldCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJzeXN0ZW0tcmVzZXQtYWxs
b3dlZCIsIE5VTEwpKQo+IEBAIC00NzcsMTIgKzUyMSw1MiBAQCBmYWlsX2ZyZWVfZG9tYWluOgo+
ICAgICAgICAgcmV0dXJuIGVycjsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgZmR0X3Jvb3RfZG9tYWlu
X29mZnNldChjb25zdCB2b2lkICpmZHQpCj4gK3sKPiArICAgICAgIGludCBvZmZzZXQ7Cj4gKwo+
ICsgICAgICAgb2Zmc2V0ID0gZmR0X3BhdGhfb2Zmc2V0KGZkdCwgIi9jaG9zZW4iKTsKPiArICAg
ICAgIGlmIChvZmZzZXQgPCAwKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gb2Zmc2V0Owo+ICsK
PiArICAgICAgIG9mZnNldCA9IGZkdF9ub2RlX29mZnNldF9ieV9jb21wYXRpYmxlKGZkdCwgb2Zm
c2V0LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm9w
ZW5zYmksZG9tYWluLGNvbmZpZyIpOwo+ICsgICAgICAgaWYgKG9mZnNldCA8IDApCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBvZmZzZXQ7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGZkdF9zdWJub2Rl
X29mZnNldChmZHQsIG9mZnNldCwgInJvb3QiKTsKPiArfQo+ICsKPiArc3RhdGljIGludCBmZHRf
cGFyc2Vfcm9vdF9kb21haW4oY29uc3Qgdm9pZCAqZmR0KQo+ICt7Cj4gKyAgICAgICBpbnQgb2Zm
c2V0Owo+ICsKPiArICAgICAgIGlmIChmZHQpIHsKPiArICAgICAgICAgICAgICAgb2Zmc2V0ID0g
ZmR0X3Jvb3RfZG9tYWluX29mZnNldChmZHQpOwo+ICsgICAgICAgICAgICAgICBpZiAob2Zmc2V0
ID49IDApCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZmR0X3BhcnNlX2RvbWFpbl93aWRfcHJv
cHMoZmR0LCBvZmZzZXQsICZyb290KTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICAvKgo+ICsg
ICAgICAgICogRW5zdXJlIHJvb3QgZG9tYWluIGhhcyBhIHZhbGlkIFdJRAo+ICsgICAgICAgICog
ZXZlbiBpZiBGRFQgb3Igcm9vdCBzdWJub2RlIGlzIGFic2VudAo+ICsgICAgICAgICovCj4gKyAg
ICAgICByZXR1cm4gdmFsaWRhdGVfZG9tYWluX3dpZCgmcm9vdCk7Cj4gK30KPiArCj4gIGludCBm
ZHRfZG9tYWluc19wb3B1bGF0ZShjb25zdCB2b2lkICpmZHQpCj4gIHsKPiArICAgICAgIGludCBl
cnI7Cj4gKwo+ICAgICAgICAgLyogU2FuaXR5IGNoZWNrcyAqLwo+ICAgICAgICAgaWYgKCFmZHQp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+Cj4gKyAgICAgICAvKiBQYXJz
ZSByb290IGRvbWFpbiBjb25maWcgZnJvbSAicm9vdCIgc3Vibm9kZSAqLwo+ICsgICAgICAgZXJy
ID0gZmR0X3BhcnNlX3Jvb3RfZG9tYWluKGZkdCk7Cj4gKyAgICAgICBpZiAoZXJyKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gZXJyOwo+ICsKPiAgICAgICAgIC8qIEl0ZXJhdGUgb3ZlciBlYWNo
IGRvbWFpbiBpbiBGRFQgYW5kIHBvcHVsYXRlIGRldGFpbHMgKi8KPiAgICAgICAgIHJldHVybiBm
ZHRfaXRlcmF0ZV9lYWNoX2RvbWFpbl9ybyhmZHQsIE5VTEwsIF9fZmR0X3BhcnNlX2RvbWFpbik7
Cj4gIH0KPiAtLQo+IDIuNDMuNwo+CgpSZXZpZXdlZC1ieTogUGF3YW5kZWVwIE96YSA8cGF3YW5k
ZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
