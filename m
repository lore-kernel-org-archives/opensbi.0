Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF5EC88E72
	for <opensbi@archiver.kernel.org>; Thu, 17 Sep 2026 15:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPhTlaUdxolObW1TH9F9wyKByJcp4TeExz2UEkgtiE4=; b=vj8Ms5JUoD4Jbg
	kPw0no1JH/wFr8zRhWqzyF3mNGh9QQGdyNoPaYMzEU97BvPcsApkXVx4ymnWxPv0BU9wifE6jbKCy
	uFcOUsmrmIH24hxaef2/wmEaArKgjO2+Sd6s8hpbIfiMrjLtKplKNQM6bdiLwSUVPF2nFZiBjVqjC
	yE5DFJdUyDq7nYorrciOcwzmOsp8CALcDWyOEjP3MuU62v/n6IgLvyRWcierFuMOYSxt6REpxzkRE
	D51IrnWhMctMB+VwGQdXiQiPslhiKwTUM9fnet6ZgcXsPKuWw5P/SyG8Xvb0rsE2gCNdQtelCcbrn
	JtBGhkWEZTkBb9TpnQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EBz-0000000Bhxc-1ieq;
	Thu, 17 Sep 2026 15:38:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EBw-0000000Bhwx-3cYj
	for opensbi@lists.infradead.org;
	Thu, 17 Sep 2026 15:38:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiVYC2974892
	for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 15:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1TSFocRXe/cqFWOCLlo5e6LcTKp+MmbCzsHCBJdhnAI=; b=d0Xi2VcVxsS5ejbn
	rICqo+iuwSg0ifFKEDV5S3WkUcIA2yW50onkGtNkzl3vQTsBU8oPu3LfZF8fN8b3
	pg7NiwaBWjlDn5pWy3VP0kQ5yUGmLpQD4/6KlhGaTSdy3FMAMJD1kpLqPxLSLC3s
	RUg5u281qE2gE1YDNu3fi8jSDgRWf1X5oyeRug+YhtPKaawPQgX57NXMGWpEBj1p
	R1b/3iBulCHOyQNhpzP3OxNi4n/0aD39PJwn7gV4AO9emH6mpudyroD9p6totpHQ
	UyROScAgruDUkMwwX5Z4tqxqgzEebo4sOF/Vug8KZBWQrASXw85hayPsm95AI2Fp
	5lKkTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6hr7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 15:38:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f248907fso102778885a.3
        for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 08:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789659507; cv=none;
        d=google.com; s=arc-20260327;
        b=YvbrUXHrZcQi0U8i3IWQQCuFZar3JGlQUZ0EJjgQagS6fSckgWNzlGt13CRXUMFB4k
         aVCaR+vME/rqBUkjtImBn6fLd/TDIYkiFR0B72UNS68CZzuXkuwpOVO16Ugf1hGeUm1y
         XnNi5kCSTxCi4VO9t4DzrbP+xKWGN7XY0Sjsnqd97jcuRj6wK6FWrouv4vlpVkcWN06E
         HYvfPEFszevpsG9Y0D/N3ojGFF3+rb3vIEDN0VxjU2wDgtE7z5ZCbbvtIVehi7+LORiO
         GExoChplK9rmP0DM+ehIDqHQwooR0OOtfwBrr/42VgibSkpibqnH8+Y9suI/hppS4wip
         Nn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1TSFocRXe/cqFWOCLlo5e6LcTKp+MmbCzsHCBJdhnAI=;
        fh=Ck9X1cQ6zEXteMjVk79ib6BKr+LbI80fo5ky5B2JXhI=;
        b=fFNeNP+diOuo6N62C3bgzGwM4jm8wJt6fcaX7MNU0dwYdgz0dNlHH6qtrywqBhgop7
         Itx5Qw4spAVoXkHnQcYqvGkT1aRoV4PsJbU0XhD2Lo+MKFlmrF85W6FB28bsPh2fpZ3v
         gSDGVk+J59MSYtIlr3VCxPO1ENcnSDHpU2GOJXBx4lcHar85wYu5x4pZLLgtS8hwR2xy
         WqobQBg1t/k5uGzXutDJ/7qGLcrAUocXybLhKn+ngL9bmkMXN1de9uOpFP4BkxP1OGrN
         PFMbWSE9i44YteGTXSS0D06XjOOHZshcXBA96325ECuaUBgTd1O7jxGb7uF3NLbb+nva
         eE0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659507; x=1790264307; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1TSFocRXe/cqFWOCLlo5e6LcTKp+MmbCzsHCBJdhnAI=;
        b=ZOvyENrIxdu1hLzRZPJrzzuQo8nUWvpapzTINHx7xmYi8dGzTYI+lmF1x/Pk5hRqot
         MYTM3oxyj/TtugjppAJoSRTeinawPsQMBHe3rpkDy0tk1zgUk9rFx5AccCBsdxPy0FOH
         mMBbdunfEZCyjykc8aEHfOyNkwLIcp6ktK+uFgUZxZxf22ZykYQYjMT2azxBj+KAIMRS
         wwMltdS1tCQf17FM2x9j/RLqBI0ijC+jV4qb5VZh/LpS9iNcXg8kqHd3ic+zUZAS2wLq
         /D4bWOFWbgs/bvHeTg9wBX3iFh6Ex43Jr2IHdzzfPQ4GmTM39bbAFGBaHjX0Pp2bogs2
         rKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659507; x=1790264307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1TSFocRXe/cqFWOCLlo5e6LcTKp+MmbCzsHCBJdhnAI=;
        b=RkkhcLOuzz/7AMMjBmsFXkOXAFo7DtFtZKlz/2lUXvDlLtbVugLRESguctwjHibTDp
         MH9TB+RWjTlAn9qPPOXgHWNXLT7W4I4SV/tFbRJ4IQqh3h5uc1vnlsTy/rC0mg+T4sPN
         pJAgxb5EL4jZRkOUndJAXz4IKY0gJjuj2D9R0RtumjmQlMgFWid3fjp6XPbN+vsppWUf
         VLQWtCM2OIiMW392WzdD1W6bMMgM0oHt4sfvCmYXDfRW21hoJFpA8bbxldj1Y65lpDQ1
         mkfbiBsZeO5hjuw9gl+GSyUO/Ui15YKkihWJf6pKAhfYaOrQWbDoQmkrIHIxytjE+y2a
         3a7A==
