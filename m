Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65758606D802
	for <opensbi@archiver.kernel.org>; Wed,  4 Nov 2026 06:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R+Q1kv18;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=jIEgrO+G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GEIyWKrYqU7Q5CC8JK2MbcxepP9ki5oRZXL/L+1hB4k=; b=R+Q1kv18oVQC6rccBKHF/Ycfbw
	Ro7iUzhPMWRIu4EWqCsYtYLgWN2vjOypjHK+pohYQSzkxVPB7A1VVBMkMwQWCaAaD3Bo+chf2syfz
	ebrWb23T6u/hvDoRe8pshMxEaV2EHXQFIHbnBlZlFU91xojn7GKw1BfzgB5dmI+P/rUziF8zUs4O7
	ClMeTCyT/ktOrDvaq1XLsmtEeAyxVSXkx5JvI/t+9B0adxuDL2A0WeMcHAPNCO45o32WC5RjVMZxK
	LlE4miEf6rTm6TSIvB4V54p3GPs6lqdz+2FqAhJzU0Vkocq/jo/tW2U9h8VR3L+mi0iQYtBjxUzSZ
	3pjg+fWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUYQ-00000004QZc-11Aj;
	Wed, 04 Nov 2026 06:33:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUYN-00000004QZ1-0MlS
	for opensbi@lists.infradead.org;
	Wed, 04 Nov 2026 06:33:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so2231915e9.0
        for <opensbi@lists.infradead.org>; Tue, 03 Nov 2026 22:32:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793773977; cv=none;
        d=google.com; s=arc-20260327;
        b=AFA32DYPhRs5vsc2cm7CGQ+cfCk8dUDtWLDkt3BMLjfkTov6JmKmuRgg7+DKK+QOMK
         o7qZclRxqp5HA0BH7VZMt1QkvpcEHnDVfJD5Tjq5VFzvXmIerEizJk4zKQ1AqxkngX2d
         Caf9dD/MJGBRQNli7alvoGo67iU+hGNd6/0jG8FKxBIHpuk5DOmnpoy8v8bpd+1hkwfH
         TLr1xHXn7z83T36dx8UKCugXNNUhTwHEx9QWxld8HYnaqNbxNl8+GMaESQNJJOL9Q8e1
         S3pXdLB4l5prqe3CSMc2pzxCifjrfA434ldQWBTC4qWVdmXVf8gt8qLh26KkWLm+BYy2
         ebeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71AT/xcszoN+CxVJQb1LeecgLwxMNu4QoKSXon0mNa0=;
        fh=xBG9/dk2bDnM3j5INsYwtAuuXRV2IJpLgYj2k6GbpX0=;
        b=CijmAdBHSMAGchVc6ozqT1TF6yJknOD6ysy3DxMAqN+eZGV0rfCYoGqOeKEmhatADZ
         PGfy/jRCOvws9XI77u+xRTFPhrx8Lj6zkM6cHxquRjDF49bV7xVv3mqi9WGu7KCBFSra
         0f79TA+FE9Off5mwPBoFk57aZ4QhSGD0+DocNOVdeVmESUU3/T47Exel7HWQJUzVE1uN
         vV08rQosgyJHmL0STwnfe98oKDr7Iy2GWhajV6ROROIqnHYwhU4StHIjZj0sfxwo2Byc
         9SoF5fBb53GtDKZnCFjgHQUibxbwzZqqVrWJ6TAEeMs2/yIPASKa02aT64sothsoSPVs
         0G/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793773977; x=1794378777; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71AT/xcszoN+CxVJQb1LeecgLwxMNu4QoKSXon0mNa0=;
        b=jIEgrO+GTiOgvT+h9vpTFU8NSZbl+9YW9Py1sCaloLHhHI7BSDwsZC+OOAXSJLBPDn
         r67XxBfi4AWmuhxhF6BBXx2s8mXNsxsys767ALNpBxD4//UAYC3vGtluY9VbW3o6O76P
         heujRuaB/lL7+LHJv3SjezfuBQXSRCZr7xnxg6rHQrmF+LJfQfe838MUcntLPS1FY1Bq
         ZLfRRRmpVV2Y28Vgq/Vy3dbegaVevbrrWibWWq/NDECGfIYWGgI9YaFcV8XkERjDRpiL
         pfOADvQ00KvMWmMi24ITgDr2amBRJ6fe7hpKNpelKV44Fq/4zyaunllPvIIgjC/+R2jP
         1fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793773977; x=1794378777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71AT/xcszoN+CxVJQb1LeecgLwxMNu4QoKSXon0mNa0=;
        b=pum4u4NyRynSz5LMCrEAmwWl2Pxpl916IaQMK0S/vOsT4M0c5DMOUylnpPoKxMsJco
         Ni45TSIh86faUIAp6QvEY6QPBy0R3o0HQStI1UhguqzvAFaMejFV3eRGYHdjNDz4fGUN
         0aWz/kGQEiWRFa94PgGLo7rwm9DdhGdnpaJ6MzVqVZJHggzDvufJlP7vr8KwC7PGTMD9
         IFDvahid61pbpto9fgT2AgYPxsxusRvy5OHferXC1yJWiGjBpBOFMBTHC0qMp5Bcpm8F
         yOWx7z/1dHFPkscbHEJq7vhXPqp7dEZhHcBGmM+KPqIZNHzUPX5GWUJ8SStFCE3Y3qI4
         pczg==
