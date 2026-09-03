Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F123C624DE
	for <opensbi@archiver.kernel.org>; Thu,  3 Sep 2026 21:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lkro4rFK3M11ToeYpnwDkjlyVFL/zoYdGeo1Mb733Wo=; b=BbirzG8Y3M0ZSA
	OkEeNvJe6HeQYIFT+v+e//7q9On7aJq/N/Fkm2dP/Nh5aLWZCgKsUiLJiUVQ6uyjz9SSylZ8LgVJa
	3A1AhJ9rQ6DAaHmRYsV0Xg7OKmy+h0y/6om+BcrEe//XVFu1Zf66TSoD9eFhkcwP/Hq4PSpOmsFso
	NCE/495sZqfIOnS9pq7jwafpDuNVTe5p+EVlKO180hyoEG9ejtOC8vtZY6rtWrhdAnMoYtA95Ms2G
	Sb4tnXZvKwHjyHB2nJ3HMKy0G/QXIThGtvvJftR1CdYWECz0xIOJfVavaZ0ENMtXuQaFyumxUiJBg
	ZoRq20MUqcwWSFc+3KRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FMs-00000000fye-3OSV;
	Thu, 03 Sep 2026 21:53:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2FMq-00000000fyI-2dEc
	for opensbi@lists.infradead.org;
	Thu, 03 Sep 2026 21:53:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683JgQFc2572515
	for <opensbi@lists.infradead.org>; Thu, 3 Sep 2026 21:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	585VgJLtctrNYE0W16XYMI6leCuRXxA3KLPe6Aozdj0=; b=KAg2/ZMZJsoKrmOX
	IOboMoWgJtJh7rUccwACeKPRVUCqx9RBA7+BNoIVccJfolzMVtahNGazEnCzq767
	pTqQMn7JIHKvKxsJLagzUvV1qB+onnGAi/IfE4X5j53pjHLvwn0j3irLumAp1k3q
	QVZ+5wocX5yELsNRG+I11A6pBru2Cf5DRvAuWYZXJgqz8hsAtfcnhU4pHUAtlgXd
	sh4H4k5IRHiuU3gbMdI683arDNh3INiM8n+M2rQv7l+FH31YA89Z4/MTB9xu61iY
	kg2VP4wQj8Pf4bBrEBJzb7uT2iMTesZC+hLGPF4KRAPzuMqAc8UXp2QbncP4sYBj
	m+4KVA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b1adqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 21:53:08 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46dade0d7cdso267113fac.1
        for <opensbi@lists.infradead.org>; Thu, 03 Sep 2026 14:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788472382; cv=none;
        d=google.com; s=arc-20260327;
        b=Bn7sJff6CWzAI0kWgpRkw7c54feL0ViKmsdbjK1MGFF8WwVwkOYvP7wCsR4xqGXTlA
         tV2u/r8ywMeHMa68v5fG0FJp96v9wk7A/anQBOnq+AHcVC1LrDldkI219Mb4Vjto/jwe
         A3/BwQbBSRD4tq7VjbrTn+pGVfljxJ6Zyofj1IqQOK08hnrbE1CvyXLT4RS+cokfhG8S
         lXl4ilWBol+Rc9N5rc8/ShuZZCyx3j9mTYMfyEQqU1devE0PKpcclrF2DEBFCfZWs1I8
         fxrsabHFIPeg3R/YPQEqxfCpMseFMae9LhbmrpzzT9JFHkRANxHy/XfMSM9P5KHWyK9A
         SOgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=585VgJLtctrNYE0W16XYMI6leCuRXxA3KLPe6Aozdj0=;
        fh=4ewBQFYQm5N+QAVC2yDkcGgJqnoV8H9Ixi/6ZlMkFAE=;
        b=kmj7TU5hi6WVUtfZU2diC+z4QrNtc1hL0P67EP6a6QRBLTzBZjWLWIsi9derFTHhTk
         i5UXEo/gsdI7oOJs4s2lnjAHmjsFGkKK/5IFSEAsW/d65xo288ARulzjw4kLH2zScUY8
         odDw/QnvxpebqT614m2vK975SWdaWDsaE58eO+1uv3xA0VsrnKoPeciR1yWfcNPodaSx
         k1xmLkZMc/xJbqJBNb18lXjW5NsTI0XS1dU2jldOaazP7SsIReu+w5f92kb48XuiN6qE
         SZ2wBEi8LaTx31ZwSTnVDQAXLs1pE0RWjDY8jTlM5X5q/58AiSmFMCFSTQC9LpYw2BjY
         gtJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788472382; x=1789077182; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=585VgJLtctrNYE0W16XYMI6leCuRXxA3KLPe6Aozdj0=;
        b=cFTys2aFHqC1OFgKkpDhRU292uqZw1PyKMkEBNWibFEMcVlVlUqs3X6OEaWbeW1P5R
         WTdPHv6JjrOIsp20K8xyAfEQT41mflmW+tDCRG8z1HIPd9M2yO3hUQJ01i+JTffHNUVK
         hlGbonF7+6BhuTWRWM494yJOfAYPcsdAW2lnLHL/kzZatmA8KTtVyxhArVJiVxdM09p4
         xBfCerv/6G8c9T6p2lsVJz2mzPXybGBZsb8mmMOEZOiFoMXvl+aEG6lc6RMhqQO6R/GX
         gj4y4Y33AU6EOink9hFgayZc6GFkRdFfX5bmjzRjneUm9pPZc3prS8UYToGSee4Kz5TR
         mTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788472382; x=1789077182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=585VgJLtctrNYE0W16XYMI6leCuRXxA3KLPe6Aozdj0=;
        b=A8j3Ke6m/zEYcon1ZJQ/WY3s+l0M+rdJPlAxijUa4FLEGM7CRrPEKUCSguTctGSmZ4
         WxXECzF8lloKvxv6omchMxyHW3cKhKZn9/NAJyJDxAxzMWU/3qaB5lMe6RCKR9eJOe/F
         KWn2EF+f4hJaiOgshhmJ4HYN+/Nx8GhO8pU6Xj7Dd0zw6D0lQMNL+RljthTCao/eqBUU
         iqm2cQm4kleSGPP4G6v3LYq/HqFdVoeUhiKAXwRX3ZYZCGHHNH8TrOZRGA+OnCYbDioL
         oL01EVNU8E/tjVQwUGUzJsAc8FNErzQc20O1E1DMKT0XptK5TX5jaYh8hn5mMMNm3Y2t
         DQfQ==
