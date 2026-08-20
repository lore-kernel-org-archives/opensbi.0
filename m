Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32B0C5DF85
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnX5mnlUGmk5/iJoioKODMnYFIWwJ98fjVwfZvAo694=; b=JZZ8PcQgCC7n/A
	1zWQgdyc9460FxO5SHvoy8wxQIB+6gnx4WCXe3Zd6Y2rLcshZ4Rb9rfW17wtfEhAINXJI0RPRA7B/
	v1iPqDQQiKklcNz/IvZcjaQLVjy3/0pk6gWcTw1haCazpEYypXiCBHbjIBrwB0CKVCBro6kVgoHoe
	KSuPgFi0/r63CrbuL0bZbOL0oNce1xtr0KHiBrJ6un5Ji8KSkg/GkjCQhLvtb3yePT4eXfETxHenv
	k+5P5iMypyiChVGKlTW7mcf+gAOWHmZGjXtPIsii4p80lr/yDdq5TzqpSWahantTGeqd+MdrKAqQ6
	SilnhMZOF4wG8zpWtYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx44u-0000000Bjjc-04cY;
	Thu, 20 Aug 2026 14:49:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx44m-0000000Bjhc-1qP1
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 14:49:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7Wfn3559825
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 14:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRUjVqWyntNdARwOpdL/xirVfCw8xOvVjnPePpUpMmQ=; b=DzR8NP3VLOsm4QTP
	w3j3kgsKZuc1Q2lNOuSkpd9IpmK5F6qlp3Fl0UffOOlymsqflLFogpk5b35+gKfY
	LZkq4mNwu4CCoXbvj1RZwVKYKpMV29qXfs6b+QlRxYLJ0Y9EPpM0sRjfZp5fh99b
	Gx6N+QBmtVcBLur0j7Wl2ii/Nnae2nBlaNu2/Kbmx8VdVRfFPBgqZSugkB2x5Trv
	4wj917MBvJCkv8LWnUMk3HrIX9UiKy/p9xa7rpP8oLTTeYvk3mW5mN+VRSGVHcoN
	mjEeZ7qtmDN1B1W8MTd0PW/YB04+SMYGv/+JwiybklZqUxOaILX5jFWxfq4+bKL7
	cA2Wag==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk1ayw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 14:49:03 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d8d1b76so1850530b6e.3
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 07:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787237342; cv=none;
        d=google.com; s=arc-20260327;
        b=Wt111Kf1aNnkKwWklPnPsPVHF13D0zmbvpO4SQiOpTesWmRXd0Syz1LuMnfnph+b+w
         5O1Q4IFhuCQwoYHRdpffn7G3MvyQ68HwolBXMOXThG06y9SiREXApDV9kmOn1rWET1bN
         ETyI6hxwdiNgHOVJ4a5f4ddGH5U1LlDeO18kZGC4oxOgSHAXi1IHywJdVYpbHAzitCKZ
         y5ynKE+/Jt0BY5ax9Kr4Sk/el66sI4rOs7gxNiE4X/PWobBcqNyBl6+aAototqnAYUd/
         6GIdAGuJXruXP0T6XkAfDDEbZ+kKcokci0++J69mrA8AWhMz3NOphuDe+BwvHyV/pZTX
         vjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRUjVqWyntNdARwOpdL/xirVfCw8xOvVjnPePpUpMmQ=;
        fh=hWSqxhDrXtiUHqQvJPdVlu3TdYeTR8ygHrqeYKGTfNY=;
        b=WkoS0/dp+/NgGyGDV8NrSyKI/OxVVPQbpmnqXxD3158JhcpVE/QpBJ/09DObepggSW
         /DCQyzjwzOVnq1QWw3FnPkJ9oc7pYx+zblVoLvMAKcOaFI/u5g+f8JFNzvLAvtMun5vn
         exnEVadxXQKthIamVStzZv4Lp3YMOCDS6oJq2QQlcTyV7JNQXAr+cmUyxYRhzrJQs9AC
         j7Zr28GU9tPSj9iklkjULug04N3OXxBJn3oTzXvfGTgMz58JgnlB5TQEcWH4Qywh2WzO
         9g1YwxHijolhlcQR73BgzhrGfdYHviGnABZISwkKqK/yu6dXpSZiqT42L315GSL8kTgd
         7FMQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237342; x=1787842142; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRUjVqWyntNdARwOpdL/xirVfCw8xOvVjnPePpUpMmQ=;
        b=VQ06qhQvZLh84HGWEU1udY+MGX45KBfZg+sKYZ//cMAFuH4AAkJep+by8YH61jy5vf
         yY7RLith1ltVVEIK6R45K8qurQyOm370oGAE5CUR9WvwwOng+h84DGIRjs5g58qGwRqg
         3UqkJzUFi+mf4e7RADxG9AZuU6eoYJdgxrdhvhobOmkP17Xh/SouQc8KQwrimnnlKKdY
         9CcVs+xoM5SWEfoG6WlswXKPEGXltL+DI9FjQVKPxMUDBc+4+clRAzLM+f1dhadLQ8HG
         foF9INwXXw3imn5369ZU0lT1J4sZCzrpyYWjaPbzmxo2U8EbMRIJRSVZbWS1hH4gH546
         /gVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237342; x=1787842142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRUjVqWyntNdARwOpdL/xirVfCw8xOvVjnPePpUpMmQ=;
        b=E3PvyGR9cYy1B4ndGze3EFpZ/GBcMio2XN4OLz9EOASQyfbtLAFEiOZGPBYRAhTW57
         AmMZmasXBO6IL6shixqhPnD5A9Wug59Uix8d6EOyRfp6tzIOFHJHWR8kCq+3lIa9Rbez
         4XJwGJU3chqCFdBaEMqeOMki65sYdahgKkdctgIU45PAYPPU8vMlDEViH2AB4BdwTjjC
         MVafcp12TLv303zL2ZCru3a+oA7N8AMqvhS9dGtwGQIRJtie0Bsxb1gDp7isxuXcKCZe
         vNvEXZOGrJA8fZzx8p50TybUYQsoEn+qz9hn82UyLzovWbzrRuxxU3rh0ItO6UZdVxnx
         Ymxg==
