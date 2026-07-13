Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F24FC43458
	for <opensbi@archiver.kernel.org>; Mon, 13 Jul 2026 20:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pi/62fDtk5Wc3u6a5FzhKaMjTvkeXBASf2vrbERkzEw=; b=mRt+Bt+C/Sdgfz
	wz6G1+lQFe7Qow2eLukC6iHh07jqwH3DoQUwLwyK/LPtCYFF4yZDX5aczEeaWvHqxCDKrTj2f5Kt7
	59ydQI+QRocbANharSTPoMZJPGcJzhYeZqpitKT50EaUES+/4tGUI+9gMvC0hHunRCXifA6yTdi6H
	0b89SU8O02ePl8kdtgiwgwmvB56bEfRhGCQhzL/f4wX5j/QK8PNAxbPMQCKjfzs+mNs45BAM9Q5Tj
	RgBnkb6WlkCfmCWv0wWgqGJNLOJ0wgsMDxBVzNTC8ENM4wdmYDFx3gDsjtaOC+gmXGYGpwTbOtlVl
	4Hw+gCSKItbryO6Z++Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjNju-0000000APt3-1Nou;
	Mon, 13 Jul 2026 20:58:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjNjr-0000000APsg-33Pj
	for opensbi@lists.infradead.org;
	Mon, 13 Jul 2026 20:58:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9YlO2356009
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 20:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRNhFhk3SYmC8roQdurP6qpmsi0kO9fvHyMukB9ZBwI=; b=iDJP1tBjto9NJGSG
	xBDQfQT0Nee+u7TdGlYfNT8iejVuMpMIh5vxvuhiRIWNSbl22OKbv4b+7UiEH3lz
	a9tL5yBH3wYNj2rM358NdwwJwvNi02McBnBn6O8b1/Plx66p/D9+v9X57K5feCiU
	b8YqjH1RxjFP4gKIx/vD0Jd8g4fytV3waHDv/PEjuqwkePnUJWmf+lCQOVe6gOWI
	JM14ld+mVeBgVINgDqUStkB87/Nmfx5cnQEt3fC7IbZeN7bg4qlcfP3I4hd0TwLQ
	Nk2fMJqnG1KHgysywlRx2P2ok5MPtikh/HqIO2XUhaVVxw+VUrLjFPwXBhupA/rP
	U81MlA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4thb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 20:58:54 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a13b72112dso4870714eaf.2
        for <opensbi@lists.infradead.org>; Mon, 13 Jul 2026 13:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783976333; cv=none;
        d=google.com; s=arc-20260327;
        b=AsMjl+AdHe6gJizxuxKbkxBJQLDR8z/S2VpA5+suiLBnEXiRDNYT8nKFFFO8coRwXw
         KRr33ga1Ctl0EXnoLCBn4NNRg3ZnxoVxiXfu6GEr9ImM5/jX/1MYW5ONg62Xcz+fsDHi
         JHRA3gkp8Ef65BvLo+WwSpKvmOn5JJacOItFSgCvxTOeYDqDwXDiT96V+d2P2M6hnBkq
         HJoIvtVhiT+HOubnSJp0TnlOLzjgRujZ+Fu1HIIYzi9b4nEhVtFmu+rHo09XH2+AswgS
         CDSVt0e6WH7g41EotU1ajns5MejyjN3AGe4UDaZVUD7IjK0omOfgv8Nqt8XlT6yjvS0Z
         mX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRNhFhk3SYmC8roQdurP6qpmsi0kO9fvHyMukB9ZBwI=;
        fh=cyWYA3kXN4M7205T7O+U3EeZKBOqXRScKUv8W0MgTLc=;
        b=Pu2AYeqak13opdAp67IGB79/MqCgUeYp69Z6E1vAeGN2+87ytB0KRNzDpeuVNoPA2N
         SRZLgC5XD7zdsEVEKxUBqbFu/bbnreas1tcWva6ifYjKS2MGaywAK3NGkln+W7N9sLvg
         Bk2fZVA/xcAJaOuQlTNKrJeyNoPHAMxMd9ZS349S5hdZXM2doxtSSsHKQYsANWe5sJqb
         l+YfZzdbvGe9B1QS0M1BySTIbLL7hW6fucuAvspEuibzDCYK3rWSzzGvyRoFWvjogeK0
         N7iupVd9MIhcFEcMPjhdcSzEpMuf0HanA9h1FX0ARisK0ZnkOszSVlU7xc8b55tkY6hT
         Bcaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783976333; x=1784581133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRNhFhk3SYmC8roQdurP6qpmsi0kO9fvHyMukB9ZBwI=;
        b=GxTBdAT2g6E6Oep/rV14LjVuEBZe2jVqv8tEgJgrFpckJLJLzxK0HpItOZzvDxoRp4
         8tY0AsL9hKDQMVx+ZGXUrYbdIXDE1B9bTlw9y6NiWF3hzfGlJPky7iT0gO6fsnJcCuOG
         +iG60jARg3IwVhoUW5osSELNMwAdreNMQT4kIZOLtnWl9HkC7D/3YgBTQcI11EIL9QJu
         W4qO0ooGJTO5pEHhtMj3IVubNUlMCOWdzVQ/G+wrknnGD42/H9vd6NI6j2KNR5DNanct
         +ic+r7UwjMntgD+jzceFscnNyJSynkqJ16YElSfj9dgAnoNSIrg3X/zyYK+arreIpWIS
         VfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783976333; x=1784581133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRNhFhk3SYmC8roQdurP6qpmsi0kO9fvHyMukB9ZBwI=;
        b=ghvicIsne3rpPBLIxZn1DQ85q3NTsRKc3eh+h466RfC2yjvRus/26GqC3yt71VpZ3+
         5PhthFfWj9ixfuZb26q2MUVlmZj1Bd6W6jNUvmJdkUNtyi2kYxpx+HqX3bzAI3Ulld0U
         Fo+KnUa1OVkedG+g8sR6lycHhNZXB1nmFHO3LIFaz2qJVe41WJrr1cgRux/LiC7ObSOV
         9GhLyNrbjTyEE0qE9ivBEEybC+a8aFyZCaiCPCX/uRBfuxBdiqCRQf9tftugsQY69DJx
         b5TtZy264PjlHXCdeVzH2DcS6yVb7++xuYiFqkhcuBCLaYL/IkZ1E0tMGeAjrpcAbaXa
         v2qg==
