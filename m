Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D23606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 05:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TMw8CDql;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LsJF9xVC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI78K0te
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BxngW+zUk9q81CurQF65SmYsyxQrHl6tdCCnOYTcJGI=; b=TMw8CDqlboUeB3/S5UyhDUXNUw
	EHEk0EZgYWGaTJaZm+p+yaODnLw3lDTO8UyG5ekyIpSV93bvXEPjuv0dX0PsBwmvb3JLHKTi51mth
	NjknmEB9d4yCoCkUtq/ARjISP4GgdFicwpfe0E458h50fp5Tu67z0rd8IV8ANVL6JihKMad/oUObN
	mnhDTt4cr9oSzC6CayCVgn9kuJVyAXZSrbfdcWPSNMKpskVI+0gk/N7P1M3Rg4lF7u6Oo0ABfp/MH
	4BKqZFBITimUNOzlqaBa/ZZADexRP6pODPHZEw8qumT5gsNIHVy5JTxeaiOsk2z158fyKD53NpgI5
	Orx1jl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqRU-00000000kB4-3Ld2;
	Sun, 25 Oct 2026 05:06:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKqRR-00000000kAf-45rQ
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 05:06:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4sxIE2663629
	for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 05:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AXmbkIgsEL6kynrDKNsnR+YRWIh4tLFgEu7vE+yNJbk=; b=LsJF9xVCm3UXgDrF
	4FsB0kLiKKrL3htosSsE7U0lU7Wrn7VBlldlWqxEjXkY0bYEMhngcPR545aanYAj
	tXBTJ1m+GnvubxobvVRaDbmW3OguIrBAutNvLM27u9hLCARw70dtpqXbKbbIGH1o
	pR8T5tmFKERP2yt0TpqBywzJR03knHMsgNQx+vbI2GdthzJ2Cjixv516ijN5n4Y6
	7Dn7krT+Lv1cY2jdxPEZc//18ErlmIEpBvJIKd84RlyrFTFawoH07uxUqtx2RYJU
	MfUkgJzsjff7kGbJeWad8ymBEoOQeL+fEbaODqBQtK7YsBZLHnDPzm2HVAAERej7
	oDLlcQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9ta5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 05:06:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a2de2cc1so28558016d6.1
        for <opensbi@lists.infradead.org>; Sat, 24 Oct 2026 22:06:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792904803; cv=none;
        d=google.com; s=arc-20260327;
        b=ZKsb2amF8B4zM6m4YpmJLjByJQ2131aDCDuM4fMumabINp/Efhl5czyKWZa5IsWc8t
         A48JiQSkHShKX2U1Q3PzIOimqHSpBljhw75SJvyCkP+Yc/WTCb9g85BwhCcye6vcw3j3
         In7Uat+Grt5p0O9B/vrzcIig2+2gT3U2A8c4Vqfjpu2r5sSH9bjuEtwn07FGcvageEDn
         PTx8ch/QRj/DSEOATJgPp5DgVdIPG7ApYyTgEhrLNmr07oAkFnG8oD8CleFrjNhge+k7
         1Xb7TiafOFuD/h+Lk49h23AQY/s6MDq5ERywQBTDhw2Du//1YXElfuXgAZrgN+ABZ9Em
         XCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AXmbkIgsEL6kynrDKNsnR+YRWIh4tLFgEu7vE+yNJbk=;
        fh=IyUiLrEdhZnDA3kQWvXAov8ZZZnObQ2Ps5ggmjQ4HAA=;
        b=nXI0T+pqntwSOP8p68Eb6bXoAZm85l2C02LLU2b64t9MgsjHmJAM2MN4+veOAwgJXZ
         xnMo61LEYamSMTlOTLK+JqQSd9Oa8ikSDLsNTPLf3yF6p/zD2kZOjpSf8jK2dmuRQNnw
         6/ge6WZkn7wDFkGqGysMSd4px4T5TbBE9s3Ug14IlZnrsHRUE0LKTEi0oNJZ0ZQKJITM
         i8OevEiM3xFqypcBBsFzkA3aQ/4ytunngiua5fBbcxnpdnZclhHpOZvjhZhhUaulJxxt
         HNAcL4Vn56LdtvIfL+zP8DSgfQH5QT3VR8GQbHqH13ZFUolMgnlTMROrshDvWQIsqX5P
         yQvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792904803; x=1793509603; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AXmbkIgsEL6kynrDKNsnR+YRWIh4tLFgEu7vE+yNJbk=;
        b=eI78K0teKzUCwHEWVMLomMjlrnOPyeYBiN4NWzmMJa7S0eXFEt7nyyrEW7PTcVw7ue
         8Rq7DHH8zseS6Xx+yb57XYuW6RxE66HPfz6TXU0n/oNjnLpC8abCi+QAwQWNihYdp+rh
         qo1p5gXdtQ2xunKburTiqMp/Da2NDYgk5vrkrkBvt2G30JDl3bnf2P+qp9/4kDKN1gFC
         b5WX1PRh1uO/D2QkYl5kB/WOl+u8UPqrk7JIOmqSSYrJ/vXao/LsOegYCqO1nMeEs8Dq
         84M5c39OjqMav/NQMqK+2kPVwBCDIrPAivM/A8nHl5dQQf8Xxn4WPkaedS9DUdI7Qvuz
         +ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792904803; x=1793509603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AXmbkIgsEL6kynrDKNsnR+YRWIh4tLFgEu7vE+yNJbk=;
        b=lS9GL+4oHt/a/PeYV+Ockk9RFXT3G0uUzWQ0TnleyliXlyGwUTYVWhGvifOq0AVaNm
         FSthUhn5qZivBxnPifjpMYP3KVUD5em6gJBmSfTMh/jQROTrp+U7aUMCqrzxh7OOZueu
         VEv8GP/WHLtfOplR25oK+sNx8WV+JT52ySaOpAC6H9i5AuIeBgK6WSCcL1b2jpHGs2Ky
         T7Y5p7rAeHde8CxygIARJccg6XL9BXZDtu/FXjLUQTyFszjmyeR69SrX5+g31WgJLzU4
         /Gvxhu23/ic31i4jGqQLTf7+qa3uTKTPZnm5pc3vEItbYydUYnnl77T3bkTfFHIcXquS
         iTdA==