X-Gm-Message-State: APuU4Z8CnzUrtAKQ4AqyoVI5jTjucbqmNDrIOddXwMhpZMu0LNp506k9
	fXPGwfiNG1Ff/K+uBKhAOSf/n2CsJvi/EkCZmf44q9ZXq6Yjx5O6YeNneKz9ncfpXuV7Lqw/7Ur
	PoC6rv399C1z+Ul/U2qQeO/2Lcpw70H05ZfkmNnUmWPeJIA5D4w4M
X-Gm-Gg: AYBFou3YqxxBTT34o13WvpYF3UuQ0CupHKUdwPe4curJZNohqOq9qm+ZV9xxpPEFoYy
	Tak1Q1LIPH4MG4IEnBo24mYn9axil/8DLRTDe1uTHXQ2ZPQItRKG33tLK5SBJ1I18eNSFM2q2hf
	AX2DtJPkAX+XxqTGrWs0bwTC/gb+cJv41znmEhegPy4aJNxHszsu/QKumvbwv3z4O6CTQoJpZlW
	uLxcqJL7FIhmN1ckYp9mff7xscJKOCfSyYALi1gjcDGNH8vGnzpokElQvk1C2tNj3q23syK/Bfv
	/bFkQWrxKPcBstYIbrSD7989O9yv84at3zu8c3fK1HZ0a4KZytAt4p0pZKYjBRSgPIAn98OjYNn
	K349IGecQHDbpsAwPcTTuEUC2tW33c0qnfb/W/WMGhjEYegIiQMKWuCGctIxv5Q7Hb+SLWgGmS9
	hNvT3VoD1Mjr+6zChE5HZiPX68fNSzk+VnaVO8kLdwDkWTQOLmw/1e140=
X-Received: by 2002:a05:600c:c4b8:b0:4a0:1b14:e283 with SMTP id
 5b1f17b1804b1-4ac150b38dbmr359962145e9.1.1793773976969; Tue, 03 Nov 2026
 22:32:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021094243.2395130-1-liwen.wu@spacemit.com>
In-Reply-To: <20261021094243.2395130-1-liwen.wu@spacemit.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Nov 2026 12:02:45 +0530
X-Gm-Features: AclHuK943vbMXAApbmQ7830fkqP5IoVoGY57eVE4J5VIMMsqPEO5hkNncvpdXKg
Message-ID: <CAAhSdy2vSx=G3vcGXXHsvDfZUaJkbNvvYN4L3tkbCOVqYjHU1A@mail.gmail.com>
Subject: Re: [PATCH] include: mailbox: correct RPMI CPPC request field ordering
To: wuliwen <liwen.wu@spacemit.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_223259_159386_DC163ED1 
X-CRM114-Status: GOOD (  20.14  )
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