X-Gm-Message-State: AFuF++mwh+0s/iQL5muYYNJ1Gw0VFIfUx0PJD8krmeKFU/y1wrWrKbqO
	LIcsfb/kZhWVUr2KZAJ5/efPvzZBlt36Vc8AZ+1+Jdj0MQeY67uFf8qtbL7sU90ScnED5jCVVo5
	84hPjCjxhevl37eSB9B+R14DomvMDPEc6iTkVpQRIgFEhwTpMKwFOPZ14PB22cp1eKhl6ErognS
	vTvtO0EbDEyG4BRf296vBGX5ktgeu1hKqmeN3brsOTuhftmNOjCfo=
X-Gm-Gg: AYBFou1uGhMZd2krVM3+Ivrty5Pxxsk079Uz8Rqj++hgH9VJ3o2yHBT6OgIAN3eMvle
	rTw+yQkAX7/+mLk/D+1v/rs//w9IHMUVkJlDdCoATXVNLl+cwwhGvNrvZkdD3uRmJR56C4BIw58
	Dqmv33fiQiqSXVAVCvBVSPsRws/EXEEqf13EtAr4S7w1fUL7T1CJ/e8VEHZg==
X-Received: by 2002:a05:6870:de10:b0:43d:d0c:ac30 with SMTP id 586e51a60fabf-4754ebbc3ebmr2281210fac.0.1788472382191;
        Thu, 03 Sep 2026 14:53:02 -0700 (PDT)
