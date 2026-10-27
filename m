Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A520E606A321
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 18:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qx2H/gzR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DRw0ivO1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDCEZgSi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i1nJXpQpwwk6G9E3xa8cvXf/kpQJKmlA7HkiUfpCweo=; b=Qx2H/gzRHx2QlaObE8JHi7+sSM
	NfHJze+6xQOf0CEFmtva+WCi64fLq8a7UTjcToQHXmBEg4+CcMhBGteyKmLczJRUDdot5TlNWyPUy
	piTBOW7qYGQ14ipuEfLjynw70PiMu2jyKtRujn6fSW56MDfYuuT1L3V/dwB70zHrVbFAuht2fXckD
	xScYYKCM7lpEB+4dp8/d3yh5trPx0HwikvhwgE59VIJUN67YPNJMs1xmktLwWu/aLD2y81pEDyGef
	jJNp09w/Rvm6m1IT62YK6Hk9n+zfmTea6+W7UieIgpdmVqbN/XLJ2OCluFKMRa9h+o/BVJ2AW5hk0
	kADkI5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlqS-00000005YNt-21aV;
	Tue, 27 Oct 2026 18:24:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLlqQ-00000005YND-3TIY
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 18:24:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHPnc2638997
	for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 18:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJAESNd9zMseGxYwCoIogJ8+w/2SXUTkM9BfC6kKs2M=; b=DRw0ivO1WDCv0c8u
	68Jzpb77h9I84zOjnBWjd2SyBzLjrsluDANuYZTbdcnnRUfh4Hmt6tk9oxeLZuzA
	bJVAyu0kR3GiHLhxA0q+6Slb9Qlp1+8K3PqeNU5NMD4QwIDKTvdXE/Yo4PAlvd3t
	Pm4dzDTBQNipZsPKERbs97OdBUNsmoBx9kUiZPk4RGqAab5ujZBjzZavsvRyBcAL
	Zig9kFTNmmRNiqacwcIv2gB3cUGpomkZBmncd3gQSqw2Tb/F5EmcFr3hLg5+QnFV
	tXbQY7MxDVhP0ICS6kMuaiBnYRXty2u5HJQeiHF7VVcXDsnN0fKs6gXtBa2vzaWP
	SuU6MQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5tsv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 18:24:21 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46f178d813bso236848fac.3
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 11:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793125461; cv=none;
        d=google.com; s=arc-20260327;
        b=jj8k241rieIJzlkYHa8IUTJ/3BLsvNi4bWQPIFVAw1+wAjGim9/kd6Vr8Wy/asawue
         ErThScuIKmvkLSd7VPNepJi3bgQvMf0jzJlww7YO9H94spuZ5/WmuytnUylK5CwnFzWO
         2QULkcUtbJgeSBpdJL7uKa3P+GkP/M3Sqm6aUyz+5acUevnDSiJp5tCAhAUAB55b58PE
         VZNhG9knL5yewSsIoOeEKBDCu8VgySdAa+kfmWDHlCqEjq4KtoI1YP+2mnFFlJSdbIX2
         W5wlIH0llbzNf6Tiht6I/GiBUd1xZAYAwYnYRkfoB5mtxLIo9AVeGLwnFSIUuJPiIXwG
         KlSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SJAESNd9zMseGxYwCoIogJ8+w/2SXUTkM9BfC6kKs2M=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=lYNeHFT1cMZM9X7jYTZTHVghT890wBuc906OLKQ2qMASoX+55qq0KGrN3Zj5Gm/ooE
         9A3voS49eZ+l/nX2jC4IhuhFRdzB4kSAON9l3KOmSD5fEG6bW2euTZHEgxxgaWqBohcg
         aKp8QeRwgd3/tg0iFBJF9ADJjHr0Px9u8RNr4OiHoQfVfZgeBKD3qMiv66gtHrhJKXXp
         uHJ6bRL6+WRJbBVQuryG0RF/aH62fStXWIrH8bxQYXL4njv0GGMxNNsycCF5S/TVHaQy
         SawioVI0eqJsj7NDDlRjtzX3w4m0ZDLWHS6kCp6pZw1IP4WeAjLTr1b2BKo+wkeW2Fwb
         tpMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125461; x=1793730261; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SJAESNd9zMseGxYwCoIogJ8+w/2SXUTkM9BfC6kKs2M=;
        b=dDCEZgSiQU4pSK/J3VJb5x5YLFrS0oVBKIpP6FgVi/uWcWxEZwLYfis/R6qxIoNcp2
         U1R3gszRY20zU+8dKhSAcH7Fz1o5NoHbCFzycIxga0OeETHvZvqJKBsAmTwvtcffFTez
         3ouUF3m+D10ZOS9PbUH4nMnrqDjcY2ct2mWB/lfjGBg4N7BrTXEdOCjIarSS0+ACQQXj
         wrF8Ki8R4gzd87j9EtsuU5BN72tRYT27dsxNPDbTRT23Wz+8yp9qmPMbhedxzM1lCJxg
         p5SANIJ/i212QSmwe8Buh7Ye+PHaiiZ0n/xuOvchNbP96xr0na+8pR0TIyDQECYREnkR
         URbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125461; x=1793730261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJAESNd9zMseGxYwCoIogJ8+w/2SXUTkM9BfC6kKs2M=;
        b=DJfo3D2xMWXbxG53as0HwqVbxEPgbtETdlYusc2Gk3PM1HIK/sWq8yrRArVsM4gwi0
         LchKLZmS8BfAYl7GcNhnwExQiNMrWrPx5fHn0/dmBgIa7kk2cDG/ghrnqWcP+lBESBqj
         1xRenA0woaCPPsp+05CSP8Y3sca6SVqN3CUwhyYoEPCf52B5SnA+b0Uu7B6zUm6kedmG
         iqwpbQH4Tn4vq58VCZHp3TJqg7DVw5EmC8tI+64auBE0oBFYtl/gGunR4cEvmKkV/usa
         2WKvBlLZOcYwMy3KPgOIbsQm3W8qbe+R3yksYljWIXD8QnOon+OJyj6LRPGow2Nia6yn
         Hq/g==
