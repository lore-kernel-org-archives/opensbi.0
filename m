Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C4DC43458
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 20:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYiQIySKeGp1lgsMe5QprQB3+ELGYSNi8Qw+1LoPKQ4=; b=czlgByq85G7T+w
	nibFqxaxN/j0OpgBt3AqvHvaxrtGTsmR1WVben9lwFihnNKUSNp2vW8Tsf5RhbUkidG0s6SKZQbMS
	8BSvro6iJqj9GJFuoNr7gYlM9oBDzY3jT2sC8gjVpR8iPEhpUiHJGyrR/EpipcTBpKgtZ6b2my/AV
	CqhbsgTqAiRmp3HlGx9o+i4/b87nhqbT+kZ9jQ6u5TwV26qdpE98aNMno0/5FV8zW+Lxc4sRG6PwP
	UU/x9yuaqvCyVJoCl3liKmS4oA1gyzsPD+En6r01IobZwOlhUEuRtw6W6VGcEsVXYItqw8mtD5O5B
	G9FYW+q38QDp6K4DVQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCdI-0000000Fsu1-3NY0;
	Tue, 07 Jul 2026 20:43:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whCdE-0000000FstU-2JnB
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 20:43:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Mcj341630
	for <opensbi@lists.infradead.org>; Tue, 7 Jul 2026 20:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBTDMz1ZHvuD6yNABExADB8JkMLfC1Fp5dCadX6/rJE=; b=E9htVUqWahINqGSx
	MBCs73S9cwJwIe7R3IbO6kqL5qGU7k+bViZ1arqNPXnizLjJ4idbP9gINCDDsBMj
	vXAS6vqi7O8E4w0gWZ5cbcrwaaxEjYnBxMgyCN1iKwXEi33L+5DYHl2PWc+CefZD
	653M0ofAb/ok+wXqVviCdYZhTAuvEWjvUifVQPZnQpeTnqGwHfxjewQUWWu/NHPe
	jz1xfxR+nRNn3M94ctqM8uOvDznpNaweh94EzInU+dlaj/y+LlHBZiIG8b/nDjnm
	s/fweGkv1qOBYrYwxTZJ76JlIEJ0acW6mEiQnIKZrhCiJ0cOMSuq3+ThdertsI4v
	6jHlew==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2ubcxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 07 Jul 2026 20:43:02 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48f680bda84so23359b6e.1
        for <opensbi@lists.infradead.org>; Tue, 07 Jul 2026 13:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783456982; cv=none;
        d=google.com; s=arc-20260327;
        b=ogcH9ARGRHREVSsA/0ZmOE1fERW0ZEVuAoNaPSiJjQBXwt+yCFJc60OGKPnrbW7O0k
         C5DpanNIRyXYXhbLAJlkgyM8o0rZ/wMAih9hkULNocY12JCDRopUo3ec3++uMB2ivLKe
         RZ4jlx/W1nfPi6hFLNPcRW1qNHUEsNNHkGKH6BikKAFjx20AOSm9lziwq4lv2h+E1PQ9
         qsiQG9T5o19bzzX08iQWswjlZPYBlvJtk1pnbsIauPkUQL6CqmB4ZaIv7Retjok2VA4Z
         t5gHnFATXkCjK9H2PPZPmdisIDffM0Tkoiw/tjuSrfWsbeyMJwdYGVUJUD6gMHVa6wFX
         AIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rBTDMz1ZHvuD6yNABExADB8JkMLfC1Fp5dCadX6/rJE=;
        fh=xLzIeVXh3U8IQFM2SX1CefUMvpRZs72ntCoylmLJgco=;
        b=r9SIU5OP6tVWjW7dwP9ol0Yi2QGNOdg8AD5Yz3TL199S+eCUb233tkge7Ok82nH6BM
         gPRFQogpp6rrFy/2BXIofXxdzrhYOcz3iBrgeAzBAmv4huTJZ3ia+E7NL1omPxPaK4VY
         /y9YuEXdjWrmA2F6mtiZf/s9eb2mR+0VGwpkypQUEsjnrBg/5pO9vqed2qUKPyIVqDae
         fnb9NQcsJbF4S40yBvkdBv4UTIdUogwS0IscclLZZEFgMN1Av6OU8zaSZqVP0/XR/nPT
         FH/hN7Y4GDNbH+DXDhIlo9SeslR6oTXX1aL6yfe4dTfkODC0k4BmYcYNN9T6bt8Fp4zK
         2uAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783456982; x=1784061782; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBTDMz1ZHvuD6yNABExADB8JkMLfC1Fp5dCadX6/rJE=;
        b=JsXVugvntb6rHumj9iL48xC/k69l262bEhAdFamXMEZCiOvGZ20HmPbaxi4cSr6gzz
         rajELcotwaPZpf3FRg1khLk3Cd67hWfARZpXssE4sXPy3Eq58x+yba95VvJzExkPSZnc
         gLmAUsIubkJyZXxWPkd95tAeTIpjo4xfSD+wE4iEckSvJceHDhmWrd9Z2TCgZddZ5CUx
         cddsktzuN+weKEBFIIsvk13b36aEu+bb2rP5ig4OQju+bOcqXm1LkY04obd8Hc6utpN2
         4ql7SRmmmzh1izQV85jacFgDdpMcIS59qQ7lybz2yvK7U47S+J9Hqk5QN3nbAxhtIgZf
         oOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456982; x=1784061782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBTDMz1ZHvuD6yNABExADB8JkMLfC1Fp5dCadX6/rJE=;
        b=a158jby5ryK/qqMAyb2eQUKwdp3YSg9IafyB55TC1eLiYfRj5FIWwDGVKUu9ApmNBj
         JNXcWvnvRkdWp2LezUGbjbAifmvzp7Dd5cNRAtOX+Kr3ZrxJ73lm5yWehHA6pDXkyBcx
         iKFuTB8xVFWYKUCauadAwefiJh0R7xO21gfeAAfs+cv4947UQKPZDSCYJXacZ9DC+0JJ
         az6LRLDbvQSkobtrfMOC9DQJTS8jwiyJgPCR+yKOXfU3GeUcDemCIwKDdXJHcXGr7JxW
         4mrL/SdBCITrRyEbVB49BwUfnkKkMMdd+DuJKvOF1aYWEg4TSkp5Dg8rpX1VI1cqfYx1
         0S0w==
