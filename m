Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0AB60A2607
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 18:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hTUAz/U/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FXEGpzgt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+NaH0S/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5UySWS5a3jYrgIlVnv+HoxAN6NIHMWoYd3wzfLikqQg=; b=hTUAz/U/yYSnDWcYMA8Tqgsp4m
	lLQAiz8b+jC/Zvp4IxyNya9+FIKI+8MqStfe7q3uz9NxmP88WpuviEVcK+Pxf3h5GJHBlTqK8ik97
	755Zt2CykTI4UqLCFwncDr1apjevMZAA0bLr8l2ACE+pACu1xsD3EFfUZ6D6f+8nMaoveD6tpNRaP
	HGS4jIEV8xdouR2OTMODzUXYexTgMhrKsQJYoAAAb57Nbx//VEzc5fY7UghsiVAX+ZTEG4EBdDf6f
	tc+YyXhp5Xevr1wzhOg5TRe5+IpdWB1X8UnnK8ICP/3LGYoLfDbNiArgBgrlCOpaxR+DMAi6953pl
	wM9UNEWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqvi-00000004qRx-1OVN;
	Tue, 10 Nov 2026 18:50:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqvf-00000004qQ6-1ThY
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 18:50:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIoU8B3264587
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bj6M6c6onMA94ZdGCYYEZig7dlQ0h25xgb4OesHqITs=; b=FXEGpzgteHjbuu7b
	k9/PsjltydoSvJhimf15FrJb5yi07mQJKR+t/QYJ6lCC+E8XaQyg65j+2bCZneze
	vPj5S7Tseole19X5GZCSJt9ijkXcZYPJoR+q/bMBDeFWtltA6N/E6vunuCXWea7G
	+0jeAd+Jjml9Rew7fCb0RfsGfqwnjp+E9znQy0mJtnx6gTBVc0nY4aeu7gIxpJvC
	u7mVS/9ubdVD0BzhqX7ft+iqcCg/G+kHs3rZx2OVp0FiPvaBO2aFpUFBLRFmQlzB
	rYbrp5CNmCYhx5w+hiRFKwBZ1e5tPzY5Df31kzsYVcUzuDwesnLFHiGlEbDuOroM
	FVo2Nw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4abdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:50:46 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6df538053fcso2323172eaf.3
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 10:50:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336646; cv=none;
        d=google.com; s=arc-20260327;
        b=RKmyvp13sfFfxnzYCgojJqtAAELbpf/mbgTjXu8+aFVrTggialRa9OrHeJgUlX0DZF
         4DAUH5RRH3ElFHxD71L0rddrW/CJo7IkWgTR+nErh4phrKyW9nbzEH2wmRJWBgwayEql
         kSTbT5Q4VXYCVvVev82H5G07xPWIsahc0iQbOuwWPOcWXpG3AnrPGik4EXfNW7ifuETc
         IHBMK+pjMUGicX5Zcvfg2Wwk1S9RcMtZdFIgET/mglZkueB+h/eCNAdWC8scuQMzaj8d
         BGer5OamsjHmpCsyeYuo4QL6RvMz/PVItaTuRHBXfyJZ+Y7Aw2MTWei/QgQepoXqGpxB
         WQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bj6M6c6onMA94ZdGCYYEZig7dlQ0h25xgb4OesHqITs=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=QRTpHWlR2hY4kr3rb256tnxMeQlo3LOg/C1tAGrBJ+GlsMf+o0fcf7lvmQM3ji9rbg
         frrd4LymT1CF8Uzb0O5gGROM6ksEEVnioKO/oO1K60o+YW5aof8mIl6KamKmDOW1KmHL
         WIcZRY7Yzhgr8kgncr46RqedMPmxlQ+CyAgSuuR9CYzpIHRocj2nLppcnl2ZU1mdY5Mx
         25sCDwOG+kVufN+Rq3zAKLd+gn4ZOUggWMuhGqETuYQ2bZOUQ0HZ00+HOkmV37pOUKa8
         vd0B6WKfTxhOnGg8BW2XJ5sT8Qeh77h57eTfWRmoGaMKbW0eStaCRM7z2goWnlgAuwYF
         M9+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794336646; x=1794941446; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bj6M6c6onMA94ZdGCYYEZig7dlQ0h25xgb4OesHqITs=;
        b=X+NaH0S/VMbph32aPmJOFgc64JA06NRuWbhI/6kT8Ljm+qL741BQ6kliIiLEbtapz6
         DEtUsSewbMCrZPvqFsmIwcXu9GOF8aFVc5wCmmENfNhMNZmDIDJPRsAjp389BbqJI2s6
         I+2zOvzLd/+MRllTqlIwkK7h4cjGcbQmPXdNUf7tTPVsdx98ghNvZ1Uq/RyeeMCIAjMC
         iuAevU6OY8A5If/zY8czHL+wNipSVrtu4Oe9Qth2lDwXoMSojh9yKeWn/QCK9zDD5aU/
         Usb8Sx8CmM8zdWZQKEqsRUncYicVs9KFJws/37hR4DFzL9ZDYGC16wQCW5LlnTzdn/Am
         UKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336646; x=1794941446;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bj6M6c6onMA94ZdGCYYEZig7dlQ0h25xgb4OesHqITs=;
        b=ZZRaJnnPq56j+ir+wWum5b8kgtDUStS9Qp1UxcSpeLVwECCgz6kJ30efR1yB0cBHDp
         WaLYySKKvnxC7M1GYvumZcKudA0YiM/aaFWnCdPyoxizRTZTM7SXfwYPt5/4NU41ntKe
         4+1KrTwT9iRbiL1xZX9tobHShDXCfAWDVorVZ5zxA/A0WseHSiExa3PMGbqg86cngnsa
         7d06MYRuP2zAOFXbMFFyJoxgbmz+s5xUK3jEbWJFT68/3UA76y5/oRSPZxZAGDU8k78r
         MVrRAK1zccXuz9Vn73x3XaJ778yWVcww07w8tJCpOf4ULiJjfE6muurissU0PSVehbfZ
         1oMw==
