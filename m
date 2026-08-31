Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EC4C61DD3
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdvRthEvSSFkE74n00egXxApivo/d5VZqMGKnCm+2QY=; b=yt5Xmh8M5qV/pP
	cpWNcJz3nbGZLPXm8tMph3UKkNldOfPLEZuy5DK7BbD2AKpLrdmFDQKHfzBZVZk7P9k9lD66iHH4J
	DjiWcIUIgazxXUTaHe2vuPX8H3mIf8HwbBPNUmlVD3fK2eNpSfJ5UlU+9esE7Q3SKGyfSdYOvpGom
	I4toAV9nmVsk/x5aCsB7EJA2irV9nMUtPEZ/1uq6wIKnql1j3GPyFinBS/C0k2Lq3jLQLvfWkNz0J
	7vDELgNfChliB7iRZ0eYjl8V+TdtjRcDOWxuKXaEB55ZHCtt9fXkFx7fbUkH2QZWUfUnj2Qb2srTo
	bNiO9TvflwFmPXmzt38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15el-0000000A9nD-13Xy;
	Mon, 31 Aug 2026 17:18:51 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15ei-0000000A9mk-3zIH
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 17:18:50 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc1c7962bdcso475053a12.2
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 10:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1788196727; x=1788801527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uicOB+9K+nYkbOq2m+Bqzpu34uQphsjowvIKfTDsNAE=;
        b=VhG/qyN7O7CdjqBwP4/z9n4yvxxKwfJg+uC0BLx37q2KHT0TMjdFkVH0ypnthrM6Mi
         EKZMHH5yI/FKL5TjEu6VkFJwpn4RpqBpb4uCUh3spnyjc7lzLfdZLffgKNyY5JAPizby
         FudKs9SlKT4UQMl2/ZQlqa1Wj7yLcCgMIugFPRA2ApBo1oUyviTaosWM6ViCDUhUUzk0
         mp1GNTiMgcD8rTg74niLaRfrR+gH8mdw0dIq1S8YqMpXa4KBaKsX2glKCKY0eh1U2wwE
         1eSeX2eYv06mXyh/JxdsHbLlW3/bvX1cQim+GypMxV/QBXKs9j+TV4mM6nYTeJc+/in7
         1EdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196727; x=1788801527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uicOB+9K+nYkbOq2m+Bqzpu34uQphsjowvIKfTDsNAE=;
        b=bEBry0hwhkv4idvGFFgATDmRhExiS8vftXipGJXf+NI01UoQP0S3o4sfFepBZpRliJ
         /QSjZVs7JwK1RKtE57RsMJ6i1ac1FCtqOVbW6zUGAY1wFFgR/dSi6pr1Om3/bkhyj5P2
         EsFeScOoBMtqpGNOObUdDd8Eyoq/V6o25nvz7yFWo/4oSi2F0srS10XC7hbyG6jSLI4D
         88oq2N4qSr+EjkGVDi2GdNn+9Cyi6f7Q67ujsxqQOSoHbck6QTUPBxVfABfrMHVBypt6
         3TI5jg1VqLBmKa09yRTEQCxYfjEOhiQEyAweGODglMkwiyM9eBc4eW2FLHkUrX7uxkzu
         ANtg==
X-Gm-Message-State: AFuF++mbwynmgXBtBNjXOvGBp16qJ510KoJDzan6L0HLQF9IGp6nJq+Y
	mPIfYnL3JdYlf7NHqR9E2/aMkqnfrxre4hy0RYJFyKHrqyMfVLU138sVrZgWm3Ko5UYff3s0HQi
	7R6+p