X-Gm-Message-State: AOJu0YxKfjSE8YIHNxbyDq+Eidfrcg8Wmn5fLwjxcNMUjn9vqpN4jEEw
	G06i5xUeWQkzmHBngSXiSab03l6AzWvB9hIj8+hE8UKbjrPaB9f/ZT1aewqfpBE44A95XwUl/z9
	Dhzc6CLymBzoDyDZD2uES1MMEGcYHgQtGWyYh1Et/aeNrXcWjIcy7LeXxAAVKmtf+vL7vovep0Y
	Q8H2j7s577HoDtRkqaVIk6obpGy+uThe61mYbqvxYmfwLxh98c
X-Gm-Gg: AfdE7ckZs7ajOQ9t545LUMci0hwEJ3pHYFlm6c3CK9TZK/GlodraT3TedXrqwbZrlHo
	XcbkNpiaFUKEA6eo8Psx38voLMy840kaTbC0/00qSMlvG0gH7BiNgOhOINfPEvgViuQtx9rvu5t
	PiUgqnIl/ya1Oe44bXqHX0Kq5BbLrbQjF4lJlv+MkryO8x3vKSXN+mEw2MNWiVpljVSnkz
X-Received: by 2002:a05:6808:470c:b0:497:dedc:605c with SMTP id 5614622812f47-49fdba361b3mr4648944b6e.7.1783456981735;
        Tue, 07 Jul 2026 13:43:01 -0700 (PDT)
