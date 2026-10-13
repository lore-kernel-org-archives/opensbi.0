Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43A2CC6B12
	for <opensbi@archiver.kernel.org>; Tue, 13 Oct 2026 19:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWKWkKAdpNmLSMMeRmbyyNQOKTcmW215PCnsu5tr6Ns=; b=Sd/LytGEAkY1uo
	06yJhBUqdXLdnQk5cEZJR53tmFem5I3Y77Tt0JLWHHAquyx4oyeGIFgPlx4BbMKcmqPeGLVfY09gx
	+Fv/A0bDIYpKiKwrW/2YhZwCPdQej3LfTdAwHc5u4G4oqFFcKsOYtslpguNE3djtfKISn+5FxjCpg
	kC7o6l9QVjOuyUrBUWTzw7Cta4gYNE97cVN/2Teu+rnzBkt8lWPUV5ULJZEenVkWn7gyJanRkMboz
	ZDcenm8MqL7sqvbZH++hrvkNEj3uktk/pZdsNBcv7qK9Q9foOGN6TSVSPQLBCNrnZf8lPGafUHs6d
	NF0j8dYmjSpIB/Iq190A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiS4-0000000DwWt-3iGN;
	Tue, 13 Oct 2026 19:46:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiS1-0000000DwVM-0lgb
	for opensbi@lists.infradead.org;
	Tue, 13 Oct 2026 19:46:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE45x2009507
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/o3aAVb5syfyZ3jztKXfp6DQfwTVF1uOEw2fbRia7A=; b=ixznIDfjhj0wNhT4
	x5iEkFp25h1ZVihAEV4oPdUkZAG9DsEBigaHPMVGHQ0mTu6IEP5YPUsbHmdVgJJ2
	K6kfAJRuKkRPHdv8ba0dYnT1pkOgSQr0NcXEXAmDzCpSEkLPk7/BWuOTSS3UruKZ
	cwS1KryI80lATgYZ6/MYtPZ8/205ro6rHBimQFcf+zEZUMXhZeEGxek2u5CdIvdw
	3GpoBd5O7F0qfwFApvLbLPc5Lek79Zr5DfnWsRsZi3pXYkIUuOOxufEA7OdzEhgC
	Y0dfEzd7clyKjO8khXAr3cTsQdhQo9XM5FUasIjMEvyJgfAo+VyFO+tpi3w3Jeja
	gIobuQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjkhem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:46:16 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46509ab0149so4570395fac.2
        for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 12:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791920775; cv=none;
        d=google.com; s=arc-20260327;
        b=F6Wmo1zEs9RhVLkoqPn/87WhWojomvvxFzrBHLCAVK+u/tMrzdpqPjTsjM902CwUsw
         EC5iOi2hGcd5y7va/NxP7ezaw5FHlo3mSceQrSuwKzr8FVHYHHoEueKriLeUTyxz/XHQ
         t6GxadHSYLakhww/PiO6I886a7lq+VV49PQQRygDgzSsvbQT+Ys1ZUALdd65XTfNM0li
         vHPfyVcYKbJU+WmC85xPbHIvd/+zdvWfEgtI61mSNCtKASJQyoGcpBhqs80rez2S9zB6
         75yl2i1gsJUoZaxgJqEJkNN7FrqywOwXxDATP2zVtllFBJVHWI2EEgpECXt3Jc8Ay06f
         OA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s/o3aAVb5syfyZ3jztKXfp6DQfwTVF1uOEw2fbRia7A=;
        fh=DZ28GQMGDAIjgQ0j0SrZlrfDqFaHYyECritcR+ovZ8A=;
        b=BJXJZgu2BLWO78hf7pB1ffyRpCEVFihWEW/s/Y7b1xlH41uL28YrItTKR2p2CssQ7R
         f31yttKdJDdw8ZSJBQetrZFq+SuomlMpRwCfbB3QQjkDOOGxHueCNK0CYVUVBF9mU69P
         t+99o+mnT6N++mne+IPT/54O0x7fFKP0F94ir8KD5fMgkuEb/Udb60dUPSNed/ZT3yMw
         aAtc5HgOIgfsJePI8x1TiumcUjjSpZ1rAW7CphdTKOn/Vi08dFvf5Flbnit0gclWhNv7
         lOBGP0L5NrBuaUa/nCwgtrY0VYbnj0ycrn8ZIPWd0hRBOd68PVcGLqYznfcF2MQeL+5V
         vpVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791920775; x=1792525575; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s/o3aAVb5syfyZ3jztKXfp6DQfwTVF1uOEw2fbRia7A=;
        b=Cjs/kyzJtQDy1GBrhC7ktFdJWSsw/TW4VqCCe/cf/oSR0HJu3nqDMOTJWc30ixA2Hx
         oid5L6X22+eO7G8+EBvH+p6xmcg2bm+pmlg9YMRsBTAz17csSDFjsx+XMn3hh51QOvnA
         fIdCKTcpMG3L4CrM+bccRtxAlgEWBOeDEjrUv64aEsxAquIW5gdaP/JkhSFRMiVgFrOW
         x19RAlZT/yQG5JChQyv3wYcZaby8khnSRBewZ94HzpD+96v2JRpv4iEyPU1KfDPOwAnj
         nPurvO83CVg2XHqdvA4xtc3isuh3TrRdk3/rq5fbxm9hN67NtXyRtBBUX2Lz8etB1Z6D
         yHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920775; x=1792525575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/o3aAVb5syfyZ3jztKXfp6DQfwTVF1uOEw2fbRia7A=;
        b=dNgibTa37sVaDeDl8H/Sk2UplP4YWHhZcmqQoDsaBf3vX30dSZkiTbmoHebthT8NwI
         dtamom41k6ZkZLnCzT74LuQEqJZXm5bypmRwSmZwVgm/iPemwfvOPD5YX5DbNOsDGxFL
         qewf+j5e82DtQ4Iuhf+GhZrIrqWECGHwxnNNd7xB1UA+iDtA+KRcNA8Ml+Hv2Rh6iCKB
         m1X6/NimaZdCvXZCSOccPMKjJ5p8WJRAYE9ZiSc26+12pj4QF7qRmdaUmbIMce4QTOGv
         BIESTcEagAKqYoDEOXSGcICOx4NvPMrPTOGAL4mbbtvmpKgRPFLO1Nt2MZIaymwNFeVD
         o6FA==
