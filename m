Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F609F45A0A
	for <opensbi@archiver.kernel.org>; Fri, 10 Apr 2026 19:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuKGHQ1PsRT8xleQJXjvkBgYIczBxNwdfUyIompZbTU=; b=s9XClAFsjLZMFz
	rqrkVgMsdHwspX4bjPYvv/+U3eN7cMbYoV6E4v4CpOLLhv9JKCtiygt8NjqYui6jjWQxr6n29vtuR
	VOfWVz7fS2NorcaMDusXRCMAF81p9OUxLSWxUfjUo3SX15F3Hq2R7glEqDVGTvxFk7q3GnSoU2HYe
	N+kJnNYUx4SRVuBOfS5GBlkeX/YgDZlCEM7yEhHVQQRaCaWz5lDHrAqRqnpqWD1NjKKNcu24tJu9Q
	ii603Rq6xNJcJWM2b3eHyacnBJSDfkdB3NCi3UyVE5eQIUTBsIrq46FWbpl7/tOlRfXWmlK2i4C2V
	RteabgGjxoPl9Jp0BlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBHKN-0000000CiiN-3uNI;
	Fri, 10 Apr 2026 19:15:39 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBHKK-0000000Cii2-3uOQ
	for opensbi@lists.infradead.org;
	Fri, 10 Apr 2026 19:15:38 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-12c1161232dso125778c88.1
        for <opensbi@lists.infradead.org>; Fri, 10 Apr 2026 12:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1775848536; x=1776453336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGjTPNX1zoamN5wQYm20J6hyEPl0jfMZI/rRKSEifl4=;
        b=bnuwUX+byV7T/cI/CooQE1vHhsOM0P272HfodLzZCae8AuZ8FYDVshF0p5B/9mAc6o
         Qd10xmjtELUFSKKMtVyw7FySps1GEvIsD9Czx8GVaE536aP1tTtqFTABCalc0wlqdd7Q
         iVGLtK5fqvnqKDjgAj1JDp2BkNP3fIfW3ppTyirsfUz929Gzk/4vT6m7QKMbTw7h0dzo
         ehTbuDf56Gu8+xYM8Y6eREOKknRZQmspRkwbODFubXnv6WeAMJzRx38SNGFYoT8JRagY
         iAWPeUCoK0qKuH26S4E6B/MnwASrrcfy0EZ8FSZvyOLHdTSRFktCLefmT0PWDbEwR817
         P5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775848536; x=1776453336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGjTPNX1zoamN5wQYm20J6hyEPl0jfMZI/rRKSEifl4=;
        b=nBeOeYaUHsSnwinS9Bs79BJDvRzTkMR0Iphrd1CYNX45WNhVR7LW0nlB/K7S/VhZPc
         HMLbjECsxnVwr+4eYEYY9aKf/BjFE8yTr5aW495lk5E23gP12lRHm1v8CrC95qvM45nA
         gl61Ls6LwqXFKFU3k2eVT/iflSH4yHjC2D6LrBamf+X8bOvcxx0nZ965SpDnpBidicqF
         yAC3Yu2IZXpKwQZpjSGNuWF8a4PK6sX25WDY9ZXYt+aDyEzDHPFpR9Q33gnvh5AO6Uwy
         2+vLzr+BTp59y2kMdDdAg8nyEwUs5++PBj6Lpnu0F5jhlEkWCfIesZIu+DbGXyzlqeje
         CTGw==
X-Gm-Message-State: AOJu0YztpPlQjobyAtIHX4Lp2+43SBIS4ykv8S0DNcG9Esi5Tio9m0AG
	okz8a4euzbpGFtv6pjUL+TdeC680S3ni52XzGFYqDC4xYJoKvy2S8/w1Db3Luu/slZo=
X-Gm-Gg: AeBDiesZWK02Wy6DTS/zGhM/DKgszgJfJojwq9fwOkqBasv3cy2vbipjYueoiLDZAHk
	jcDchmmAEFBpjsTUYy6JH2P0pp5O2nG+2FThVJDDyR8/z4YXhHwycQvlbU8hGbYb2jH/9VsnueA
	skCKhMB+ZrXGqIpuHx9Iay+L20GhOsbhXuxeJvIfFQhbv8RzV4m3nrkDKnsrXYC/La1MdC7utJG
	eJ5TJZN+STzvA1XhPqFHATeyLpq5KhbqaPMippuESz3cJGQYSDeg+bVEn2b26XJq12SPHBQoejR
	XefZP2krFCoZDs5RpLk9akXX2mfCNsWKzKb6jF8qefeSa9TNxIxidA/oLoWKregmVg+QbxscogE
	Pd/N2btD3E/T5z+EPVE47+7i54EinlpdvxoPoPeZe2IklCk0XMai1qhQDujNBFNM8ipakfLni91
	G3OldEgHhUnR1g2bplKUgtNqdtAcggrrM391P1/Iy07EpNZrS42A==
X-Received: by 2002:a05:7022:b92:b0:12c:33dd:fa28 with SMTP id a92af1059eb24-12c34e6b5c2mr1223014c88.2.1775848533534;
        Fri, 10 Apr 2026 12:15:33 -0700 (PDT)
Received: from ausc-rvsw-c-02.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459faa7sm5402802c88.2.2026.04.10.12.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 12:15:33 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	evvoevod@tenstorrent.com
Subject: Re: [PATCH 3/7] firmware: Add RNMI/RNME handler infrastructure
Date: Fri, 10 Apr 2026 19:15:11 +0000
Message-ID: <20260410191511.393063-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy2jFkLSH0WThrcEg36LDc+hwiGHRcHGOZ6+FxdO+ok+2Q@mail.gmail.com>
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com> <20260310183155.2186463-4-evvoevod@oss.tenstorrent.com> <CAAhSdy2PHSsMNib5Bscp1mWvdQTii_PG7jDpgR9vf_f=7x04sw@mail.gmail.com> <20260409191943.291207-1-evvoevod@tenstorrent.com> <CAAhSdy2jFkLSH0WThrcEg36LDc+hwiGHRcHGOZ6+FxdO+ok+2Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_121536_977468_7F28147A 
X-CRM114-Status: GOOD (  12.18  )
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

On Fri, Apr 10, 2026 at 1:09 AM Anup Patel <anup@brainfault.org> wrote:
> Clearly, for RNME, the existing _trap_handler() can be re-used
> because _trap_handler() depends on same set of CSRs and mret
> instruction.
>
> I agree that code path RNME should be different from RNMI but
> that does not mean we need three separate low-level handlers.
>
> Further, the Smrnmi spec also states the following:
> "For example, some implementations might use the address specified
> in mtvec as the RNMI exception trap handler."
>
> This means on platforms where mtvec points to the RNMI exception
> trap handler address, we will have to anyway re-use _trap_handler()
> and sbi_trap_handler() for RNMI exception handling.

Thanks, I see your point about reusing _trap_handler/_hyp for RNME.
Initially I thought that providing platform flexibility to handle
RNME explicitly would be beneficial, but I agree -- we can reuse
the existing trap handling machinery since RNME is fundamentally
a regular M-mode trap entering at a different address.

I'll remove _rnme_handler in v2 but will keep the platform callback
for setting up RNMI/RNME vectors, since these are implementation-
defined and each platform needs to initialize them. I'll replace
the _rnme_handler argument with the trap handler address (read
from mtvec) so the platform can program NMEVEC appropriately.

Thanks,
Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