X-Gm-Message-State: AOJu0YzvtoX4g3Y+db3UWsIY1q3DNRQDQg/DDo7HujNfGBzq3D9UMVf2
	zYOo/5+4Six855gEgFCDZFfk/kSgjbAXOSlEKa26kNkn/BVW2iVyt8JJkaAuiujh3+l/9okk/UL
	3YqYgU6QNe6C07xcGZ3Cow7foqO4dDl9RSmhjK3Z1MW/vGcIUF1gSrzhdcmANmugG2EBcLXe4DK
	u94eJJnNffuJzzB39J86iFtHgHnpc8tA2puFd3wo54
X-Gm-Gg: AfdE7ckI58mrshE+HpTMX0p1UgKpitkjbO+98ZGKF//RXNxKtdAzmkEIwqqRmikoEHH
	hqwfnmZW761JizwrhyDUr4/CIfOyAP6lNFnD+fNa+aeRe9EtpexcXU1Dqz286We8a+xDDqdO2lv
	D1riWwfNjS6HZzD/Y/38k5Z/zmZiI4gegwHJlJVKg958aIY0gqT15c+sxGZE647B96h3gR
X-Received: by 2002:a05:6820:1997:b0:6a3:75fe:7b3f with SMTP id 006d021491bc7-6a39a850f4emr6386776eaf.60.1783976333418;
        Mon, 13 Jul 2026 13:58:53 -0700 (PDT)
