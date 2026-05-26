Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6236CD5BC9
	for <opensbi@archiver.kernel.org>; Tue, 26 May 2026 03:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXxo8VQS+F3HMqOGIz6UiR7c/q8OCPbxjXe+YOqpzuY=; b=2AjGSSWRM+A1Sd
	DK5+6OMKuBsfCVPGRgmnzZy5UgyrJXAINk9/eNphwD3iKUx21Wkh+yt+BSCBAaRnSVWJdPMppObgX
	ygc+4qJF6vVA/yeGBnEWd1xvms36BH18LjkOPx55x/gxuH/a/20vTEAojNHczOuBf/IcdbUYvTHSp
	JjBU9AkIHjlFyePBiwtaDFolxUli+HzQ2Uzi/NyfzIxojFTRPs/YeSBsowF2Kdiot6cgAb56KJph6
	a+B5j/z2WSoABxuj4Qc5480iFKJiL207EkI4WKj5ICh6McvMul8y+2LoAHN8I+CBj7qN+I5CsRw4Y
	55ujYni0DKC7Ox2InFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRiam-00000000wgf-47z6;
	Tue, 26 May 2026 03:36:32 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRiak-00000000wfy-2GUH
	for opensbi@lists.infradead.org;
	Tue, 26 May 2026 03:36:31 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-824c9da9928so4637222b3a.3
        for <opensbi@lists.infradead.org>; Mon, 25 May 2026 20:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779766589; x=1780371389; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooIpZRtnFyHPIY1sZcJ1+G7Cflluk3aB98Ch/K9ilaM=;
        b=miyns0CUCqhE4XzRd3gmOuHxlya/lq/3rhcej0G12C3xHMBKBoj9ZkNgZvbWLj3nlH
         hpZc7BDYBMLKX46MoMw0MrU+5fTTSrWJhyLU+HUufRpUCkY96l1mFVrXwM8thnnTDKwf
         NsmkgGhaZRrsEdSGejFERtM7jX3qqQPNl/2+zfDmBVFQqGzQbFTwiaLdBK2Zf5VglTNs
         R21j6uoSwkZyTjZhfNizTOUtprGlqmIQ3BJH9Y2Ud3FXVDCqGlHmRk8ak0ZJ5SRbWhYq
         67UBkj6l16aFEpKNtswF2iUs2iWir4+YsJGQH/Pge/zNU6wRrzJhQ2KbPxfxxe1vYX4O
         OGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779766589; x=1780371389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooIpZRtnFyHPIY1sZcJ1+G7Cflluk3aB98Ch/K9ilaM=;
        b=rneitD6FJz8WA4mzZAZzTJzHIdk5Pl5AWjYp2jEZ7PidK6GaimMGeaIAZKKQLknjFi
         4Ohps/EX9hO3ohVQ5vnGVY49RYDXouErKh4DXfydqLkixUTebzFdayipzCoukycZ0J1X
         gZ5hPDEKLmjcnhER7DaN2CvypuHtTRMKOC1a1xuxrA2ObONybMeQapX/kL/6ozNdZTjk
         onB2Tb8WOjlbA+X3d8KyAughlR2qCw1dsq6oi9k6d52wOEXGkwBQF8HGvzZGiQwRL+vO
         S32HqcBTpQh993qGo/Uborn0uLSJtI1rR8ABhxZk83q18cJx9bDTLMbJSA0df7L+qn3u
         qkhg==
X-Gm-Message-State: AOJu0Yxs/UX0VhIgQOXHvav0oByUd9N8vAy/zYz7Yu+5ranrHzL1SJN2
	WBNCozhApoJhUmEEVA2XZ/Ic1oK9HF2wceJbcJA33iXRMJWw/F7J4Xr0+urbsw==
