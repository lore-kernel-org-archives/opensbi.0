Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDC9606A325
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 18:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u8xE9u+m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=az/jkm9b;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Funcw/Yw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HFwKhwJqnfGVxIFezrjWS2RbXXp01fChzlh67B4VMwg=; b=u8xE9u+mD7/nktR4FOc1ozECM0
	dw/j55CniRlO14bICWDL9JDQDs0CfFllM4TXiZPb0zyXDHudH2pC+kgYX5GpuTPhlB4oZvpwU+FwY
	qjX0A/JVXQ0LT6olM4sH3wEEtC7z5Cyh3qKquKsWbWKz3BPB0kZucig3SKtrotnNL0E2HL+EpHsnb
	wZrFXQCV/FMpF1OTgCXwbUdBz8yfbfshpE9Qkn1zUlbNBjDZiUvj9ziVGjl0bYj1LfcIg5+1RF6U7
	pPm3ktcPUlbPf7h2p0HiDFDVgXVzJ+2LzJC9HhQTKqgT4lUsUQiI4Rp6YX9+aDuSIrjxdYh3VwpvQ
	6Yeac0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQquK-00000004pva-2cpH;
	Tue, 10 Nov 2026 18:49:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQquI-00000004pua-0Ceu
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 18:49:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIbZZQ3105385
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6OIPCkWQFDOTWby+Tb3HmeZYnLng6QHTjS8L9XFIgE=; b=az/jkm9bc5Ly3/E+
	VALkS528hpjcHeYMfpL+K3k2B2nGrPxuT9nZ5skRAQacvZMw69+AMwXvGzt7+dcs
	bNB7+k52i1iMGr6DELWv9sW4aGy6fh5h91zcKKzhUMz0Y1MJT+23mzGMLDCb3fvi
	o1UbjJocfzRJouBEpH6gH8E9bN2jnrkzuSbhj+Mm23RWfaQKLNFWb3FxOeApxWqE
	puXDrWimGmVtRo0ipeN4keUMMj0JhlgI53XE4NnVOntJxGB6HKmHe8T3XRAJx/Es
	Z3ojUydrQJq/gP+kcJI33cLbxbnoKSJ28E89AwaNeTFOTCbS0Sh7+qWGpRPNvsoo
	h2ZM3g==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5gfjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 18:49:20 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-469debb526fso2212977fac.0
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 10:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336560; cv=none;
        d=google.com; s=arc-20260327;
        b=Vd+U+DN3zF2cu3FdHiFb4BvoYXJiPvCfcbeUDyU8JziaQrFcNA4zPpXwnYhVhVn4cr
         reuFGp2L/cM6rKVDNubbnJIWi42voNPk90baylsHP9E9Ktcus22dSvedOb4dfqAzoLHM
         FhdkDt/vq46EmTzU1gzyjqs6V7fwT+qkHZfoyscw4rZwFzHboBMc6IYM2MEj2PFhaykD
         wTnRE8FNHCJcmz2FZvNS0EAbVYNyGQU8VkNlHjLVDTp/pUWd/JEsdCIJwpxxeW1o4E41
         vHPF1U3/sZrhQHkY8uWJNdrxQvU77+7Spz2X3oqMoRNbghT3VTTCxdSfyPlulkeBVz70
         rQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h6OIPCkWQFDOTWby+Tb3HmeZYnLng6QHTjS8L9XFIgE=;
        fh=+zGs/ebFB60H0rjLL254MDu2t1fnhgGia0HfFGD5uUo=;
        b=ACn5STr5CR8PwvIiAH03EFK0xtgG6vYGKIF/C12Vh85ghH039cy4frwPTLGCPsakJ+
         zyojYybWivaVjaNwM8erS/EMNcVR5abyw4DtBZJpbwBPCcnnH8xyV3v/u7Z0D6Q+htb+
         wUivAh5QQ2oE+65xQWf8k07twUDnt4676VsH3QOFANRKxb6Y9bDeWE+Gi+bL0qVxre2h
         ZizMZ7F4h8YmGuCq3wk93gw8zl+r7ZHtnthfjKGZ1R5yvZWbjM9wUYiW4QU64DysIRwj
         WCCSWcW2pmClJJwhenJJ6ITl8xPAHETLnNEkphacHG9t2piIAnjOA+Vt/0HPGnz60YGl
         zkDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794336560; x=1794941360; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h6OIPCkWQFDOTWby+Tb3HmeZYnLng6QHTjS8L9XFIgE=;
        b=Funcw/Yw3EjYX3Ge5uodsVgKaqjVBAnGX0BJ8zX986vNt2pkeojGxZW3qa3p36DUNx
         EfD0EhgGFysTwOprjjbMnBSW8HOOV+2zK53MOrDgIVtfJH+v/3/4ZNwtwtbpZ80laAYR
         sLwFM4QIU7gchmYxfWK0l3yfWbER/81c1mzFJXHONWVY0DN5RGcoog7fmxyi3mdTZFDN
         rX2G5nDq5roN7uU6Mju8EtYJnfwWL/ATcsWOOW2uhh+3QKAbob+RAGgXtUAf/p4j7Y/b
         i53NHMww0dW7oqaAITZykxVgWKim53Fy0D64gV4gGzCzLh36U1/0WeIgkQQFwgAQTC5a
         xLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336560; x=1794941360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6OIPCkWQFDOTWby+Tb3HmeZYnLng6QHTjS8L9XFIgE=;
        b=Gw5dmFXl9XX23FhMnCV91amMDtZlLPTjJF6xvUeYGpeZQaC5ptnFKwN97tO8mK187n
         VT5zzXTnBvmECX0Uv44lBa2PxzIv4sW3U9fVIzd2BzH0cbg+Za+CjsSIicLY+ynrCoJl
         pZTE97REG7byCd9xs+KlmdcnglGmPC2OrjF2rObBOEcvcwTQBRP/sCIFAahFjYpfLRdj
         AuVmUPfXIV487yvRplu4UEpmvtuw0L8ibiT/uIDeW27b+ArWNi59Znl5IBJtmB4p5oLI
         nctPYd2/Wm3hqeWTgSVONTGw1QthtfpBp0fwRwPLS15kIrVlM2ax8DyewUf13m0gmVdT
         qTQg==