X-Gm-Message-State: AFuF++k68PpOtxY6o/QJr3Yml38Lwxkw+jGKFy4RRb3vwdyrf0Noc2T5
	rqrrWPxJldP4D/mUv9WvvRxt/jj87GIs7+FdcNPpb7HcEHCejXgI3YA9olnIAc2ev1ayhDe6iBD
	wLraD5fwYzM4Yn1aC2SB5cOSoRYttX+6fZ0XkHdDV2ZMkYZHh8tMeXTHWg8gVqH9d6c24vaa2Kw
	gGLFZRg1D2nMZoUmipFT0DrNXG2S81Zx1NsrGfZOZb
X-Gm-Gg: AYBFou34wTvUJxMKjpHtu0wujF5CBqq+SijUKLyqYugaW81i47ZVV5axtDSNVoM56rJ
	jcrLVSd8Uczy3VkxR9R6l8vgyEBQIVLktT8IInwXU9F0m4XOANLHTx8gWdH3zGCpZqfVOfM4b13
	/T0+FBIz4L8wNL1k1i2PV4Uoe5qc9hjvg586M0Q/zVWZjXlHeR1dvzIobv6Q==
X-Received: by 2002:a05:620a:44c6:b0:93b:d7a2:dd2f with SMTP id af79cd13be357-93bd7a2fa0amr146610685a.63.1789659507113;
        Thu, 17 Sep 2026 08:38:27 -0700 (PDT)
X-Received: by 2002:a05:620a:44c6:b0:93b:d7a2:dd2f with SMTP id
 af79cd13be357-93bd7a2fa0amr146603785a.63.1789659506466; Thu, 17 Sep 2026
 08:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260910210819.525538-1-pawandeep.oza@oss.qualcomm.com> <20260910210819.525538-2-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260910210819.525538-2-pawandeep.oza@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 21:08:14 +0530