X-Received: by 2002:a05:6870:de10:b0:43d:d0c:ac30 with SMTP id
 586e51a60fabf-4754ebbc3ebmr2281178fac.0.1788472381835; Thu, 03 Sep 2026
 14:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090503.2104998-1-peter.lin@sifive.com> <20260817090503.2104998-6-peter.lin@sifive.com>
In-Reply-To: <20260817090503.2104998-6-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:52:51 -0700
X-Gm-Features: AcwNN1UHfdHuPiJUenD3X3ldo-itPyPkoxvLvlnC1MdZOURAdr9oD45meeuBC-U
Message-ID: <CAAVgOkKnxXEx9MY4eTtGwrT=iX-PdXNfK5Bq8hBxmD93Sh+ykw@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] lib: sbi_hart: add WID protection mechanism
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com,
        anup@brainfault.org, scott@riscstar.com, conor@kernel.org,
        dave.patel@riscstar.com, raymond.mao@riscstar.com,
        robin.randhawa@sifive.com, samuel.holland@sifive.com, krzk@kernel.org
X-Proofpoint-ORIG-GUID: 1oJtpxNbClseINcVivOM_dtmluuDO16M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE5MiBTYWx0ZWRfX2N2gTUkoX7fr
 URk5t1gi05COB8espDyaM3SXkFN5WdTrF6JMSu+bXol2gx1Y+MCHSCE6hdOIc6gjOmwWbjn4cWw
 PBb0qNPe6TSw5GYu80c/8d6j2jg2Xgg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE5MiBTYWx0ZWRfX/7kwSEhmBz9/
 kuFT5drxEaZnhYswJakAef65CnzbUoV7abNT8ha8LJiKagvxQ08Mpiuc/2xsYSPNa+PNgo7TL16
 hz4gYyZPRJb5YyJQh8Wxu+inyXNQevKLTMvIx0PJ4/qYUOsFvWKWmRyxzyGQJuk4HLlcN61iiMR
 WEuD1mNFmS7bgI2NIKzUHIi+mDUpWH+We0SHmWQQIkDEOuK52xw/mmyIIuK+G9IODAnAjB5PRVO
 SHCxcDhxHhxQ21hDvgLrswZbO4ob11s9QJ3ADe8xBiUqyYE21Ewh0EwwOh+PWEbYRJ/lejRkfDS
 SAtICnLJu7Sl1an3efxU0Ck0feC+u77cJY4FP58B8g7tjGp08aa7gaRnu/l6GwudgRS1t4m8qZO
 qKD2AwygTyVU51Y8jQOk6cIj2FGnYY4VX8FD54t43P+t663rNdLzNVCKGfabI5BgcMiDPzGtWSH
 vRFunYqh2WQD8xwASqQ==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a99ec44 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=AE4qxd8N7XyYOzWiwkYA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: 1oJtpxNbClseINcVivOM_dtmluuDO16M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_145308_695180_3B2AACF0 
