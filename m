Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87141C83F27
	for <opensbi@archiver.kernel.org>; Tue, 22 Jul 2025 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTA28gCTVkgWF/oGszUClfyBw59HS4MeT0gAus7Puuc=; b=1qcaips3y56zKm
	ZNbFySy8SA4lKINqqUG4pYerRoPWzpl/iYy+sZF17MUH5LI3LhjrT0lCZnWZWpW6PNIJImmJ6gscF
	oa4GjCN1nFow/w0OmDR0FKNAJKNmqj6lmcmL99LCvQPruyAoTL8AjrdOLyzoikd7xNx9u0C6vcSnk
	75qYbYLyEN2eSZwL9JXFHWuN6linT/mOwdsOAuaurHuvf8AQ7udFKhELX/fCJKFkUwskDC8zBYaDH
	AbVaC5UXhtcd/OafYeubPJLntc8qNgX6Ruvegc2uhmSdObK32EvlcqSjeAFsSiM/cbq7T24ooPGUp
	rYYuZ4i5AdWSG6nhemBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAjk-00000002DL8-3iDI;
	Tue, 22 Jul 2025 11:00:44 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAW2-00000002Bq1-3s0Z
	for opensbi@lists.infradead.org;
	Tue, 22 Jul 2025 10:46:36 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-87c070b2dfbso156614739f.3
        for <opensbi@lists.infradead.org>; Tue, 22 Jul 2025 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753181194; x=1753785994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kywzok7RQcsyayiYABnhQw4sK1tReIyq6svh/qEuAhA=;
        b=dwEYdYfLNrg5o9PeLXLaAfEBOLBxjv3K86Z/p9ndlOt/NLZZbaatVXGbnXchldGp3P
         6U5eNBbmy7MXeY6Lja7/HEUD5bS08yJuigIETp+urrohnu/4ZD0Q/xZ/GANkNVIiTUCB
         kokTHnRFyHOfiSpiLn3+669TdlC7vHI978zPILtPDjlCZSxjiXdF0M0vlyjCR7n14EbO
         oHW71B0ylVe25O91oIbMF3fqiPXFeEJ1yQ0NBbfBeguW7qF+bVIb1I5q6rxK7Eq+lcgQ
         8jKIhq0Kyb+5lthnFJJkRi1PIkGbYcY5b2G2D2sYgO9D1N8itgSjICQoslInHXPvCEoc
         ZLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753181194; x=1753785994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kywzok7RQcsyayiYABnhQw4sK1tReIyq6svh/qEuAhA=;
        b=jQnP8V3KBockR6E65NOaLUjCrp+BV6nuvY1+RFMOiJzMgAkoYkoZ5Aq0CA8zFm6e4g
         Om3vYZIcM1oZ69oy2lLKI4UwtKSU7ZXZw3kVd0TyTfDMpjtAN+s2OZeoQY8UEspU74eI
         hV2lSLY8F8exGY65sb7dKYilkOD0ZY9lc9MzS+achkWKx7lyWFWoGKBhwN0U2BMGe+hx
         zvro6Wf2ctesksU5wBmagPPLZAXP2rBPsUkwBYUaW6CPlZca9e/VxrmY0GRm9WA4TuT+
         rH0jEMsL82Y/sU47uPwS7eX2KKr4qOVqiTFuGXKmv20SoFb8eDs8ZWekgWMeHL9jD4Rk
         ZsXA==
X-Gm-Message-State: AOJu0Ywf/Iybi/FOPQmEeE/POLXH3S9pQAZxi4BkVDnIe4SAbziFj2Js
	TyY3FW4qakapVX/Vs3zLgBtXgbg/nTXFTuiYTo2DluGHpn331yqKqXGyPNxjKtDLTUQsDpm++Al
	QeVg+K0DxdFKDdNprBVMcIT3F/cIgtWL4vzbtGMe9sg==
X-Gm-Gg: ASbGncsSD1qmrHAsYl9SI6II28FQJvmL5AliBfgwO1KiYyQ57rJcQzxogK4HwlWxTco
	+H2dkKG7zPkz06OZ1eBUm3wmz+agavF3BLKbDMh2OUwWbQYuInmbv7H0gMqBcs/iSOM7Ohmrcvs
	IaM/1VqhNZpggbO+bF5tlaIUKFq8FFRNpVFcvUhFoa4fHJr9fUT5b2JjAeQ+JYbBWnniw0QVoGa
	/H/Vh4=
X-Google-Smtp-Source: AGHT+IG+4GLwo04sz9wkTtGr6ziT7LfTIANDCc+icdzCmWEo8BWXCes3hs8ZvE1UZuKai0KIKybmdrssUlAdPyQWnnM=
X-Received: by 2002:a05:6e02:1545:b0:3e2:a438:f9b with SMTP id
 e9e14a558f8ab-3e2a4381028mr188255205ab.22.1753181193901; Tue, 22 Jul 2025
 03:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250709232932.37622-1-jrtc27@jrtc27.com> <20250709232932.37622-2-jrtc27@jrtc27.com>
In-Reply-To: <20250709232932.37622-2-jrtc27@jrtc27.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Jul 2025 16:16:22 +0530
X-Gm-Features: Ac12FXwZa9oiz_LsxykRL8UfDxftl7XEW1QKv6qotu-8AhMht1kzH1mlqPgJFZ0
Message-ID: <CAAhSdy39f5+XbghEyZkR50zCM+qpUYsyZnK6_cwV3M9v8CK42g@mail.gmail.com>
Subject: Re: [PATCH 2/3] firmware: Replace sole uses of REGBYTES with __SIZEOF_LONG__
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_034634_959685_3AF465A4 
X-CRM114-Status: GOOD (  22.14  )
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