X-Gm-Features: AcwNN1V_P1wa8WU7g22zCpuC0MZHEVy79H1P7gUqmsI4Mnq41OOIh9onmOXoILk
Message-ID: <CAFR3w34v76j=38awTiCbmRP5j3ZnRAsUUxyoNH-1Oj6=jOK3dw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib: sbi: domain: add domain registration notifier infrastructure
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
X-Proofpoint-GUID: r45t9tLJtbPMFNiQNN3-Qo3yhM7GNosA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMSBTYWx0ZWRfX/hVC0hoCW8to
 19P8YX7pSRtappmzMLuSYdDVpfBrammFKdFxjyZ3YHhO0nrdf6dQUKQcqijCZYTzyQ95oAUFnWV
 6xp5Zf/Pe6h4mlBJ4S2E47A7hqtkAbWp3cOzOX9aeBcmH2lKEohPmBHAjkkmI/UI4yr7tHU+Fqx
 gpaBoTFXmTcsNn2opA91R/X8qkbq9UX6LsvWcjauP26Wior0pxPvwH7jZGQvEer6un1KSlLs0PM
 uqsUUVNgQwW/H7N5qE3JE4xf7wGNQgEZeHkdYNO6LubWRg1dq8iiLMcadiRSNla/P8SL+cZCajp
 jrMNNgt7DDp+VAXFjKfANCj6w3BuxVW7MIxbWWJVoxSm081rSSHVk6zQLo842T9oruCpPw72Wfv
 byUIM87WE/BEIYd2cRuoGBcx/1yLGT9AYPBHPHy/D0d9wALz9vNBpUXV+sF3faAHsW2ud6VCuiI
 sjcMfxxEM5mHV3v0zEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMSBTYWx0ZWRfXyESr50CpNQnp
 a1NW654VR0WvAfX6ocOEMwuIRqBS4U4gOechqoWNXM4O4+Mi5i0tV0sC0hF3uXjJS4CipgY1+0D
 iMj8r4jfNCRljrTHPWBYZEStivDtaR4=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aac0974 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=TVfLQVwcTIx8TG0Ej_cA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: r45t9tLJtbPMFNiQNN3-Qo3yhM7GNosA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_083828_902267_506C2F19 
