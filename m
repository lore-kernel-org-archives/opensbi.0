Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36858606A331
	for <opensbi@archiver.kernel.org>; Wed, 21 Oct 2026 09:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MUPaAn3D;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=spacemit.com header.i=@spacemit.com header.a=rsa-sha256 header.s=feishu2303021642 header.b=IZaa6gHC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:From:Cc:To:Mime-Version:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZCDO9mpBO7MVud4Y2Ckkbb4zzgbUL7gSs0OnBxJkvwo=; b=MUPaAn3DqGX0e/
	GyQrmdggqn6pwcU6VfSgqFBXegt/2oyeI79Io4B5jso2WsSG74jXx7k/v6sN+RqGjKzWkD6ua2oQA
	dQh6GAIokpGX55fLaiEi3pMrTXv7Pz13s2rCRVKw0nmsXUbx02IRaJKsGSYaM5vhAHkfxo1QhdxwM
	C5zUMEGS3q+lF263OakrfVc8qRFe5bFWnWSh6znWNsWoFhvoU3ZB1rMcgww5Lggj0AHh7AdKn5gfj
	hw7hpVK2hMngu57elT7jphCrWFkyv1AhDaIHsPod8IddvPGT8p/RMZXJb5cMrlH9SlFmBqjYHgsYH
	alqvIMDK3GDFRyNz4T0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSqf-0000000BVue-1aqG;
	Wed, 21 Oct 2026 09:43:05 +0000
