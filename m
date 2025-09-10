Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC212CA101F
	for <opensbi@archiver.kernel.org>; Wed, 10 Sep 2025 05:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hide/snww/pSdRFTtBMo/rNSVkBEWXzdjgMmvr9AH0=; b=U0yZ/j0AjvDrs/
	+Va4uLP7juEk0sA/jmMAwzUNNN5gmC7tYglRnpj7w24gkER/G+UK9bsm2pVeua1i8lWfU+Do1yAND
	XdOUwsx3ghuV2fdHmTWYIMkTm4L++8K+Rbpmv4Qp+nooOMwSuXvY+etgYsB5rC7wfB9Xqage+tCIt
	IQPGo5S2Xf722QEqx4xLeFQfUvZDR880bejlDoEfGfMaogJd2aC6VpuuDcszVEX3vuScCNAXXeetI
	mBo4xDGJCAnLhTg7ABejKIF9CLtNyA6flvbmaRdQcd+hotBBJMozyDc2WnztMyHQAR5gpm1ByKYpm
	OthFI32V98Nw8r867kRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwDRa-0000000CBeX-2gyC;
	Wed, 10 Sep 2025 05:32:34 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwDRY-0000000CBd5-1v3I
	for opensbi@lists.infradead.org;
	Wed, 10 Sep 2025 05:32:33 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-40613af807bso17884295ab.2
        for <opensbi@lists.infradead.org>; Tue, 09 Sep 2025 22:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757482351; x=1758087151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjUGhb+Z/6CNoAbIR1XCJpFRyR11WwkmjUdhbqV4S0s=;
        b=ZxefF0+yKUY8ooA6dzEnaiOt9FmUoQPrwTt76tF0FXJRjacUtFsjsnlz2i5q7Sr5Qd
         NtV48TkR8t7LRyoSJivetp0+lbR/Hcy05MN2idze9dTePc/MoVDZe/PVfAiPFvO5tjha
         jnfCbCUSZS4iH1rmKFxm3a2gZVejHHmTwC0Kc850VtdeqOV3WqOPJ4Qgvh+AUOecUWQ2
         sqWZ73PvsmLfm0253mPOReH+EXIwFf4ECgCsmMF+kS0gt/sWtnqi9ZMB/fKcphEBfw12
         aqLODA5di5EPZF6eih5j81jtxmOBLbchQoXiCBLCnsZsZ1KDcoSRQbrizAzeVnhN9ahT
         dhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757482351; x=1758087151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjUGhb+Z/6CNoAbIR1XCJpFRyR11WwkmjUdhbqV4S0s=;
        b=a3JQ0KN7/ej8VWkvg/Rg+/9ij4YwvnndRLEfTM6k8Ek43hz7YOYNcberFAho1bSRBD
         /t3bUn3lSLG4s6HCezomzXigjVwz92lzhQRQNEcJqL4sYpzpfwlJyBk4hSuGUolIw7YH
         CB8oVghFMrAVkQUqphUbA4RJvNtMKLrJyv2zSa3XWu+HkrUsUUnjZLrnYusa+p2rioU7
         zkOtyemkdJyyyWHjqZO+hDRjiV4qPoqt4BENq1LK9XalJc6620twPFXNytJvaONYi+4r
         2zXYrzuSBqxvMcZV4uyYrJIHlwci66aGO+QkFR6bqzzkMaGUwots4Z9MuLkzji4cvQ4P
         MlPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHGVLtEVLO5gXKmX6zrpIFrfNYRFX0VAkWJh+SnHF2Kq8n69d3+CKIRIdqlKmzCcDOEQ4VhVnw@lists.infradead.org
X-Gm-Message-State: AOJu0YySGVM/BOfmSs0zdwvLYeLGZRABqmkhCOPMGHGAV9k0quNsvOfa
	HeddSLUBRrbP/xxwHekT2bwyfm0ogrSJLIVG2borQLbYGdGgcjvQTdWVi7yZwIYc7iE=
