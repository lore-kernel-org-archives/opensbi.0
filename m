Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99408C43458
	for <opensbi@archiver.kernel.org>; Thu,  9 Jul 2026 00:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rT03dN4b4O92sw4VIcv5llvPWEWhPmWdYeXWV5yq1XY=; b=KsIJXJ3Vpq54i9
	qvIMBSaih5HpJv2E54gWOZ3xxLETxOYxyT6h0ejL/QXNvYHEJDE5BsoRJzS8DcaFqx2zkYgNuji96
	jL+0OwSHO0kDs/DL2ohNUf5UACi7d/2c3CHGMdJEI0s85elnc+fG3GNsdpt7QKRZ5dDvy/aWSSf0+
	CVuQnyOYGK2ARqJqlTfk7/oriE5WOfNHuKWOA52+7k1zawtcwIfJ4McpRwlE+/Adq8zat+3y+7naE
	ExKDKPTUDX0L32c7aqFwMZfjeNJlSg6RIIJu53/1e4yjxZRhXx5D5STMt7tItaL30VvwLZSHCH+Th
	Z7JdJkxWc5WOQPy1L1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcnv-00000000fJf-0HZt;
	Thu, 09 Jul 2026 00:39:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcns-00000000fJK-1Ln0
	for opensbi@lists.infradead.org;
	Thu, 09 Jul 2026 00:39:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668N8SqD024463
	for <opensbi@lists.infradead.org>; Thu, 9 Jul 2026 00:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCUAff7QV8wFOLjSkWoIbfJpgKvwtr56EguMmO8U6pQ=; b=Df+U3MRKkIYeSr9t
	JvxAE1W8ryj9K9a4yI0BxdFrIgb42R6VaxY77LHtusrYmBIWF25vlhWNYBKtre5B
	YzkeSNCaPOLAHvN0zcUAB9ZKttcEcuaXbHK6wj2XURmlbajrlJr5XLSy2nXysFje
	6+HI0RtT/Jl2051KxI1W67wmtQMtdJs3/76bqItOrnuqQOwY+Swt20NuR+/08iW0
	5T1PEDhbjAjAQe0NXbeIdmvczulY8fJVw9qDvxc6bYmgc2m8Dnx9RlstmTEV8BTQ
	heSa1K8Hyc40T1g031W2aJqFvytZjdrit+gg+rs0cdb3SE0qyJAIFBitCxzM7TDl
	+ue2/w==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv4265-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 09 Jul 2026 00:39:47 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7eb88e7f641so1839810a34.3
        for <opensbi@lists.infradead.org>; Wed, 08 Jul 2026 17:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783557586; cv=none;
        d=google.com; s=arc-20260327;
        b=Ij47OfGPBoD8CBjVcvvax/tpf8veEHixQ17LIjuZ8ar2FBtIqJqVrU8dkI5KoMvseZ
         dR8yVbLrUhJo/14Lu3DOBIzUjoBrzxrc8bivqc7BD998djpcCVv+biYqPGFnQsKC+6Oj
         +wKnhjmUii9iPM2y48xfpzv6nWEXwvBONZD/P1ErAT/SuSMyQfvo4vGUk7U5TCcJE2M2
         gc8bt8pgCCZVsmOoC7FBNufYFKNrJJYvLehOTv2ePR/UcpRLZTygC1uW/Gs9VF3gfyoV
         294/BIrBPHaUNfod+frBPi0hR6FRiCADwRPvrYn4/2iUvdIskRdqZO3H44UTsXeayguw
         8JAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCUAff7QV8wFOLjSkWoIbfJpgKvwtr56EguMmO8U6pQ=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=LC7yuy6en7vH6S0ggfjnwJkYSz3KAPwNVfy1gUZzOjpnmHL2yGrED0f+lM9/rToHOb
         PGosiqjMHS5jW0Fdbz3pB0f1F1O1RTZeLC8hC4VUFK6Va9RdZ+lDUvCb27g/XnOHXsZ1
         XUDl8YLD9Z3O0tFFY/eyUo0XS7VGn2y0hKc+N6St+WxXQtxNIHMqv+8vD1Ffbf5cB7aM
         vCPLqMJjOr7jNz9TgsBAYfFpuiq7sapeGA7SAuEDDpmM/M8UQGHI+1oZ0sgloBIjLBpE
         8LrEkwRj7cgOuKeWejdCyYHSxktb/tFuxEgoJcRwV3M/kQ9j8vhbUBgrKIDWiNGWLs1q
         sqLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783557586; x=1784162386; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCUAff7QV8wFOLjSkWoIbfJpgKvwtr56EguMmO8U6pQ=;
        b=I/360WUu5Gfurb6wp6RS3cy1jX+NV2wt+uX7sOELRtt6EgL6wXxWtDQiGYN5/v92Hw
         P8LhI1cr6QjFiLiNy1lRQ366qgMxmZl8KaCcokr8FOArEyW8nJyCpCamd5Nhh7fAfVba
         pzeTB3wgXXjMDkLxqT7arF6Yfy025A/1EeCCWbVMJsgl693LeCTglnkH5ukNt1zZZ5Sx
         CTCUwZlm86SVNtmCX+EIZgd+7aZM/iafY6QRE1YkDQoGxECqpOkqOMZ2RiLlkJHMKMx8
         ELraVe3NLDnRol8Ht+oSu3oKYE1ynsDkdGtVdlWhmd5nDdtUmBxp6B0Zy66N59JvroX0
         c/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783557586; x=1784162386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCUAff7QV8wFOLjSkWoIbfJpgKvwtr56EguMmO8U6pQ=;
        b=C44Hg4P2hkR0k7S5R57Kk/cVXUQifM3PJ4Neo63nCWUqnoaNxmXN2+3vMkVSTDtOV8
         E0d8bPRpNqq1JVbnvZ+AqjMgSGZfRPVEYK6YtorNW9qCutr24cvqpxzW8S0iJYlTf7jv
         0B40fmS0uJeSzmUoiM4RlgF5VTL38mWV6HmwayFhbV9We9ss5Hh+XHAhbP6BBR0ZzgWe
         5jskwNds3g4w9biqFhSHWsIOu45URqBbAB5uN2CjOpwAMbyhsSv38J6dl8n00+WovXxB
         S48iy7CoTFYNnZQ3voUlSfEorQT0rqyzlYMxqcqORRgWy1AIj93LFdcahT76158fmMcX
         Oycg==
