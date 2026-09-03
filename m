Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C67AC624A4
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 16:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nt/6uHEVwNHcQUDGa6ymm544Nx2qnlVB2oBekeqFJyM=; b=Ixiidm0oTTASR8
	N22i+Dc988xr6Ayx311zpvlscWix1UeuFZ39ffXANFblH8jqu8wf0Menw232j8/zFqy5UFa12U0oH
	+iVzSvTirp98TjvXcjCb3aigFLgiiEvLye34uNuf+UAGcmeypXYjFuOkDAVFkV+rXN4gPLyy+t71Q
	pQlMkkbRgzUZD0XDorm0QKqfoqcAOL9zZumE50Zl0NtWiAh3OMaIczzxwqGycDfCNgy8gW2Exgy2R
	KQ5MF/7Po1P5J7/sAh9E/G1qDAtAXvkC0VkPqwjYh1xIj4hT73jRU8nwv3zGbNUh54vjLPZ1xkTbP
	KonUjk9Lx59PM1zMogVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Adw-00000000Da2-16ja;
	Thu, 03 Sep 2026 16:50:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Adu-00000000DZK-2z6Z
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 16:50:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G317X280683
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 16:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZpxwQj/Dc+l5LlEqjPZsno+IZ6jj9yzYhmvKKMJMRw=; b=po1T6d3n70IK1+r9
	zn6Cvr5aTARAaF2FhUc98N5lXzW29IAPZ/Wj3G1TVOWtCEHaLX1IbwNZB26lAHwh
	6sNRQOZDbyDh0DRnNCQxkXQFEYQ+SuHIc+w0IHRARfpAe3t1aUuedySiZyqgAB0Y
	+tcyFypW0kCLMLjfz1Zr6XcGzXa21/KdHmLle7Px9Ifd+Diz7yNmeft8dtTxtmz3
	Taa3JrsnvOSosAiamOVcl5CkMJUl+prEVr0ARQRhxGmIHD/L/mIt3Sx6SbSPcTjV
	UgeswOBuEbGbpIpo1RONfYV39zeMt4n1z0juvM3X/2FhXzl3pFIyKRRLrYbVEUBh
	GSpDkw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjub0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 16:50:25 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45e6091d8a1so1601251fac.1
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 09:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788454224; cv=none;
        d=google.com; s=arc-20260327;
        b=esdBobyinQtKoPZGLjPg9BXFeZQHQbYIS6f6NnwIncpTj8U+O4KT8xqkPQsFzjzHIK
         KmaID6oau2UWDIhn0uo8F8nPcqH+hcfVIzA7t8dOGjuYNdcZIKJvKvLZ7rejHZLbsTKc
         1mTdryt0zTS/uME7sLYA1Xdkwi3jg3xdzZ0cf1C65sdp63aJ9JL3fHBTXfbF/XpTXkzc
         r3vTyjy8utcbMpGh45Apbkw2be+1ZPU7mo1f4J0Ll3NuCkjO62ZnMk1l6i1mmsZb6+Zb
         bz9xb9G+1pnhwZzyGqsSFmrie9Wk7zXSeKiUV5W0WgCPHQ7vVcqXaARI6hZSR2nz0hSx
         yTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YZpxwQj/Dc+l5LlEqjPZsno+IZ6jj9yzYhmvKKMJMRw=;
        fh=4ewBQFYQm5N+QAVC2yDkcGgJqnoV8H9Ixi/6ZlMkFAE=;
        b=bgLIjHFyPl9FvKrfrsuUwOWAH+UHIsW9OJejzsEcACYAcBSS7KJFLzHE0NoWYN++dR
         AJtSA8yuMqVbDh7CR22XGYTzgXiAASCpONJJMQFRY7LcF2mSAT024Rm4TCwBsptTs4QJ
         xbJFpy1xrSTOnxHkvfdveAW6xMsieFxq6pkRcr37KmWgG8g+E9RifpX425DbR0+xZdLx
         fAhxCc6Ej6mF9oSPtW27q/FOOppwTWRFmU1RgM+ieRqTE5fbn7ilWI1OD/Z6ImBnRHnh
         DFkixspGLmbMCs3PqEDhMmCl6Ybu/AeukZ1ikM/SRTWMaeFelqRk1ieMQ6XylDNY4fJM
         GEXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788454224; x=1789059024; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YZpxwQj/Dc+l5LlEqjPZsno+IZ6jj9yzYhmvKKMJMRw=;
        b=dH77gaW3uvB8qn5RmKJ5pax+rAHj+ZIYGHcIsGkuGCOSS4lZsmuljpg15/xsYO1+iA
         aFLiHao8BbEAm7rQSPJcEISAVVeKtiqEHWVcQMtmDqwzlMu/UDamly3cmPz4fomtxxgm
         n9Fy4enRxkJUAHfivGIYXMCXfmUGHGGzDMsOa3Jt9p6uImTWRhAE8/Zss1ifRPoKlyY5
         sbpbL2Mv2q6BcWRJ/o2Ry0sgIJZvJAA5rrpcDZCOD+E+xpKYHqIhsbR2e0jboTMEL9uh
         jCyH+IVzJUEon1vuQjX03EYVc9tmYmuQJ/H3Pm01vfc5LwcPb5m2ZrqUXxdnW6X+cVX8
         //sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454224; x=1789059024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZpxwQj/Dc+l5LlEqjPZsno+IZ6jj9yzYhmvKKMJMRw=;
        b=sUW666Enx52oIaX7PXHDw0URRgq0xhnjfY4ECvlk5Il6sl2eSzODkJhQgqie4UHcEA
         UPyO6mjQnbq3rm2nZKCvLhAU11OhaXAsFQ9fyi1+KmW/bajUr+IZYDNxMvJQb3+lJdJo
         malHEiLl6DRvoTltNsMaJjNXs3qoGjEK9NlUKBvCPpjfcxoZ99x0gTucgTzFbvBdpahH
         lOCeuLD8xsSDq8moe66MCoU9+TvTE3R/S5ZmO7dTuBaG9RlvozD/mzbATChNYy4GOqDg
         eiP95O6++SkQ8BQn1RJNNuJpHLaJu8VtsmEZM6ta+7SL1okZnMrjXzscwjd3GO4QKkpH
         8t+w==
