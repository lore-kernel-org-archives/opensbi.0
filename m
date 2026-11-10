Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C9C606A331
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 18:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=racS6jTh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=odQHHpxk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kA1/0UOZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qzhKjTuyfZsEvVAD/GMMg/xNSE8ODEY0LLo8PcW8/ew=; b=racS6jThMbsPjzT3m9zg9Hc0dS
	QYQK2qisFZvsm0IHAqDlyL12VPRagCw89e40zQKiB8h4E7393cm/hleE8xnlFZ7SqfX1RoWImCzVg
	v57EyGoJdcGTRwH56GFVPfx/zv81CzPc+6hm35ya/wcVfpbNPDFxxicAm5537ya8fWJrshgPsRnh9
	AEmurSrlRj54SO0OdHCaJrI+uBDI+WUMnTsGqUWanL86Lv8O9OgiVIZa9K2KRcj1h/qHxM4w/413J
	Wa61XwaFNoNuhNDG3hOnhStdpK3Lxwplp212LEw8xItPJ+pPeuIjAcoEiPO2dvDI30I4XxQ1mtp8Z
	Nsz7KZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqv8-00000004qGS-3Wia;
	Tue, 10 Nov 2026 18:50:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqv6-00000004qF2-27Oc
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 18:50:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIbvPv970694
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RLAYiLvO0Uda3fnwo7QINVOoAcljRuxptjSXxln+1I=; b=odQHHpxk2aA0jB4g
	95nrwRssVCJrWQNuE++kD4elECADEq6ErB7rZphKV+D9g7gPgCzjWAuLzFX3+ExU
	p3JOS9UVbMzQdc1PUJiiU5mcic7fEiDPLUX+pGXoGVovawo6N1RlneiiJmDd7+i/
	hkTyNMvST/S6mFBvNibpeXzAv7TZKyHSJGcrFaXX804YvcdguFsQ684eqz2zDPfQ
	MOaD2jgwHvkghK1CMRDojwS2EoPFZU6e1avklkJfRcRYzwnl8yqReTX2E8K59Oe7
	wsM9+dHCxQSEdi8ujcd4+dy//pJL72FuHlF8JBhFkg2d9AcQjgU4RGFA2y7ARdyz
	cTctXg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwjb35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:50:11 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab260600easo3436966b6e.1
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 10:50:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336611; cv=none;
        d=google.com; s=arc-20260327;
        b=H5uLHkEqw9h42/6FwpEoMiy9X6/Wk89C/O/NmahLe3lPMV2y5LxJBD63mgSYfyiDnn
         TYQoPrd8J/01+klvUbxZjlRDFxOag3UGDVm+HRyG6EiUxURnLOxuIt/76J3lXBYkT/AC
         xsZXtPrYB4Huu12q/pM+03UF423AhLqGpul3SxYg6IH9kLG5iywxs9oV+VFM9cfmkMYL
         Oo0XSeD3U3H7FsJmqqvWncT1KnW6rQbUdBti/+B7bMGCnJ+WFNQmEKjfRFFik+gjNLle
         A/7WaCWlnwuvpoepdUk/VgE50RROfiJc7mv+iQJCOnMNJEcB5R7eJF5cvFQ0pJ7r8Bhx
         +fMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0RLAYiLvO0Uda3fnwo7QINVOoAcljRuxptjSXxln+1I=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=Ol1urgNmYexgIwVWzy4Opm9c28yMwO6Lrrs/uGi0JiihFuoeOdD7RzgH6YwTPpquWu
         zaYY32dG32xes2n75FhMY5esOBEfoO1wflytggl7nQtuepl3q2Ec3w8jFw+fbIiFFLCz
         7XoAOGyfZ7xoUEr/Xjkd1nqQo3BAPC4Lk3SD295/FjOzL/zhEc87Jp/loHHYK5lfpBH+
         Y1qp3WuINw/bzYiU8DtUzBp5AAJHES6B7b0HJPcNfs0Jy9vWWeq0BAyLHAA1qiq3/r2O
         hGDV52X+aecYY1suYfrDhFO+RpsLskD6S67OYTNFRhZEBAKGz4aRQf/sUpooqcV3N/tm
         cvDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794336611; x=1794941411; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0RLAYiLvO0Uda3fnwo7QINVOoAcljRuxptjSXxln+1I=;
        b=kA1/0UOZqNIrj6gLayYbkKOhvJragiA11pp9BSLVeXo7vdag6u3iqaZuxah31K28B+
         G6sUDIY3J/ABmpXPlnPVLft7Y80uOq70i9PDTLM1IPCEXxmeCt26k6NIGqEvBJk7RTbQ
         RjvxcVzeZlkA9mD41zvTvXNrr1rJsNiTScp7NyKX8U3Ueh8P62pLGe/Ghwec/D5F0vga
         SfDPt8LnEKis+VSo1NRVmmqW4RmZVRQJMqIhB2Hp/6mWu+w9QheJOrAYwJ814oIBPQVw
         Rr0aeqbacuayh8VKVvOdo+Q5IeNvIW4ZVQ0B8YcTN4/YoGCx0xFR/dXVC1ED91mgkBXs
         BUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336611; x=1794941411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RLAYiLvO0Uda3fnwo7QINVOoAcljRuxptjSXxln+1I=;
        b=kpDB3VCUyhxJsxdONcs8Hzm37ZVPYlIW93e7wGM9tCkgLGiOhk9pX7m/eLzXG+p2fc
         dUkUK43Io7O8YvylJ0pQePANMF3TrPRfGlcPDnHI6HGq+jRx+YFC/zx91TJFFAgUG5/h
         QyzQC3niGw5RtkoJSDKBuA+zrbN7qqbPTopJkYdryL4/i63v4Un1a79yjGnXs5WksJmA
         6HMXG9ilwXM1TeK2l7ckJ/bjqNxQSqvhuUJw6OFava5uz4IdHbz1I4Nbqost4GhpnwPQ
         6SNkNIS4WiU4B20UbS4F8aKl8xaY6+3RYGonxgbsGkKpW4BjkxhDEN+wIuCfYYplBZPa
         2pnQ==
