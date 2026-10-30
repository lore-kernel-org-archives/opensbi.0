Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F3B606A31E
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 03:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4WAjJz/u;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=aHkpe7G1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HLk/9lLwbbbv1Yt1uCqtIjZtujL7OGxzp92OXg7wBO0=; b=4WAjJz/uJcMCTzVKe3aeKrseW2
	ivDpabWS2teDllR+a9COj1KtyO1OW1ob66gP8HO0fBq7JuU3ojLT2BdStl5iDOHrsBHcuo7VqrJA/
	oPll7NoVkdXeNEKqLTMFDXVZySgw6uFFZ2DIy9XoxOJOLYrU7/cO+R3KKV/OTZTq+I0z51cy+1X0r
	h5MRWvdTYwwuMW48ToC2cm+P8PPlgnIbAAEzjgqft4nAW5fEreJzbARM+rrAAs0wRML6OznB/5kmn
	+svHZ5yutopboTUjxFmKbaQb17W9Fytr4dt39ow4aGNakSm3RDQXkdfB61bDJEzG85TL95a4kyVNq
	LH7xRDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcwm-0000000Ai0K-18HI;
	Fri, 30 Oct 2026 03:06:28 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcwf-0000000AhxD-3KNl
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 03:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793329577; bh=pVP3sSlrRrn2w64rmKAZsccBJeKj4Ap5QqpfSCXbJbk=;
	h=From:To:Cc:Subject:Date;
	b=aHkpe7G1SAlnQuT1uhWML1P/N5LdTjgsEJym/6BC24Kjm4vlDz83KE/bW9cqrVRfQ
	 97K5CvdBSQF5XnCU1RbXvoI2NHXqiCshAGPih7gAT6n5VC39sAGlsgSfHGv2Q4glVo
	 BCaxYlvDdYKoT8dEI3muHPruusI8913D7uw02rhE=
Received: from zs-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan ([202.120.37.188])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 18F8DE4F; Fri, 30 Oct 2026 11:06:15 +0800
X-QQ-mid: xmsmtpt1793329575t3fvfe8z8
Message-ID: <tencent_73DD0A2A800FF004F0474622BCC96E466F05@qq.com>
X-QQ-XMAILINFO: N8i9SvusUD3be91riXls338Z88A0wDJLoRm8ij6D/BoQjQEinbXnaVSUBZ1q4h
	 5ucR81Qj854FlAYotMP/B3dnTAOXi4Q9lJ/UPitOi0tx+2r4rF2YOWdyX6u/c3X1at3hozgXUc2v
	 MqW1pqh+H0FF6mTBFWwxJBZN3bXZ7UI3nvkqAHbX+DSCV2F+G/f9NbItaRm0iaJc9WY/+xGqyq++
	 /gSWfXNuOhtM8guTP4NBM6JK/dzFPGB3oyE9kfVhx2uU+ecIBVnAEjBYfd+EPd+2Kp7sqpmUpXHe
	 Z8ZvAxq5Y6pFYt2yVAnvFXDfE6bJbHhtf2nQUfAkpldNcEQUJBMmlBKdr0ryjThkCQ5THqVNcY4q
	 SLaOlnv5olu8BoDXOxxSTdUnodPxW7Svc/osInplHiDB2dOk1jhwEh8WOCu57j6uctVnN4Lh8oAw
	 k8qtgDEAnFGwvubhAQ4TjvMZ80dJmhQ3jgIVEQ3Bp3ETTygy/Vr9iI9oKJ92LxtLzfIYnOitbmxM
	 9r2eh5bv0KV4G6RFSvitaG8/5/HGsiT3myGcnnTQ2r7CJA+BHL3UoZ7e0YEbduG9d4/uXS3RY3Sh
	 Ia/p1TThkWuKvPHF+kChwe87GEElW9Htv2ZG+iiIf3PLM9l+rA7eNAcVZ384MjzZ4bf32JjADUTx
	 OwKKFzkOMln3U7qmNahQcZfxaNSukCPvzhHzTEMoX0TEFRTkC1vFBiGqfqYtplcmRTuLYjBVWn6a
	 KzNhJng3CW/WBKSG6jc3vkBBr/m7cue7paRdVSQ9NlvgGtgjBJwLygFg5KCkb6VenyHwz3o2CjON
	 8ywNcUnSkTN0cj3V3cY5btNxpUnlDvjb9svef///XGU8sUBu4D2vAq8i2fMpROZOWwcycnx6TbRd
	 cTcuaFh0h1uSmjDRKUU3V3rVNyprvL5cjAs2i8W8tGgsU2xQkzCO0JKDvAXUf4VWL71gYqpKlzYK
	 GXeJl8ssyxgCDMOnGYDA8IDzl72r+hPxR+9q5B3um5kf+uftjfa8nPZbuFm4DpMcQPweeDWtANkp
	 KAZxpCLXAiBI6z4FweWyTB5ofGSbJ6klZQjFA0GwRh7rom0M45MZgspwyk/2bsSi2lKwEDiA==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Shibo Zhu <3499129952@qq.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	atish.patra@linux.dev,
	Shibo Zhu <3499129952@qq.com>
Subject: [PATCH v2 0/2] lib: sbi_ecall_hsm: Reject oversized hart IDs
Date: Fri, 30 Oct 2026 11:05:01 +0800
X-OQ-MSGID: <20261030030503.334740-1-3499129952@qq.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_200622_153354_546E59C1 
X-CRM114-Status: UNSURE (   5.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reject RV64 HSM target hart IDs which cannot be represented by OpenSBI's
internal u32 hart-ID type, and add standalone SBIUnit regression coverage.

Changes in v2:
- Split the HSM fix and SBIUnit coverage into separate patches.
- Build the HSM SBIUnit test as a standalone object.
- Invoke the registered HSM extension handler instead of including the
  test source from sbi_ecall_hsm.c.

Shibo Zhu (2):
  lib: sbi_ecall_hsm: Reject oversized hart IDs
  lib: tests: Add HSM hart ID validation test

 lib/sbi/sbi_ecall_hsm.c            |  5 ++++
 lib/sbi/tests/objects.mk           |  3 +++
 lib/sbi/tests/sbi_ecall_hsm_test.c | 41 ++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 lib/sbi/tests/sbi_ecall_hsm_test.c


base-commit: 7a7a60dc87a41c79fb63d5972943e9d8fe4abf77
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
