Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F02C43458
	for <opensbi@archiver.kernel.org>; Mon, 13 Jul 2026 21:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzK8ba9sXlYDsRHNZAMEIbB2wQ2tUKvSQz54C6rXT5M=; b=x+2gPm9e2gIBG6
	tJw2XK+A1wSeVK+oUbCx8xdN4u6pezMquYoK6zfWMoeW3jQR+KhBBZ5uZyu8uvwwKxrawJ7+2Ttov
	XvHTLigTBKim+rvP6c+mxzmqmErlPL8DfxWr9sPbrGfEgtPr4sU7nw/ZUOj0XnCEwkgNM0FXg6gR2
	7ueQBFqAyWIcGjvtFSjrn1303Y6fTDnDxnPt9O10HWWrr5qAVez9nDt7gp1ZTlc5coNqxtuOKielN
	t3GhEPzijAOISfW492zZftEDgHisUagHrTRt1c2ermB123+Mlxe5Yv13uW48JuAV33+4HD1k2Dar7
	wyImPXV7wZvCiX0l38qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjNxr-0000000AQKt-35i3;
	Mon, 13 Jul 2026 21:13:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjNxo-0000000AQKH-0jhq
	for opensbi@lists.infradead.org;
	Mon, 13 Jul 2026 21:13:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9Hga2470645
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 21:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTrge0M49F7zPiQ6K55hT3lgwZEmSHGYjrvkPBU7w20=; b=QptSusLlSLIVLMpU
	/ODKxObeozDnXgfnwBeH+9zgISjTZHyoU0WtkS7zatKCJjtk8QN9APj9ABnnHJS2
	3Y2Q8AfWRUG2YY3jv0SLYVUyCa7dtuDo5idn/aet4DPy6VVUVfd25jGY/xXHuEP7
	Tz8/xJOPHH6ydD6xmbiJ9bUl6jR76ggS/RSzQo8nQT02tqbk0pFoA+pcmegI9wXd
	IuoNgeot9LyVfl1c8+STdE2liZF60Zu7BPjKU1yV+XKA/QrJBLNLtNeh4gLt+HNg
	/brQwpglkdfl4EREZaEH9DvGXzb1Kut+F8Mo8szKOjv+/q8f4KUVe4JHx6tfsfrR
	L1nNeA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jrt38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 21:13:18 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a374e480daso578744eaf.1
        for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 14:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783977198; cv=none;
        d=google.com; s=arc-20260327;
        b=nRTz79j8ghtAKmpRQ7s5zq5aQxzR7ZSRObqFYmffPIuuS6PHpDHIqXRVxdXlUkk4ah
         HT9954hr4f2uuc+RYMShyBVA9pTxhPdVqo5xFJ4OifwDAA2L3Dj6GDsSq/d1h6FnH5/9
         r0areWSPiem1k0K95L/h5H80g3CF2O55k8lJ/IrviEb2oJXqXxVAV6uCisQGQ6Htlqsl
         KQ9Wj72KTKseGAt/Qxlkm6CT3ejgYaI/mfjeoIuAsnFYw1+tXtychUkFCFe8cPKxF4Qy
         nGkxUNTBNMm1M/uWSz6c2gdq1vf2llpQIRrvpgnV8/a4AHrg9LhIzFn3cXcQ8F5LUpQd
         XVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pTrge0M49F7zPiQ6K55hT3lgwZEmSHGYjrvkPBU7w20=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=gS4toWpym7db7/i7lOeHJ/RZKFvSCSNmI9nEP5rES+BkOsU0GvI66Crx0cZm7SV8kM
         U9s1GTJ17MdGH8UxlD4vcC7Wq8uQhbdmFbqtNMojNMdCqD8+ZDGMULaqnpgZVYdJi2KU
         OgZZagjwxDXotSOcnikKw6xItK7DmSZxd9qDBefveulHZ2NkZBeInimk0lYNHms6RnIt
         s3ReOUrxqcnqViZGNZDuhvtpiCmfF/WO6jJyajd2u9OGrXKEZHx+JlqNHbc3afJm6WcM
         HNnRF1x0DuMy7pSR8+1lOiASyIJlcXQOo/j0KGYxUz+SUeXo0w+bhLjwJR2vANYU1YVp
         q9fA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783977198; x=1784581998; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTrge0M49F7zPiQ6K55hT3lgwZEmSHGYjrvkPBU7w20=;
        b=VMdT+RCcrLyv4Zl7nZd8xKG3Uojb430/B/p/e7MKKTo0Zs+ukDBnEysVAb19NJ/xsE
         vJdOQwR7vZxI+hs+mNz/4Cmx39Dfss6UkmWbGB7GdmSIg4FWX2brf06/lEXCfBY591EC
         JHiHjmxkYP48pluY8GF2RNKTb/tfJIVDJULjyZYS31IWcpAhX9u0CylCmmeY0f1z9qll
         0wtQsd3BlwEwqLKOPmE16hRubI6oonu7OkKrfPINrYWkEZqjfCMEXtHtVCEHZ6oZ90qR
         3qM9EwUPxB9DahqjNgmGSZKZ2uNUzL3Zh3PKe2RsvrL13b0CPTt4uC0F+tYKzzbM4YCa
         Dj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783977198; x=1784581998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTrge0M49F7zPiQ6K55hT3lgwZEmSHGYjrvkPBU7w20=;
        b=iDzjr0KDEJygYBCV50wRBDZzOUq5AVJtsA9PDJLC2scDgNusMufR2fSiqDl/SfUHZc
         U/53B2G5cwnWhy7tw1NXcLLCPLB4tdpqfqIiwKX4ZM1CZN1b1cQSV5w/Vv+nB6V+IefV
         LljLoCa2y89lmKua12MjUHhmN+TUA82a+epXoN23ozqRT8oeOIrhSxVn6pq+7Uwww6I4
         DT7jb2RobdJk2jswZDeusy+oTVO1PC1IHj72ZeRkO5uMOfNqnaOK1wZe3T3CvLeHj21a
         siWVQqxzf17MH+YSFERBoLXcyxB0netowIulKgRrVxvOmj6HiQiXlVxrowC/uvxS8OkV
         Oy/Q==