Received: from va-2-28.ptr.blmpb.com ([209.127.231.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSqd-0000000BVuC-0Fgp
	for opensbi@lists.infradead.org;
	Wed, 21 Oct 2026 09:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1792575771; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=TQvdD0XWukfF6dJMcFXnp8gKPjEbGdQqdxdEzgotwbs=;
 b=IZaa6gHCXeI+s5hpXBlGJKUx9LAhcEeJI63+5znxMAS/svLe4Wc2QIeJ9kVlTMYaZuPuYv
 XU3uV4/70957oIxTLsoTp2DiQ8yKWhCkIivFr7RjMIbwsfMEu/czCvgkHOF5BQnk+vMQLJ
 J7CKv8U2CO2gwgOo+AOgt7M1lvc0Qvm9ImQ4vxRukNsHF0kcHyJe7FN0I3cbT9IoVapvoa
 oYq15/oO9FlXknOG/stbpN17YmwOcF/QMQ+YY0ziKCTuAUqpRwL2apGOCOWM/XgkXvKECm
 pO6tciUwipqCoLWjNWCDmWEmJmi9MvqCdb55em4nslac1YDEImDqZXCxOYxdtQ==
Subject: [PATCH] include: mailbox: correct RPMI CPPC request field ordering
X-Original-From: wuliwen <liwen.wu@spacemit.com>
Date: Wed, 21 Oct 2026 17:42:43 +0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
To: <opensbi@lists.infradead.org>
Cc: "wuliwen" <liwen.wu@spacemit.com>
From: "wuliwen" <liwen.wu@spacemit.com>
X-Lms-Return-Path: <lba+26ad88918+62b240+lists.infradead.org+liwen.wu@spacemit.com>
Message-Id: <20261021094243.2395130-1-liwen.wu@spacemit.com>
X-Mailer: git-send-email 2.34.1
Received: from snode5.. ([120.237.158.181]) by smtp.feishu.cn with ESMTPS; Wed, 21 Oct 2026 17:42:47 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_024303_170109_F5C18F5F 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UGVyIHRoZSBSUE1JIHNwZWNpZmljYXRpb24sIENQUENfUFJPQkVfUkVHLCBDUFBDX1JFQURfUkVH
LCBhbmQNCkNQUENfV1JJVEVfUkVHIHJlcXVpcmUgUkVHX0lEIGluIHdvcmQgMCBhbmQgSEFSVF9J
RCBpbiB3b3JkIDEuDQoNClRoZSBjdXJyZW50IHJlcXVlc3Qgc3RydWN0dXJlcyBoYXZlIHRoZXNl
IGZpZWxkcyBzd2FwcGVkLCBjYXVzaW5nDQppbmNvbXBhdGliaWxpdHkgd2l0aCBzcGVjLWNvbXBs
aWFudCBSUE1JIHNlcnZlcnMuDQoNClN3YXAgdGhlIGZpZWxkcyB0byBtYXRjaCB0aGUgc3BlY2lm
aWNhdGlvbi4NCg0KU2lnbmVkLW9mZi1ieTogd3VsaXdlbiA8bGl3ZW4ud3VAc3BhY2VtaXQuY29t
Pg0KLS0tDQogaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaCB8IDYgKysr
LS0tDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpX3V0aWxzL21haWxib3gvcnBtaV9tc2dwcm90LmggYi9p
bmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oDQppbmRleCA3YWU0YWJlMC4u
NDhmNmFjNjEgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNn
cHJvdC5oDQorKysgYi9pbmNsdWRlL3NiaV91dGlscy9tYWlsYm94L3JwbWlfbXNncHJvdC5oDQpA
QCAtNTM5LDggKzUzOSw4IEBAIGVudW0gcnBtaV9jcHBjX3NlcnZpY2VfaWQgew0KIH07DQogDQog
c3RydWN0IHJwbWlfY3BwY19wcm9iZV9yZXEgew0KLQl1MzIgaGFydF9pZDsNCiAJdTMyIHJlZ19p
ZDsNCisJdTMyIGhhcnRfaWQ7DQogfTsNCiANCiBzdHJ1Y3QgcnBtaV9jcHBjX3Byb2JlX3Jlc3Ag
ew0KQEAgLTU0OSw4ICs1NDksOCBAQCBzdHJ1Y3QgcnBtaV9jcHBjX3Byb2JlX3Jlc3Agew0KIH07
DQogDQogc3RydWN0IHJwbWlfY3BwY19yZWFkX3JlZ19yZXEgew0KLQl1MzIgaGFydF9pZDsNCiAJ
dTMyIHJlZ19pZDsNCisJdTMyIGhhcnRfaWQ7DQogfTsNCiANCiBzdHJ1Y3QgcnBtaV9jcHBjX3Jl
YWRfcmVnX3Jlc3Agew0KQEAgLTU2MCw4ICs1NjAsOCBAQCBzdHJ1Y3QgcnBtaV9jcHBjX3JlYWRf
cmVnX3Jlc3Agew0KIH07DQogDQogc3RydWN0IHJwbWlfY3BwY193cml0ZV9yZWdfcmVxIHsNCi0J
dTMyIGhhcnRfaWQ7DQogCXUzMiByZWdfaWQ7DQorCXUzMiBoYXJ0X2lkOw0KIAl1MzIgZGF0YV9s
bzsNCiAJdTMyIGRhdGFfaGk7DQogfTsNCi0tIA0KMi4zNC4xDQoKVGhpcyBtZXNzYWdlIGFuZCBh
bnkgYXR0YWNobWVudCBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYmUgcHJpdmlsZWdlZCBvciBv
dGhlcndpc2UgcHJvdGVjdGVkIGZyb20gZGlzY2xvc3VyZS4gSWYgeW91IGFyZSBub3QgYW4gaW50
ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgbWVzc2FnZSwgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgYW55
IGF0dGFjaG1lbnQgZnJvbSB5b3VyIHN5c3RlbSBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRp
YXRlbHkgYnkgcmVwbHkgZS1tYWlsLiBVbmludGVuZGVkIHJlY2lwaWVudHMgc2hvdWxkIG5vdCB1
c2UsIGNvcHksIGRpc2Nsb3NlIG9yIHRha2UgYW55IGFjdGlvbiBiYXNlZCBvbiB0aGlzIG1lc3Nh
Z2Ugb3IgYW55IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UuIEVtYWlscyBj
YW5ub3QgYmUgZ3VhcmFudGVlZCB0byBiZSBzZWN1cmUgb3IgZXJyb3IgZnJlZSBhcyB0aGV5IGNh
biBiZSBpbnRlcmNlcHRlZCwgYW1lbmRlZCwgbG9zdCBvciBkZXN0cm95ZWQsIGFuZCB5b3Ugc2hv
dWxkIHRha2UgZnVsbCByZXNwb25zaWJpbGl0eSBmb3Igc2VjdXJpdHkgY2hlY2tpbmcuIAogCuac
rOmCruS7tuWPiuWFtuS7u+S9lemZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOW5tuWPr+iDveWP
l+WFtuS7luS/neaKpOaIluS4jeWFgeiuuOiiq+aKq+mcsue7meesrOS4ieaWueOAguWmgumYgeS4
i+ivr+aUtuWIsOacrOmCruS7tu+8jOaVrOivt+eri+WNs+S7peWbnuWkjeeUteWtkOmCruS7tuea
hOaWueW8j+mAmuefpeWPkeS7tuS6uu+8jOW5tuWwhuacrOmCruS7tuWPiuWFtuS7u+S9lemZhOS7
tuS7jumYgeS4i+ezu+e7n+S4reS6iOS7peWIoOmZpOOAguWmgumYgeS4i+W5tumdnuacrOmCruS7
tuWGmeaYjuS5i+aUtuS7tuS6uu+8jOaVrOivt+WIh+WLv+S9v+eUqOOAgeWkjeWItuOAgeaKq+mc
suacrOmCruS7tuaIluWFtuS7u+S9leWGheWuue+8jOS6puivt+WIh+WLv+S+neacrOmCruS7tuaI
luWFtuS7u+S9leWGheWuueiAjOmHh+WPluS7u+S9leihjOWKqOOAgueUteWtkOmCruS7tuaXoOaz
leS/neivgeaYr+S4gOenjeWuieWFqOWSjOS4jeS8muWHuueOsOS7u+S9leW3rumUmeeahOmAmuS/
oeaWueW8j++8jOWPr+iDveS8muiiq+aLpuaIquOAgeS/ruaUueOAgeS4ouWkseaIluaNn+Wdj++8
jOaUtuS7tuS6uumcgOiHquihjOi0n+i0o+WBmuWlveWuieWFqOajgOafpeOAggotLSAKb3BlbnNi
aSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