X-Gm-Message-State: AOJu0YxeGE8b5mol5wmTRNNK25O3LfGgZHlOgaSd3DCuVSTM6wtOrV+S
	v/jUT5Vq1syIPwSIpqopNelcHlarOt/a4XYya2smanTXG1V7JOCAvT7qtjtZkbsf1er4gcb50rj
	DVEoRH0wD7xJDhEF9TSSlUZiYrJIrsgof3+EVEVqdw3tDZY1DFt2reVSHsneYoyxxsJgTogBN42
	U5lHB3F/cesAmZNx3yryyArf/k2rxNtgGdV3pNYa8t
X-Gm-Gg: AfdE7ckUgO8ycm8vrlV9syKiycxnDYb/IdYEf9GsutANKlgrsDOlj4CEyO4ju/LiEDA
	95dwV4T+cpMiiq7OnF522jZ6/8P6jetsuZ/9yZ/nojr0QWvuCS5NvHDVddKPZGUpN7SNh2AQZfQ
	o99TH4M5NTP0XJnb1kgMxe/6Pc4L+os9o64R9T2HRTzpiGihs7t7IeQyRc3gykyb8K9jP5
X-Received: by 2002:a05:6820:2d43:b0:6a1:7846:3c50 with SMTP id 006d021491bc7-6a36d9c12ffmr3673216eaf.42.1783557586239;
        Wed, 08 Jul 2026 17:39:46 -0700 (PDT)
