Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FFC606A31C
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 11:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Actafiz3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=hdvW1HZ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qZySdlXXDARNVnU0xpL0sOqoJ4sqm7YcUWrPxBYfz7k=; b=Actafiz3EDOXu64gZZk2BMSAqp
	dlB2DenK12nG9iNm/I39Jaem2ZMozdbLqKtM30wH+/pwPQ+PyIZiV1qxRMbQun7QtpFbXnlEzfcYB
	VphbQeNlJsd0/r7aX1ubp1XAUN30qyy52cOGvsuxhn19PUzU6Zs93+UY6AwwNhPc47dJyCB7R8mOP
	xOc7UjZpYZ91H7lClz3JWJmDH1Q/b5mm3hjgQSY4h/GUvDiJLKNRtwMwZQ4PTJO+s/rlO4mJJ7fdo
	++FWi88uOcpKe0j5XuCYTvw+EVMIfw9wNLSBe+S1FRcDDfczRp98BocLaaV/c3MwQuGUR2rrktAWK
	4DQqq3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1YM-00000006pyt-1OAe;
	Wed, 28 Oct 2026 11:10:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1YI-00000006pxb-081j
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 11:10:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48e10a70540so510492f8f.1
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 04:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793185840; cv=none;
        d=google.com; s=arc-20260327;
        b=U8aKPmUOChJPe5Pcg/1ikjyrzxZJ8/bTOKKagt+iA3fgyZ9uQgnfw3KTM80wYCvM3U
         /tp7HJh3kLSav7w2sZpeknqj1GuwI48DzGULKdF9Y5wEGh8sEuX+Yjn3ahm81TThkVdY
         LCeIXVCL0p0zxkshejRbsObvSdBQjzpGcpt29TRZg3lTFbZtIsE7h3Z7hxqTc1K96f4j
         ZD59cC/6JS+HUXl2DS3t2JxS62abfYNcVzRWlxcMFPy9GMOBmwr4TsICJDF+Ga/+RjzP
         vaxyR8DwithBJ1C3AXBMC+PUljRQvwajvQFwUmpqTP4e7QVb8/NDQopQzlg9xYgjeQ+Z
         rh1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wC0AA8b6PqL7DOSHUU6Q1GzVo7YmVNY14AXEC56Rp14=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=sxg8plNZpERFiNyL03W4CsqQAesx52st6rmJDWv6GMPuC5OJ5VByV4YKxYk8K3+TjG
         bP0sNeKLXKK+LmaTYJ/wEcLbr0ZgbXjZds5OK96NwfcQcPZ3a1tpox1AnKSfrkvRhNrq
         FzlY5sRavRBE4kF8SYWmwhnLz6XMHrcwvqk1GqEa7W8v8sUQCmqvUxDMgXQ+RAnb41d+
         mmnUHHOEWGcykTEqq63ECuQMZODVO9yZ2w7T390oWk4swlaPR/eEUBKvdHCaFfyUoDR9
         gojLd6UB5uSCMfee3AmCdoD52dHEql20wFR1N/+d55z0VeTHP4LHlSsvbFw96rTlHR9D
         wcrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793185840; x=1793790640; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wC0AA8b6PqL7DOSHUU6Q1GzVo7YmVNY14AXEC56Rp14=;
        b=hdvW1HZ0h5few72mrd8nKUXamzU5xc9Bqf/HWuUGaKQ7GBVEKWJEqc4DRPFT9BlFEI
         0VfNcx6pKA2OuSUBJ7eVNkou4noka/XBm+vUWrlVlZsrNNz4EXF2sLYCM9fa+NiOxf7O
         qGm+4YOqjoYUvVLrQwRMxFtkOzomkipecS9k8ayCZrlykDjtsMoBP1vIXpTmPRtc/JrQ
         dt/NxThc6FbJ0/n7xWKPYti4FDRarKrqIxZlCk2JnCXVmRlZCsb1HSY9j8y1gpjx+Me/
         PcWAIDKGMXOjdL7HwMAhxqyBEOI51wbHaMEMwlk9w8KD0+9iPvwUXDlgfFc3SLEuufel
         Y+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185840; x=1793790640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wC0AA8b6PqL7DOSHUU6Q1GzVo7YmVNY14AXEC56Rp14=;
        b=uU9NK4YN7r5Y4wMBzBIqqnyBB4QLOuwVfrU0WyMo6hEFzKW2/7JM5KFM7+cYUBRMKe
         BmVLCYwMZm7uVreVEN1OBK6++Fhq8WIP6Mi4X1iRWk7r7FW1Yt/ECiGgtoFeMW8lrIW1
         d3c2JCctsQhPi34rXOFf256u8o8TS+hCuorCJYcgf78IQCm3McqYxgwK4j2G9RmWdF1a
         iEXfBpOA3VP01WkAaWbPcDa3PU6Tejm1k0sMjdz3qSvl1PQcEr+ZS77vi9hhxwc8tN4t
         pvo+GhYvFLjkeKNkgaAuF/WYqIniKPKLEjIb165ISMkwlDwU98BCfrY1GxDfxTnTYa59
         IF1A==
