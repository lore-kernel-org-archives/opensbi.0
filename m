Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037A8D6AAF7
	for <opensbi@archiver.kernel.org>; Thu,  2 Apr 2026 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDTzXMt+I72piCgcfEoLHezJos6Rb9v6SYUubphHvY0=; b=303HUjMsDFdmbM
	yu0qGXud4/5u0TSpJSNWczUz5VeGU7/XiAgofuM6zRxGKC32eogN5fcDCroVVyOot1s0wqgaxpgzS
	dMBtX5XEnNLu5V8ERYqU4Nmh1jxXQdD7QqJ8Oip7eQGAteRFFjgGUmEJILgXbJSUNXgPZBn9JqJ4E
	zVzTs/6A/j2HvwC94APGn2+Ba0KfDiLF3uhT+woX4PRpL5C1DSpF8hKyDOo84Xlj9epBI8BcVeNlf
	vEyL8H0qEzOoggFXvh76RaykDNYYf5nXXz8P2ikxVhMPZd0NruGjhKyqwTpei3N8PJSO3NSfzXrMC
	MS7p5GQH9kYvFg8srbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MrE-00000000f5W-0q3J;
	Thu, 02 Apr 2026 18:33:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MrB-00000000f4q-2n0k
	for opensbi@lists.infradead.org;
	Thu, 02 Apr 2026 18:33:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4S8B2255001
	for <opensbi@lists.infradead.org>; Thu, 2 Apr 2026 18:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgqO0hn7uU6pUkhuXjz4Sx7nFTHrlwim87K6YerE1Bc=; b=Lcpup2UreNzHHAoF
	/jRW1b7AWOQESgTplcJcwfe0D3vopHWOPVcA5hw0EbbYQw4TJhGzgOhTPwKifLx6
	B3ssh0RwwehbfY56CLL6mbJN1OR6poUeaAHqmuJli7BktrvWrjL6ChD3F3AFoZF6
	VEKi9QNqdRcbUllihdARtDdQjq+XNu91YDtuDu2alP5uwAQaOxn2Gz8f853JjMmR
	56GvBXTHj5yG/ntV1zdNAizZ5yAbAzZZiHiSOsqBDHEKncx1Ut5iHA3DpnBd3iLT
	lyGHKrXglyZwLcWLaYNy2AetOwxIgtLUKXwT1KczykDD8hF1CWlansnft69Gmogt
	doP2Sw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t2anu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 18:33:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4b81c632so1981311cf.1
        for <opensbi@lists.infradead.org>; Thu, 02 Apr 2026 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775154808; x=1775759608; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgqO0hn7uU6pUkhuXjz4Sx7nFTHrlwim87K6YerE1Bc=;
        b=hNket8drOU9Lv9mmI6X/YziNRr9UFHF0aYRuFivwKUgpnQrIcyc47/kzTvjXR0HcIn
         XhHuiJCkX3O50ozVWFq7WAacQNrmKnqWnZiQPL0CFRGxKoiPHQS1Cy6zNbrhR5gOewAt
         G8NICUbnUDxUNza4WsgbudgrqYK/xpfOsZAdtplzWTqYGVYqG8TMBtZR8TgEML4jqdQP
         tvIQAuYfaaT1TZPoSsZlRjxYAcS1Y53Jv+UPymU2QmIRVe0n//sJepaBhBBfMfLn6zv1
         3jguVEvLFr/mcUJm7FzjtkZ0my0ZxSSl3JS/1+NOavMdTk/KgYO5q1Ryh34qUhBgFHsb
         QE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154808; x=1775759608;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgqO0hn7uU6pUkhuXjz4Sx7nFTHrlwim87K6YerE1Bc=;
        b=rR8f732WgKX5Rx6eEheMSrt8+yXU5+2YgxR+OF+h5RhvIWDxF6wKLli0rMhcqP2EcZ
         SwBddeNPuWUBPdh8zcoMRwXFVOX3wk6rJyezH8HAciG3qa4+nq91ffPKSB/9nGJk2X4e
         XSacVYq+9NH5if0wIeH7rluGuqtL05U8tnlsMfR5T7fZvR4FLLvWlUmOSx+EmTDvjJgt
         MOcayRpG9TUqlCIunSOcP7ApJZ1nYFBV5YfEKWPxiBpnpCNIA2cKCJWb/+Z0OuBXN/CZ
         1z8Sqsbh2TwiQHid6SqrdJeyvmtqd2hMGTqE7q4uKtq7JAmsjjUMXgNg2OO70HwFDugd
         x6Dg==
X-Gm-Message-State: AOJu0YxTofL3TD7sZONrlmUqFFHLtUAcvU8cslUVhhub9C8g62/Qu0pw
	iFiJ/K9GlGv6hbTmp1CwjXCRvmJ1AH69ulEMQ/jUkgE5UORJ9AimiWgMQ2r2Vr7KpMk0bctXGE3
	ABsLpKTXxpELv+lKslF9vhdA7AKjZfehfQ0mbMiEaICjkWD6vph8jLogaIKTaZBqlsA==