X-Gm-Message-State: AFq9FYIPMOPoiZH3E6c6Aawz718em2uJRc/+3BZIatysdLHdq37TCyIZ
	FHoXY2sysOYOHxuOlAqilinRBuW17ENnFVyo4JDHwXMUY9kFu6naU6YX8u+wW+A7DqiZKUgkFyi
	zrxvo6xmYJzB7KUlFgZJbfUbWCviZiNFB3+UAy2N7h7t5l3IqWx95AteteqKJxcmD4iGwmp7vZC
	n7HYk2ZqT/YcHhAGkv9VmiBGZdRgaw9Yg1wsz94Ix+r4fPY02X1qU=
X-Gm-Gg: AYBFou1dNuk53N3JwyVOEnZ96a6px2mOVfplBpTxQCKhpfxM7UNsBoWlBoHxLzgmiKe
	it8Za2ROZOAqw8U3kNqpZAu4+1FRq6JzHCnBXoiE3GOnvqJvTAt97C4dPCscZiWA7HRnjWH21Ao
	+Vqyz7JYwNB+jm7FsvwVAiGQC/BGi/a9W1sKkNWjTOhdxKr4TrP1U4IXB81A==
X-Received: by 2002:a05:6870:6b0f:b0:4a7:4c93:75a8 with SMTP id 586e51a60fabf-4a8bb623849mr332579fac.33.1793125461006;
        Tue, 27 Oct 2026 11:24:21 -0700 (PDT)
X-Received: by 2002:a05:6870:6b0f:b0:4a7:4c93:75a8 with SMTP id
 586e51a60fabf-4a8bb623849mr332567fac.33.1793125460602; Tue, 27 Oct 2026
 11:24:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-9-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-9-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:24:09 -0700
X-Gm-Features: AclHuK-8hnrCG0w9jUWapeYtEPbYIeDX9dPOgdPl1iqhmQ96y4fgr6uBqzAx5dE
Message-ID: <CAAVgOkKzcWat-nv18D9bnLDppmTUK4ttesqdOSmfK_LMQU1Dzw@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] lib: sbi: display World ID configuration at boot
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX4WKuXgsg7Ugh
 Ea4FHN07V4kUIESjlJoOfmNAYP/KNzFxFs1IrsptAiXy8lwlQlToU//ans2oi/jqYrRrUaTCzSP
 mPRjJVZx1xjOvVKtl+9LL0ae8G+WhCc=
