Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB0D606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P0ONi88T;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vv+v6bNe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YX8EbDNL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CFrIXEuR81YLpsQ2b2ch38rMG0uO0QeDUE2HOPCodQs=; b=P0ONi88TocHEdjevAhq3SzJ5AB
	xvbiSOMxacuJz4mvck7q6m84uaeeuJ1tdLB66csBaC1jdazBVV6L5MiY2W3eM1XDJws4kmtPrJRib
	chz9F0Ohj0EdSEgMWW5N2j+FdibaP2S7TbMwXcjUgUYWHAE2LpLiEaf4OYQIT+QlvIyzBUi+ah4Yv
	+jTHT/rHgum2t49sf+sjlGu9tvha9ddFyOgzjl6jX4O6jhQ0CG++9BmAzus9KRf6j0iSkyPqDvjAp
	1tboAmhDXqV6InrTzJBtw53MZB+8ktlmbn2ShyhaungsZgOCUqqf79zpxOJbO7aNhcY7YIAp77EmE
	PaPUXi9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtup-00000000ty1-47bD;
	Sun, 25 Oct 2026 08:49:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtun-00000000txX-1g9q
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 08:49:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4tZ4Q2509124
	for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 08:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYDHyJpEWl9jFHom8+l+whcGlV9Ku4AANrv79nzwDDs=; b=Vv+v6bNeS8teJtNM
	0LiZnbxCp/1xN63YiXnso8es7bVYgOOd5KJ1QbtkHnph4fNZq1J/PeXMDg0/2V3h
	1i7b/lxU4fxvy+0Wz/Sf0FJ0sAKELP+jTOtsrxoUfTWnTw/NXBdn0PDy5uFcWwrz
	fduHHcUuwx19hAC0TIuizMxqUTLKZVjxvhuP9ZqRlgHBFraX//GhPhB1vitG1+UK
	EQGep7DxgXTA415pOLJRHvAL9f4xHLufjQYNXnEN+mBR922blVUMK7C3vpRUrxXt
	bvfnhY5TojqHgCDKzuf4+dCteuPboS/cYOyx4mSFPclPq2bWQCbg1AvOZdNtDaiX
	FQaWbQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27tr5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 08:49:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so3250468eec.1
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 01:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792918155; cv=none;
        d=google.com; s=arc-20260327;
        b=iHUug65JUsD1iqccx9jGXrVipeONStxYh6D8ItrG0f0C5aW/cETQ3pqiEz8WDRsb/a
         4xWQxAxF+ir32Bl4n8PzpISVQJYmD9brxQFbqco1XsnQW+jx6Jr1qSYEp55dtUgb8Xyh
         Z5Q/JXSJyCHEp9kEd+8pam6vT9FRS8H5PodkpeqrQUseRF1NJh/JidNvtKLdVUi1qQ0Y
         cnjrbD307RmjX2wlaJC9ZTQqiX/42g9i56AKtILQ58DFzudjgdOCPU3mJ1VziZaSwdDm
         6C70jPZdr2vuwMfoOWCbzSHhAjEend7u4VgpwvPawaWXRmTUb37fJdsrlmrKJKpXThY8
         +pYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UYDHyJpEWl9jFHom8+l+whcGlV9Ku4AANrv79nzwDDs=;
        fh=w1sQTthhun7iHXZ4nnvjwGqAmGVCTU+wYHW0CT6WtOY=;
        b=i2QqkMtDmmdzrCC0dhND2fc1azOnr68dThvvdIT/QF04GJny8ibgIHqFbFxb1NYLzr
         zorY1FwuyXu14xSaI+YeBZBlrQkLZxnTz2ott9X6QxQ7ISaadiJSgrMVXcI7Vl2RVD1u
         rLxUL/Tj6alPzp342LeoJeGfKz7OVOKbVK5Vp7f16nDaIx1vSrbtFr7lZGgXl+PIS2nK
         DKYdByDwzmeC3e0p94yF0K3YlxcDj9P0AzYsQhtC7tg8U9G3ga+rYrpf+U+AxbPGWOiH
         NaJyvQ/ILLjcpXohn+wodSTdrFC4MCoxIqhIMdIwncgNirsi2/bQfE5//RLBK99L+egw
         spIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792918155; x=1793522955; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYDHyJpEWl9jFHom8+l+whcGlV9Ku4AANrv79nzwDDs=;
        b=YX8EbDNLQ5CTSMmAZ1U+tN7sEkRNRdUCX83eb0mPXWVF3+Vjl+kUfD1JK/Jy7kE7m/
         fV3CbULcAI0cjFz1GqnOXLlpWXawymaSvKrc9XFCryrXf1vuajErM5OSvRIrzUl4TlKW
         fTExlTjghZrfK6DEF8pFkwhEPiIBMCfixmEknxK+48YW+gYo20RH8d0rlLv6Uv94I+Co
         GkJjBp4ZDgwvXnBhB4LuSmctKctEBzvWQQogSYQQvNPJJoesBShJbiTWtrZ8omZyiE0k
         aodpCb4OdBSRkSem6QYzm0r0v1fITG+t2Wop+8tCAMG4Locq1SpmVdrSQeFjrIv0jr7i
         jqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918155; x=1793522955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYDHyJpEWl9jFHom8+l+whcGlV9Ku4AANrv79nzwDDs=;
        b=NA/ZZnws1bVnkx8ib3ppJhGxWlvWEO/yblBZ27o4kr4oix/BCE+ornBgWnJLPmxwFR
         oNBf4TnftyN/j6zCFmh1N6yOiDvLjea51QXu0TEznz949xT1du62UXXAhvzLS5u8vovC
         J6soW9iunnd3N6T3ZAcppm/uQCAj2OXi+HFgWwqtTrmVdkoUBqxwxn43qPwyZdk4op5g
         O8bMCMz0JAATIEmEr1gtViOiUL0XBWp+EKPROgbF/Y7+/PqfonTFg3D7ANxGYmCb5epa
         GMcqp09j9rOClXg7x/bUd6fHYVhZgPifUBMNzR1OfOWX9Q56ZwKREQLdQWghNCLWPJIL
         W3Ow==