X-Forwarded-Encrypted: i=1; AKwUvBxUFwg+/7Drj8XZfcrDNryC5NvxJsZuZ3gLyVlZTIlZDMhVGqZ1m02joygEyg3cCDNIsglFIC0s@lists.infradead.org
X-Gm-Message-State: AFq9FYIZnVroOPJaga5+utO/zWsHypD2hvh7ZjCcYQVkYIL6vOYMhPTe
	36aV3aAk+sBAMxxPkskh8vRohu4DdneOk2XTAZfUfYGsxyvDkq7MZDwG7yU6EUM4dNFYT2ulWjn
	fCpGzLZ9dBb32/wHodqgOf7pEj/CDp0A6r7KTjfe2JZ/2+pG2w5nkvUQymlaNapAKQxK3iRepfS
	6vEa2nRbSnXzcJI2upxh/XsahwztFIPq5crPnzfMED
X-Gm-Gg: AYBFou11eYtw4h4k4ub80YsYb+Xz1G6QDrq5SX3ephSixe8JJikGuHZKj7EPBK/q4T8
	6ZmxVX82mnrsKl3/mftX2Yl/PiLHf/rSBHsjUOtYvKUDvebORK4oKwOhfGGB2k/okX9aS3NpTFd
	HMdVfRBCxIET+W+F+liUBnkGFJCkajNeMFTW0WNBDzzjHep+ieakonEDqZMfo=
X-Received: by 2002:a05:6870:d98:b0:475:e066:771f with SMTP id 586e51a60fabf-4a2a8a7a8e5mr10634224fac.38.1791920774785;
        Tue, 13 Oct 2026 12:46:14 -0700 (PDT)
X-Received: by 2002:a05:6870:d98:b0:475:e066:771f with SMTP id
 586e51a60fabf-4a2a8a7a8e5mr10634205fac.38.1791920774350; Tue, 13 Oct 2026
 12:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com> <20260923032359.4041876-4-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260923032359.4041876-4-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:46:03 -0700
