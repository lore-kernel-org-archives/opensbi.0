Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0ECCC6B1A
	for <opensbi@archiver.kernel.org>; Tue, 13 Oct 2026 19:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbkYdXxKu91uUc5REaHT0NtSEBM8A4Qi1H3tKkUHheI=; b=fUs/6bg6cfr9Cq
	2RJInBbg9qIOrY8LDJDMCObLJMb9T9ZvQD4kU0fbnahJOYEfRJlUWduSm737+hyX7VuSb4UTHDmh7
	U+RoaPFC+VfeQepm9sm1E6KqBDTeOcSfwY3ovn/V4wumBBgGVFLl+XFOatEN/c1gF004qEu4yMZ2+
	j1lctpfcV3i5Hh2oxw/TRPdrvuRUgViT+QSUzpSaHY69/HDwE5bZDv2aoblWZFr7ofb+JFX6ShY+7
	jczYwQSv6st2ZNI/LG8XsfPGEBULZ5q5AnVtQCNGkA1/5YdjQ3kiaOm/v96KW44rIs98ZKimmM4/U
	GqSCSwc7jmwxe+hj3lDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiTL-0000000Dx7t-3hfA;
	Tue, 13 Oct 2026 19:47:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiTK-0000000Dx70-0buB
	for opensbi@bombadil.infradead.org;
	Tue, 13 Oct 2026 19:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=elWrupa7uygoaXaWtB+0X1q9cxqAD298/BFU6h1o+fE=; b=iJhNiuLhrOta8GuCIL7BdiEO1f
	CYwCDLHiP0ilfmCvJ4JWUfxJfvKZUn+MJeaNgj/EH7Mr31iEoPH3EoyRfE1kMgvYiCT71zkmApMZQ
	UnsbDVKOsnWXo8Svb7fzGvUJFnd6sK4LOfRf+WYaRcGVvweIQc/etTLEGJVzQ1QZYoCtIQj6XJvd7
	tayNI4NhaxTeqBnc5JeTKJxi4PbVQn3CS2IgD4RuNBDB4swRzmsr5qBRWm87Mjer5QKtlhg7qPKTS
	bgOIKaR05NobnnffTQ4BgE0BUVytS50aFXnTymvvtWgYgV6iUWP9RlNnxT06AXkPsUAjzNcRGVK34
	fdd71q9g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGiTG-0000000G0Va-08Qg
	for opensbi@lists.infradead.org;
	Tue, 13 Oct 2026 19:47:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHuwBD1125314
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	elWrupa7uygoaXaWtB+0X1q9cxqAD298/BFU6h1o+fE=; b=kMkY85DcwbM+i5+e
	RItPSQdwMiY+oWgY6hJBaU6lYK4vcGEbI0O4mtHGOovAmgEB6d0Cik5S3XCaDoEG
	COlcjasgN73gUnKLNizZhcvOs3SaeloI5tI8Ft0iUpB4xEZeGiNhg/iY7y6jme93
	NEA44/AFhIGxnf+uOm7mOYAKlNu1etGerTp+tbyc/9VB+ZKIjGd3/8IbgJSR+DrL
	XT6ZpMfuTzO4vF9e48XHdPR+b+FBbHtRirKXnfdpmT+PaYM+z+pe1j8+9xh4cpBO
	o8KUmj7GBFeekfpAOQrXxJ0ii6wIQcwDSjE7bdBJtnsETee4hPaLoiqvQZDFCKVO
	NfhaBA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sg80ghd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:47:29 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-823c86bb798so2539336a34.0
        for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 12:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791920849; cv=none;
        d=google.com; s=arc-20260327;
        b=BdUwA22JLJ/HFZ2pYu6R2LbiisS/k7TOqaAdrwpcT5DJRy+ATbll5SvJYxRIfuxRyF
         PCDZTiTprL8rVx/zoPOCaxv9fP3K+T8QLg6zcJSrYKkb5/vdVgTNR94872myE+i7AI/j
         LoPCvXqDK6ct4fZe1aApm2+6BSUR00vDTCyvVQ0HeXak/I+OY8nhj1WSbg0181ZaHZsV
         j1ldgMywKdmM4CPfIkmsj8Y5p1rz4sGKLVYvvmdztIdUXiBwCztJjj9HxBOwao/I9Q6r
         kacIQE3aIQScghwF+Xp8hRKBs8Q3XgMRcqUgz0A55jWg5GTApPO0OxwJwZVMH6hV/i/m
         GgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=elWrupa7uygoaXaWtB+0X1q9cxqAD298/BFU6h1o+fE=;
        fh=fVA/kjY7PY0REEdtqTW5C7vvXsQBhouIjXSNoFqJ270=;
        b=DjibUyUIbL1f2OJ6nrTLdk3Zch3vH87v3MLpqWg82U4CvWYR0n2Dx9Kdiurx5+ocRM
         5LHH1jcHuE8xfiooSX73Zp76FmVnypEkeVsIVCpQn9kvrwYnMwn2dFRtVYMS1E9RI8Xo
         14o/JMxR6ltixVoClwl1u6Z32pPVyeg5v8JfIECikJZXb1KHGlZGPu9v+jMztfvl63lY
         mZIKp8HsXQ2ZTlw7SzI6agx35Io6qXM/aeJFr/dvvQ0sWHlKig2MQx2/9TUMQINWQgtQ
         YE2ekH4W2VVbOmk3wQ2gBUxSDubL+FLlbxKSqxmCfqBW3lILICoX0MS33L4K14SG0jIq
         oM7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791920849; x=1792525649; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elWrupa7uygoaXaWtB+0X1q9cxqAD298/BFU6h1o+fE=;
        b=a3ZU9YfIWYQMhXtVPgSsYL1eve1hgiMnbLZrOGtexbXLa6G0Wn3sZLK/3f13H5AJyx
         MoKHVh4KVpeCTYl9CFVwqN6zaTCCAJ7J5L66dZNKi6rDGcqhAV0kBD5lT4+s+a1JFtFC
         Uf5pkUZzjaKooaf43VEuoYX0mZ73LFejP7iECXF3iSFUfrzwimYKh0EqOYZcEPXE16x4
         gEK65C5/bu+CnnBTub5vEvPa3ohJaR0l0Pu4ltClwKGFs/lzR4PKOgDLh6Ph2IhFcbAT
         y/xTdL0HBeBDY/Xc44CAzOgJUv35BhnHQKAVaiTLh1Zo1TczS5Iip0qD/k1woeUp0vwN
         m5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920849; x=1792525649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elWrupa7uygoaXaWtB+0X1q9cxqAD298/BFU6h1o+fE=;
        b=EjSJXRSFGt2WSPZpkW8/lXZvBOPezWMpLV+SPEZgi/SYjYOPfpEqSDy+gRVxPgdTXt
         9Ra9S7EUuvTC1SnsSEo7ypx5hAl60wQbXmYLKo5Nuk9gUGZwcs5AJ1PbsiT6KV8wYhfG
         jCzbMDYYryWujO0nw0ovGJ0JwKFdaZOP7qKRE3SHj4AAbpeZWK8ASlAigq/RiOX9E3Io
         jXH3Cj9JRN3LjPGasIOL+wieKNice7KATviHNDITgeucFfFwyBmwwPjFYVaiNhKn/mKg
         UL8dSQn4/SS3f2twBAQ1HaHxvDrirfBaPf4hfWWkwyaRoD+zIknzOsfgIlQNDR311xY8
         0R7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy1mUp7ERlQe2YAOcqb7dfMOb5/Ajj7SL66YBfV3Ad1M+XnaFSmPTUcHj2TBhsXj+eHEpfNST7c@lists.infradead.org