X-Gm-Message-State: AOJu0YyAw2Q0qX2ttjBnrEM4CUHN//m95tOefy7koCV71mUi9x+wCjyo
	EdevYcGYRltXC6revsDcW/DozDgePJKTnateY/VMlSZI98GvF7r2U+sIEHiA47XkVecGdQELUc6
	/UeYqGlPFu5XkOllESUEx6Iz0WiydWRVodtFu9JTrISffam3bwhchv0EyxgpMSCK9WXSysxG/0s
	0UN+bN4ohjayIQlwNIFF/OAU+banEQCKKB4N+0n22h
X-Gm-Gg: AR+sD12INyDeUW+iYPJ0OHy71SaK9fXeyvDKRn6h2hUh+XMH9gPxhfCOh15m+U5Lsk4
	9rm2SJR/2xl10lro3AR4me2eADgao+15GeDduMIS+qUxteotpTPpGJ/R15HBv5PsxSBSyKUCu/s
	VQU9ZaN18C+TrkFfeJmJomb6xF7b7JbNnjwvE8E1uwqN64OkiM1kqLzYXCaA==
X-Received: by 2002:a05:6820:990:b0:6b1:3496:9ab with SMTP id 006d021491bc7-6b13c2baae6mr12509764eaf.2.1787237342418;
        Thu, 20 Aug 2026 07:49:02 -0700 (PDT)
X-Received: by 2002:a05:6820:990:b0:6b1:3496:9ab with SMTP id
 006d021491bc7-6b13c2baae6mr12509706eaf.2.1787237341877; Thu, 20 Aug 2026
 07:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260622-upstream-v1-1-792e1847e96e@kernel.org>