X-Gm-Message-State: AFq9FYKLBzn685leIQ0FzXC8T/b8ZejLzrXxjMIS+Jxe0MShp/KAompO
	ZOKB2OnmWLhLURIvTiTyWN/2jXe46wPunHzldZUP4VGsRD3FNfndgrXdrBoqNH92/PrUGqI26dQ
	7tFUJ12zKS6q0WCEC0phqg9pATX1h+ru+A1ZFhMnaLg==
X-Gm-Gg: AYBFou0Gv3FzFrxHSmFfzCeGwBp2EbW9woxNGrE/6DoC7MePpqyNTE0TogiPJGeZgP4
	tBhT+M2l7uTsZeAqX8cMQIZwd8jjMBYrEe2Amqn9+HL5Rn2ywd3xJEpaIaD+oLh86Qy0dwW2gzB
	mkL6Yj5nLGmdaxy6EX6y9D/RwSbHKavoKAciBlfJE9QQnLfDGvg4fIx2Cb+2jkBbWWIJ3JF19XW
	wbTqbzuAgbtfW3/jdIDx31ricQJL67p43uZyd5b0HzO9OWTQy0+9q9+D5EkqRgWdf7/ofkrPEzB
	qbk+9zo5/3GPTgS/6RM9xVozcX7LNefCiIUEPo1PhQDO4ykA31my4KyqBjtUVr+k1JzF970vxJB
	6pR2aDt1GL9ez6ms3dKtE1vBm4Nii4OkegLukS4plGokPirO4Sej+qIZyr8zzWtGsKwFZ7kIRPZ
	+4qTbAyVaH35tzHHnpfB3M8RXI8hE6Ba8AK2/SNm3ghrJtkslRXYu977g=
X-Received: by 2002:a5d:5f88:0:b0:48d:eb44:650c with SMTP id
 ffacd0b85a97d-48e5d5d13cfmr5017652f8f.40.1793185839783; Wed, 28 Oct 2026
 04:10:39 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-10-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-10-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2026 16:40:27 +0530