X-Gm-Gg: ATEYQzz59LiFyJy/xHXeTqWk7z8WVEf6sNu5O8ucKUJ5Qx4pD5QC2doRov4VP/0fEeZ
	b4ohcgpIh5szIFVZksLT8zDAE5AidOSOHX72aWGl6QVz/rUj0RK6UPw5Anf3V/5CmnJKb+5CEPD
	99WCmn/5QX9uPk70XH4nc3J5ke7tDeecLHb79Y74CNUhhy4eBnnXmgHxraGfiiw/h7CW6jFCS0K
	HxZZAgiozToWmuGiRcEfUvQFcmI1N2NKiwZLu9gmHB5QFshoptDUTHy0pVDRO1prQahyDRpPjeS
	8Z02+4FgAvnpoTNXeS8lbAXnubr1EcN17VLSl3w0scPN7DgMqzZ2XyZKyIDlPg16lUpPFRpg+0z
	LMDaTTkMM3QRSGvjsI2kdXbuDxgs0MkPGhIEfe61NA2/Wyqf+t6HgPZUVdFdN
X-Received: by 2002:a05:622a:8c05:b0:509:23c5:3289 with SMTP id d75a77b69052e-50d62b6e383mr5456581cf.63.1775154807602;
        Thu, 02 Apr 2026 11:33:27 -0700 (PDT)
X-Received: by 2002:a05:622a:8c05:b0:509:23c5:3289 with SMTP id d75a77b69052e-50d62b6e383mr5456141cf.63.1775154807140;
        Thu, 02 Apr 2026 11:33:27 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034bb78esm1077851a12.24.2026.04.02.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:33:25 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 20:33:24 +0200
Message-Id: <DHIVUYXFU25U.LR66V59ZX5VH@oss.qualcomm.com>
To: "Andrew Jones" <andrew.jones@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH] lib: sbi: Fix hw a/d updating defaults
Cc: <opensbi@lists.infradead.org>, "Anup Patel"
 <anup.patel@oss.qualcomm.com>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Daniel Henrique Barboza" <daniel.barboza@oss.qualcomm.com>,
        "Sunil V L"
 <sunilvl@oss.qualcomm.com>,
        "opensbi" <opensbi-bounces@lists.infradead.org>
References: <20260401220845.190680-1-andrew.jones@oss.qualcomm.com>
 <DHIR92KV91LY.2IYTK8T6RQAJC@oss.qualcomm.com>
 <wtpswj3mvxnnfxbabm4vm74yl344bu7rixkjevcqomn6zp373b@4n54jk7mh6xu>
In-Reply-To: <wtpswj3mvxnnfxbabm4vm74yl344bu7rixkjevcqomn6zp373b@4n54jk7mh6xu>
X-Proofpoint-ORIG-GUID: 8nXxnarsgLxcsn4Nzup8uW3SQad28sLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NiBTYWx0ZWRfX2Tsg9QBWhN5K
 O0nnsXGM5pJyv9ZsfRws0AUDkbm5smM4imldJCdam0AFxNt5XOKwjR6aAYr/TIFcbNNrZTeBoK2
 wi8w2m03aS51bO4zMcRzmeFnCyHCwUW8TIrrHkdmnjm4mm+ioqxNomGp2JeaU/EqoSbvqTxLlOp
 Ucs0qpZUHDilbtIDwuFfm3ZCt+m65fLKJcGZSODuEpQnxAc+pOTZUtnbGQRP18vpjMl1Dw2J9XK
 flr1kyNQufX2TZpxtyDQpY4Sd7u3Ex9yMCixjiwqHdlCe9kDWMuhB5NUnZSHOR88R60grrQOKqD
 mOXPlShnxHLaV3wjbdSzB1ytSXDq8gQgP+DPZ5SWjtCBOwYasbuJLf6kB+IWqTwrKiBDY7d/mCl
 HfWps4aVgiMHoISTIQNrU3e+xLfjlXrFwzay+QfdiVxiv1935yMlLM9P4cVAMtoC44eViiR4M8d
 ccWY7uSUoMUjo9QJ1bg==
X-Proofpoint-GUID: 8nXxnarsgLxcsn4Nzup8uW3SQad28sLi
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ceb678 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mCBAukHtTCtgy2VDrmYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_113329_717950_80750CD5 
X-CRM114-Status: GOOD (  19.67  )
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