X-CRM114-Status: GOOD (  17.81  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMjozOeKAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBJbnRyb2R1Y2UgYSBub3RpZmllciBj
YWxsYmFjayBtZWNoYW5pc20gdGhhdCBhbGxvd3Mgc3Vic3lzdGVtcyB0bwo+IHJlZ2lzdGVyIGlu
dGVyZXN0IGluIGRvbWFpbiByZWdpc3RyYXRpb24gZXZlbnRzLiBXaGVuIGEgbmV3IGRvbWFpbgo+
IGlzIHJlZ2lzdGVyZWQgdmlhIHNiaV9kb21haW5fcmVnaXN0ZXIoKSwgYWxsIHJlZ2lzdGVyZWQg
bm90aWZpZXJzCj4gYXJlIGludm9rZWQgYmVmb3JlIGRvbWFpbiBzYW5pdGl6YXRpb24uCj4KPiBU
aGUgZm9sbG93aW5nIHB1YmxpYyBpbnRlcmZhY2VzIGFyZSBhZGRlZCB0byBzYmlfZG9tYWluLmg6
Cj4KPiAgIC0gc2JpX2RvbWFpbl9yZWdpc3Rlcl9ub3RpZmllcigpOiByZWdpc3RlcnMgYSBub3Rp
ZmllciBjYWxsYmFjay4KPiAgICAgRHVwbGljYXRlIChmbiwgcHJpdikgcGFpcnMgYXJlIHNpbGVu
dGx5IGlnbm9yZWQuCj4KPiAgIC0gc2JpX2RvbWFpbl91bnJlZ2lzdGVyX25vdGlmaWVyKCk6IHJl
bW92ZXMgYSBwcmV2aW91c2x5IHJlZ2lzdGVyZWQKPiAgICAgbm90aWZpZXIgY2FsbGJhY2suCj4K
PiBTaWduZWQtb2ZmLWJ5OiBPemEgUGF3YW5kZWVwIDxwYXdhbmRlZXAub3phQG9zcy5xdWFsY29t
bS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvc2JpL3NiaV9kb21haW4uaCB8IDEwICsrKysrKysKPiAg
bGliL3NiaS9zYmlfZG9tYWluLmMgICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggYi9pbmNsdWRlL3NiaS9zYmlfZG9t
YWluLmgKPiBpbmRleCBiMzVlYTk5Zi4uMjQ3MWRmNDggMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9z
Ymkvc2JpX2RvbWFpbi5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCj4gQEAgLTM1
OCw0ICszNTgsMTQgQEAgaW50IHNiaV9kb21haW5fZmluYWxpemUoc3RydWN0IHNiaV9zY3JhdGNo
ICpzY3JhdGNoKTsKPiAgLyoqIEluaXRpYWxpemUgZG9tYWlucyAqLwo+ICBpbnQgc2JpX2RvbWFp
bl9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwgdTMyIGNvbGRfaGFydGlkKTsKPgo+
ICsvKiogTm90aWZpZXIgY2FsbGJhY2sgKi8KPiArdHlwZWRlZiB2b2lkICgqc2JpX2RvbWFpbl9u
b3RpZmllcl9mbikoY29uc3Qgc3RydWN0IHNiaV9kb21haW4gKmRvbSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpwcml2KTsKPiArCj4gKy8qKiBSZWdpdHNl
ciBkb21haW4gbm90aWZpZXIgKi8KClR5cG8gIFJlZ2l0c2VyIC0+IFJlZ2lzdGVyCgo+ICtpbnQg
c2JpX2RvbWFpbl9yZWdpc3Rlcl9ub3RpZmllcihzYmlfZG9tYWluX25vdGlmaWVyX2ZuIG5vdGlm
aWVyLCB2b2lkICpwcml2KTsKPiArCj4gKy8qKiBVbnJlZ2l0c2VyIGRvbWFpbiBub3RpZmllciAq
LwoKVHlwbyBVbnJlZ2l0c2VyIC0+IFVucmVnaXN0ZXIKCj4gK2ludCBzYmlfZG9tYWluX3VucmVn
aXN0ZXJfbm90aWZpZXIoc2JpX2RvbWFpbl9ub3RpZmllcl9mbiBub3RpZmllciwgdm9pZCAqcHJp
dik7Cj4gKwo+ICAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMgYi9s
aWIvc2JpL3NiaV9kb21haW4uYwo+IGluZGV4IDc0N2MzNDZjLi45OWYyMDFjZiAxMDA2NDQKPiAt
LS0gYS9saWIvc2JpL3NiaV9kb21haW4uYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4g
QEAgLTM2LDcgKzM2LDY1IEBAIHN0cnVjdCBzYmlfZG9tYWluIHJvb3QgPSB7Cj4gICAgICAgICAu
ZndfcmVnaW9uX2luaXRlZCA9IGZhbHNlLAo+ICB9Owo+Cj4gK3N0cnVjdCBzYmlfZG9tYWluX25v
dGlmaWVyX2VudHJ5IHsKPiArICAgICAgIHN0cnVjdCBzYmlfZGxpc3QgICAgICAgIG5vZGU7Cj4g
KyAgICAgICBzYmlfZG9tYWluX25vdGlmaWVyX2ZuICBmbjsKPiArICAgICAgIHZvaWQgICAgICAg
ICAgICAgICAgICAgKnByaXY7Cj4gK307CgpJbiBteSBlZGl0b3IsIGl0IHNob3dzIHRoZSBhYm92
ZSBzdHJ1Y3R1cmUncyBmaWVsZHMgaW5kZW50YXRpb24gYXJlCnVzaW5nIHNwYWNlcy4KCj4gKwo+
ICsKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZG9tYWluX2hhcnRfcHRyX29mZnNldDsKPiArc3Rh
dGljIFNCSV9MSVNUX0hFQUQoZG9tYWluX25vdGlmaWVyX2xpc3QpOwo+ICsKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
