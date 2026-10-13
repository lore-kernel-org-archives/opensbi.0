Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEC6CC6B12
	for <opensbi@archiver.kernel.org>; Tue, 13 Oct 2026 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubt90PZ2gThE77Gq/JFt70L9C5M/opF1G2vFVl348Go=; b=diJh/94oY3oTf0
	eUwNdG09trxD6lbPERIbq3XvWM/M+e3TUwwgwnb6fCBvpmLiZGi+faoe74htO12O0NNlV3LQ1hc0m
	s+Z01Z+hUgNTqXX6x21LI05rqdm7l0ves8Qjxhytjl1LtmEstZxGvddVNMikxNVSkZz2gDpWVPgKe
	53P9ekQ8pa+XM0teWLTKIry9pMQUqVyNOJP8WDySG/NREqbEmpcFNTmG5EA0ImPik+L+SV9zxooIJ
	/KmFJBy1Awazz49Wn7AOy+q+BksEGcP+RtWokuCmY/sVEk7kG5/UbxbuxR1HHNDXnuVYfsaSnBX31
	IxhQAEtqqfrP71EwNIqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiSw-0000000Dwtf-1htx;
	Tue, 13 Oct 2026 19:47:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiSl-0000000Dwp9-2BlB
	for opensbi@lists.infradead.org;
	Tue, 13 Oct 2026 19:47:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHNLDB2332976
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MfgLkIljKib1HNrUVl9Of/n9Yw9qhnXer2vwfxKeCQA=; b=X8U04ZSHl/UVSvdt
	TdkhYZ/8bjqNapDOlUCEwOv11BvJhnF8Uvh6OnO+Vd5ytULGyv8a0mDT0cukbyaG
	0daBZblMsl2beo/7kE/IM6R65iBMwQnE7oeuGY2ZrAjzPRIHrNq0BjjhS+SkiNz+
	IrQj6/ZcSoFwdTlfMe6QPK7IOHMukA2E31fPAetXh3IMGTqkJj+4wlADHEB7pTLM
	cIhrgdsui5CimPZfQUZvXchN1zI7IqQ29uIaZcM3vwsCmdIbmDIlisu5QvFguJG4
	oC/dKZfrfxvpREh1U2tGoYGITApJK+sEik8NjbPNrcXw1ev826KmDz1sd9XLOQ30
	oMsltg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s0hgmtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 19:47:02 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6f538c3453fso2698608eaf.1
        for <opensbi@lists.infradead.org>; Tue, 13 Oct 2026 12:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791920822; cv=none;
        d=google.com; s=arc-20260327;
        b=Bss7uFUYvNLgk0ZravChn4ChWHtpWtKcoTWwlMEuE8d34CTzKHNvpdFMJQ5Ae/evcU
         uMGby5WcikAkcqC9sGqBxw+qfY/3bTen9MLiYWPNaYQADRwAbUcLc7/HBjFgFetQpU9R
         pqzm/kQ4lVaKmzbZSB1KoLO0wxbDOY4q8j49KvZTtCgMYQM+YH+es7VPVEkWXrHWmSJ9
         V1fdJKzDsizMsT3pyRIHIyJa0rZje4rFlCsDj7K/mkRV3S0c/wLdYFk3allRX7ftgQpm
         TiluBZSf4ErobkFMJAnJ1KzrIvWJclnnVBwKPuFCDdEFFCust3YgQQQticDegK4osQ9I
         9kfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MfgLkIljKib1HNrUVl9Of/n9Yw9qhnXer2vwfxKeCQA=;
        fh=d5zBEhzK67tsrGEBLW+Ta0XbR1YqRyKHDUTQZxh/qYo=;
        b=Y6iSKH7Wv8I+sQuEVnpCBliMwadPmAa+VSKKNKSgCG+j/kZ2V+PDDkk8jQqU/XFjB9
         Z2afB3gEWi9CdyEkf4wXJdPacLpNPk8fO2bjrHel6+MFoZMhScRugMWV0erMpQ427Sdj
         U4R54iPQoEdx0eWZ4Z0Yfpx3a/YgzxoeorLf+UQKqfbWpZsDXtQyyAZYRL8Cwh4MAMgu
         5NQrfalOtaJ6AwHeKAgB939RTku6oDVY0nSxx3QCKj8ae0QH7LlZYja2KQ3K+K9oPQCD
         SQBwUwLiLHjVD1kl7eCH/jwTH8sSFO0fBxkHkS9QgrDeG+CXfFvdFhuH1NiJwNdQIGCi
         AQvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791920822; x=1792525622; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MfgLkIljKib1HNrUVl9Of/n9Yw9qhnXer2vwfxKeCQA=;
        b=G/X9+jwGqKJq7MQR61Gmgqu4E0NZSzwNd5vjl1n1TpgvlP5zGaZj7fur9DEtChLIj4
         PBb1Sow3q2C/vpZfQiPG8bxAFnzC65Uexk1ooq1q+0X0Rm5g0ulzyIkjdE1bXWEEsVlX
         ICu8kIKP8g2orMpkzHT7Cv4+BPWsM/h9z/kxv/My1XppaNmqWYJsGjjVdn0Ek4XiXShL
         ODeVAF9OBeBbBLSqEKu+brQqdyqGvqwUDT5PpiGmIOM/6ZcnsjURlpJEfTncZRHXGqUV
         mYo8kz8y/DnOOZJCnQeNLGlRd7CPD1z9ukV5/8GCqy5sHi2udStnbYi/YiBv4+NRA+7y
         NCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920822; x=1792525622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfgLkIljKib1HNrUVl9Of/n9Yw9qhnXer2vwfxKeCQA=;
        b=KjU5HhfshFbNzfH9pcGSvte2zkTb5U8jDD7Qfo73OZ+s69np+TUtRv/iPp2kGQf7V5
         jRUIxJ9CHs4TcoIzNdGfRT02B7z1gCuRnolrpFTRiVx/PLUImoyDsa1gLgmKNdP/SUsU
         igmqiVeB2/S3jTThR3mbz3/WltsBsPDExGyq9jyL1aL1cKIeuGuUfcjd2/C+zsrldiQt
         1+FYXVSoWyIbiAo2+L7FdJvcj4q6PjSFzMOeQ5g3mtVQtdQXmWLyLd6s0q3zF4AnUsHZ
         Tr64cqudM0da43SB6ADSpGwlKSwk9Q856YSJ4cw0rURXADavRSw+XehqQFDlksEZVIGD
         To/g==
