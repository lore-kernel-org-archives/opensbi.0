Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF56EF4ED4
	for <opensbi@archiver.kernel.org>; Mon,  6 Apr 2026 12:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqpHi+RSRGbzV3+ECXcmTvuIUXHlBEz4ni3t/qrsZf8=; b=YrvdRw3LNofaWm
	alfxISzMUQTqAg6OPhoUK5USc3sytLMiv+yqWaC/GVlnWNhztA/+MQG0e/+DQIItTJNj35GaRGR4W
	Neg/Ja6Ku2DZ1QRCyseODcdBKThdH6mKNmLYI5sTAhuY6EviWiObb1WtPqh7udCpgJKtwbGivE9Hd
	uv6d4x4ApMi9HtdBp8ZdoJg10544SblnkQsR4J1MVLdJ6KTw3FPD0ExYXyGJrRmZsiXb2gnStfLVM
	IpcGK4Vz3RbgZtbOcGUszGnyzz5g4AuFvCELCOB4eTAaFVmaaSqlHs0uSHqc5pGJWL4G/wG+7+3xa
	/Z7RDeNWOks7iZJDv8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9j5H-000000056VZ-2Pf2;
	Mon, 06 Apr 2026 12:29:39 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9j5F-000000056VD-07wn
	for opensbi@lists.infradead.org;
	Mon, 06 Apr 2026 12:29:38 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-46808125c65so1060013b6e.2
        for <opensbi@lists.infradead.org>; Mon, 06 Apr 2026 05:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775478575; cv=none;
        d=google.com; s=arc-20240605;
        b=SAJwWYTSZ0N6dLJgBgp1yREaadbgpx88v11ICRvgKrC4bD3J/RJZCfFW8E4MdWNGz/
         hRxYU7crivcdDQwDFZxrNeyM0kHyMcDeFxXDunjV867Ga/zlGGmqsLF9vW27BL5DAfXb
         a2XeQLnLQfWf7bO9T2EOko1x13gzzWhKeHUE4oKe8vM6NeXcW7nFqrRgAV+gQTTVEcZ+
         g5JCfrXvIEFV9Gk4y9RvkWguamMYN8cXNgnUR2rZNw4iub/lJOe3bWKiAcdU0SOt2/wC
         r7tybCBar8Hn0CevYJJ+6CV5n4oAy/dSO+w6+1HflvTv9KGC5BIm3ojOP7651RogFxNK
         uJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XVGbCMH/4RaBYpWdStQuD12WoEB4gXcivhmDJ7c/+A4=;
        fh=T6Ax3EhEdWkWc44OUynuwy8YKSpxCvd9+JQJrdduYb8=;
        b=TmcvxGIXV1iQnFdAtt+oO1ZdeAcnozKuSWzSR2YP4ycsSbvEmodm+UXNHdrp6TAd9j
         Omg1f43FuxkRMFVDxezpVLYSPpKULz9B3ytDyLsj481di0/HqKRWRU++euONY9W35wca
         mVo8CH2g1TsT9yPlX7H6HZnrxu77XcbEXJ7LVbDkECBJNFqSArhGq7FM4cuaqgio/HXo
         zRqwooisfNKbf0mmuK9ALDOwoflXheHduWYAS8PF1o1TI7E35F7gW3gTBaJHrjgGwoVT
         SX6HP9KCt0riu0Ykm57g4++YFxvqbwJPxsNPlrj7xY5F7zjHT0drij9l0cf7Y6sjTrus
         6QJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775478575; x=1776083375; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVGbCMH/4RaBYpWdStQuD12WoEB4gXcivhmDJ7c/+A4=;
        b=YOBE3HTH123N0UolP7ur9vAbQpdbfKNHi7EcfuCdkZ1laFtDGB1uqDY9ncqob/WfOP
         Ps42kCUx5xIJswYSIqi9s+zSOOi1AQiT0AWN98S2jVXE86j+3j2sshI0gUlTYwwq/wII
         3y2cURBEhCIaGMRazxgXyuVGqQ3qij30rWG087qN2qGrJxH53Dmfov1kpDEsT4+FcBtp
         ppF2+Dga3i8V7HEWZdXfXbYB2chfRjurkiuoZoJn6lVNCdx7fBPb1dMEJdOeNY0NGPcd
         3V2y4pijoCQrc0yAaIbn3kMQD/1KKJ5NNbf87WRTm2V1l/6r/CRQ9PUQdA5Chp1sDHcE
         nR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775478575; x=1776083375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVGbCMH/4RaBYpWdStQuD12WoEB4gXcivhmDJ7c/+A4=;
        b=CS26B4ti5Vhvp5+fyl92vr2pyelhPcVNLumXLQEPOtPfoEyJQGvKYzphYo66vVFvtX
         LqDijFsPzmQA7jHakCG6EWrLuQeYg0LKO8BLtAiiLOLLhDWitsI2c32qwWo1STKCVZHa
         4j1H5VF6k8puPb4mLykUCj5SmXS5LYrngrjNr6fIow5ankczVutmKQfkkjDgcKUHIbqE
         rb+VpIJTknWZ0NN8p0kRa1DebomQe7aDVacw7cNPkFfCd+1Ng2NZQfkMabje3elS9LTo
         amWaT3a3BDbqFSwqIvO2Odbi+raxIpJpCuzDyCJXK2iuocvt3TIBXuJvPOUssHmlJKti
         YBTw==