T24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgNDo1OeKAr0FNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdA
anJ0YzI3LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGNvZGUgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCB0
aGUgSVNBJ3MgcmVnaXN0ZXJzLCBpdCdzIGFib3V0IHRoZQo+IGZvcm1hdCBvZiBFTEYgcmVsb2Nh
dGlvbnMuIEFzIHN1Y2gsIF9fU0laRU9GX0xPTkdfXywgYmVpbmcgYSBsYW5ndWFnZSAvCj4gQUJJ
LWxldmVsIHByb3BlcnR5LCBpcyBhIG1vcmUgYXBwcm9wcmlhdGUgY29uc3RhbnQgdG8gdXNlLiBU
aGlzIGFsc28KPiBtYWtlcyBpdCBlYXNpZXIgdG8gc3VwcG9ydCBDSEVSSSwgd2hlcmUgZ2VuZXJh
bC1wdXJwb3NlIHJlZ2lzdGVycyBhcmUKPiBleHRlbmRlZCB0byBiZSBjYXBhYmlsaXRpZXMsIG5v
dCBqdXN0IGludGVnZXJzLCBhbmQgc28gdGhlIHJlZ2lzdGVyIHNpemUKPiBpcyBub3QgdGhlIHNh
bWUgYXMgdGhlIG1hY2hpbmUgd29yZCBzaXplLiBUaGlzIGFsc28gaGFwcGVucyB0byBtYWtlIGl0
Cj4gbW9yZSBjb3JyZWN0IGZvciBSVjY0SUxQMzIsIHdoZXJlIHRoZSByZWdpc3RlcnMgYXJlIDY0
LWJpdCBpbnRlZ2VycyBidXQKPiB0aGUgQUJJIGlzIDMyLWJpdCAoYm90aCBmb3IgbG9uZyBhbmQg
Zm9yIHRoZSBFTEYgZm9ybWF0KSwgdGhvdWdoCj4gcHJvcGVybHkgc3VwcG9ydGluZyB0aGF0IEFC
SSBpcyBub3QgcGFydCBvZiB0aGUgbW90aXZhdGlvbiBoZXJlLCBqdXN0IGEKPiBjb25zZXF1ZW5j
ZSBvZiBpbXByb3ZpbmcgdGhlIGNvZGUgZm9yIENIRVJJLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmVz
c2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSBy
aXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGZpcm13YXJlL2Z3X2Jh
c2UuUyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZmlybXdhcmUvZndfYmFzZS5TIGIvZmlybXdhcmUv
ZndfYmFzZS5TCj4gaW5kZXggMjQ5ODc5Ny4uYWE4ZTI2NCAxMDA2NDQKPiAtLS0gYS9maXJtd2Fy
ZS9md19iYXNlLlMKPiArKysgYi9maXJtd2FyZS9md19iYXNlLlMKPiBAQCAtODAsMTcgKzgwLDE3
IEBAIF9zY19mYWlsOgo+ICAgICAgICAgbGxhICAgICB0MSwgX19yZWxfZHluX2VuZAo+ICAgICAg
ICAgYmVxICAgICB0MCwgdDEsIF9yZWxvY2F0ZV9kb25lCj4gIDI6Cj4gLSAgICAgICBSRUdfTCAg
IHQ1LCBSRUdCWVRFUyh0MCkgICAgICAgIC8qIHQ1IDwtLSByZWxvY2F0aW9uIGluZm86dHlwZSAq
Lwo+ICsgICAgICAgUkVHX0wgICB0NSwgX19TSVpFT0ZfTE9OR19fKHQwKSAvKiB0NSA8LS0gcmVs
b2NhdGlvbiBpbmZvOnR5cGUgKi8KPiAgICAgICAgIGxpICAgICAgdDMsIFJfUklTQ1ZfUkVMQVRJ
VkUgICAgLyogcmVsb2MgdHlwZSBSX1JJU0NWX1JFTEFUSVZFICovCj4gICAgICAgICBibmUgICAg
IHQ1LCB0MywgM2YKPiAgICAgICAgIFJFR19MICAgdDMsIDAodDApCj4gLSAgICAgICBSRUdfTCAg
IHQ1LCAoUkVHQllURVMgKiAyKSh0MCkgIC8qIHQ1IDwtLSBhZGRlbmQgKi8KPiArICAgICAgIFJF
R19MICAgdDUsIChfX1NJWkVPRl9MT05HX18gKiAyKSh0MCkgICAvKiB0NSA8LS0gYWRkZW5kICov
Cj4gICAgICAgICBhZGQgICAgIHQ1LCB0NSwgdDIKPiAgICAgICAgIGFkZCAgICAgdDMsIHQzLCB0
Mgo+ICAgICAgICAgUkVHX1MgICB0NSwgMCh0MykgICAgICAgICAgICAgICAvKiBzdG9yZSBydW50
aW1lIGFkZHJlc3MgdG8gdGhlIEdPVCBlbnRyeSAqLwo+Cj4gIDM6Cj4gLSAgICAgICBhZGRpICAg
IHQwLCB0MCwgKFJFR0JZVEVTICogMykKPiArICAgICAgIGFkZGkgICAgdDAsIHQwLCAoX19TSVpF
T0ZfTE9OR19fICogMykKPiAgICAgICAgIGJsdCAgICAgdDAsIHQxLCAyYgo+ICBfcmVsb2NhdGVf
ZG9uZToKPiAgICAgICAgIC8qIEF0IHRoaXMgcG9pbnQgd2UgYXJlIHJ1bm5pbmcgZnJvbSBsaW5r
IGFkZHJlc3MgKi8KPiAtLQo+IDIuMzQuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0
Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3Bl
bnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQo=