X-Forwarded-Encrypted: i=1; AKwUvByKI8/XW6BNPWft2jQiZGRTvs+oXUhPGveUgL3rCvRzm+C/+9qkJaYXfDRpfbPBGe/eZZK11psv@lists.infradead.org
X-Gm-Message-State: AFq9FYIXEQcSW8uktqTkm6wmq3Viz5I3szOPmpBgZglOPQyCiYUSroqw
	oTriJCs0sJHI+R/zTkDDaaIdcmDJqRef1HRxh8iNh2FmLjrpnHy0s0Yh1JSGBg2Nx5hyoBocf15
	ISOy1s2MJT5URtAmkuGCRQwxe7D/77brY4Hs04ILJSpvD7lJVvBaEmN8Mn8bZFPuQSHuNKkdmv/
	JOUzlskXS5UNuoSBWHuqBbbysr/qeCR9BK5vAq5j17
X-Gm-Gg: AYBFou3Q6EH9mA+RIy6u9nAS6jsXsimk6dFqiDgQ3uRJxVtQLeVsIcwpUuMWSm93IrG
	IOHA1HY6lSLSJ41lbavVGfsh/4PWK0wbk/AmBCxeTorrPP1+5Y4nlKQadAsWD9njpdjdAqY31fg
	b8cuxx8s6nQ49sfqTauOxtTioTaqGGaZccmlF2thyshZx+CjSAwtHY/q9ItPk=
X-Received: by 2002:a05:6820:1629:b0:6f6:1e3a:6e1 with SMTP id 006d021491bc7-6f61e3a4004mr4725009eaf.44.1791920821547;
        Tue, 13 Oct 2026 12:47:01 -0700 (PDT)