X-Gm-Message-State: AFq9FYLxBVlhw1lHxwmolXvA76Y7T58AQPM4KSRDBLZhbmnOfCoJ0Pza
	4QpltksMaEIAZJTBRFNqd82MGT7h+DFFNqyOyLfLFV166mZOoS9WINZP9Jwl4MEwpmVCWBUYTSb
	b2h+zhZQ5wK0Pm+Gk+gHgWtxRERUxOm7cnEc4k3e1cCospOuzozHfz3oZSj6bHEX6bHWnWzHQq4
	cbgz8Mv9wxgKXbqUj9dJon14/fUS2bYHEPAzKCZnT6
X-Gm-Gg: AYBFou1VIE30fXC0/oDd9ZdFHKiMAEM91eSYh5vjvXL0ZeykHb70o2W2Zassa7OQEEf
	aRK3mTuwkZvOcGk3hMEUMNPV8Qyecmc0Oxqzj4asb6RMdlNSudVh6GZpPVIMbPdj4TFAIfrXhlD
	b4k0lfQsHRHyNU7FkIX2jzQFkmLtOSdLNtWW+ThlRYfHxWvm5KIumOIx4A7GA=
X-Received: by 2002:a05:6820:4c03:b0:6b7:8396:f3d6 with SMTP id 006d021491bc7-6ef0f3adb6dmr10309320eaf.56.1791920848761;
        Tue, 13 Oct 2026 12:47:28 -0700 (PDT)
