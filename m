Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DB6606A31A
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 10:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OqJQ4/dZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=YAl/6qYk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k1sUDPL/WLXRrt12XpV5FpBEIGiZpUlBvwpXV3RJO8U=; b=OqJQ4/dZn1xAeh1IQrt3/BUa/b
	otJvWrIN92BZ7mqOrDCPthigd6RGqNekrU1AhYXPUDYMI3M4jbb+AYO6dKakpPT5JAoUDDlqm4P29
	JIlocCLGc4qM0CzTtvFUUaaZEqF8mR3Vs6gpFYhronj60HU+HHYZZJLO0pJmP6q88jcpJIlmbRrqL
	Du2QqvMdYqQvYEMVVFFO4Iv0XYk+PhyVLEkot+ZMVHHPLQHr7GL0KvOr/iQzTSiG/NHRcpu10Yn25
	16ZgqDwHjIo/K5kXupAOIU4jhmFJxV7mgfZFFoMnJSWEzw07OKtL8unpyf51EIskiBz/NMGgsb82M
	o+g1N3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0yA-00000006lUv-2sAk;
	Wed, 28 Oct 2026 10:33:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0y7-00000006lUZ-3SXI
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 10:33:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48c4be28b82so690921f8f.2
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 03:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793183598; cv=none;
        d=google.com; s=arc-20260327;
        b=EtDNc4lq+FUb3JE2l4KgFGFhgI7buWI/N7NvFS8Rg9tBiTaUJ+ukqiLpquDQNRVSol
         M9e6+25/vkWmSoHkwntWbv4UqF2IXnaLDr5CFa71ZLSjPFlHjwFW+dWIXP/nQiEGPeEG
         mVQb8vyFgl0jkd5hYuPpnc64fwcoYAi26gQwFHm29Z80YYAEIH0kwx/PE27z3pZEA02n
         EZl/5QTwtys3ad3oh5OZs7G90kN8JlYIG2s276s0hSWNtackwVwWpcB86qQ7U/ALvmTt
         QMmnlui+nvKVrQz0g9tSYBZsjZoRp7qzex4ZElGh6efxJ0UHSDj0eNxAc/+Gg+9NOdiy
         P2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Cn96TbxW7Irni3vhzyfJ0STg0anzCZCQ1D1zqnrW2w=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=qFSVmIrlKltePnV4XzVOWxovJwgnHRSDrc4WnJs9Q4EUTT9nXXbNq9LVBS6KRbCgxC
         /NAq5plndLzyiNain/Fprm3tliJOgEkLVx1Qor5LtGyNVXffArUVmM74hKBGR4CAT6OW
         KvoJQ2IkzhCRBrbs1OACxrDdJdnJjpquPmIwXt+xAT/tnKNvpxc4d03W6ZqUVwHgwm7I
         k9XphwmnmFUHawgY1YB5NowgfNit/B2FyIXxhRnqizyARvUnMUnyrHz0eqxyEItcqpQg
         BpjHWKDQZ6ej2FG5s8qFXvwXTu0tZdQFadtXaOQxMQwm+TyO00/z9qtMPAO1scTxpn+u
         1lPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793183598; x=1793788398; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Cn96TbxW7Irni3vhzyfJ0STg0anzCZCQ1D1zqnrW2w=;
        b=YAl/6qYkBBwuDuxqeduaXav65VA2MWfw+1exQQmwi20lc1gXeqfbI9EEymb5kEkY4m
         89PBtG7jLFYXhUIACItQkGMmd3E8gz8DpkpdGI5xP8DA2ZW3QF1E0hnGWIEWh6rlBxt7
         zcQAy8S3BZy41NZehUEK8F7lRErO3mfo8+N+bbU9Sc/iJQFqK8d56SUYIrzJF6cUp8cV
         BFBjp4bT8oUtFd6MUpt+7OvuZcNITPjgQyity/fedca/BXiagXgv1+JBVhYsODUJv2Cw
         kjmoz05yCkPuKhN+huFV4XxzxK5gA9bpiq6uzVHTbf1dTKm4hZpc7FGkBN8UVrO5eCjj
         IHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183598; x=1793788398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Cn96TbxW7Irni3vhzyfJ0STg0anzCZCQ1D1zqnrW2w=;
        b=GSBdEIdoL9hlwUJmshmvBAVnh0JO6oKaRpexzgpLmlLFfkzfKoZ0fjIhrhM0o/eeaL
         zK5Xgs1JBBd1mz4v9TsP//Gi7VZ1IeUGNi8LlqydqB/Na191UBuyNfzER3FFJhJVb9pe
         jATBF2Sazab1JKlJaXlF5/vWUOYI5ABlIqw3UwGv3wC+k+w6UKkEHSsN7Jc3kqJ2+q4S
         MTbvbjb8gsgI2Wpu9dugVfRESSyt6Hs3eBEo1eGFoVJ7DR0AZb80/ACWRoGZLHjDjK9Y
         wEE0H5rV+Ynx7pO7Z6W9sUmHWaepuGRVZ2CK5JCOEy7VVCwcMMDkUhB33UayqNK6m38O
         hgVA==