X-Received: by 2002:a05:6820:2d43:b0:6a1:7846:3c50 with SMTP id
 006d021491bc7-6a36d9c12ffmr3673185eaf.42.1783557585814; Wed, 08 Jul 2026
 17:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com> <20260626101433.3133466-10-peter.lin@sifive.com>
In-Reply-To: <20260626101433.3133466-10-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:39:34 -0700
X-Gm-Features: AVVi8CcE6fSFWjtOTStPaPW6WXhJeseqtoviXm7vouPzghH982SUl_3Ucy7D5es
Message-ID: <CAAVgOk+==we31kXGJxG0XQeRY4B0e9rR3e_4PLT22WwVy-e-dQ@mail.gmail.com>
Subject: Re: [RFC PATCH 09/12] platform: generic: parse root domain WID config
 from DT
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4eedd3 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=JfrnYn6hAAAA:8 a=pFyQfRViAAAA:8
 a=eSJr3xy40Fot8KqyCHkA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDAwNCBTYWx0ZWRfX52AofKKfQ27V
 JMYNm9149408SqGbAxdDslBpCDDpCq4nJQpk0rHGKUqSUJHBWbvSLKb8FzCfNSkzsZmNeojONFJ
 m9yre0ylnO9LeJq5LID3ScnaIgEM9jY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDAwNCBTYWx0ZWRfX/SJJiwOe9iMf
 Nrae+dZtWhwhoGuFI1A1426lP1i6eH7Pz+h6pcFNVb5C+EA38t9rAbhEOCE+r+CB4Ajp+L4Dk8X
 rKEx2OxopPJwa/UsL/G4/BdYkuprObO/Q/sK0DgVgYevfn8ERTpx8MPCQMdnZ/h8Qzaqib0FhqY
 E1NWcM+6XjpDGR/XDNkLhAR2bmLAob3lpNFzxKekQC5wTJA+C3I13FWyiFb0FOFHS70mzjG7jKM
 hVr8PmKe5S42wsHGwcxNR1rfrlXTQaxCKHaQr5MdkaDlLwUYrFDbY6reFJK3TvQV5mNDHl/TmHF
 TE/G1VhDkGcUnzg69FHKf5Fu/nmPpMHkZgbqc2VeTDL//LNfT02V1SJKwvXwv3TxOaBGM7NrIzC
 5PsIv0vonJBBLQh2FbDwKNMa1U8wh5OiAY4Hw0FDKGYMj4iH9c9a/XeOnV/viU3d3V04JceZ0m+
 xJkQ1tY2fYgXb/L9CWw==