X-Gm-Message-State: APuU4Z9wTuef3uHsPzjGxT8+YxEKmoCutbRJusn9QUIDTsIC5eeCuG6F
	V2qikxnVoS19ZDQTJyi6nglQfMe8xSJjSmlG7vQTxhIc6+jVO+sZgoLQTmqKve2FXARqzE6OH4A
	xWtKUA7VCLaMvd8SZuP26nILKUZjlLxUJJf7hsBLvUvvORRXtZwQzhkcVMpY1nlGhZ6IPXPo8IC
	p4gw4QKT6Ko0k0VlZbY3J2xqxP+y0dVNzO623MpFlj
X-Gm-Gg: AYBFou2dtytDSPNjvn597N1JRWeT4B766auBrWTPp4vMPAHz9PdtlHNn3GIPVs7xEQ8
	e3iBiYi5D6z3z/uSJNE+7nZZ2ZGRZEtE5IwuVG1BfXpMktLsG1Tz1NGWBxWReDhzBmOH+kLW9kw
	fpgTUYTMQBvkauTHOoXFnxKy5f7LY/W1yOFFgIWQO+vEHRZyPjgkAJcXAiSw==
X-Received: by 2002:a05:6820:83d9:10b0:6c9:80d8:a1ea with SMTP id 006d021491bc7-718a6257f48mr1410136eaf.39.1794336645673;
        Tue, 10 Nov 2026 10:50:45 -0800 (PST)
X-Received: by 2002:a05:6820:83d9:10b0:6c9:80d8:a1ea with SMTP id
 006d021491bc7-718a6257f48mr1410123eaf.39.1794336645173; Tue, 10 Nov 2026
 10:50:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-10-peter.lin@sifive.com>