X-Gm-Message-State: AFq9FYKTH5tzPgorNNE2Mw2W4Ai6cUWcoElpzz0NLMwlX+LaBlC3uv32
	TIeApNZATZ7sQazt+2+KZ0kWmcHm64Mio3qIIMOuUgGYwKSimby062eMiR05m1cbdmU2lLG5koZ
	tR++umLTy/g7QkfdaTykszqaET8n4M7hztDle60iThQqrGgij1w3is5rjRChYxmCq/Z+sYx2Vmz
	V/dsjmdzBf3gKlxR0KSv3/ba10cwmAzgV4KWq/IILAg2mu49kt7r4=
X-Gm-Gg: AYBFou0vuHq9LO7ywhQy3Pkt5jQ2+hqEV3Yj58D771dcS3tw/6jpYPq1DVA2IFzzizt
	wH1zqlACeHEdpCAUwz0IZrDyKFHJBPpnouklOdeY1K4VsuSC23LJgQm1zmyMsxoy04U65WU/k9X
	QyznzCC+x/PL7N7iwDxs4S5Y9hTPc4RQp/WnBTPDwxGxH/szWg9d3AIwfFxU3ZRc9PPNacro7TP
	CYewbsSlHLtwVZ6YA==
X-Received: by 2002:a05:6214:411d:b0:91c:168:15e5 with SMTP id 6a1803df08f44-91c48e85e2cmr56217126d6.50.1792904803346;
        Sat, 24 Oct 2026 22:06:43 -0700 (PDT)
X-Received: by 2002:a05:6214:411d:b0:91c:168:15e5 with SMTP id
 6a1803df08f44-91c48e85e2cmr56216856d6.50.1792904802767; Sat, 24 Oct 2026
 22:06:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com> <6701264D162D4F00+179238891654.72905.12844513368292585993@linux.spacemit.com>
In-Reply-To: <6701264D162D4F00+179238891654.72905.12844513368292585993@linux.spacemit.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 10:36:31 +0530
X-Gm-Features: AclHuK_h3WxMEeOZjvDAWmFDqYnMDCD3-2Th7BkSuqCOZGQF5mYxDCUd0EB3y7I
Message-ID: <CAFR3w35wL+7hCQ_CCkC+M01G6bAZM_iMqFUBs6jti+Xk0ATW5g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/4] Add Smsdid and Smmpt supervisor domain protection
To: Huamao Wu <huamao.wu@linux.spacemit.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup.patel@oss.qualcomm.com>,
        Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>,
        Huamao Wu <huamao.wu@spacemit.com>, lufei.zheng@spacemit.com
