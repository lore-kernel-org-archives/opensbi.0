Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80290CD4F54
	for <opensbi@archiver.kernel.org>; Wed, 27 May 2026 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5CpYrAGmu/FpVXgdjlE9to2wccc429eaTaY3fv8nwA=; b=ieAlsdNdc+HkhX
	4uYMA0fYaaECvkPo/56CdRLmGxFKxL9XQpIi4coFP5FcHACGmm0trptGoNQ6HowGjRrlu5/4Zg8Lm
	GWrkJ7/s2lLpJNBZ6vp3+88monznFhKYrS2lX5kVJ+TbcOOkiYm3sgnNIIh9oKnbd2Ba4aRGBjd6G
	6Lf77I0BTtkZJOrsfbA3dDaaRkJxB3MlwH6ENiBwEc9LC0T+dJUNXWOQFBY7tbrptA6IBu95o2ufq
	+ONU6TcEGP6IJ1GKsSUz/uAPGImjMMHs03MRq+vgffSUOP70XChYOpb38G25jKypmwXG7wT/LQb7K
	cBoZeycwwXPs3DgkMIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHuv-00000004ZbR-2Rq2;
	Wed, 27 May 2026 17:19:41 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHus-00000004Zae-3cbn
	for opensbi@lists.infradead.org;
	Wed, 27 May 2026 17:19:40 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3042a99f0ceso621251eec.0
        for <opensbi@lists.infradead.org>; Wed, 27 May 2026 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779902377; x=1780507177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctYXMDbmpO0XWIrpRc00QEkilovG8ckNMAhtikfXotQ=;
        b=d6lqWX2U3swdD2hIGIlrVED91wNuP9ee9cMloTfi1HrhDpmacer3xzIUOF8uZlJe1h
         IpQ1aRuv9i1GNRaTg3a1G0lP7If6bw2aKJRHlBFNpEct6/rOtXiaSp042Pe9S9JO9sMV
         BcfRqc8Z3ag+0UTRTCGCWUigiPoOTCaYmfyx2jFoWywWCx/S4gaI12CHfrs5Ih/ko1zE
         p0ZAeNWFzp2kzmqfiSaZ25MGkTsF5jO5cAkS9dKA3TCojqfMboZjKDkmnLxxeI5/oJfY
         SvIeOkDU9E8Yihi+EzBhTXo119tGdEGtJU5b5bZQE6pZ38Ab4K+EwPy46/WonBQkuJhs
         NZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779902377; x=1780507177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ctYXMDbmpO0XWIrpRc00QEkilovG8ckNMAhtikfXotQ=;
        b=OyaHCg4uxuw6S1RnSmhBKWajt+Mq6ezR6/sLyeb1Q7VzRsbwC+7ZH9zEjbka9fSsnR
         QjjxOUB9hPtWgh2FOlil/I+K1D0P8j508mZ+o8sq97zEPxifD/9L5awUZmm9jxrmnGaT
         3keVIjczOZIUVnnlk74h9S1vHabRqAoT3j/reT8o98t7aEm+uRytQcTm5gzDxopiftOm
         hueHG5NCDLQYqCpui4bKlO+fl9nKO4/s6hw3miVkkTkVqKvD5+hb2FEuwVET+pjz8ECH
         3fffoVZr7JwgJfhU5Vksqz7a73B1xISzjnUTbwJhjiI64EHbKugKkKJMhzZ9nYrpHz9g
         pFsw==
X-Gm-Message-State: AOJu0YzxFUat/q+HJhDOwKBWv+whvoILB7aKWvVUMMrzpk7T9Wket6AM
	LncQbpZgMZJqNLzp2BV/RABFy5GDcd8svUke4kvbxwD6FPqOyWwQtEyMEjAUmuF0+q0=
X-Gm-Gg: Acq92OGNyJ1+EVW7MgrVdgwmBPXi8aAITmBAiz83t+l+byoj2KoAt4C1lNdNGE9iWI6
	Tq+tmtzJjU4JLSc6vkIYQYqb3hbrAUnmkdBkVhjajfen2Y8B77t0bcp6AKqkF1fYcD9qIJVeQWa
	dR7Zqkw3Xt7CYP/UOX/VsbZX/dNc8kO+NKQr+g/Npg8rlX9XVWtEcSbAliFV9C79Dx6EuJT6fhm
	qZHLzrjhqzcG9DucNKTFNp+oFODodHaEWqpWc8QlFu2mleEC+G6PICJ39DCC04X+S2rb+qjYPan
	y1cvtjLvYuSYA17cR6zS26c3HbAZku5vJaDtJ3mPP6UmUrIYdFbw9mQISRu5nXlexrXuankxNqg
	668CzZuE0G9qPItY/EwKCtz8B1vsMtl/kJGLUzZcPkF6JmvTMrtVrRdNUO74IyrmQ7nlhBZM1ZG
	L3Uni1ZBz/YDsvktBkQPncRLGO2iehX4SXmpIx/nneQTnm1pNa9TKUG1pDqUMxmQ==
X-Received: by 2002:a05:7300:8c88:b0:2ff:b29b:87b with SMTP id 5a478bee46e88-304490ec2a0mr4876370eec.5.1779902377511;
        Wed, 27 May 2026 10:19:37 -0700 (PDT)
Received: from ausc-rvsw-c-02.tail89d63.ts.net ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30481ad4cd3sm10765644eec.27.2026.05.27.10.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:19:36 -0700 (PDT)
From: Evgeny Voevodin <evvoevod@tenstorrent.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org,
	evvoevod@tenstorrent.com
Subject: Re: [PATCH] lib: sbi: Apply budget restriction when polling Zkr CSR state transition
Date: Wed, 27 May 2026 17:19:14 +0000
Message-ID: <20260527171915.416189-1-evvoevod@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ahUPSS8uvDvH4fBs@lima-default>
References: <20260519225014.244672-1-evvoevod@tenstorrent.com> <ahUPSS8uvDvH4fBs@lima-default>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_101939_120843_8E2F3935 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

Yes, DEAD is the architectural way to signal a non-functioning source,
and the spec implicitly assumes reasonable timing. The actual scenario
this patch fixes is more specific:

This patch fixes a hang on platforms where either internal entropy
source is event driven and requires corresponding interrupt line to be
enabled or external entropy FIFO refill source is not wired up (as on
SW and HW emulation of Tenstorrent platform).

Without the cap, init_coldboot() spins forever - no console output, no
diagnostic, just a silent boot-time hang. With it, __stack_chk_guard
keeps its compile-time default and the firmware boots.

Given this explanation, is it OK to keep this patch as is or is it
better to send v2 with updated commit message and Kconfig help text?

Thanks,
Evgeny

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