X-Gm-Message-State: AFq9FYIUrEm/zoGgiiUti4VlnB3b5quLSFb5imSXi9+vxrJ/ONuadiXk
	byS324eSyy/fN/jZ6lg3MVeiVT05iKWQ5PU5AMCle+yEzd6GYZ6F1/Gqf87UpO1dwMv5miU7UKU
	im3U2AH1m7XV0kXlAULuUN82v0ysaGodFQEYJ5NAIdPtlUg5CNRKWF86I6MaHHxQNm6x3t3adi2
	rki3TehkGw3iaWjTJSns9/md0Y9rdhitt/nYzWYsZG
X-Gm-Gg: AYBFou0lj9PYv+4Sqlp60sE7wZiL+IRtMMcXll/JHnPlJnl4fHyyBuId0nZJe+wQDTJ
	aZymCSC7Hml7I0ItZ+oMsyvfDGCt5x5k+hR8XaatbcGvU5TUCjvLfNXDNOsVC5SPDe5tBeZsZKE
	999C88O3U0heQBVEXMMHkvXl2Ro71Ha4r3WsjGRan/VXac5JWxpvrbnakDgwU=
X-Received: by 2002:a05:693c:69d0:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-369f961d12cmr1662171eec.19.1792918154932;
        Sun, 25 Oct 2026 01:49:14 -0700 (PDT)
X-Received: by 2002:a05:693c:69d0:b0:369:f961:ccf8 with SMTP id
 5a478bee46e88-369f961d12cmr1662150eec.19.1792918154388; Sun, 25 Oct 2026
 01:49:14 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001060820.1267933-1-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261001060820.1267933-1-prajwal.n@oss.qualcomm.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 14:19:03 +0530
X-Gm-Features: AclHuK9MHz60e9PllFejcOeGMqgGTq8ec5nBCuC_UN7rEuSayms-voveWPjS5LM
Message-ID: <CABBgwmvTOPw=jbeJyMa25bgDmscUh85VtqMznr8HnH1MO5K0dQ@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/irqchip/imsic: Fix the MSI capability assignment
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, prajwal.n.oss@gmail.com
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6addc28c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=Cgm17DcsQIzNQePq4-YA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: lv-cDhgSADJNutrxAhPVrEhr2msR6qXn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAzNCBTYWx0ZWRfX8pIUVy68DS6j
 kEvrOcahOb3TDk+b5SMy1yRJRFPYxPc+itdcXh+Zyt0Mg2BjF/F5eV7/vLfCpvMgD4EjiIbqoaz
 scL+Ob3Oh45scdWAWIky078+kC7mnTw=