X-CRM114-Status: GOOD (  27.49  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gUmVnaXN0ZXIgYSBXSUQtYmFzZWQgaGFydCBw
cm90ZWN0aW9uIG1lY2hhbmlzbSB0aGF0Cj4gY29uZmlndXJlcyBtbHdpZCBhbmQgbXdpZGRlbGVn
IENTUnMgb24gZG9tYWluIGVudHJ5Lgo+IFRoaXMgZW5hYmxlcyB0aGUgcHJvdGVjdGlvbiBmcmFt
ZXdvcmsgcmVjb25maWd1cmUgV0lECj4gaXNvbGF0aW9uIHdoZW5ldmVyIGRvbWFpbnMgYXJlIHN3
aXRjaGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxwZXRlci5saW5A
c2lmaXZlLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHYxIC0+IHYyOgo+IC0gVmFsaWRhdGUgV0lEIGFn
YWluc3QgcG1sd2lkbGlzdCBiZWZvcmUgd3JpdGluZyBtbHdpZCBDU1IgKE96YSkKPiAtLS0KPiAg
aW5jbHVkZS9zYmkvc2JpX2hhcnRfd29ybGRzLmggfCAyNCArKysrKysrKysrKysKPiAgbGliL3Ni
aS9vYmplY3RzLm1rICAgICAgICAgICAgfCAgMSArCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAg
ICAgICAgIHwgIDUgKysrCj4gIGxpYi9zYmkvc2JpX2hhcnRfd29ybGRzLmMgICAgIHwgNzIgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMDIg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zYmkvc2JpX2hhcnRf
d29ybGRzLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9zYmkvc2JpX2hhcnRfd29ybGRzLmMK
Pgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaGFydF93b3JsZHMuaCBiL2luY2x1ZGUv
c2JpL3NiaV9oYXJ0X3dvcmxkcy5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMC4uMmJiMzVhN2UKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2hh
cnRfd29ybGRzLmgKPiBAQCAtMCwwICsxLDI0IEBACj4gKy8qCj4gKyAqIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiArICoKPiArICogQ29weXJpZ2h0IChjKSAyMDI2IFNp
Rml2ZSBJbmMuCj4gKyAqLwo+ICsKPiArI2lmbmRlZiBfX1NCSV9IQVJUX1dPUkxEU19IX18KPiAr
I2RlZmluZSBfX1NCSV9IQVJUX1dPUkxEU19IX18KPiArCj4gK3N0cnVjdCBzYmlfc2NyYXRjaDsK
PiArCj4gKy8qKgo+ICsgKiBJbml0aWFsaXplIFdJRCBoYXJ0IHByb3RlY3Rpb24gZm9yIGN1cnJl
bnQgSEFSVAo+ICsgKgo+ICsgKiBSZWdpc3RlcnMgdGhlIFdJRCBwcm90ZWN0aW9uIG1lY2hhbmlz
bSBpZiBTbXdpZC9TbWx3aWQKPiArICogZXh0ZW5zaW9ucyBhcmUgcHJlc2VudC4KPiArICoKPiAr
ICogQHBhcmFtIHNjcmF0Y2ggcG9pbnRlciB0byBzY3JhdGNoIHNwYWNlIG9mIGN1cnJlbnQgSEFS
VAo+ICsgKgo+ICsgKiBAcmV0dXJuIDAgb24gc3VjY2VzcyBhbmQgbmVnYXRpdmUgZXJyb3IgY29k
ZSBvbiBmYWlsdXJlCj4gKyAqLwo+ICtpbnQgc2JpX2hhcnRfd29ybGRzX2luaXQoc3RydWN0IHNi
aV9zY3JhdGNoICpzY3JhdGNoKTsKPiArCj4gKyNlbmRpZiAvKiBfX1NCSV9IQVJUX1dPUkxEU19I
X18gKi8KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9vYmplY3RzLm1rIGIvbGliL3NiaS9vYmplY3Rz
Lm1rCj4gaW5kZXggYzI5Yzg4OGYuLmFjMDI2ZGVjIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvb2Jq
ZWN0cy5tawo+ICsrKyBiL2xpYi9zYmkvb2JqZWN0cy5tawo+IEBAIC03Nyw2ICs3Nyw3IEBAIGxp
YnNiaS1vYmpzLXkgKz0gc2JpX2Z3ZnQubwo+ICBsaWJzYmktb2Jqcy15ICs9IHNiaV9oYXJ0Lm8K
PiAgbGlic2JpLW9ianMteSArPSBzYmlfaGFydF9wbXAubwo+ICBsaWJzYmktb2Jqcy15ICs9IHNi
aV9oYXJ0X3Byb3RlY3Rpb24ubwo+ICtsaWJzYmktb2Jqcy15ICs9IHNiaV9oYXJ0X3dvcmxkcy5v
Cj4gIGxpYnNiaS1vYmpzLXkgKz0gc2JpX2hlYXAubwo+ICBsaWJzYmktb2Jqcy15ICs9IHNiaV9t
YXRoLm8KPiAgbGlic2JpLW9ianMteSArPSBzYmlfaGZlbmNlLm8KPiBkaWZmIC0tZ2l0IGEvbGli
L3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggMjk4NTZjMGYuLmU5
MmYwYWYzIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkv
c2JpX2hhcnQuYwo+IEBAIC0xNyw2ICsxNyw3IEBACj4gICNpbmNsdWRlIDxzYmkvc2JpX2Vycm9y
Lmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2hhcnQuaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfaGFy
dF9wbXAuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfaGFydF93b3JsZHMuaD4KPiAgI2luY2x1ZGUg
PHNiaS9zYmlfcGxhdGZvcm0uaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfcG11Lmg+Cj4gICNpbmNs
dWRlIDxzYmkvc2JpX3N0cmluZy5oPgo+IEBAIC03NjIsNiArNzYzLDEwIEBAIGludCBzYmlfaGFy
dF9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgYm9vbCBjb2xkX2Jvb3QpCj4gICAg
ICAgICAgICAgICAgIHJjID0gc2JpX2hhcnRfcG1wX2luaXQoc2NyYXRjaCk7Cj4gICAgICAgICAg
ICAgICAgIGlmIChyYykKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwo+
ICsgICAgICAgICAgICAgICByYyA9IHNiaV9oYXJ0X3dvcmxkc19pbml0KHNjcmF0Y2gpOwo+ICsg
ICAgICAgICAgICAgICBpZiAocmMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJj
Owo+ICAgICAgICAgfQo+Cj4gICAgICAgICByZXR1cm4gc2JpX2hhcnRfcmVpbml0KHNjcmF0Y2gp
Owo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0X3dvcmxkcy5jIGIvbGliL3NiaS9zYmlf
aGFydF93b3JsZHMuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAuLmQ5
ZDY5YjA3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnRfd29ybGRzLmMK
PiBAQCAtMCwwICsxLDcyIEBACj4gKy8qCj4gKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBC
U0QtMi1DbGF1c2UKPiArICoKPiArICogQ29weXJpZ2h0IChjKSAyMDI2IFNpRml2ZSBJbmMuCj4g
KyAqLwo+ICsKPiArI2luY2x1ZGUgPHNiaS9yaXNjdl9lbmNvZGluZy5oPgo+ICsjaW5jbHVkZSA8
c2JpL3NiaV9jb25zb2xlLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2RvbWFpbi5oPgo+ICsjaW5j
bHVkZSA8c2JpL3NiaV9lcnJvci5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9oYXJ0Lmg+Cj4gKyNp
bmNsdWRlIDxzYmkvc2JpX2hhcnRfcHJvdGVjdGlvbi5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9o
YXJ0X3dvcmxkcy5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9zY3JhdGNoLmg+Cj4gKwo+ICtzdGF0
aWMgaW50IHNiaV9oYXJ0X3dvcmxkc19jb25maWd1cmUoc3RydWN0IHNiaV9zY3JhdGNoICpzY3Jh
dGNoLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX2Rv
bWFpbiAqZG9tKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgKmhmID0g
c2JpX2hhcnRfZmVhdHVyZXNfcHRyKHNjcmF0Y2gpOwo+ICsgICAgICAgYm9vbCB3aWRfZm91bmQg
PSB0cnVlOwo+ICsgICAgICAgdTMyIHdpZF92YWwgPSAwOwo+ICsKPiArICAgICAgIGlmICghc2Jp
X2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01MV0lEKSkKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgICAgaWYgKGRvbS0+aGFzX3dpZCkgewo+
ICsgICAgICAgICAgICAgICB3aWRfdmFsID0gZG9tLT53aWQ7Cj4gKyAgICAgICB9IGVsc2UgaWYg
KHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NNV0lEKSkgewo+
ICsgICAgICAgICAgICAgICB3aWRfdmFsID0gY3NyX3JlYWQoQ1NSX01XSUQpICYgfk1XSURfTE9D
SzsKPiArICAgICAgIH0gZWxzZSBpZiAoaGYtPmhhc19wbXdpZCkgewo+ICsgICAgICAgICAgICAg
ICB3aWRfdmFsID0gaGYtPnBtd2lkOwo+ICsgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAg
ICAgLyoKPiArICAgICAgICAgICAgICAgICogU21sd2lkIHByZXNlbnQgYnV0IG5vIFdJRCBzb3Vy
Y2UuIFdpdGhvdXQgd3JpdGluZwo+ICsgICAgICAgICAgICAgICAgKiBtbHdpZCwgdGhlIGhhcmR3
YXJlIHJlc2V0IHZhbHVlIGlzIHVzZWQgd2hpY2ggbWF5Cj4gKyAgICAgICAgICAgICAgICAqIGNh
dXNlIGEgc29mdHdhcmUtY2hlY2sgZXhjZXB0aW9uIG9uIGxvd2VyLXByaXZpbGVnZQo+ICsgICAg
ICAgICAgICAgICAgKiBtb2RlIGVudHJ5Lgo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAg
ICAgICAgICAgd2lkX2ZvdW5kID0gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgaWYg
KHdpZF9mb3VuZCkgewo+ICsgICAgICAgICAgICAgICBpZiAoaGYtPmhhc19wbWx3aWRsaXN0ICYm
Cj4gKyAgICAgICAgICAgICAgICAgICAhKGhmLT5wbWx3aWRsaXN0ICYgQklUX1VMTCh3aWRfdmFs
KSkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogZG9tYWluIHdp
ZCAldSBub3QgaW4gcG1sd2lkbGlzdFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fZnVuY19fLCB3aWRfdmFsKTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gU0JJX0VJTlZBTDsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBjc3Jf
d3JpdGUoQ1NSX01MV0lELCB3aWRfdmFsKTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAo
c2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01XSURERUxFRykp
Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfTVdJRERFTEVHLCBkb20tPndpZGRlbGVn
KTsKPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIHN0cnVjdCBzYmlf
aGFydF9wcm90ZWN0aW9uIHdpZF9wcm90ZWN0aW9uID0gewo+ICsgICAgICAgLm5hbWUgICAgICAg
ICAgID0gIndpZCIsCj4gKyAgICAgICAucmF0aW5nICAgICAgICAgPSAxMDAsCj4gKyAgICAgICAu
dHlwZSAgICAgICAgICAgPSBTQklfSEFSVF9QUk9URUNUSU9OX1RZUEVfSUQsCj4gKyAgICAgICAu
Y29uZmlndXJlICAgICAgPSBzYmlfaGFydF93b3JsZHNfY29uZmlndXJlLAo+ICsgICAgICAgLnVu
Y29uZmlndXJlICAgID0gTlVMTAo+ICt9Owo+ICsKPiAraW50IHNiaV9oYXJ0X3dvcmxkc19pbml0
KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiArewo+ICsgICAgICAgaWYgKCFzYmlfaGFy
dF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTUxXSUQpKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAgICByZXR1cm4gc2JpX2hhcnRfcHJvdGVjdGlv
bl9yZWdpc3Rlcigmd2lkX3Byb3RlY3Rpb24pOwo+ICt9Cj4gLS0KPiAyLjQzLjcKPgoKT3phOiBl
eGNlcHQgdGhlIHBhcnQgdGhhdCBpZiB5b3UgZGVjaWRlIHRvIHJlbW92ZSBhbGwgdGhlIGJvb2xl
bmFzIGFuZApmaWd1cmUgb3V0IGZyb20gdGhlIHdpZCAsIHdpZGxpc3QgaXRzbGVmIGlmIHRoYXQg
dmFsaWQgb3Igbm90LgoKUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFA
b3NzLnF1YWxjb21tLmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCg==
