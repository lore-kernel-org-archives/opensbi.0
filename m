Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D7606A319
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 02:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gUQslNFN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=LSmMTfww;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XYfEYqsY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=txfIRc+ny/ynAywFkzNr2gfjzPGcum9ox80YXcH5nSk=; b=gUQslNFNzLmJqmiQwg2zooVpki
	afu5wLYmBAd6N8zP6y3j4umW8y+8MF7cL331JI0BQoQcyEvsFgKmc4CGtqEN5Q26/49d5kj6UnhXn
	OtffnQfYKSiE0jNH2oAejXzi4jFhxv59vFRXA3yYsSNq/CFmfDwBvU/FkdAe4UJM0ycCb3e1LzHpj
	g7505ltGJNi4SBOriCW5naQhlM51MngRf1wxNvmVi0XxwW6P4hCgs9b80jHz/wTVbZIVrS06OKyBz
	5akUCooMGCiU6vP1UyrQq7gT3qW1sQRDHThwvln9Av2Z/q1O4DO2gAqCpzIoqwHT7PILJi/ZWk/gz
	CbtcWejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5G9-0000000FKzx-10NY;
	Fri, 23 Oct 2026 02:43:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5G8-0000000FKzM-0g0X
	for opensbi@bombadil.infradead.org;
	Fri, 23 Oct 2026 02:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=O7uN+fFpEzgfEGN0TzNKF1Fhm2UO3UAR6IknTyGCaZE=; b=LSmMTfwwcBsgO2tdnD/2APvg5A
	g9NkGTJWgyYwlOOAXkhfDiPS5ULAOTyp5UOm/EBOTbiCaulFHxXOsmEPPHtgu5ZTIfLmZqXyE6Sao
	fnC1v1BIHvy4cd6dvrLMGVFo4uMHeJ2Y+rbTCAnHpOP8U7TPnRSfVrdiXOnccnvAV/75gGYT4cSl2
	z4jrTziUclPEfTCVh2ZISxaxnNEF0Q3k64bX2jvp5xg7oZriuVmEOfpxzUe+O9irzbKLnGI8ci7bt
	gOLuZ4NKOkX+CP0cY9D6mzp7Rz7nW8fWt7N4fjhtxWrthiPxueEvxEsFjUinThokb/lF7z5ETKwq0
	pAwyRirg==;
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5G4-00000008YcH-1wjw
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 02:43:54 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1931ff67a29so1171696c88.1
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 19:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792723429; x=1793328229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7uN+fFpEzgfEGN0TzNKF1Fhm2UO3UAR6IknTyGCaZE=;
        b=XYfEYqsYmzBO2/mDU4sj7gog+1TwwURlEA2T52nYkyk4PHAtN5IXZW9yMXyZKiZpQq
         +Ef2gNazVh/qOpWyT5A08sIrE30lP7GUKyn81TyXRJn7gxxSuHYD1Mr3Z6G3MFs6fJCv
         BfHc08YN1bIce9csZjCfK423pW1HFIKBp8Z0cY/JqTXML/51RXC4RRgPQmXvA9Xgf+8V
         CAXarf+hyFtJWCnHMekxa6OPPDGQEmcWJWrFtnCHmKTmegacn5L16QlKz56H6PlkcP70
         1J/mhMgBd4PzdYphjIT9OT0g8hai1rPlSXMK6ZinjsAALejTHuFsS8OLf3D9LMRejZMe
         u4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792723429; x=1793328229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7uN+fFpEzgfEGN0TzNKF1Fhm2UO3UAR6IknTyGCaZE=;
        b=wbkb6rGU2Db3MUzeZzBXE4ADKCeH+dIzurTgPpe7d1eqiPehz3iqRlpyLCglblMRyB
         tqYQ/1I854uNlAj/PjSjCXng0IECFzzaAnBicHPJrWae8XcfuOC6zWpFlYpHqiz1uBMC
         wt1MCBI+UcKfb5Ly23XiqBeH+Ueaq6wBsSvzEJle5ohyH7lyye50Qs+h94YdMzL9iH/I
         RmYaTNAeyCX2220/WDhFU/hmwHH+kmWgnTl41Ar1lNfxiQBLLC9qoUoZRImzk8YmHx/G
         QjlTWeS3yy9d3TIcGT8CkESaAk3URsIa70Ec6gbwn5czptnIVBRYFuNa9+mXXzbHyT9c
         2Wvw==
X-Gm-Message-State: AFq9FYJgQ3dcFh6WWVsvoYlHwEUDD/9JuuZpoKgtkdfdlOHRTZviuKuX
	PgN6qrd8QHbZJMIel+ZiD3cRTG+PbzlaMbb+mP8+egKawWbguvUIfjqsNOq27WFj