X-Gm-Message-State: APuU4Z/2PXWVSFvfidGlLQWeO990sGiOfpzA7gqea6tf5tiEqA7wROWI
	lsRD8VzCp07MmlmXbdodTbrt2+Wt3YKLeYR8f7j4c07TKVV7jg/mSwnMxEM7MYRyCJi//qF9aaJ
	oM/31da3sG3bmW9iKNmMnZyHC2jxvnkywvrx2JpEIYm/FAJyxY+c6spp9LYu4P3f6GwTQHhDtIU
	USu3CwbOOWnR/7g4kE2S3jC6eWxrv2cmXn9OjjgXit
X-Gm-Gg: AYBFou1JZwr2uPaPu8LRrjKaMhr889hn8R/q7shvM789Aic2rfQV8LKLj1LWGSc5eb5
	EkLKwN305w3VaSlG/5/qqODB4YrNRaPbCZMfyndSF5SEudBIOB/yVdxw05QeiTLZYjsmRA89yGH
	v8Baap0sFLGRerZn4q5xwIcxZ9Escy6YmejsnR2tDlKkZyaFrPtsraRpQrFQ==
X-Received: by 2002:a05:6870:ab8f:b0:494:7af4:954a with SMTP id 586e51a60fabf-4ae46848ac6mr200696fac.8.1794336560270;
        Tue, 10 Nov 2026 10:49:20 -0800 (PST)
X-Received: by 2002:a05:6870:ab8f:b0:494:7af4:954a with SMTP id
 586e51a60fabf-4ae46848ac6mr200676fac.8.1794336559827; Tue, 10 Nov 2026
 10:49:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110095029.117504-1-peter.lin@sifive.com> <20261110095029.117504-5-peter.lin@sifive.com>
In-Reply-To: <20261110095029.117504-5-peter.lin@sifive.com>
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 10:49:08 -0800
X-Gm-Features: AclHuK-tCTOnH5ohauylLPwPNgIRUrQTW1T88dl9aJjSiJOvot747iqst8bWPX0
Message-ID: <CAAVgOk+rNwG67HmcGBK_c_ec_P_Dep5nepBMLi5gVWPa3qrwaA@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, anup@brainfault.org, rkrcmar@qti.qualcomm.com,
        raymond.mao@riscstar.com, robin.randhawa@sifive.com,
        samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX97DsElTB1nmm
 +GGIfF7yOrrCDb4H7pv4lhWp/tHh1hYy7Jx5ohN7wz5Qka6PGcE8Jlz9RFA1GSWsgolp31nDw0H
 a4KQrSsO7DBW2UHI0sJBtvHfNVm5UV+6WU0jF56ZrITy7LKx2ShiXPvRoAaTP5tE6LsCM8csxAW
 jgnvfeljLat6bjWVFXraIzk8SbhDfKdBIVc1qCcdY46CtarxhIjRXoMdCOIbygGGQriFuiFSjUk
 yc3Lrxha9yUH4xa9HOKb9xAl/IHFg4gk5wtpzsyO5uR28Qp2nA7QJchtKt8Jh869ILibQU3jp/4
 uXjXHUuC+HLLeZM3auIXWQNn+phHhxgo5YMWgcA92LJYvKARr1bUr3iQfOH9zf1XAwddcYA74ny
 guuuiuuWIJ8e6N55KThnyXOqC687l5clVNX/DDinlD8UucOLZGsY6f2tn/ABlb6U1ijaaN2qM42
 ufC9ecuBrCsDe2F/yEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX3aJshhF7OPAD
 70dDKnW4KK46PIY7yYFqhVezntlRgHOA82V4HMGLJ853Y9ftZqjlrigZKV6xt6hQCYt1Ey+NhE7
 /dE8IoEh2Hp5jKGW2Wbxuhumgng6Qhc=