X-Gm-Features: AclHuK8Ix81V8AHos1F8-AZzfpXtS_GxKav5NcmVvq-IvV7UTjyEM5PFmN_6J0Q
Message-ID: <CAAVgOkLAfAUCwfgfkxAOucLTbtF8QiGBTdVapARnCTW+F9Thyw@mail.gmail.com>
Subject: Re: [PATCH 03/11] lib: utils/mpxy: Introduce get_attribute_group()
 for MPXY RPMI data
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-GUID: 2PpGv_xYCdwd-UptXIC_KAiPaYxRaM64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX19+Nu1BP8Ln0
 UwEbGVNbm/dPfaots1f/kFBl3IbkHWPTAN+W2s2YnbumRQ2lkrQ1MZT3l1maVvH9peoqW64Ijt7
 n1i+VnIXoOBtjgTDuscbYYrdmAUW2t7lS396phnHmS+19e+sGOVk77iENTo22pHt96AF4zGa4iI
 kzAjs5aJkWI309Yx8GqIn8Lr+1PRaVuIiv+JKH+BpZy8oOnn1bP8JVx8qqOCOEPch/aUmfYUmqc
 DQvkYMjXzZ9p2XjqjG0ltwg1GpIkAyqiMMB4KGoPgh/fbJkn1af6CZnuViFl5MZDh2Q/w93xbNM
 MO8L9grIu0NHSGW/his/VUdOg/4zlGITOfDMK+AtdxvZcxcSFIILhoGyCdEwJPYbbqkrKgPE+MX
 1FZUQ5crsuw5FJ0ei+BBDdLJsxJQzctsOQLGhrPxHY9kKfrYuhCo7qUndY/RTvjuQnjYnhIg471
 /8qDcQNzkq1zEVPgIqQ==
X-Proofpoint-ORIG-GUID: 2PpGv_xYCdwd-UptXIC_KAiPaYxRaM64
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace8a88 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=lhJKEjN-g8vA4DRfbeMA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX3m1u/xtDSpON
 jtrpcCqDeIKODZuVP75c1M29ChLMpsASB3NxQgUReMGnbASNHLygMq9tZ3PaJ+a1f67VOAS1kSm
 K9cJgpEkWcjcGckwdMLaJbI7dN1J/Cg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_124617_228851_89648276 