X-Received: by 2002:a05:6820:4c03:b0:6b7:8396:f3d6 with SMTP id
 006d021491bc7-6ef0f3adb6dmr10309305eaf.56.1791920848338; Tue, 13 Oct 2026
 12:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com> <20260923032359.4041876-9-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260923032359.4041876-9-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:47:17 -0700
X-Gm-Features: AclHuK-Wdx5smeWoeXvU5Yt1zrisY79gGxyNSwYGuuuI9VxR1qBRFhBf980-9mc
Message-ID: <CAAVgOkKvtqvHkBm6n=5WHJj6VSoeNVZBy5mubfOovvAB2fQbDQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] lib: sbi_domain: Allow adding memrange to a
 particular domain from drivers
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-GUID: ImaKSbMFZqZLZFdMTNY_bjbuleLzcrZy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX6X2TEtBtWGs1
 Ebd+M9/qe4O50cysAm1j9Hv2QH307YReXwFyfYpleVNC6pNVlzFVGCRkCZmkYXoNCyQ+XeHCFlb
 yTxfQjPUDnPXWD3KWXhaJPwaiLccxuU=
X-Proofpoint-ORIG-GUID: ImaKSbMFZqZLZFdMTNY_bjbuleLzcrZy
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6ace8ad1 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=cunDA0lkCjALyaQRsOQA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX/Mw+fh9PJlwT
 CMqW8Sej/s7trIm3V9cJ/b7A5+ellMJqWiSRCX8pm8UDmf8jxQ60nHRkuSIpk+TTt5X3iEGT1ov
 4q0sJaZpjQklG6Le17iv7VibkEQ1HTu1cM86w90VeZSGivERFuLHDvdqBzTOzvA1Tj8bKeAmd4f
 Z/4TqG2sMQ+sR3+SYu2iBrS+9MKdSlWNRPxYLXJ4hZnBAF8g9kwvTutFdkb/nLA6bkdxCs69I+t
 PadcCe3NJDlNv0qSukFwSHK5sEB+oUHwZvGtpxymQOrhtDgjWKYvzlKpvA6Eo3pT9LMZ8syz6a4
 STLZHOH5zNK0CTkVh0U/2iFLyDvsUAnbBCMH7EkndoxCk4VaGuLWa6eGkMJJr0RjRHqrzFftxVH
 pABx00wEs1EXXpRh0/XoYOpi502j+5X1Z/U3rtL49R7H6NIvtIZS72xRtArRoTin20xqS/eC3Xx
 XQ6Iain7Wij+4H8SlLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_204734_493513_312A3A1A 
