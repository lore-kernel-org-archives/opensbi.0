Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290C4C636B5
	for <opensbi@archiver.kernel.org>; Sun, 22 Feb 2026 23:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C89z9n/18yxud/XBSLdBMEJS6S8B+L9hEW+Shb5nt0g=; b=14qySXoWK/od01
	EmcRofrdZVmqb8nLRfiRDWvQJI291e+X88H3k5TBCghnRvWZbpNGFQKEWjDyYYuUDhePmnz8hb3Ou
	OdPfWbMa4W6MYmgcyvqo7MBIntoXcHK2F2xd+Z3MQgsBzD+2yffjTo/tImkni55V+aBsAcQq9Dp3u
	MnCZ7DJgq/R2EpGXTswGQi/iNmSGaKoOoMe3dYwbtGthAP+DxeyIpLYuvW356z++StKeE19sev1UL
	81fwX6axf2lFwW+zaO3OjLmn+kKUEPAB3KN81Dz1BrOvM/FvwSxgP3SFFunlqUAEX7EeHazv9GP1X
	6Ltg0UUmNoa8dlW5SzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuJEt-0000000H3ru-2Z1e;
	Sun, 22 Feb 2026 23:51:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuJEr-0000000H3rX-183h
	for opensbi@lists.infradead.org;
	Sun, 22 Feb 2026 23:51:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so42123785e9.1
        for <opensbi@lists.infradead.org>; Sun, 22 Feb 2026 15:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771804307; x=1772409107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bL8/cDKB+fnbO7ikb8V7cY48dNgWQndJbutw6fuzA8w=;
        b=mT1VkQBi13No8dVZcyj0DDYRY04ZwbyDHMGW6gvwVVqh07wa4Xc8m8eT2+lzlxwxpe
         S5a31foXMoOTgTyubNZW4Bpu3wf3lMJKfbHn+NNFUiFYsGrer0uiqCWxvP+oS8WJcG7N
         9C9fDNDD1H1MQJpQ34lqEp8UWs+zdsRDaZzICdlac7sNO4dHWaAYMkUxQ57rU1RWlL2+
         ZKsPFSaNStgPkXvoboAK1xElTvniVA6iz4vzqD/4H4GY3XWlLfOoOwgMsWAVGonxYu2W
         gp1yJeEr8E4pgq/MVLzAr3hSawXBdN0+f3imnXJ4dUAon80UzlPwkXIgIGvdLGn15NaJ
         iaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771804307; x=1772409107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bL8/cDKB+fnbO7ikb8V7cY48dNgWQndJbutw6fuzA8w=;
        b=F/6d/i84YKZ1vmE6my4BjTNxjThWIzTyl50CiwNnBR4nRc6QHAT2ipnz0MDpOguwSf
         hgx6hT3a4gMC+9ExXkoXEbtXPmxdspd/s4Onnbkokgon/SkKZqFhzQKmfvHI8W7EwqjL
         qqrSX66gUVwwiKx7T+g0++3UBIVowC9gYil20cA9KCUpWXgmGRVCDlepV7C8k7R8Of1P
         FQy5edsQALxxTRh6ePSr1ZjrrjfkhMun2Fa4zj+MAC+he7+RweTycV8n+mgA4930g1HK
         IqLSqVRftROz1XiuXyUlM+Dcb2mQKCeNEDVWhfrEp+A/5D6OkPDFNo2A5v1eYtlbzvNH
         +sAQ==
X-Gm-Message-State: AOJu0YzRMli1m4REEXxPlCzavAeOUaLfuYeTGCxatp6mwxcGbBaXdC5Y
	1x6eSyk/hxHbExSxlb9k/BYUObDvJ0orGoHHoIDI2CU7Tbqe1vKBxIekHzIbQg==
X-Gm-Gg: AZuq6aL95PZoz+puInmczISASfvl/uG/obXg3Qo8Mps6NYjtNv6U0K9ihA8OvMk6jOG
	sVQck/89P9KGR4N38pOdLHBdo43S0JkU5zBT+BIWRzDQK4jxW8HC7ceIjPNFk+9sbx0BYRD7NAy
	WF82jIj7SdzLejLZ8HcYJa1QPzH35HMrLj8VVrkHAnTIF6HHLqllRPb90umPvNjTyplsLIvrMtF
	frgOWUl1uAP5zvSMIAXtZy7yIwhGVQoz4K/1uJF2yClw4WS8Bm3ExDuwQrTxco+qr5Aa3VsL5Vl
	yKTMhHl3T2N0aTDJWXRhBOXZ+QWCla4IlREo0MT0Fx7DzZZF4Y60pU0FW4OsN3MmGwDnx4bR9oC
	4JmIOjDCLBYZzIARiN1/VyI/AUi1PFjlPWcpITbzMTF9IQvGeN41Dx8gbvhpAqoJQYoJjTDlW31
	pvtOgkfT4DrhkcKafSS1IfwXUlwd/hY1MeHneohutsxR7NfADF+OPjBfbPO33z42PpAJtAL+gjU
	oRFwwyQkLluw/OKfeBEmcm2YJ3AvWf3jWbETEwM7vj/6/q0x5JXwXs=