X-Proofpoint-ORIG-GUID: Dvtbb5_0V0pIJ9vQiG2sIsgjbHgyrJ9C
X-Proofpoint-GUID: Dvtbb5_0V0pIJ9vQiG2sIsgjbHgyrJ9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_173948_369384_635633AA 
X-CRM114-Status: GOOD (  19.42  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMzoxN+KAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gUGFyc2Ugcm9vdC1kb21haW4tbmV4dC13aWQg
KDMyLWJpdCkgYW5kIHJvb3QtZG9tYWluLW5leHQtd2lkbGlzdAo+ICg2NC1iaXQpIHByb3BlcnRp
ZXMgZnJvbSAvY2hvc2VuL29wZW5zYmksY29uZmlnIG5vZGUgZHVyaW5nCj4gZ2VuZXJpY19kb21h
aW5zX2luaXQoKS4gU2V0cyByb290Lm5leHRfd2lkL2hhc19uZXh0X3dpZCBhbmQKPiByb290Lm5l
eHRfd2lkbGlzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIu
bGluQHNpZml2ZS5jb20+Cj4gLS0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyB8IDIw
ICsrKysrKysrKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9y
bS5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4gaW5kZXggNTFlOWYzNDIuLmRlMTJk
ZWI1IDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+ICsrKyBiL3Bs
YXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+IEBAIC0xMSw2ICsxMSw3IEBACj4gICNpbmNsdWRl
IDxwbGF0Zm9ybV9vdmVycmlkZS5oPgo+ICAjaW5jbHVkZSA8c2JpL3Jpc2N2X2FzbS5oPgo+ICAj
aW5jbHVkZSA8c2JpL3NiaV9iaXRvcHMuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+
Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2hhcnRtYXNrLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2hl
YXAuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfcGxhdGZvcm0uaD4KPiBAQCAtMjc2LDcgKzI3Nyw5
IEBAIGludCBnZW5lcmljX2V4dGVuc2lvbnNfaW5pdChib29sIGNvbGRfYm9vdCkKPiAgaW50IGdl
bmVyaWNfZG9tYWluc19pbml0KHZvaWQpCj4gIHsKPiAgICAgICAgIGNvbnN0IHZvaWQgKmZkdCA9
IGZkdF9nZXRfYWRkcmVzcygpOwo+IC0gICAgICAgaW50IG9mZnNldCwgcmV0Owo+ICsgICAgICAg
Y29uc3QgZmR0MzJfdCAqdmFsOwo+ICsgICAgICAgaW50IGxlbiwgb2Zmc2V0LCByZXQ7Cj4gKyAg
ICAgICB1NjQgdmFsNjQ7Cj4KPiAgICAgICAgIHJldCA9IGZkdF9kb21haW5zX3BvcHVsYXRlKGZk
dCk7Cj4gICAgICAgICBpZiAocmV0IDwgMCkKPiBAQCAtMjkwLDYgKzI5MywyMSBAQCBpbnQgZ2Vu
ZXJpY19kb21haW5zX2luaXQodm9pZCkKPiAgICAgICAgICAgICAgICAgaWYgKG9mZnNldCA+PSAw
ICYmCj4gICAgICAgICAgICAgICAgICAgICBmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgb2Zmc2V0LCAi
c3lzdGVtLXN1c3BlbmQtdGVzdCIsIE5VTEwpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNi
aV9zeXN0ZW1fc3VzcGVuZF90ZXN0X2VuYWJsZSgpOwo+ICsKPiArICAgICAgICAgICAgICAgaWYg
KG9mZnNldCA+PSAwKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHBy
b3AoZmR0LCBvZmZzZXQsICJyb290LWRvbWFpbi1uZXh0LXdpZCIsICZsZW4pOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGlmICh2YWwgJiYgbGVuID09IHNpemVvZihmZHQzMl90KSkgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcm9vdC5uZXh0X3dpZCA9IGZkdDMyX3RvX2Nw
dSh2YWxbMF0pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcm9vdC5oYXNfbmV4
dF93aWQgPSB0cnVlOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBvZmZzZXQsICJyb290LWRvbWFp
bi1uZXh0LXdpZGxpc3QiLCAmbGVuKTsKT3phOiBSb290IGRvbWFpbiBXSUQgY29uZmlnIGlzIHNl
bWFudGljYWxseSBpZGVudGljYWwgdG8gcGVyLWRvbWFpbgpXSUQgY29uZmlnIGJ1dCBsaXZlcyBp
biBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IERUIGxvY2F0aW9uCnJvb3QgY2FuIGJlIGFub3RoZXIg
ZGVmYXVsdCBkb21haW4gdW5kZXIgY2hvc2VuIHsgb3BlbnNiaS1kb21haW5zIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBpZiAodmFsICYmIChsZW4gPT0gKDIgKiBzaXplb2YoZmR0MzJfdCkp
KSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsNjQgPSBmZHQzMl90b19j
cHUodmFsWzBdKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbDY0ID0gKHZh
bDY0IDw8IDMyKSB8IGZkdDMyX3RvX2NwdSh2YWxbMV0pOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcm9vdC5uZXh0X3dpZGxpc3QgPSB2YWw2NDsKPiArICAgICAgICAgICAgICAg
ICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gLS0KPiAyLjQzLjcKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