X-Gm-Gg: ASbGncudlOZLErwD6Wa6fma+6H9yE/sgLn0HpcRFM5yiqXPgBVcFjdLdWy7UItPz/nZ
	TO+jn/ibkw64u8ZQ9N6drX5fdZeQjazEwzaZsdN8jDggzVW9DgsjT4WKukuzI7uu2Bi7MEnkVLh
	2rTVh/Mipeu2yRX1YgG2oZ95UiGYEf+JZxEEUU+P+LAx4EVWZlEn007HMRxhZ4srQeOVIJqyL7o
	9lzRkUvtQQ1tFbP36pKN1iKV9CGug2xOlr2ucog0ZcgcZ9y5DzszpaKmqRT35dGHu3VFsKBfaIF
	PYVMmBjntXM/BolZAw9lqS/bAE7TiTtImOZWh2EtqBI+QwxMzIgt3cKc08aaLYArHWOqKCDATz0
	LsSvDxr//T/D7k8yohNIo9S1LZKAg+JrWWRlei8o8RcrOhkMHYw==
X-Google-Smtp-Source: AGHT+IGsrpV4o8yd1qMYv87OlMMkTNmkX/ubdPlH0LoEZNaUiWxR0U+vtNwTHWqAR6gi7fVe3DDK2Q==
X-Received: by 2002:a05:6e02:152e:b0:415:2b3d:651a with SMTP id e9e14a558f8ab-4152b3d66ddmr41309475ab.7.1757482351434;
        Tue, 09 Sep 2025 22:32:31 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f31ca99sm10608151173.51.2025.09.09.22.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 22:32:31 -0700 (PDT)
Message-ID: <1f1c14d4-4637-4991-87a3-1cf3327eeef3@sifive.com>
Date: Wed, 10 Sep 2025 00:32:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib: utils/reset: Hang the hart after RPMI system reset
 message
To: Rahul Pathak <rpathak@ventanamicro.com>, opensbi@lists.infradead.org
Cc: rahul@summations.net, Anup Patel <apatel@ventanamicro.com>
References: <20250903144323.251270-1-rpathak@ventanamicro.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250903144323.251270-1-rpathak@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_223232_510437_5AD2EE3D 
X-CRM114-Status: GOOD (  16.90  )
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

Hi Rahul,

On 2025-09-03 9:43 AM, Rahul Pathak wrote:
> RPMI system reset is a posted message which
> does not wait for acknowledgement after sending
> the RPMI message to PuC. Call the sbi_hart_hang()
> to hang the hart after performing the system reset
> via RPMI message.
> 
> Fixes: 6a26726e08e4 ("lib/utils: reset: Add RPMI System Reset driver")
> Reported-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---
>  lib/utils/reset/fdt_reset_rpmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/utils/reset/fdt_reset_rpmi.c b/lib/utils/reset/fdt_reset_rpmi.c
> index edc53932ccc0..c29715d329c4 100644
> --- a/lib/utils/reset/fdt_reset_rpmi.c
> +++ b/lib/utils/reset/fdt_reset_rpmi.c
> @@ -7,6 +7,7 @@
>   *   Rahul Pathak <rpathak@ventanamicro.com>
>   */
>  
> +#include <sbi/sbi_hart.h>
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_system.h>
>  #include <sbi/sbi_console.h>
> @@ -56,6 +57,8 @@ static void rpmi_do_system_reset(u32 reset_type)
>  	if (ret)
>  		sbi_printf("system reset failed [type: %d]: ret: %d\n",
>  			   reset_type, ret);
> +
> +	sbi_hart_hang();
>  }
If rpmi_do_system_reset() returns normally, the generic code will continue to
sbi_exit() and eventually sbi_hsm_hart_wait(). Was that problematic in some way?
You've added a Fixes tag, but it's not clear from the commit message what
problem you observed.

If allowing the driver's .system_reset callback to return is problematic (some
driver implementations hang, some don't), then we should mark the function type
as noreturn and update the remaining drivers as well.

Regards,
Samuel


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