X-Proofpoint-GUID: lv-cDhgSADJNutrxAhPVrEhr2msR6qXn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAzNCBTYWx0ZWRfXy0S3MaUGptW8
 rdkv3tu/A3Vkz9k4we+HxnLoAh0SzCWi3BGQUavL8DDvy2/m3K1xT9l7+llmqSVw1/Tibok2S5I
 YVTpkrlORNXSXJQOcPSwzWcW0m1yj5nCmpUIW13L+7dP49j43Oj7U8Xj0AlYRKL/mnNvcULb2cD
 NfTCW1Pcg33K2DSSGbArNq8muFok7YdQhR5bfSzRfJP17MkOQ7aUD1OBQrPnOTnYgTRdKsU/y8F
 TONvf6nQPuuKcfBD9A8kIOfCZpWHkMoFSBqhTxiMyha5Uwba0ziX9pjRjTsMmKBDQxucrFMMh2l
 2PJSecBL7e5uOjdukn4u+KFOzCq0hMRwjwwps++xiifGh3hiBAHht7PfS3RynGxH1dQVdYlBMbM
 0/zP2FycaB5+uBH4HG+MRSElyNc5+VF5BVOLTDPwwxrhjvFtfhrZH6EuVvMyW2ojkdIQXBZ8lqm
 RCeJd7HfhbevLcH+9mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610250034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_014917_558135_10B94C80 
X-CRM114-Status: GOOD (  20.09  )
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAxMTozOeKAr0FNIFByYWp3YWwgTiA8cHJhandhbC5uQG9z
cy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gVGhlIHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2Ug
aXMgY29waWVkIHRvIHRoZSBzdHJ1Y3QgaW1zaWNfZGF0YQo+IGFuZCB0aGUgTVNJIGNhcGFiaWxp
dHkgaXMgc2V0IGluIHNiaV9pcnFjaGlwX2RldmljZS4gU2luY2UgdGhlCj4gc3RydWN0IGFzc2ln
bm1lbnQgaXMgbm90IGEgcG9pbnRlciwgdGhlIE1TSSBjYXBhYmlsaXR5IHNldHRpbmcKPiBkb2Vz
IG5vdCB0YWtlIGVmZmVjdC4KPgo+IFNldCB0aGUgTVNJIGNhcGFiaWxpdHkgZGlyZWN0bHkgaW4g
dGhlIHN0cnVjdCBpbXNpY19kYXRhIHRvCj4gZW5zdXJlIGl0IHRha2VzIGVmZmVjdC4KPgo+IEZp
eGVzOiAxOTNiMWQ5ZTdlY2IgKCJsaWI6IHV0aWxzL2lycWNoaXAvaW1zaWM6bWlncmF0ZSB0byBp
cnFjaGlwIGZyYW1ld29yayIpCj4KPiBTaWduZWQtb2ZmLWJ5OiBQcmFqd2FsIE4gPHByYWp3YWwu
bkBvc3MucXVhbGNvbW0uY29tPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVu
c2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGxpYi91dGlscy9pcnFjaGlwL2ltc2lj
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9pcnFjaGlwL2ltc2ljLmMgYi9saWIvdXRpbHMv
aXJxY2hpcC9pbXNpYy5jCj4gaW5kZXggZjZkYTlmN2UuLjQxY2ZhZGViIDEwMDY0NAo+IC0tLSBh
L2xpYi91dGlscy9pcnFjaGlwL2ltc2ljLmMKPiArKysgYi9saWIvdXRpbHMvaXJxY2hpcC9pbXNp
Yy5jCj4gQEAgLTU5OCw3ICs1OTgsNyBAQCBpbnQgaW1zaWNfY29sZF9pcnFjaGlwX2luaXQoc3Ry
dWN0IGltc2ljX2RhdGEgKmltc2ljKQo+Cj4gICAgICAgICBpbXNpYy0+aXJxY2hpcCAgICAgICAg
ICA9IGltc2ljX2RldmljZTsKPiAgICAgICAgIGltc2ljLT5pcnFjaGlwLmlkICAgICAgID0gaW1z
aWMtPnVuaXF1ZV9pZDsKPiAtICAgICAgIGltc2ljX2RldmljZS5jYXBzID0gU0JJX0lSUUNISVBf
Q0FQU19NU0k7Cj4gKyAgICAgICBpbXNpYy0+aXJxY2hpcC5jYXBzICAgICA9IFNCSV9JUlFDSElQ
X0NBUFNfTVNJOwo+ICAgICAgICAgaW1zaWMtPmlycWNoaXAubnVtX2h3aXJxID0gaW1zaWMtPm51
bV9pZHMgKyAxOwo+Cj4gICAgICAgICBzYmlfaGFydG1hc2tfc2V0X2FsbCgmaW1zaWMtPmlycWNo
aXAudGFyZ2V0X2hhcnRzKTsKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
