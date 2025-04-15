Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC245C369B8
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x62McnUhCumKEfoNra8N/Ky1kdPpC1smSAL0rj84jkk=; b=l54zHor+8HlxF7
	7Y2EoCELGyXBfDBR4d5Smv0ge7pStjf+3NUn/ztPNLlgKNRnfmqDPqpN446l6vmwjJxx9mVvCgN1O
	o8gcJX+jroYa9tebzU+SlVU2L6XtYTp3agDRMpHEMLW5dbiJPDV1l17dWrmYD7hpG0AlHJoVJljV6
	MLSu+5VJrzpRHwukImZBAiaI3btdxPBZMNHYjV2tsu1HUmXU8VT1W465bjVOqagQTJSXQF34gTaWg
	gZ0N0l0mHV80d/aI/rFZzB3QKOg0pyLr1m+lKc7Cmp4W5Q2vAOdpXrsctIxYzZJQJgSn7YziSu1af
	Qv4DQZLsfBubI//XkbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVQ-000000067wk-22Iw;
	Tue, 15 Apr 2025 14:43:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gCz-00000005t9z-2Ctm
	for opensbi@bombadil.infradead.org;
	Tue, 15 Apr 2025 13:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=IjPxRuw2ColyYdpT8S2KgGEEjl8kTvIxD7ZybOEK1Ys=; b=G75+zhwB3TCP1m+Dn/QGwYw+rC
	pqAzCAaa10SknSljET3DV7Etp9gtuYx2u1ZC3t++uhgWIrDjmwFLugkn61Q7egg2Kfd1niXKiNaJX
	1rfe64LgoOXASvkv0tlO6xnWX9i5a0r+/Ni45aXrwOw0+t79vSe3qIWqBqie+M4a2aW7JN4LQ/ygP
	8606crlUkYEL7sYYfQmTO/IT1DFI1BNGhvvA+3wXBd5QpQOxVNQtyC2J1zIVR2+Qk6Ha7OXvc3Ka8
	1rFwNUfII6bEZ4JYHV45RwAEOZO3wgsGjxhZf41DClrguwu0sY9TzMhrMfBV+8NWBVl6jskTy1owF
	uZEj5GOA==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4gCw-00000009tL2-15jh
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 13:20:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39d73b97500so315303f8f.3
        for <opensbi@lists.infradead.org>; Tue, 15 Apr 2025 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744723205; x=1745328005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjPxRuw2ColyYdpT8S2KgGEEjl8kTvIxD7ZybOEK1Ys=;
        b=FTwHfcjqG1ps+/NJ/jhZkIXBpu7K86FYR9E2w+/Hrf15UT9gfTyS2qNsZK04cqrZcK
         e4OvNoPm9WAtXLW++QvXDYw0+7RTA0uf93bTMz3sHEDoaF13Px0LK0J6eTh6vPUqlAZv
         a1daXHMuyoucKoVXgmAl44jZGuRdWiE0zd6xoBRzIIf2NJdcGN6aWE+g2/kgQ+bv+8y8
         ZVLJjnDxFvnbNo8KA/bF1pVjuTCM6VZ0UJuQCjxNWCfzUQTwhygCLsd36LyhEyrkocy2
         1okQht/B6y0JmJt6zE72YfGPR0RZWIIyxv9s4QkRX3Z281QHNnaYOHdsPSDey8ZTZuB8
         MfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723205; x=1745328005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjPxRuw2ColyYdpT8S2KgGEEjl8kTvIxD7ZybOEK1Ys=;
        b=pT0EH+2nHsOSVjpH+xbSkqK3btSJejRQRrIMJqThHV7sNncnMD0lCXsxuDPuN8lcaA
         BdJrszGAJjw3jX80aY37nLeVuVAPF55+CwOU4yWaF4RejdnsFsxGJB4N5aNqBfL7GAKn
         +d86Y0UXn4qguRuFnaU7IVx3eDc3gdZFFFxqkErzGzROw3FcvBGXCnx2xf9QHYOVSw/3
         v0ga+jczcc4Q6K6LtDTslAdNdhHnX4NMfyiXGSXTGRXSbDIk4mM3hbmSq0x9K3N68ZEQ
         it+UrjDR6cbH9IIWvcrGM1Bk9n+KvNNniYIF5yBfsgk6ZJh10f7jiljdHB1rt7NQmh4k
         Rciw==
X-Gm-Message-State: AOJu0YxjpdMn1Di6u9Pb2cxYX/zT0pw0VkryOzh8VRrhgpTi/2D7S2fO
	3DQTOHofD/gmCwCS+Gt9grLASO7j3Uwp/vdcifImOnIchFEbvPHqD0tqJdKDk09dy1GB746qM1T
	g2GA=