X-Proofpoint-GUID: 71KcZX4bqHmt8dOhMb3xblaenXQj_6lz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyMCBTYWx0ZWRfXxMA6PT8b8Au5
 Ah61l4vURqRZt63VDQXq76QM0b6HjnsxYpjccz1dVXPOU5JGrvCQS05BTRLFES31qTEXxSVKdgz
 Qz/5mLK/b36zyHDbuLkLNAM3OwRzdii1DqObHmEol4ZngG08YdB1I41MDpfhd1/QhouBwypVjSc
 3txOKV6mr6z5swfExvpRmBEzyOimL0JB01MLm3qPpsWZGIzxRtG97OYpNVl5ndT9M00n/lhpBzE
 gEgulvg4CPYHrZ/3ARkOZ5t7tXK4w3lt9cYb4DqZB7xRwXXLCGr2hUKCL3qxBtWs8l3bhz9zTfQ
 mnaotaY0BR8EmuvFkwrYOiZ8I2+8GFkfE4V83aA7kuT+QlUmFYm5WIjw65XptZfo/BXi37DixOZ
 2QwB7thjTFFVO3CixdNtALjggXXlnEdPNhDVDoChsNMsq9wlcgx3Q2kcQVJOYWyo73t2m3ie6lg
 jAR4FZWOe7RCL9OMYxA==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6add8e64 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=lv0vYI88AAAA:8 a=h8n_gqfAowaz__CwPTQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-ORIG-GUID: 71KcZX4bqHmt8dOhMb3xblaenXQj_6lz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyMCBTYWx0ZWRfX6CrJmmCdwvJY
 Nv/onJlokb7yNhyPLbbtzhr+hO+oy44wNoUUYV269E2ekDaPmxgFPYf3u5kF5zsN+hoI2IHcz4J
 5q9/OP5HZcNIsxC2jqcIQ5G+RgwpksI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_220646_037421_AD721A8C 
