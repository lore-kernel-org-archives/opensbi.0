Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23616C43458
	for <opensbi@archiver.kernel.org>; Thu,  9 Jul 2026 00:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgiFt79r/9tUGOyTmymo+/2RVdjKH+ncoEU9gBTGJXk=; b=fp7L/HmFiy5j4z
	aXf4kEaKEH+02RIVKXtomJPeoxZ5DwI+ClUSZ2/+MddaMs81xbXp6ZWLUwAU1FdnUpn026Lvwyj2T
	kiAi6qh5zhbUJxYIbGmzK9GcLZdlNJHW9CZ5H414giUde+5D87Bmi9SZ7K63FpHf8eZda0TqHwlKx
	VKftXCDGFVCVn1rcLqu6iWMewb+0tOdtCmPJF+c0nZiiWVYu+6Oy6tQxpddTSXVKKXWIvd7Y+Pr+J
	WsQUA0UunXRv4p1U6UhBasL0ac2RVgzpqLeySYbhy0slw2w9MyP0Fs0NdzHXmeXLFiyb0Mohknhxv
	Vgfm+nf+sD2CUfEV/9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcqy-00000000fPz-1zmu;
	Thu, 09 Jul 2026 00:43:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcqv-00000000fPQ-2SO6
	for opensbi@lists.infradead.org;
	Thu, 09 Jul 2026 00:42:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8Nds083262
	for <opensbi@lists.infradead.org>; Thu, 9 Jul 2026 00:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fXIxZaogqnKe4S8bUwvtWbzK8hzqSb3oY6ooAp16r5I=; b=S7dG0pa3Od1H+dNu
	HkWSHq2dWTRiyBQgpzEd/J0iQ4Sa+HuIHlsfsjWbRdGi8vB5ZhU20dZYBcRUEX11
	ZiTE+9GmqAlh32bNRbzr/cEWvx00zlStrA1Uy5baxKsqe4hJleN8fyi7aqAyzE/O
	S8qINZq/6q0Djf6Eh9KScZvKY9e2IFdxJbKbOsjwToMs1ro91D1CWP25vuKI/Jqp
	rWVANObNicxfKMyx7GPFlZGTpAYs+7hrr5GXYmQADhrV2esoVAVzrCPxCLAK5qES
	GZy/vUmSBojPgRmanaJwEWq3irAwbKCii9Gzrg/3H9WXhLbXztvKWqhiHlY5AdPC
	hCSNVw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vs17a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 09 Jul 2026 00:42:56 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-49ab6a82cd5so1337844b6e.2
        for <opensbi@lists.infradead.org>; Wed, 08 Jul 2026 17:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783557776; cv=none;
        d=google.com; s=arc-20260327;
        b=jd/c1olD/mXeP43/6KgbkY7mAMDuk9C9ZvAjQQxk+ZagkPPEtQpnonr+HRlMKVUE/U
         nA1nAJ/eeQZNa0wtbEFUbFYQQ486gLPz5f94ke6ABDT6/PvClBt4K2HUp609ZjCaWxdF
         UtIBnPn1JWQauUM6/+z84/BkOgnnYt9Gei0n3lyUezno/PoD9mE3EP+3ky65r8QCi2fh
         ZO+eoe2roIf1+AC7SnCaKUaip3zWm1EdVnEBELdlsTEV+k/09CSi36T1D0qalnX91/fM
         fK7d5cubXGoExVq7/R/IW4fxazhk2S92er8Kz1pF2NDRLKHNhqu029qaGHT1+E1zvwgO
         ieqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXIxZaogqnKe4S8bUwvtWbzK8hzqSb3oY6ooAp16r5I=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=ATgO0NaHhumSvpu56VzA/o+XEDle5lt45Llq8DM2/eKd6Wm4qRiH2p0Rfuq6o5iF5U
         e/FTRQe2poifudXxbFyEnIFvahWdFHVDYLlvocZC6Ontid+0cjSAjtLrbdEuBZlYn95V
         pFiJ4nrMhgqemlkMz7BSkvOylP4cjYl+O2H43GxnB9wDy5LLrnbuLlrjxhdCHrkHazd6
         INV9SnpMu55hDF/T3Y53Li2sfrnp6z0FjY3yQrpI8eobMKLfG29Wb6peYCPLtTxd4AaQ
         wgxbVUfp5xwD2X3cq+wMClhR30VMYjBJYz2xSsya6aNrifhEIhEIE9cPauOsc9RpO3Mb
         7ZlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783557776; x=1784162576; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fXIxZaogqnKe4S8bUwvtWbzK8hzqSb3oY6ooAp16r5I=;
        b=ivFl+T3puKDwOCfaW5RRz97wlo+N7sIcp8IYsuBUt5SVObAXKNmq9v/UklJkVL+5/K
         oerfyUwPHljmy6qgCM7M2WEg2NWsWbNfV0bugSEDyKfBa1Ba25tGsvmIF9X2vZ5aSjbP
         I1aLFqiivx31kREKIsRPnKaH+Rfv1IX+cHDvVL7zKdJhPAeW8fjNKG7zJKfR1ov5y8EE
         Lws//j8eJqhYUAShSs1d3T9cf+vuPT7Wy857CFLcK6OsGb18fL4ZSXyx5Mr9ihduubuy
         dRpYVHI7TcEo4uNNqgC0J6WIfnn7asfq98pxU1MPDW72DniKGSI1sGHSgTyWK9NyKrBA
         pQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783557776; x=1784162576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fXIxZaogqnKe4S8bUwvtWbzK8hzqSb3oY6ooAp16r5I=;
        b=RbSerPZkCUi6Pt3cakQMDXuXiZBhz4Olbt09gYxsNOGkzNrg2GeBxnH2uvCLu4bSWS
         c/EFe7DepPZnFa0xE6szoRYxz1E/jVuCiyvy5lfHbHE6gIfaDXWJvAAzq8oKP3GElzKc
         ScTa7GUom+WhbtgbgtpOJoFwzJniwS8833kORhcC5pBhEGx8/2tFaSGvEEjra+6b0pjo
         kcVFu0jsnUfpf00l5SFSEaP15FRC36LyylAQg+QLwnvFKR1d/yTuVBn1Ja71eVT+4tHo
         JJ/xNYVZxF2yFGn1a4Fg65HXp9TCK1eWDoUzqZra0BLSEKMuL/yHB1kpMJF31twiI9QV
         RH6w==