X-Gm-Gg: AYBFou2gP6wtyi3VqW1TiEkw441jqb4I3AGOgDW/G76OolC12efxWsdzDYOfUW2H6tZ
	XcfZFr3iTZR8ImY2m8vZ2HNNo9/7e4b95Lu2IxbEwq1B6XarLo30UEaL1UIiHF0run9Cjfynonx
	HRODzn3BeL3VNVgSfSJA6QALwAzqi7cSidiEmy2sfjYkGLgejwN9GHYjlRhqrdHph1uC+OrLLjX
	qNWmKTy2pcRijVvFTx7LbQGtMzZtAEvnEn3B+yJXa+8hnThIO0OZg3Xp8pjTfWC+ns8I2+H/7pd
	v7A4BHcsnGTnXHMwEfiioGP1xXHQB5pak3dhJwhs3WRRYd4QrxCgTu+2uHvm+pq1s5T0Jnb91l9
	Xl83KzogKkQPzyDAQKyxdR+PmulADCeXNAslmAu9slWK6FusHUGPc1h5iRCpQZeSA++mHqN/Hp/
	6bBpGi500H7JegU5dnD8bnQJ1+J72Q0dcwHzZ3leub0d4OhBPxin54vY6Kzs0UjNFnLKmtz6nmf
	+1m0sCB7F0WYuI1+Sryas2mcwcQ5oZ3/pUMt3xPhIXZK6FH6yay6y7rpiIEXXCWInvkESqhKbMM
	BWwQ1R5SWyh2rRIi7taP3rrIa9BAuqndf30VR4rcm2F3xI5OU37Tr2iOYA==
X-Received: by 2002:a05:7022:117:b0:166:b307:5855 with SMTP id a92af1059eb24-19594fe502fmr2148440c88.0.1792723429100;
        Thu, 22 Oct 2026 19:43:49 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb6c3fb2sm2877233c88.13.2026.10.22.19.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:43:48 -0700 (PDT)
From: whensun <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Cc: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
Subject: [RFC PATCH 0/5] Preserve more S/HS architectural state across domain switches
Date: Thu, 22 Oct 2026 19:43:40 -0700
Message-ID: <20261023024345.16779-1-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_034352_844481_7D5A9648 
X-CRM114-Status: GOOD (  12.01  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>

This RFC series is a partial implementation for the missing S/HS
architectural state reported in OpenSBI issue #433:
https://github.com/riscv-software-src/opensbi/issues/433

An earlier patch for hcounteren and htimedelta was submitted separately.
This series intentionally does not repeat that patch.

The five patches add per-domain preservation of 18 CSR names:

  * stimecmp
  * hstatus, hedeleg, hideleg, hie, hgeie, henvcfg, htval,
    htinst, hvip, and hgatp
  * hvien and hstateen0 through hstateen3
  * scountinhibit
  * siselect (selector only)

These patches do NOT fully fix the following 10 CSR names:

  * hip: pending bits include aliases and hardware-derived state.
    The preservation of hvip/hgeie/hstatus addresses some underlying
    software-controlled inputs, but hip should not be blindly swapped.
  * sireg, sireg2 through sireg6: these are indirect windows. The
    backing registers depend on siselect and the implemented extension.
    The series does not save or restore that backing state.
  * sctrctl, sctrdepth, and sctrstatus: complete CTR isolation also
    requires preservation of CTR record entries accessed via sireg,
    sireg2, and sireg3 with selectors 0x200..0x2ff. The status write
    pointer, depth, and recording state require coordinated handling.

In particular, scountinhibit is a masked alias of mcountinhibit for
counters delegated to S-mode. Its swap is limited to the configuration
and does not virtualize the underlying physical counter values.

Could maintainers review whether these CSR families belong to the
sbi_domain_context_enter()/exit() preservation contract, and whether
extension-specific helpers would be appropriate for indirect CSR
backing state and the shared CTR buffer?

The patches were prepared against OpenSBI master commit
6ad246a1494807ee91e36ffcf60e4c30bb309d45.
The series was subsequently applied with git am to a local OpenSBI
worktree based on 337c23dd, and git diff --check passed. The generic
platform build with riscv64-linux-gnu-gcc completed successfully,
producing fw_dynamic.elf, fw_jump.elf, and fw_payload.elf.
The new CSR accesses were visible in the compiled sbi_domain_context.o.

Runtime regression testing of A -> B -> A domain transitions has NOT
been completed. The earlier hcounteren/htimedelta patch was submitted
separately and is not included in this 5-patch series. Please treat
this series as an RFC, not a confirmed fix for all 28 CSR names.


Theodorus Wensan Februanto (5):
  lib: sbi: Preserve stimecmp across domain switches
  lib: sbi: Save core hypervisor state across domain switches
  lib: sbi: Save optional H-extension context
  lib: sbi: Preserve supervisor count inhibit configuration
  lib: sbi: Preserve the supervisor indirect CSR selector

 lib/sbi/sbi_domain_context.c | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

-- 
2.47.3


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