X-CRM114-Status: GOOD (  21.11  )
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
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGdWxseSBlbXVsYXRlZCBNUFhZIGNoYW5uZWxz
IG5lZWQgYSBjdXN0b20gd2F5IHRvIHByb3ZpZGUgUlBNSSBhdHRyaWJ1dGVzCj4gc28gaW50cm9k
dWNlIG9wdGlvbmFsIGdldF9hdHRyaWJ1dGVfZ3JvdXAoKSBjYWxsYmFjayBpbiBNUFhZIFJQTUkg
ZGF0YQo+IGZvciB0aGlzIHB1cnBvc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpX3V0aWxzL21w
eHkvZmR0X21weHlfcnBtaS5oIHwgIDUgKysrKwo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9y
cG1pLmMgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9zYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmggYi9pbmNsdWRlL3NiaV91
dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuaAo+IGluZGV4IGQxZjVmOWNhLi5hMzk2OGU4NyAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL3NiaV91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuaAo+ICsrKyBi
L2luY2x1ZGUvc2JpX3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5oCj4gQEAgLTY3LDYgKzY3LDEx
IEBAIHN0cnVjdCBtcHh5X3JwbWlfZGF0YSB7Cj4gICAgICAgICB1MzIgbnVtX3NlcnZpY2VzOwo+
ICAgICAgICAgc3RydWN0IG1weHlfcnBtaV9zZXJ2aWNlX2RhdGEgKnNlcnZpY2VfZGF0YTsKPgo+
ICsgICAgICAgLyoqIEdldCBSUE1JIHNlcnZpY2UgZ3JvdXAgYXR0cmlidXRlICovCj4gKyAgICAg
ICBpbnQgKCpnZXRfYXR0cmlidXRlX2dyb3VwKSh2b2lkICpjb250ZXh0LCBzdHJ1Y3QgbWJveF9j
aGFuICpjaGFuLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBycG1p
X2NoYW5uZWxfYXR0cmlidXRlX2lkIGF0dHJfaWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1MzIgKm91dF92YWx1ZSk7Cj4gKwo+ICAgICAgICAgLyoqIFRyYW5zZmVyIFJQ
TUkgc2VydmljZSBncm91cCBtZXNzYWdlICovCj4gICAgICAgICBpbnQgKCp4ZmVyX2dyb3VwKSh2
b2lkICpjb250ZXh0LCBzdHJ1Y3QgbWJveF9jaGFuICpjaGFuLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IG1ib3hfeGZlciAqeGZlcik7Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGls
cy9tcHh5L2ZkdF9tcHh5X3JwbWkuYyBiL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuYwo+
IGluZGV4IGJiZWI3YTc5Li45YjhlNjllMSAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvbXB4eS9m
ZHRfbXB4eV9ycG1pLmMKPiArKysgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmMKPiBA
QCAtMjA0LDYgKzIwNCwyMSBAQCBzdGF0aWMgaW50IG1weHlfc2VuZF9tZXNzYWdlX3dpdGhvdXRy
ZXNwKHN0cnVjdCBzYmlfbXB4eV9jaGFubmVsICpjaGFubmVsLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgTlVMTCwgMCwgTlVMTCk7Cj4gIH0KPgo+ICtzdGF0aWMgaW50IG1w
eHlfcnBtaV9nZXRfYXR0cmlidXRlKHN0cnVjdCBtcHh5X3JwbWkgKnJtYiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gcnBtaV9jaGFubmVsX2F0dHJpYnV0ZV9pZCBh
dHRyX2lkLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyICpvdXRfdmFs
dWUpCj4gK3sKPiArICAgICAgIGNvbnN0IHN0cnVjdCBtcHh5X3JwbWlfZGF0YSAqZGF0YSA9IHJt
Yi0+ZGF0YTsKPiArICAgICAgIHN0cnVjdCBtYm94X2NoYW4gKmNoYW4gPSBybWItPmNoYW47Cj4g
KyAgICAgICBpbnQgcmM7Cj4gKwo+ICsgICAgICAgaWYgKGRhdGEtPmdldF9hdHRyaWJ1dGVfZ3Jv
dXApCj4gKyAgICAgICAgICAgICAgIHJjID0gZGF0YS0+Z2V0X2F0dHJpYnV0ZV9ncm91cChybWIt
Pmdyb3VwX2NvbnRleHQsIGNoYW4sIGF0dHJfaWQsIG91dF92YWx1ZSk7Cj4gKyAgICAgICBlbHNl
Cj4gKyAgICAgICAgICAgICAgIHJjID0gbWJveF9jaGFuX2dldF9hdHRyaWJ1dGUoY2hhbiwgYXR0
cl9pZCwgb3V0X3ZhbHVlKTsKPiArICAgICAgIHJldHVybiByYzsKPiArfQo+ICsKPiAgaW50IGZk
dF9tcHh5X3JwbWlfaW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLCBjb25zdCBzdHJ1
Y3QgZmR0X21hdGNoICptYXRjaCkKPiAgewo+ICAgICAgICAgdTMyIGNoYW5uZWxfaWQsIHNlcnZp
Y2VncnBfdmVyLCBwcm9fdmVyLCBtYXhfZGF0YV9sZW4sIHR4X3RvdXQsIHJ4X3RvdXQ7Cj4gQEAg
LTIxOCw2ICsyMzMsNyBAQCBpbnQgZmR0X21weHlfcnBtaV9pbml0KGNvbnN0IHZvaWQgKmZkdCwg
aW50IG5vZGVvZmYsIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdAo+ICAgICAgICAgcm1iID0g
c2JpX3phbGxvYyhzaXplb2YoKnJtYikpOwo+ICAgICAgICAgaWYgKCFybWIpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiBTQklfRU5PTUVNOwo+ICsgICAgICAgcm1iLT5kYXRhID0gZGF0YTsKPgo+
ICAgICAgICAgLyoKPiAgICAgICAgICAqIElmIGNoYW5uZWwgcmVxdWVzdCBmYWlsZWQgdGhlbiBv
dGhlciBlbmQgZG9lcyBub3Qgc3VwcG9ydAo+IEBAIC0yMjgsNiArMjQ0LDcgQEAgaW50IGZkdF9t
cHh5X3JwbWlfaW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2ZmLCBjb25zdCBzdHJ1Y3Qg
ZmR0X21hdGNoICptYXQKPiAgICAgICAgICAgICAgICAgcmMgPSBTQklfRU5PREVWOwo+ICAgICAg
ICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9jbGllbnQ7Cj4gICAgICAgICB9Cj4gKyAgICAgICBy
bWItPmNoYW4gPSBjaGFuOwo+Cj4gICAgICAgICAvKiBNYXRjaCBjaGFubmVsIHNlcnZpY2UgZ3Jv
dXAgaWQgKi8KPiAgICAgICAgIGlmIChkYXRhLT5zZXJ2aWNlZ3JwX2lkICE9IGNoYW4tPmNoYW5f
YXJnc1swXSkgewo+IEBAIC0yNDMsNDMgKzI2MCw0MyBAQCBpbnQgZmR0X21weHlfcnBtaV9pbml0
KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1h
dAo+ICAgICAgICAgfQo+Cj4gICAgICAgICAvKiBHZXQgY2hhbm5lbCBwcm90b2NvbCB2ZXJzaW9u
ICovCj4gLSAgICAgICByYyA9IG1ib3hfY2hhbl9nZXRfYXR0cmlidXRlKGNoYW4sIFJQTUlfQ0hB
Tk5FTF9BVFRSX1BST1RPQ09MX1ZFUlNJT04sCj4gKyAgICAgICByYyA9IG1weHlfcnBtaV9nZXRf
YXR0cmlidXRlKHJtYiwgUlBNSV9DSEFOTkVMX0FUVFJfUFJPVE9DT0xfVkVSU0lPTiwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnByb192ZXIpOwo+ICAgICAgICAgaWYg
KHJjKQo+ICAgICAgICAgICAgICAgICBnb3RvIGZhaWxfY2xlYW51cF9ncm91cDsKPgo+ICAgICAg
ICAgLyogR2V0IGNoYW5uZWwgbWF4aW11bSBkYXRhIGxlbmd0aCAqLwo+IC0gICAgICAgcmMgPSBt
Ym94X2NoYW5fZ2V0X2F0dHJpYnV0ZShjaGFuLCBSUE1JX0NIQU5ORUxfQVRUUl9NQVhfREFUQV9M
RU4sCj4gKyAgICAgICByYyA9IG1weHlfcnBtaV9nZXRfYXR0cmlidXRlKHJtYiwgUlBNSV9DSEFO
TkVMX0FUVFJfTUFYX0RBVEFfTEVOLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmbWF4X2RhdGFfbGVuKTsKPiAgICAgICAgIGlmIChyYykKPiAgICAgICAgICAgICAgICAg
Z290byBmYWlsX2NsZWFudXBfZ3JvdXA7Cj4KPiAgICAgICAgIC8qIEdldCBjaGFubmVsIFR4IHRp
bWVvdXQgKi8KPiAtICAgICAgIHJjID0gbWJveF9jaGFuX2dldF9hdHRyaWJ1dGUoY2hhbiwgUlBN
SV9DSEFOTkVMX0FUVFJfVFhfVElNRU9VVCwKPiArICAgICAgIHJjID0gbXB4eV9ycG1pX2dldF9h
dHRyaWJ1dGUocm1iLCBSUE1JX0NIQU5ORUxfQVRUUl9UWF9USU1FT1VULAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmdHhfdG91dCk7Cj4gICAgICAgICBpZiAocmMpCj4g
ICAgICAgICAgICAgICAgIGdvdG8gZmFpbF9jbGVhbnVwX2dyb3VwOwo+Cj4gICAgICAgICAvKiBH
ZXQgY2hhbm5lbCBSeCB0aW1lb3V0ICovCj4gLSAgICAgICByYyA9IG1ib3hfY2hhbl9nZXRfYXR0
cmlidXRlKGNoYW4sIFJQTUlfQ0hBTk5FTF9BVFRSX1JYX1RJTUVPVVQsCj4gKyAgICAgICByYyA9
IG1weHlfcnBtaV9nZXRfYXR0cmlidXRlKHJtYiwgUlBNSV9DSEFOTkVMX0FUVFJfUlhfVElNRU9V
VCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnJ4X3RvdXQpOwo+ICAg
ICAgICAgaWYgKHJjKQo+ICAgICAgICAgICAgICAgICBnb3RvIGZhaWxfY2xlYW51cF9ncm91cDsK
Pgo+ICAgICAgICAgLyogR2V0IGNoYW5uZWwgc2VydmljZSBncm91cCB2ZXJzaW9uICovCj4gLSAg
ICAgICByYyA9IG1ib3hfY2hhbl9nZXRfYXR0cmlidXRlKGNoYW4sIFJQTUlfQ0hBTk5FTF9BVFRS
X1NFUlZJQ0VHUk9VUF9WRVJTSU9OLAo+ICsgICAgICAgcmMgPSBtcHh5X3JwbWlfZ2V0X2F0dHJp
YnV0ZShybWIsIFJQTUlfQ0hBTk5FTF9BVFRSX1NFUlZJQ0VHUk9VUF9WRVJTSU9OLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc2VydmljZWdycF92ZXIpOwo+ICAgICAg
ICAgaWYgKHJjKQo+ICAgICAgICAgICAgICAgICBnb3RvIGZhaWxfY2xlYW51cF9ncm91cDsKPgo+
ICAgICAgICAgLyogR2V0IGNoYW5uZWwgaW1wbGVtZW50YXRpb24gaWQgKi8KPiAtICAgICAgIHJj
ID0gbWJveF9jaGFuX2dldF9hdHRyaWJ1dGUoY2hhbiwgUlBNSV9DSEFOTkVMX0FUVFJfSU1QTF9J
RCwKPiArICAgICAgIHJjID0gbXB4eV9ycG1pX2dldF9hdHRyaWJ1dGUocm1iLCBSUE1JX0NIQU5O
RUxfQVRUUl9JTVBMX0lELAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
aW1wbF9pZCk7Cj4gICAgICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgIGdvdG8gZmFpbF9j
bGVhbnVwX2dyb3VwOwo+Cj4gICAgICAgICAvKiBHZXQgY2hhbm5lbCBpbXBsZW1lbnRhdGlvbiB2
ZXJzaW9uICovCj4gLSAgICAgICByYyA9IG1ib3hfY2hhbl9nZXRfYXR0cmlidXRlKGNoYW4sIFJQ
TUlfQ0hBTk5FTF9BVFRSX0lNUExfVkVSU0lPTiwKPiArICAgICAgIHJjID0gbXB4eV9ycG1pX2dl
dF9hdHRyaWJ1dGUocm1iLCBSUE1JX0NIQU5ORUxfQVRUUl9JTVBMX1ZFUlNJT04sCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZpbXBsX3Zlcik7Cj4gICAgICAgICBpZiAo
cmMpCj4gICAgICAgICAgICAgICAgIGdvdG8gZmFpbF9jbGVhbnVwX2dyb3VwOwo+IEBAIC0zMzMs
OSArMzUwLDYgQEAgaW50IGZkdF9tcHh5X3JwbWlfaW5pdChjb25zdCB2b2lkICpmZHQsIGludCBu
b2Rlb2ZmLCBjb25zdCBzdHJ1Y3QgZmR0X21hdGNoICptYXQKPiAgICAgICAgIHJtYi0+bXNncHJv
dF9hdHRycy5pbXBsX2lkID0gaW1wbF9pZDsKPiAgICAgICAgIHJtYi0+bXNncHJvdF9hdHRycy5p
bXBsX3ZlciA9IGltcGxfdmVyOwo+Cj4gLSAgICAgICBybWItPmRhdGEgPSBkYXRhOwo+IC0gICAg
ICAgcm1iLT5jaGFuID0gY2hhbjsKPiAtCj4gICAgICAgICAvKiBSZWdpc3RlciBSUE1JIHNlcnZp
Y2UgZ3JvdXAgKi8KPiAgICAgICAgIHJjID0gc2JpX21weHlfcmVnaXN0ZXJfY2hhbm5lbCgmcm1i
LT5jaGFubmVsKTsKPiAgICAgICAgIGlmIChyYykKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9w
ZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgpSZXZpZXdlZC1i
eTogUGF3YW5kZWVwIE96YSA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgpUZXN0ZWQt
Ynk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