X-Gm-Message-State: AOJu0YwlKmMWVnpJcAHANbuR0hU3/yFi5pKLjyRwvzPNK4jW1tcJnj6+
	KrS3CzpecQUcKR+bTECB4m+BZyY9E99sng1qfzBwIZU+HzLMKHHjaRNqPM6E0j2hbK+mWyzM/0V
	/kzYPP///F5c7wC6WnxyaQnyA61eFT56D654uJwLrzUTx0NCz3AlLIF+ip22p7h/GcuNs5sErXV
	+dA5U7gJl+7N/PutfFTKhPFAJohxUzDuJ0BCX+7sD1
X-Gm-Gg: AfdE7cnoknqqS7mFpD1HysQ+4p5ZjpbqVkpPj7p/D/mcwGsxxwLOFrkDfLQzxKmohxN
	waZVVMA3OnvpXrs4lfXulqvvVOqqv4MsX69TDk5NHYi5Gi0q6AjzB9cBTnG03HqeJWhFQDizixY
	jlV/mxTEmCNiue7jXTNxFPG/UyS3QXnU3s6m1GI245uJ64s4uu1uBy71Wtgz5+PVTVr71M
X-Received: by 2002:a05:6808:4482:b0:495:feaa:9e39 with SMTP id 5614622812f47-4a2030a464fmr3855420b6e.6.1783557775879;
        Wed, 08 Jul 2026 17:42:55 -0700 (PDT)