X-Gm-Message-State: AOJu0Yy4SaBGsW2ES7CCtTlHlqYf28JkdoLTwYlxEpRncKt21uJFt6cI
	R84YLtdgWkiWWCVWOyofD6jHJMkxjYUFSfFHVrm1tvCaLcwLyWcE8gA9jjytEdJK32BHZu0SVrT
	xPgGBc9fkadJP+B/VWWbQrmStZQrwlOTm9qb33iTZO69iAc/IxBwcYtC40cXrMS9PWF1dltMxyF
	v4ro78oQYp09zSLU2GR/WTOpXLSJE2FFMRms+ZNho8
X-Gm-Gg: AfdE7cmRUQfRMu+Nc7l0pli2qTAawCodjOR62nj+lZLeWC9ED592Z/Ih/E2gDlcb5fD
	Quj+G2+QdSuIktpVZSRXoQMmKvjtdbuwd9Zo82x7i1zTumbcCCmzYal0gV49yBygHf83FJFVScQ
	0GpfKRYwR939zt64+n28YGPqiCWqORGd5JTzVfCrgPT4Tp2KWOx85tdXe9Vhm14KvPVKlQ
X-Received: by 2002:a05:6820:4df2:b0:6a3:127a:bf27 with SMTP id 006d021491bc7-6a39bc515ebmr5206127eaf.11.1783977198134;
        Mon, 13 Jul 2026 14:13:18 -0700 (PDT)
X-Received: by 2002:a05:6820:4df2:b0:6a3:127a:bf27 with SMTP id
 006d021491bc7-6a39bc515ebmr5206115eaf.11.1783977197735; Mon, 13 Jul 2026
 14:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-3-peter.lin@sifive.com> <CAAVgOkJ31PoMz7rkeW9STXWCDGyEU7ttkeJxyyoSK7BCmFd-9w@mail.gmail.com>
 <CAAVgOkJbp9rD1tzQOYda8rvZVT=K5YX=bxdCdS+3XkYi8ktvSg@mail.gmail.com>
