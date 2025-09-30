Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25A3CAC5B8
	for <opensbi@archiver.kernel.org>; Tue, 30 Sep 2025 15:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FZAsl8xgtB4OQW+NsNFduQFNAET23qWxfINCx4WQeg=; b=jJoIqIi0likzsM
	MRtcSslslUdKvgof0O0KkX0WGR0ng4kaTJzxAwuQKw8wqKeUq1cYSmc5aTod7mgtwCZyd/4A3PIHJ
	VzGropDPm9892o41g21dEJMInp7PRc8CMFDFy+YTiiYrzMJZ/LnrxIJCaLEtIT0nTR/yREJCvLih4
	UJOfZYnS6nKMwM1m1t2AaS2L6Bcj+oZBZ+ThgE5KZoeqT04Sb6XdX24VNs9LZmtk6byZ68xbyLMA2
	kj6mYjdYEEsZZFAsrm+sThPAQWGBQ3eZvXYarur2PY1zPjgRKaQpkvRCzPoqo+skgwLVcGDswzCjv
	j6kBOLe6A7+TwLEA65Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cZY-00000005gxE-0Wwy;
	Tue, 30 Sep 2025 15:47:24 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cZU-00000005gwH-1dX6
	for opensbi@lists.infradead.org;
	Tue, 30 Sep 2025 15:47:22 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-911afafcc20so204359839f.3
        for <opensbi@lists.infradead.org>; Tue, 30 Sep 2025 08:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759247239; x=1759852039; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IZxpl+dRDDbwIqd4PEp39NLXsQw1Rm2TLk0+t/JLaeU=;
        b=JXwF7peS5D/+BWzyrnm+q9mvMmpkls52DrB2aDOVB0IWhpVFZRD/dYjs1Zu4zG+xDM
         VJxlXZUIf3i1QNIyygoJBv3KEzYJtsw5AUYFBVopMH6HgCj9GDxns8O82kXs+FoEOVVg
         hFXqK6CK/qDtpXN3aFIKbaDFeWo54BS93AISK79fo0KIgv3t7pGNY/KFxrY91WO3Qwh/
         YHc3iAUJh6QWfAiwY0rhFdQfr5LcmqrnAYN6zJyHHJQ4GcJ6Y+KKm4SvxMtnimgw2S5y
         q9sI6S/4xnDmC0WC8duX6qu56VAkNeM1PJRZwq8ddvGYWrpirFo/sPggAUjFiI2vOVnW
         km7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759247239; x=1759852039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZxpl+dRDDbwIqd4PEp39NLXsQw1Rm2TLk0+t/JLaeU=;
        b=hAqTc5KCneolGg/y3HdjSDj8ZeHrCZNk9SVcjHw7NX2o9UQVWTX1uZo8SlXQNVfjZz
         LHekb4R39n5Kq9Sz+tXsEIu6gcWoOggkqdZuadhH95U+smOWJK62XvRYpQUWF1ke2nQm
         MAxK3pr/eGSyw/oteLyGnofi20D5cGb3BDU7suV00dVqCe6ii0wY7ecMRfKBMSShRg3+
         dR6RW5DrZgan0Y4sTUBtDOLTPud6fQbU8VbPICK4eOk+LcOM0D9ROtaFxBZbNyeGPmZS
         pHJ3ZGB7vZktAEvomUF3XlhZAbfjN71gu+e5F+38MiT85AYK1bJa3aT68aX/cS+zIEe4
         zYDw==
X-Forwarded-Encrypted: i=1; AJvYcCWkIZl898WTXMYF4Qyqb9ATDJgVGlqKMkEpcnGzJJK5JyYwOWaO2ZPeF4odNNu/ah2APvdtjn8z@lists.infradead.org
X-Gm-Message-State: AOJu0YzvreIStDeIzXSS5K/Z4ddc0kLS2pa4U5AW99uo5LdG1pQqryup
	SBKzLiIok9ab7v7Ru0pZWxxI4FZnRswhwLERWFfZSyTKf9ewUpuG28W1IzHbeFuMrmfQevNx63q
	QuzGt
X-Gm-Gg: ASbGnctN8qHiCJwc05eRvEV6KZYKjv4ZAZrPyAVaWCVa2xxy1RGjLEm1Yjc0C3CAQ0/
	mjUm0Vem5b1llsw4S9RSgjYAJZtZ5hC6BmLI4b793AwIW7HCHEF8Wrodno6fRj+sSst3KrT8xcX
	t2UTbBV68dHtevHduMFJZBgTElv5kaaWpsZwJWPgk1tez94mxl13ooVrKpuCalAUj01xnf2gnGW
	zrvVqu2GkVxFTVlISvVV4Fivw5puTm8bUADJVrv4ezrOCEE4iBnr9SbSovWwPyOXtMXuq5RqOnA
	3IjFiWABSuQJ684Kx9Eg9YutrAK6AOcVUzJN+wTk1nnppwdfvbUd3UEOIHev+AETOS66npKt4Ig
	oMfCHbGaVHESawd1yVx74GsilmyMC2aJisCCaxQV6b0B9qGdFNKAEN/DVrR2UWx8p789Qzg==
X-Google-Smtp-Source: AGHT+IFPGLvMMEM3x6g3LaAS40Yl1WdnNKwD3v/CH4MrdlVuTjl9rtIQymmgsojUafGbNk7LK+WocA==
X-Received: by 2002:a05:6e02:1a26:b0:424:8749:df47 with SMTP id e9e14a558f8ab-42d81622ca7mr4822615ab.28.1759247239423;
        Tue, 30 Sep 2025 08:47:19 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bc0b0e8asm71648455ab.1.2025.09.30.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 08:47:19 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:47:17 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
	opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: Allow custom CSRs in csr_read_num() and
 csr_write_num()
Message-ID: <20250930-110b0b58ebc9ec8c19d727f5@orel>
References: <20250930153216.89853-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250930153216.89853-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_084720_431117_8E93E247 
X-CRM114-Status: GOOD (  10.82  )
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

On Tue, Sep 30, 2025 at 09:02:16PM +0530, Anup Patel wrote:
> Some of the platforms use platform specific CSR access functions for
> configuring implementation specific CSRs (such as PMA registers).
> 
> Extend the common csr_read_num() and csr_write_num() to allow custom
> CSRs so that platform specific CSR access functions are not needed.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/riscv_encoding.h       |  34 ++++++++
>  lib/sbi/riscv_asm.c                | 135 ++++++++++++++++++-----------
>  platform/generic/andes/andes_pma.c |  90 ++-----------------
>  platform/generic/mips/p8700.c      |  76 +---------------
>  4 files changed, 127 insertions(+), 208 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