X-Received: by 2002:a05:6808:470c:b0:497:dedc:605c with SMTP id
 5614622812f47-49fdba361b3mr4648923b6e.7.1783456981249; Tue, 07 Jul 2026
 13:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260629181206.754781-1-pawandeep.oza@oss.qualcomm.com> <CAFR3w37h+20zkPzwugKrPyPHBZambpL8hiLnR5u3AVeob9uL+Q@mail.gmail.com>
In-Reply-To: <CAFR3w37h+20zkPzwugKrPyPHBZambpL8hiLnR5u3AVeob9uL+Q@mail.gmail.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 13:42:50 -0700
X-Gm-Features: AVVi8CffRIxQ2OXyne29ytydwABO_8wptEDVGZulbj6mlDDOaQ727gB3XGY0p_A
Message-ID: <CAAVgOk+1yqbw5S8Yn3SXd_fL7VFm1SevwUOL8P7sfJUSfLP57A@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/mpxy: bind channel access to owning domain
To: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwMyBTYWx0ZWRfX3vSQ5V/moFhf
 kXRzxv0CD1Utui4RWdMDyC9Hme/mXUg+a12paZvr+/NbqH7tZYgk9EaIeFGFnAw+sYyhRBKsrfA
 bE8O4gfmJyGt4eFB4i8Bh9hNjBsoybk=
X-Proofpoint-GUID: JYj3xr4jm9g-hN-YBgGDKgE_V2JKgJ7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwMyBTYWx0ZWRfX8+aNCmrbbsiB
 7bf5hVBn6ngjJuENvKpK+ozSNvml+u9GmMhmQtOW60e2tjZtFvvKqpI1QSjAsHonUx2Rd55xICh
 Gyu8SZg07RtOkeaNR3CQ7876242tjrSFbAPRNDu+GrWDYNIDczkjTiW4rKXW/A8PQMSfZoRd8dz
 3YHiO68TV3yLCqJsD0XEkdwte5YBB91wBvHA7qZcqHDFrz7cgiaXUb7N6EsNY6QxAKnkObKyhHE
 ahbN9BOnvHGehQdsxaUXTl0yTDwewicELC/p5GmTDpdghGRck7htCze9lv2HhFl2h3fxE1K4TMo
 di3RXovjEsX2HPbg8HQHwOCWR+hN2NSOOUGcrT9woHWGMxca/mH2wmjcE7yDkf/l5N8ZxTrohEk
 ZqkFV5VEG1xT+GJfrFxSgGcn3aEvckvSAFwlQNt6vx/k6xVgoh22Uqk7mWZYM1V9QW+E8P3gkCs
 exJ4no/ZDjeM/I5dsFA==
X-Proofpoint-ORIG-GUID: JYj3xr4jm9g-hN-YBgGDKgE_V2JKgJ7V
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4d64d6 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=POZyqHxJxPag6PoNe_cA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070203
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_134304_736037_04F2246E 
X-CRM114-Status: GOOD (  32.86  )
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