X-Gm-Gg: AYBFou1NJiz2wtHS9BlnNeGIf/mS/f4OLFMl/6dQFyRuSv23N37zqU0JxMRV30vB3hl
	NVMw5urLKbrSwilRjISjOCVB8ekMoBHlRBmu37VfBtp755xYZa2ScvkNSKzfMIQZnekAUCX492t
	SA66yqhKuwUM2aZ1cwfTAU8hlWs1At05hUDY0Wq6jkLJ348uPV36kxyC6UZsobdzKmd6FXkX4cZ
	aIEnwldFDnanYeY71PDu6ZOpjnDg+TPgjF9OOnnwO0nwo6jriRAWVUidOadlVKYITgdnuaM5WjF
	yh0DV04fML4gVeigVV/69UxVJxSt2pGL6wq6GdpI1G0DHcN+yXQsf4775c1AQTVWdf7k2mb5IVU
	3Fc5Yt6vxDG847I0MB3tIbYj6L7bS8ARNIPJLIVajSf+uv2pUWQ4oVeb2vAMZooV8XDUJdzTrG9
	3D8EkS8CYOIyNEdqWSWjn7Ce9KdeL1bx5+yhyF1ePlufaRbMwNQnPHwg4A1mddSYBlq8eQv/aoC
	2Pu58PkkFJfjdzo3w==
X-Received: by 2002:a17:90a:d403:b0:38f:aa76:88b with SMTP id 98e67ed59e1d1-398babbb56fmr14310250a91.4.1788196727273;
        Mon, 31 Aug 2026 10:18:47 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm27969359eec.17.2026.08.31.10.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:18:45 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: opensbi@lists.infradead.org
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>,
	Nia Su <nia.su@sifive.com>,
	Nylon Chen <nylon.chen@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Nick Hu <nick.hu@sifive.com>
Subject: Re: [PATCH 0/2] lib: sbi: Fix Smrnmi/RNMI trap handling issues
Date: Mon, 31 Aug 2026 17:17:49 +0000
Message-ID: <20260831171751.3206696-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com>
References: <20260827-rnmi-trap-fixes-v1-0-df371cf92301@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_101849_104435_7328CB79 
X-CRM114-Status: GOOD (  15.41  )
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

I tried this patch set on artificial setup on Whisper SW system simulator and it
seems to solve issues discussed in [1].

But I'd suggest to split this series to separate changes structurally and make
backporting easier if needed:

  1. Restore the Smrnmi context on non-retentive resume: extract
     sbi_smrnmi_hart_init() and call it from sbi_hart_reinit(). This is the
     actual fix and it is self contained, so anyone on a v1.9 based tree can
     pick just this one.

  2. The sbi_trap.c fix for the clobbered trap context (your patch 2/2). It
     touches a different file and has its own Fixes tag, so it does not
     depend on the rest.

  3. Change smrnmi_handlers_init from void to int, but keep the panic when
     the platform does not provide the callback. Today a callback which
     fails has no way to report it and NMIE is set anyway, so this is a fix
     on its own.

  4. Allow the NULL callback. This one changes what a platform is allowed to
     skip, so I would prefer to discuss it separately: as was mentioned
     earlier in the previous email thread [2], it would be nice to have a
     level of control of a situation when platform forgot to initialize the
     callback rather than just silently set NMIE and proceed. I can see these
     distinct options to handle this:

  a) Boot time output: based on a flag just print whether Smrnmi vectors are
     initialized by platform explicitly or not

         Smrnmi Vectors       : NULL     <-- or "Platform"

  b) Warning print when Smrnmi is present and no callback is registered

  c) Explicit opt out: platform which doesn't need to program vectors
     explicitly sets a corresponding flag in sbi_platform to indicate this.
     Without this flag set and when handlers are missing we panic like now,
     and when the flag is set we go ahead and proceed to setting the NMIE bit.

   I personally would go with a) and c) as this allows full control of what's
   going on and catches errors early. What do you think?

[1] https://lore.kernel.org/opensbi/CAHh=Yk_Sbd1MEH8tVshAOFQptEVKm0QZv+D7bJwMC80qvarVew@mail.gmail.com/
[2] https://lore.kernel.org/opensbi/DIIOKVJ7SVHG.115EOM7LY36I1@tenstorrent.com/

  Thanks,
  Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