X-Gm-Message-State: AFuF++lYC3U/TdAaZmljxoTAMlN4NH+fS75bE/UqitlSONjMmBUB1nYM
	c0sHiRj9y5cLBP2XCp99jQV+5oX5Tgv44mOnwvd9oz3Y/916awyBiONdI5JHYVJ23S5qZmkcmlb
	ns2B/5R090w7/HcPUoHRmh30ybSEDa1iHuftGKSuYO8Vn38yvM8ps0a6c6K0oN0u08EFeg+1zRf
	03TpmTGKkLxbuu5HP+Osa6tMvQ843P5pK4rxUoLEFp
X-Gm-Gg: AYBFou3fm0FBiEdDPXHxKS9V7IU9KyddlOJMe+MY0QJmVIpvliiOZggyCgB7QxeVtTa
	Bg2wcpnb1Q099JjPXssU1eO3S+0hu5xrOD1klSS3U+JXzgo6lFF353vC6NJeKXgA+rpI5NWh4sQ
	3PKhXOmTAakWgFSlhqhxw2mcNklOPfZuD9NRvrFR2lqAK+SWGpuabW3oDHuA==
X-Received: by 2002:a05:687c:20c3:b0:456:772f:682d with SMTP id 586e51a60fabf-47552190262mr240334fac.19.1788454224544;
        Thu, 03 Sep 2026 09:50:24 -0700 (PDT)
X-Received: by 2002:a05:687c:20c3:b0:456:772f:682d with SMTP id
 586e51a60fabf-47552190262mr240295fac.19.1788454224097; Thu, 03 Sep 2026
 09:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com> <20260817090503.2104998-2-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-2-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:50:12 -0700