T24gRnJpLCBKdWwgMywgMjAyNiBhdCA0OjE54oCvQU0gUmFodWwgUGF0aGFrCjxyYWh1bC5wYXRo
YWtAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAyOSwgMjAyNiBhdCAx
MTo0N+KAr1BNIFBhd2FuZGVlcCBPemEKPiA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29t
PiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3phQG9zcy5x
dWFsY29tbS5jb20+Cj4gPgo+ID4gVGhlIE1QWFkgZnJhbWV3b3JrIGN1cnJlbnRseSBzdG9yZXMg
cmVnaXN0ZXJlZCBjaGFubmVscyBpbiBhIGdsb2JhbAo+ID4gbGlzdCBhbmQgZXhwb3NlcyB0aGVt
IHRvIGFsbCBjYWxsZXJzLiBIb3dldmVyLCB0aGUgaW50ZW5kZWQgbW9kZWwgaXMKPiA+IHRoYXQg
ZWFjaCBjaGFubmVsIGlzIGFzc2lnbmVkIHRvIGEgc2luZ2xlIHN1cGVydmlzb3IgZG9tYWluIGF0
IGJvb3QgYW5kCj4gPiByZW1haW5zIG93bmVkIGJ5IHRoYXQgZG9tYWluIGZvciBpdHMgbGlmZXRp
bWUuCj4gPgo+ID4gSW50cm9kdWNlIGZpeGVkIG93bmVyLWRvbWFpbiB0cmFja2luZyBpbiBzdHJ1
Y3Qgc2JpX21weHlfY2hhbm5lbCBhbmQKPiA+IG1ha2UgY2hhbm5lbCBsb29rdXAgYW5kIGVudW1l
cmF0aW9uIGRvbWFpbi1hd2FyZS4gQSBjaGFubmVsIGlzIG5vdwo+ID4gdmlzaWJsZSBvbmx5IHdo
ZW4gYWNjZXNzZWQgZnJvbSBpdHMgb3duaW5nIGRvbWFpbi4gQWxzbyByZXF1aXJlIHRoZQo+ID4g
b3duZXIgdG8gYmUgc2V0IGJlZm9yZSBjaGFubmVsIHJlZ2lzdHJhdGlvbi4KPiA+Cj4gPiBUaGlz
IGFsbG93cyBNUFhZIHRvIHN1cHBvcnQgc3lzdGVtcyB3aGVyZSB0aGUgc2FtZSBoYXJ0IG1heSBi
ZSByZXVzZWQgYnkKPiA+IG11bHRpcGxlIGRvbWFpbnMgd2hpbGUga2VlcGluZyBjaGFubmVsIG93
bmVyc2hpcCBhbmQgdmlzaWJpbGl0eSBmaXhlZCB0bwo+ID4gdGhlIGRvbWFpbiB0aGF0IG93bnMg
dGhlIHNlcnZpY2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogT3phIFBhd2FuZGVlcCA8cGF3YW5k
ZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Ni
aS9zYmlfbXB4eS5oIGIvaW5jbHVkZS9zYmkvc2JpX21weHkuaAo+ID4gaW5kZXggOWRhMjc5MWUu
LmU3YjI4NTI3IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX21weHkuaAo+ID4gKysr
IGIvaW5jbHVkZS9zYmkvc2JpX21weHkuaAo+ID4gQEAgLTEzLDYgKzEzLDcgQEAKPiA+ICAjaW5j
bHVkZSA8c2JpL3NiaV9saXN0Lmg+Cj4gPgo+ID4gIHN0cnVjdCBzYmlfc2NyYXRjaDsKPiA+ICtz
dHJ1Y3Qgc2JpX2RvbWFpbjsKPiA+Cj4gPiAgI2RlZmluZSBTQklfTVBYWV9NU0dQUk9UT19WRVJT
SU9OKE1ham9yLCBNaW5vcikgKChNYWpvciA8PCAxNikgfCBNaW5vcikKPiA+Cj4gPiBAQCAtOTEs
MTIgKzkyLDEzIEBAIHN0cnVjdCBzYmlfbXB4eV9jaGFubmVsX2F0dHJzIHsKPiA+ICAgICAgICAg
LyogRXZlbnRzIFN0YXRlIENvbnRyb2wgKi8KPiA+ICAgICAgICAgdTMyIGV2ZW50c3N0YXRlX2N0
cmw7Cj4gPiAgfTsKPiA+IC0KPiA+ICAvKiogQSBNZXNzYWdlIHByb3h5IGNoYW5uZWwgYWNjZXNz
aWJsZSB0aHJvdWdoIFNCSSBpbnRlcmZhY2UgKi8KPiA+ICBzdHJ1Y3Qgc2JpX21weHlfY2hhbm5l
bCB7Cj4gPiAgICAgICAgIC8qKiBMaXN0IGhlYWQgdG8gYSBzZXQgb2YgY2hhbm5lbHMgKi8KPiA+
ICAgICAgICAgc3RydWN0IHNiaV9kbGlzdCBoZWFkOwo+ID4gICAgICAgICB1MzIgY2hhbm5lbF9p
ZDsKPiA+ICsKPiA+ICsgICAgICAgc3RydWN0IHNiaV9kb21haW4gKm93bmVyX2RvbWFpbjsKPiA+
ICAgICAgICAgc3RydWN0IHNiaV9tcHh5X2NoYW5uZWxfYXR0cnMgYXR0cnM7Cj4gPgo+ID4gICAg
ICAgICAvKioKPiA+IEBAIC0xODEsNSArMTgzLDQgQEAgaW50IHNiaV9tcHh5X3NlbmRfbWVzc2Fn
ZSh1MzIgY2hhbm5lbF9pZCwgdTggbXNnX2lkLAo+ID4gIC8qKiBHZXQgTWVzc2FnZSBwcm94eSBu
b3RpZmljYXRpb24gZXZlbnRzICovCj4gPiAgaW50IHNiaV9tcHh5X2dldF9ub3RpZmljYXRpb25f
ZXZlbnRzKHUzMiBjaGFubmVsX2lkLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKmV2ZW50c19sZW4pOwo+ID4gLQo+ID4gICNlbmRpZgo+
ID4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX21weHkuYyBiL2xpYi9zYmkvc2JpX21weHkuYwo+
ID4gaW5kZXggZmY1YzZhYjYuLjA4ZTEwZGNhIDEwMDY0NAo+ID4gLS0tIGEvbGliL3NiaS9zYmlf
bXB4eS5jCj4gPiArKysgYi9saWIvc2JpL3NiaV9tcHh5LmMKPiA+IEBAIC0xNDUsMTQgKzE0NSwy
MyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgbXB4eV9pc19zdGRfYXR0cih1MzIgYXR0cl9pZCkKPiA+
ICAgICAgICAgcmV0dXJuIChhdHRyX2lkID4+IDMxKSA/IGZhbHNlIDogdHJ1ZTsKPiA+ICB9Cj4g
Pgo+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCBtcHh5X2NoYW5uZWxfdmlzaWJsZShzdHJ1Y3Qgc2Jp
X21weHlfY2hhbm5lbCAqY2hhbm5lbCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tKQo+ID4gK3sKPiA+ICsgICAgICAgcmV0
dXJuIGNoYW5uZWwtPm93bmVyX2RvbWFpbiA9PSBkb207Cj4gPiArfQo+ID4gKwo+ID4gIC8qKiBG
aW5kIGNoYW5uZWxfaWQgaW4gcmVnaXN0ZXJlZCBjaGFubmVscyBsaXN0ICovCj4gPiAtc3RhdGlj
IHN0cnVjdCBzYmlfbXB4eV9jaGFubmVsICptcHh5X2ZpbmRfY2hhbm5lbCh1MzIgY2hhbm5lbF9p
ZCkKPiA+ICtzdGF0aWMgc3RydWN0IHNiaV9tcHh5X2NoYW5uZWwgKm1weHlfZmluZF9jaGFubmVs
KHUzMiBjaGFubmVsX2lkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3Qgc2Jp
X21weHlfY2hhbm5lbCAqY2hhbm5lbDsKPiA+Cj4gPiAtICAgICAgIHNiaV9saXN0X2Zvcl9lYWNo
X2VudHJ5KGNoYW5uZWwsICZtcHh5X2NoYW5uZWxfbGlzdCwgaGVhZCkKPiA+IC0gICAgICAgICAg
ICAgICBpZiAoY2hhbm5lbC0+Y2hhbm5lbF9pZCA9PSBjaGFubmVsX2lkKQo+ID4gKyAgICAgICBz
YmlfbGlzdF9mb3JfZWFjaF9lbnRyeShjaGFubmVsLCAmbXB4eV9jaGFubmVsX2xpc3QsIGhlYWQp
IHsKPiA+ICsgICAgICAgICAgICAgICBpZiAoY2hhbm5lbC0+Y2hhbm5lbF9pZCA9PSBjaGFubmVs
X2lkICYmCj4gPiArICAgICAgICAgICAgICAgICAgIG1weHlfY2hhbm5lbF92aXNpYmxlKGNoYW5u
ZWwsIGRvbSkpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gY2hhbm5lbDsKPiA+
ICsgICAgICAgfQo+ID4KPiA+ICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiAgfQo+ID4gQEAgLTIy
Miw5ICsyMzEsMTIgQEAgc3RhdGljIHZvaWQgbXB4eV9zdGRfYXR0cnNfaW5pdChzdHJ1Y3Qgc2Jp
X21weHlfY2hhbm5lbCAqY2hhbm5lbCkKPiA+ICBpbnQgc2JpX21weHlfcmVnaXN0ZXJfY2hhbm5l
bChzdHJ1Y3Qgc2JpX21weHlfY2hhbm5lbCAqY2hhbm5lbCkKPiA+ICB7Cj4gPiAgICAgICAgIGlm
ICghY2hhbm5lbCkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiA+ICsK
PiA+ICsgICAgICAgaWYgKCFjaGFubmVsLT5vd25lcl9kb21haW4pCj4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gPgo+ID4gLSAgICAgICBpZiAobXB4eV9maW5kX2NoYW5u
ZWwoY2hhbm5lbC0+Y2hhbm5lbF9pZCkpCj4gPiArICAgICAgIGlmIChtcHh5X2ZpbmRfY2hhbm5l
bChjaGFubmVsLT5jaGFubmVsX2lkLCBjaGFubmVsLT5vd25lcl9kb21haW4pKQo+ID4gICAgICAg
ICAgICAgICAgIHJldHVybiBTQklfRUFMUkVBRFk7Cj4gPgo+ID4gICAgICAgICAvKiBJbml0aWFs
aXplIGNoYW5uZWwgc3BlY2lmaWMgYXR0cmlidXRlcyAqLwo+ID4gQEAgLTM5NywxMiArNDA5LDE1
IEBAIGludCBzYmlfbXB4eV9nZXRfY2hhbm5lbF9pZHModTMyIHN0YXJ0X2luZGV4KQo+ID4gICAg
ICAgICBzdHJ1Y3Qgc2JpX21weHlfY2hhbm5lbCAqY2hhbm5lbDsKPiA+ICAgICAgICAgdTMyIGNo
YW5uZWxzX2NvdW50ID0gMDsKPiA+ICAgICAgICAgdTMyICpzaG1lbV9iYXNlOwo+ID4gKyAgICAg
ICBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tID0gc2JpX2RvbWFpbl90aGlzaGFydF9wdHIoKTsKPiA+
Cj4gPiAgICAgICAgIGlmICghbXB4eV9zaG1lbV9lbmFibGVkKG1zKSkKPiA+ICAgICAgICAgICAg
ICAgICByZXR1cm4gU0JJX0VSUl9OT19TSE1FTTsKPiA+Cj4gPiAtICAgICAgIHNiaV9saXN0X2Zv
cl9lYWNoX2VudHJ5KGNoYW5uZWwsICZtcHh5X2NoYW5uZWxfbGlzdCwgaGVhZCkKPiA+IC0gICAg
ICAgICAgICAgICBjaGFubmVsc19jb3VudCArPSAxOwo+ID4gKyAgICAgICBzYmlfbGlzdF9mb3Jf
ZWFjaF9lbnRyeShjaGFubmVsLCAmbXB4eV9jaGFubmVsX2xpc3QsIGhlYWQpIHsKPiA+ICsgICAg
ICAgICAgICAgICBpZiAobXB4eV9jaGFubmVsX3Zpc2libGUoY2hhbm5lbCwgZG9tKSkKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGNoYW5uZWxzX2NvdW50ICs9IDE7Cj4gPiArICAgICAgIH0K
PiA+Cj4gPiAgICAgICAgIGlmIChzdGFydF9pbmRleCA+IGNoYW5uZWxzX2NvdW50KQo+ID4gICAg
ICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfUEFSQU07Cj4gPiBAQCAtNDIwLDYg
KzQzNSw5IEBAIGludCBzYmlfbXB4eV9nZXRfY2hhbm5lbF9pZHModTMyIHN0YXJ0X2luZGV4KQo+
ID4KPiA+ICAgICAgICAgLy8gSXRlcmF0ZSBvdmVyIHRoZSBsaXN0IG9mIGNoYW5uZWxzIHRvIGdl
dCB0aGUgY2hhbm5lbCBpZHMuCj4gPiAgICAgICAgIHNiaV9saXN0X2Zvcl9lYWNoX2VudHJ5KGNo
YW5uZWwsICZtcHh5X2NoYW5uZWxfbGlzdCwgaGVhZCkgewo+ID4gKyAgICAgICAgICAgICAgIGlm
ICghbXB4eV9jaGFubmVsX3Zpc2libGUoY2hhbm5lbCwgc2JpX2RvbWFpbl90aGlzaGFydF9wdHIo
KSkpCj4KPiBOSVQ6IFlvdSBjYW4gdXNlIGRvbSBoZXJlIGFsc28gaW5zdGVhZCBvZiBzYmlfZG9t
YWluX3RoaXNoYXJ0X3B0cigpCk96YTogd2lsbCBmaXggdGhpcwo+Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBjb250aW51ZTsKPiA+ICsKPgo+ID4KPgo+IFF1ZXN0aW9uOiBOb3cgYSBkb21h
aW4gbWF5IGhhdmUgYWxsIHRoZSBjaGFubmVscyBvd25lZCBhbmQgYW5vdGhlciBtYXkgaGF2ZQo+
IG5vbmUsIHNpbmNlIE1QWFkgZXh0ZW5zaW9uIHdpbGwgYmUgcmVnaXN0ZXJlZCBhbnl3YXlzLAo+
IHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9NUFhZKQo+IHdpbGwgcmV0dXJuIGEgcHJlc2Vu
dCBmb3IgdGhlIGRvbWFpbiB3aGljaCBkb2VzIG5vdCBvd24gYW55IGNoYW5uZWxzLgo+IElzIHRo
aXMgaW50ZW5kZWQ/Ck96YTogeWVzLCBJIHRoaW5rIHRoYXQgaXMgb2theSBub3QgdG8gaGF2ZSBj
aGFubmVscywgc2luY2Ugb3duZXJzaGlwCmlzIHRpZWQgdG8gdGhlIGNoYW5uZWxzIG9ubHkuIHNv
IG9uY2UgdGhlIGNoYW5uZWwgaXMgcmVnaXN0ZXJlZApvd25lcnNoaXAgaXMgZXN0YWJsaXNoZWQu
CmNvbWFpbiB3aXRob3V0IGNoYW5uZWwgaXMgZmluZSwgYnV0IGlmIGl0IGRlY2lkZXMgdG8gc2Vu
ZC9yZWNpdmUKbWVzc2FnZXMgYWNyb3NzIGRvbWFpbnMsIEkgd2lsbCBiZSBhZGRpbmcgc29tZSBz
dXBwb3J0IGZvIHRoZSBzYW1lIGFzCndlbGwuIHRoaXMgcGF0Y2ggaXMganVzdCBmaXhpbmcgdGhl
IHBhcnQgd2hlcmUgd2Ugb25seSBoYWQgcm9vdCBkb21haW4Kc28gZmFyLgoKPgo+IFRoYW5rcwo+
IFJhaHVsCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
