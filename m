Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083F4606A320
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 18:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4pv4Wr/v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CNnt9EeH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ARE/Nlaq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FTfjSLrQZseUgRhKz+OO6EwtjQ3Dxj+IFaIKOCNfiXI=; b=4pv4Wr/vkpOM2Y3DcGXWk24X+M
	SeXCVcSCd9rQdGSvJGMY5hchYJltWoYZ/YUw7a6sswrY9f3lBkLQLtdzL0nsLGa/ypYrSTjwS4I3+
	i2MeIz8YldPFZCQelOyhz2dZFJWXj1w4nUzB5rLNMroxIu6jwhIjjpkOQG9c6JTto8ojnkZ3V/Q5+
	kKt1k/WMizGMFKvenkCp7iRRkandIx4Wlj2DAGV8LXxbMnX+YKGfYr1O3gaty95uVQQz5NstiECtV
	C7Ez2NKqWZ/LRJQLJH93V6TqEO8geGWf3p9lZhCfOanDy0S9A68plAoDifm9lM2UHg6OYviqTrL6w
	QKy3RDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqtl-00000004pli-0bsy;
	Tue, 10 Nov 2026 18:48:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqtg-00000004pl9-3BwY
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 18:48:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIbsgs3235641
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Y/diNBFPx4U5doW2AL1DjquepXkS48Jl9eZJZBbFOE=; b=CNnt9EeHhtKwQzME
	2oNq8X2o78JvHXPYiuW5OvV/IlfSE3u7CrmjIK0DdojC8/SHm5OlQyL4WbmGdNfW
	0hKQn7DgV03IqWfJPghnYgar6STmldCwdj3g8xNxRa9EuwoljZ1hu7Yp4ImEHqWE
	rmjbwhUKhlG0xXyalMagV8WS2hBxrT1/QoBDr0rZJdkbe0OZiEz3ampqVNELWlYp
	2+A9ix9s5bar6B8+KcxlbD2ohp58IvJVfAdTnQ0u+RM5IugxWMX6m5jYzEX2pS2K
	vFVY0hkMMIZHy1EGyxML/2LrKz2fe7TV4hB0NFuRduMGQC7HsAB7s49QDNt6H9Wl
	ww1ybw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4ab57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:48:43 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-702f2edafaaso2561357eaf.1
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 10:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336522; cv=none;
        d=google.com; s=arc-20260327;
        b=GdPZTyOKBBv52tFvQI5ll4XCXRH3WHm8WYY8ZvCkIxak6/auOUt5akl3L2bCJxA3zw
         Ki2hKCublcnPZVgM+Ha+pIUs4zb4rUBRQcPc/qHW0u3nVTyzbVc40iQCw5e5j9Qer8EI
         W77CF35X7MozR+qPKpwScf/BsscS9w2hpk/tKM4g0sHSKSg7u4ryxZOfKVuruyKqFz0d
         hVPH9k2W+yqS+dYNy/Ou4Q0E+UhCsFzNyH5j+mSp0XFL6t8BT1bAHnl0wcFwp6FdANS0
         WrDbr7/7FwB3PRP1Jis7RuOHyhDUFNEkZ+lNPcC2KFCtPiRGSduRC1i0ooq0EZQc42dh
         v0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Y/diNBFPx4U5doW2AL1DjquepXkS48Jl9eZJZBbFOE=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=VP+yaRxej3fSJU5BC2OOryW5HhvbwRfamZ80dGs/7n3/fXSs77FCkKeyCDaYnFtcoI
         C+9Q8wHkGzipw0+defxlF6Za6bO+/vz5dzW17YL0rwevTVVz1LBwfl/+UZZRP7xxpovm
         20s77OQ76J082AjTmEk7Ly6RbdsDguQ705oFyKLgFuP64CQHz5D9q63wphMy4jU/xP9H
         zMvetE+uvW4Mnq5CaAEVgY8CfUBCx+25u+7F8hAcr3aXc24UWu3BnRcXqEt9AqDoU2um
         GutUyZTuTAHzTJRBOrCvKUmkgc39M4lADekGViggQ4jodeWEM8OBXAv0G1Vr3RKuafSo
         5pyw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794336522; x=1794941322; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Y/diNBFPx4U5doW2AL1DjquepXkS48Jl9eZJZBbFOE=;
        b=ARE/NlaqNkfS2tm08jf0PR2Dj8SDUlPBT+j/heLyt7SzTkkYkx0/p/SMGl7bcq7NhX
         Ei4+TZE8zE0IIqOGB+K8jC6ggOQ4vN4HRyq5RuoZo1Y5CR37iVZcp0HeMlSNfGYF31MI
         O9noOvoSLjcM++Ib40fj0wMjaGgnMLh3Ea4Nx83ItQh9bClj1HuTdhCNYIoTGdYxZX/f
         wlSEtUfMPLCHnYXlDxDiZNpVg9SjdUO/Rql/BorGHBHwjiU/esNtoCPXGxn0O9mDcUGw
         fjWvJ+6altTgGlKyqK9lsTJk4y4ImLSrkCFOKC6IS1XsYnsikFDb47LZUsu7ktWuFkLU
         h8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336522; x=1794941322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Y/diNBFPx4U5doW2AL1DjquepXkS48Jl9eZJZBbFOE=;
        b=otE+PDcs9R7IfKl0Cl3X/4fIbMA/3IUyLLtaN+eByUsGmCdiaNZtRmA2xXzqL0qDvF
         LAcrN8yb1NQ5uF7JZFJNSwHkESIJJCtRaYVi3ma4qm2hR0ZgU2NqL2odWVn5L8NzWB9h
         NYVRY3Iw5BTiheOa7rj6oPpYBj1SubneQDmYnZH9ixAraITdUYfs3H2jgqHRVVHQNqTb
         z0S3TDRl32ABceJ40TAycrnI+URo1IdmDpE3GuD3YS5fkl5IVA20BGRmNXlWPoCQK7F2
         OP9VCiW+aESRRWt07rG5poSOB1K9AdA+GSuisa/QnF2CYZOEl2zf0cpYbWQp+qxSdJ2e
         iwMw==