X-Gm-Message-State: AFq9FYKdO8zdM4Bf7sv4SZCHZxjt8vFe9rFf3CV7MasHYMQ+xBvdEDqC
	wd6Guxh29vOw5A+1053+F2nf/0LA/AgbEqpSvojiAfIOHiuBSBHezy3afc/RR2EQ5tirvCTq4TA
	zSWfnqWnttn64JoPQ6+X0uvYV/0hy91Gs9zTw1lTOqw==
X-Gm-Gg: AYBFou3ItQZ46P2durV3bJ5Je5tKWXMSTz2j4IwZlkphGcr+wWS7i7Yt6B/f+/SOwc/
	8SmnpOJocF/4bzOPdTBYRimqK681iIr1JnnG6L+kwJw4MXhit9vG8FstoVBQl6z2ZG8rnVI6NdW
	/0oCmiG76GEm2aH0tOa8TXmeEbvvXJCfEEWPltttgy12VroNLzM16RnJ20w3VK1N3h5D5yvna1m
	PZ/FqQJMVuSGBjtd6uD8jOMM181FVHe5UFBQ/7/ZzZydZwAe1bZ81EE1nPsV+PtupRe8zTinch3
	iCI8oQMltYIs1iL2aXxh/sWQ7xQS37ihUFnVQygKHyWDrwDwp+i88gxYp+JTUs3Yg4wnVguuL6W
	tXqjdZrvSfYrzTxHgr3+/z4yNpSFKKW4FXUW5K8XM13Gze6XVcfLpZ9/w4OaWZH0hI4ZF8NmG5a
	0KUaqN3MnZ9nxUm0n4jpGHHpD0dQ66hIlIGzkm618LNOpK2Nxrw1IlGuE=
X-Received: by 2002:a05:6000:481b:b0:48d:f3ee:7cc with SMTP id
 ffacd0b85a97d-48e5d2ef721mr5321689f8f.30.1793183597742; Wed, 28 Oct 2026
 03:33:17 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-2-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-2-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2026 16:03:04 +0530
