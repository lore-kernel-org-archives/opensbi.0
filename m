Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F776C61DB9
	for <opensbi@archiver.kernel.org>; Fri, 28 Aug 2026 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yXLqeYrK7/W/hhLNW5bfCpzSCc72uvsnfAHDUlwRRc=; b=KTv5Udv0aKBpb2
	nsxaotKSeLr+a/W/TIb+yKaUgZhDfipVp8zU2hFvl5pLQn1v5HbFFoT40R5NbFpiIwwQLp+VGMxLb
	pb/tgcpi/kjAuflHvz7R6a8mNQXFgW1yQal+MhKU386NdEu1rAmHMirb0Mm934BeAvffQbmEmbnWf
	20Fb7bxU8YMePlceFIvmrsWp7vW0iKrrNvLp2pL+J4FkrYbuD8A85kmz9DTqRyrXIibGgFZRirldI
	Pf6Mj0e8D3nII0BikCTMRxjV32sOXm4aTaum73a3P7qoET2viGuTHr2iVFJ948MS8qKpLJvXM499R
	fsHiLJPU/uU3J9b6MUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztgW-00000005YyN-0tG0;
	Fri, 28 Aug 2026 10:19:44 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wztgU-00000005Yxs-2G9C
	for opensbi@lists.infradead.org;
	Fri, 28 Aug 2026 10:19:43 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so931653a12.2
        for <opensbi@lists.infradead.org>; Fri, 28 Aug 2026 03:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787912381; x=1788517181; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AoL7bihukPbUF+4xe0iFskWqncydtMTPk63DUX3pDiM=;
        b=K8ddkACoDGDypqhGS1LbbK0E+lwHThorArO4HjxOH1AyTJ2c6sfrMKAjUDU68ny4Dj
         7Nijrz0bL42qKwEat60SPjkRA1HT8HZ6qRr4P8c7lnFldpsFQ08QDWkaTYwkB/MM5c81
         Qo7sxxImeH1r13j5GGklRQCC8fyog/Uzcvqdc5inTsY7/Z6kTFegFkSnRqhXQHMz90g8
         wUlQK4LjNQTQPdif8E/QDP2C3a7M4NxBftbtH9c6TNBRojW6CNMkrx1Pd+7bGkunNoJN
         ejpEF6GcC3fhZlk2hgpr9Q6co9747cyzclG6/QA9OOtYdmNq3fOwbMmCdG+ZLz+BSB2W
         kkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912381; x=1788517181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AoL7bihukPbUF+4xe0iFskWqncydtMTPk63DUX3pDiM=;
        b=bn9zNU6SAZhOxf6FSLBNGvRyJjlb75mRM3r9+J4Zhn9/e88hkwXRVadMFsSr2Z6axY
         v4SYH9f1F4h85fVkkBaOWz1K0lCRMhX1p3i5wEEUbN11C4mdGVdEBsd9TpB6SvJXVtR4
         FAYXpTKMJd+6RS9cro9rVHlt14I6342LT0ZY84g1TBMlvvZcldD3qBJ55v9mJY3QAwzk
         Gun6Gc+FVZ+lo9IpwxKn2X2BDICc9SZogIf/p5CYNg77qISwNV+sVn1qp86hLqb6m93p
         5cwhVS6g0WPk6QvG+0Dw+6NUADXXY0gO2CAEGZp6uNesJihCpkcBojGYL5ivGzRouRBd
         2IiA==
X-Forwarded-Encrypted: i=1; AHgh+RrC6nKvHWHugMcl7bKcN6uChTKPRaMKyBKnZyX60E93EF1ZUUzqH9LknxHtMvU83hOHZRzJDQQQ@lists.infradead.org
X-Gm-Message-State: AFuF++nIcoy5fzDOp1lvglRbFzareEGy703BxZ0R2MMb5XOvzSA26aol
	o4gpsIOwiNC915F9IsecdbXdrOOFzS5k1Bha4HwZjkXRnlxnYZ7Z8Jjh8UbWEilJb5Y=
X-Gm-Gg: AR+sD128WBeOH/+ZQegVH5cUXAYPGtiP+lfozNvLG4YHVOf6H8Fmzd59xQQC6PXWx4L
	YWbCjz32D10Kyy3tg38/itR/5ldDiwY6KeEUJM/MKz/zqQEamxv6hYlP7y0XYkPZKlzFK4+/Z+O
	rxK6w8wIH/+TBxcMwTMI5rcnZPDF+4mP932qsAD759oWfLP3AIZPrRO790D/tDRDW5PwP58ebp/
	BMJUR2uVMuQ2sAb4KxIxCBw17nBqvY2BkKkruaLkDiB8C/k1BfBnBpye1tOXyM4VRbyZlHSzYg3
	za4tAyvwnLsIdUvlOym696cI7xafSpGk51KNQLHCZtBfYmNwl3UnRNjdlZ9Zssx3BqOetHYp5m9
	EWamQ6XcefL19JgqloyN5/3obICMCE8n2gY3+h103lQW8eChw3wAqkjEzysUCQjIAA9tc7Fk79M
	aLk8MvjchX9SX1w4uPNNezeKUJSKhPAO1FYbB0pY5n77fFnI9V27rpDdt6qQ==
X-Received: by 2002:a17:90b:2e0e:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-396d0e34e0amr13215071a91.2.1787912381218;
        Fri, 28 Aug 2026 03:19:41 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm1999587a91.7.2026.08.28.03.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:19:40 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:19:36 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
	Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] lib: sbi_domain: Introduce domain intialization
 order
Message-ID: <apFguEZuVsjvulZr@plin-1878>
References: <20260817143025.3068512-1-anup.patel@oss.qualcomm.com>
 <20260817143025.3068512-4-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260817143025.3068512-4-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_031942_580969_9E34C9E3 
X-CRM114-Status: GOOD (  18.11  )
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

Hi Anup,

On Mon, Aug 17, 2026 at 08:00:25PM +0530, Anup Patel wrote:
> Currently, the domain initialization order is implied by the order
> in which domains are populated by sbi_platform_domains_init() from
> sbi_domain_finalize(). This is not documented anywhere and forces
> unecessary ordering between domain DT nodes.
> 
> To address the above, introduce per-domain 32-bit integer to represent
> intialization order (aka "init_order") where domain with a lower
> initialization order will be booted first and two domains must not
> have same initialization order. For DT based domain creation, new
> "init-order" DT property can be used in domain DT node to specify
> the initialization order. The ROOT domain is assumed to have lowest
> initialization order (aka 0xffffffff).
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
> Tested-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
> ---
>  docs/domain_support.md       |  5 +++++
>  include/sbi/sbi_domain.h     |  2 ++
>  lib/sbi/sbi_domain.c         | 21 ++++++++++++++-------
>  lib/sbi/sbi_domain_context.c | 17 +++++++++--------
>  lib/utils/fdt/fdt_domain.c   |  8 ++++++++
>  5 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/docs/domain_support.md b/docs/domain_support.md
> index 82f155e1..655bf474 100644
> --- a/docs/domain_support.md
> +++ b/docs/domain_support.md
> @@ -39,6 +39,9 @@ has following details:
>  
>  * **index** - Logical index of this domain
>  * **name** - Name of this domain
> +* **init_order** - Initialization order of this domain. Domain with a
> +  lower initialization order will be booted first and two domains must
> +  not have same initialization order.

Maybe the init-order default behavior (FDT offset fallback) is
worth noting here.

Regards,
Peter Lin

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