T24gV2VkLCBPY3QgMjEsIDIwMjYgYXQgMzoxM+KAr1BNIHd1bGl3ZW4gPGxpd2VuLnd1QHNwYWNl
bWl0LmNvbT4gd3JvdGU6DQo+DQo+IFBlciB0aGUgUlBNSSBzcGVjaWZpY2F0aW9uLCBDUFBDX1BS
T0JFX1JFRywgQ1BQQ19SRUFEX1JFRywgYW5kDQo+IENQUENfV1JJVEVfUkVHIHJlcXVpcmUgUkVH
X0lEIGluIHdvcmQgMCBhbmQgSEFSVF9JRCBpbiB3b3JkIDEuDQo+DQo+IFRoZSBjdXJyZW50IHJl
cXVlc3Qgc3RydWN0dXJlcyBoYXZlIHRoZXNlIGZpZWxkcyBzd2FwcGVkLCBjYXVzaW5nDQo+IGlu
Y29tcGF0aWJpbGl0eSB3aXRoIHNwZWMtY29tcGxpYW50IFJQTUkgc2VydmVycy4NCj4NCj4gU3dh
cCB0aGUgZmllbGRzIHRvIG1hdGNoIHRoZSBzcGVjaWZpY2F0aW9uLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiB3dWxpd2VuIDxsaXdlbi53dUBzcGFjZW1pdC5jb20+DQoNClRoYW5rcyBmb3IgY2F0Y2hp
bmcuIEEgRml4ZXMgdGFnIGlzIG1pc3NpbmcgaGVyZSB3aGljaA0KSSB3aWxsIGFkZCBhdCB0aGUg
dGltZSBvZiBtZXJnaW5nLg0KDQpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4NCg0KQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8u
DQoNClRoYW5rcywNCkFudXANCg0KPiAtLS0NCj4gIGluY2x1ZGUvc2JpX3V0aWxzL21haWxib3gv
cnBtaV9tc2dwcm90LmggfCA2ICsrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpX3V0aWxz
L21haWxib3gvcnBtaV9tc2dwcm90LmggYi9pbmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlf
bXNncHJvdC5oDQo+IGluZGV4IDdhZTRhYmUwLi40OGY2YWM2MSAxMDA2NDQNCj4gLS0tIGEvaW5j
bHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaA0KPiArKysgYi9pbmNsdWRlL3Ni
aV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oDQo+IEBAIC01MzksOCArNTM5LDggQEAgZW51
bSBycG1pX2NwcGNfc2VydmljZV9pZCB7DQo+ICB9Ow0KPg0KPiAgc3RydWN0IHJwbWlfY3BwY19w
cm9iZV9yZXEgew0KPiAtICAgICAgIHUzMiBoYXJ0X2lkOw0KPiAgICAgICAgIHUzMiByZWdfaWQ7
DQo+ICsgICAgICAgdTMyIGhhcnRfaWQ7DQo+ICB9Ow0KPg0KPiAgc3RydWN0IHJwbWlfY3BwY19w
cm9iZV9yZXNwIHsNCj4gQEAgLTU0OSw4ICs1NDksOCBAQCBzdHJ1Y3QgcnBtaV9jcHBjX3Byb2Jl
X3Jlc3Agew0KPiAgfTsNCj4NCj4gIHN0cnVjdCBycG1pX2NwcGNfcmVhZF9yZWdfcmVxIHsNCj4g
LSAgICAgICB1MzIgaGFydF9pZDsNCj4gICAgICAgICB1MzIgcmVnX2lkOw0KPiArICAgICAgIHUz
MiBoYXJ0X2lkOw0KPiAgfTsNCj4NCj4gIHN0cnVjdCBycG1pX2NwcGNfcmVhZF9yZWdfcmVzcCB7
DQo+IEBAIC01NjAsOCArNTYwLDggQEAgc3RydWN0IHJwbWlfY3BwY19yZWFkX3JlZ19yZXNwIHsN
Cj4gIH07DQo+DQo+ICBzdHJ1Y3QgcnBtaV9jcHBjX3dyaXRlX3JlZ19yZXEgew0KPiAtICAgICAg
IHUzMiBoYXJ0X2lkOw0KPiAgICAgICAgIHUzMiByZWdfaWQ7DQo+ICsgICAgICAgdTMyIGhhcnRf
aWQ7DQo+ICAgICAgICAgdTMyIGRhdGFfbG87DQo+ICAgICAgICAgdTMyIGRhdGFfaGk7DQo+ICB9
Ow0KPiAtLQ0KPiAyLjM0LjENCj4NCj4gVGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudCBh
cmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYmUgcHJpdmlsZWdlZCBvciBvdGhlcndpc2UgcHJvdGVj
dGVkIGZyb20gZGlzY2xvc3VyZS4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50
IG9mIHRoaXMgbWVzc2FnZSwgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgYW55IGF0dGFjaG1lbnQgZnJv
bSB5b3VyIHN5c3RlbSBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYnkgcmVwbHkg
ZS1tYWlsLiBVbmludGVuZGVkIHJlY2lwaWVudHMgc2hvdWxkIG5vdCB1c2UsIGNvcHksIGRpc2Ns
b3NlIG9yIHRha2UgYW55IGFjdGlvbiBiYXNlZCBvbiB0aGlzIG1lc3NhZ2Ugb3IgYW55IGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UuIEVtYWlscyBjYW5ub3QgYmUgZ3VhcmFu
dGVlZCB0byBiZSBzZWN1cmUgb3IgZXJyb3IgZnJlZSBhcyB0aGV5IGNhbiBiZSBpbnRlcmNlcHRl
ZCwgYW1lbmRlZCwgbG9zdCBvciBkZXN0cm95ZWQsIGFuZCB5b3Ugc2hvdWxkIHRha2UgZnVsbCBy
ZXNwb25zaWJpbGl0eSBmb3Igc2VjdXJpdHkgY2hlY2tpbmcuDQo+DQo+IOacrOmCruS7tuWPiuWF
tuS7u+S9lemZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOW5tuWPr+iDveWPl+WFtuS7luS/neaK
pOaIluS4jeWFgeiuuOiiq+aKq+mcsue7meesrOS4ieaWueOAguWmgumYgeS4i+ivr+aUtuWIsOac
rOmCruS7tu+8jOaVrOivt+eri+WNs+S7peWbnuWkjeeUteWtkOmCruS7tueahOaWueW8j+mAmuef
peWPkeS7tuS6uu+8jOW5tuWwhuacrOmCruS7tuWPiuWFtuS7u+S9lemZhOS7tuS7jumYgeS4i+ez
u+e7n+S4reS6iOS7peWIoOmZpOOAguWmgumYgeS4i+W5tumdnuacrOmCruS7tuWGmeaYjuS5i+aU
tuS7tuS6uu+8jOaVrOivt+WIh+WLv+S9v+eUqOOAgeWkjeWItuOAgeaKq+mcsuacrOmCruS7tuaI
luWFtuS7u+S9leWGheWuue+8jOS6puivt+WIh+WLv+S+neacrOmCruS7tuaIluWFtuS7u+S9leWG
heWuueiAjOmHh+WPluS7u+S9leihjOWKqOOAgueUteWtkOmCruS7tuaXoOazleS/neivgeaYr+S4
gOenjeWuieWFqOWSjOS4jeS8muWHuueOsOS7u+S9leW3rumUmeeahOmAmuS/oeaWueW8j++8jOWP
r+iDveS8muiiq+aLpuaIquOAgeS/ruaUueOAgeS4ouWkseaIluaNn+Wdj++8jOaUtuS7tuS6uumc
gOiHquihjOi0n+i0o+WBmuWlveWuieWFqOajgOafpeOAgg0KPiAtLQ0KPiBvcGVuc2JpIG1haWxp
bmcgbGlzdA0KPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpDQotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