X-Gm-Message-State: APuU4Z/CiIkWIYBai6+LPpR8V86Lzww3e6tXQtcUnZpnqxv/wTr+cciJ
	HuKmEMjuHSnUSjgwti8idbXVW4SVpRboF/pEOkI+USVhKDZEBAEQ8a/MBJO04R/LJiAj0S9LNuV
	jQvG7AgnhsSkH6fnpkKA/iXaAAbU4QKLk1ab/9T3VAMLDbTq6XwXSOcjXgAuQMkZGRwqYH2Qojo
	cA0++r0fYpjs9JkZjTi17P2UsJAO8gND165fXFWk5d
X-Gm-Gg: AYBFou1floyg7hViWGVeRSI8G/odpo+cGt5/eCWW0m92qEOhK73KextXNMZKeHvk9XG
	j/DsofeLmUMo+2YuG3v37lG5rG1hHQ1tvoEPJpClUee/7hn4sr8zmxuK9ogJpvR2QWVcZZrbrU2
	JLWgIU5e9MrKlmNRgFHtbeT7VV1mRw/u3hSJuICirTIB0YFhUiyXQlAAGppw==
X-Received: by 2002:a05:6820:60b:b0:715:205e:4b72 with SMTP id 006d021491bc7-71915a306cemr224417eaf.24.1794336610966;
        Tue, 10 Nov 2026 10:50:10 -0800 (PST)
X-Received: by 2002:a05:6820:60b:b0:715:205e:4b72 with SMTP id
 006d021491bc7-71915a306cemr224405eaf.24.1794336610476; Tue, 10 Nov 2026
 10:50:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-8-peter.lin@sifive.com>