X-Gm-Features: AcwNN1Wc9TDN59fqiEm1x1eiGzKi48EcjHg2Zr74BBXdBphFCXMYns9rhoiobzg
Message-ID: <CAAVgOk+Ln_hbJh05ei6X+0Omc5EPTY02i9oBQe4y7r2Yt9Yyew@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] lib: sbi_hart: detect RISC-V Worlds ISA extensions
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com, krzk@kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE0NiBTYWx0ZWRfX6gCbl4Ubppd5
 46MmfO0m+ysGqiws+sK2Ow/Wsf7jI9BkF9y46oCsFW16dAg4C+IAvuJEpN632rUiCRyFNPYvKJj
 hsGj3jbpBTdCuJYqozBQQeKPG2guQ3OglMs/M2BgPQ+qyJSelF7qZLUdYmXTT5cdTaJ5IOw6XvR
 kIUw9YGiZ20n8qHiI0vDXw6MyrptNZhwj9nHuKSIzcY0v1kpnvHPlYeoyx3YPIOe9g1k04o1YHj
 5SHB0OyPjq5TIOL/lwnT77IM2rlDea64Uws4S+Tk8FCAK0D4W4pBxrXX/nB/K6J8jpidciz7QY6
 EETxsy3nxoJc7LVV3DzdCGcSMHScB5xsPExmCF6Dsu1VLURDP/uFlvt6ivXiCqQzZkJ097CXPAo
 mJRKBGuyibC9egkBZ+wvwpy5dsXpz0muV0aDhJhFc7Ffm2343Y/tzvfhq55ddvSPFASOvcxQq21
 V/R94YVmWFU70idD2dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE0NiBTYWx0ZWRfX/wd5W2ToFAGx
 58UBCoq5MxVLTvrEk/3zfycHsez35+/5VBQK4R43eDKixniskt8LVZR3rCS879+XDIaAXNbcz+Q
 xnEGe5XiCR8w4QhiNUyn0FjMfEAoCxs=
X-Proofpoint-GUID: IIL2UqCIc8Brd9p5JeeVH1LZQyxmMoQp
X-Proofpoint-ORIG-GUID: IIL2UqCIc8Brd9p5JeeVH1LZQyxmMoQp
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a99a551 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=6CGwTRctmA5Bqn5jCvAA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_095026_756074_B9D37405 
X-CRM114-Status: GOOD (  19.20  )
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