In-Reply-To: <20260622-upstream-v1-1-792e1847e96e@kernel.org>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 20:18:48 +0530
X-Gm-Features: AcwNN1VmGnzKZN_kFJI66REguvYfHZlqHfPfpIr22vWHrhAo6eybzq7c7VEYFK8
Message-ID: <CABBgwmuPfxQgdBrKg=S5pMACwNev4m=oWBjeReV362x9xTnEtA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Support make -s to silence the build
To: Michael Ellerman <mpe@kernel.org>
Cc: opensbi@lists.infradead.org
X-Proofpoint-GUID: so1zvmjM2NisSKK_vSbPD1ClX_E01bY_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfXwGCeJVb4tfKq
 noM9zx7+KMFwq9TvvqX99WSg93DR8xNzVVmDRrxGb8QAN6OoZwpt91jNo1hFWXpjIK2CtmX6+jW
 oQVAqugKg2IKCfpP9bdcEien8AZqPo4=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a8713df cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=W-_n0kkjAAAA:8
 a=0xFf4Yo2snGyOjHa24kA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX3Tq1TWGQ3o/m
 K3LGpWJyClscHU8OKf6YryAUcFVV87aXCFx6rLhWj04uOjGDrllIMiSg8QwK3nkD2QZyHWvB4Qz
 O9RilCF8uN1bbDH/TWlYFYiUkJ1c6hdFHBWCDC/FCwcM2zIWa3n4qXW4VtsDxo8VQO7XivMvk3X
 eOeHgD2ePsz33B7Uqz7bbxUWVakRuuR0OODB7/wfxNcELE8YEVv/h8vbYH2o0NVjamVsCvgiCAk
 TP2y8fHCd+peZD5wl+98xHkoHidnGzDtohewZsL9QnRvKwwSv58oEnUebt8iH+xaoddcrv5pAGp
 y1zkuE04cLpuKdWORSzoyXsC4H8cOKoPm5aQH6UZQCUDJLavT6ghZN5n3F1T3rNkzU8fDdtw11O
 vtbz/scpQ+Mvqf1VWB/mCB8QWA0U+/VBcNFssqOINmn3sSHCbAco2F0PwsyAEVhhAagnTGclu5R
 ilfEKHbTnMxwzWMHNNQ==
X-Proofpoint-ORIG-GUID: so1zvmjM2NisSKK_vSbPD1ClX_E01bY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_074904_608876_065C4BD6 
X-CRM114-Status: GOOD (  22.16  )
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