X-Gm-Gg: ASbGnctH8MpmdPo2plUqmiq/k2o5htbH/Mkb+C5MLqSfCkyIZlRroPoGYLXGRlPKent
	8U8hrdqN7K37VAQcfQ2+zCc7AQZxAG9JZSnlbufXNpADjIUXJ6LAq2U1Z5LIz/zR9gJZDtoQyZf
	t36uCkiOYWpM4Y1w4fTt4SAdXHSpV9+VSGF0YiNA+VnvzSP+THUSj93lE2BQbiGikrLhBPqlS1D
	dqngR6O4AVYyU7xZUd6KtlR1FJO9uzoExFqoQqon7yH61EuUxndmom1RF5gjo+KTgkvNpSUV3eu
	JtxX3XKeI2+i6E0EqYbLLSSFEQ+owdREckPALkRSxhdcNb3Y7OZ4L5cn/SA=
X-Google-Smtp-Source: AGHT+IH3dT4SJfhq67EYtXx3rpeLci3NH09/DKMeXn/yNH5dEQLRhf0FBNE4QtSPyTEyQeadFxlPIg==
X-Received: by 2002:a05:6000:4285:b0:391:2b54:5fb5 with SMTP id ffacd0b85a97d-39edc3f518dmr921358f8f.10.1744723204321;
        Tue, 15 Apr 2025 06:20:04 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:c67a:74e3:4d6f:be48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c02esm14005034f8f.23.2025.04.15.06.20.03
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:20:03 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 1/8] lib: sbi: add 64 bit csr macros
Date: Tue, 15 Apr 2025 15:19:02 +0200
Message-ID: <20250415131908.2699782-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_142010_495571_52187DE8 
X-CRM114-Status: GOOD (  10.35  )
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