X-Proofpoint-ORIG-GUID: iHJVORvPWkCjemBFn6_xbTaOpaHncz-Q
X-Proofpoint-GUID: iHJVORvPWkCjemBFn6_xbTaOpaHncz-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX0c1zb3xikLkg
 mYZSTMluRD2DSaLWdNJ25hdmhfYoT9pKoZPKAEXMah5xjbjWVFtVqowChDGIKCtHUiDEQDujKgK
 ff2/hCsjO12hKWhZgyEbOuHWZb+1vPOtitNiRblGD28A0v/KKzVLpz0GRbtQIk/gOEGCmlr+rVC
 yMZAvHC5UzND0OpvptW/S8iT5yKYFr2zXcXTcOGXiqMrz116j0nSUaVVPVvdvHE78PP5LcRX9ZU
 9zxV4OSBjMbW6Udabq2bezzY2tA7vwfubHSWnL5Rfc7HLC5oDu9aUcGnrrlj8ig9hh2lbO0H9nT
 EJtwABlokh2shzgMQ12IlLxGdwXF4qRm94gWNOXZCfuvG0JTfugIgxsKCWHlvfKi/qegBUSa2zb
 RV2lnGC9JYrYe/TXp6t893XJumHdH8JJewYpiMWu5bNkx9J/olMBjajT8fNRF6wnCAJ2WNXjPEV
 UQQOhgBKT7C9X/tx64Q==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0ec55 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=yMb-rxtsGZh9EWPcxQIA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_112422_982326_FD5E6250 