In-Reply-To: <CAAVgOkJbp9rD1tzQOYda8rvZVT=K5YX=bxdCdS+3XkYi8ktvSg@mail.gmail.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:13:06 -0700
X-Gm-Features: AUfX_myiQiHci241MUwSR4_LHDEHQNwSLt9e1UEF4bJrTr8gFjt38i2yQBC7FFU
Message-ID: <CAAVgOk+czbUwqwcLR-4uzkE0k4eRzsFw6HBkfzcFhUZNL0iOAQ@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] lib: utils: fdt_helper: parse RISC-V Worlds DT properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Proofpoint-GUID: TXbIiANnIoaC-mVhQhFCwno__ORmhJyx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIxOCBTYWx0ZWRfX5gSp4cM5Caul
 el+BsCP/9vGe+3QiK4u84QqVDqro9RpbZT7VhiJiO+1p/l0hAjYGuZKzqLBTc4dctozSDwk+FzL
 V7VY3mINJiy3/e2YLvHNShhUMXZFu4an1Ka9Y/xxMKRyBmn3YoVzfizVehhWpAMwmSe7vr7Hft9
 kDU/lnKQfqzBz5qGqCjXcL8C4Ok+tavLRWt9zrx7PaFiBfcn6pLaYo3LDaN+abFRJEEO2XuhYG+
 wz9uK3kdjmgSonDiT+R2my2xuzhLWxVAfgkXnQEfz5jN0bqM3jgnwxbAA6iHfN3Qo57miwNgv/G
 PbGNbG9qVzNqBR25nmDEbtacPc6KZSLsyMkL8VS/kua3yzQsR2GkWgeJ5IN8FA7tGGxXsZPijBN
 mQoIObh7DYgp7h4OeYm+OlojF2gxQaCdkvcbrJxFH+MXLCX4ktJA9ZS5ODcqohHEJB2NE0XrIXs
 Xc+7PzarwjiBjF/eoKw==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a5554ee cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=pFyQfRViAAAA:8 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=mxeMRCwYf8xxfCS-clwA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=oJz5jJLG1JtSoe7EL652:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: TXbIiANnIoaC-mVhQhFCwno__ORmhJyx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIxOCBTYWx0ZWRfX89x5evDApGnR
 m/A+ck+/WMi8R5YNUH88VbAeFc7NfOoYjdIvpmdbxO9gra4RsTR0mLkElewd4k9RBVApPh0k6Z2
 +XbTkQUsLK1e6m3ieHcpeVEUBHG98kQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_141320_333247_E071E4DA 
X-CRM114-Status: GOOD (  31.93  )
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

