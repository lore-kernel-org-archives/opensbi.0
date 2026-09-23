Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22EEC9830B
	for <opensbi@archiver.kernel.org>; Wed, 23 Sep 2026 21:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9KuLjwRfh2GmjmO9o35B573bWgzTqOZUXq5tOym5lgc=; b=D5BAn3wmwfYv+B
	qbZwizZJhRfpLECSsGxbY8LhDoX0Ogj826pcJbFzAb7jYXBtbEl58tpeR6eXQdnBujFeLYbtEB6w1
	wssDFfT4464BIo6HpXvcIE5knfm3ZWd3xXKOo0E/5Pi4LlvWWOCKC3k1YeX944RG9fL/FC8hSQwrF
	RFWWKaDnM8ZyOHHxLvkle7e+q6S+eC+QqgVxZIuNrC8taupHF6KBStXJo8LrQgCUH8uOONj18ivsM
	pJVPIijJrvgB5mT6rwdWfKcKeXkikDLZxlLPMHYjKs62Mv0BwRlNzX/icqoy8JD0XotJJc85u4qyX
	hb+fePCgA4sr8uCl5cLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UQ4-00000009YvI-3cWO;
	Wed, 23 Sep 2026 21:22:24 +0000
Received: from mail-ua2-x0f.google.com ([2a00:1450:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UQ1-00000009Yua-0ruF
	for opensbi@lists.infradead.org;
	Wed, 23 Sep 2026 21:22:23 +0000
Received: by mail-ua2-x0f.google.com with SMTP id a1e0cc1a2514c-9852048ab71so412659241.3
        for <opensbi@lists.infradead.org>; Wed, 23 Sep 2026 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790198540; x=1790803340; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wjLFRMeKKdnyLt7o4zvCJytiCh/zVfjQqvZyzZhjtuU=;
        b=ReqdkBGvxTH/P/9ULEHg73jGFUHZ7ijRv9jGjK0f5iUk8qbQnh8LPNEImx8oDV/Pzs
         6gSKqtFDTF1072goBcylKLk8HlXgjCZZI5g6R2/KHm/jyhEvuYigBnLBUeKhnB9lVavz
         kI90FwrfftZNtktf8jmfyf++USjlUGHEDW6VHcbD454YKUEBOn8VJ0GokLOsuX1BekOi
         dOHPSBSVXZKKlEEepoI/alekpW2XGpFQ1Kxw9bZfdHUmOEjweLHEYcWG222YRP6ORl62
         6mIokpOMcJYOVkKFqoqVTeA5INmIohXxlxLEl9mS1hxYbby8x6LxBejMUg7XNvibLsFq
         WViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198540; x=1790803340;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wjLFRMeKKdnyLt7o4zvCJytiCh/zVfjQqvZyzZhjtuU=;
        b=bWEfOBmQPYgwD6mmeP1GCu+W9O6nWZ7M1/dDsyPnwOByFNAH0dyJrTEDVKmeZe0eSl
         TnmV1W+rz5cLM7EFviiTkr+c9wc0bYzXp2frgQg6F36JdpLUx33VOHnQZgqGt0u5GWmr
         rR1Q+kWx+1IyWZusWlCTZJ7rk24AUHyUxUAdHQLWWv3QGmWoeADBcWnTE6+3pazxTnr/
         8dUJoQgJQtrxAdtC5EL/oiTls9yuzIsihXV8/tUeW/AFz7cWZl6vGxzy9Ye7Y2fuJuyp
         VA/3GQ6j0B/N86YqClTKa9iXiN6EVdAj18XuJc66dx7rGbQbhuFNOc1uzAOvKJCTwjzc
         oJVA==
X-Gm-Message-State: AFuF++neUHXaBsvlswT4AtAA1ysLfFzSxcoZfSSt2F7YyeV8oK+abc0y
	o9q/AIQYusjM+DY6HFxsIh2b829++gSthyvhOsK8HpM6UcZSX2uUYNWTsPVrEk6FRpeJ+P/QQjU
	0zDJW
X-Gm-Gg: AYBFou2eWW1RAF9XrPxEbW/sH4pP7dzTJ5hCrXdnYxlk+pgIK0IPN9j1Hwa+RV5xRWT
	sE/ukEt0IGEsIJDs5u+GMya90kf2lsmf2uWlBv8KKx1nK/wet5iTG1QMmtwi+GOoL295djFAH68
	h/4Js+XNJdMkjX2E0p64sX16Mprzs4TSX5ATLAIk0z4Ol0Cn/y3HDIGTMr+2utiGtobpHdQYSPt
	WQCLvlC0utsfV8m5H8b+cE6j/rnQdjhfquweAaVGH1OTy1cLN2SYT0xFlip4FFQZBhY3HqgZYOB
	zljeUXUfOWDqMAFx4+q7hxl2GjL2vIwlKzwZehNitxhDgrNT2MM25loVLLnHH8WNrTw9ulrEYbD
	iM70vDAmzkpdAGJ1zPkydN7H+fpScXIFXRLlr6XUkVGhHEg5RzgUGQokda9PmzmTO+H4VnBHrnG
	uyfcPt7uGzU2IGHAuqUOgZw1AcYJa5uNvENAUXSLAy1SmBvW0IeXn3osUBVw/G/Ky28kIALm4Fv
	HDHnS/xqkD8u0oGqw6QqEGUXdM+P/+GmPkoUb2V5DI=
X-Received: by 2002:a05:6102:3e96:b0:7aa:a6e5:fc76 with SMTP id ada2fe7eead31-7af1cb9e186mr438787137.9.1790198539784;
        Wed, 23 Sep 2026 14:22:19 -0700 (PDT)
Received: from [192.168.40.230] ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf566bdccsm5213986137.4.2026.09.23.14.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:22:17 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH v2 0/3] Makefile: fix support checks that use grep
Date: Wed, 23 Sep 2026 17:22:11 -0400
Message-Id: <20260923-makefile_extension_grep-v2-0-0eb97b8ac076@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAANDtGoC/3WNTQ6CMBgFr2K+tTUFkVhX3sMQ0pYHVPlLiwRCu
 LstunU5ybw3KzlYA0e3w0oWk3Gm7zzExwPpWnYVmCk8U8zjlAsuWCtfKE2DHPOILuh5ZTGwpBS
 lhryKRBfk14P12rw/P7Ivu7d6Qo/hLhi1cWNvlz09RcH7VSL+tzJFjDN1luBFcklliruSS2OUx
 Un3LWXbtn0AA280C9MAAAA=
X-Change-ID: 20260909-makefile_extension_grep-4f9fcea894cd
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_142221_259455_67BE1C6E 
X-CRM114-Status: GOOD (  12.41  )
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
consistency. Also since submitting the first version of this series two
additional uses of grep have appeared in the Makefile, but I've opted
not to change them since they don't appear to result in the same issue
observed in Yocto.

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
Changes in v2:
- Rebased onto latest master, removed old CC (their changes merged
  already), no functional changes
- Link to v1: https://patch.msgid.link/20260910-makefile_extension_grep-v1-0-b3ae0d456a6e@baylibre.com

---
Trevor Gamblin (3):
      Makefile: don't grep when setting CC_SUPPORT_ZICSR_ZIFENCEI
      Makefile: don't grep when setting CC_SUPPORT_STRICT_ALIGN
      Makefile: don't grep when setting CC_SUPPORT_SAVE_RESTORE

 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 5a175017261af97e9122fcb9d9012481cdb5aa41
change-id: 20260909-makefile_extension_grep-4f9fcea894cd

Best regards,
--  
Trevor Gamblin <tgamblin@baylibre.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