T24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMjowNeKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIENTUiBkZWZpbml0aW9ucyBmb3IgUklT
Qy1WIFdvcmxkcyAobXdpZCwgbWx3aWQsIG1sd2lkbGlzdCwKPiBtd2lkZGVsZWcsIHNsd2lkKSBh
bmQgZGV0ZWN0IFdvcmxkcyBleHRlbnNpb25zIHZpYSBDU1IgcHJvYmVzCj4gaW4gaGFydF9kZXRl
Y3RfZmVhdHVyZXMoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgg
fCAxMiArKysrKysrKysrKysKPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICB8IDEwICsr
KysrKysrKysKPiAgbGliL3NiaS9zYmlfaGFydC5jICAgICAgICAgICB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggYi9pbmNsdWRlL3NiaS9y
aXNjdl9lbmNvZGluZy5oCj4gaW5kZXggZmZlNzY2NmMuLmUwMjYyYmZjIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiArKysgYi9pbmNsdWRlL3NiaS9yaXNjdl9l
bmNvZGluZy5oCj4gQEAgLTQwMCw2ICs0MDAsOSBAQAo+ICAvKiBTdXBlcnZpc29yIFJlc291cmNl
IE1hbmFnZW1lbnQgQ29uZmlndXJhdGlvbiBDU1JzICovCj4gICNkZWZpbmUgQ1NSX1NSTUNGRyAg
ICAgICAgICAgICAgICAgICAgIDB4MTgxCj4KPiArLyogU3VwZXJ2aXNvciBsb3dlci1wcml2aWxl
Z2UgbW9kZSBXb3JsZCBJRCBDU1IgKFNzd2lkKSAqLwo+ICsjZGVmaW5lIENTUl9TTFdJRCAgICAg
ICAgICAgICAgICAgICAgICAweDE5MAo+ICsKPiAgLyogTWFjaGluZS1MZXZlbCBDb250cm9sIHRy
YW5zZmVyIHJlY29yZHMgQ1NScyAqLwo+ICAjZGVmaW5lIENTUl9NQ1RSQ1RMICAgICAgICAgICAg
ICAgICAgICAgMHgzNGUKPgo+IEBAIC01MjAsNiArNTIzLDE1IEBACj4gICNkZWZpbmUgQ1NSX01U
SU5TVCAgICAgICAgICAgICAgICAgICAgIDB4MzRhCj4gICNkZWZpbmUgQ1NSX01UVkFMMiAgICAg
ICAgICAgICAgICAgICAgIDB4MzRiCj4KPiArLyogTWFjaGluZSBXb3JsZCBJRCBDU1JzIChTbXdp
ZCwgU21sd2lkLCBTbWx3aWRsaXN0LCBTbXdpZGRlbGVnKSAqLwo+ICsjZGVmaW5lIENTUl9NTFdJ
RCAgICAgICAgICAgICAgICAgICAgICAweDM5MAo+ICsjZGVmaW5lIENTUl9NV0lEICAgICAgICAg
ICAgICAgICAgICAgICAweDc0OQo+ICsjZGVmaW5lIENTUl9NV0lEREVMRUcgICAgICAgICAgICAg
ICAgICAweDc0OAo+ICsjZGVmaW5lIENTUl9NTFdJRExJU1QgICAgICAgICAgICAgICAgICAweDc0
QQo+ICsKPiArLyogbXdpZCBsb2NrIGJpdCAqLwo+ICsjZGVmaW5lIE1XSURfTE9DSyAgICAgICAg
ICAgICAgICAgICAgICAoX1VMKDEpIDw8IChfX3Jpc2N2X3hsZW4gLSAxKSkKPiArCj4gIC8qIE1h
Y2hpbmUgTWVtb3J5IFByb3RlY3Rpb24gKi8KPiAgI2RlZmluZSBDU1JfUE1QQ0ZHMCAgICAgICAg
ICAgICAgICAgICAgMHgzYTAKPiAgI2RlZmluZSBDU1JfUE1QQ0ZHMSAgICAgICAgICAgICAgICAg
ICAgMHgzYTEKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUv
c2JpL3NiaV9oYXJ0LmgKPiBpbmRleCA1NDMzOTNiYi4uMjk0MTgwOWUgMTAwNjQ0Cj4gLS0tIGEv
aW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBA
QCAtOTUsNiArOTUsMTYgQEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25zIHsKPiAgICAgICAgIFNC
SV9IQVJUX0VYVF9GLAo+ICAgICAgICAgLyoqIEhhcnQgaGFzIEQgZXh0ZW5zaW9uICovCj4gICAg
ICAgICBTQklfSEFSVF9FWFRfRCwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBTbXdpZCBleHRlbnNp
b24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9TTVdJRCwKPiArICAgICAgIC8qKiBIYXJ0IGhh
cyBTbWx3aWQgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfU01MV0lELAo+ICsg
ICAgICAgLyoqIEhhcnQgaGFzIFNtbHdpZGxpc3QgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklf
SEFSVF9FWFRfU01MV0lETElTVCwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBTbXdpZGRlbGVnIGV4
dGVuc2lvbiAqLwo+ICsgICAgICAgU0JJX0hBUlRfRVhUX1NNV0lEREVMRUcsCj4gKyAgICAgICAv
KiogSGFydCBoYXMgU3N3aWQgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfU1NX
SUQsCj4KPiAgICAgICAgIC8qKiBNYXhpbXVtIGluZGV4IG9mIEhhcnQgZXh0ZW5zaW9uICovCj4g
ICAgICAgICBTQklfSEFSVF9FWFRfTUFYLAo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0
LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCBiZWU4ODU1Ny4uZjVmNDA2MmUgMTAwNjQ0
Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4g
QEAgLTM2MCw2ICszNjAsMTEgQEAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0X2V4dF9kYXRhIHNiaV9o
YXJ0X2V4dFtdID0gewo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQSh2LCBTQklfSEFSVF9F
WFRfViksCj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKGYsIFNCSV9IQVJUX0VYVF9GKSwK
PiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoZCwgU0JJX0hBUlRfRVhUX0QpLAo+ICsgICAg
ICAgX19TQklfSEFSVF9FWFRfREFUQShzbXdpZCwgU0JJX0hBUlRfRVhUX1NNV0lEKSwKPiArICAg
ICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21sd2lkLCBTQklfSEFSVF9FWFRfU01MV0lEKSwKPiAr
ICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21sd2lkbGlzdCwgU0JJX0hBUlRfRVhUX1NNTFdJ
RExJU1QpLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbXdpZGRlbGVnLCBTQklfSEFS
VF9FWFRfU01XSURERUxFRyksCj4gKyAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHNzd2lkLCBT
QklfSEFSVF9FWFRfU1NXSUQpLAo+ICB9Owo+Cj4gIF9TdGF0aWNfYXNzZXJ0KFNCSV9IQVJUX0VY
VF9NQVggPT0gYXJyYXlfc2l6ZShzYmlfaGFydF9leHQpLAo+IEBAIC02NDcsOSArNjUyLDMwIEBA
IF9fcG1wX3NraXA6Cj4gICAgICAgICAvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0IHNkdHJpZyAo
ZGVidWcgdHJpZ2dlcnMpICovCj4gICAgICAgICBfX2NoZWNrX2V4dF9jc3IoU0JJX0hBUlRfUFJJ
Vl9WRVJfVU5LTk9XTiwKPiAgICAgICAgICAgICAgICAgICAgICAgICBDU1JfVFNFTEVDVCwgU0JJ
X0hBUlRfRVhUX1NEVFJJRyk7Cj4gKyAgICAgICAvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBT
bXdpZCAqLwo+ICsgICAgICAgX19jaGVja19leHRfY3NyKFNCSV9IQVJUX1BSSVZfVkVSX1VOS05P
V04sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgQ1NSX01XSUQsIFNCSV9IQVJUX0VYVF9TTVdJ
RCk7Cj4gKyAgICAgICAvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBTbWx3aWQgKi8KPiArICAg
ICAgIF9fY2hlY2tfZXh0X2NzcihTQklfSEFSVF9QUklWX1ZFUl9VTktOT1dOLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIENTUl9NTFdJRCwgU0JJX0hBUlRfRVhUX1NNTFdJRCk7Cj4gKyAgICAg
ICAvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBTbWx3aWRsaXN0ICovCj4gKyAgICAgICBfX2No
ZWNrX2V4dF9jc3IoU0JJX0hBUlRfUFJJVl9WRVJfVU5LTk9XTiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICBDU1JfTUxXSURMSVNULCBTQklfSEFSVF9FWFRfU01MV0lETElTVCk7Cj4gKyAgICAg
ICAvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBTbXdpZGRlbGVnICovCj4gKyAgICAgICBfX2No
ZWNrX2V4dF9jc3IoU0JJX0hBUlRfUFJJVl9WRVJfVU5LTk9XTiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICBDU1JfTVdJRERFTEVHLCBTQklfSEFSVF9FWFRfU01XSURERUxFRyk7Cj4KPiAgI3Vu
ZGVmIF9fY2hlY2tfZXh0X2Nzcgo+Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogc2x3aWQgdHJh
cHMgb24gYWNjZXNzIHdoZW4gbXdpZGRlbGVnPTAgKHJlc2V0IHN0YXRlKSwgc28KPiArICAgICAg
ICAqIFNzd2lkIHByZXNlbmNlIGlzIGluZmVycmVkIGZyb20gU213aWRkZWxlZy4KPiArICAgICAg
ICAqLwo+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hB
UlRfRVhUX1NNV0lEREVMRUcpKSB7Cj4gKyAgICAgICAgICAgICAgIF9fc2JpX2hhcnRfdXBkYXRl
X2V4dGVuc2lvbihoZmVhdHVyZXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBTQklfSEFSVF9FWFRfU1NXSUQsIHRydWUpOwo+ICsgICAgICAgfQo+ICsKPiAg
I2RlZmluZSBfX2NoZWNrX2Nzcl9leGlzdGVuY2UoX19jc3IsIF9fY3NyX2lkKSAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gICAgICAgICBjc3JfcmVhZF9hbGxvd2VkKF9fY3NyLCAmdHJhcCk7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgaWYgKCF0cmFwLmNh
dXNlKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAt
LQo+IDIuNDMuNwo+CgpSZXZpZXdlZC1ieTogUGF3YW5kZWVwIE96YSA8cGF3YW5kZWVwLm96YUBv
c3MucXVhbGNvbW0uY29tPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
