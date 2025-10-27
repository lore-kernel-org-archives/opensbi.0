Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33DCCCCF9EE
	for <opensbi@archiver.kernel.org>; Mon, 27 Oct 2025 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBJAmRC+wOHDW3fBWPkRQcLRzRYJw2Z8tLWMavSgpi4=; b=p2iI4fHnXEXRKN
	skd+38wjb7Ce8cZ4iGofnlrzC0gJhbd183EqTkrBJ/2M2nzEToQV2JxFZtCpmQ9HwPoINbuhF84vr
	nbdyi5VaN45XGG3bNJOWUB+ll2qVwMekAVJpn8nDZw540DpKiop/3gaJN/ar8SjaFiVLwNeTMJVdS
	gANp+sXYl4bwgRkp1fptwKcYmTHPSkXKRp9ie8uVN4REn74AsatWQrFrA3NKKW4lXiA0H18DcXE3m
	v+MHSURB0tjxLbv3T1/e61SJ5QOdrkyVCcI6ZKTgdR6WPWXPWDuig/47Nz76lVdARlymUHOhTrTZ5
	KyugmRU8Wv8+cg1GY+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLDd-0000000Dkjt-2h7u;
	Mon, 27 Oct 2025 11:16:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLDa-0000000Dkix-3qKQ
	for opensbi@lists.infradead.org;
	Mon, 27 Oct 2025 11:16:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-470ff9b5820so6780235e9.3
        for <opensbi@lists.infradead.org>; Mon, 27 Oct 2025 04:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761563812; x=1762168612; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNs+hiBhIc6EO3BJ81iO7sDFOo8h7ElqVg/gQo0KUlE=;
        b=nh1AI24+XSwL65GgUFay7CIrgmVgBV+hTxj+MfSr6HvF9SpupMPiqqjs3wBmDEEvL8
         SwFPhrKU7GzLoxuCig/7LSPb4MMIWHJFD+0qebbKS4uhcZCaVrc4bXndc89IJoKhQA8F
         jEUKbKOjtjcwz5McCpP9GU0C594SjrCLzSxP9J84xMvfaplNPvqPRAemD9bQYnkualh6
         w0gEnN1ZQ9d7cnqfd7/U4SlcTZqWd/kEULiMZy6E2ylx3K6Z5CYXsdnyrWjGlnZS3qkH
         WIghF6yC82wKz9ygSwW4lJnqw/diZLF1GMmMgS1Wl0FUW4KgEbacLgQ1MpxVlDgHbbVD
         Dukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761563812; x=1762168612;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xNs+hiBhIc6EO3BJ81iO7sDFOo8h7ElqVg/gQo0KUlE=;
        b=nQkI2y861pfxYWiWvKGhKY1l8bDEoEpSPyzhe62fKbNd2Qdzznoec064GASF8LFUAr
         SPhrmQ1AgbrrdfiLGm95Vx1qRKljar4Sqqds8UfOyecH17c+dR3nGLxUxcB/X8KI/drP
         yl5ASixP1V0zVj2kdZnQkU/Qr6cX+T8wS14/aZegGCvPWRMUdL3T/opiJ2E98kp7Om8F
         c94QtejZBz0672sH9n/uBqz5lU/9JMSHRo/4kLm/U8g5Sq5GeihvEr34Pzmr3JhqGHnx
         XR6PiciDYLlLgyEUV2E6XEilEqkxi9GO5qG833Gbrhbv8wd43KM7AFHAPyQ8BSomDOm0
         FGJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUctkAhnPsbEjQ/Qmi8pqsmEtWshXmsiHf/7l0lM6o+vSVYeAA0TipoV5ga6Q0EImw28FngtrDU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+GQgF65I1avK1ozre1FVi90sVS7spCWEy6jYN5PWvhgI70YLH
	/0pq43Rpksy6v0E+6ST4IBCgBOgvvXvV6TxxkV/bSbQE0JiU3CrGfw3eGXMNmdeREQY=