X-Received: by 2002:a05:6808:4482:b0:495:feaa:9e39 with SMTP id
 5614622812f47-4a2030a464fmr3855403b6e.6.1783557775472; Wed, 08 Jul 2026
 17:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-3-peter.lin@sifive.com> <CAAVgOkJ31PoMz7rkeW9STXWCDGyEU7ttkeJxyyoSK7BCmFd-9w@mail.gmail.com>
In-Reply-To: <CAAVgOkJ31PoMz7rkeW9STXWCDGyEU7ttkeJxyyoSK7BCmFd-9w@mail.gmail.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:42:44 -0700
X-Gm-Features: AUfX_mzDDgmZO00ORRD8Ga5WwkgRT4DQ-M1BCoGZ0WaRattbz-uEGig0GYLJe7E
Message-ID: <CAAVgOkJbp9rD1tzQOYda8rvZVT=K5YX=bxdCdS+3XkYi8ktvSg@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] lib: utils: fdt_helper: parse RISC-V Worlds DT properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Proofpoint-GUID: u_2ut5C23DGbEGzJLGEc2bNm7URRopxn
X-Proofpoint-ORIG-GUID: u_2ut5C23DGbEGzJLGEc2bNm7URRopxn
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4eee90 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pFyQfRViAAAA:8 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=EQjjqqJUjgs1Ke0QfF4A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=oJz5jJLG1JtSoe7EL652:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAwNSBTYWx0ZWRfX4Hnod9DXSI1d
 UfTyDhSr0x+ub/l7zTpQV/ptqtgpD4/EJsRt2Nn9SbujFgYQQRIa99BS5sStLDnZqCdzc+JyxmU
 VsaUGEMGY7aWPvku2octSzYHF9gSbiqZkhIN4zK+jRXGCgbiSESDRQ7a6WQMODOGfumygNJagLb
 j+E+7m+TOdexrHp2VxSDZz+vePWNzZR4KktJWZqtUbaj91VU5z4QksTQwOwuxrSh2p2/2qlGtuB
 3Gx4NVxTZOp7zfV8jaP6rNsz1iVSbVVvJAFhJiV9S/sK1eFapP7NQiA4n4EmuYHtbfCU8Xuwk6V
 D5GZAtNHMYHGKic9Av08xz/VrnbKfFbxUt/aM4S4tJHfBQXkAa5g/NXdsv2kCHA0E+abIkh33+F
 umgJqYIoHoBlUI6Fgw11viYa3iq7+Rg/Vhbgwr6gkD2D2+urEubLY9HDAkkl3fCtGDAxTkw+Tsk
 rLVsww6EP7wip72+LTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAwNSBTYWx0ZWRfX2te6BK7TZuu7
 7h/Vgyfos8Cxo7Y/Wx3FSIMFfb0ZOS7pAsgoaO01vQbdGvYT7D96azJASHI3jW8QT5lySXzW6Xk
 GxBAcJpVDeJxxqUWLONOaYYn/mLwsHk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_174257_653056_C103A7B6 
X-CRM114-Status: GOOD (  31.90  )
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