T24gV2VkLCBKdWwgOCwgMjAyNiBhdCA1OjQy4oCvUE0gUGF3YW5kZWVwIE96YQo8cGF3YW5kZWVw
Lm96YUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDgsIDIwMjYgYXQg
NTozNuKAr1BNIFBhd2FuZGVlcCBPemEKPiA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29t
PiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCAzOjE24oCvQU0gWXUtQ2hp
ZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFk
ZCBmZHRfcGFyc2Vfd29ybGRzX2FsbF9oYXJ0cygpIHRvIHBhcnNlIFJJU0MtViBXb3JsZHMgZGV2
aWNlIHRyZWUKPiA+ID4gcHJvcGVydGllcyBmcm9tIENQVSBub2RlczoKPiA+ID4gICAtIHJpc2N2
LHBtd2lkICh1MzIpOiBQaHlzaWNhbCBNYWNoaW5lIFdvcmxkIElEIGZvciB0aGlzIGhhcnQKPiA+
ID4gICAtIHJpc2N2LHBtd2lkbGlzdCAodTY0KTogQml0bWFwIG9mIHBlcm1pdHRlZCBNLW1vZGUg
V29ybGQgSURzCj4gPiA+ICAgLSByaXNjdixwbWx3aWRsaXN0ICh1NjQpOiBCaXRtYXAgb2YgcGVy
bWl0dGVkIFMvVS1tb2RlIFdvcmxkIElEcwo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGV4dGVuZHMg
dGhlIHNiaV9oYXJ0X2ZlYXR1cmVzIHN0cnVjdCB3aXRoIG5ldyBmaWVsZHMgdG8KPiA+ID4gc3Rv
cmUgdGhlIHBhcnNlZCBXb3JsZCBJRCBjb25maWd1cmF0aW9uIChoYXNfcG13aWQsIHBtd2lkLCBw
bXdpZGxpc3QsCj4gPiA+IGFuZCBwbWx3aWRsaXN0KS4KPiA+ID4KPiA+ID4gTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNjE5MTA1ODM0LjEyNzczMDItMy1wZXRlci5saW5A
c2lmaXZlLmNvbS8KPiA+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRl
ci5saW5Ac2lmaXZlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBpbmNsdWRlL3NiaS9zYmlfaGFydC5o
ICAgICAgICAgICAgIHwgMTUgKysrKysrKysKPiA+ID4gIGluY2x1ZGUvc2JpX3V0aWxzL2ZkdC9m
ZHRfaGVscGVyLmggfCAgMiArCj4gPiA+ICBsaWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYyAgICAg
ICAgIHwgNjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBwbGF0Zm9ybS9n
ZW5lcmljL3BsYXRmb3JtLmMgICAgICAgIHwgMTMgKysrKysrLQo+ID4gPiAgNCBmaWxlcyBjaGFu
Z2VkLCA5MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ID4g
PiBpbmRleCAyOTQxODA5ZS4uOTcwNzJjMDkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvc2Jp
L3NiaV9oYXJ0LmgKPiA+ID4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ID4gPiBAQCAt
MTM1LDYgKzEzNSwyMSBAQCBzdHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgewo+ID4gPiAgICAgICAg
IHVuc2lnbmVkIGludCBwbXBfbG9nMmdyYW47Cj4gPiA+ICAgICAgICAgdW5zaWduZWQgaW50IG1o
cG1fbWFzazsKPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgbWhwbV9iaXRzOwo+ID4gPiArICAg
ICAgIC8qKiBUcnVlIGlmIHJpc2N2LHBtd2lkIHdhcyBwcmVzZW50IGluIERUICovCj4gPiA+ICsg
ICAgICAgYm9vbCBoYXNfcG13aWQ7Cj4gPiA+ICsgICAgICAgdTMyIHBtd2lkOwo+ID4gPiArICAg
ICAgIC8qKgo+ID4gPiArICAgICAgICAqIFBsYXRmb3JtLWRlZmluZWQgYml0bWFwIG9mIE0tbW9k
ZSBXSURzCj4gPiA+ICsgICAgICAgICogKGZyb20gRFQgcmlzY3YscG13aWRsaXN0KS4gWmVybyBt
ZWFucwo+ID4gPiArICAgICAgICAqIGFic2VudC91bnJlc3RyaWN0ZWQuCj4gPiA+ICsgICAgICAg
ICovCj4gPiA+ICsgICAgICAgdTY0IHBtd2lkbGlzdDsKPiA+ID4gKyAgICAgICAvKioKPiA+ID4g
KyAgICAgICAgKiBQbGF0Zm9ybS1kZWZpbmVkIGJpdG1hcCBvZiBTL1UtbW9kZSBXSURzCj4gPiA+
ICsgICAgICAgICogKGZyb20gRFQgcmlzY3YscG1sd2lkbGlzdCkuIFplcm8gbWVhbnMKPiA+ID4g
KyAgICAgICAgKiBhYnNlbnQvdW5yZXN0cmljdGVkLgo+ID4gPiArICAgICAgICAqLwo+ID4gPiAr
ICAgICAgIHU2NCBwbWx3aWRsaXN0Owo+IE96YTogcG1sd2lkbGlzdCBkZWZpbmVzIHdoaWNoIFdJ
RHMgTS1tb2RlIGlzIHBlcm1pdHRlZCB0byBhc3NpZ24gdG8KPiBTLW1vZGUuIEJ1dCBuZXh0LXdp
ZCBpcyBuZXZlciB2YWxpZGF0ZWQgYWdhaW5zdCBpdC4KPiA+ID4gIH07Cj4gPiA+Cj4gPiA+ICBl
eHRlcm4gdW5zaWduZWQgbG9uZyBoYXJ0X2ZlYXR1cmVzX29mZnNldDsKPiA+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvc2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmggYi9pbmNsdWRlL3NiaV91dGls
cy9mZHQvZmR0X2hlbHBlci5oCj4gPiA+IGluZGV4IDc1YTU2NGQxLi4zZjNkMDkxYiAxMDA2NDQK
PiA+ID4gLS0tIGEvaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaAo+ID4gPiArKysg
Yi9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oCj4gPiA+IEBAIC01Niw2ICs1Niw4
IEBAIGludCBmZHRfcGFyc2VfdGltZWJhc2VfZnJlcXVlbmN5KGNvbnN0IHZvaWQgKmZkdCwgdW5z
aWduZWQgbG9uZyAqZnJlcSk7Cj4gPiA+Cj4gPiA+ICBpbnQgZmR0X3BhcnNlX2lzYV9leHRlbnNp
b25zX2FsbF9oYXJ0cyhjb25zdCB2b2lkICpmZHQpOwo+ID4gPgo+ID4gPiAraW50IGZkdF9wYXJz
ZV93b3JsZHNfYWxsX2hhcnRzKGNvbnN0IHZvaWQgKmZkdCk7Cj4gPiA+ICsKPiA+ID4gIGludCBm
ZHRfcGFyc2VfZ2Fpc2xlcl91YXJ0X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZnNl
dCwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1f
dWFydF9kYXRhICp1YXJ0KTsKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9mZHQv
ZmR0X2hlbHBlci5jIGIvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMKPiA+ID4gaW5kZXggYWQ0
ZWZhYWYuLjhiNDBjZDI4IDEwMDY0NAo+ID4gPiAtLS0gYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxw
ZXIuYwo+ID4gPiArKysgYi9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYwo+ID4gPiBAQCAtNDU3
LDYgKzQ1Nyw2NyBAQCBpbnQgZmR0X3BhcnNlX2lzYV9leHRlbnNpb25zX2FsbF9oYXJ0cyhjb25z
dCB2b2lkICpmZHQpCj4gPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+
ICtpbnQgZmR0X3BhcnNlX3dvcmxkc19hbGxfaGFydHMoY29uc3Qgdm9pZCAqZmR0KQo+ID4gPiAr
ewo+ID4gPiArICAgICAgIHUzMiBoYXJ0aWQ7Cj4gPiA+ICsgICAgICAgY29uc3QgZmR0MzJfdCAq
dmFsOwo+ID4gPiArICAgICAgIHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaDsKPiA+ID4gKyAg
ICAgICBzdHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgKmhmZWF0dXJlczsKPiA+ID4gKyAgICAgICBp
bnQgZXJyLCBjcHVfb2Zmc2V0LCBjcHVzX29mZnNldCwgbGVuOwo+ID4gPiArCj4gPiA+ICsgICAg
ICAgaWYgKCFmZHQpCj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiA+
ID4gKwo+ID4gPiArICAgICAgIGNwdXNfb2Zmc2V0ID0gZmR0X3BhdGhfb2Zmc2V0KGZkdCwgIi9j
cHVzIik7Cj4gPiA+ICsgICAgICAgaWYgKGNwdXNfb2Zmc2V0IDwgMCkKPiA+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybiBjcHVzX29mZnNldDsKPiA+ID4gKwo+ID4gPiArICAgICAgIGZkdF9mb3Jf
ZWFjaF9zdWJub2RlKGNwdV9vZmZzZXQsIGZkdCwgY3B1c19vZmZzZXQpIHsKPiA+IHdoYXQgYWJv
dXQgcmlzY3YsbndvcmxkcyA/IEkgdGhpbmsgeW91IHNob3VsZCBwYXJzZSB0aGlzIGFuZCBiYXNl
ZCBvbgo+ID4gdGhhdCBhc3N1bWUgd2lkIHJhbmdlIC0gYW5kIHJlc3Qgb2YgdGhlIHdpZHMgc2hv
dWxkIGJlIHJlamVjdGVkLgo+ID4gPiArICAgICAgICAgICAgICAgZXJyID0gZmR0X3BhcnNlX2hh
cnRfaWQoZmR0LCBjcHVfb2Zmc2V0LCAmaGFydGlkKTsKPiA+ID4gKyAgICAgICAgICAgICAgIGlm
IChlcnIpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPiArCj4g
PiA+ICsgICAgICAgICAgICAgICBpZiAoIWZkdF9ub2RlX2lzX2VuYWJsZWQoZmR0LCBjcHVfb2Zm
c2V0KSkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICAgICAgICAgIHNjcmF0Y2ggPSBzYmlfaGFydGlkX3RvX3NjcmF0Y2goaGFydGlk
KTsKPiA+ID4gKyAgICAgICAgICAgICAgIGlmICghc2NyYXRjaCkKT3phOiBzaG91bGQgeW91IG5v
dCBjb250aW51ZSBpZiBoYXJ0IGlzIGRpc2FibGVkL2Z1eGVkIHlvdSBtYXkgbm90CmZpbmQgc3Nj
cmF0Y2guCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5PRU5UOwo+
ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICBoZmVhdHVyZXMgPSBzYmlfaGFydF9mZWF0dXJl
c19wdHIoc2NyYXRjaCk7Cj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIWhmZWF0dXJlcykKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9FTlQ7Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICAgICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgY3B1X29mZnNldCwgInJp
c2N2LHBtd2lkIiwgJmxlbik7Cj4gPiA+ICsgICAgICAgICAgICAgICBpZiAodmFsICYmIGxlbiA9
PSBzaXplb2YoZmR0MzJfdCkpIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaGZlYXR1
cmVzLT5wbXdpZCA9IGZkdDMyX3RvX2NwdSgqdmFsKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaGZlYXR1cmVzLT5oYXNfcG13aWQgPSB0cnVlOwo+ID4gPiArICAgICAgICAgICAgICAg
fQo+IE96YTogTm90aGluZyBwcmV2ZW50cyBhc3NpZ25pbmcgdGhlIHNhbWUgV0lEIHRvIGJvdGgg
TS1tb2RlIGFuZCBTLW1vZGUKPiAtIHNob3VsZCBub3QgYmUgaWRlbnRpY2FsIGZvciBib3RoIHdv
cmxkcy4KPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0
LCBjcHVfb2Zmc2V0LCAicmlzY3YscG13aWRsaXN0IiwgJmxlbik7Cj4gPiA+ICsgICAgICAgICAg
ICAgICBpZiAodmFsICYmIGxlbiA9PSAyICogc2l6ZW9mKGZkdDMyX3QpKSB7Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGhmZWF0dXJlcy0+cG13aWRsaXN0ID0gKCh1NjQpZmR0MzJfdG9f
Y3B1KHZhbFswXSkgPDwgMzIpIHwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZmR0MzJfdG9fY3B1KHZhbFsxXSk7Cj4gPiA+ICsgICAgICAgICAg
ICAgICB9Cj4gPiBPemE6IHByb3ZpZGUgc29tZSBkZWZpbmVzIGZvciBtYWdpYyBudW1iZXJzLgo+
ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICB2YWwgPSBmZHRfZ2V0cHJvcChmZHQsIGNwdV9v
ZmZzZXQsICJyaXNjdixwbWx3aWRsaXN0IiwgJmxlbik7Cj4gPiA+ICsgICAgICAgICAgICAgICBp
ZiAodmFsICYmIGxlbiA9PSAyICogc2l6ZW9mKGZkdDMyX3QpKSB7Cj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGhmZWF0dXJlcy0+cG1sd2lkbGlzdCA9ICgodTY0KWZkdDMyX3RvX2NwdSh2
YWxbMF0pIDw8IDMyKSB8Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBmZHQzMl90b19jcHUodmFsWzFdKTsKPiA+ID4gKyAgICAgICAgICAgICAg
IH0KPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgLyogU2FuaXR5IGNoZWNrcyAqLwo+ID4g
PiArICAgICAgICAgICAgICAgaWYgKGhmZWF0dXJlcy0+aGFzX3Btd2lkICYmIChoZmVhdHVyZXMt
PnBtd2lkID49IDY0KSkKPiA+IE96YTogIGZlYXR1cmVzLT5wbXdpZCA+PW53b3JsZHMgPwo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiA+ID4gKyAgICAg
ICAgICAgICAgIGlmIChoZmVhdHVyZXMtPmhhc19wbXdpZCAmJiBoZmVhdHVyZXMtPnBtd2lkbGlz
dCAmJgo+ID4gPiArICAgICAgICAgICAgICAgICAgICEoaGZlYXR1cmVzLT5wbXdpZGxpc3QgJiBC
SVRfVUxMKGhmZWF0dXJlcy0+cG13aWQpKSkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gU0JJX0VJTlZBTDsKPiA+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAg
ICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ID4gK30KPiA+ID4gKwo+ID4g
PiAgc3RhdGljIGludCBmZHRfcGFyc2VfdWFydF9ub2RlX2NvbW1vbihjb25zdCB2b2lkICpmZHQs
IGludCBub2Rlb2Zmc2V0LAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBwbGF0Zm9ybV91YXJ0X2RhdGEgKnVhcnQsCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBkZWZhdWx0X2ZyZXEsCj4gPiA+
IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9nZW5l
cmljL3BsYXRmb3JtLmMKPiA+ID4gaW5kZXggMWRmMDI4MGQuLjUxZTlmMzQyIDEwMDY0NAo+ID4g
PiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiA+ID4gKysrIGIvcGxhdGZvcm0v
Z2VuZXJpYy9wbGF0Zm9ybS5jCj4gPiA+IEBAIC0yNTUsMTEgKzI1NSwyMiBAQCBpbnQgZ2VuZXJp
Y19maW5hbF9pbml0KGJvb2wgY29sZF9ib290KQo+ID4gPgo+ID4gPiAgaW50IGdlbmVyaWNfZXh0
ZW5zaW9uc19pbml0KGJvb2wgY29sZF9ib290KQo+ID4gPiAgewo+ID4gPiArICAgICAgIGludCBy
YzsKPiA+ID4gKwo+ID4gPiAgICAgICAgIGlmICghY29sZF9ib290KQo+ID4gPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gPiA+Cj4gPiA+ICAgICAgICAgLyogUGFyc2UgdGhlIElTQSBzdHJp
bmcgZnJvbSBGRFQgYW5kIGVuYWJsZSB0aGUgbGlzdGVkIGV4dGVuc2lvbnMgKi8KPiA+ID4gLSAg
ICAgICByZXR1cm4gZmR0X3BhcnNlX2lzYV9leHRlbnNpb25zX2FsbF9oYXJ0cyhmZHRfZ2V0X2Fk
ZHJlc3MoKSk7Cj4gPiA+ICsgICAgICAgcmMgPSBmZHRfcGFyc2VfaXNhX2V4dGVuc2lvbnNfYWxs
X2hhcnRzKGZkdF9nZXRfYWRkcmVzcygpKTsKPiA+ID4gKyAgICAgICBpZiAocmMpCj4gPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAvKiBQYXJzZSBS
SVNDLVYgV29ybGRzIENQVSBwcm9wZXJ0aWVzIGZyb20gRkRUICovCj4gPiA+ICsgICAgICAgcmMg
PSBmZHRfcGFyc2Vfd29ybGRzX2FsbF9oYXJ0cyhmZHRfZ2V0X2FkZHJlc3MoKSk7Cj4gPiA+ICsg
ICAgICAgaWYgKHJjKQo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ID4gPiArCj4g
PiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICBpbnQgZ2VuZXJpY19k
b21haW5zX2luaXQodm9pZCkKPiA+ID4gLS0KPiA+ID4gMi40My43Cj4gPiA+Cj4gPiA+Cj4gPiA+
IC0tCj4gPiA+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gPiA+IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