X-Gm-Gg: ASbGnctZBYXV0SAzmTsNeeQFL0DLufEb5Sb42VYp7/nDZsHSY+Ak+mWxEBc8NnZ10OM
	MVOm574F8hRx6VcpfKhprs6HZW4R+3SE95pGhKZcX4WETefUWsJ7buaEyk61NydXWqSXPK8YYzG
	hJEhzekSB1mp+mBYs9TGiCHqix6XDbuS+SVMgUuB9644gZE6enLpBhP8p3oON4NM8DceeKyEH5e
	/sPcs+r8aA1xnLzeAO3nkth8BobhlcO6gH8XL5T8AfLj3g7J8lR5b5cHAwRa9RWPTzOdgTPBJBn
	GSZL5lyB7gjKbvwrMn/d9P+8n/poiODGFHyn8Hx53iNC6WkFTZMd0hnxC4+dmpdbT1IwSw1a5f4
	yISNf+LWuNjWf1yUPHGpe0kfBVcKrpSeWHYg2OKkhzGwhBOtL6Z65PobgQeGIDNjK3MfD7xhQ2M
	w=
X-Google-Smtp-Source: AGHT+IHJURJo26A3HdM5dotYkLY7hXnA5KuZsDD20wYx5vr2YJscRxY/Xtx5/x+WGQbBeOACajsSEg==
X-Received: by 2002:a05:600c:3144:b0:46e:354d:d1b1 with SMTP id 5b1f17b1804b1-47117905038mr160894435e9.3.1761563812052;
        Mon, 27 Oct 2025 04:16:52 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475dd02cd6dsm134536135e9.2.2025.10.27.04.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:16:51 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 27 Oct 2025 12:16:46 +0100
Message-Id: <DDT294QB5R6U.1SC7974LHM7K6@ventanamicro.com>
Subject: Re: [PATCH 2/5] lib: sbi: Workaround for FENCE(.I) errata on C906,
 C910.
Cc: "opensbi" <opensbi-bounces@lists.infradead.org>
To: "Benedikt Freisen" <b.freisen@gmx.net>, <opensbi@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251026202416.23550-1-b.freisen@gmx.net>
 <20251026202416.23550-3-b.freisen@gmx.net>
In-Reply-To: <20251026202416.23550-3-b.freisen@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_041654_977400_18EE30D0 
X-CRM114-Status: GOOD (  12.84  )
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

2025-10-26T21:21:56+01:00, Benedikt Freisen <b.freisen@gmx.net>:
> According to the RISCVuzz paper by Thomas et al., the T-Head/Xuantie C906
> and C910 cores fail to ignore reserved fields in the "fence" and "fence.i"
> encodings and trigger illegal instruction traps if these fields are non-zero,
> so address that in the illegal instruction trap handler.
>
> Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
> ---
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> @@ -944,8 +944,12 @@
> +#define INSN_MASK_FENCE			0xf000707f

Bits 31, 30, 29, and 28 should not be a part of the mask, because any
reserved value there must be treated as 0b0000.

> +#define INSN_MATCH_FENCE		0x0000000f
>  #define INSN_MASK_FENCE_TSO		0xffffffff

(Related: INSN_MASK_FENCE_TSO should ignore the reserved rs1/rd fields,
 but covering that encoding with the new IORW fence is acceptable.)

>  #define INSN_MATCH_FENCE_TSO		0x8330000f
> +#define INSN_MASK_FENCE_I		0x0000707f
> +#define INSN_MATCH_FENCE_I		0x0000100f
> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> @@ -42,6 +42,21 @@ static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
> +	/* Errata workaround: C906, C910 fail to ignore reserved fields
> +	 * in the `fence` and `fence.i` encodings. [Thomas2024RISCVuzz] */
> +	if ((insn & INSN_MASK_FENCE) == INSN_MATCH_FENCE) {
> +		/* NOTE: Emulation should ideally preserve the `pred` and
> +		 * `succ` fields, but that is not easily possible here. */
> +		mb();
> +		regs->mepc += 4;
> +		return 0;
> +	}
> +	if ((insn & INSN_MASK_FENCE_I) == INSN_MATCH_FENCE_I) {
> +		RISCV_FENCE_I;
> +		regs->mepc += 4;
> +		return 0;
> +	}

Don't we want to hide these workarounds behind a config, so the code
doesn't have to be included in builds for other platorms?

Thanks.

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
