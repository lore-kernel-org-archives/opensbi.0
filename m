Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBCAC88E40
	for <opensbi@archiver.kernel.org>; Thu, 10 Sep 2026 14:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ClYwlTJ3jsIhS2hqty7cBDFFwMDLmZ++hMs/M9eMVA=; b=SgYMgC1ny7L1lf
	XOOE8cwLput6iXp7SD8ogpk6hmwuTmxplnIlMGcoY1HLTx+Tejrwy8ZzB2c+Lg3vML0YHiSka/wHu
	E+/TPkrb434YjSmq5HRa+jSs/qYlAe0qf4wR0ctkYNRtMKJc1rO000pIEU5ddspEZgGI5dOmyzd5G
	ioVx+dJom/GZPSuhg73XwIk/rLtIAtMsjVsbqFN2nNQBB4oNtk3hRa9ECYbbPGz+PJQSm5HRPb+Rr
	TllITLwDvEZ7Tnir4w6FLGdTGgJyZlA6ujEpf69Br5nNTuMXNzFGUhjXC8Z2CjrgU5nNGE1P8YWuT
	VuOwDas5Hu7ZMdJNM1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g03-0000000Ef7O-3iDO;
	Thu, 10 Sep 2026 14:43:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g01-0000000Ef6v-1LG6
	for opensbi@bombadil.infradead.org;
	Thu, 10 Sep 2026 14:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=gKSVBpMZa7CaOa9CqP2ILfWxBUmNH5nI8DWJc0ob6E0=; b=V6RK4LUcImaCCh0NOXagj3DVby
	qcjhoNubD1guWPcARh/ZDv1FpCAu1k01QW31aNHgXpdoRE5cPCmYqKRBSvMC+VBmzMz2IWnFKd3wy
	uDNzdFI6iWGrj6FbV5D4UPnxki8jeLjO79TSdYyEWUh4WkQmvq3XKba2qxSLyFTyjStiji6KxVVgA
	+m/JqIn4aSmJ2ezHs8Tp6A5OiJU50PvPPMpvriztC/e1/hp1bTGBbVMbIzrbJELCNKW/b/UgrTQw2
	AAxad29BmAwGc1f3t8rD/O4CRhMcURe0464djnZBnuUWr8W2DqnOopk42e1RrskYN+lhho6WVbNQT
	58/cwtTQ==;
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4fzy-00000002dCK-0dM9
	for opensbi@lists.infradead.org;
	Thu, 10 Sep 2026 14:43:36 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfbd148cso24693616d6.1
        for <opensbi@lists.infradead.org>; Thu, 10 Sep 2026 07:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789051412; x=1789656212; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gKSVBpMZa7CaOa9CqP2ILfWxBUmNH5nI8DWJc0ob6E0=;
        b=L3LdsFUAA8/Ja54VqUKJSxY4DUbT44t3iRFJwgehDVSmUllgmix8h3O9gnj8o3QVAE
         xVTeGL8aHhwnFlKa0eXl/Vv3Q8jbPmxB1gS73dF8GdeX/cJZVENKy6wZ+GOVn4JgZFUR
         O+joXUz8Io/k6jlWo5iVeIb3nkPUwuYcx5LDiwWYUqnTY0c3SH8M4Qb08P/SBvhbEd2p
         W8rLDF1TVWNeui1nVHDNxLbY/9q87ahDmzpzVmnNNPhbI2X5WkcJgRIEdZdeZ+RdvjPF
         UjDZyMmIgNPXwfnWSaF9Ij3Y7QImw78ejS3ZuS7+lZzzUd0IrR6hh+a1VBznP0vJw1Aa
         n4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051412; x=1789656212;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gKSVBpMZa7CaOa9CqP2ILfWxBUmNH5nI8DWJc0ob6E0=;
        b=MWE/K/DEZbdiHHtudrf9XxpeqdC3MxMXdO5sXbnt+nKvDnYQSTBRkWT9s6cY3dx0ZA
         +NLlitkMlWrAClqA5thoi5jpozsm//jBSjeBHfIvti8NEyZsapcTKEq09s+MVvzZ1sgV
         y+6JPsmw7K3yHypd90BOFEQcU6emZOODm6KbUSSjH23JpwBwc35sxlAG+Y60x9QrvsX5
         +DLUqtVVRw+xCe2Iu1mpd7541rXuywa9y60nakJFqVobqQ6yGkpG8ZehEeAh6Ny0EmNZ
         dyl1571zN2AdNWN6yNgokZHTTx5+sj6K0L0Oa73Q5ajdoEblvpvRJdcf7uWVFSx1iw9u
         v0YQ==
X-Gm-Message-State: AFuF++n1bjjmakC8IdvtwYUVvhz4HRvHt4W/SWJZzSD6Iq6pQ4EGEUzc
	HcfbHG9uYUi7iEkE0GgO53I3g+kfi9rPcsxeVgkhl6S6FrGfrNQGCZ/ENhrGLZ9J12Y6r7GQzWg
	3VarO
