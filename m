Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DB8C44532
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3N0AfDhMUFMBJZIFbI88vMw/+ZKHALDEOVKNM8zGQw=; b=hmc8MkXC8CMif7
	N4ZPMw7w2S52kKDcAS349RLurUquu7zmcmPtG9a9uiL4Tl9ownzxp6LK9+QdznH2m3SFsKRI6DRjh
	Gp3y9SYswr7804hPsmtpl/EEH3ZvMy9Ht+cd3BWISyNcnBGjMfQfK7+K1KKAuq42RD7Vm2rtDzSQJ
	QJTRTBdWtKUbDid/xNSHo50z5aLS8ibk/Cq055Kb0WBAAdpWOIVsevEI3X5tZYvDlB/JJmY14DDkE
	J1hHy0weQKJUJR4YXWjj1kvOtulST92tlFpqFCC4HB+5AKO1XM5jR7gCcD/tSZdLns5C8SMG2DTN3
	dh9O/PS5ys79C8oISqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUd5-0000000Bb22-3eVm;
	Wed, 22 Jul 2026 10:56:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUd3-0000000Bb1W-1Hfq
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 10:56:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xCDv383941
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 10:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GFoBf9hgEgWvMYy7mk8zFhDuAc8zIZyd40ApZB38fw=; b=R01s83xD6b4pWiYt
	iqsROmTOkbWJI1fXUivRs6D8I7XMRfkhjJs6OvywrDhFQmwIT/fMymGMDRYl30uV
	fECz/LHGd0SL4z5WcTlMn5pHoEwCnUK+Tu3zluTWrub3FxK9pZ2Q1k7/TPiv2QcK
	Dj6V2kQ2nkfhw6hZFwE6rbn9hg+9s00hgbmRvRGoS0FVb670WFXeioNguTpBpKpr
	8nEO3UZL90arHeRLl9xfQWqvcwV7ZnKrsreSXpAK/27vEC1Dv33L2ypsa9sxblty
	687Rj2hvoMF/QfoduyKK1X7B3fiuPa2dszppMkDezaU9vRDx5451/208JuaxIIyH
	sgCnLA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928wvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 10:56:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso984078685a.0
        for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784717803; cv=none;
        d=google.com; s=arc-20260327;
        b=EH9wT1Q5gi494oC8BcoRxfLetbhYu32CuqQiq2QMN1Ue2461LyH1Kqu8JwLnel1esF
         zyfv1e7QGcXkYNtRZUlQX0de1LFsNZUiwIwi5Tb4UGnnvKKPrzgqKo6FjHc+n3shnK9V
         quSY26bnAOPqpCaOSPBdG2L2lM6cFROni3CE/GhJ1UfO+F4hPGYVF1l2Bj8Wp9TUh/Pj
         /mFFoW1XxD9HDLQU6E56qFtsqovIx4rXSmCFL7M7USUiN+Q77pn2hjVGzV2aodFD6je5
         as6jI/Gf+AvfkvGP5lgpZ91/8efs5rSofU7jiV0I3FuArIFREf/XUJ40s/WOrc+MiLYg
         oyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+GFoBf9hgEgWvMYy7mk8zFhDuAc8zIZyd40ApZB38fw=;
        fh=544heieIpBmlFytIxIhvFp1E790UobuKKFXzOq9rQ/Y=;
        b=Q7vEYK2YmqgjQn2C0l4jT7vJ9QqOgchMTeuCwEeCjYHcptyHfXU9eFW64w3WamKivh
         zLX36g6ZrGb+fdbWiTU9COJDDKN0sa66yp6F6PdyYbar9t5hglv2MZnMx3aOVR3YAN0Z
         NvFSGwNtKoKHVT69AdZWkUpG22Yi8EzsWU22TBMc9JLiLunepKqzmekjzYj3IDU5P2RC
         bNFDX01LOWyHoOkkD8MMCDUgWtg4UI7CNRAqFvmS4CdYyfXhAgYTfjbHMkRjoAUNw8Pc
         7IK0PllxdeMJjKzR1UV3HFUOwcSyehMoepnWDyLnupebBYUb2HqRiBpXTguj2RA6+xdo
         Ov/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717803; x=1785322603; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+GFoBf9hgEgWvMYy7mk8zFhDuAc8zIZyd40ApZB38fw=;
        b=NNPw0DwMMV7GcuRs3QcCT8u+P9TMBKry+unCLhTNVErjp1P9VtHtJi7YSitYP80v5g
         KKnssSkMYfnxrwcRRQ5GePobvj6kZGJ3JQgYCWcpXGQT3v8BXJohjr+HUl04KHzsgBAC
         AWP1LZAeGVwVWfuQOFKbjqsMwNR8T5kCNDOuCu4bzQvTt6MvA8RSqe9Bnc1q141Z//+o
         r71+7VOgSoIzC+2U9Rle5yTHTYAYYhFl6F/rr4Ib/zTSZWUhH/JhAcY34BLexfsU1c6L
         734GqHc12VQrXb/V73/ATYSKQ1bAbSzoRdPF+df9W3HVRvGBazHqAnqsOlMnTZpS2mLR
         5SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717803; x=1785322603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GFoBf9hgEgWvMYy7mk8zFhDuAc8zIZyd40ApZB38fw=;
        b=ILwnxUmTKI0MBQDjmDhap+AwSUhcz5ZWtulDjGW6y3Wh2luFBNxqne68fQ+c9MVHFj
         G0PyQ9HA/iaOaGH8G1qF8giC+VfMOdYJT6gLmdX0Dab6u3T/xD53YYirK20c33T2r09e
         2orNQFDUxzSCe2diV3xMOaztkwi5ulcFS9b00vw85f9wiTREDjy2dWEOpIYg1zqmyLzg
         LEAWVtm5fHsdKay/Kp32lOmbKIOPt3XLJHmnZPLPMo2wYwtJRooOxpVTCXZHlQ08nbov
         X6Moj9y8TrcHVoHvBNHww1Ve92PRG8LGKDhj1ZLycesXffFsvXmzeI8U5fgkGhRqoTqC
         DPCw==