X-CRM114-Status: GOOD (  26.42  )
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjaywgSSBoYXZlIGNvbW1lbnRzIGlubGluZQoKT24g
TW9uLCBPY3QgMTksIDIwMjYgYXQgMTE6MTnigK9BTSBIdWFtYW8gV3UgPGh1YW1hby53dUBsaW51
eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+Cj4gSGkgUmFodWwsCj4KPiBPbmUgZGVzaWduIHBvaW50
IG9uIHRoZSBTRElEIGFzc2lnbm1lbnQuCj4KPiBtcHRfc3RhdGVfc2V0dXAoKSBjdXJyZW50bHkg
YWxsb2NhdGVzIG9uZSBTRElEIHBlciBTQkkgZG9tYWluLCBhdCBkb21haW4KPiByZWdpc3RyYXRp
b24gdGltZSwgdGFraW5nIHRoZSBmaXJzdCBmcmVlIGJpdDoKPgo+ICAgICBmb3IgKHNkaWQgPSAw
OyBzZGlkIDwgY3RybC0+bWF4X2RvbWFpbnM7IHNkaWQrKykKPiAgICAgICAgICAgICBpZiAoYml0
bWFwX3Rlc3QoY3RybC0+c2RpZF9iaXRtYXAsIHNkaWQpKQo+ICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gICAgIGlmIChzZGlkID49IGN0cmwtPm1heF9kb21haW5zKQo+ICAgICAgICAgICAg
IHJldHVybiBTQklfRU5PU1BDOwo+Cj4gU0RJRExFTiBpcyBpbXBsZW1lbnRhdGlvbiBkZWZpbmVk
IGFuZCBtYXkgYmUgYXMgc21hbGwgYXMgMSwgaS5lLiB0d28gU0RJRHMgaW4KPiB0b3RhbC4gT3Bl
blNCSSBkb21haW5zIGFyZSBhbHNvIHVzZWQgZm9yIHB1cnBvc2VzIHVucmVsYXRlZCB0byBNUFQg
KHBlci1oYXJ0Cj4gUE1QIHBhcnRpdGlvbmluZywgcGVyLWRvbWFpbiBNUFhZIGNoYW5uZWxzLCBJ
UEkgZ3JvdXBpbmcpLCBzbyBhIHBsYXRmb3JtIGNhbgo+IGVhc2lseSBoYXZlIG1vcmUgZG9tYWlu
cyB0aGFuIFNESURzIHdoaWxlIG9ubHkgb25lIG9yIHR3byBvZiB0aGVtIGFjdHVhbGx5Cj4gbmVl
ZCBhIHNlcGFyYXRlIE1QVC4gT24gc3VjaCBoYXJkd2FyZSB0aGUgY3VycmVudCBiaW5kaW5nIHR1
cm5zIGEKPiBjb25maWd1cmF0aW9uIGNob2ljZSBpbnRvIGEgYm9vdCBmYWlsdXJlOiBTQklfRU5P
U1BDIHByb3BhZ2F0ZXMgZnJvbQo+IG1wdF9zdGF0ZV9zZXR1cCgpIHRvIHNiaV9kb21haW5fZmlu
YWxpemUoKSBhbmQgc2JpX2luaXQoKSBlbmRzIHVwIGNhbGxpbmcKPiBzYmlfaGFydF9oYW5nKCku
IE5vdGUgdGhhdCBzYmlfbXB0X2luaXQoKSBhbHJlYWR5IHRyZWF0cyBtaXNzaW5nIFNtbXB0Cj4g
aGFyZHdhcmUgYXMgbm9uLWZhdGFsIChyZXR1cm5zIFNCSV9FTk9ERVYgYW5kIHNiaV9oYXJ0X2lu
aXQoKSBpZ25vcmVzIGl0KSwgc28KPiAibm90IGVub3VnaCBTRElEcyIgaXMgaGFuZGxlZCBtb3Jl
IHN0cmljdGx5IHRoYW4gIm5vIFNtbXB0IGF0IGFsbCIuCgpBIHNlbnNpYmxlIGhhcmR3YXJlIGRl
c2lnbmVkIHdpdGggU01NUFQgd2lsbCBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0CnRoZXJlIGFyZSBz
dWZmaWNpZW50IFNESURMRU4gdG8gc3VwcG9ydCB0aGUgdXNlIGNhc2VzIGZvciB3aGljaCB0aGF0
CmhhcmR3YXJlIGlzIG1lYW50IGZvci4gSXQgaXMgZXhhY3RseSBsaWtlIGhhdmluZyBhIHN5c3Rl
bSB3aXRoIDAgUE1QIGVudHJpZXMKdGhvdWdoIGl0cyBhbGxvd2VkIGJ1dCB0aGUgUklTQy1WIElT
QS4KClRoZSBjdXJyZW50IGRlc2lnbiBrZWVwcyAxOjEgbWFwcGluZyBiZXR3ZWVuIHRoZSBTQkkg
ZG9tYWluIGFuZCB0aGUgTVBUIGRvbWFpbi4KV2hpY2ggbWVhbnMgZWFjaCBTQkkgZG9tYWluIHdp
bGwgaGF2ZSBhIE1QVCBkb21haW4gYWxvbmcgd2l0aCBhIFNESUQgYXNzaWduZWQuCkZyb20gYSBt
ZW1vcnktaXNvbGF0aW9uIHN0YW5kcG9pbnQsIGEgU0JJIGRvbWFpbiBpcyB0aGUgc29mdHdhcmUg
Y29uc3RydWN0IHRoYXQKU01NUFQgZW5mb3JjZXMgaW4gaGFyZHdhcmUuCgpUaGlzIGtlZXBzIHRo
ZSBkZXNpZ24gYW5kIGlzb2xhdGlvbiBtb2RlbCBzaW1wbGUgYW5kIGF2b2lkcyBhbGwgc29ydHMK
b2YgcHJvYmxlbXMKd2hpY2ggeW91IGhhdmUgaGlnaGxpZ2h0ZWQuCgpUaGUgY3VycmVudCBlcnJv
ciBoYW5kbGluZyBpcyB0aGUgcmVzdWx0IG9mIGRlc2lnbiBhc3N1bXB0aW9ucyBwbHVzCndoYXQg
c3BlYyBzdGF0ZXMtCgotIElmIHRoZSBTTU1QVCArIFNNU0RJRCBib3RoIGFyZSBub3QgcHJlc2Vu
dCB0aGVuIHRoZSBzeXN0ZW0gY2FuCmZ1bmN0aW9uIHdpdGhvdXQgaXQKYW5kIFNCSSBkb21haW4g
YmFja2VkIGJ5IFBNUC9lUE1QIHdpbGwgd29yay4KCi0gSWYgdGhlIFNNTVBUICsgU01TRElEIGFy
ZSBwcmVzZW50IHRoZW4gYW55IGVycm9yIGluIHRoZQppbml0aWFsaXphdGlvbiB3aGljaCBhbHNv
CmluY2x1ZGVzIG5vdCBoYXZpbmcgc3VmZmljaWVudCBTRElEcyBzaG91bGQgcmVzdWx0IGluIGEg
ZmF0YWwgZXJyb3IuIE90aGVyd2lzZQpTQkkgZG9tYWluIGJhY2tlZCBieSAoUE1QL2VQTVAgKyBN
UFQpIHdpbGwgYmUgdGhlIGVuZm9yY2VyLgoKVGhlIGNvc3Qgb2Ygc2hhcmluZyBTRElEIGlzIGh1
Z2Ugd2hpY2ggaW52b2x2ZXMgYSBzeXN0ZW0gd2lkZSBtZmVuY2UgcmVzdWx0aW5nCmluIHBlcmZv
cm1hbmNlIGlzc3Vlcy4gSWYgdHdvIGRvbWFpbnMgc2hhcmUgYW4gU0RJRCBidXQgaGF2ZSBkaWZm
ZXJlbnQKTVBUIHRhYmxlcwp0aGVuIHRoZSBTRElEIHRhZ2dlZCBNUFQvVExCIGNhY2hpbmcgZm9y
Y2VzIGEgbWZlbmNlIG9mIHRoYXQgU0RJRCBvbiBldmVyeQpkb21haW4gc3dpdGNoIGJldHdlZW4g
dGhlbSB3aGljaCBkaXNjYXJkcyB0aGUgb3B0aW1pemF0aW9uIHRoZSBTRElEIHRhZyBleGlzdHMK
Zm9yIGFuZCBtYWtpbmcgdGhlIHN3aXRjaCBzbG93ZXIuCgpJIHdpbGwgY2hhbmdlIHRoZSBjdXJy
ZW50IGhhbmRsaW5nIG9mIGNhYXNlIHdoZXJlIFNESURzIGFyZSBub3Qgc3VmZmljaWVudAphbmQg
bWFrZSBpdCBkaWFnbm9zYWJsZSBpbnN0ZWFkIG9mIG1ha2luZyBpcyBmYXRhbCBzaWxlbnRseSBy
YXRoZXIgdGhhbgptYWtlIFNESUQgYXNzaWdubWVudCBvcHQtaW4uIEkgd2lsbCBhbHNvIG1ha2Ug
U0RJRCBwYXJ0IG9mIHRoZSBEVCBub2Rlcwpmb3IgU0JJIGRvbWFpbnMuCgo+Cj4gUHJvcG9zYWw6
IG1ha2UgdGhlIFNESUQgYXNzaWdubWVudCBvcHQtaW4gcGVyIGRvbWFpbiBpbnN0ZWFkIG9mIGlt
cGxpY2l0IGZvcgo+IGV2ZXJ5IGRvbWFpbi4KPgo+ICAtIEFkZCBhbiBvcHRpb25hbCB1MzIgcHJv
cGVydHkgInNkaWQiIHRvIHRoZSBvcGVuc2JpLGRvbWFpbixpbnN0YW5jZSBub2RlLgo+ICAgIFdo
ZW4gYWJzZW50LCB0aGUgZG9tYWluIHJ1bnMgdW5kZXIgU0RJRCAwLCBpLmUuIHVuZGVyIHRoZSBy
b290IGRvbWFpbidzCj4gICAgTVBULCBhbmQgcmVsaWVzIG9uIFBNUCBmb3IgaXRzIG93biBpc29s
YXRpb24uCj4gIC0gVGhlIE1QVCBvZiBTRElEIE4gaXMgYnVpbHQgZnJvbSB0aGUgbWVtcmVnaW9u
cyBvZiB0aGUgZG9tYWluIHRoYXQgb3ducyBOLgo+ICAgIFNESUQgMCBpcyBhbHdheXMgb3duZWQg
YnkgdGhlIHJvb3QgZG9tYWluIGFuZCBpdHMgdHJlZSBpcyBidWlsdCBvbmNlLgo+ICAgIERvbWFp
bnMgYWxpYXNpbmcgdG8gYW4gYWxyZWFkeS1vd25lZCBTRElEIGRvIG5vdCBnZXQgYSB0cmVlIG9m
IHRoZWlyIG93bi4KPiAgLSBBbiBleHBsaWNpdCAic2RpZCIgbXVzdCBiZSA8IDJeU0RJRExFTiBh
bmQgdW5pcXVlIGFjcm9zcyBkb21haW5zLgo+ICAtIEEgZG9tYWluIGFsaWFzaW5nIHRvIFNESUQg
TiBtdXN0IHN0aWxsIHByb2dyYW0gbW1wdCBleHBsaWNpdGx5IG9uCj4gICAgYWN0aXZhdGlvbi4g
UmlnaHQgbm93IHNiaV9tcHRfaGFydF9hY3RpdmF0ZV9mb3JfZG9tYWluKCkgcmV0dXJucyAwIHdo
ZW4KPiAgICAhc2QtPnZhbGlkIGFuZCBzYmlfbXB0X2hhcnRfZGVhY3RpdmF0ZSgpIGlzIGVtcHR5
LCBzbyBhIGhhcnQgc3dpdGNoZWQgYXdheQo+ICAgIGZyb20gYW4gTVBULWJhY2tlZCBkb21haW4g
a2VlcHMgdGhlIHByZXZpb3VzIFNESUQgaW4gbW1wdCBhbmQgd291bGQgcnVuCj4gICAgdW5kZXIg
dGhlIHByZXZpb3VzIGRvbWFpbidzIE1QVC4gVG9kYXkgZXZlcnkgZG9tYWluIGhhcyBhIHZhbGlk
IHRyZWUgc28KPiAgICB0aGlzIGlzIG5vdCByZWFjaGFibGUsIGJ1dCB3aXRoIG9wdC1pbiBhc3Np
Z25tZW50IGl0IGJlY29tZXMgdGhlIG5vcm1hbAo+ICAgIHBhdGguCj4gIC0gV2hlbiBTRElETEVO
IGlzIHNtYWxsZXIgdGhhbiB0aGUgbnVtYmVyIG9mIGV4cGxpY2l0bHkgcmVxdWVzdGVkIFNESURz
LAo+ICAgIHJlcG9ydCBpdCBhbmQgY29udGludWUgd2l0aCB0aGUgZG9tYWlucyB0aGF0IGZpdCBy
YXRoZXIgdGhhbiBoYW5naW5nLgo+Cj4gVGhpcyBrZWVwcyB0aGUgY29tbW9uIGNhc2UgKFBNUC1v
bmx5IHBsYXRmb3JtLCBTbW1wdCBjYXBhYmxlIGhhcnQpIHdvcmtpbmcKPiB3aXRob3V0IGFueSBN
UFQgbWVtb3J5LCBhbmQgbGV0cyBhIHBsYXRmb3JtIHdpdGggU0RJRExFTj0xIHJ1biByb290IHBs
dXMgb25lCj4gcHJvdGVjdGVkIGRvbWFpbi4KPgo+IFRoZSBhc3N1bXB0aW9uIGJlaGluZCBkZWZh
dWx0aW5nIHRvIFNESUQgMCBpcyB0aGF0IFBNUC9lUE1QIHJlbWFpbnMgdGhlCj4gcHJpbWFyeSBt
ZW1vcnkgcHJvdGVjdGlvbiBmb3IgZG9tYWlucyB3aXRob3V0IHRoZWlyIG93biBTRElEOyBTbW1w
dCBpcwo+IGxheWVyZWQgb24gdG9wIChzYmlfaGFydF9wcm90ZWN0aW9uX2NvbmZpZ3VyZSgpIGFw
cGxpZXMgdGhlIFRZUEVfTUVNT1JZCj4gcHJvdGVjdGlvbiBhbmQgdGhlIFRZUEVfSUQgcHJvdGVj
dGlvbnMgaW5kZXBlbmRlbnRseSwgc28gdGhlIGVmZmVjdGl2ZQo+IHBlcm1pc3Npb24gb2Ygc3Vj
aCBhIGRvbWFpbiBpcyBpdHMgUE1QIGVudHJ5IHNldCBpbnRlcnNlY3RlZCB3aXRoIHRoZSBTRElE
IDAKPiBNUFQpLiBJZiB0aGUgaW50ZW50IGlzIGZvciBTbW1wdCB0byByZXBsYWNlIFBNUCBvbiBz
b21lIHBsYXRmb3JtcywgdGhlbgo+IHNoYXJpbmcgU0RJRCAwIGlzIG5vdCBzYWZlIGFuZCB0aGlz
IHByb3Bvc2FsIGRvZXMgbm90IGFwcGx5Lgo+Cj4gUmVnYXJkcywKPiBIdWFtYW8gV3UKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