TW9zdCBDU1JzIGFyZSBYTEVOIGJpdHMgd2lkZSwgYnV0IHNvbWUgYXJlIDY0IGJpdCwgc28gcnYz
MiBuZWVkcyB0d28KYWNjZXNzZXMsIHBsYWd1aW5nIHRoZSBjb2RlIHdpdGggaWZkZWZzLgoKQWRk
IG5ldyBoZWxwZXJzIHRoYXQgc3BsaXQgNjQgYml0IG9wZXJhdGlvbiBpbnRvIHR3byBvcGVyYXRp
b25zIG9uIHJ2MzIuCgpUaGUgaGVscGVycyBkb24ndCB1c2UgImNzciArIDB4MTAiLCBidXQgYXBw
ZW5kICJIIiBhdCB0aGUgZW5kIG9mIHRoZSBjc3IKbmFtZSB0byBnZXQgYSBjb21waWxlLXRpbWUg
ZXJyb3Igd2hlbiBhY2Nlc3NpbmcgYSBub24gNjQgYml0IHJlZ2lzdGVyLgpUaGlzIGhhcyB0aGUg
ZG93bnNpZGUgdGhhdCB5b3UgaGF2ZSB0byB1c2UgdGhlIG5hbWUgd2hlbiBhY2Nlc3NpbmcgdGhl
bS4KZS5nLiBjc3JfcmVhZDY0KDB4MTIzNCkgb3IgY3NyX3JlYWQ2NChDU1JfU0FUUCkgd29uJ3Qg
Y29tcGlsZSBhbmQgdGhlCmVycm9yIG1lc3NhZ2VzIHlvdSBnZXQgZm9yIHRoZXNlIGJ1Z3MgYXJl
IG5vdCBzdHJhaWdodGZvcndhcmQuCgpTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJr
cmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBpbmNsdWRlL3NiaS9yaXNjdl9hc20uaCB8IDIx
ICsrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9yaXNjdl9hc20uaCBiL2luY2x1ZGUvc2JpL3Jpc2N2
X2FzbS5oCmluZGV4IDQ2MDVkYjIwYmQ3YS4uZDE5MjgxYWMxOTYxIDEwMDY0NAotLS0gYS9pbmNs
dWRlL3NiaS9yaXNjdl9hc20uaAorKysgYi9pbmNsdWRlL3NiaS9yaXNjdl9hc20uaApAQCAtMTU2
LDYgKzE1NiwyNyBAQAogCQkJCSAgICAgOiAibWVtb3J5Iik7ICAgICAgICAgICAgICAgICAgXAog
CX0pCiAKKworI2lmIF9fcmlzY3ZfeGxlbiA9PSA2NAorI2RlZmluZSBfX2NzcnJ3NjQob3AsIGNz
ciwgY3NyaCwgdmFsKSAodHJ1ZSA/IG9wKGNzciwgdmFsKSA6ICh1aW50NjRfdCljc3JoKQorI2Rl
ZmluZSBfX2NzcnI2NCggb3AsIGNzciwgY3NyaCkgICAgICAodHJ1ZSA/IG9wKGNzcikgICAgICA6
ICh1aW50NjRfdCljc3JoKQorI2RlZmluZSBfX2Nzcnc2NCggb3AsIGNzciwgY3NyaCwgdmFsKSAo
dHJ1ZSA/IG9wKGNzciwgdmFsKSA6ICh1aW50NjRfdCljc3JoKQorI2VsaWYgX19yaXNjdl94bGVu
ID09IDMyCisjZGVmaW5lIF9fY3Nycnc2NChvcCwgY3NyLCBjc3JoLCB2YWwpICggIG9wKGNzciwg
dmFsKSB8ICh1aW50NjRfdClvcChjc3JoLCB2YWwgPj4gMzIpIDw8IDMyKQorI2RlZmluZSBfX2Nz
cnI2NCggb3AsIGNzciwgY3NyaCkgICAgICAoICBvcChjc3IpICAgICAgfCAodWludDY0X3Qpb3Ao
Y3NyaCkgICAgICAgICAgICA8PCAzMikKKyNkZWZpbmUgX19jc3J3NjQoIG9wLCBjc3IsIGNzcmgs
IHZhbCkgKHsgb3AoY3NyLCB2YWwpOyAgICAgICAgICAgIG9wKGNzcmgsIHZhbCA+PiAzMik7ICAg
IH0pCisjZW5kaWYKKworI2RlZmluZSBjc3Jfc3dhcDY0KCAgICAgICAgY3NyLCB2YWwpIF9fY3Ny
cnc2NChjc3Jfc3dhcCwgICAgICAgICBjc3IsIGNzciAjIyBILCB2YWwpCisjZGVmaW5lIGNzcl9y
ZWFkNjQoICAgICAgICBjc3IpICAgICAgX19jc3JyNjQgKGNzcl9yZWFkLCAgICAgICAgIGNzciwg
Y3NyICMjIEgpCisjZGVmaW5lIGNzcl9yZWFkX3JlbGF4ZWQ2NChjc3IpICAgICAgX19jc3JyNjQg
KGNzcl9yZWFkX3JlbGF4ZWQsIGNzciwgY3NyICMjIEgpCisjZGVmaW5lIGNzcl93cml0ZTY0KCAg
ICAgICBjc3IsIHZhbCkgX19jc3J3NjQgKGNzcl93cml0ZSwgICAgICAgIGNzciwgY3NyICMjIEgs
IHZhbCkKKyNkZWZpbmUgY3NyX3JlYWRfc2V0NjQoICAgIGNzciwgdmFsKSBfX2NzcnJ3NjQoY3Ny
X3JlYWRfc2V0LCAgICAgY3NyLCBjc3IgIyMgSCwgdmFsKQorI2RlZmluZSBjc3Jfc2V0NjQoICAg
ICAgICAgY3NyLCB2YWwpIF9fY3NydzY0IChjc3Jfc2V0LCAgICAgICAgICBjc3IsIGNzciAjIyBI
LCB2YWwpCisjZGVmaW5lIGNzcl9jbGVhcjY0KCAgICAgICBjc3IsIHZhbCkgX19jc3J3NjQgKGNz
cl9jbGVhciwgICAgICAgIGNzciwgY3NyICMjIEgsIHZhbCkKKyNkZWZpbmUgY3NyX3JlYWRfY2xl
YXI2NCggIGNzciwgdmFsKSBfX2NzcnJ3NjQoY3NyX3JlYWRfY2xlYXIsICAgY3NyLCBjc3IgIyMg
SCwgdmFsKQorI2RlZmluZSBjc3JfY2xlYXI2NCggICAgICAgY3NyLCB2YWwpIF9fY3NydzY0IChj
c3JfY2xlYXIsICAgICAgICBjc3IsIGNzciAjIyBILCB2YWwpCisKIHVuc2lnbmVkIGxvbmcgY3Ny
X3JlYWRfbnVtKGludCBjc3JfbnVtKTsKIAogdm9pZCBjc3Jfd3JpdGVfbnVtKGludCBjc3JfbnVt
LCB1bnNpZ25lZCBsb25nIHZhbCk7Ci0tIAoyLjQ4LjEKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