X-Forwarded-Encrypted: i=1; AHgh+RrDYGtNr8kn862b1rMVdRe+KW87iXlQmC/z33IcTpGlB5pzAbzg+E+v4o5keqqoZG8E3LevmNRz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh5or6xWbnyE5nmM6ljuAPSzmiNssPUOiOlthPDrtiEvNvuEbw
	R28y7REaBlEWyqfTMHudtn9DgJNwLptQeQTzt1wmdnC9shdtmsO+zTECXnGzCypVc1KLVvWpFu9
	mi2oQKO0LFEE3Yu0HxhEOLRuOfVQNhj/QnXGlYhtzRiv2SvCuILf0t41RGH6JG8gQJsJZFPxDjw
	70vzfQLTZ3p4sW7KUH0NnRNaTbZgRv9SXnY7ELzCp8
X-Gm-Gg: AR+sD11vjhhnxBjgiEfyx+9xEVd2apcMuiWYlX4wc/Gr9QsuXUuvl6Yf98BXlPwsrRC
	li7z6VjpyqnhP4TVhdlbn6YMX/McyNN1Jujp19InMVCsQGqocUg8iY/9nyFldS3nb6XYEgmBUxP
	ZsBCA58SM2knXg87XJDShElkjO0WmRYWaMYQ0pv2zc5+tZcXLlT6aY0S8kHg==
X-Received: by 2002:a05:620a:444f:b0:930:f9f8:8e89 with SMTP id af79cd13be357-930f9f8a8b6mr89098285a.46.1784717803501;
        Wed, 22 Jul 2026 03:56:43 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:930:f9f8:8e89 with SMTP id
 af79cd13be357-930f9f8a8b6mr89095985a.46.1784717803071; Wed, 22 Jul 2026
 03:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com> <20260717074413.2536416-2-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260717074413.2536416-2-anup.patel@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:26:32 +0530
X-Gm-Features: AUfX_myTX_18UCJ1U1FL_E1OFhTBrMiBalmZBNkOeiF4NTGTopChpAbBEhLlpMY
Message-ID: <CAFR3w34SPd_5WSsO7vVS2DkP59ckWF9H1aJCDCyYMR_LNaxanw@mail.gmail.com>
Subject: Re: [PATCH 1/5] lib: sbi: Fix typos related to hart protection
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfXxZYtAkzLDB5K
 OoXfqbC5ueEBMAKdGHTX2xzBlEz/e6Gp5OEuVZ/CyuftnoroPYXENjsSCdCzYsxY3pPRDwM74aR
 u4IknjuhbBo4PhpaT3Ky5b6mxZ6pkbY=
X-Proofpoint-ORIG-GUID: rvWkgzWjME4lCKJhvTCLtZwKbt_bzHRW
X-Proofpoint-GUID: rvWkgzWjME4lCKJhvTCLtZwKbt_bzHRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX2M7stNDEhO+7
 MqkeXWnUzeqoHQzq9Ne1KrN7K2VmWCiv5t7btG2RTzfgof5Rwy0IkknAjFqdXOw83HLoJAjB2dq
 I4+31fdQwcRSAedbjIfXTnvF8HKmH+8aYdecPRwJIL70jFEOO6JiUwtOfRepVQOnhQlAceENP3s
 F+RDws6+yXGgd095mov77r90edvkZW5mqYC+siCq3ZAZhfwWKf8yVAIP/F2qJBgSx8HvoIFOIq3
 DqIpfLKF18wGOW/EUJK8aVAALE4GvIFJ5glZIPpfZhGyvCTBuRnioPwyD9oW9BbwSkCJP4nk9ig
 7kpTbsffBqQnau2Cz9QDwDhhjV/racphqAtva4GdJkQNrh5apYlZ49/qKapjJTgOR2QsU27XkI5
 IeCbfB4bva02NwpJIkSbe9xukxEd9V7oLy/V4NEjJ3RWmq3Q1zTtIeCZFcfCE3sZpsk87lFtmTP
 ZytWfrp28EJYqGWyecg==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60a1ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=V3X-1qeyUSCzaMBknogA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_035645_373455_F881A5A7 
