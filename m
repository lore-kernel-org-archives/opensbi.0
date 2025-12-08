Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A1FD3B7E2
	for <opensbi@archiver.kernel.org>; Mon,  8 Dec 2025 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUj60DBdlJzDcSaPeQXLx3XcfixFnkKWT2pa43MU+ts=; b=L66IC/U6fDEu44
	fQIjhnPrdrriEByTRt7OmjKS7Hly58Ptvng1+UketoMfINwF4CbB0vKsRDRq7qXn76EsPv7qwdcDb
	TENxBOP5No9iHMankOQ+DjDxXwNwBRP8elff908bKXLQvHXFJDihlWw8tO4p4DQGwhyviDjU7HI3v
	ohP5empMnDuEu7BP3jf5AnTfsI6EvPLScgVMVlvfVr4uSJCIYu4nO9C8evdLU/tUgsZU/e2cWm0iL
	0bXPaxzf5nFALHFY/Pli/qWGiT5IWDtB/j3ucMLYBHsSV68KLDicBV2s9PBGM/puCx+tN/61YR2co
	FxWRKcLbsUyiX9XMuSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZ1D-0000000Cz6T-3ccy;
	Mon, 08 Dec 2025 11:03:03 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZ19-0000000Cz4v-0V7X
	for opensbi@lists.infradead.org;
	Mon, 08 Dec 2025 11:03:00 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-3f5529a6871so383687fac.3
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 03:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765191778; x=1765796578; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9oq/iY7QsbwKkdX3/xtGXYW9tIee6p9e1G04xqCvQk=;
        b=myUDD3NCOHUzz9t13EuiwsODWFcT7/0W9ZZS5xVAR6Lw4gtHo6QETL258Cko7Svrj6
         h8+nvIuZkR0gCEsbjgysRGlohRcRfDARfH7e8KcyckastdA3GfUG8gw94/WVMQrtmw1e
         YUTcdhWNohEv7JPlGH9/aKyBZPHnh79r0tdQOsFlKMqNG2r6rHYjI5fxQuOzhAIwAnRG
         Oc0adL8se4bqLK8+RYtBPpLHTxVCfB5IeWUN2/Fz1WQ+z61wOotAw5nH1EAbL1PkoqaI
         z/5YSyb9v7c64NiBR7xNkcTU/t6jKch2X7orI+qb2NIfnglOcSRahOlQs7LVWeu8gigU
         Hc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765191778; x=1765796578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d9oq/iY7QsbwKkdX3/xtGXYW9tIee6p9e1G04xqCvQk=;
        b=rX+P2Tt7q5faJyd/GwFlsFmiAmW2oRcABUj3ngfe4Pfjn6ftKBL72+VDER+TTkOPmK
         bPldDFVZZ727PqhZHbmgXsqAYX48g1qQX2i0C1apNyxUx1egevpyACXZdIzf2tP0HMKU
         uMArw8Fp40etC8viSlLjZcl1yG5CvMQyOg9xnjEl0F3dE9iZ9iW0PRfXGpRH2XzGKYt8
         iwpS+odpbwDjrcr9g2fXbLuUnuosgFVl8sb0+hQRRlRXExOKmapEA90WFl4tfeqen8TL
         DsKlYn1WFw1ZkUNGylhq0VPyw0RUQK9+DYqciueAjrv4j1tqRlea7OrJbSMJ1gNTS0KW
         5D8g==
X-Gm-Message-State: AOJu0YwE8Lq+eza8z2/4LrAtlp1FVyXeoXqgYmclVkggi6Hl2aO1VW0P
	tJXR7mQZ7N1qA2boHmp2h7WyZWSSjtjC3MHt7C1ebuHvhzhMD0Eljbz8dwUiImOXo1GMVT7Jiyg
	cgJPLH5d/sNkvtIajfnMLPQR37t9ShnQ2uPqBUPduOFgBOl1VwwdG
