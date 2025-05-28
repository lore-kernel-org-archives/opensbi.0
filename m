Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A057C54ED1
	for <opensbi@archiver.kernel.org>; Wed, 28 May 2025 03:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leWMSshSgakAVLVxDY7qNVz3/2OCy+0Nm441YpqTwFI=; b=wo+RdNoKkeV4dY
	JrEXH5Q8MshD+TDTiek7vRMk2E6i7PqvsEZRKUJ8sD4wRaiDFt6NWfJnHdGpnPSPZBnuCUTkQQGty
	oUcWFOFw1/UU98UDR9sJiF1XmcD9VqP8gqC+N8rl4ZgW9d5FEJVvB8IFezBoZ/ek4FWfcHDL/uwXl
	EV+yktX9Y122JrXGpQwaWUdySNVJ4weqOUyH2hPBh8qjoLZSZ23pQAMeJGDBiEb4u+9E6ICoHINUT
	TqMSfC17Y8s5rjMUAwAEj2s4DH34sYstT9HrEjvNhZSWCGAjEkD7SKryZKe5PoI4ql8OW9Lg71WTZ
	F0GslK40GY0eDJhYFF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK7GM-0000000C1zr-3mC7;
	Wed, 28 May 2025 03:15:30 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK7GJ-0000000C1zT-16uW
	for opensbi@lists.infradead.org;
	Wed, 28 May 2025 03:15:29 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736c277331eso347212b3a.1
        for <opensbi@lists.infradead.org>; Tue, 27 May 2025 20:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748402126; x=1749006926; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y+UevJuumGiYLwUrPjqUNAAVegOQINUprV9GiaBrA3g=;
        b=QGoKj98G7EJrGVft9Z4thVSjA/n+xc/NM8dyvhSQV+Eu0iRtTAhQbFIfNZ5pQIOFqa
         xAEyDNfilV2BUtT8s/I7NtldVshDA3bmcPrdeR4gXvjb+YmmJPgYIvaqxMSC3fYC7hkI
         3vjfkpD8qdccpwQQid5pCOrkDuaGDn5c17P8DKrGCHjsG/T2hTnRNstkA7BuICuI930B
         YZp1J9fPg16xt3XfzCgoEa3TAudfVLgOB7JeEHLkT3Xkr1yBHykyxiks/pUI1Dj4or4Q
         Q9Swu69q7Kyjbm2EeuEQD0EJS5oHoWhaed/VSjAvVQYMy+bDB0Y8N7zHRG16Cgy6KkMN
         BuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402126; x=1749006926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+UevJuumGiYLwUrPjqUNAAVegOQINUprV9GiaBrA3g=;
        b=Hf6fnmEAbPg7WbMBfYgJ9DkMvAgXZ9WOookn+eNa8vUQUVuBaw6FHnyvcyRxNOfSva
         1ZB169q3lkiXWuwp3SNJEpB/ygSiL+V8yoa4qBIBA+G2xw1XQUb73R66pxWvAD61meA9
         dcjPIlLogT5vlB55Hp8hsVHUygNYq6lcdNc8WllJcXLkkZSNUjSAxF/UqHkkOjCgdHs9
         DHLu4xTrEzh74F3WpGpqSmRv6kiUD4hkF6ZGcjyy2OrZSvEpBxOjjucH3E9O+yP/bASi
         uYgUbq16squMrJuThnRvaqevUcvrLA+rc7F85QDj2+yR0EcyRbkCSeeWG/UoJuYp0dDy
         6Pig==
X-Gm-Message-State: AOJu0YzIuCtFykGEl49EaUAg6UNZImPBTuOlMddXAgaKgORtddZ+yTRI
	snUEtgKFEUIatRC9YiDiFMOjn2fbRCpuTN7A/GZuWitmcc7JN6+DHVNy5C+O1f2gPC5bjp2kkjj
	VYRjdMgk=
X-Gm-Gg: ASbGncvKISnqY606wi16JUSv6IoKPjUrZpcQT6Ij1kCmDaYV8aZ+OgVq8klpmty0Kx1
	vMvzNXoB6r5U6SJvTNWb67fULCjc0CJ2NZqwfTbjVtf49oLBYSVWxkpicDSj8c78Im/9juQDNja
	M/KpfAUfbCe6oKSYi/nkOLd/UR/+WSQUcFWTcSinypi2Z44hJVIe9Lt8LWQ/5nM7mYUyAdIbGhV
	W447nb50TYd3RqNLX4/V+6vviDtidpZ88QOsRGSTU/g7qsGntWSJln+YsBYg24BGnQsgwzHTZoi
	j4IvIoPEtz0GFgUMNcKBqXhdipN8F75I12ZoVXzpIw==
X-Google-Smtp-Source: AGHT+IG8fg0xX4MaHQ+SMseRp03MRjOZ1ORtwN/0HEJVu1wG2TPLGwylTEj8qFsH6TWPloU1JX4RMg==
X-Received: by 2002:a05:6a20:d818:b0:1ee:ab52:b8cc with SMTP id adf61e73a8af0-218ccd97137mr4706036637.21.1748402125876;
        Tue, 27 May 2025 20:15:25 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2d99eb6372sm212276a12.58.2025.05.27.20.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 20:15:25 -0700 (PDT)
Date: Tue, 27 May 2025 20:15:23 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: opensbi@lists.infradead.org,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] lib: sbi: dbtr: Fix shared memory layout
Message-ID: <aDZ_y3vX31nCLa30@ghost>
References: <20250527182713.527202-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250527182713.527202-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_201527_572019_96D0647E 
X-CRM114-Status: GOOD (  17.02  )
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

On Tue, May 27, 2025 at 11:27:13AM -0700, Jesse Taube wrote:
> The existing sbi_dbtr_shmem_entry has a size of 5 * XLEN with the final
> entry being idx. This is in contrast to the SBI v3.0-rc7 Chapter 19.
> Debug Triggers Extension [0] where idx and trig_state share the same
> offset (0) in shared memory, with a total size of 4 * XLEN for all the
> SBI calls.
> 
> Add union to match memory layout described in SBI.
> 
> [0] https://github.com/riscv-non-isa/riscv-sbi-doc/tree/v3.0-rc7/src/ext-debug-triggers.adoc
> 
> Fixes: 97f234f15c96 ("lib: sbi: Introduce the SBI debug triggers extension support")
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>

Thanks!

This will need to be reflected in the linux patch as well.

Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

[1] https://lore.kernel.org/all/20240222125059.13331-3-hchauhan@ventanamicro.com/

> ---
>  include/sbi/sbi_dbtr.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_dbtr.h b/include/sbi/sbi_dbtr.h
> index a8b3a02..8cb776c 100644
> --- a/include/sbi/sbi_dbtr.h
> +++ b/include/sbi/sbi_dbtr.h
> @@ -91,8 +91,10 @@ struct sbi_dbtr_hart_triggers_state {
>  
>  /** SBI shared mem messages layout */
>  struct sbi_dbtr_shmem_entry {
> -	struct sbi_dbtr_data_msg data;
> -	struct sbi_dbtr_id_msg id;
> +	union {
> +		struct sbi_dbtr_data_msg data;
> +		struct sbi_dbtr_id_msg id;
> +	};
>  };
>  
>  #define SBI_DBTR_SHMEM_ALIGN_MASK	((__riscv_xlen / 8) - 1)
> -- 
> 2.43.0
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