X-CRM114-Status: GOOD (  28.46  )
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgODoyNOKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIG1lbXJlZ2lvbnMgb2Ygbm9u
LXJvb3QgZG9tYWluIG9ubHkgcG9wdWxhdGVkIGF0IGRvbWFpbiBjcmVhdGlvbgo+IHRpbWUgd2hp
Y2ggbm90IGZsZXhpYmxlIGZvciBkcml2ZXJzIHdoaWNoIGNyZWF0ZSBkb21haW4gc3BlY2lmaWMg
cmVzb3VyY2VzCj4gKHN1Y2ggYXMgTVBYWSBjaGFubmVscykuIEFkZCBuZXcgc2JpX2RvbWFpbl9h
ZGRfbWVtcmFuZ2UoKSBmdW5jdGlvbiB3aGljaAo+IGFsbG93cyBhZGRpbmcgbWVtcmFuZ2UgdG8g
YW55IGRvbWFpbiBhdCBib290IHRpbWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9kb21h
aW4uaCB8IDIzICsrKysrKysrKysrKysrKysrKysrKy0tCj4gIGxpYi9zYmkvc2JpX2RvbWFpbi5j
ICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4g
aW5kZXggNWU1YjIyMjcuLmQ1MzBmOTM5IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9k
b21haW4uaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+IEBAIC0zNDUsNiArMzQ1
LDIyIEBAIHZvaWQgc2JpX2RvbWFpbl9kdW1wX2FsbChjb25zdCBjaGFyICpzdWZmaXgpOwo+ICAg
Ki8KPiAgaW50IHNiaV9kb21haW5fcmVnaXN0ZXIoc3RydWN0IHNiaV9kb21haW4gKmRvbSk7Cj4K
PiArLyoqCj4gKyAqIEFkZCBhIG1lbW9yeSByYW5nZSB3aXRoIGl0cyBmbGFncyB0byBhIGRvbWFp
bgo+ICsgKiBAcGFyYW0gZG9tIHBvaW50ZXIgdG8gZG9tYWluCj4gKyAqIEBwYXJhbSBhZGRyIHN0
YXJ0IHBoeXNpY2FsIGFkZHJlc3Mgb2YgbWVtb3J5IHJhbmdlCj4gKyAqIEBwYXJhbSBzaXplIHBo
eXNpY2FsIHNpemUgb2YgbWVtb3J5IHJhbmdlCj4gKyAqIEBwYXJhbSBhbGlnbiBhbGlnbm1lbnQg
b2YgbWVtb3J5IHJlZ2lvbgo+ICsgKiBAcGFyYW0gcmVnaW9uX2ZsYWdzIG1lbW9yeSByYW5nZSBm
bGFncwo+ICsgKgo+ICsgKiBAcmV0dXJuIDAgb24gc3VjY2Vzcwo+ICsgKiBAcmV0dXJuIFNCSV9F
QUxSRUFEWSBpZiBtZW1vcnkgcmVnaW9uIGNvbmZsaWN0cyB3aXRoIHRoZSBleGlzdGluZyBvbmUK
PiArICogQHJldHVybiBTQklfRUlOVkFMIG90aGVyd2lzZQo+ICsgKi8KPiAraW50IHNiaV9kb21h
aW5fYWRkX21lbXJhbmdlKHN0cnVjdCBzYmlfZG9tYWluICpkb20sCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFsaWduLCB1bnNpZ25lZCBs
b25nIHJlZ2lvbl9mbGFncyk7Cj4gKwo+ICAvKioKPiAgICogQWRkIGEgbWVtb3J5IHJhbmdlIHdp
dGggaXRzIGZsYWdzIHRvIHRoZSByb290IGRvbWFpbgo+ICAgKiBAcGFyYW0gYWRkciBzdGFydCBw
aHlzaWNhbCBhZGRyZXNzIG9mIG1lbW9yeSByYW5nZQo+IEBAIC0zNTYsOCArMzcyLDExIEBAIGlu
dCBzYmlfZG9tYWluX3JlZ2lzdGVyKHN0cnVjdCBzYmlfZG9tYWluICpkb20pOwo+ICAgKiBAcmV0
dXJuIFNCSV9FQUxSRUFEWSBpZiBtZW1vcnkgcmVnaW9uIGNvbmZsaWN0cyB3aXRoIHRoZSBleGlz
dGluZyBvbmUKPiAgICogQHJldHVybiBTQklfRUlOVkFMIG90aGVyd2lzZQo+ICAgKi8KPiAtaW50
IHNiaV9kb21haW5fcm9vdF9hZGRfbWVtcmFuZ2UodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25l
ZCBsb25nIHNpemUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBh
bGlnbiwgdW5zaWduZWQgbG9uZyByZWdpb25fZmxhZ3MpOwo+ICtzdGF0aWMgaW5saW5lIGludCBz
YmlfZG9tYWluX3Jvb3RfYWRkX21lbXJhbmdlKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQg
bG9uZyBzaXplLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgYWxpZ24sIHVuc2lnbmVkIGxvbmcgcmVnaW9uX2ZsYWdzKQo+ICt7Cj4gKyAg
ICAgICByZXR1cm4gc2JpX2RvbWFpbl9hZGRfbWVtcmFuZ2UoJnJvb3QsIGFkZHIsIHNpemUsIGFs
aWduLCByZWdpb25fZmxhZ3MpOwo+ICt9Cj4KPiAgLyoqIFN0YXJ0dXAgbm9uLXJvb3QgZG9tYWlu
cyAqLwo+ICBpbnQgc2JpX2RvbWFpbl9zdGFydHVwKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRj
aCwgdTMyIGNvbGRfaGFydGlkKTsKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMg
Yi9saWIvc2JpL3NiaV9kb21haW4uYwo+IGluZGV4IGMyOGVlYmE2Li4xYzk1YjBmYyAxMDA2NDQK
PiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW4uYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5j
Cj4gQEAgLTcyMiwxNiArNzIyLDE2IEBAIGludCBzYmlfZG9tYWluX3JlZ2lzdGVyKHN0cnVjdCBz
YmlfZG9tYWluICpkb20pCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLXN0YXRpYyBpbnQg
cm9vdF9hZGRfbWVtcmVnaW9uKGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluX21lbXJlZ2lvbiAqcmVn
KQo+ICtzdGF0aWMgaW50IGFkZF9tZW1yZWdpb24oc3RydWN0IHNiaV9kb21haW4gKmRvbSwgY29u
c3Qgc3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9uICpyZWcpCj4gIHsKPiAgICAgICAgIGludCBy
YzsKPiAgICAgICAgIGJvb2wgcmVnX21lcmdlZDsKPiAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWlu
X21lbXJlZ2lvbiAqbnJlZywgKm5yZWcxOwo+IC0gICAgICAgaW50IHJvb3RfbWVtcmVnc19jb3Vu
dCA9IHNiaV9kb21haW5fdXNlZF9tZW1yZWdpb25zKCZyb290KTsKPiArICAgICAgIGludCBtZW1y
ZWdzX2NvdW50ID0gc2JpX2RvbWFpbl91c2VkX21lbXJlZ2lvbnMoZG9tKTsKPgo+ICAgICAgICAg
LyogU2FuaXR5IGNoZWNrcyAqLwo+ICAgICAgICAgaWYgKCFyZWcgfHwgZG9tYWluX2ZpbmFsaXpl
ZCB8fAo+IC0gICAgICAgICAgIChTQklfRE9NQUlOX01FTVJFR0lPTl9NQVggPD0gcm9vdF9tZW1y
ZWdzX2NvdW50KSkKPiArICAgICAgICAgICAoU0JJX0RPTUFJTl9NRU1SRUdJT05fTUFYIDw9IG1l
bXJlZ3NfY291bnQpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPgo+ICAg
ICAgICAgLyogQ2hlY2sgd2hldGhlciBjb21wYXRpYmxlIHJlZ2lvbiBleGlzdHMgZm9yIHRoZSBu
ZXcgb25lICovCj4gQEAgLTc0MSwyNSArNzQxLDI1IEBAIHN0YXRpYyBpbnQgcm9vdF9hZGRfbWVt
cmVnaW9uKGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluX21lbXJlZ2lvbiAqcmVnKQo+ICAgICAgICAg
fQo+Cj4gICAgICAgICAvKiBBcHBlbmQgdGhlIG1lbXJlZ2lvbiB0byByb290IG1lbXJlZ2lvbnMg
Ki8KPiAtICAgICAgIG5yZWcgPSAmcm9vdC5yZWdpb25zW3Jvb3RfbWVtcmVnc19jb3VudF07Cj4g
KyAgICAgICBucmVnID0gJmRvbS0+cmVnaW9uc1ttZW1yZWdzX2NvdW50XTsKPiAgICAgICAgIHNi
aV9tZW1jcHkobnJlZywgcmVnLCBzaXplb2YoKnJlZykpOwo+IC0gICAgICAgcm9vdF9tZW1yZWdz
X2NvdW50Kys7Cj4gLSAgICAgICByb290LnJlZ2lvbnNbcm9vdF9tZW1yZWdzX2NvdW50XS5vcmRl
ciA9IDA7Cj4gKyAgICAgICBtZW1yZWdzX2NvdW50Kys7Cj4gKyAgICAgICBkb20tPnJlZ2lvbnNb
bWVtcmVnc19jb3VudF0ub3JkZXIgPSAwOwo+Cj4gLSAgICAgICAvKiBTb3J0IGFuZCBvcHRpbWl6
ZSByb290IHJlZ2lvbnMgKi8KPiArICAgICAgIC8qIFNvcnQgYW5kIG9wdGltaXplIHJlZ2lvbnMg
Ki8KPiAgICAgICAgIGRvIHsKPiAtICAgICAgICAgICAgICAgLyogU2FuaXRpemUgdGhlIHJvb3Qg
ZG9tYWluIHNvIHRoYXQgbWVtcmVnaW9ucyBhcmUgc29ydGVkICovCj4gLSAgICAgICAgICAgICAg
IHJjID0gc2FuaXRpemVfZG9tYWluKCZyb290KTsKPiArICAgICAgICAgICAgICAgLyogU2FuaXRp
emUgdGhlIGRvbWFpbiBzbyB0aGF0IG1lbXJlZ2lvbnMgYXJlIHNvcnRlZCAqLwo+ICsgICAgICAg
ICAgICAgICByYyA9IHNhbml0aXplX2RvbWFpbihkb20pOwo+ICAgICAgICAgICAgICAgICBpZiAo
cmMpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogc2FuaXR5IGNo
ZWNrcyBmYWlsZWQgZm9yIgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAl
cyAoZXJyb3IgJWQpXG4iLCBfX2Z1bmNfXywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJvb3QubmFtZSwgcmMpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZG9tLT5uYW1lLCByYyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+
ICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgLyogTWVyZ2UgY29uc2VjdXRp
dmUgbWVtcmVnaW9ucyB3aXRoIHNhbWUgb3JkZXIgYW5kIGZsYWdzICovCj4gICAgICAgICAgICAg
ICAgIHJlZ19tZXJnZWQgPSBmYWxzZTsKPiAtICAgICAgICAgICAgICAgc2JpX2RvbWFpbl9mb3Jf
ZWFjaF9tZW1yZWdpb24oJnJvb3QsIG5yZWcpIHsKPiArICAgICAgICAgICAgICAgc2JpX2RvbWFp
bl9mb3JfZWFjaF9tZW1yZWdpb24oZG9tLCBucmVnKSB7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgbnJlZzEgPSBucmVnICsgMTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIW5yZWcx
LT5vcmRlcikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IEBA
IC03NjgsMTIgKzc2OCwxMiBAQCBzdGF0aWMgaW50IHJvb3RfYWRkX21lbXJlZ2lvbihjb25zdCBz
dHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24gKnJlZykKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKG5yZWctPmJhc2UgKyBCSVQobnJlZy0+b3JkZXIpKSA9PSBucmVnMS0+YmFzZSAmJgo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucmVnLT5vcmRlciA9PSBucmVnMS0+b3JkZXIg
JiYKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnJlZy0+ZmxhZ3MgPT0gbnJlZzEtPmZs
YWdzKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgaTEgPSBucmVnMSAt
IHJvb3QucmVnaW9uczsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBpMSA9
IG5yZWcxIC0gZG9tLT5yZWdpb25zOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bnJlZy0+b3JkZXIrKzsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9tZW1t
b3ZlKG5yZWcxLCBucmVnMSArIDEsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplb2YoKm5yZWcxKSAqIChyb290X21lbXJlZ3NfY291bnQgLSBpMSkpOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKCpucmVn
MSkgKiAobWVtcmVnc19jb3VudCAtIGkxKSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWdfbWVyZ2VkID0gdHJ1ZTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJvb3RfbWVtcmVnc19jb3VudC0tOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bWVtcmVnc19jb3VudC0tOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAg
ICAgICAgfQo+ICAgICAgICAgfSB3aGlsZSAocmVnX21lcmdlZCk7Cj4gQEAgLTc4MSw4ICs3ODEs
OSBAQCBzdGF0aWMgaW50IHJvb3RfYWRkX21lbXJlZ2lvbihjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFp
bl9tZW1yZWdpb24gKnJlZykKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtaW50IHNiaV9k
b21haW5fcm9vdF9hZGRfbWVtcmFuZ2UodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25n
IHNpemUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhbGlnbiwg
dW5zaWduZWQgbG9uZyByZWdpb25fZmxhZ3MpCj4gK2ludCBzYmlfZG9tYWluX2FkZF9tZW1yYW5n
ZShzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhbGlnbiwgdW5zaWduZWQgbG9uZyByZWdpb25fZmxh
Z3MpCj4gIHsKPiAgICAgICAgIGludCByYzsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgcG9zLCBl
bmQsIHJzaXplOwo+IEBAIC03OTksNyArODAwLDcgQEAgaW50IHNiaV9kb21haW5fcm9vdF9hZGRf
bWVtcmFuZ2UodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUsCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAoZW5kIC0gcG9zKSA6IGFsaWduOwo+Cj4gICAgICAg
ICAgICAgICAgIHNiaV9kb21haW5fbWVtcmVnaW9uX2luaXQocG9zLCByc2l6ZSwgcmVnaW9uX2Zs
YWdzLCAmcmVnKTsKPiAtICAgICAgICAgICAgICAgcmMgPSByb290X2FkZF9tZW1yZWdpb24oJnJl
Zyk7Cj4gKyAgICAgICAgICAgICAgIHJjID0gYWRkX21lbXJlZ2lvbihkb20sICZyZWcpOwo+ICAg
ICAgICAgICAgICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJj
Owo+ICAgICAgICAgICAgICAgICBwb3MgKz0gcnNpemU7Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0K
PiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmV2aWV3
ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KVGVz
dGVkLWJ5OiBQYXdhbmRlZXAgT3phIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cgot
LSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
