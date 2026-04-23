Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE9FFAD41B
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IY2D19uVBqT9LwMSB/WfWC2NX2KnpqrQI4puy+nSCvI=; b=tzNlBHacc+VjHB
	ukXLt2NAFPxU2NBWxovL2Psjd2AMOxPyDX8rtyVQWNWnmKzvVTwRLXASk6J8y8LYhq4XmFdgRSVY3
	NEu2lx97DjUjhDMLresRTxuHksZWdWFGDNeGKRJO4jPIWDZ5zDEKzP401XuR2u2Cbd/B1hy7PD2Hf
	RZTGAYlNegpKpRlxD+CYzhbj7Z+n3wzv1SKNF4CQ90AibyKUCfRUPG2Wz2uM+gsm2DAQoWsYnwVxl
	n3Z6xPDY8BeFP3o8lz6VO2AnykpOuLoT9Xt+A2/8rJvXUq36z2wc8nPfnytlWe0cV4Z6HYJH2ODb7
	Y8kB8mX3xymj0uvz15uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnxx-0000000B7e8-2DMM;
	Thu, 23 Apr 2026 06:55:13 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFnxu-0000000B7di-4B8G
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 06:55:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82f351ca23cso3220000b3a.2
        for <opensbi@lists.infradead.org>; Wed, 22 Apr 2026 23:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776927310; x=1777532110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=URuSGAsS9KLv+PwEo0Zkq4WjzR3BykDl1zbCnHavGow=;
        b=Wn5iMOH3SH2chtjQu/TBWtj87xBaNRhAnKW6ZJSzV6lEqV6CYP/cU3zkpXId8eQ81v
         yTINkxtvyFylHYd7RwYbD9+T2k8aBq7qmmlvewxbUayd/BtwmVcXDw1zl4fS1VJigFpG
         NkzaLRyYDuNFS23Gguu/VfRnB1yhgS5Mq0FLeBEEW2IYmCii/GqS++PtTMMDfUnl1CQ5
         tEFWII/C1Zd7RERP0Gb1tXEQOwsucPAG3MQz9JETf+I1syGyVRu2cV+VZYli/nl4vquu
         8Drei4EAdH+uYUrqSKtUGlfvSBWPviBCNd2ni100L57PSd7QyPRE0W3l7CiJ8LDI54AL
         0MBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927310; x=1777532110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URuSGAsS9KLv+PwEo0Zkq4WjzR3BykDl1zbCnHavGow=;
        b=Iu660TnUUetvJQvV7osHL8UhOuT2D+JSlAsYJtv+ohfYUKMEzwxna4CGkBzIhh52dI
         Bs5uYW4x3PHeWvoDnjFBv99LQ2TxPiUswm6xOfZBS+KrIED0tiQz4Zyjw30Vj7+2/xVP
         Ua9PX8hsmPYYfOctWC+qFiwfUcewzwIc6TCUKyyBZo0/ECXUV3edKN53goryVmZuCJJV
         5k2ZiJ/eORiDOuaHwJcLpfjge70pEzL2AY3TMxQVzGsW7W/6XcsUmckZTNVDtVDoBybo
         BwPg60a1Xydx4qwEo3uDCUCp3JfI7QkVzbMcRvf1+QvxbLqFk0bZKrwSbN5qyBlDNo1c
         XRjA==
X-Forwarded-Encrypted: i=1; AFNElJ9LW2VUqHvcwRBySMJzN6Xh/DyC4W8zuiPnntHuJJNquKP+BSYaUvMmWLhpAflvm8ZVQ4z3PYWO@lists.infradead.org
X-Gm-Message-State: AOJu0YxVbH/TUjMjmhbWvjJOsuo5ATsV3KyQzNO+LUzar0OB3AX4gAb0
	K+zvFVPTjT9lzW15oGyYlqJmaQ3Pm9dU+Wl0bCDDI0NfqsiVBurP/oDR
X-Gm-Gg: AeBDiesF8sKOlioXCHW09jqiXfvVQcx2a9n7a+gGo5CXl1NUe2lghjh2vaRHdwyvU3F
	pr8rKoNPBBbaxY1YcERF9VWIP+8vBtdjTitH4N4lfkzUf0jFIRm9wxESr6AdjBVr2igdj/oI/cW
	+kXJ3wiFHtHw7HOoi+GkEpG4meuGnSnVmrwE5MjbTXMwlWxHCrijlbPdGSwtAv5gUq4YCXfbaAp
	bkUuEoEJnCZO21DqR/306kWwM83KrIrru0GTB/LkOCzj9zttdNl2gmdpXes7rwoxwUGiz7GSLZG
	WFwUUWp03zplaQW6lWIYIl+UN3124Jakmpe0R/qLHoIXGMR1P++T8kQG+MSh2YKWWCUII+K7kc9
	8OyFYCkMgx8O+K+d06C1WKXxQpx34IkYXD6K5lj7RL5ZvVvew2vlmTeadeRE4Oav0qEZLK6glXD
	lICxzBTJ9IQDluITEgiMKfMD+2BQWInIaeOTw=
X-Received: by 2002:a05:6a00:2993:b0:7e8:4471:ae55 with SMTP id d2e1a72fcca58-82f8c92a621mr26505208b3a.33.1776927310097;
        Wed, 22 Apr 2026 23:55:10 -0700 (PDT)
Received: from localhost ([203.38.38.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe74d8sm19596658b3a.46.2026.04.22.23.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:55:09 -0700 (PDT)
Date: Thu, 23 Apr 2026 16:55:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: Re: [PATCH 1/3] include: sbi: Add sbi_scratch_hartindex() macro
Message-ID: <aenCOuhEsaT1c9KK@lima-default>
References: <20260415110002.2610929-1-anup.patel@oss.qualcomm.com>
 <20260415110002.2610929-2-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415110002.2610929-2-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_235511_041858_2D201BA4 
X-CRM114-Status: GOOD (  15.47  )
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

On Wed, Apr 15, 2026 at 04:30:00PM +0530, Anup Patel wrote:
> Add helper macro to extract hart index from scratch pointer. This
> can be used to check whether scratch pointer belongs to a particular
> hart or not.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  include/sbi/sbi_scratch.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> index 58d54628..c12aa796 100644
> --- a/include/sbi/sbi_scratch.h
> +++ b/include/sbi/sbi_scratch.h
> @@ -166,9 +166,11 @@ do {									\
>  					= (__type)(__ptr);		\
>  } while (0)
>  
> +/** Get the hart index of a particular sbi_scratch */
> +#define sbi_scratch_hartindex(__scratch) ((__scratch)->hartindex)
> +
>  /** Get the hart index of the current hart */
> -#define current_hartindex() \
> -	(sbi_scratch_thishart_ptr()->hartindex)
> +#define current_hartindex() sbi_scratch_hartindex(sbi_scratch_thishart_ptr())
>  
>  /** Number of harts managed by this OpenSBI instance */
>  extern u32 sbi_scratch_hart_count;
> -- 
> 2.43.0
> 
> 
> -- 
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