X-Gm-Message-State: AOJu0YxfzzUBrS9axdlZM+QiBn/b6TXxYgtYFNmIvbgJ3mWX2I61NK5P
	0HCXuT9CnakgPcQOH00p180CRIj9GK+dCPIJ0uGjGsrF2iyXMvrOzxx2o10NPUSo07XcXIpVxpl
	1b1kLyWVYNPEX8NNC+Qjp61lOdY1tzElzb7NEYwnbo9I3T1ZgThbsYuE=
X-Gm-Gg: AeBDiesX1KOuws/oh+jZQsjJy7NAGXWKOG38PVFUwiPXsXIMephX1r1ape8XFOJeTWN
	NFWSo8rWjl5TRyl3k7327NQoEhsNOaWoFSz+YfxeXHh9/dC1qwKLl43WqPWzaYSOfXvy0BzdplX
	5MrBIgzXJxNli4wqD6s7JKIf8rayQYy2BkoaK6YiTYETlMjECr67KiuCHLNITW2/a4q2f402DD6
	qpqDHfCDZoIMJ+cN+5b/1b1FI4yfs5OhDUQly9/6YBeKGAm8DI782GhfFxngNhCC7r2TZEOA2cn
	dUNoFXvuLdR7soDYt3b7VujSsI8eZKcdxTiwV1zIhUIEcibzgrhFiKSzudosYgKdQ+IImTIQhFU
	srToB3UxU2btKDbv3XX3kkK8E3SM25focN+p7gA==
X-Received: by 2002:a05:6820:4c14:b0:67e:2fe1:2764 with SMTP id
 006d021491bc7-68220d45202mr6188049eaf.36.1775478575400; Mon, 06 Apr 2026
 05:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260306094425.1918-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260306094425.1918-1-cp0613@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Apr 2026 17:59:24 +0530
X-Gm-Features: AQROBzAOIdF4N_N_hwJIbjKqstdjlC1G7wEb1U9upSpG6uzE1RsjJVadD29e1YM
Message-ID: <CAAhSdy3qxWLMc997bsbmW=baKR5ykNSr+p6kVjwB-8QuNf2Vbg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add string test to SBI unit test suite
To: cp0613@linux.alibaba.com
Cc: opensbi@lists.infradead.org, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_052937_325539_BC21BC68 
X-CRM114-Status: GOOD (  11.62  )
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

T24gRnJpLCBNYXIgNiwgMjAyNiBhdCAzOjE04oCvUE0gPGNwMDYxM0BsaW51eC5hbGliYWJhLmNv
bT4gd3JvdGU6Cj4KPiBGcm9tOiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+
Cj4gVGhlIHN0cmluZyB0ZXN0cyB3ZXJlIGFkZGVkIHRvIHRoZSBTQkkgU0JJIHVuaXQgdGVzdCBm
cmFtZXdvcms7IHRoZW4sCj4gaXQgd2FzIGRpc2NvdmVyZWQgdGhhdCB0aGUgaW1wbGVtZW50YXRp
b24gb2Ygc2JpX3N0cmNociB3YXMgbm90IGFsaWduZWQKPiB3aXRoIHRoZSBDIHN0YW5kYXJkIGJl
aGF2aW9yLCB3aGljaCB3YXMgZml4ZWQgaW4gdGhlIHNlY29uZCBwYXRjaC4KPgo+IENoZW4gUGVp
ICgyKToKPiAgIGxpYjogdGVzdHM6IEFkZCB0ZXN0IGZvciBzdHJpbmcKPiAgIGxpYjogRml4IHNi
aV9zdHJjaHIgdG8gY29ycmVjdGx5IGhhbmRsZSBudWxsIHRlcm1pbmF0b3Igc2VhcmNoCj4KPiAg
bGliL3NiaS9zYmlfc3RyaW5nLmMgICAgICAgICAgICB8ICAxMSArLQo+ICBsaWIvc2JpL3Rlc3Rz
L29iamVjdHMubWsgICAgICAgIHwgICAzICsKPiAgbGliL3NiaS90ZXN0cy9zYmlfc3RyaW5nX3Rl
c3QuYyB8IDM3MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNo
YW5nZWQsIDM4MCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgbGliL3NiaS90ZXN0cy9zYmlfc3RyaW5nX3Rlc3QuYwo+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgc2VyaWVz
IHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