T24gV2VkLCBKdWwgOCwgMjAyNiBhdCA1OjM24oCvUE0gUGF3YW5kZWVwIE96YQo8cGF3YW5kZWVw
Lm96YUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDI2LCAyMDI2IGF0
IDM6MTbigK9BTSBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPiB3cm90
ZToKPiA+Cj4gPiBBZGQgZmR0X3BhcnNlX3dvcmxkc19hbGxfaGFydHMoKSB0byBwYXJzZSBSSVND
LVYgV29ybGRzIGRldmljZSB0cmVlCj4gPiBwcm9wZXJ0aWVzIGZyb20gQ1BVIG5vZGVzOgo+ID4g
ICAtIHJpc2N2LHBtd2lkICh1MzIpOiBQaHlzaWNhbCBNYWNoaW5lIFdvcmxkIElEIGZvciB0aGlz
IGhhcnQKPiA+ICAgLSByaXNjdixwbXdpZGxpc3QgKHU2NCk6IEJpdG1hcCBvZiBwZXJtaXR0ZWQg
TS1tb2RlIFdvcmxkIElEcwo+ID4gICAtIHJpc2N2LHBtbHdpZGxpc3QgKHU2NCk6IEJpdG1hcCBv
ZiBwZXJtaXR0ZWQgUy9VLW1vZGUgV29ybGQgSURzCj4gPgo+ID4gVGhpcyBwYXRjaCBleHRlbmRz
IHRoZSBzYmlfaGFydF9mZWF0dXJlcyBzdHJ1Y3Qgd2l0aCBuZXcgZmllbGRzIHRvCj4gPiBzdG9y
ZSB0aGUgcGFyc2VkIFdvcmxkIElEIGNvbmZpZ3VyYXRpb24gKGhhc19wbXdpZCwgcG13aWQsIHBt
d2lkbGlzdCwKPiA+IGFuZCBwbWx3aWRsaXN0KS4KPiA+Cj4gPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNjA2MTkxMDU4MzQuMTI3NzMwMi0zLXBldGVyLmxpbkBzaWZpdmUu
Y29tLwo+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5Ac2lm
aXZlLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvc2JpL3NiaV9oYXJ0LmggICAgICAgICAgICAg
fCAxNSArKysrKysrKwo+ID4gIGluY2x1ZGUvc2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmggfCAg
MiArCj4gPiAgbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgICAgICAgICB8IDYxICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ID4gIHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyAg
ICAgICAgfCAxMyArKysrKystCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0
LmggYi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gPiBpbmRleCAyOTQxODA5ZS4uOTcwNzJjMDkg
MTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gPiArKysgYi9pbmNsdWRl
L3NiaS9zYmlfaGFydC5oCj4gPiBAQCAtMTM1LDYgKzEzNSwyMSBAQCBzdHJ1Y3Qgc2JpX2hhcnRf
ZmVhdHVyZXMgewo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgcG1wX2xvZzJncmFuOwo+ID4gICAg
ICAgICB1bnNpZ25lZCBpbnQgbWhwbV9tYXNrOwo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgbWhw
bV9iaXRzOwo+ID4gKyAgICAgICAvKiogVHJ1ZSBpZiByaXNjdixwbXdpZCB3YXMgcHJlc2VudCBp
biBEVCAqLwo+ID4gKyAgICAgICBib29sIGhhc19wbXdpZDsKPiA+ICsgICAgICAgdTMyIHBtd2lk
Owo+ID4gKyAgICAgICAvKioKPiA+ICsgICAgICAgICogUGxhdGZvcm0tZGVmaW5lZCBiaXRtYXAg
b2YgTS1tb2RlIFdJRHMKPiA+ICsgICAgICAgICogKGZyb20gRFQgcmlzY3YscG13aWRsaXN0KS4g
WmVybyBtZWFucwo+ID4gKyAgICAgICAgKiBhYnNlbnQvdW5yZXN0cmljdGVkLgo+ID4gKyAgICAg
ICAgKi8KPiA+ICsgICAgICAgdTY0IHBtd2lkbGlzdDsKPiA+ICsgICAgICAgLyoqCj4gPiArICAg
ICAgICAqIFBsYXRmb3JtLWRlZmluZWQgYml0bWFwIG9mIFMvVS1tb2RlIFdJRHMKPiA+ICsgICAg
ICAgICogKGZyb20gRFQgcmlzY3YscG1sd2lkbGlzdCkuIFplcm8gbWVhbnMKPiA+ICsgICAgICAg
ICogYWJzZW50L3VucmVzdHJpY3RlZC4KPiA+ICsgICAgICAgICovCj4gPiArICAgICAgIHU2NCBw
bWx3aWRsaXN0OwpPemE6IHBtbHdpZGxpc3QgZGVmaW5lcyB3aGljaCBXSURzIE0tbW9kZSBpcyBw
ZXJtaXR0ZWQgdG8gYXNzaWduIHRvClMtbW9kZS4gQnV0IG5leHQtd2lkIGlzIG5ldmVyIHZhbGlk
YXRlZCBhZ2FpbnN0IGl0Lgo+ID4gIH07Cj4gPgo+ID4gIGV4dGVybiB1bnNpZ25lZCBsb25nIGhh
cnRfZmVhdHVyZXNfb2Zmc2V0Owo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpX3V0aWxzL2Zk
dC9mZHRfaGVscGVyLmggYi9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oCj4gPiBp
bmRleCA3NWE1NjRkMS4uM2YzZDA5MWIgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3NiaV91dGls
cy9mZHQvZmR0X2hlbHBlci5oCj4gPiArKysgYi9pbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hl
bHBlci5oCj4gPiBAQCAtNTYsNiArNTYsOCBAQCBpbnQgZmR0X3BhcnNlX3RpbWViYXNlX2ZyZXF1
ZW5jeShjb25zdCB2b2lkICpmZHQsIHVuc2lnbmVkIGxvbmcgKmZyZXEpOwo+ID4KPiA+ICBpbnQg
ZmR0X3BhcnNlX2lzYV9leHRlbnNpb25zX2FsbF9oYXJ0cyhjb25zdCB2b2lkICpmZHQpOwo+ID4K
PiA+ICtpbnQgZmR0X3BhcnNlX3dvcmxkc19hbGxfaGFydHMoY29uc3Qgdm9pZCAqZmR0KTsKPiA+
ICsKPiA+ICBpbnQgZmR0X3BhcnNlX2dhaXNsZXJfdWFydF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwg
aW50IG5vZGVvZmZzZXQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBwbGF0Zm9ybV91YXJ0X2RhdGEgKnVhcnQpOwo+ID4KPiA+IGRpZmYgLS1naXQgYS9saWIvdXRp
bHMvZmR0L2ZkdF9oZWxwZXIuYyBiL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCj4gPiBpbmRl
eCBhZDRlZmFhZi4uOGI0MGNkMjggMTAwNjQ0Cj4gPiAtLS0gYS9saWIvdXRpbHMvZmR0L2ZkdF9o
ZWxwZXIuYwo+ID4gKysrIGIvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMKPiA+IEBAIC00NTcs
NiArNDU3LDY3IEBAIGludCBmZHRfcGFyc2VfaXNhX2V4dGVuc2lvbnNfYWxsX2hhcnRzKGNvbnN0
IHZvaWQgKmZkdCkKPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICtpbnQgZmR0
X3BhcnNlX3dvcmxkc19hbGxfaGFydHMoY29uc3Qgdm9pZCAqZmR0KQo+ID4gK3sKPiA+ICsgICAg
ICAgdTMyIGhhcnRpZDsKPiA+ICsgICAgICAgY29uc3QgZmR0MzJfdCAqdmFsOwo+ID4gKyAgICAg
ICBzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2g7Cj4gPiArICAgICAgIHN0cnVjdCBzYmlfaGFy
dF9mZWF0dXJlcyAqaGZlYXR1cmVzOwo+ID4gKyAgICAgICBpbnQgZXJyLCBjcHVfb2Zmc2V0LCBj
cHVzX29mZnNldCwgbGVuOwo+ID4gKwo+ID4gKyAgICAgICBpZiAoIWZkdCkKPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiA+ICsKPiA+ICsgICAgICAgY3B1c19vZmZzZXQg
PSBmZHRfcGF0aF9vZmZzZXQoZmR0LCAiL2NwdXMiKTsKPiA+ICsgICAgICAgaWYgKGNwdXNfb2Zm
c2V0IDwgMCkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gY3B1c19vZmZzZXQ7Cj4gPiArCj4g
PiArICAgICAgIGZkdF9mb3JfZWFjaF9zdWJub2RlKGNwdV9vZmZzZXQsIGZkdCwgY3B1c19vZmZz
ZXQpIHsKPiB3aGF0IGFib3V0IHJpc2N2LG53b3JsZHMgPyBJIHRoaW5rIHlvdSBzaG91bGQgcGFy
c2UgdGhpcyBhbmQgYmFzZWQgb24KPiB0aGF0IGFzc3VtZSB3aWQgcmFuZ2UgLSBhbmQgcmVzdCBv
ZiB0aGUgd2lkcyBzaG91bGQgYmUgcmVqZWN0ZWQuCj4gPiArICAgICAgICAgICAgICAgZXJyID0g
ZmR0X3BhcnNlX2hhcnRfaWQoZmR0LCBjcHVfb2Zmc2V0LCAmaGFydGlkKTsKPiA+ICsgICAgICAg
ICAgICAgICBpZiAoZXJyKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
PiArCj4gPiArICAgICAgICAgICAgICAgaWYgKCFmZHRfbm9kZV9pc19lbmFibGVkKGZkdCwgY3B1
X29mZnNldCkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICsKPiA+
ICsgICAgICAgICAgICAgICBzY3JhdGNoID0gc2JpX2hhcnRpZF90b19zY3JhdGNoKGhhcnRpZCk7
Cj4gPiArICAgICAgICAgICAgICAgaWYgKCFzY3JhdGNoKQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIFNCSV9FTk9FTlQ7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgaGZlYXR1
cmVzID0gc2JpX2hhcnRfZmVhdHVyZXNfcHRyKHNjcmF0Y2gpOwo+ID4gKyAgICAgICAgICAgICAg
IGlmICghaGZlYXR1cmVzKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9F
Tk9FTlQ7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBj
cHVfb2Zmc2V0LCAicmlzY3YscG13aWQiLCAmbGVuKTsKPiA+ICsgICAgICAgICAgICAgICBpZiAo
dmFsICYmIGxlbiA9PSBzaXplb2YoZmR0MzJfdCkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGhmZWF0dXJlcy0+cG13aWQgPSBmZHQzMl90b19jcHUoKnZhbCk7Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBoZmVhdHVyZXMtPmhhc19wbXdpZCA9IHRydWU7Cj4gPiArICAgICAgICAg
ICAgICAgfQpPemE6IE5vdGhpbmcgcHJldmVudHMgYXNzaWduaW5nIHRoZSBzYW1lIFdJRCB0byBi
b3RoIE0tbW9kZSBhbmQgUy1tb2RlCi0gc2hvdWxkIG5vdCBiZSBpZGVudGljYWwgZm9yIGJvdGgg
d29ybGRzLgo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwg
Y3B1X29mZnNldCwgInJpc2N2LHBtd2lkbGlzdCIsICZsZW4pOwo+ID4gKyAgICAgICAgICAgICAg
IGlmICh2YWwgJiYgbGVuID09IDIgKiBzaXplb2YoZmR0MzJfdCkpIHsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGhmZWF0dXJlcy0+cG13aWRsaXN0ID0gKCh1NjQpZmR0MzJfdG9fY3B1KHZh
bFswXSkgPDwgMzIpIHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGZkdDMyX3RvX2NwdSh2YWxbMV0pOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiBP
emE6IHByb3ZpZGUgc29tZSBkZWZpbmVzIGZvciBtYWdpYyBudW1iZXJzLgo+ID4gKwo+ID4gKyAg
ICAgICAgICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgY3B1X29mZnNldCwgInJpc2N2LHBt
bHdpZGxpc3QiLCAmbGVuKTsKPiA+ICsgICAgICAgICAgICAgICBpZiAodmFsICYmIGxlbiA9PSAy
ICogc2l6ZW9mKGZkdDMyX3QpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBoZmVhdHVy
ZXMtPnBtbHdpZGxpc3QgPSAoKHU2NClmZHQzMl90b19jcHUodmFsWzBdKSA8PCAzMikgfAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZkdDMyX3Rv
X2NwdSh2YWxbMV0pOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAg
ICAgICAvKiBTYW5pdHkgY2hlY2tzICovCj4gPiArICAgICAgICAgICAgICAgaWYgKGhmZWF0dXJl
cy0+aGFzX3Btd2lkICYmIChoZmVhdHVyZXMtPnBtd2lkID49IDY0KSkKPiBPemE6ICBmZWF0dXJl
cy0+cG13aWQgPj1ud29ybGRzID8KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBT
QklfRUlOVkFMOwo+ID4gKyAgICAgICAgICAgICAgIGlmIChoZmVhdHVyZXMtPmhhc19wbXdpZCAm
JiBoZmVhdHVyZXMtPnBtd2lkbGlzdCAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICAhKGhmZWF0
dXJlcy0+cG13aWRsaXN0ICYgQklUX1VMTChoZmVhdHVyZXMtPnBtd2lkKSkpIHsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ID4gKyAgICAgICAgICAgICAg
IH0KPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiAr
Cj4gPiAgc3RhdGljIGludCBmZHRfcGFyc2VfdWFydF9ub2RlX2NvbW1vbihjb25zdCB2b2lkICpm
ZHQsIGludCBub2Rlb2Zmc2V0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcGxhdGZvcm1fdWFydF9kYXRhICp1YXJ0LAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGRlZmF1bHRfZnJlcSwKPiA+IGRp
ZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9nZW5lcmlj
L3BsYXRmb3JtLmMKPiA+IGluZGV4IDFkZjAyODBkLi41MWU5ZjM0MiAxMDA2NDQKPiA+IC0tLSBh
L3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9w
bGF0Zm9ybS5jCj4gPiBAQCAtMjU1LDExICsyNTUsMjIgQEAgaW50IGdlbmVyaWNfZmluYWxfaW5p
dChib29sIGNvbGRfYm9vdCkKPiA+Cj4gPiAgaW50IGdlbmVyaWNfZXh0ZW5zaW9uc19pbml0KGJv
b2wgY29sZF9ib290KQo+ID4gIHsKPiA+ICsgICAgICAgaW50IHJjOwo+ID4gKwo+ID4gICAgICAg
ICBpZiAoIWNvbGRfYm9vdCkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiAg
ICAgICAgIC8qIFBhcnNlIHRoZSBJU0Egc3RyaW5nIGZyb20gRkRUIGFuZCBlbmFibGUgdGhlIGxp
c3RlZCBleHRlbnNpb25zICovCj4gPiAtICAgICAgIHJldHVybiBmZHRfcGFyc2VfaXNhX2V4dGVu
c2lvbnNfYWxsX2hhcnRzKGZkdF9nZXRfYWRkcmVzcygpKTsKPiA+ICsgICAgICAgcmMgPSBmZHRf
cGFyc2VfaXNhX2V4dGVuc2lvbnNfYWxsX2hhcnRzKGZkdF9nZXRfYWRkcmVzcygpKTsKPiA+ICsg
ICAgICAgaWYgKHJjKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByYzsKPiA+ICsKPiA+ICsg
ICAgICAgLyogUGFyc2UgUklTQy1WIFdvcmxkcyBDUFUgcHJvcGVydGllcyBmcm9tIEZEVCAqLwo+
ID4gKyAgICAgICByYyA9IGZkdF9wYXJzZV93b3JsZHNfYWxsX2hhcnRzKGZkdF9nZXRfYWRkcmVz
cygpKTsKPiA+ICsgICAgICAgaWYgKHJjKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByYzsK
PiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICBpbnQgZ2VuZXJpY19k
b21haW5zX2luaXQodm9pZCkKPiA+IC0tCj4gPiAyLjQzLjcKPiA+Cj4gPgo+ID4gLS0KPiA+IG9w
ZW5zYmkgbWFpbGluZyBsaXN0Cj4gPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