X-Gm-Gg: ASbGnctEQcPQ/xSpFlUTGmvhdEdXnaX+x9yMOWLP8ivP2uMp4bg9c5ipDM+p3WR52Sq
	qAuU32N5doOcR8s5PqsnD2lwLEptZDb1yV13U22Nh+Gtuy/Dra1rgIRrzeuR9PLN70wL3QsvGs6
	AJeHDqFqL8CPgjeQnhp8gEUh2Il8zfAZweUIGjRVBhoKzvx2nqQBDQIXEzMjmWkaYbK2MzL33O5
	M1QnjbK9bdsGjJlJHxRnSkQH3p85ePxde+h2eEoZYuamKGAfoAdNcld+gOYLHq4a0ihoNGs
X-Google-Smtp-Source: AGHT+IF1eXcz5cH51HJTMlc2mwojGxy/qeBaVLAuPo9jfIZCiMzNVpdZKStybUcAxZTM2W7WXHz2mif0zzz/zn5psi0=
X-Received: by 2002:a05:6820:174a:b0:659:9a49:90be with SMTP id
 006d021491bc7-6599a968271mr3142185eaf.61.1765191778061; Mon, 08 Dec 2025
 03:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20251124-k1-fix-v1-1-8d7e7a29379e@pigmoral.tech>
In-Reply-To: <20251124-k1-fix-v1-1-8d7e7a29379e@pigmoral.tech>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Dec 2025 16:32:47 +0530
X-Gm-Features: AQt7F2opXFuwEozZy_MlL2qn5aFCeVnB5sqNE1cdW79u8YFa1wEPPvzJRxgX5oM
Message-ID: <CAAhSdy3g75HapgOHU217g-Oga_KuJZCbmgE=vZVEk-oBLLESoQ@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: spacemit: add missing objects.mk
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: opensbi@lists.infradead.org, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_030259_164557_798F6458 
X-CRM114-Status: GOOD (  14.09  )
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

T24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgNDo0OOKAr1BNIEp1bmh1aSBMaXUgPGp1bmh1aS5saXVA
cGlnbW9yYWwudGVjaD4gd3JvdGU6Cj4KPiBBZGQgdGhlIG1pc3Npbmcgb2JqZWN0cy5tayBmb3Ig
dGhlIFNwYWNlbWlUIHBsYXRmb3JtLCByZXF1aXJlZCBmb3IgdGhlCj4gSzEgcGxhdGZvcm0gdG8g
YmUgaW5jbHVkZWQgaW4gdGhlIGJ1aWxkLgo+Cj4gRml4ZXM6IDFmODRlYzJhICgicGxhdGZvcm06
IGdlbmVyaWM6IHNwYWNlbWl0OiBhZGQgSzEiKQo+IFNpZ25lZC1vZmYtYnk6IEp1bmh1aSBMaXUg
PGp1bmh1aS5saXVAcGlnbW9yYWwudGVjaD4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlz
Y3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgcGxhdGZvcm0vZ2VuZXJp
Yy9zcGFjZW1pdC9vYmplY3RzLm1rIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvc3BhY2VtaXQvb2Jq
ZWN0cy5tayBiL3BsYXRmb3JtL2dlbmVyaWMvc3BhY2VtaXQvb2JqZWN0cy5tawo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMC4uZGNiMzc4NjdhYTY2MWRmYzU1OTA4OGY5MjZjZDE0NjViYzBmN2U4ZAo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL3NwYWNlbWl0L29iamVjdHMubWsKPiBAQCAt
MCwwICsxLDYgQEAKPiArIwo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1
c2UKPiArIwo+ICsKPiArY2FycmF5LXBsYXRmb3JtX292ZXJyaWRlX21vZHVsZXMtJChDT05GSUdf
UExBVEZPUk1fU1BBQ0VNSVRfSzEpICs9IHNwYWNlbWl0X2sxCj4gK3BsYXRmb3JtLW9ianMtJChD
T05GSUdfUExBVEZPUk1fU1BBQ0VNSVRfSzEpICs9IHNwYWNlbWl0L2sxLm8KPgo+IC0tLQo+IGJh
c2UtY29tbWl0OiBmYWRlNDM5OWQyYTQ3YTNmZjljNWVjZDVkZDRjM2NiYTdhNGVhY2U3Cj4gY2hh
bmdlLWlkOiAyMDI1MTEyNC1rMS1maXgtNDMzYWYwMWE3YWE5Cj4KPiBCZXN0IHJlZ2FyZHMsCj4g
LS0KPiBKdW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+Cj4KCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