X-Gm-Features: AclHuK8o3z-RtkjzQXNfYLTtDz99zSfYPE8M5BP4oHN_o99b_-3M30KVKr5cHEg
Message-ID: <CAAhSdy3mtV-HPnTwydYP4OE3uXQdmb_WO8_8-z+cnxfes1UU6A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] lib: sbi_hart: detect RISC-V Worlds ISA extensions
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_033319_918453_EC92A45A 
X-CRM114-Status: GOOD (  16.42  )
X-Spam-Score: -2.1 (--)
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

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMjowNeKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIENTUiBkZWZpbml0aW9ucyBmb3IgUklT
Qy1WIFdvcmxkcyAobXdpZCwgbWx3aWQsIG1sd2lkbGlzdCwKPiBtd2lkZGVsZWcsIHNsd2lkKSBh
bmQgZGV0ZWN0IFdvcmxkcyBleHRlbnNpb25zIHZpYSBDU1IgcHJvYmVzCj4gaW4gaGFydF9kZXRl
Y3RfZmVhdHVyZXMoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBhd2FuZGVlcCBPemEgPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiBDaGFuZ2UgdjItPnYzOgo+IC0gTm8gY2hh
bmdlCj4gLS0tCj4gIGluY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggfCAxMiArKysrKysrKysr
KysKPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICB8IDEwICsrKysrKysrKysKPiAgbGli
L3NiaS9zYmlfaGFydC5jICAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggYi9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5o
Cj4gaW5kZXggZmZlNzY2NmMuLmUwMjYyYmZjIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3Jp
c2N2X2VuY29kaW5nLmgKPiArKysgYi9pbmNsdWRlL3NiaS9yaXNjdl9lbmNvZGluZy5oCj4gQEAg
LTQwMCw2ICs0MDAsOSBAQAo+ICAvKiBTdXBlcnZpc29yIFJlc291cmNlIE1hbmFnZW1lbnQgQ29u
ZmlndXJhdGlvbiBDU1JzICovCj4gICNkZWZpbmUgQ1NSX1NSTUNGRyAgICAgICAgICAgICAgICAg
ICAgIDB4MTgxCj4KPiArLyogU3VwZXJ2aXNvciBsb3dlci1wcml2aWxlZ2UgbW9kZSBXb3JsZCBJ
RCBDU1IgKFNzd2lkKSAqLwo+ICsjZGVmaW5lIENTUl9TTFdJRCAgICAgICAgICAgICAgICAgICAg
ICAweDE5MAo+ICsKPiAgLyogTWFjaGluZS1MZXZlbCBDb250cm9sIHRyYW5zZmVyIHJlY29yZHMg
Q1NScyAqLwo+ICAjZGVmaW5lIENTUl9NQ1RSQ1RMICAgICAgICAgICAgICAgICAgICAgMHgzNGUK
Pgo+IEBAIC01MjAsNiArNTIzLDE1IEBACj4gICNkZWZpbmUgQ1NSX01USU5TVCAgICAgICAgICAg
ICAgICAgICAgIDB4MzRhCj4gICNkZWZpbmUgQ1NSX01UVkFMMiAgICAgICAgICAgICAgICAgICAg
IDB4MzRiCj4KPiArLyogTWFjaGluZSBXb3JsZCBJRCBDU1JzIChTbXdpZCwgU21sd2lkLCBTbWx3
aWRsaXN0LCBTbXdpZGRlbGVnKSAqLwo+ICsjZGVmaW5lIENTUl9NTFdJRCAgICAgICAgICAgICAg
ICAgICAgICAweDM5MAo+ICsjZGVmaW5lIENTUl9NV0lEICAgICAgICAgICAgICAgICAgICAgICAw
eDc0OQo+ICsjZGVmaW5lIENTUl9NV0lEREVMRUcgICAgICAgICAgICAgICAgICAweDc0OAo+ICsj
ZGVmaW5lIENTUl9NTFdJRExJU1QgICAgICAgICAgICAgICAgICAweDc0QQo+ICsKPiArLyogbXdp
ZCBsb2NrIGJpdCAqLwo+ICsjZGVmaW5lIE1XSURfTE9DSyAgICAgICAgICAgICAgICAgICAgICAo
X1VMKDEpIDw8IChfX3Jpc2N2X3hsZW4gLSAxKSkKPiArCj4gIC8qIE1hY2hpbmUgTWVtb3J5IFBy
b3RlY3Rpb24gKi8KPiAgI2RlZmluZSBDU1JfUE1QQ0ZHMCAgICAgICAgICAgICAgICAgICAgMHgz
YTAKPiAgI2RlZmluZSBDU1JfUE1QQ0ZHMSAgICAgICAgICAgICAgICAgICAgMHgzYTEKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgK
PiBpbmRleCA1NDMzOTNiYi4uMjk0MTgwOWUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2Jp
X2hhcnQuaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBAQCAtOTUsNiArOTUsMTYg
QEAgZW51bSBzYmlfaGFydF9leHRlbnNpb25zIHsKPiAgICAgICAgIFNCSV9IQVJUX0VYVF9GLAo+
ICAgICAgICAgLyoqIEhhcnQgaGFzIEQgZXh0ZW5zaW9uICovCj4gICAgICAgICBTQklfSEFSVF9F
WFRfRCwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBTbXdpZCBleHRlbnNpb24gKi8KPiArICAgICAg
IFNCSV9IQVJUX0VYVF9TTVdJRCwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBTbWx3aWQgZXh0ZW5z
aW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfU01MV0lELAo+ICsgICAgICAgLyoqIEhhcnQg
aGFzIFNtbHdpZGxpc3QgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfU01MV0lE
TElTVCwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBTbXdpZGRlbGVnIGV4dGVuc2lvbiAqLwo+ICsg
ICAgICAgU0JJX0hBUlRfRVhUX1NNV0lEREVMRUcsCj4gKyAgICAgICAvKiogSGFydCBoYXMgU3N3
aWQgZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfU1NXSUQsCj4KPiAgICAgICAg
IC8qKiBNYXhpbXVtIGluZGV4IG9mIEhhcnQgZXh0ZW5zaW9uICovCj4gICAgICAgICBTQklfSEFS
VF9FWFRfTUFYLAo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3Ni
aV9oYXJ0LmMKPiBpbmRleCA4ZTRjMzZkMC4uMzhhNzYxYWMgMTAwNjQ0Cj4gLS0tIGEvbGliL3Ni
aS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gQEAgLTM2MCw2ICszNjAs
MTEgQEAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0X2V4dF9kYXRhIHNiaV9oYXJ0X2V4dFtdID0gewo+
ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQSh2LCBTQklfSEFSVF9FWFRfViksCj4gICAgICAg
ICBfX1NCSV9IQVJUX0VYVF9EQVRBKGYsIFNCSV9IQVJUX0VYVF9GKSwKPiAgICAgICAgIF9fU0JJ
X0hBUlRfRVhUX0RBVEEoZCwgU0JJX0hBUlRfRVhUX0QpLAo+ICsgICAgICAgX19TQklfSEFSVF9F
WFRfREFUQShzbXdpZCwgU0JJX0hBUlRfRVhUX1NNV0lEKSwKPiArICAgICAgIF9fU0JJX0hBUlRf
RVhUX0RBVEEoc21sd2lkLCBTQklfSEFSVF9FWFRfU01MV0lEKSwKPiArICAgICAgIF9fU0JJX0hB
UlRfRVhUX0RBVEEoc21sd2lkbGlzdCwgU0JJX0hBUlRfRVhUX1NNTFdJRExJU1QpLAo+ICsgICAg
ICAgX19TQklfSEFSVF9FWFRfREFUQShzbXdpZGRlbGVnLCBTQklfSEFSVF9FWFRfU01XSURERUxF
RyksCj4gKyAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHNzd2lkLCBTQklfSEFSVF9FWFRfU1NX
SUQpLAo+ICB9Owo+Cj4gIF9TdGF0aWNfYXNzZXJ0KFNCSV9IQVJUX0VYVF9NQVggPT0gYXJyYXlf
c2l6ZShzYmlfaGFydF9leHQpLAo+IEBAIC02NDcsOSArNjUyLDMwIEBAIF9fcG1wX3NraXA6Cj4g
ICAgICAgICAvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0IHNkdHJpZyAoZGVidWcgdHJpZ2dlcnMp
ICovCj4gICAgICAgICBfX2NoZWNrX2V4dF9jc3IoU0JJX0hBUlRfUFJJVl9WRVJfVU5LTk9XTiwK
PiAgICAgICAgICAgICAgICAgICAgICAgICBDU1JfVFNFTEVDVCwgU0JJX0hBUlRfRVhUX1NEVFJJ
Ryk7Cj4gKyAgICAgICAvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBTbXdpZCAqLwo+ICsgICAg
ICAgX19jaGVja19leHRfY3NyKFNCSV9IQVJUX1BSSVZfVkVSX1VOS05PV04sCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgQ1NSX01XSUQsIFNCSV9IQVJUX0VYVF9TTVdJRCk7Cj4gKyAgICAgICAv
KiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBTbWx3aWQgKi8KPiArICAgICAgIF9fY2hlY2tfZXh0
X2NzcihTQklfSEFSVF9QUklWX1ZFUl9VTktOT1dOLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
IENTUl9NTFdJRCwgU0JJX0hBUlRfRVhUX1NNTFdJRCk7Cj4gKyAgICAgICAvKiBEZXRlY3QgaWYg
aGFydCBzdXBwb3J0cyBTbWx3aWRsaXN0ICovCj4gKyAgICAgICBfX2NoZWNrX2V4dF9jc3IoU0JJ
X0hBUlRfUFJJVl9WRVJfVU5LTk9XTiwKPiArICAgICAgICAgICAgICAgICAgICAgICBDU1JfTUxX
SURMSVNULCBTQklfSEFSVF9FWFRfU01MV0lETElTVCk7Cj4gKyAgICAgICAvKiBEZXRlY3QgaWYg
aGFydCBzdXBwb3J0cyBTbXdpZGRlbGVnICovCj4gKyAgICAgICBfX2NoZWNrX2V4dF9jc3IoU0JJ
X0hBUlRfUFJJVl9WRVJfVU5LTk9XTiwKPiArICAgICAgICAgICAgICAgICAgICAgICBDU1JfTVdJ
RERFTEVHLCBTQklfSEFSVF9FWFRfU01XSURERUxFRyk7CgpQbGVhc2UgZHJvcCB0aGVzZSB0cmFw
IGJhc2VkIGV4dGVuc2lvbiBkZXRlY3Rpb24sIHdlIGFyZQptaW5pbWl6aW5nIG91ciBkZXBlbmRl
bmNlIG9uIHRoZW0uCgo+Cj4gICN1bmRlZiBfX2NoZWNrX2V4dF9jc3IKPgo+ICsgICAgICAgLyoK
PiArICAgICAgICAqIHNsd2lkIHRyYXBzIG9uIGFjY2VzcyB3aGVuIG13aWRkZWxlZz0wIChyZXNl
dCBzdGF0ZSksIHNvCj4gKyAgICAgICAgKiBTc3dpZCBwcmVzZW5jZSBpcyBpbmZlcnJlZCBmcm9t
IFNtd2lkZGVsZWcuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0
ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVdJRERFTEVHKSkgewo+ICsgICAgICAgICAg
ICAgICBfX3NiaV9oYXJ0X3VwZGF0ZV9leHRlbnNpb24oaGZlYXR1cmVzLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0hBUlRfRVhUX1NTV0lELCB0cnVl
KTsKPiArICAgICAgIH0KPiArCj4gICNkZWZpbmUgX19jaGVja19jc3JfZXhpc3RlbmNlKF9fY3Ny
LCBfX2Nzcl9pZCkgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgY3NyX3JlYWRf
YWxsb3dlZChfX2NzciwgJnRyYXApOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiAgICAgICAgIGlmICghdHJhcC5jYXVzZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gLS0KPiAyLjQzLjcKPgoKUmVnYXJkcywKQW51cAoKLS0gCm9w
ZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