X-Received: by 2002:a05:6820:1629:b0:6f6:1e3a:6e1 with SMTP id
 006d021491bc7-6f61e3a4004mr4724994eaf.44.1791920821056; Tue, 13 Oct 2026
 12:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com> <20260923032359.4041876-7-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260923032359.4041876-7-anup.patel@oss.qualcomm.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:46:50 -0700
X-Gm-Features: AclHuK9ekod9AHCoG7jMUsdKKrhg4O7aAmAkH8XYsw3P6BiwAsWp4WzWgwO99rg
Message-ID: <CAAVgOkJtL7CpaVHQ8OOetEUV2z7dqbTzF4mwbs+Hwdw7y7fr9w@mail.gmail.com>
Subject: Re: [PATCH 06/11] lib: utils/mpxy: Simplify fdt_mpxy_rpmi.h by moving
 things to fdt_mpxy_rpmi.c
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Authority-Analysis: v=2.4 cv=GL+dgeNK c=1 sm=1 tr=0 ts=6ace8ab6 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=bDdBU3oEAAAA:8
 a=Tl3Rr_ADvaQcEJ2U0oQA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-ORIG-GUID: xrh_usI_Wz22x2vq0Wsq4LN-HGxjZ55x
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfXzE/iHkBjiEKv
 CNnySxxhWyUSIelJInKtTs2gDVrzarIlPUcaYXL+6linnrDe3H/0OycK1kPPZbh56wu8iZF6C0U
 tVDl+7rBm1XqOcMtQTngElMMJuhXvB4=
X-Proofpoint-GUID: xrh_usI_Wz22x2vq0Wsq4LN-HGxjZ55x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX7JdQlfWnCfDn
 d1/JPsjU8oGo0GsfCGUkfgF5WSECecYJltw0Pd4paaIQX1yZ7lUirv4xQt3fqj7YoV9dbg/8o16
 IpsgSTssxMP4psdiZs1U2pJ5qkhkmFpgRO4TOZlYHVFM1uWRWlURS6rg3wL6p7n8SRNRWRZTs65
 IZh+JDbjpSKZ8uOcI7u/QeuIXNmz2d6UNNdmFOSRQ5g243aqQcyhAR6s0zSOReBU8W11IGgQUjj
 r7i5qYVwg2Uu+7wvxowi4TEy4rZ2BnnB1L4QE0TxMIRFlDmFitVDf5my0KvL+rLGhUK3KE+W9bH
 vAD3eIDMLhiTHRJq37gpN92f5+oCgH1VrtdJbwCdodjFoAiKTHXs8ysKXgKw0kwiwBzeRL8VNY7
 u8UkBXClGss4zkZogkgvsfCMop+uAQx54+EE8ZlowK3f042erIv6X5Uf7DPkY+ur2FgQERbcyKU
 3LD1QEySJG0ZR3Bhsqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_124703_690847_A8C1A60C 