X-Gm-Message-State: APuU4Z8yoXxiXnprbHC/yHBTJ5GZVLE34lbl8W5HCwhkC0PhFG2V9wnU
	ZfbH5pssFD0DVVRk2MzkWd4olGzzIlFzv90EJ/3ibVcEtc7svbfvrILvylT5SK0gMpqM3uAK1UY
	oWuFNOHbMYcN348TaYuXvWbNrObt9G/RH5ByST1A5Q7cE6qgdWEjcWeUngcKGrJsxCcydzsHhvg
	L3t2PMNRoK6Y5QdsgI2f8YEHs8ofq9ASKZnks1g4sY
X-Gm-Gg: AYBFou0a9Z+bppWRsKdsHwqPCy5ZdgIUNcY9vC81C0Vm32tF2nkJ9Zv2C2f4mWmBiBN
	baEF9jB00vMd6D2N/8j+WjcJsqHPwBymFTnPy4GMO0DhIv4tSXFZtj62GOmvC6A10RsmhPbWumq
	d6rx4wOLjgrEliEUhvgYFdAJF7yB630hS2KNkzXs51hMI2FhdVm/tQvuBScg==
X-Received: by 2002:a05:6820:a748:20b0:6f5:5e02:78ce with SMTP id 006d021491bc7-718a7505337mr1220684eaf.73.1794336522399;
        Tue, 10 Nov 2026 10:48:42 -0800 (PST)
X-Received: by 2002:a05:6820:a748:20b0:6f5:5e02:78ce with SMTP id
 006d021491bc7-718a7505337mr1220675eaf.73.1794336521928; Tue, 10 Nov 2026
 10:48:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-2-peter.lin@sifive.com>
In-Reply-To: <20261110095029.117504-2-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 10:48:31 -0800
X-Gm-Features: AclHuK9Rlu5e5H0uZE_LFaOcN2aZmlhrDPxy2YHul6FgMUOqd6F3FAP87BIYEKc
Message-ID: <CAAVgOkLu4qHj5PhUXPp4CTckT7X4hcx_6YThD7NAa4PVzfRD5A@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] lib: sbi_hart: add RISC-V Worlds ISA extensions
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX18Gm9ysukp7g
 17kbIK3ca4GC128ccRCJDUihYIOgSHyi8ZYV26d6x/M6EiG2m+XG/8MSfAqLL5fGhdNcDY/ASKr
 HSdH/gG8WONw8drl+wWBNcOHh80GNOdqo9cwOJvRwtJjAZiW/Z9gs6Mf68wmkWQ3gL5SblndzVX
 eJfHPo+LLMPdara4HAZCKZax6L5UrtmlF4Ea9j9jygyv0CBhmOFZEk4m6CtCUzZ6Jr0wv0mdnUA
 0gZLBxfMhDXRDgRVyiboJznOJTDzAv/Y3SF/KJSDNFCnbF0fnCHj33DFjt2g7KnDReK2LzxgPPh
 bgNmVieWMRPUC6vermbtfNsuuF4ZgrTFxQKBrNX1oGqJDIjpEGdXev2UX+lfBBzS9zqJzRRhxTb
 ZWn+qbNQv8Si2N+8qQGhOE3WVljq2c5sDXm0Jq/Fm56G+gTGlB9OTS+tJiyre1NJ3YvyV9HHlYe
 8n5tfVKdlX624USg9fw==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af3670b cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pFyQfRViAAAA:8 a=W-_n0kkjAAAA:8 a=EUspDBNiAAAA:8
 a=kLUEOfztL6C897q5GXYA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
 a=oJz5jJLG1JtSoe7EL652:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfXwyUXSjVr/3Uq
 UUA/TA04F3HPViMuk4VRTLeYdWx30Yu4fNZguJOEtV2dqO8ZSlCo44dA7ag67STzRwhSG23h8iv
 6c6AA/wMl8LvAfLlyUg1hkUgDa5mAAA=