X-CRM114-Status: GOOD (  17.83  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMTozNuKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gUHJpbnQgcGVyLWRvbWFpbiBXaWQvV2lkZGVs
ZWcgYW5kIGJvb3QgSEFSVCdzIE0tbW9kZQo+IFdvcmxkIElEIChtd2lkL3Btd2lkIGZhbGxiYWNr
KS4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2
ZS5jb20+Cj4gLS0tCj4gQ2hhbmdlIHYyLT52MzoKPiAtIERpc3BsYXkgZG9tLT53aWQgZGlyZWN0
bHkgd2hlbiBTbWx3aWQgaXMgcHJlc2VudC4KPiAtLS0KPiAgbGliL3NiaS9zYmlfZG9tYWluLmMg
fCAxOCArKysrKysrKysrKysrKysrKysKPiAgbGliL3NiaS9zYmlfaW5pdC5jICAgfCAxMyArKysr
KysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2xpYi9zYmkvc2JpX2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBpbmRl
eCBiZTkwMjBkMC4uZjkyZWJjMmYgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWluLmMK
PiArKysgYi9saWIvc2JpL3NiaV9kb21haW4uYwo+IEBAIC0xMCw2ICsxMCw3IEBACj4gICNpbmNs
dWRlIDxzYmkvcmlzY3ZfYXNtLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2NvbnNvbGUuaD4KPiAg
I2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2hhcnQuaD4K
PiAgI2luY2x1ZGUgPHNiaS9zYmlfaGFydG1hc2suaD4KPiAgI2luY2x1ZGUgPHNiaS9zYmlfaGVh
cC5oPgo+ICAjaW5jbHVkZSA8c2JpL3NiaV9oc20uaD4KPiBAQCAtNjEzLDYgKzYxNCw3IEBAIHZv
aWQgc2JpX2RvbWFpbl9kdW1wKGNvbnN0IHN0cnVjdCBzYmlfZG9tYWluICpkb20sIGNvbnN0IGNo
YXIgKnN1ZmZpeCkKPiAgICAgICAgIHUzMiBpLCBqLCBrOwo+ICAgICAgICAgdW5zaWduZWQgbG9u
ZyByc3RhcnQsIHJlbmQ7Cj4gICAgICAgICBjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdp
b24gKnJlZzsKPiArICAgICAgIHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCA9IHNiaV9zY3Jh
dGNoX3RoaXNoYXJ0X3B0cigpOwo+Cj4gICAgICAgICBzYmlfcHJpbnRmKCJEb21haW4lZCBOYW1l
ICAgICAgICAlczogJXNcbiIsCj4gICAgICAgICAgICAgICAgICAgIGRvbS0+aW5kZXgsIHN1ZmZp
eCwgZG9tLT5uYW1lKTsKPiBAQCAtNjkxLDYgKzY5MywyMiBAQCB2b2lkIHNiaV9kb21haW5fZHVt
cChjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLCBjb25zdCBjaGFyICpzdWZmaXgpCj4gICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBpZiAoc2JpX2hhcnRf
aGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01MV0lEKSkgewo+ICsgICAgICAg
ICAgICAgICBzYmlfcHJpbnRmKCJEb21haW4lZCBXaWQgICAgICAgICAlczogJXVcbiIsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4LCBkb20tPndpZCk7Cj4g
KyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBzYmlfcHJpbnRmKCJEb21haW4lZCBX
aWQgICAgICAgICAlczogdW5zdXBwb3J0ZWRcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgZG9tLT5pbmRleCwgc3VmZml4KTsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAoc2Jp
X2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01XSURERUxFRykpIHsK
PiArICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiRG9tYWluJWQgV2lkZGVsZWcgICAgJXM6IDB4
JSIgUFJJeDY0ICJcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgZG9tLT5pbmRleCwg
c3VmZml4LCBkb20tPndpZGRlbGVnKTsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAg
ICAgIHNiaV9wcmludGYoIkRvbWFpbiVkIFdpZGRlbGVnICAgICVzOiB1bnN1cHBvcnRlZFxuIiwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICBkb20tPmluZGV4LCBzdWZmaXgpOwo+ICsgICAg
ICAgfQo+ICsKPiAgICAgICAgIHNiaV9wcmludGYoIkRvbWFpbiVkIFN5c1Jlc2V0ICAgICVzOiAl
c1xuIiwKPiAgICAgICAgICAgICAgICAgICAgZG9tLT5pbmRleCwgc3VmZml4LCAoZG9tLT5zeXN0
ZW1fcmVzZXRfYWxsb3dlZCkgPyAieWVzIiA6ICJubyIpOwo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9z
Ymkvc2JpX2luaXQuYyBiL2xpYi9zYmkvc2JpX2luaXQuYwo+IGluZGV4IGFjZDJmOGI2Li5mNzcx
ZjU0OCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9pbml0LmMKPiArKysgYi9saWIvc2JpL3Ni
aV9pbml0LmMKPiBAQCAtMTY3LDYgKzE2Nyw3IEBAIHN0YXRpYyB2b2lkIHNiaV9ib290X3ByaW50
X2hhcnQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLCB1MzIgaGFydGlkKQo+ICAgICAgICAg
aW50IHhsZW47Cj4gICAgICAgICBjaGFyIHN0clsyNTZdOwo+ICAgICAgICAgY29uc3Qgc3RydWN0
IHNiaV9kb21haW4gKmRvbSA9IHNiaV9kb21haW5fdGhpc2hhcnRfcHRyKCk7Cj4gKyAgICAgICBz
dHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgKmhmID0gc2JpX2hhcnRfZmVhdHVyZXNfcHRyKHNjcmF0
Y2gpOwo+Cj4gICAgICAgICBpZiAoc2NyYXRjaC0+b3B0aW9ucyAmIFNCSV9TQ1JBVENIX05PX0JP
T1RfUFJJTlRTKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gQEAgLTE5OSw2ICsyMDAsMTgg
QEAgc3RhdGljIHZvaWQgc2JpX2Jvb3RfcHJpbnRfaGFydChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNj
cmF0Y2gsIHUzMiBoYXJ0aWQpCj4gICAgICAgICBzYmlfcHJpbnRmKCJCb290IEhBUlQgRGVidWcg
VHJpZ2dlcnMgICAgOiAlZCB0cmlnZ2Vyc1xuIiwKPiAgICAgICAgICAgICAgICAgICAgc2JpX2Ri
dHJfZ2V0X3RvdGFsX3RyaWdnZXJzKCkpOwo+ICAgICAgICAgc2JpX2hhcnRfZGVsZWdhdGlvbl9k
dW1wKHNjcmF0Y2gsICJCb290IEhBUlQgIiwgIiAgICAgICAgICAgIik7Cj4gKyAgICAgICBpZiAo
c2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU01XSUQpKSB7Cj4g
KyAgICAgICAgICAgICAgIHVsb25nIG13aWQgPSBjc3JfcmVhZChDU1JfTVdJRCk7Cj4gKwo+ICsg
ICAgICAgICAgICAgICBzYmlfcHJpbnRmKCJCb290IEhBUlQgTS1tb2RlIFdvcmxkIElEICAgOiAl
bHUgKCVzKVxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICBtd2lkICYgfk1XSURfTE9D
SywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAobXdpZCAmIE1XSURfTE9DSykgPyAibG9j
a2VkIiA6ICJ1bmxvY2tlZCIpOwo+ICsgICAgICAgfSBlbHNlIGlmIChoZi0+aGFzX3Btd2lkKSB7
Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIkJvb3QgSEFSVCBNLW1vZGUgV29ybGQgSUQg
ICA6ICV1IChwbXdpZClcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgaGYtPnBtd2lk
KTsKPiArICAgICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgIHNiaV9wcmludGYoIkJvb3Qg
SEFSVCBNLW1vZGUgV29ybGQgSUQgICA6IHVuc3VwcG9ydGVkXG4iKTsKPiArICAgICAgIH0KPiAg
fQo+Cj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNvbGRib290X2RvbmU7Cj4gLS0KPiAyLjQzLjcK
PgoKUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVlcC5vemFAb3NzLnF1YWxjb21t
LmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