In-Reply-To: <20261110095029.117504-10-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 10:50:34 -0800
X-Gm-Features: AclHuK9ddS3pCqJHoAjJ7P5h-1KIvu2757QmfVzx6mK0GJi6s-Lv0C68GLGFtMs
Message-ID: <CAAVgOkJSjx2HyCuu3_qFtvrtWNUjFrcNgxHjJgrKP1+6ikUwsA@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] docs: document WID DT properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NSBTYWx0ZWRfXyzWNNPEc+gCU
 /TAT3LRQd97aQ5C/YYUNn018dCT7MkB7eJ44rHoo4Fzge+3SAl5eRZ9y+Dh1SVN2Hcznma0Etvd
 VNyxunJeZkoQoIydtJFYAIB53Pv8FRKVpoUjNw1FetSo+bsmdCTQ+NMmWcAGvDrBepMtpeEGGyw
 sbQAaSb1jCPQKcTNI/8Z1NJvF20EF5P+8r2h9Uf2tmxEpBoABQazGy4RRNMFK+NN4nxiP5t0Q9m
 SuH2rvNDbtnVr4jYzHgJkr7v5JGHNpcWMmnCebCstyiELDAfaWf7PTLKUvm2iH5gZCmWAyTPTCx
 QQf3TzbfwSXFqhRo8Fv5cu2Kps9mAR2MXFOoPqqHMbJvxiMe7vOALPfod+OxlCGb0OODa3zrnvy
 kt3e+4ftu5WC8qur/4E2G03G60UlD+d8Me2clqHJHVg8iGODNQ7ecwwjGYI/jx2juhq/nY3zC3B
 iGMhEMI6LgQWdinfDWA==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af36786 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=ALoK6yIlVULpHgqdaDgA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NSBTYWx0ZWRfX7icgf/V0IIvm
 5jWhM4WKWw7gC8icBldN5RABFG0xmaOCPNfjS1Hlvv9w7H5ZLCLI4tjj2XL6UnRKWaBFhOmUlmp
 aokCpX2MzFiCHb25uFcq/6qRS158LOY=
X-Proofpoint-GUID: cnsmKnHq6U7RDOblpDRDeZdP6Pw9TfxB
X-Proofpoint-ORIG-GUID: cnsmKnHq6U7RDOblpDRDeZdP6Pw9TfxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_105047_402648_A99FCB96 
X-CRM114-Status: GOOD (  25.34  )
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