X-Gm-Features: AclHuK_9hkRziwHbVYnW_o2X2C7R8NbZMTBlYe03gTOQfbetdwpBSjSi91HX1FE
Message-ID: <CAAhSdy0V2OYXPosdG0dvDeO0LTzRSHVTPLCgF6+VnLYqtAsVEg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] docs: document WID DT properties
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_041042_108995_96B2B36B 
X-CRM114-Status: GOOD (  23.97  )
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

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMjowNuKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkICJ3aWQiIGFuZCAid2lkZGVsZWciIHBy
b3BlcnRpZXMgdG8gZG9tYWluIGluc3RhbmNlIG5vZGUKPiBkb2N1bWVudGF0aW9uIGFuZCBleGFt
cGxlIERULiBBZGQgYSAiUm9vdCBEb21haW4gTm9kZSIgc2VjdGlvbgo+IGRlc2NyaWJpbmcgdGhl
ICJyb290IiBzdWJub2RlIHVuZGVyIHRoZSBkb21haW4gY29uZmlndXJhdGlvbgo+IG5vZGUgZm9y
IHJvb3QgZG9tYWluIFdJRCBjb25maWd1cmF0aW9uCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaGll
biBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgo+IC0tLQo+IENoYW5nZSB2Mi0+djM6
Cj4gLSBNYXJrICd3aWQnIHByb3BlcnR5IGFzIG1hbmRhdG9yeSB3aGVuIFNtbHdpZCBpcyBwcmVz
ZW50IGZvciBib3RoIHJvb3QKPiAgIGFuZCBkb21haW4gaW5zdGFuY2Ugbm9kZXMuCj4gLSBSZW1v
dmUgbWVudGlvbiBvZiBNLW1vZGUgV0lEIGZhbGxiYWNrIHdoZW4gJ3dpZCcgaXMgYWJzZW50Lgo+
IC0tLQo+ICBkb2NzL2RvbWFpbl9zdXBwb3J0Lm1kIHwgMzYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZG9jcy9kb21haW5fc3VwcG9ydC5tZCBiL2RvY3MvZG9tYWluX3N1cHBvcnQu
bWQKPiBpbmRleCA1MTczNzIxOC4uNTQzMjdlOGQgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9kb21haW5f
c3VwcG9ydC5tZAo+ICsrKyBiL2RvY3MvZG9tYWluX3N1cHBvcnQubWQKPiBAQCAtNTYsNiArNTYs
OCBAQCBoYXMgZm9sbG93aW5nIGRldGFpbHM6Cj4gICAgZG9tYWluLiBUaGlzIGNhbiBiZSBlaXRo
ZXIgUy1tb2RlIG9yIFUtbW9kZS4KPiAgKiAqKnN5c3RlbV9yZXNldF9hbGxvd2VkKiogLSBJcyBk
b21haW4gYWxsb3dlZCB0byByZXNldCB0aGUgc3lzdGVtPwo+ICAqICoqc3lzdGVtX3N1c3BlbmRf
YWxsb3dlZCoqIC0gSXMgZG9tYWluIGFsbG93ZWQgdG8gc3VzcGVuZCB0aGUgc3lzdGVtPwo+ICsq
ICoqd2lkKiogLSBXb3JsZCBJRCBmb3IgdGhlIGRvbWFpbgo+ICsqICoqd2lkZGVsZWcqKiAtIFdv
cmxkIElEIGRlbGVnYXRpb24gYml0bWFzayBmb3IgdGhlIGRvbWFpbgo+Cj4gIFRoZSBtZW1vcnkg
cmVnaW9ucyByZXByZXNlbnRlZCBieSAqKnJlZ2lvbnMqKiBpbiAqKnN0cnVjdCBzYmlfZG9tYWlu
KiogaGF2ZQo+ICBmb2xsb3dpbmcgYWRkaXRpb25hbCBjb25zdHJhaW50cyB0byBhbGlnbiB3aXRo
IFJJU0MtViBQTVAgcmVxdWlyZW1lbnRzOgo+IEBAIC05OCw2ICsxMDAsOCBAQCBmb2xsb3dpbmcg
bWFubmVyOgo+ICAgIGlzIHRoZSBuZXh0IG1vZGUgZm9yIHRoZSBST09UIGRvbWFpbgo+ICAqICoq
c3lzdGVtX3Jlc2V0X2FsbG93ZWQqKiAtIFRoZSBST09UIGRvbWFpbiBpcyBhbGxvd2VkIHRvIHJl
c2V0IHRoZSBzeXN0ZW0KPiAgKiAqKnN5c3RlbV9zdXNwZW5kX2FsbG93ZWQqKiAtIFRoZSBST09U
IGRvbWFpbiBpcyBhbGxvd2VkIHRvIHN1c3BlbmQgdGhlIHN5c3RlbQo+ICsqICoqd2lkKiogLSBD
b25maWd1cmFibGUgV29ybGQgSUQgZm9yIHRoZSBST09UIGRvbWFpbgo+ICsqICoqd2lkZGVsZWcq
KiAtIENvbmZpZ3VyYWJsZSBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgZm9yIHRoZSBST09U
IGRvbWFpbgo+Cj4gIERvbWFpbiBFZmZlY3RzCj4gIC0tLS0tLS0tLS0tLS0tCj4gQEAgLTEzMSw2
ICsxMzUsMjIgQEAgVGhlIERUIHByb3BlcnRpZXMgb2YgYSBkb21haW4gY29uZmlndXJhdGlvbiBE
VCBub2RlIGFyZSBhcyBmb2xsb3dzOgo+ICAqICoqY29tcGF0aWJsZSoqIChNYW5kYXRvcnkpIC0g
VGhlIGNvbXBhdGlibGUgc3RyaW5nIG9mIHRoZSBkb21haW4KPiAgICBjb25maWd1cmF0aW9uLiBU
aGlzIERUIHByb3BlcnR5IHNob3VsZCBoYXZlIHZhbHVlICoib3BlbnNiaSxkb21haW4sY29uZmln
IioKPgo+ICsjIyMgUm9vdCBEb21haW4gTm9kZQo+ICsKPiArVGhlIHJvb3QgZG9tYWluIFdJRCBj
b25maWd1cmF0aW9uIGlzIGRlc2NyaWJlZCBpbiBhICoqcm9vdCoqIHN1Ym5vZGUgdW5kZXIKPiAr
dGhlIGRvbWFpbiBjb25maWd1cmF0aW9uIERUIG5vZGUuIFRoaXMgc3Vibm9kZSBkb2VzIG5vdCBo
YXZlIGEgY29tcGF0aWJsZQo+ICtzdHJpbmcuCj4gKwo+ICtUaGUgRFQgcHJvcGVydGllcyBvZiB0
aGUgcm9vdCBkb21haW4gbm9kZSBhcmUgYXMgZm9sbG93czoKPiArCj4gKyogKip3aWQqKiAoTWFu
ZGF0b3J5IGlmIFNtbHdpZCBpcyBwcmVzZW50KSAtIFRoZSAzMi1iaXQgV29ybGQgSUQgZm9yCj4g
KyAgbG93ZXItcHJpdmlsZWdlIG1vZGVzIChTL1UtbW9kZSkgZm9yIHRoZSBST09UIGRvbWFpbi4g
SWYgdGhlIGhhcnQKPiArICBzdXBwb3J0cyB0aGUgU21sd2lkIGV4dGVuc2lvbiwgdGhpcyBwcm9w
ZXJ0eSBtdXN0IGJlIHByb3ZpZGVkLgo+ICsqICoqd2lkZGVsZWcqKiAoT3B0aW9uYWwpIC0gVGhl
IDY0IGJpdCBXb3JsZCBJRCBkZWxlZ2F0aW9uIGJpdG1hc2sgZm9yCj4gKyAgdGhlIFJPT1QgZG9t
YWluLiBJZiBwcmVzZW50LCBPcGVuU0JJIHdyaXRlcyB0aGlzIHZhbHVlIHRvICoqbXdpZGRlbGVn
KioKPiArICB3aGVuIGVudGVyaW5nIHRoZSBST09UIGRvbWFpbiAocmVxdWlyZXMgU213aWRkZWxl
ZyBleHRlbnNpb24pLiBJZiBhYnNlbnQsCj4gKyAgY2xlYXJzICoqbXdpZGRlbGVnKiogdG8gZGlz
YWJsZSBTLW1vZGUgV0lEIGRlbGVnYXRpb24uCj4gKwoKTGV0J3MgZGVmaW5lIG1hbmRhdG9yeSBj
b21wYXRpYmxlIERUIHByb3BlcnR5IGZvciByb290IGRvbWFpbiBEVCBub2RlCmFzIHdlbGwuIFRo
ZSBzdWdnZXN0aW9uIGluIFBBVENIMyB3aWxsIGFsbG93IHlvdSB0byBkbyB0aGF0LgoKPiAgIyMj
IERvbWFpbiBNZW1vcnkgUmVnaW9uIE5vZGUKPgo+ICBUaGUgZG9tYWluIG1lbW9yeSByZWdpb24g
RFQgbm9kZSBkZXNjcmliZXMgZGV0YWlscyBvZiBhIG1lbW9yeSByZWdpb24gYW5kCj4gQEAgLTIw
NSw2ICsyMjUsMTMgQEAgVGhlIERUIHByb3BlcnRpZXMgb2YgYSBkb21haW4gaW5zdGFuY2UgRFQg
bm9kZSBhcmUgYXMgZm9sbG93czoKPiAgICB3aGV0aGVyIHRoZSBkb21haW4gaW5zdGFuY2UgaXMg
YWxsb3dlZCB0byBkbyBzeXN0ZW0gcmVzZXQuCj4gICogKipzeXN0ZW0tc3VzcGVuZC1hbGxvd2Vk
KiogKE9wdGlvbmFsKSAtIEEgYm9vbGVhbiBmbGFnIHJlcHJlc2VudGluZwo+ICAgIHdoZXRoZXIg
dGhlIGRvbWFpbiBpbnN0YW5jZSBpcyBhbGxvd2VkIHRvIGRvIHN5c3RlbSBzdXNwZW5kLgo+ICsq
ICoqd2lkKiogKE1hbmRhdG9yeSBpZiBTbWx3aWQgaXMgcHJlc2VudCkgLSBUaGUgMzItYml0IFdv
cmxkIElEIGZvcgo+ICsgIGxvd2VyLXByaXZpbGVnZSBtb2RlcyAoUy9VLW1vZGUpIGZvciB0aGUg
ZG9tYWluIGluc3RhbmNlLiBJZiB0aGUgaGFydAo+ICsgIHN1cHBvcnRzIHRoZSBTbWx3aWQgZXh0
ZW5zaW9uLCB0aGlzIHByb3BlcnR5IG11c3QgYmUgcHJvdmlkZWQuCj4gKyogKip3aWRkZWxlZyoq
IChPcHRpb25hbCkgLSBUaGUgNjQgYml0IFdvcmxkIElEIGRlbGVnYXRpb24gYml0bWFzayBmb3IK
PiArICB0aGUgZG9tYWluIGluc3RhbmNlLiBJZiBwcmVzZW50LCBPcGVuU0JJIHdyaXRlcyB0aGlz
IHZhbHVlIHRvICoqbXdpZGRlbGVnKioKPiArICBvbiBjb250ZXh0IHN3aXRjaCBpbnRvIHRoaXMg
ZG9tYWluIChyZXF1aXJlcyBTbXdpZGRlbGVnIGV4dGVuc2lvbikuIElmIGFic2VudCwKPiArICBj
bGVhcnMgKiptd2lkZGVsZWcqKiB0byBkaXNhYmxlIFMtbW9kZSBXSUQgZGVsZWdhdGlvbi4KPgo+
ICAjIyMgQXNzaWduaW5nIEhBUlQgVG8gRG9tYWluIEluc3RhbmNlCj4KPiBAQCAtMjYwLDYgKzI4
NywxMSBAQCBiZSBkb25lOgo+ICAgICAgICAgICAgICAgICAgb3JkZXIgPSA8NjQ+Owo+ICAgICAg
ICAgICAgICB9Owo+Cj4gKyAgICAgICAgICAgIHJvb3Qgewo+ICsgICAgICAgICAgICAgICAgd2lk
ID0gPDM+Owo+ICsgICAgICAgICAgICAgICAgd2lkZGVsZWcgPSA8MHgwIDB4MD47Cj4gKyAgICAg
ICAgICAgIH07Cj4gKwo+ICAgICAgICAgICAgICB0ZG9tYWluOiB0cnVzdGVkLWRvbWFpbiB7Cj4g
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm9wZW5zYmksZG9tYWluLGluc3RhbmNlIjsK
PiAgICAgICAgICAgICAgICAgIHBvc3NpYmxlLWhhcnRzID0gPCZjcHUwPjsKPiBAQCAtMjY4LDYg
KzMwMCw4IEBAIGJlIGRvbmU6Cj4gICAgICAgICAgICAgICAgICBuZXh0LWFyZzEgPSA8MHgwIDB4
MD47Cj4gICAgICAgICAgICAgICAgICBuZXh0LWFkZHIgPSA8MHgwIDB4ODAxMDAwMDA+Owo+ICAg
ICAgICAgICAgICAgICAgbmV4dC1tb2RlID0gPDB4MD47Cj4gKyAgICAgICAgICAgICAgICB3aWQg
PSA8MT47Cj4gKyAgICAgICAgICAgICAgICB3aWRkZWxlZyA9IDwweDAgMHg2PjsKPiAgICAgICAg
ICAgICAgICAgIHN5c3RlbS1yZXNldC1hbGxvd2VkOwo+ICAgICAgICAgICAgICAgICAgc3lzdGVt
LXN1c3BlbmQtYWxsb3dlZDsKPiAgICAgICAgICAgICAgfTsKPiBAQCAtMjc2LDYgKzMxMCw4IEBA
IGJlIGRvbmU6Cj4gICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm9wZW5zYmksZG9tYWlu
LGluc3RhbmNlIjsKPiAgICAgICAgICAgICAgICAgIHBvc3NpYmxlLWhhcnRzID0gPCZjcHUxICZj
cHUyICZjcHUzICZjcHU0PjsKPiAgICAgICAgICAgICAgICAgIHJlZ2lvbnMgPSA8JnRtZW0gMHgw
PiwgPCZ0dWFydCAweDA+LCA8JmFsbG1lbSAweDNmPjsKPiArICAgICAgICAgICAgICAgIHdpZCA9
IDwwPjsKPiArICAgICAgICAgICAgICAgIHdpZGRlbGVnID0gPDB4MCAweDE+Owo+ICAgICAgICAg
ICAgICB9Owo+ICAgICAgICAgIH07Cj4gICAgICB9Owo+IC0tCj4gMi40My43Cj4KClJlZ2FyZHMs
CkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
