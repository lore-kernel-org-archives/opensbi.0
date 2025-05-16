Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96602C3ABC9
	for <opensbi@archiver.kernel.org>; Fri, 16 May 2025 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gelHmogJ6OP3WJMKbWiGAK51+fNWhmuSey7UCK18cLQ=; b=lLeNneB980DdEy
	A2uXi2YIzcHLylwH8ZTnNJdKnOFTlRzngGkgQYLbUhERfmqzxl6/kls2pu1nOQo3aCkFIR8Bch7zi
	VFm64tnJkhcgZzrtqLA9FoKa9zbPgHloAXKUuelbSSPbuLhc1mIW4KLmKK2VG3liJP3K7PVKr37AC
	t5+lTR717cDxnoE+mjij7YLf3idLspJ6PQ+vZQcTdPnstV7wbJLnp9X/pNmM+qH6ROKttSCrxnbwc
	XsEqo5U5IoRTaPSgTvxgQ1rJwCSddBNZmz+L4vnp1Kk5wuYkRmJxqMxNo6BK7Ub6E3gCg0EJrt9El
	sQNIADoCy4eF03ETqjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzvr-00000004LZU-0mYf;
	Fri, 16 May 2025 18:37:19 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzS2-00000004GHi-0DiK
	for opensbi@lists.infradead.org;
	Fri, 16 May 2025 18:06:31 +0000
Message-ID: <aa20489e-485b-4769-aeeb-81e5783e7c5d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747418776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TTFM7wWaUqAG8I02nUF+EUdB8BHPzLiphfJ7K/KtBkE=;
	b=NeW+6r8ucaOwTTYkSa7rsyx8h33WZp1RY/YMBL7bkyl7mXJMJRiv370Kd0jmBODDa20qlc
	Y24FtyESMZ1fxSdQHaq+I893btsjRXbs2PP60feElihU5Vjl+TV2rfTjsK6lEd912cWVIS
	IBm7MmuY1lRp1P77cYilEgJcnbkL65U=
Date: Fri, 16 May 2025 11:06:12 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] include: sbi: Change SBI spec version to 3.0
To: Anup Patel <apatel@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 opensbi@lists.infradead.org
References: <20250516122844.113423-1-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250516122844.113423-1-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_110630_529852_33C389F2 
X-CRM114-Status: GOOD (  11.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

On 5/16/25 5:28 AM, Anup Patel wrote:
> Now that SBI v3.0 specification is frozen, change runtime SBI version
> implemented by OpenSBI to v3.0. Also, mark extensions defined by the
> SBI v3.0 specification as non-experimental.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   include/sbi/sbi_ecall.h  | 2 +-
>   lib/sbi/sbi_ecall_dbtr.c | 1 -
>   lib/sbi/sbi_ecall_fwft.c | 1 -
>   lib/sbi/sbi_ecall_mpxy.c | 1 -
>   lib/sbi/sbi_ecall_sse.c  | 1 -
>   5 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h
> index 88a69bb3..15400e5a 100644
> --- a/include/sbi/sbi_ecall.h
> +++ b/include/sbi/sbi_ecall.h
> @@ -13,7 +13,7 @@
>   #include <sbi/sbi_types.h>
>   #include <sbi/sbi_list.h>
>   
> -#define SBI_ECALL_VERSION_MAJOR		2
> +#define SBI_ECALL_VERSION_MAJOR		3
>   #define SBI_ECALL_VERSION_MINOR		0
>   #define SBI_OPENSBI_IMPID		1
>   
> diff --git a/lib/sbi/sbi_ecall_dbtr.c b/lib/sbi/sbi_ecall_dbtr.c
> index d28fd396..9c496c42 100644
> --- a/lib/sbi/sbi_ecall_dbtr.c
> +++ b/lib/sbi/sbi_ecall_dbtr.c
> @@ -69,7 +69,6 @@ struct sbi_ecall_extension ecall_dbtr = {
>   	.name			= "dbtr",
>   	.extid_start		= SBI_EXT_DBTR,
>   	.extid_end		= SBI_EXT_DBTR,
> -	.experimental		= true,
>   	.handle			= sbi_ecall_dbtr_handler,
>   	.register_extensions	= sbi_ecall_dbtr_register_extensions,
>   };
> diff --git a/lib/sbi/sbi_ecall_fwft.c b/lib/sbi/sbi_ecall_fwft.c
> index 3519285e..2277405e 100644
> --- a/lib/sbi/sbi_ecall_fwft.c
> +++ b/lib/sbi/sbi_ecall_fwft.c
> @@ -45,7 +45,6 @@ struct sbi_ecall_extension ecall_fwft = {
>   	.name			= "fwft",
>   	.extid_start		= SBI_EXT_FWFT,
>   	.extid_end		= SBI_EXT_FWFT,
> -	.experimental		= true,
>   	.register_extensions	= sbi_ecall_fwft_register_extensions,
>   	.handle			= sbi_ecall_fwft_handler,
>   };
> diff --git a/lib/sbi/sbi_ecall_mpxy.c b/lib/sbi/sbi_ecall_mpxy.c
> index 03ac71b2..0a5e3525 100644
> --- a/lib/sbi/sbi_ecall_mpxy.c
> +++ b/lib/sbi/sbi_ecall_mpxy.c
> @@ -67,7 +67,6 @@ struct sbi_ecall_extension ecall_mpxy = {
>   	.name			= "mpxy",
>   	.extid_start		= SBI_EXT_MPXY,
>   	.extid_end		= SBI_EXT_MPXY,
> -	.experimental		= true,
>   	.register_extensions	= sbi_ecall_mpxy_register_extensions,
>   	.handle			= sbi_ecall_mpxy_handler,
>   };
> diff --git a/lib/sbi/sbi_ecall_sse.c b/lib/sbi/sbi_ecall_sse.c
> index 303c0f2d..b7dbf072 100644
> --- a/lib/sbi/sbi_ecall_sse.c
> +++ b/lib/sbi/sbi_ecall_sse.c
> @@ -59,7 +59,6 @@ struct sbi_ecall_extension ecall_sse = {
>   	.name			= "sse",
>   	.extid_start		= SBI_EXT_SSE,
>   	.extid_end		= SBI_EXT_SSE,
> -	.experimental		= true,
>   	.register_extensions	= sbi_ecall_sse_register_extensions,
>   	.handle			= sbi_ecall_sse_handler,
>   };

LGTM.
Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