X-Received: by 2002:a05:600c:4f94:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-483a95a8762mr98050745e9.3.1771804307024;
        Sun, 22 Feb 2026 15:51:47 -0800 (PST)
Received: from marcosthinkpad ([79.116.216.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f0330sm198393835e9.9.2026.02.22.15.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:51:46 -0800 (PST)
From: Marcos Oduardo <marcos.oduardo@gmail.com>
To: opensbi@lists.infradead.org
Cc: marcos <marcos.oduardo@gmail.com>
Subject: [PATCH] include: sbi: fix illegal shift in sbi_domain.h: sbi_domain_memregion_is_subset
Date: Mon, 23 Feb 2026 00:51:50 +0100
Message-ID: <20260222235219.276432-1-marcos.oduardo@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_155149_337861_97E0EF52 
X-CRM114-Status: GOOD (  11.27  )
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

RnJvbTogbWFyY29zIDxtYXJjb3Mub2R1YXJkb0BnbWFpbC5jb20+CgpJbiBzYmlfZG9tYWluLmgs
IHdoZW4gY2hlY2tpbmcgaWYgYSBtZW1vcnkgcmVnaW9uIGlzIGEgc3Vic2V0IG9mIGFub3RoZXIs
CmFuIHVuZGVmaW5lZCBiZWhhdmlvciBhcml0aG1ldGljIG9wZXJhdGlvbiB3YXMgY2F1Z2h0IHdo
ZW4gc2FuaXRpemluZyB3aXRoClVCU2FuIChzaGlmdCBleHBvbmVudCA2NCkuCgpUaGlzIHBhdGNo
IGFkZHMgYSBjaGVjayB0byBoYW5kbGUgdGhlIGNhc2Ugd2hlcmUgdGhlIHJlZ2lvbiBvcmRlciBp
cyA2NCwKYXZvaWRpbmcgdGhlIGlsbGVnYWwgc2hpZnQgYW5kIGVuc3VyaW5nIHRoZSBvcGVyYXRp
b24gcmVtYWlucyBkZWZpbmVkLgoKUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJl4oCZcyBhbnkg
b3RoZXIgbW9zdCBzdWl0YWJsZSBzb2x1dGlvbiBmb3IgdGhpcyBidWcuCgpTaWduZWQtb2ZmLWJ5
OiBNYXJjb3MgT2R1YXJkbyA8bWFyY29zLm9kdWFyZG9AZ21haWwuY29tPgotLS0KIGluY2x1ZGUv
c2JpL3NiaV9kb21haW4uaCB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9kb21haW4u
aCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAppbmRleCBjOGE2ZGE5OS4uNmU2ZGQzM2EgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAorKysgYi9pbmNsdWRlL3NiaS9zYmlf
ZG9tYWluLmgKQEAgLTE3MCw5ICsxNzAsMTEgQEAgc3RhdGljIGlubGluZSBib29sIHNiaV9kb21h
aW5fbWVtcmVnaW9uX2lzX3N1YnNldCgKIAkJCQljb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1y
ZWdpb24gKnJlZ0IpCiB7CiAJdWxvbmcgcmVnQV9zdGFydCA9IHJlZ0EtPmJhc2U7Ci0JdWxvbmcg
cmVnQV9lbmQgPSByZWdBLT5iYXNlICsgKEJJVChyZWdBLT5vcmRlcikgLSAxKTsKKwl1bG9uZyBy
ZWdBX21hc2sgPSAocmVnQS0+b3JkZXIgPj0gNjQpID8gfjBVTCA6IChCSVQocmVnQS0+b3JkZXIp
IC0gMSk7CisJdWxvbmcgcmVnQV9lbmQgPSByZWdBX3N0YXJ0ICsgcmVnQV9tYXNrOwogCXVsb25n
IHJlZ0Jfc3RhcnQgPSByZWdCLT5iYXNlOwotCXVsb25nIHJlZ0JfZW5kID0gcmVnQi0+YmFzZSAr
IChCSVQocmVnQi0+b3JkZXIpIC0gMSk7CisJdWxvbmcgcmVnQl9tYXNrID0gKHJlZ0ItPm9yZGVy
ID49IDY0KSA/IH4wVUwgOiAoQklUKHJlZ0ItPm9yZGVyKSAtIDEpOworCXVsb25nIHJlZ0JfZW5k
ID0gcmVnQl9zdGFydCArIHJlZ0JfbWFzazsKIAogCWlmICgocmVnQl9zdGFydCA8PSByZWdBX3N0
YXJ0KSAmJgogCSAgICAocmVnQV9zdGFydCA8IHJlZ0JfZW5kKSAmJgotLSAKMi41My4wCgoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