X-Received: by 2002:a05:6820:1997:b0:6a3:75fe:7b3f with SMTP id
 006d021491bc7-6a39a850f4emr6386756eaf.60.1783976332988; Mon, 13 Jul 2026
 13:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260626101433.3133466-1-peter.lin@sifive.com> <20260626101433.3133466-2-peter.lin@sifive.com>
In-Reply-To: <20260626101433.3133466-2-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:58:42 -0700
X-Gm-Features: AVVi8CcY2f2J0dICKqaJ74rtYmeE5TMl-8C2yzSjfA3z57WmOGGZV_y0zXOMqeo
Message-ID: <CAAVgOkKCxOJU1jfc3q-y5JgvXXmkpGKo3HnmmmZOmSKSq3cZmA@mail.gmail.com>
Subject: Re: [RFC PATCH 01/12] lib: sbi_hart: detect RISC-V Worlds ISA extensions
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a55518e cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=JfrnYn6hAAAA:8 a=pFyQfRViAAAA:8
 a=M3Nk2cr6U4MXetpcIBgA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIxNyBTYWx0ZWRfXznZqE7qjmbIb
 0HJWKIs5zjH3Yr+RxsjcmOKEvSg3I2eTRc1K+wuZWyz0FlpXSYTGkvlXwosEfvOe4dBn6nHtem0
 ww0Sld5ZsjiPlr1vGTvoqsLytVjB4HM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIxNyBTYWx0ZWRfX//JHW6EyH2ln
 9pHYvtu15FYvpslmlh2L3IhvlOrzcwdLcAMJwLVIYlryeN2nlsVYy7jbLsOLEihzqGCcdWaPJz5
 rUMAamYb2bRdL4yf+EJihd+DWd/elRaIqpTQCOiPvOCzT89yl5PBTdDlZTLLS5BfU5IgTaVmykJ
 ow7CYS2F5DdqQXyJ59FkE9gg8X9U5WcrE3rmT3p3dcA9CwRH4IeUJUhjAEeEoI1TIv+/ndpMNb+
 XmlPPYzR3m+ZIolpbOuTwKcRV1cJPWeAuKQnhfzyDjQoqcGR9PkRmOuAXmlNRI/QsT9SkGZ/QVp
 FG43Lt5XfBRBSBTb6Iybo6Ax6kzQLUfzRnQZjigAl8rBwcoZwLw8mXPbbadRkKvH+er6+1CkvVg
 H5swV2Pxv00D7o2UKlsdnXHpVccZoGNJw7Q1FAukqBdB7X5ouXz9v9m1acYOBL3NVMctj9PxLD0
 oQMJtpQUKhCUcki/5ag==