X-CRM114-Status: GOOD (  17.88  )
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

T24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgMToxNeKAr1BNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGUgaGFydCBwcm90ZWN0aW9uIGlzIGluY29y
cmVjdGx5IG1lbnRpb25lZCBhcyBoYXJ0IGlzb2xhdGlvbgo+IGF0IGZldyBwbGFjZXMgaW4gc2Jp
X2luaXQuYyBoZW5jZSBmaXggdGhlc2UgdHlwb3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGxpYi9zYmkvc2JpX2lu
aXQuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaW5pdC5jIGIvbGliL3NiaS9z
YmlfaW5pdC5jCj4gaW5kZXggNjU4ZmUzN2YuLjQyMDhkYjBiIDEwMDY0NAo+IC0tLSBhL2xpYi9z
Ymkvc2JpX2luaXQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2luaXQuYwo+IEBAIC00MjgsMTIgKzQy
OCwxMiBAQCBzdGF0aWMgdm9pZCBfX25vcmV0dXJuIGluaXRfY29sZGJvb3Qoc3RydWN0IHNiaV9z
Y3JhdGNoICpzY3JhdGNoLCB1MzIgaGFydGlkKQo+ICAgICAgICAgfQo+Cj4gICAgICAgICAvKgo+
IC0gICAgICAgICogQ29uZmlndXJlIGhhcnQgaXNvbGF0aW9uIGF0IGxhc3QgYmVjYXVzZSBpZiBT
TUVQTVAgaXMsCj4gKyAgICAgICAgKiBDb25maWd1cmUgaGFydCBwcm90ZWN0aW9uIGF0IGxhc3Qg
YmVjYXVzZSBpZiBTTUVQTVAgaXMsCnN0cmF5IGNvbW1hIGFmdGVyICJTTUVQTVAgaXMiCgo+ICAg
ICAgICAgICogZGV0ZWN0ZWQsIE0tbW9kZSBhY2Nlc3MgdG8gdGhlIFMvVSBzcGFjZSB3aWxsIGJl
IHJlc2NpbmRlZC4KPiAgICAgICAgICAqLwo+ICAgICAgICAgcmMgPSBzYmlfaGFydF9wcm90ZWN0
aW9uX2NvbmZpZ3VyZShzY3JhdGNoKTsKPiAgICAgICAgIGlmIChyYykgewo+IC0gICAgICAgICAg
ICAgICBzYmlfcHJpbnRmKCIlczogaGFydCBpc29sYXRpb24gY29uZmlndXJlIGZhaWxlZCAoZXJy
b3IgJWQpXG4iLAo+ICsgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCIlczogaGFydCBwcm90ZWN0
aW9uIGNvbmZpZ3VyZSBmYWlsZWQgKGVycm9yICVkKVxuIiwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBfX2Z1bmNfXywgcmMpOwo+ICAgICAgICAgICAgICAgICBzYmlfaGFydF9oYW5nKCk7
Cj4gICAgICAgICB9Cj4gQEAgLTUwNyw3ICs1MDcsNyBAQCBzdGF0aWMgdm9pZCBfX25vcmV0dXJu
IGluaXRfd2FybV9zdGFydHVwKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiAgICAgICAg
ICAgICAgICAgc2JpX2hhcnRfaGFuZygpOwo+Cj4gICAgICAgICAvKgo+IC0gICAgICAgICogQ29u
ZmlndXJlIGhhcnQgaXNvbGF0aW9uIGF0IGxhc3QgYmVjYXVzZSBpZiBTTUVQTVAgaXMsCj4gKyAg
ICAgICAgKiBDb25maWd1cmUgaGFydCBwcm90ZWN0aW9uIGF0IGxhc3QgYmVjYXVzZSBpZiBTTUVQ
TVAgaXMsCnN0cmF5IGNvbW1hIGFmdGVyICJTTUVQTVAgaXMiCgo+ICAgICAgICAgICogZGV0ZWN0
ZWQsIE0tbW9kZSBhY2Nlc3MgdG8gdGhlIFMvVSBzcGFjZSB3aWxsIGJlIHJlc2NpbmRlZC4KPiAg
ICAgICAgICAqLwo+ICAgICAgICAgcmMgPSBzYmlfaGFydF9wcm90ZWN0aW9uX2NvbmZpZ3VyZShz
Y3JhdGNoKTsKPiAtLQo+IDIuNDMuMAo+CgpPbmx5IG5pdHMsIG90aGVyd2lzZSBsb29rcyBnb29k
CgpSZXZpZXdlZC1ieTogUmFodWwgUGF0aGFrIDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxjb21tLmNv
bT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