In-Reply-To: <20261110095029.117504-8-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 10:49:59 -0800
X-Gm-Features: AclHuK8jvqJuWky1gaWGD0E4DKBGqQMKrepv115yJbDP7Y-D7Ba6LVnJplnzN8M
Message-ID: <CAAVgOkLkxuRM4NsKv8VgvPDD4RZNfXjpj6y3ZfQ-vAZRPVjEHQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] include: sbi_types: add PRIx64 format macro
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Proofpoint-GUID: ph-ycx8wyJVo_kdMOLKkqcDI_OLmApku
X-Proofpoint-ORIG-GUID: ph-ycx8wyJVo_kdMOLKkqcDI_OLmApku
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX9SZ3jpjHY6iG
 edQVVRXF2IdPirMSSHvGyr4iPd55lXoB27k3idhD0hgl4QaDTA8U1PkXOV8Sy80D7GLEwEBzV0x
 yU/WGjNnKiaASq+JH5Z5ulllHlrB6Z4=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af36763 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8
 a=QLqnNFkh1PA7eMa2tXQA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=oJz5jJLG1JtSoe7EL652:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX0S/8ikQMQ4b2
 y+K7n83OFICVIA/Bz0CBNd4tHxuYnkLVg7KX6P2SLiB2XAxkMJlG5WltipD6LX6/g+kH+Fyg0a1
 def4mlfghMX0rLaa7duzgSg8stiaJbn4KwsiLIx8BIg0n9bDAPV77cPOmmOFcH80gOprGGW4QKa
 U3y1hLfWTrs1FgpDJ0dkq7KwMZSsX+AHG/3dgwXp+Yqy9PoFRdRC6Zd7gHgA6Fi/CLwx26h0TPf
 6x5UEM6eYsqqW/XIIa1k0FDlttenhyMnN3Pvgkd19lc5eW77V9X56lTnwTAFBFbzCafhjj8BmPs
 qeOd7TOe3YWzF0kEh2t+2qhIjEe6aXModjqdD2IB+fbqIYiy2KQLSsQHp8h9xlfOKGKlhVhAFia
 vOPfjrWdouej9tRHxQoVk7TZ1ss15AFnqi47P4G4JngyQVQAM6V+sGcsl8hhn3xqQDKbEeHKJOq
 dCVLPVTObjfyoxWGbUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_105012_555972_E94A4912 
X-CRM114-Status: GOOD (  13.97  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIFBSSXg2NCBmb3IgcG9ydGFibGUgNjQt
Yml0IGhleCBwcmludGluZy4gRXhwYW5kcwo+IHRvIDAxNmx4IG9uIFJWNjQgYW5kIDAxNmxseCBv
biBSVjMyLCBlbmFibGluZyBjb25zaXN0ZW50Cj4gcHJpbnRmLXN0eWxlIGZvcm1hdHRpbmcgb2Yg
dWludDY0X3QgdmFsdWVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxw
ZXRlci5saW5Ac2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1ieTogUGF3YW5kZWVwIE96YSA8cGF3YW5k
ZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgo+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgo+IC0tLQo+IENoYW5nZXMgdjQtPnY1Ogo+IC0gTm8gY2hhbmdlCj4g
LS0tCj4gIGluY2x1ZGUvc2JpL3NiaV90eXBlcy5oIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX3R5cGVzLmgg
Yi9pbmNsdWRlL3NiaS9zYmlfdHlwZXMuaAo+IGluZGV4IGI4YTdlNmNiLi43ODBhNGMyYSAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfdHlwZXMuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3Ni
aV90eXBlcy5oCj4gQEAgLTM0LDEyICszNCwxNCBAQCB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgICAg
ICAgICAgICAgICB1NjQ7Cj4gIHR5cGVkZWYgbG9uZyAgICAgICAgICAgICAgICAgICBpbnQ2NF90
Owo+ICB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgICAgICAgICAgdWludDY0X3Q7Cj4gICNkZWZpbmUg
UFJJTFggICAgICAgICAgICAgICAgICAiMDE2bHgiCj4gKyNkZWZpbmUgUFJJeDY0ICAgICAgICAg
ICAgICAgICAiMDE2bHgiCj4gICNlbGlmIF9fcmlzY3ZfeGxlbiA9PSAzMgo+ICB0eXBlZGVmIGxv
bmcgbG9uZyAgICAgICAgICAgICAgczY0Owo+ICB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgbG9uZyAg
ICAgdTY0Owo+ICB0eXBlZGVmIGxvbmcgbG9uZyAgICAgICAgICAgICAgaW50NjRfdDsKPiAgdHlw
ZWRlZiB1bnNpZ25lZCBsb25nIGxvbmcgICAgIHVpbnQ2NF90Owo+ICAjZGVmaW5lIFBSSUxYICAg
ICAgICAgICAgICAgICAgIjA4bHgiCj4gKyNkZWZpbmUgUFJJeDY0ICAgICAgICAgICAgICAgICAi
MDE2bGx4Igo+ICAjZWxzZQo+ICAjZXJyb3IgIlVuZXhwZWN0ZWQgX19yaXNjdl94bGVuIgo+ICAj
ZW5kaWYKPiAtLQo+IDIuNDMuNwo+CgpSZXZpZXdlZC1ieTogUGF3YW5kZWVwIE96YSA8cGF3YW5k
ZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
