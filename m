Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E7FC369AB
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 05:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNAwQIBWhgVJCEG/hiJLFWOT3c1VcBfkRjmerAXPPXU=; b=v+LE7+LyijXjod
	zFVQMxAAmWoCeSoFFJ8oa2xWKVNJC3WFJFXZB7GuPGehz+g3B+d7DXcrRow8PaRn5HyV4QPhHml+1
	ZJBQjhsDJIptK3YFWG5DHDOz7qjnueJAu8PLX/7ZOA0s3ZnBmX4aNDldNK5wUfDATST3jsCU5gQz5
	U6y2WFVs4a3PIh7NGd0y8c/n56nRNboqWnP3AikJsRHTtiwCFdi1SrXIokdnVTbQbLvIe6SoSqTHk
	2F4/oaqevCEhHx5Tgwe/WXonRxCPdhRz1/jvUoSkwNaQXa1pJJtvYaboUDL1J0RL3zbPFyru8FSdf
	Kaau1G0MSvXd01zz+EaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YRi-00000004Vv2-3y44;
	Tue, 15 Apr 2025 05:02:54 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YJT-00000004USz-1uTA
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 04:54:25 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d439dc0548so17217025ab.3
        for <opensbi@lists.infradead.org>; Mon, 14 Apr 2025 21:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1744692862; x=1745297662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28rTqY+3Hdhm7hRlTLbh8G/PJzJJ3x3IOoUUYoft8hs=;
        b=yWoqs7nkQapL1s2cFQ0ykHMGlGjxeV51WRSz5Xd2Gxm1wIKx5re/m8QKN8VDQUuN1S
         GVod3ZP5etSkOFoAHiMHGd2jLHds81HHNFogmA2gv3iJLAYrGOIIQZfx76eXXJHpbNpT
         jZD6O4/ZYlbssVznWusXPLMefNUfAfMAtFMS1YEm5AmVWobYePXAjtxETt8CNskMDzNx
         Jq5phsQqUmoGyYuTIQKa7bAqYsWv3CluJQ4YikH2hEKfy0gmeUvUyxcUGuFgH3EpwgQE
         COhnlif8yjdBu+DYPpvkLxenFxylL3tI1+cVETx4lI07WijW+q0jtYV9JBj8LoG0Oga6
         5ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744692862; x=1745297662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28rTqY+3Hdhm7hRlTLbh8G/PJzJJ3x3IOoUUYoft8hs=;
        b=LplY6+PuyYSzfpa5MZM77oPj1KL7YVaKDbaAOQUH1wAKu8CNnA2YwiQkSHVP5aLMkj
         DJc9DPib7w0Q3D4yqltWZA72F6SBQgYX07tW3SrOoDNLeKcB1ZT5m/7fn97Lv8ROltVt
         I2jQZ1+gPESfNmQa8hLY4RFqEgPgCO40K09hHKFexj8WCvRow90nYdgYADI6gQwwh2s+
         E8nV6Ud+fOecVkEwPZb3hL6VsvcAuCIYfzdAs0tbRO4oFHYm8ojY3f6fMNXMmEtDhncR
         FJvdOwjlFY+jd1V+gpBIzx6oBlN71CeiANdiQh01GC0a5YTJSmETWxYz8N4W9VIwNK65
         6NHg==
X-Gm-Message-State: AOJu0YxN+K+c4IzAc4xvbtUFQXQ2QnUDjywhf8s02T6Q/I9//TkV1jBg
	apCFYBMYJy/HHyTuBUBpaBXHch4oDW3CNj5eUqghl7zM5+grefkoZU2BFtOu9ds+ILBWRzilU72
	BiMguOPKPTgsLc/VKxbspoyV6rvDlvsD6ALtkldnMe9S3mTAbG4NXH8+d
X-Gm-Gg: ASbGncsbPI6JjapTUWL1eJvhdLdSOXx0Vi9a6hOCncvqaUCobHnJrgC7hXpR6dLi/Zl
	1GEDsxWwfB80yRH3Tl0WaH/PHYxNYltBHK+HLK3UEJNrDJSxQq47+56UfpXY9LUzNoClng8bqD1
	WSWeH00cI8uSl4Vli2ZHvTwqU=
X-Google-Smtp-Source: AGHT+IG+sd/H6cM2dWbMOBx0Fru90CJJ4EvuQnZrLkQkEQcI7OUxYDEUZ8jxM+oPuHyV76GFT+XrTIRRUZ/ROYf4Hr8=
X-Received: by 2002:a05:6e02:3993:b0:3d2:b0f1:f5bd with SMTP id
 e9e14a558f8ab-3d7ec1ca08fmr167899015ab.3.1744692862268; Mon, 14 Apr 2025
 21:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250319123719.504622-1-wxjstz@126.com>