X-Proofpoint-ORIG-GUID: Q6mQgia62XwXNH8-2mu7dbJ9524QzV6Y
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af36731 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=kTWgFCprDU0aDVmF6LgA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: Q6mQgia62XwXNH8-2mu7dbJ9524QzV6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_104922_488493_7F23E6A6 
X-CRM114-Status: GOOD (  20.48  )
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
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gTG9jayB0aGUgTS1tb2RlIFdvcmxkIElEICht
d2lkKSBDU1IgZHVyaW5nIGhhcnQgcmUtaW5pdGlhbGl6YXRpb24KPiB0byBlbmZvcmNlIGltbXV0
YWJpbGl0eSBvZiB0aGUgV0lEIGVzdGFibGlzaGVkIGJ5IHRoZSByb290LW9mLXRydXN0Lgo+Cj4g
T3BlblNCSSBkb2VzIG5vdCBhc3NpZ24gdGhlIFdJRCB2YWx1ZSBpdHNlbGY7IGl0IG9ubHkgc2V0
cyBNV0lEX0xPQ0sKPiB0byBmcmVlemUgdGhlIHZhbHVlIGVzdGFibGlzaGVkIGJ5IHByaW9yIFJv
VCBzdGFnZS4gVGhlIE1XSURfTE9DSyBiaXQKPiBhdCBYTEVOLTEgaXMgc3RpY2t5IGFuZCBtYWtl
cyB0aGUgQ1NSIHJlYWQtb25seSB1bnRpbCByZXNldCwgZW5mb3JjaW5nCj4gYSB0ZW1wb3JhbCBz
ZWN1cml0eSBib3VuZGFyeSBwZXIgdGhlIFJJU0MtViBXb3JsZHMgc3BlY2lmaWNhdGlvbi4KPgo+
IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+
Cj4gLS0tCj4gQ2hhbmdlcyB2NC0+djU6Cj4gLSBNb3ZlIHRoZSBNV0lEIGxvY2sgb3V0IG9mIHNi
aV9oYXJ0X3JlaW5pdCgpIGludG8gc213aWRfaGFydF9pbml0KCkKPiAtIERyb3AgUkItdGFncyBm
cm9tIE96YSBhbmQgQW51cAo+IC0tLQo+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgfCAxMiArKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCBkODZhYmYw
Ny4uYTcyMWJlZjQgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGli
L3NiaS9zYmlfaGFydC5jCj4gQEAgLTQ2OSw2ICs0NjksMTYgQEAgc3RhdGljIGludCBoYXJ0X21o
cG1fZ2V0X2FsbG93ZWRfYml0cyh2b2lkKQo+ICAgICAgICAgcmV0dXJuIG51bV9iaXRzOwo+ICB9
Cj4KPiArc3RhdGljIHZvaWQgc213aWRfaGFydF9pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2Ny
YXRjaCkKPiArewo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEFzc3VtZSBNV0lEIGlzIHJlc3Rv
cmVkIGJ5IHJvb3Qtb2YtdHJ1c3QgTS1tb2RlIGluIHByZXZpb3VzCj4gKyAgICAgICAgKiBzdGFn
ZS4gTG9jayBtd2lkIHNvIFJvVC1kZWZpbmVkIFdJRCByZW1haW5zIGltbXV0YWJsZS4KPiArICAg
ICAgICAqLwo+ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJ
X0hBUlRfRVhUX1NNV0lEKSkKPiArICAgICAgICAgICAgICAgY3NyX3NldChDU1JfTVdJRCwgTVdJ
RF9MT0NLKTsKPiArfQo+ICsKPiAgc3RhdGljIGludCBzbXJubWlfaGFydF9pbml0KHN0cnVjdCBz
Ymlfc2NyYXRjaCAqc2NyYXRjaCkKPiAgewo+ICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9wbGF0
Zm9ybSAqcGxhdDsKPiBAQCAtNzIxLDYgKzczMSw4IEBAIGludCBzYmlfaGFydF9yZWluaXQoc3Ry
dWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICB7Cj4gICAgICAgICBpbnQgcmM7Cj4KPiArICAg
ICAgIHNtd2lkX2hhcnRfaW5pdChzY3JhdGNoKTsKPiArCj4gICAgICAgICByYyA9IHNtcm5taV9o
YXJ0X2luaXQoc2NyYXRjaCk7Cj4gICAgICAgICBpZiAocmMpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiByYzsKPiAtLQo+IDIuNDMuNwo+ClJldmlld2VkLWJ5OiBQYXdhbmRlZXAgT3phIDxwYXdh
bmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