T24gTW9uLCBKdW4gMjIsIDIwMjYgYXQgNzoyN+KAr1BNIE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEFkZCBzdXBwb3J0IGZvciBzaWxlbmNpbmcgdGhlIGJ1aWxk
IHdpdGggbWFrZSAtcywgd2hpY2ggbWVhbnMgbm90aGluZyBpcwo+IHByaW50ZWQgdW5sZXNzIHRo
ZXJlIGlzIGFuIGVycm9yLiBTaW1pbGFyIHRvIHRoZSB3YXkgTGludXggZG9lcyBpdC4KPgo+IFNp
Z25lZC1vZmYtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBrZXJuZWwub3JnPgoKTEdUTS4KClJl
dmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlz
IHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
VGVzdGVkIHdpdGggbWFrZSB2NC4wIGFuZCB2NC4zLgo+IC0tLQo+ICBNYWtlZmlsZSB8IDQ3ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9NYWtlZmlsZSBiL01ha2VmaWxlCj4gaW5kZXggNTRlYjE1YmMuLmM1N2FhNDUyIDEwMDY0NAo+
IC0tLSBhL01ha2VmaWxlCj4gKysrIGIvTWFrZWZpbGUKPiBAQCAtNDgwLDE3ICs0ODAsMjYgQEAg
ZW5kaWYKPiAgZGVmaW5lIGR5bmFtaWNfZmxhZ3MKPiAgLUkkKHNoZWxsIGRpcm5hbWUgJCgyKSkg
LURfX09CSk5BTUVfXz0kKHN1YnN0IC0sXywkKHNoZWxsIGJhc2VuYW1lICQoMSkgLm8pKQo+ICBl
bmRlZgo+ICsKPiArIyBJZiB0aGUgdXNlciByZXF1ZXN0ZWQgc2lsZW50IG9wZXJhdGlvbiAobWFr
ZSAtcyksIGhpZGUgdGhlCj4gKyMgcHJldHR5IGNvbW1hbmQgb3V0cHV0IGJ5IHR1cm5pbmcgdGhl
IGVjaG8gaW50byAiOiIgKG5vcCkuCj4gK2lmbmVxICgkKGZpbmRzdHJpbmcgcywkKGZpcnN0d29y
ZCAkKE1BS0VGTEFHUykpKSwpCj4gK3ByZXR0eV9lY2hvIDo9IDoKPiArZWxzZQo+ICtwcmV0dHlf
ZWNobyA6PSBlY2hvCj4gK2VuZGlmCj4gKwo+ICBtZXJnZV9vYmpzID0gJChDTURfUFJFRklYKW1r
ZGlyIC1wIGBkaXJuYW1lICQoMSlgOyBcCj4gLSAgICAgICAgICAgIGVjaG8gIiBNRVJHRSAgICAg
JChzdWJzdCAkKGJ1aWxkX2RpcikvLCwkKDEpKSI7IFwKPiArICAgICAgICAgICAgJChwcmV0dHlf
ZWNobykgIiBNRVJHRSAgICAgJChzdWJzdCAkKGJ1aWxkX2RpcikvLCwkKDEpKSI7IFwKPiAgICAg
ICAgICAgICAgJChMRCkgJChNRVJHRUZMQUdTKSAkKDIpIC1vICQoMSkKPiAgbWVyZ2VfZGVwcyA9
ICQoQ01EX1BSRUZJWClta2RpciAtcCBgZGlybmFtZSAkKDEpYDsgXAo+IC0gICAgICAgICAgICBl
Y2hvICIgTUVSR0UtREVQICQoc3Vic3QgJChidWlsZF9kaXIpLywsJCgxKSkiOyBcCj4gKyAgICAg
ICAgICAgICQocHJldHR5X2VjaG8pICIgTUVSR0UtREVQICQoc3Vic3QgJChidWlsZF9kaXIpLyws
JCgxKSkiOyBcCj4gICAgICAgICAgICAgIGNhdCAkKDIpID4gJCgxKQo+ICBjb3B5X2ZpbGUgPSAg
JChDTURfUFJFRklYKW1rZGlyIC1wIGBkaXJuYW1lICQoMSlgOyBcCj4gLSAgICAgICAgICAgIGVj
aG8gIiBDT1BZICAgICAgJChzdWJzdCAkKGJ1aWxkX2RpcikvLCwkKDEpKSI7IFwKPiArICAgICAg
ICAgICAgJChwcmV0dHlfZWNobykgIiBDT1BZICAgICAgJChzdWJzdCAkKGJ1aWxkX2RpcikvLCwk
KDEpKSI7IFwKPiAgICAgICAgICAgICAgY3AgLUwgLWYgJCgyKSAkKDEpCj4gIGluc3RfZmlsZSA9
ICAkKENNRF9QUkVGSVgpbWtkaXIgLXAgYGRpcm5hbWUgJCgxKWA7IFwKPiAtICAgICAgICAgICAg
ZWNobyAiIElOU1RBTEwgICAkKHN1YnN0ICQoaW5zdGFsbF9yb290X2RpcikvLCwkKDEpKSI7IFwK
PiArICAgICAgICAgICAgJChwcmV0dHlfZWNobykgIiBJTlNUQUxMICAgJChzdWJzdCAkKGluc3Rh
bGxfcm9vdF9kaXIpLywsJCgxKSkiOyBcCj4gICAgICAgICAgICAgIGNwIC1MIC1mICQoMikgJCgx
KQo+ICBpbnN0X2ZpbGVfbGlzdCA9ICQoQ01EX1BSRUZJWClpZiBbICEgLXogIiQoNCkiIF07IHRo
ZW4gXAo+ICAgICAgICAgICAgICBta2RpciAtcCAkKDEpLyQoMyk7IFwKPiBAQCAtNDk4LDYyICs1
MDcsNjIgQEAgaW5zdF9maWxlX2xpc3QgPSAkKENNRF9QUkVGSVgpaWYgWyAhIC16ICIkKDQpIiBd
OyB0aGVuIFwKPiAgICAgICAgICAgICAgcmVsX2ZpbGU9YGVjaG8gJCRmaWxlIHwgc2VkIC1lICdz
QCQoMikvJChzdWJzdCAkKGluc3RhbGxfZmlybXdhcmVfcGF0aCkscGxhdGZvcm0sJCgzKSlAQCdg
OyBcCj4gICAgICAgICAgICAgIGRlc3RfZmlsZT0kKDEpIi8iJCgzKSIvImBlY2hvICQkcmVsX2Zp
bGVgOyBcCj4gICAgICAgICAgICAgIGRlc3RfZGlyPWBkaXJuYW1lICQkZGVzdF9maWxlYDsgXAo+
IC0gICAgICAgICAgICBlY2hvICIgSU5TVEFMTCAgICIkKDMpIi8iYGVjaG8gJCRyZWxfZmlsZWA7
IFwKPiArICAgICAgICAgICAgJChwcmV0dHlfZWNobykgIiBJTlNUQUxMICAgIiQoMykiLyJgZWNo
byAkJHJlbF9maWxlYDsgXAo+ICAgICAgICAgICAgICBta2RpciAtcCAkJGRlc3RfZGlyOyBcCj4g
ICAgICAgICAgICAgIGNwIC1MIC1mICQkZmlsZSAkJGRlc3RfZmlsZTsgXAo+ICAgICAgICAgICAg
ICBkb25lIFwKPiAgICAgICAgICAgICAgZmkKPiAgaW5zdF9oZWFkZXJfZGlyID0gICQoQ01EX1BS
RUZJWClta2RpciAtcCAkKDEpOyBcCj4gLSAgICAgICAgICAgIGVjaG8gIiBJTlNUQUxMICAgJChz
dWJzdCAkKGluc3RhbGxfcm9vdF9kaXIpLywsJCgxKSkiOyBcCj4gKyAgICAgICAgICAgICQocHJl
dHR5X2VjaG8pICIgSU5TVEFMTCAgICQoc3Vic3QgJChpbnN0YWxsX3Jvb3RfZGlyKS8sLCQoMSkp
IjsgXAo+ICAgICAgICAgICAgICBjcCAtTCAtcmYgJCgyKSAkKDEpCj4gIGNvbXBpbGVfY3BwX2Rl
cCA9ICQoQ01EX1BSRUZJWClta2RpciAtcCBgZGlybmFtZSAkKDEpYDsgXAo+IC0gICAgICAgICAg
ICBlY2hvICIgQ1BQLURFUCAgICQoc3Vic3QgJChidWlsZF9kaXIpLywsJCgxKSkiOyBcCj4gKyAg
ICAgICAgICAgICQocHJldHR5X2VjaG8pICIgQ1BQLURFUCAgICQoc3Vic3QgJChidWlsZF9kaXIp
LywsJCgxKSkiOyBcCj4gICAgICAgICAgICAgIHByaW50ZiAlcyBgZGlybmFtZSAkKDEpYC8gID4g
JCgxKSAmJiBcCj4gICAgICAgICAgICAgICQoQ0MpICQoQ1BQRkxBR1MpIC14IGMgLU1NICQoMykg
XAo+ICAgICAgICAgICAgICAgIC1NVCBgYmFzZW5hbWUgJCgxOi5kZXA9JCgyKSlgID4+ICQoMSkg
fHwgcm0gLWYgJCgxKQo+ICBjb21waWxlX2NwcCA9ICQoQ01EX1BSRUZJWClta2RpciAtcCBgZGly
bmFtZSAkKDEpYDsgXAo+IC0gICAgICAgICAgICBlY2hvICIgQ1BQICAgICAgICQoc3Vic3QgJChi
dWlsZF9kaXIpLywsJCgxKSkiOyBcCj4gKyAgICAgICAgICAgICQocHJldHR5X2VjaG8pICIgQ1BQ
ICAgICAgICQoc3Vic3QgJChidWlsZF9kaXIpLywsJCgxKSkiOyBcCj4gICAgICAgICAgICAgICQo
Q1BQKSAkKENQUEZMQUdTKSAteCBjICQoMikgfCBncmVwIC12ICJcIyIgPiAkKDEpCj4gIGNvbXBp
bGVfY2NfZGVwID0gJChDTURfUFJFRklYKW1rZGlyIC1wIGBkaXJuYW1lICQoMSlgOyBcCj4gLSAg
ICAgICAgICAgIGVjaG8gIiBDQy1ERVAgICAgJChzdWJzdCAkKGJ1aWxkX2RpcikvLCwkKDEpKSI7
IFwKPiArICAgICAgICAgICAgJChwcmV0dHlfZWNobykgIiBDQy1ERVAgICAgJChzdWJzdCAkKGJ1
aWxkX2RpcikvLCwkKDEpKSI7IFwKPiAgICAgICAgICAgICAgcHJpbnRmICVzIGBkaXJuYW1lICQo
MSlgLyAgPiAkKDEpICYmIFwKPiAgICAgICAgICAgICAgJChDQykgJChDRkxBR1MpICQoY2FsbCBk
eW5hbWljX2ZsYWdzLCQoMSksJCgyKSkgICBcCj4gICAgICAgICAgICAgICAgLU1NICQoMikgPj4g
JCgxKSB8fCBybSAtZiAkKDEpCj4gIGNvbXBpbGVfY2MgPSAkKENNRF9QUkVGSVgpbWtkaXIgLXAg
YGRpcm5hbWUgJCgxKWA7IFwKPiAtICAgICAgICAgICAgZWNobyAiIENDICAgICAgICAkKHN1YnN0
ICQoYnVpbGRfZGlyKS8sLCQoMSkpIjsgXAo+ICsgICAgICAgICAgICAkKHByZXR0eV9lY2hvKSAi
IENDICAgICAgICAkKHN1YnN0ICQoYnVpbGRfZGlyKS8sLCQoMSkpIjsgXAo+ICAgICAgICAgICAg
ICAkKENDKSAkKENGTEFHUykgJChjYWxsIGR5bmFtaWNfZmxhZ3MsJCgxKSwkKDIpKSAtYyAkKDIp
IC1vICQoMSkKPiAgY29tcGlsZV9hc19kZXAgPSAkKENNRF9QUkVGSVgpbWtkaXIgLXAgYGRpcm5h
bWUgJCgxKWA7IFwKPiAtICAgICAgICAgICAgZWNobyAiIEFTLURFUCAgICAkKHN1YnN0ICQoYnVp
bGRfZGlyKS8sLCQoMSkpIjsgXAo+ICsgICAgICAgICAgICAkKHByZXR0eV9lY2hvKSAiIEFTLURF
UCAgICAkKHN1YnN0ICQoYnVpbGRfZGlyKS8sLCQoMSkpIjsgXAo+ICAgICAgICAgICAgICBwcmlu
dGYgJXMgYGRpcm5hbWUgJCgxKWAvID4gJCgxKSAmJiBcCj4gICAgICAgICAgICAgICQoQVMpICQo
QVNGTEFHUykgJChjYWxsIGR5bmFtaWNfZmxhZ3MsJCgxKSwkKDIpKSBcCj4gICAgICAgICAgICAg
ICAgLU1NICQoMikgPj4gJCgxKSB8fCBybSAtZiAkKDEpCj4gIGNvbXBpbGVfYXMgPSAkKENNRF9Q
UkVGSVgpbWtkaXIgLXAgYGRpcm5hbWUgJCgxKWA7IFwKPiAtICAgICAgICAgICAgZWNobyAiIEFT
ICAgICAgICAkKHN1YnN0ICQoYnVpbGRfZGlyKS8sLCQoMSkpIjsgXAo+ICsgICAgICAgICAgICAk
KHByZXR0eV9lY2hvKSAiIEFTICAgICAgICAkKHN1YnN0ICQoYnVpbGRfZGlyKS8sLCQoMSkpIjsg
XAo+ICAgICAgICAgICAgICAkKEFTKSAkKEFTRkxBR1MpICQoY2FsbCBkeW5hbWljX2ZsYWdzLCQo
MSksJCgyKSkgLWMgJCgyKSAtbyAkKDEpCj4gIGNvbXBpbGVfZWxmID0gJChDTURfUFJFRklYKW1r
ZGlyIC1wIGBkaXJuYW1lICQoMSlgOyBcCj4gLSAgICAgICAgICAgIGVjaG8gIiBFTEYgICAgICAg
JChzdWJzdCAkKGJ1aWxkX2RpcikvLCwkKDEpKSI7IFwKPiArICAgICAgICAgICAgJChwcmV0dHlf
ZWNobykgIiBFTEYgICAgICAgJChzdWJzdCAkKGJ1aWxkX2RpcikvLCwkKDEpKSI7IFwKPiAgICAg
ICAgICAgICAgJChDQykgJChDRkxBR1MpICQoMykgJChFTEZGTEFHUykgLVdsLC1UJCgyKSAtbyAk
KDEpCj4gIGNvbXBpbGVfYXIgPSAkKENNRF9QUkVGSVgpbWtkaXIgLXAgYGRpcm5hbWUgJCgxKWA7
IFwKPiAtICAgICAgICAgICAgZWNobyAiIEFSICAgICAgICAkKHN1YnN0ICQoYnVpbGRfZGlyKS8s
LCQoMSkpIjsgXAo+ICsgICAgICAgICAgICAkKHByZXR0eV9lY2hvKSAiIEFSICAgICAgICAkKHN1
YnN0ICQoYnVpbGRfZGlyKS8sLCQoMSkpIjsgXAo+ICAgICAgICAgICAgICAkKEFSKSAkKEFSRkxB
R1MpICQoMSkgJCgyKQo+ICBjb21waWxlX29iamNvcHkgPSAkKENNRF9QUkVGSVgpbWtkaXIgLXAg
YGRpcm5hbWUgJCgxKWA7IFwKPiAtICAgICAgICAgICAgZWNobyAiIE9CSkNPUFkgICAkKHN1YnN0
ICQoYnVpbGRfZGlyKS8sLCQoMSkpIjsgXAo+ICsgICAgICAgICAgICAkKHByZXR0eV9lY2hvKSAi
IE9CSkNPUFkgICAkKHN1YnN0ICQoYnVpbGRfZGlyKS8sLCQoMSkpIjsgXAo+ICAgICAgICAgICAg
ICAkKE9CSkNPUFkpIC1TIC1PIGJpbmFyeSAkKDIpICQoMSkKPiAgY29tcGlsZV9kdHMgPSAkKENN
RF9QUkVGSVgpbWtkaXIgLXAgYGRpcm5hbWUgJCgxKWA7IFwKPiAtICAgICAgICAgICAgZWNobyAi
IERUQyAgICAgICAkKHN1YnN0ICQoYnVpbGRfZGlyKS8sLCQoMSkpIjsgXAo+ICsgICAgICAgICAg
ICAkKHByZXR0eV9lY2hvKSAiIERUQyAgICAgICAkKHN1YnN0ICQoYnVpbGRfZGlyKS8sLCQoMSkp
IjsgXAo+ICAgICAgICAgICAgICAkKENQUCkgJChEVFNDUFBGTEFHUykgJCgyKSB8ICQoRFRDKSAt
TyBkdGIgLWkgYGRpcm5hbWUgJCgyKWAgLW8gJCgxKQo+ICBjb21waWxlX2QyYyA9ICQoQ01EX1BS
RUZJWClta2RpciAtcCBgZGlybmFtZSAkKDEpYDsgXAo+IC0gICAgICAgICAgICBlY2hvICIgRDJD
ICAgICAgICQoc3Vic3QgJChidWlsZF9kaXIpLywsJCgxKSkiOyBcCj4gKyAgICAgICAgICAgICQo
cHJldHR5X2VjaG8pICIgRDJDICAgICAgICQoc3Vic3QgJChidWlsZF9kaXIpLywsJCgxKSkiOyBc
Cj4gICAgICAgICAgICAgICQoaWYgJCgkKDIpLXZhcmFsaWduLSQoMykpLCQoZXZhbCBEMkNfQUxJ
R05fQllURVMgOj0gJCgkKDIpLXZhcmFsaWduLSQoMykpKSwkKGV2YWwgRDJDX0FMSUdOX0JZVEVT
IDo9ICQoNCkpKSBcCj4gICAgICAgICAgICAgICQoaWYgJCgkKDIpLXZhcnByZWZpeC0kKDMpKSwk
KGV2YWwgRDJDX05BTUVfUFJFRklYIDo9ICQoJCgyKS12YXJwcmVmaXgtJCgzKSkpLCQoZXZhbCBE
MkNfTkFNRV9QUkVGSVggOj0gJCg1KSkpIFwKPiAgICAgICAgICAgICAgJChpZiAkKCQoMiktcGFk
ZGluZy0kKDMpKSwkKGV2YWwgRDJDX1BBRERJTkdfQllURVMgOj0gJCgkKDIpLXBhZGRpbmctJCgz
KSkpLCQoZXZhbCBEMkNfUEFERElOR19CWVRFUyA6PSAwKSkgXAo+ICAgICAgICAgICAgICAkKHNy
Y19kaXIpL3NjcmlwdHMvZDJjLnNoIC1pICQoNikgLWEgJChEMkNfQUxJR05fQllURVMpIC1wICQo
RDJDX05BTUVfUFJFRklYKSAtdCAkKEQyQ19QQURESU5HX0JZVEVTKSA+ICQoMSkKPiAgY29tcGls
ZV9jYXJyYXkgPSAkKENNRF9QUkVGSVgpbWtkaXIgLXAgYGRpcm5hbWUgJCgxKWA7IFwKPiAtICAg
ICAgICAgICAgZWNobyAiIENBUlJBWSAgICAkKHN1YnN0ICQoYnVpbGRfZGlyKS8sLCQoMSkpIjsg
XAo+ICsgICAgICAgICAgICAkKHByZXR0eV9lY2hvKSAiIENBUlJBWSAgICAkKHN1YnN0ICQoYnVp
bGRfZGlyKS8sLCQoMSkpIjsgXAo+ICAgICAgICAgICAgICAkKGV2YWwgQ0FSUkFZX1ZBUl9MSVNU
IDo9ICQoY2FycmF5LSQoc3Vic3QgLmNhcnJheS5jLCwkKHNoZWxsIGJhc2VuYW1lICQoMSkpKS15
KSkgXAo+ICAgICAgICAgICAgICAkKHNyY19kaXIpL3NjcmlwdHMvY2FycmF5LnNoIC1pICQoMikg
LWwgIiQoQ0FSUkFZX1ZBUl9MSVNUKSIgPiAkKDEpIHx8IHJtICQoMSkKPiAgY29tcGlsZV9nZW5f
ZGVwID0gJChDTURfUFJFRklYKW1rZGlyIC1wIGBkaXJuYW1lICQoMSlgOyBcCj4gLSAgICAgICAg
ICAgIGVjaG8gIiBHRU4tREVQICAgJChzdWJzdCAkKGJ1aWxkX2RpcikvLCwkKDEpKSI7IFwKPiAr
ICAgICAgICAgICAgJChwcmV0dHlfZWNobykgIiBHRU4tREVQICAgJChzdWJzdCAkKGJ1aWxkX2Rp
cikvLCwkKDEpKSI7IFwKPiAgICAgICAgICAgICAgZWNobyAiJCgxOi5kZXA9JCgyKSk6ICQoMyki
ID4+ICQoMSkKPgo+ICB0YXJnZXRzLXkgID0gJChidWlsZF9kaXIpL2xpYi9saWJzYmkuYQo+Cj4g
LS0tCj4gYmFzZS1jb21taXQ6IGUxMzRkNTIxMDY4MGNmMjRlZWE4NWRjMjg3MDM2ZTM0M2YxNzY2
NDIKPiBjaGFuZ2UtaWQ6IDIwMjYwNjIyLXVwc3RyZWFtLTg4ODljNzFkYjE0ZQo+Cj4gQmVzdCBy
ZWdhcmRzLAo+IC0tCj4gTWljaGFlbCBFbGxlcm1hbiA8bXBlQGtlcm5lbC5vcmc+Cj4KPgo+IC0t
Cj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