MjAyNi0wNC0wMlQxMToyNDoyMC0wNTowMCwgQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAb3Nz
LnF1YWxjb21tLmNvbT46Cj4gT24gVGh1LCBBcHIgMDIsIDIwMjYgYXQgMDQ6NTY6NDNQTSArMDIw
MCwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+PiAyMDI2LTA0LTAxVDE3OjA4OjQ1LTA1OjAwLCBB
bmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPjoKPj4gPiBUaGUgU3Zh
ZGUgZHQtYmluZGluZyBkZXNjcmlwdGlvbiBzdGF0ZXMgdGhhdCBTdmFkdSBzaG91bGQgb25seQo+
PiA+IGJlIGVuYWJsZWQgYXQgYm9vdCB0aW1lIHdoZW4gb25seSBTdmFkdSBpcyBwcmVzZW50IGlu
IHRoZSBEVC4KPj4gPiBFbnN1cmUgdGhhdCdzIHRoZSBjYXNlLiBBbHNvLCB3aGVuIG9ubHkgU3Zh
ZHUgaXMgc3VwcG9ydGVkLAo+PiA+IGRpc2FibGUgRldGVC5QVEVfQURfSFdfVVBEQVRJTkcsIGFz
IHdlIG5lZWQgYm90aCB0byBzdXBwb3J0Cj4+ID4gdG9nZ2xpbmcuCj4+IAo+PiBEb2VzIFN2YWR1
IHdpdGhvdXQgU3ZhZGUgbWVhbiB0aGF0IGJvdGggbWVudmNmZy5BRFVFIG9yIGhlbnZjZmcuQURV
RSBhcmUKPj4gcmVhZC1vbmx5IDEgKHRoZSBJU0EgaXMgdmFndWUgZW5vdWdoIHRvIHBlcm1pdCB0
aGlzKSwgb3IgaXMgaXQganVzdCBhbgo+PiBhd2t3YXJkIHdheSB0byBjb25maWd1cmUgdGhlIGRl
ZmF1bHQsIHNvIEhTIG1vZGUgbXVzdCBhc3N1bWUgdGhhdAo+PiBoZW52Y2ZnLkFEVUU9MCB3aWxs
IGJlIFN2YWRlPwo+Cj4gSSBjb3VsZG4ndCBmaW5kIGFueXRoaW5nIGluIHRoZSBzcGVjIHRoYXQg
ZXhwbGljaXRseSBzdGF0ZXMgdGhlIEFEVUUgYml0Cj4gd2lsbCBiZWhhdmUgaGFzIHJlYWQtb25s
eSBvbmUgd2hlbiBvbmx5IFN2YWR1IGlzIHN1cHBvcnRlZC4gSWYgdGhlIHNwZWMKPiBhdCBsZWFz
dCBjbGFpbWVkIHRoYXQgdGhlIEFEVUUgZmllbGQgd2FzIFdBUkwgdGhlbiB3ZSBtaWdodCBpbmZl
ciB0aGF0LAo+IGJ1dCBpdCBkb2Vzbid0IGV2ZW4gc2F5IHRoYXQuCgpZZWFoLCBpdCB3YXMgYSBs
b25nIHNob3QgYW5kIEdyZWcganVzdCBjbGFyaWZpZWQgaW4gYW4gdW5yZWxhdGVkIHRocmVhZAp0
aGF0IHRoZSB2YWx1ZXMgYXJlIHJlYWQtd3JpdGUgdW5sZXNzIGV4cGxpY2l0bHkgc3RhdGVkIG90
aGVyd2lzZSwgc28KU3ZhZHUgaW1wbGllcyBTdmFkZSwgYW5kIHdlJ3JlIG1pc3VzaW5nIHRoZSBl
eHRlbnNpb24gc3RyaW5nIHRvIGV4cHJlc3MKYSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24gcGFyYW1l
dGVyLgoKPj4gU3ZhZGUgaXMgbWFuZGF0b3J5IGluIFJWQSBwcm9maWxlcywgc28gdGhlIGNvcm5l
ci1jYXNlIGNhc2UgaXQgbm90Cj4+IGFueXRoaW5nIEkgZXhwZWN0IHRvIHNlZS4uLgo+Cj4gWWVz
LCBJIGV4cGVjdCBpZiBTdmFkdS1vbmx5IGhhcnRzIGFyZSBidWlsdCB0aGF0IHRoZXkgbGlrZWx5
IHdpbGwgbWFrZQo+IEFEVUUgcmVhZC1vbmx5IDEsIHNvIEkgZG9uJ3QgZXhwZWN0IHRvIHNlZSBw
cm9ibGVtcyB3aXRoIGp1c3QKPiB1bmNvbmRpdGlvbmFsbHkgc2V0dGluZyB0aGUgYml0IHRvIDEs
IGFzIHdlIGRvIGhlcmUgKGFuZCBzaG91bGQgc2V0Cj4gaGVudmNmZy5BRFVFIGluIEtWTSBhcyB3
ZWxsKS4KClJpZ2h0LCB3ZSdkIG9ubHkgaGF2ZSBhbiBpc3N1ZSBpZiBzb2Z0d2FyZSBhc3N1bWVk
IHRoYXQgU3ZhZHUgd2l0aG91dApTdmFkZSBtZWFucyB0aGF0IGl0IGRvZXNuJ3QgaGF2ZSB0byBz
ZXQgdGhlIGJpdCB0byAxIHRvIGF2b2lkIFN2YWRlLgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