X-Proofpoint-ORIG-GUID: geUo20FI-StHADcLzrcCYaHEYJy0eW3t
X-Proofpoint-GUID: geUo20FI-StHADcLzrcCYaHEYJy0eW3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_135855_896077_C7E211D8 
X-CRM114-Status: GOOD (  21.50  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMzoxNuKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIGRldGVjdGlvbiBmb3IgUklTQy1WIFdv
cmxkcyBJU0EgZXh0ZW5zaW9ucyAoU213aWQsIFNtbHdpZCwKPiBTbWx3aWRsaXN0LCBTbXdpZGRl
bGVnLCBTc3dpZCkgdmlhIElTQSBzdHJpbmcgZGV0ZWN0aW9uIGFuZAo+IENTUiBwcm9iZXMuCj4K
PiBUaGVzZSBmZWF0dXJlIGZsYWdzIGVuYWJsZSBzdWJzZXF1ZW50IHBhdGNoZXMgdG8gY29uZGl0
aW9uYWxseQo+IGNvbmZpZ3VyZSBXb3JsZCBJRCBDU1JzIGFuZCBwcmludCBib290LXRpbWUgV29y
bGRzIHN0YXR1cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIu
bGluQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggfCAx
MiArKysrKysrKysKPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICB8IDEwICsrKysrKysK
PiAgbGliL3NiaS9zYmlfaGFydC5jICAgICAgICAgICB8IDUxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oIGIvaW5jbHVkZS9zYmkv
cmlzY3ZfZW5jb2RpbmcuaAo+IGluZGV4IGZmZTc2NjZjLi4yNzE4MjBmZCAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gKysrIGIvaW5jbHVkZS9zYmkvcmlzY3Zf
ZW5jb2RpbmcuaAo+IEBAIC00MDAsNiArNDAwLDkgQEAKPiAgLyogU3VwZXJ2aXNvciBSZXNvdXJj
ZSBNYW5hZ2VtZW50IENvbmZpZ3VyYXRpb24gQ1NScyAqLwo+ICAjZGVmaW5lIENTUl9TUk1DRkcg
ICAgICAgICAgICAgICAgICAgICAweDE4MQo+Cj4gKy8qIFN1cGVydmlzb3IgV29ybGQtSUQgQ1NS
IChTc3dpZCkgKi8KPiArI2RlZmluZSBDU1JfU0xXSUQgICAgICAgICAgICAgICAgICAgICAgMHgx
OTAKT3phOiBNaXNsZWFkaW5nIGNvbW1lbnQgLQpzaG91bGQgYmUKU3VwZXJ2aXNvciBXSUQgdmFs
dWUgZm9yIGxvd2VyIHByaXZpbGVnZSBtb2RlcyBSZWdpc3Rlcgo+ICsKPiAgLyogTWFjaGluZS1M
ZXZlbCBDb250cm9sIHRyYW5zZmVyIHJlY29yZHMgQ1NScyAqLwo+ICAjZGVmaW5lIENTUl9NQ1RS
Q1RMICAgICAgICAgICAgICAgICAgICAgMHgzNGUKPgo+IEBAIC01MjAsNiArNTIzLDE1IEBACj4g
ICNkZWZpbmUgQ1NSX01USU5TVCAgICAgICAgICAgICAgICAgICAgIDB4MzRhCj4gICNkZWZpbmUg
Q1NSX01UVkFMMiAgICAgICAgICAgICAgICAgICAgIDB4MzRiCj4KPiArLyogTWFjaGluZSBXb3Js
ZC1JRCBDU1JzIChTbXdpZCwgU21sd2lkLCBTbWx3aWRsaXN0LCBTbXdpZGRlbGVnKSAqLwo+ICsj
ZGVmaW5lIENTUl9NTFdJRCAgICAgICAgICAgICAgICAgICAgICAweDM5MAo+ICsjZGVmaW5lIENT
Ul9NV0lEICAgICAgICAgICAgICAgICAgICAgICAweDM5MQo+ICsjZGVmaW5lIENTUl9NV0lEREVM
RUcgICAgICAgICAgICAgICAgICAweDc0OAo+ICsjZGVmaW5lIENTUl9NTFdJRExJU1QgICAgICAg
ICAgICAgICAgICAweDc0OQo+ICsKPiArLyogbXdpZCBsb2NrIGJpdCAqLwo+ICsjZGVmaW5lIE1X
SURfTE9DSyAgICAgICAgICAgICAgICAgICAgICAoX1VMKDEpIDw8IChfX3Jpc2N2X3hsZW4gLSAx
KSkKPiArCj4gIC8qIE1hY2hpbmUgTWVtb3J5IFByb3RlY3Rpb24gKi8KPiAgI2RlZmluZSBDU1Jf
UE1QQ0ZHMCAgICAgICAgICAgICAgICAgICAgMHgzYTAKPiAgI2RlZmluZSBDU1JfUE1QQ0ZHMSAg
ICAgICAgICAgICAgICAgICAgMHgzYTEKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hh
cnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBpbmRleCA1NDMzOTNiYi4uMjk0MTgwOWUg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ICsrKyBiL2luY2x1ZGUvc2Jp
L3NiaV9oYXJ0LmgKPiBAQCAtOTUsNiArOTUsMTYgQEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25z
IHsKPiAgICAgICAgIFNCSV9IQVJUX0VYVF9GLAo+ICAgICAgICAgLyoqIEhhcnQgaGFzIEQgZXh0
ZW5zaW9uICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfRCwKPiArICAgICAgIC8qKiBIYXJ0IGhh
cyBTbXdpZCBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9TTVdJRCwKPiArICAg
ICAgIC8qKiBIYXJ0IGhhcyBTbWx3aWQgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9F
WFRfU01MV0lELAo+ICsgICAgICAgLyoqIEhhcnQgaGFzIFNtbHdpZGxpc3QgZXh0ZW5zaW9uICov
Cj4gKyAgICAgICBTQklfSEFSVF9FWFRfU01MV0lETElTVCwKPiArICAgICAgIC8qKiBIYXJ0IGhh
cyBTbXdpZGRlbGVnIGV4dGVuc2lvbiAqLwo+ICsgICAgICAgU0JJX0hBUlRfRVhUX1NNV0lEREVM
RUcsCj4gKyAgICAgICAvKiogSGFydCBoYXMgU3N3aWQgZXh0ZW5zaW9uICovCj4gKyAgICAgICBT
QklfSEFSVF9FWFRfU1NXSUQsCj4KPiAgICAgICAgIC8qKiBNYXhpbXVtIGluZGV4IG9mIEhhcnQg
ZXh0ZW5zaW9uICovCj4gICAgICAgICBTQklfSEFSVF9FWFRfTUFYLAo+IGRpZmYgLS1naXQgYS9s
aWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCAyMTcxMzgxNi4u
MGM1ODRiZmMgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3Ni
aS9zYmlfaGFydC5jCj4gQEAgLTQwMiw2ICs0MDIsMTEgQEAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0
X2V4dF9kYXRhIHNiaV9oYXJ0X2V4dFtdID0gewo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFU
QSh2LCBTQklfSEFSVF9FWFRfViksCj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKGYsIFNC
SV9IQVJUX0VYVF9GKSwKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoZCwgU0JJX0hBUlRf
RVhUX0QpLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbXdpZCwgU0JJX0hBUlRfRVhU
X1NNV0lEKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21sd2lkLCBTQklfSEFSVF9F
WFRfU01MV0lEKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21sd2lkbGlzdCwgU0JJ
X0hBUlRfRVhUX1NNTFdJRExJU1QpLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzbXdp
ZGRlbGVnLCBTQklfSEFSVF9FWFRfU01XSURERUxFRyksCj4gKyAgICAgICBfX1NCSV9IQVJUX0VY
VF9EQVRBKHNzd2lkLCBTQklfSEFSVF9FWFRfU1NXSUQpLAo+ICB9Owo+Cj4gIF9TdGF0aWNfYXNz
ZXJ0KFNCSV9IQVJUX0VYVF9NQVggPT0gYXJyYXlfc2l6ZShzYmlfaGFydF9leHQpLAo+IEBAIC02
ODksNiArNjk0LDUyIEBAIF9fcG1wX3NraXA6Cj4gICAgICAgICAvKiBEZXRlY3QgaWYgaGFydCBz
dXBwb3J0IHNkdHJpZyAoZGVidWcgdHJpZ2dlcnMpICovCj4gICAgICAgICBfX2NoZWNrX2V4dF9j
c3IoU0JJX0hBUlRfUFJJVl9WRVJfVU5LTk9XTiwKPiAgICAgICAgICAgICAgICAgICAgICAgICBD
U1JfVFNFTEVDVCwgU0JJX0hBUlRfRVhUX1NEVFJJRyk7Cj4gKyAgICAgICAvKiBEZXRlY3QgaWYg
aGFydCBzdXBwb3J0cyBTbXdpZCAobXdpZCBDU1IpICovCj4gKyAgICAgICBfX2NoZWNrX2V4dF9j
c3IoU0JJX0hBUlRfUFJJVl9WRVJfVU5LTk9XTiwKPiArICAgICAgICAgICAgICAgICAgICAgICBD
U1JfTVdJRCwgU0JJX0hBUlRfRVhUX1NNV0lEKTsKPiArICAgICAgIC8qIERldGVjdCBpZiBoYXJ0
IHN1cHBvcnRzIFNtbHdpZCAobWx3aWQgQ1NSKSAqLwo+ICsgICAgICAgX19jaGVja19leHRfY3Ny
KFNCSV9IQVJUX1BSSVZfVkVSX1VOS05PV04sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgQ1NS
X01MV0lELCBTQklfSEFSVF9FWFRfU01MV0lEKTsKPiArICAgICAgIC8qIERldGVjdCBpZiBoYXJ0
IHN1cHBvcnRzIFNtbHdpZGxpc3QgKG1sd2lkbGlzdCBDU1IpLiAqLwo+ICsgICAgICAgX19jaGVj
a19leHRfY3NyKFNCSV9IQVJUX1BSSVZfVkVSX1VOS05PV04sCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgQ1NSX01MV0lETElTVCwgU0JJX0hBUlRfRVhUX1NNTFdJRExJU1QpOwo+ICsgICAgICAg
LyoKPiArICAgICAgICAqIERldGVjdCBpZiBoYXJ0IHN1cHBvcnRzIFNtd2lkZGVsZWcgJiBTc3dp
ZC4KPiArICAgICAgICAqIFNtd2lkZGVsZWcgcmVxdWlyZXMgU21sd2lkLiBTc3dpZCByZXF1aXJl
cyBTbXdpZGRlbGVnLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4
dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01MV0lEKSkgewo+ICsgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIG9sZF9td2lkZGVsZWcsIG5ld19td2lkZGVsZWc7Cj4gKwo+ICsgICAg
ICAgICAgICAgICBvbGRfbXdpZGRlbGVnID0gY3NyX3JlYWRfYWxsb3dlZChDU1JfTVdJRERFTEVH
LCAmdHJhcCk7Ck96YTogd2h5IG5vdCB1c2UgX19jaGVja19leHRfY3NyIGF0IGFsbCB0aGUgZm9s
bG93aW5nID8KPiArICAgICAgICAgICAgICAgaWYgKHRyYXAuY2F1c2UpCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBza2lwX3Ntd2lkZGVsZWc7Cj4gKwo+ICsgICAgICAgICAgICAgICBj
c3Jfd3JpdGVfYWxsb3dlZChDU1JfTVdJRERFTEVHLCAmdHJhcCwgfjBVTCk7Cj4gKyAgICAgICAg
ICAgICAgIGlmICh0cmFwLmNhdXNlKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gc2tp
cF9zbXdpZGRlbGVnOwo+ICsKPiArICAgICAgICAgICAgICAgbmV3X213aWRkZWxlZyA9IGNzcl9y
ZWFkX2FsbG93ZWQoQ1NSX01XSURERUxFRywgJnRyYXApOwo+ICsgICAgICAgICAgICAgICBpZiAo
dHJhcC5jYXVzZSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfTVdJ
RERFTEVHLCBvbGRfbXdpZGRlbGVnKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHNr
aXBfc213aWRkZWxlZzsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAg
aWYgKG5ld19td2lkZGVsZWcpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBfX3NiaV9oYXJ0
X3VwZGF0ZV9leHRlbnNpb24oaGZlYXR1cmVzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfSEFSVF9FWFRfU01XSURERUxFRywgdHJ1ZSk7
Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNzcl9yZWFkX2FsbG93ZWQoQ1NSX1NMV0lE
LCAmdHJhcCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCF0cmFwLmNhdXNlKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX3NiaV9oYXJ0X3VwZGF0ZV9leHRlbnNp
b24oaGZlYXR1cmVzLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9TU1dJRCwgdHJ1ZSk7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAg
ICBjc3Jfd3JpdGUoQ1NSX01XSURERUxFRywgb2xkX213aWRkZWxlZyk7Cj4gKwo+ICtza2lwX3Nt
d2lkZGVsZWc6Cj4gKyAgICAgICAgICAgICAgIDsKPiArICAgICAgIH0KPgo+ICAjdW5kZWYgX19j
aGVja19leHRfY3NyCj4KPiAtLQo+IDIuNDMuNwo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBs
aXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