X-Gm-Gg: Acq92OGAnNmwSSJ3/r8sQsuAB7FaQtfzUekfsy0RkmUzWP5TirT1iKI6f05yKbGUOYU
	FcMfcEyhsCJPv3SnhdA14wkyqjtUWMJ1Nt7dnUy12OgvAiZqCkYhfI/S7NiHk8Ma9P+PRfCnQw0
	5KXvjLl8Bt3Pp0DS3Rh9QsTvvivUDhWNdpoaXv5wbhADskZzvHOeZCcbnZ77eSMovn4AA/5+90l
	QrFvtgQEeTjy7UqhYmPT/E5CrcTavtBgdJfNlw7vxWWx0Ay7nZwQeN3DyzHEafmYzCYQt5sIuR0
	ATt6i7pn0M1pWm2gkws5D8SBAG/hN2SUx6XBVTGGGgqIIOpj7w/J0Cs3kwilQJQcGeCnGT+lZO1
	eCgbVX6q1VZ0tUwH4aaNTfpw9YDnrFOUsc5XksJa5hp/12jTXMWgtcLjFpYS8ylUyDiOyiVLVOM
	HL8l3SXk34rUOu2dAp5mv+ODnoa0VN0kVhwhUYIINCoyIdIw6kuX2Pogo2ZaD73E56p2SAyoaSu
	wnE+hCm
X-Received: by 2002:a05:6a00:194f:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-8415f307755mr15624641b3a.32.1779766589424;
        Mon, 25 May 2026 20:36:29 -0700 (PDT)
Received: from localhost (124.158.97.178.qld.leaptel.network. [124.158.97.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fd8127sm10404083b3a.50.2026.05.25.20.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:36:28 -0700 (PDT)
Date: Mon, 25 May 2026 20:36:25 -0700
From: Nicholas Piggin <npiggin@gmail.com>
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: sbi: Apply budget restriction when polling Zkr CSR
 state transition
Message-ID: <ahUPSS8uvDvH4fBs@lima-default>
References: <20260519225014.244672-1-evvoevod@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260519225014.244672-1-evvoevod@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_203630_614537_DFCA5B3A 
X-CRM114-Status: GOOD (  21.75  )
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

On Tue, May 19, 2026 at 10:50:14PM +0000, Evgeny Voevodin wrote:
> Zkr architecture doesn't define a time limit on state transitions
> which results in hanging on unresponsive or event-driven platforms.
> To prevent this, we need to limit polling iterations and fall back
> in case the budget is over, and stack guard keeps its initial value.
> The budget is configurable with CONFIG_SBI_INIT_ZKR_POLL_BUDGET,
> defaulting to 1000 iterations.
> Successful reads do not consume a try.
> 
> Signed-off-by: Evgeny Voevodin <evvoevod@tenstorrent.com>
> ---
>  lib/sbi/Kconfig    | 12 ++++++++++++
>  lib/sbi/sbi_init.c | 12 +++++++++---
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/sbi/Kconfig b/lib/sbi/Kconfig
> index c6cc04bc..a11f788c 100644
> --- a/lib/sbi/Kconfig
> +++ b/lib/sbi/Kconfig
> @@ -6,6 +6,18 @@ config CONSOLE_EARLY_BUFFER_SIZE
>  	int "Early console buffer size (bytes)"
>  	default 256
>  
> +config SBI_INIT_ZKR_POLL_BUDGET
> +	int "Zkr seed polling budget (iterations)"
> +	default 1000
> +	help
> +	  Maximum number of iterations to poll CSR_SEED when initializing
> +	  the stack guard variable. The Zkr specification doesn't define
> +	  a time limit on transitioning to ES16 between polls, which
> +	  makes it impossible to tell whether entropy is being
> +	  accumulated slowly or the entropy source is not functioning.

If entropy source is not functioning it should return DEAD, surely.
Specifications always require a "reasonable" performance, whether that
is explicit or not. That's open to interpretation and application, but
if a word of entropy at boot causes a responsiveness problem, I don't
know if that's a reasonable expectation in the spec that needs to be
accounted for.

So I think a bit more information would be good. If if this is a
workaround for a particular platform that might be okay but I think it
should be framed as such.

Thanks,
Nick

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