X-Proofpoint-GUID: HaHJJXriRTue9pCbE7EUS1Hn_BN2O_JP
X-Proofpoint-ORIG-GUID: HaHJJXriRTue9pCbE7EUS1Hn_BN2O_JP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_104844_831136_9C8A5E2F 
X-CRM114-Status: GOOD (  15.78  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMTo1MOKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIENTUiBkZWZpbml0aW9ucyBmb3IgUklT
Qy1WIFdvcmxkcyAobXdpZCwgbWx3aWQsIG1sd2lkbGlzdCwKPiBtd2lkZGVsZWcsIHNsd2lkKS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gLS0t
Cj4gQ2hhbmdlcyB2NC0+djU6Cj4gLSBObyBjaGFuZ2UKPiAtLS0KPiAgaW5jbHVkZS9zYmkvcmlz
Y3ZfZW5jb2RpbmcuaCB8IDEyICsrKysrKysrKysrKwo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydC5o
ICAgICAgIHwgMTAgKysrKysrKysrKwo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgICAgICAgIHwg
IDUgKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCBiL2luY2x1ZGUvc2JpL3Jpc2N2X2Vu
Y29kaW5nLmgKPiBpbmRleCBmZmU3NjY2Yy4uZTAyNjJiZmMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5n
LmgKPiBAQCAtNDAwLDYgKzQwMCw5IEBACj4gIC8qIFN1cGVydmlzb3IgUmVzb3VyY2UgTWFuYWdl
bWVudCBDb25maWd1cmF0aW9uIENTUnMgKi8KPiAgI2RlZmluZSBDU1JfU1JNQ0ZHICAgICAgICAg
ICAgICAgICAgICAgMHgxODEKPgo+ICsvKiBTdXBlcnZpc29yIGxvd2VyLXByaXZpbGVnZSBtb2Rl
IFdvcmxkIElEIENTUiAoU3N3aWQpICovCj4gKyNkZWZpbmUgQ1NSX1NMV0lEICAgICAgICAgICAg
ICAgICAgICAgIDB4MTkwCj4gKwo+ICAvKiBNYWNoaW5lLUxldmVsIENvbnRyb2wgdHJhbnNmZXIg
cmVjb3JkcyBDU1JzICovCj4gICNkZWZpbmUgQ1NSX01DVFJDVEwgICAgICAgICAgICAgICAgICAg
ICAweDM0ZQo+Cj4gQEAgLTUyMCw2ICs1MjMsMTUgQEAKPiAgI2RlZmluZSBDU1JfTVRJTlNUICAg
ICAgICAgICAgICAgICAgICAgMHgzNGEKPiAgI2RlZmluZSBDU1JfTVRWQUwyICAgICAgICAgICAg
ICAgICAgICAgMHgzNGIKPgo+ICsvKiBNYWNoaW5lIFdvcmxkIElEIENTUnMgKFNtd2lkLCBTbWx3
aWQsIFNtbHdpZGxpc3QsIFNtd2lkZGVsZWcpICovCj4gKyNkZWZpbmUgQ1NSX01MV0lEICAgICAg
ICAgICAgICAgICAgICAgIDB4MzkwCj4gKyNkZWZpbmUgQ1NSX01XSUQgICAgICAgICAgICAgICAg
ICAgICAgIDB4NzQ5Cj4gKyNkZWZpbmUgQ1NSX01XSURERUxFRyAgICAgICAgICAgICAgICAgIDB4
NzQ4Cj4gKyNkZWZpbmUgQ1NSX01MV0lETElTVCAgICAgICAgICAgICAgICAgIDB4NzRBCj4gKwo+
ICsvKiBtd2lkIGxvY2sgYml0ICovCj4gKyNkZWZpbmUgTVdJRF9MT0NLICAgICAgICAgICAgICAg
ICAgICAgIChfVUwoMSkgPDwgKF9fcmlzY3ZfeGxlbiAtIDEpKQo+ICsKPiAgLyogTWFjaGluZSBN
ZW1vcnkgUHJvdGVjdGlvbiAqLwo+ICAjZGVmaW5lIENTUl9QTVBDRkcwICAgICAgICAgICAgICAg
ICAgICAweDNhMAo+ICAjZGVmaW5lIENTUl9QTVBDRkcxICAgICAgICAgICAgICAgICAgICAweDNh
MQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oIGIvaW5jbHVkZS9zYmkvc2Jp
X2hhcnQuaAo+IGluZGV4IGEwMjBjZjAzLi5lZDM0NDc4MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L3NiaS9zYmlfaGFydC5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+IEBAIC05Nyw2
ICs5NywxNiBAQCBlbnVtIHNiaV9oYXJ0X2V4dGVuc2lvbnMgewo+ICAgICAgICAgU0JJX0hBUlRf
RVhUX0YsCj4gICAgICAgICAvKiogSGFydCBoYXMgRCBleHRlbnNpb24gKi8KPiAgICAgICAgIFNC
SV9IQVJUX0VYVF9ELAo+ICsgICAgICAgLyoqIEhhcnQgaGFzIFNtd2lkIGV4dGVuc2lvbiAqLwo+
ICsgICAgICAgU0JJX0hBUlRfRVhUX1NNV0lELAo+ICsgICAgICAgLyoqIEhhcnQgaGFzIFNtbHdp
ZCBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9TTUxXSUQsCj4gKyAgICAgICAv
KiogSGFydCBoYXMgU21sd2lkbGlzdCBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VY
VF9TTUxXSURMSVNULAo+ICsgICAgICAgLyoqIEhhcnQgaGFzIFNtd2lkZGVsZWcgZXh0ZW5zaW9u
ICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfU01XSURERUxFRywKPiArICAgICAgIC8qKiBIYXJ0
IGhhcyBTc3dpZCBleHRlbnNpb24gKi8KPiArICAgICAgIFNCSV9IQVJUX0VYVF9TU1dJRCwKPgo+
ICAgICAgICAgLyoqIE1heGltdW0gaW5kZXggb2YgSGFydCBleHRlbnNpb24gKi8KPiAgICAgICAg
IFNCSV9IQVJUX0VYVF9NQVgsCj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hhcnQuYyBiL2xp
Yi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4IGQxZjU1MDBkLi5kODZhYmYwNyAxMDA2NDQKPiAtLS0g
YS9saWIvc2JpL3NiaV9oYXJ0LmMKPiArKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBAQCAtMzU1
LDYgKzM1NSwxMSBAQCBjb25zdCBzdHJ1Y3Qgc2JpX2hhcnRfZXh0X2RhdGEgc2JpX2hhcnRfZXh0
W10gPSB7Cj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHYsIFNCSV9IQVJUX0VYVF9WKSwK
PiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoZiwgU0JJX0hBUlRfRVhUX0YpLAo+ICAgICAg
ICAgX19TQklfSEFSVF9FWFRfREFUQShkLCBTQklfSEFSVF9FWFRfRCksCj4gKyAgICAgICBfX1NC
SV9IQVJUX0VYVF9EQVRBKHNtd2lkLCBTQklfSEFSVF9FWFRfU01XSUQpLAo+ICsgICAgICAgX19T
QklfSEFSVF9FWFRfREFUQShzbWx3aWQsIFNCSV9IQVJUX0VYVF9TTUxXSUQpLAo+ICsgICAgICAg
X19TQklfSEFSVF9FWFRfREFUQShzbWx3aWRsaXN0LCBTQklfSEFSVF9FWFRfU01MV0lETElTVCks
Cj4gKyAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHNtd2lkZGVsZWcsIFNCSV9IQVJUX0VYVF9T
TVdJRERFTEVHKSwKPiArICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc3N3aWQsIFNCSV9IQVJU
X0VYVF9TU1dJRCksCj4gIH07Cj4KPiAgX1N0YXRpY19hc3NlcnQoU0JJX0hBUlRfRVhUX01BWCA9
PSBhcnJheV9zaXplKHNiaV9oYXJ0X2V4dCksCj4gLS0KPiAyLjQzLjcKPgoKUmV2aWV3ZWQtYnk6
IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