In-Reply-To: <20250319123719.504622-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Apr 2025 10:24:10 +0530
X-Gm-Features: ATxdqUG-0UiUPROURriamSLwSUUdIqkxMAAHwBLDDpZc3yxKTKcOpKXrVZvNAzM
Message-ID: <CAAhSdy1N4Mh0pk_0tw0rERNuqLSZysY9fpkEMhZUcb9KcS3iWg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: sbi_mpxy_set_shmem adds parameter check
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_215423_762076_57AA80C7 
X-CRM114-Status: GOOD (  19.05  )
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

T24gV2VkLCBNYXIgMTksIDIwMjUgYXQgNjowN+KAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IFNoYXJlZCBtZW1vcnkgbmVlZHMgdG8gYmUgYWNjZXNzZWQgaW4gTS1Nb2Rl
LCBhbmQgdGhlIGhpZ2ggYWRkcmVzcyBvZgo+IHBoeXNpY2FsIG1lbW9yeSBzaG91bGQgYmUgMAoK
VGhlIHBhdGNoIHN1YmplY3QgYW5kIGRlc2NyaXB0aW9uIG5lZWRzIHRvIGJlIGltcHJvdmVkIGJ1
dCBJIHdpbGwgdGFrZSBjYXJlCm9mIGl0IGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcgdGhpcyBwYXRj
aC4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZyBXIDx3eGpzdHpAMTI2LmNvbT4KPiAtLS0KPiAg
bGliL3NiaS9zYmlfbXB4eS5jIHwgMTQgKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9tcHh5LmMgYi9s
aWIvc2JpL3NiaV9tcHh5LmMKPiBpbmRleCBjNWQ5ZDFiYi4uN2Q0ZDI2YWIgMTAwNjQ0Cj4gLS0t
IGEvbGliL3NiaS9zYmlfbXB4eS5jCj4gKysrIGIvbGliL3NiaS9zYmlfbXB4eS5jCj4gQEAgLTI4
Nyw2ICsyODcsMjAgQEAgaW50IHNiaV9tcHh5X3NldF9zaG1lbSh1bnNpZ25lZCBsb25nIHNobWVt
X3BoeXNfbG8sCj4gICAgICAgICBpZiAoc2htZW1fcGh5c19sbyAmIH5QQUdFX01BU0spCj4gICAg
ICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfUEFSQU07Cj4KPiArICAgICAgIC8q
Cj4gKyAgICAgICAqIE9uIFJWMzIsIHRoZSBNLW1vZGUgY2FuIG9ubHkgYWNjZXNzIHRoZSBmaXJz
dCA0R0Igb2YKPiArICAgICAgICogdGhlIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgYmVjYXVzZSBN
LW1vZGUgZG9lcyBub3QgaGF2ZQo+ICsgICAgICAgKiBNTVUgdG8gYWNjZXNzIGZ1bGwgMzQtYml0
IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UuCj4gKyAgICAgICAqIFNvIGZhaWwgaWYgdGhlIHVwcGVy
IDMyIGJpdHMgb2YgdGhlIHBoeXNpY2FsIGFkZHJlc3MKPiArICAgICAgICogaXMgbm9uLXplcm8g
b24gUlYzMi4KPiArICAgICAgICoKPiArICAgICAgICogT24gUlY2NCwga2VybmVsIHNldHMgdXBw
ZXIgNjRiaXQgYWRkcmVzcyBwYXJ0IHRvIHplcm8uCj4gKyAgICAgICAqIFNvIGZhaWwgaWYgdGhl
IHVwcGVyIDY0Yml0IG9mIHRoZSBwaHlzaWNhbCBhZGRyZXNzCj4gKyAgICAgICAqIGlzIG5vbi16
ZXJvIG9uIFJWNjQuCj4gKyAgICAgICAqLwo+ICsgICAgICAgaWYgKHNobWVtX3BoeXNfaGkpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfUEFSQU07CgpUaGUgZXJyb3Ig
Y29kZSBzaG91bGQgYmUgU0JJX0VSUl9JTlZBTElEX0FERFJFU1MgdG8gYWxpZ24Kd2l0aCB0aGUg
U0JJIHNwZWMuIEkgd2lsbCBhZGRyZXNzIHRoaXMgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZyB0aGlz
CnBhdGNoLgoKPiArCj4gICAgICAgICBpZiAoIXNiaV9kb21haW5fY2hlY2tfYWRkcl9yYW5nZShz
YmlfZG9tYWluX3RoaXNoYXJ0X3B0cigpLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgU0hNRU1fUEhZU19BRERSKHNobWVtX3BoeXNfaGksIHNobWVtX3BoeXNfbG8pLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbXB4eV9zaG1lbV9zaXplLCBQUlZfUywKPiAtLQo+
IDIuNDcuMgo+CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
CkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApB
bnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