X-CRM114-Status: GOOD (  19.80  )
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
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIHRoZSBmZHRfbXB4eV9ycG1p
LmggaGFzIGxvdCB0aGluZ3Mgd2hpY2ggYXJlIG5vdCB1c2VkIGJ5Cj4gYW55IG9mIE1QWFkgUlBN
SSBkcml2ZXJzIHNvIHNpbXBsaWZ5IGZkdF9tcHh5X3JwbWkuaCBieSBtb3Zpbmcgc3VjaAo+IHRo
aW5ncyB0byBmZHRfbXB4eV9ycG1pLmMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpX3V0aWxzL21w
eHkvZmR0X21weHlfcnBtaS5oICAgICAgfCA0MSArLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgbGli
L3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5jICAgICAgICAgICAgICB8IDQxICsrKysrKysrKysr
KysrKysrKysrLQo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2Nsb2NrLmMgICAgICAg
IHwgIDEgKwo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2RldmljZV9wb3dlci5jIHwg
IDEgKwo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2xvZ2dpbmcuYyAgICAgIHwgIDEg
Kwo+ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX21tLmMgICAgICAgICAgIHwgIDEgKwo+
ICBsaWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3BlcmZvcm1hbmNlLmMgIHwgIDEgKwo+ICBs
aWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3N5c21zaS5jICAgICAgIHwgIDEgKwo+ICBsaWIv
dXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3ZvbHRhZ2UuYyAgICAgIHwgIDEgKwo+ICA5IGZpbGVz
IGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvc2JpX3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5oIGIvaW5jbHVkZS9zYmlf
dXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmgKPiBpbmRleCBjNGU2ODk3Zi4uYWU3ZTUzN2EgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmgKPiArKysg
Yi9pbmNsdWRlL3NiaV91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuaAo+IEBAIC0xMCw0NyArMTAs
MTAgQEAKPiAgI2lmbmRlZiBfX0ZEVF9NUFhZX1JQTUlfSF9fCj4gICNkZWZpbmUgX19GRFRfTVBY
WV9SUE1JX0hfXwo+Cj4gLSNpbmNsdWRlIDxzYmkvc2JpX3R5cGVzLmg+Cj4gLSNpbmNsdWRlIDxz
Ymkvc2JpX21weHkuaD4KPiAtI2luY2x1ZGUgPHNiaV91dGlscy9tYWlsYm94L2ZkdF9tYWlsYm94
Lmg+Cj4gICNpbmNsdWRlIDxzYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaD4KPiAtI2lu
Y2x1ZGUgPHNiaV91dGlscy9tcHh5L2ZkdF9tcHh5Lmg+Cj4KPiAtLyoqIENvbnZlcnQgdGhlIG1w
eHkgYXR0cmlidXRlIElEIHRvIGF0dHJpYnV0ZSBhcnJheSBpbmRleCAqLwo+IC0jZGVmaW5lIGF0
dHJfaWQyaW5kZXgoYXR0cl9pZCkgKGF0dHJfaWQgLSBTQklfTVBYWV9BVFRSX01TR1BST1RPX0FU
VFJfU1RBUlQpCj4gLQo+IC1lbnVtIG1weHlfbXNncHJvdF9ycG1pX2F0dHJfaWQgewo+IC0gICAg
ICAgTVBYWV9NU0dQUk9UX1JQTUlfQVRUUl9TRVJWSUNFR1JPVVBfSUQgPSBTQklfTVBYWV9BVFRS
X01TR1BST1RPX0FUVFJfU1RBUlQsCj4gLSAgICAgICBNUFhZX01TR1BST1RfUlBNSV9BVFRSX1NF
UlZJQ0VHUk9VUF9WRVJTSU9OLAo+IC0gICAgICAgTVBYWV9NU0dQUk9UX1JQTUlfQVRUUl9JTVBM
X0lELAo+IC0gICAgICAgTVBYWV9NU0dQUk9UX1JQTUlfQVRUUl9JTVBMX1ZFUlNJT04sCj4gLSAg
ICAgICBNUFhZX01TR1BST1RfUlBNSV9BVFRSX01BWF9JRAo+IC19Owo+IC0KPiAtLyoqCj4gLSAq
IE1QWFkgbWVzc2FnZSBwcm90b2NvbCBhdHRyaWJ1dGVzIGZvciBSUE1JCj4gLSAqIE9yZGVyIG9m
IGF0dHJpYnV0ZSBmaWVsZHMgbXVzdCBmb2xsb3cgdGhlCj4gLSAqIGF0dHJpYnV0ZSBJRHMgaW4g
YGVudW0gbXB4eV9tc2dwcm90X3JwbWlfYXR0cl9pZGAKPiAtICovCj4gLXN0cnVjdCBtcHh5X3Jw
bWlfY2hhbm5lbF9hdHRycyB7Cj4gLSAgICAgICB1MzIgc2VydmljZWdycF9pZDsKPiAtICAgICAg
IHUzMiBzZXJ2aWNlZ3JwX3ZlcjsKPiAtICAgICAgIHUzMiBpbXBsX2lkOwo+IC0gICAgICAgdTMy
IGltcGxfdmVyOwo+IC19Owo+IC0KPiAtLyoqIE1ha2Ugc3VyZSBhbGwgYXR0cmlidXRlcyBhcmUg
cGFja2VkIGZvciBkaXJlY3QgbWVtY3B5ICovCj4gLSNkZWZpbmUgYXNzZXJ0X2ZpZWxkX29mZnNl
dChmaWVsZCwgYXR0cl9vZmZzZXQpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
LSAgICAgICBfU3RhdGljX2Fzc2VydCggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+IC0gICAgICAgICAgICAgICAoKG9mZnNldG9mKHN0cnVjdCBtcHh5
X3JwbWlfY2hhbm5lbF9hdHRycywgZmllbGQpKSAvICAgIFwKPiAtICAgICAgICAgICAgICAgIHNp
emVvZih1MzIpKSA9PSAoYXR0cl9vZmZzZXQgLSBTQklfTVBYWV9BVFRSX01TR1BST1RPX0FUVFJf
U1RBUlQpLFwKPiAtICAgICAgICAgICAgICAgImZpZWxkICIgI2ZpZWxkICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICAgICAgICAgICAgICIgZnJvbSBzdHJ1
Y3QgbXB4eV9ycG1pX2NoYW5uZWxfYXR0cnMgaW52YWxpZCBvZmZzZXQsIGV4cGVjdGVkICIgI2F0
dHJfb2Zmc2V0KQo+IC0KPiAtYXNzZXJ0X2ZpZWxkX29mZnNldChzZXJ2aWNlZ3JwX2lkLCBNUFhZ
X01TR1BST1RfUlBNSV9BVFRSX1NFUlZJQ0VHUk9VUF9JRCk7Cj4gLWFzc2VydF9maWVsZF9vZmZz
ZXQoc2VydmljZWdycF92ZXIsIE1QWFlfTVNHUFJPVF9SUE1JX0FUVFJfU0VSVklDRUdST1VQX1ZF
UlNJT04pOwo+IC1hc3NlcnRfZmllbGRfb2Zmc2V0KGltcGxfaWQsIE1QWFlfTVNHUFJPVF9SUE1J
X0FUVFJfSU1QTF9JRCk7Cj4gLWFzc2VydF9maWVsZF9vZmZzZXQoaW1wbF92ZXIsIE1QWFlfTVNH
UFJPVF9SUE1JX0FUVFJfSU1QTF9WRVJTSU9OKTsKPiArc3RydWN0IG1ib3hfY2hhbjsKPiArc3Ry
dWN0IG1ib3hfeGZlcjsKPgo+ICAvKiogTVBYWSBSUE1JIHNlcnZpY2UgZGF0YSBmb3IgZWFjaCBz
ZXJ2aWNlIGdyb3VwICovCj4gIHN0cnVjdCBtcHh5X3JwbWlfc2VydmljZV9kYXRhIHsKPiBkaWZm
IC0tZ2l0IGEvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaS5jIGIvbGliL3V0aWxzL21weHkv
ZmR0X21weHlfcnBtaS5jCj4gaW5kZXggMTAzZGVkMTMuLmMwNDkzZWNiIDEwMDY0NAo+IC0tLSBh
L2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuYwo+ICsrKyBiL2xpYi91dGlscy9tcHh5L2Zk
dF9tcHh5X3JwbWkuYwo+IEBAIC05LDExICs5LDUwIEBACj4gICAqLwo+Cj4gICNpbmNsdWRlIDxs
aWJmZHQuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4gICNpbmNsdWRlIDxzYmkv
c2JpX2Vycm9yLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2hlYXAuaD4KPiArI2luY2x1ZGUgPHNi
aS9zYmlfbXB4eS5oPgo+ICAjaW5jbHVkZSA8c2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmg+Cj4g
KyNpbmNsdWRlIDxzYmlfdXRpbHMvbWFpbGJveC9mZHRfbWFpbGJveC5oPgo+ICsjaW5jbHVkZSA8
c2JpX3V0aWxzL21weHkvZmR0X21weHkuaD4KPiAgI2luY2x1ZGUgPHNiaV91dGlscy9tcHh5L2Zk
dF9tcHh5X3JwbWkuaD4KPiAtI2luY2x1ZGUgPHNiaS9zYmlfY29uc29sZS5oPgo+ICsKPiArLyoq
IENvbnZlcnQgdGhlIG1weHkgYXR0cmlidXRlIElEIHRvIGF0dHJpYnV0ZSBhcnJheSBpbmRleCAq
Lwo+ICsjZGVmaW5lIGF0dHJfaWQyaW5kZXgoYXR0cl9pZCkgKGF0dHJfaWQgLSBTQklfTVBYWV9B
VFRSX01TR1BST1RPX0FUVFJfU1RBUlQpCj4gKwo+ICtlbnVtIG1weHlfbXNncHJvdF9ycG1pX2F0
dHJfaWQgewo+ICsgICAgICAgTVBYWV9NU0dQUk9UX1JQTUlfQVRUUl9TRVJWSUNFR1JPVVBfSUQg
PSBTQklfTVBYWV9BVFRSX01TR1BST1RPX0FUVFJfU1RBUlQsCj4gKyAgICAgICBNUFhZX01TR1BS
T1RfUlBNSV9BVFRSX1NFUlZJQ0VHUk9VUF9WRVJTSU9OLAo+ICsgICAgICAgTVBYWV9NU0dQUk9U
X1JQTUlfQVRUUl9JTVBMX0lELAo+ICsgICAgICAgTVBYWV9NU0dQUk9UX1JQTUlfQVRUUl9JTVBM
X1ZFUlNJT04sCj4gKyAgICAgICBNUFhZX01TR1BST1RfUlBNSV9BVFRSX01BWF9JRAo+ICt9Owo+
ICsKPiArLyoqCj4gKyAqIE1QWFkgbWVzc2FnZSBwcm90b2NvbCBhdHRyaWJ1dGVzIGZvciBSUE1J
Cj4gKyAqIE9yZGVyIG9mIGF0dHJpYnV0ZSBmaWVsZHMgbXVzdCBmb2xsb3cgdGhlCj4gKyAqIGF0
dHJpYnV0ZSBJRHMgaW4gYGVudW0gbXB4eV9tc2dwcm90X3JwbWlfYXR0cl9pZGAKPiArICovCj4g
K3N0cnVjdCBtcHh5X3JwbWlfY2hhbm5lbF9hdHRycyB7Cj4gKyAgICAgICB1MzIgc2VydmljZWdy
cF9pZDsKPiArICAgICAgIHUzMiBzZXJ2aWNlZ3JwX3ZlcjsKPiArICAgICAgIHUzMiBpbXBsX2lk
Owo+ICsgICAgICAgdTMyIGltcGxfdmVyOwo+ICt9Owo+ICsKPiArLyoqIE1ha2Ugc3VyZSBhbGwg
YXR0cmlidXRlcyBhcmUgcGFja2VkIGZvciBkaXJlY3QgbWVtY3B5ICovCj4gKyNkZWZpbmUgYXNz
ZXJ0X2ZpZWxkX29mZnNldChmaWVsZCwgYXR0cl9vZmZzZXQpICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAgICBfU3RhdGljX2Fzc2VydCggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAoKG9mZnNl
dG9mKHN0cnVjdCBtcHh5X3JwbWlfY2hhbm5lbF9hdHRycywgZmllbGQpKSAvICAgIFwKPiArICAg
ICAgICAgICAgICAgIHNpemVvZih1MzIpKSA9PSAoYXR0cl9vZmZzZXQgLSBTQklfTVBYWV9BVFRS
X01TR1BST1RPX0FUVFJfU1RBUlQpLFwKPiArICAgICAgICAgICAgICAgImZpZWxkICIgI2ZpZWxk
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAg
ICAgICIgZnJvbSBzdHJ1Y3QgbXB4eV9ycG1pX2NoYW5uZWxfYXR0cnMgaW52YWxpZCBvZmZzZXQs
IGV4cGVjdGVkICIgI2F0dHJfb2Zmc2V0KQo+ICsKPiArYXNzZXJ0X2ZpZWxkX29mZnNldChzZXJ2
aWNlZ3JwX2lkLCBNUFhZX01TR1BST1RfUlBNSV9BVFRSX1NFUlZJQ0VHUk9VUF9JRCk7Cj4gK2Fz
c2VydF9maWVsZF9vZmZzZXQoc2VydmljZWdycF92ZXIsIE1QWFlfTVNHUFJPVF9SUE1JX0FUVFJf
U0VSVklDRUdST1VQX1ZFUlNJT04pOwo+ICthc3NlcnRfZmllbGRfb2Zmc2V0KGltcGxfaWQsIE1Q
WFlfTVNHUFJPVF9SUE1JX0FUVFJfSU1QTF9JRCk7Cj4gK2Fzc2VydF9maWVsZF9vZmZzZXQoaW1w
bF92ZXIsIE1QWFlfTVNHUFJPVF9SUE1JX0FUVFJfSU1QTF9WRVJTSU9OKTsKPgo+ICAvKioKPiAg
ICogTVBYWSBSUE1JIGluc3RhbmNlIHBlciBNUFhZIGNoYW5uZWwuIFRoaXMgdGllcwo+IGRpZmYg
LS1naXQgYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2Nsb2NrLmMgYi9saWIvdXRpbHMv
bXB4eS9mZHRfbXB4eV9ycG1pX2Nsb2NrLmMKPiBpbmRleCBjOWU3Nzc5MS4uYTI3MzkyZDUgMTAw
NjQ0Cj4gLS0tIGEvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9jbG9jay5jCj4gKysrIGIv
bGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9jbG9jay5jCj4gQEAgLTgsNiArOCw3IEBACj4g
ICAqICAgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gICAqLwo+Cj4gKyNp
bmNsdWRlIDxzYmlfdXRpbHMvbXB4eS9mZHRfbXB4eS5oPgo+ICAjaW5jbHVkZSA8c2JpX3V0aWxz
L21weHkvZmR0X21weHlfcnBtaS5oPgo+Cj4gIHN0YXRpYyBzdHJ1Y3QgbXB4eV9ycG1pX3NlcnZp
Y2VfZGF0YSBjbG9ja19zZXJ2aWNlc1tdID0gewo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvbXB4
eS9mZHRfbXB4eV9ycG1pX2RldmljZV9wb3dlci5jIGIvbGliL3V0aWxzL21weHkvZmR0X21weHlf
cnBtaV9kZXZpY2VfcG93ZXIuYwo+IGluZGV4IGEyYTNiOTlmLi5kY2ZhYWFmZCAxMDA2NDQKPiAt
LS0gYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2RldmljZV9wb3dlci5jCj4gKysrIGIv
bGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9kZXZpY2VfcG93ZXIuYwo+IEBAIC0xLDMgKzEs
NCBAQAo+ICsjaW5jbHVkZSA8c2JpX3V0aWxzL21weHkvZmR0X21weHkuaD4KPiAgI2luY2x1ZGUg
PHNiaV91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWkuaD4KPgo+ICBzdGF0aWMgc3RydWN0IG1weHlf
cnBtaV9zZXJ2aWNlX2RhdGEgZHB3cl9zZXJ2aWNlc1tdID0gewo+IGRpZmYgLS1naXQgYS9saWIv
dXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX2xvZ2dpbmcuYyBiL2xpYi91dGlscy9tcHh5L2ZkdF9t
cHh5X3JwbWlfbG9nZ2luZy5jCj4gaW5kZXggNDJiYjFlMTQuLjc2ODFkZmU5IDEwMDY0NAo+IC0t
LSBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfbG9nZ2luZy5jCj4gKysrIGIvbGliL3V0
aWxzL21weHkvZmR0X21weHlfcnBtaV9sb2dnaW5nLmMKPiBAQCAtNyw2ICs3LDcgQEAKPiAgICog
ICBTdWJyYWhtYW55YSBMaW5nYXBwYSA8c3VicmFobWFueWEubGluZ2FwcGFAb3NzLnF1YWxjb21t
LmNvbT4KPiAgICovCj4KPiArI2luY2x1ZGUgPHNiaV91dGlscy9tcHh5L2ZkdF9tcHh5Lmg+Cj4g
ICNpbmNsdWRlIDxzYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmg+Cj4KPiAgc3RhdGljIHN0
cnVjdCBtcHh5X3JwbWlfc2VydmljZV9kYXRhIGxvZ2dpbmdfc2VydmljZXNbXSA9IHsKPiBkaWZm
IC0tZ2l0IGEvbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9tbS5jIGIvbGliL3V0aWxzL21w
eHkvZmR0X21weHlfcnBtaV9tbS5jCj4gaW5kZXggOWIwNTY0NTguLjAyNjNhMTA1IDEwMDY0NAo+
IC0tLSBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfbW0uYwo+ICsrKyBiL2xpYi91dGls
cy9tcHh5L2ZkdF9tcHh5X3JwbWlfbW0uYwo+IEBAIC04LDYgKzgsNyBAQAo+ICAgKiAgIFN1bmls
IFYgTCA8c3VuaWx2bEBvc3MucXVhbGNvbW0uY29tPgo+ICAgKi8KPgo+ICsjaW5jbHVkZSA8c2Jp
X3V0aWxzL21weHkvZmR0X21weHkuaD4KPiAgI2luY2x1ZGUgPHNiaV91dGlscy9tcHh5L2ZkdF9t
cHh5X3JwbWkuaD4KPiAgI2luY2x1ZGUgPHNiaV91dGlscy9tYWlsYm94L3JwbWlfbWFpbGJveC5o
Pgo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfcGVyZm9ybWFu
Y2UuYyBiL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfcGVyZm9ybWFuY2UuYwo+IGluZGV4
IDliMmM2MGM1Li42NzNkNTM3OCAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4
eV9ycG1pX3BlcmZvcm1hbmNlLmMKPiArKysgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1p
X3BlcmZvcm1hbmNlLmMKPiBAQCAtMSwzICsxLDQgQEAKPiArI2luY2x1ZGUgPHNiaV91dGlscy9t
cHh5L2ZkdF9tcHh5Lmg+Cj4gICNpbmNsdWRlIDxzYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1p
Lmg+Cj4KPiAgc3RhdGljIHN0cnVjdCBtcHh5X3JwbWlfc2VydmljZV9kYXRhIHBlcmZvcm1hbmNl
X3NlcnZpY2VzW10gPSB7Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3Jw
bWlfc3lzbXNpLmMgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3N5c21zaS5jCj4gaW5k
ZXggOWE1YjRlYzAuLmY3YzNjM2RiIDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9tcHh5L2ZkdF9t
cHh5X3JwbWlfc3lzbXNpLmMKPiArKysgYi9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3N5
c21zaS5jCj4gQEAgLTksNiArOSw3IEBACj4gICNpbmNsdWRlIDxzYmkvc2JpX2J5dGVvcmRlci5o
Pgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9oZWFwLmg+Cj4gICNpbmNsdWRlIDxzYmlfdXRpbHMvbWFp
bGJveC9ycG1pX21haWxib3guaD4KPiArI2luY2x1ZGUgPHNiaV91dGlscy9tcHh5L2ZkdF9tcHh5
Lmg+Cj4gICNpbmNsdWRlIDxzYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pLmg+Cj4KPiAgc3Ry
dWN0IG1weHlfcnBtaV9zeXNtc2kgewo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvbXB4eS9mZHRf
bXB4eV9ycG1pX3ZvbHRhZ2UuYyBiL2xpYi91dGlscy9tcHh5L2ZkdF9tcHh5X3JwbWlfdm9sdGFn
ZS5jCj4gaW5kZXggZmE2NDA4ODYuLjQ3NDg4MDU0IDEwMDY0NAo+IC0tLSBhL2xpYi91dGlscy9t
cHh5L2ZkdF9tcHh5X3JwbWlfdm9sdGFnZS5jCj4gKysrIGIvbGliL3V0aWxzL21weHkvZmR0X21w
eHlfcnBtaV92b2x0YWdlLmMKPiBAQCAtMSwzICsxLDQgQEAKPiArI2luY2x1ZGUgPHNiaV91dGls
cy9tcHh5L2ZkdF9tcHh5Lmg+Cj4gICNpbmNsdWRlIDxzYmlfdXRpbHMvbXB4eS9mZHRfbXB4eV9y
cG1pLmg+Cj4KPiAgc3RhdGljIHN0cnVjdCBtcHh5X3JwbWlfc2VydmljZV9kYXRhIHZvbHRhZ2Vf
c2VydmljZXNbXSA9IHsKPiAtLQo+IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBs
aXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgpSZXZpZXdlZC1ieTogUGF3YW5kZWVwIE96
YSA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgpUZXN0ZWQtYnk6IFBhd2FuZGVlcCBP
emEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