X-Gm-Gg: AYBFou3Q3Pd6BGTXa9R94ZelbVbZSxvnvrYoy3yW1S0fa31aWx/0Cup1AZMEVSv8/27
	WGdHZvKkwfYmAR5WTNAiI9tTGUfV/wnJ9/Mz+nR0aYeurnPQuD2pTN+H2PqkdxXfiecOpyKcZ3H
	iPeZv1vNTOmlJ06Dqza0YlRxeIE4PEG+E8nlIscbBVCTgMUqj8keifzWkr7wYBy8xbbnS3YKGCP
	spLSA6i/FsLyJID4s+uRua6qt40Z4woF6j6QmJ0WEVp5/ILdIOsoHcUDdZHn+GLkU6RxIf5gQxG
	VdXYS6fyBnooC5LHwC1xwtcptyWzpOkod+3Ik95pIDQFycRWdmnpY6ZeLgIF+tSIoC7EUVaOrtg
	l+VqnGlhrQEXwKEvK8++J8xEwylUIrvTBWtn3nkn3OOUTRKbX5IEG8zKX4k1duGFvCWjxC1QuJ/
	GK0/tfRj7PbUPyCVxhj1z8+yAnuK84TA8ixwSyQXm2LYqtYSuRsQtJNt2FYaLkB4J96anHMddCS
	LkJKIfzVCuPtlg4cq+gPZ4/zi1cUTl8Tt7FgxRA5Fg=
X-Received: by 2002:a05:620a:2306:10b0:939:383d:f72f with SMTP id af79cd13be357-939c94a9896mr1510025385a.34.1789051411664;
        Thu, 10 Sep 2026 07:43:31 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120d9df1b6sm2057546d6.18.2026.09.10.07.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:43:30 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH 0/3] Makefile: fix support checks that use grep
Date: Thu, 10 Sep 2026 10:43:20 -0400
Message-Id: <20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAjComoC/yWMQQqDMBQFryJ/3UAUkcariEiML/bbmkoSRRDvb
 myXAzNzUIBnBKqzgzw2Dvx1CfJHRual3QjBQ2IqZFFJJZWY9RuWP+iwR7hb70aPRZRWWQP9VKU
 ZKNWLT9r+Ozftn8PaTzDx3tF5XhTvd5N7AAAA
X-Change-ID: 20260909-makefile_extension_grep-4f9fcea894cd
To: opensbi@lists.infradead.org
Cc: carlos.lopezr4096@gmail.com, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_154334_289259_6BD058CE 
X-CRM114-Status: GOOD (  11.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

When building OpenSBI in environments where extensions from the ISA are
used to generate build paths (e.g. Yocto Project), the Makefile checks
which use grep to look for patterns can incorrectly match against the
build paths, rather than the command's exit status. This means a
workaround is needed to handle checking for extensions like zicsr and
zifencei. Instead, make the following variable assignments use the same
exit status pattern as OPENSBI_LD_PIE:

CC_SUPPORT_ZICSR_ZIFENCEI
CC_SUPPORT_STRICT_ALIGN
CC_SUPPORT_SAVE_RESTORE

Tested by building a full image in Yocto including OpenSBI and booting
it in QEMU.

Note that only the first patch (for CC_SUPPORT_ZICSR_ZIFENCEI) is needed
to fix the Yocto QEMU case, but I've submitted the remaining two for
consistency. If taking those, then there's at least one other patch on
the mailing list that may also need rework (submitter CC'd):

|[PATCH v2 14/14] Makefile: enable Thread Safety Analysis

See also: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15897

As an example, in my Yocto build environment, values like CC for OpenSBI
are set like:

|export CC="riscv64-poky-linux-gcc -march=rv64imafdc_zicsr_zifencei -mabi=lp64d -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/tgamblin/workspace/ypbuilds/poky-qemuriscv64/build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/opensbi/1.9/recipe-sysroot"

and the build error:

| /tmp/ccnpajj3.s: Assembler messages:
| /home/tgamblin/workspace/ypbuilds/poky-qemuriscv64/build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/opensbi/1.9/sources/opensbi-1.9/lib/sbi/sbi_tlb.c:176:
| Error: unrecognized opcode `fence.i', extension `zifencei' required

Checking the exit status directly avoids a positive match as happens
with grep.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

---
Trevor Gamblin (3):
      Makefile: don't grep when setting CC_SUPPORT_ZICSR_ZIFENCEI
      Makefile: don't grep when setting CC_SUPPORT_STRICT_ALIGN
      Makefile: don't grep when setting CC_SUPPORT_SAVE_RESTORE

 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 3593a5facc4c6938b90429a6973ba9ee21fc5899
change-id: 20260909-makefile_extension_grep-4f9fcea894cd

Best regards,
--  
Trevor Gamblin <tgamblin@baylibre.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