T24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMTo1MeKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkICJ3aWQiIGFuZCAid2lkZGVsZWciIHBy
b3BlcnRpZXMgdG8gZG9tYWluIGluc3RhbmNlIG5vZGUKPiBkb2N1bWVudGF0aW9uIGFuZCBleGFt
cGxlIERULiBBZGQgYSAiUm9vdCBEb21haW4gTm9kZSIgc2VjdGlvbgo+IGRlc2NyaWJpbmcgdGhl
ICJyb290IiBzdWJub2RlIHVuZGVyIHRoZSBkb21haW4gY29uZmlndXJhdGlvbgo+IG5vZGUgZm9y
IHJvb3QgZG9tYWluIFdJRCBjb25maWd1cmF0aW9uCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGll
biBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+IENoYW5nZXMgdjQtPnY1
Ogo+IC0gRG9jdW1lbnQgd2lkIGFzIGxlc3MgdGhhbiBYTEVOIGFuZCB3aWRkZWxlZyBhcyBhdCBt
b3N0IFhMRU4gYml0cywKPiAgIGluc3RlYWQgb2YgZml4ZWQgMzIvNjQtYml0IChSYWRpbSkKPiAt
IERyb3AgUkItdGFnIGZyb20gQW51cAo+IC0tLQo+ICBkb2NzL2RvbWFpbl9zdXBwb3J0Lm1kIHwg
MzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDM4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kb2NzL2RvbWFpbl9zdXBwb3J0
Lm1kIGIvZG9jcy9kb21haW5fc3VwcG9ydC5tZAo+IGluZGV4IDUxNzM3MjE4Li4xODlmM2NhOSAx
MDA2NDQKPiAtLS0gYS9kb2NzL2RvbWFpbl9zdXBwb3J0Lm1kCj4gKysrIGIvZG9jcy9kb21haW5f
c3VwcG9ydC5tZAo+IEBAIC01Niw2ICs1Niw4IEBAIGhhcyBmb2xsb3dpbmcgZGV0YWlsczoKPiAg
ICBkb21haW4uIFRoaXMgY2FuIGJlIGVpdGhlciBTLW1vZGUgb3IgVS1tb2RlLgo+ICAqICoqc3lz
dGVtX3Jlc2V0X2FsbG93ZWQqKiAtIElzIGRvbWFpbiBhbGxvd2VkIHRvIHJlc2V0IHRoZSBzeXN0
ZW0/Cj4gICogKipzeXN0ZW1fc3VzcGVuZF9hbGxvd2VkKiogLSBJcyBkb21haW4gYWxsb3dlZCB0
byBzdXNwZW5kIHRoZSBzeXN0ZW0/Cj4gKyogKip3aWQqKiAtIFdvcmxkIElEIGZvciB0aGUgZG9t
YWluCj4gKyogKip3aWRkZWxlZyoqIC0gV29ybGQgSUQgZGVsZWdhdGlvbiBiaXRtYXNrIGZvciB0
aGUgZG9tYWluCj4KPiAgVGhlIG1lbW9yeSByZWdpb25zIHJlcHJlc2VudGVkIGJ5ICoqcmVnaW9u
cyoqIGluICoqc3RydWN0IHNiaV9kb21haW4qKiBoYXZlCj4gIGZvbGxvd2luZyBhZGRpdGlvbmFs
IGNvbnN0cmFpbnRzIHRvIGFsaWduIHdpdGggUklTQy1WIFBNUCByZXF1aXJlbWVudHM6Cj4gQEAg
LTk4LDYgKzEwMCw4IEBAIGZvbGxvd2luZyBtYW5uZXI6Cj4gICAgaXMgdGhlIG5leHQgbW9kZSBm
b3IgdGhlIFJPT1QgZG9tYWluCj4gICogKipzeXN0ZW1fcmVzZXRfYWxsb3dlZCoqIC0gVGhlIFJP
T1QgZG9tYWluIGlzIGFsbG93ZWQgdG8gcmVzZXQgdGhlIHN5c3RlbQo+ICAqICoqc3lzdGVtX3N1
c3BlbmRfYWxsb3dlZCoqIC0gVGhlIFJPT1QgZG9tYWluIGlzIGFsbG93ZWQgdG8gc3VzcGVuZCB0
aGUgc3lzdGVtCj4gKyogKip3aWQqKiAtIENvbmZpZ3VyYWJsZSBXb3JsZCBJRCBmb3IgdGhlIFJP
T1QgZG9tYWluCj4gKyogKip3aWRkZWxlZyoqIC0gQ29uZmlndXJhYmxlIFdvcmxkIElEIGRlbGVn
YXRpb24gYml0bWFzayBmb3IgdGhlIFJPT1QgZG9tYWluCj4KPiAgRG9tYWluIEVmZmVjdHMKPiAg
LS0tLS0tLS0tLS0tLS0KPiBAQCAtMTMxLDYgKzEzNSwyMyBAQCBUaGUgRFQgcHJvcGVydGllcyBv
ZiBhIGRvbWFpbiBjb25maWd1cmF0aW9uIERUIG5vZGUgYXJlIGFzIGZvbGxvd3M6Cj4gICogKipj
b21wYXRpYmxlKiogKE1hbmRhdG9yeSkgLSBUaGUgY29tcGF0aWJsZSBzdHJpbmcgb2YgdGhlIGRv
bWFpbgo+ICAgIGNvbmZpZ3VyYXRpb24uIFRoaXMgRFQgcHJvcGVydHkgc2hvdWxkIGhhdmUgdmFs
dWUgKiJvcGVuc2JpLGRvbWFpbixjb25maWciKgo+Cj4gKyMjIyBSb290IERvbWFpbiBOb2RlCj4g
Kwo+ICtUaGUgcm9vdCBkb21haW4gV0lEIGNvbmZpZ3VyYXRpb24gaXMgZGVzY3JpYmVkIGluIGEg
Kipyb290Kiogc3Vibm9kZSB1bmRlcgo+ICt0aGUgZG9tYWluIGNvbmZpZ3VyYXRpb24gRFQgbm9k
ZS4KPiArCj4gK1RoZSBEVCBwcm9wZXJ0aWVzIG9mIHRoZSByb290IGRvbWFpbiBub2RlIGFyZSBh
cyBmb2xsb3dzOgo+ICsKPiArKiAqKmNvbXBhdGlibGUqKiAoTWFuZGF0b3J5KSAtIFRoZSBjb21w
YXRpYmxlIHN0cmluZyBvZiB0aGUgcm9vdCBkb21haW4gbm9kZS4KPiArICBUaGlzIERUIHByb3Bl
cnR5IHNob3VsZCBoYXZlIHZhbHVlICoib3BlbnNiaSxkb21haW4saW5zdGFuY2UiKi4KPiArKiAq
KndpZCoqIChNYW5kYXRvcnkgaWYgU21sd2lkIGlzIHByZXNlbnQpIC0gVGhlIFdvcmxkIElEICht
dXN0IGJlIGxlc3MgdGhhbiBYTEVOKSBmb3IKPiArICBsb3dlci1wcml2aWxlZ2UgbW9kZXMgKFMv
VS1tb2RlKSBmb3IgdGhlIFJPT1QgZG9tYWluLiBJZiB0aGUgaGFydAo+ICsgIHN1cHBvcnRzIHRo
ZSBTbWx3aWQgZXh0ZW5zaW9uLCB0aGlzIHByb3BlcnR5IG11c3QgYmUgcHJvdmlkZWQuCj4gKyog
Kip3aWRkZWxlZyoqIChPcHRpb25hbCkgLSBUaGUgV29ybGQgSUQgZGVsZWdhdGlvbiBiaXRtYXNr
IChhdCBtb3N0IFhMRU4gYml0cykgZm9yCj4gKyAgdGhlIFJPT1QgZG9tYWluLiBJZiBwcmVzZW50
LCBPcGVuU0JJIHdyaXRlcyB0aGlzIHZhbHVlIHRvICoqbXdpZGRlbGVnKioKPiArICB3aGVuIGVu
dGVyaW5nIHRoZSBST09UIGRvbWFpbiAocmVxdWlyZXMgU213aWRkZWxlZyBleHRlbnNpb24pLiBJ
ZiBhYnNlbnQsCj4gKyAgY2xlYXJzICoqbXdpZGRlbGVnKiogdG8gZGlzYWJsZSBTLW1vZGUgV0lE
IGRlbGVnYXRpb24uCj4gKwo+ICAjIyMgRG9tYWluIE1lbW9yeSBSZWdpb24gTm9kZQo+Cj4gIFRo
ZSBkb21haW4gbWVtb3J5IHJlZ2lvbiBEVCBub2RlIGRlc2NyaWJlcyBkZXRhaWxzIG9mIGEgbWVt
b3J5IHJlZ2lvbiBhbmQKPiBAQCAtMjA1LDYgKzIyNiwxMyBAQCBUaGUgRFQgcHJvcGVydGllcyBv
ZiBhIGRvbWFpbiBpbnN0YW5jZSBEVCBub2RlIGFyZSBhcyBmb2xsb3dzOgo+ICAgIHdoZXRoZXIg
dGhlIGRvbWFpbiBpbnN0YW5jZSBpcyBhbGxvd2VkIHRvIGRvIHN5c3RlbSByZXNldC4KPiAgKiAq
KnN5c3RlbS1zdXNwZW5kLWFsbG93ZWQqKiAoT3B0aW9uYWwpIC0gQSBib29sZWFuIGZsYWcgcmVw
cmVzZW50aW5nCj4gICAgd2hldGhlciB0aGUgZG9tYWluIGluc3RhbmNlIGlzIGFsbG93ZWQgdG8g
ZG8gc3lzdGVtIHN1c3BlbmQuCj4gKyogKip3aWQqKiAoTWFuZGF0b3J5IGlmIFNtbHdpZCBpcyBw
cmVzZW50KSAtIFRoZSBXb3JsZCBJRCAobXVzdCBiZSBsZXNzIHRoYW4gWExFTikgZm9yCj4gKyAg
bG93ZXItcHJpdmlsZWdlIG1vZGVzIChTL1UtbW9kZSkgZm9yIHRoZSBkb21haW4gaW5zdGFuY2Uu
IElmIHRoZSBoYXJ0Cj4gKyAgc3VwcG9ydHMgdGhlIFNtbHdpZCBleHRlbnNpb24sIHRoaXMgcHJv
cGVydHkgbXVzdCBiZSBwcm92aWRlZC4KPiArKiAqKndpZGRlbGVnKiogKE9wdGlvbmFsKSAtIFRo
ZSBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgKGF0IG1vc3QgWExFTiBiaXRzKSBmb3IKPiAr
ICB0aGUgZG9tYWluIGluc3RhbmNlLiBJZiBwcmVzZW50LCBPcGVuU0JJIHdyaXRlcyB0aGlzIHZh
bHVlIHRvICoqbXdpZGRlbGVnKioKPiArICBvbiBjb250ZXh0IHN3aXRjaCBpbnRvIHRoaXMgZG9t
YWluIChyZXF1aXJlcyBTbXdpZGRlbGVnIGV4dGVuc2lvbikuIElmIGFic2VudCwKPiArICBjbGVh
cnMgKiptd2lkZGVsZWcqKiB0byBkaXNhYmxlIFMtbW9kZSBXSUQgZGVsZWdhdGlvbi4KPgo+ICAj
IyMgQXNzaWduaW5nIEhBUlQgVG8gRG9tYWluIEluc3RhbmNlCj4KPiBAQCAtMjYwLDYgKzI4OCwx
MiBAQCBiZSBkb25lOgo+ICAgICAgICAgICAgICAgICAgb3JkZXIgPSA8NjQ+Owo+ICAgICAgICAg
ICAgICB9Owo+Cj4gKyAgICAgICAgICAgIHJvb3Qgewo+ICsgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJvcGVuc2JpLGRvbWFpbixpbnN0YW5jZSI7Cj4gKyAgICAgICAgICAgICAgICB3aWQg
PSA8Mz47Cj4gKyAgICAgICAgICAgICAgICB3aWRkZWxlZyA9IDwweDAgMHgwPjsKPiArICAgICAg
ICAgICAgfTsKPiArCj4gICAgICAgICAgICAgIHRkb21haW46IHRydXN0ZWQtZG9tYWluIHsKPiAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAib3BlbnNiaSxkb21haW4saW5zdGFuY2UiOwo+
ICAgICAgICAgICAgICAgICAgcG9zc2libGUtaGFydHMgPSA8JmNwdTA+Owo+IEBAIC0yNjgsNiAr
MzAyLDggQEAgYmUgZG9uZToKPiAgICAgICAgICAgICAgICAgIG5leHQtYXJnMSA9IDwweDAgMHgw
PjsKPiAgICAgICAgICAgICAgICAgIG5leHQtYWRkciA9IDwweDAgMHg4MDEwMDAwMD47Cj4gICAg
ICAgICAgICAgICAgICBuZXh0LW1vZGUgPSA8MHgwPjsKPiArICAgICAgICAgICAgICAgIHdpZCA9
IDwxPjsKPiArICAgICAgICAgICAgICAgIHdpZGRlbGVnID0gPDB4MCAweDY+Owo+ICAgICAgICAg
ICAgICAgICAgc3lzdGVtLXJlc2V0LWFsbG93ZWQ7Cj4gICAgICAgICAgICAgICAgICBzeXN0ZW0t
c3VzcGVuZC1hbGxvd2VkOwo+ICAgICAgICAgICAgICB9Owo+IEBAIC0yNzYsNiArMzEyLDggQEAg
YmUgZG9uZToKPiAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAib3BlbnNiaSxkb21haW4s
aW5zdGFuY2UiOwo+ICAgICAgICAgICAgICAgICAgcG9zc2libGUtaGFydHMgPSA8JmNwdTEgJmNw
dTIgJmNwdTMgJmNwdTQ+Owo+ICAgICAgICAgICAgICAgICAgcmVnaW9ucyA9IDwmdG1lbSAweDA+
LCA8JnR1YXJ0IDB4MD4sIDwmYWxsbWVtIDB4M2Y+Owo+ICsgICAgICAgICAgICAgICAgd2lkID0g
PDA+Owo+ICsgICAgICAgICAgICAgICAgd2lkZGVsZWcgPSA8MHgwIDB4MT47Cj4gICAgICAgICAg
ICAgIH07Cj4gICAgICAgICAgfTsKPiAgICAgIH07Cj4gLS0KPiAyLjQzLjcKPgoKUmV2aWV3ZWQt
Ynk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21tLmNvbT4KCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
