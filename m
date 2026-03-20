Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C625108B91E
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 12:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVM02sxH8JVxsmSc2hPtrC/781pZWoBTVEYYKB9K9JM=; b=qzT95LuZsQoNGo
	yFKTrHET9hlmoCQtvzgE71yL3PmpH4awRF21LR9pEmsdBgeKbwcWPaIAv5a1q9dN75DxIvMY8AIcT
	3TRati+eO73hl80RmFUn8AtTv0Bif0EJE1I2nildaMDQ+g2KALpGXxR8IzBB9eFnQOnLfT292lY6f
	X1xlKSryfzjckBHuyJvw9sNORHWW9PsklPCVIDkqznZezZluwT+iCQuuUIUAa/pPPfN/aOfg0aqFj
	1aFcfEgtP/uHbRcWXRzKcR3KmxJN1Qr4yB6SEv5Qx9oyt+7g070d3w2EjyyKf9JZvL6lDkY994YTj
	G0kUvppE3z5QiIK0pQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZFd-0000000CoDe-3ygF;
	Fri, 20 Mar 2026 12:46:53 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ZFb-0000000CoDF-2PNH
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 12:46:52 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-38be66a9fc0so6801391fa.1
        for <opensbi@lists.infradead.org>; Fri, 20 Mar 2026 05:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774010809; x=1774615609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Kc/AXm9hRgcioNAggeuC6RzeBrw67WBklrdo5cCrZU=;
        b=cSKQ449kKvjpoLNg1AymZ7pxDqlwzagFqmSifhW+Bz9/59MbPY+3OOdYRULT3zDHS4
         80KKBlLde7HCtiEjdQ28YYnuZoBicRKlSOwz1xPg5mg8nToascEthkY/iuNi7JkIvIbq
         TJWxXOC2+MDE9BK9UfsPyX9/2triHaRLtEwi/PiW1ezuqbp3uauo/37RUa06Qrzemvl2
         G0pjfxYfSp+SLRb48VMu5PwQOpPaHnucvX6+tEymnTgWQje06IGpRgz80PXtoFsWlUAq
         QIt+cg5yDw8Fev3TLKD+9XAPcfLGw4txcWZwmD5rD1U4LFg2a3vWggp1xecnM5KnYd9F
         46jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774010809; x=1774615609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Kc/AXm9hRgcioNAggeuC6RzeBrw67WBklrdo5cCrZU=;
        b=h5SFka0pcwgDSJsIRtRnJiXhqqSCSXJ8dKj/HeaWkfRRLXcebX4fRCIEqRoopQd7mM
         r7FvMrMr1jTM8i9PebJJCuwKpaUgxS9/EZ+GriqAxQa0Y0k1vgMMtwbc2wAVjKJnSbiH
         5b+4Y+tE1SvWKmon/1+5yZmEC76zGNL9WP6+Gwu573GSXy+T/IzTK92lkBiIrT/4s2Vu
         Pj5p5yZ0x/xU8mfofw2C445ZEwotblfWbm0c73E07RcfJ5KnrePChHWlRFfS7H1ryAi8
         H8lLshaBj9FFfc2meCb/f4JAS0pQlEIL8QqmmDhfEyJDryQNYESmTvfHF89ZsrweHR4U
         AgrA==
X-Gm-Message-State: AOJu0YyjOyWKHTwVykmRafpBhX4fcZOp8YYX95iifa3jTvIy0Wds0LHD
	a60IUvHzmGr9VIvNTWZ5SQLgI5sFVgKiAs3d+2+Az9oijqhs+IoULgNg
X-Gm-Gg: ATEYQzx6STnoQnALX6M9YRi/c4P2zCgBzgxgcUGyx4Td9XSa+P1yGtDjv9RdkOmBzVB
	wnHLflWEKZYu31fJGMrwsHeezSOrWkbfa04eOC28MXHsy6BEQvo6hRVqNP4/bgwhlW4meWDiE+6
	qCxIBWDBOl9zxzA02JjtfsD3PRtJ6UqokVdDU7Pf8/mGRHJ42ocyDCtgtHn+lb34OF+Yd0X8uTc
	lY0sIOvrsQ5RgfvxMExeEGN8N3JYo5OFIogYewwZ3vdtXJyfuZgqi0++OqDiALfzMxZQEzZMzuS
	5hjvDvx3pejiaZ+2Gu4rwp7fGYeODuxKH0ti2xcIq+xcybMNclYl66tygG6o2GEPJa8+uPnpLTl
	SFfiGRohBwJ1kIpUSu8ZNVci7TE9WNKY63PhEjmOUt0YjR4a1yjswwSbJA6Q7Id4+Us3aL32aqW
	FmwKSCZkL8SZrozjjezlHe23o8T8U+
X-Received: by 2002:a05:651c:f13:b0:386:fe97:a554 with SMTP id 38308e7fff4ca-38bf9603bfdmr11443951fa.6.1774010808344;
        Fri, 20 Mar 2026 05:46:48 -0700 (PDT)
Received: from imamay-pc ([46.73.133.192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972bbaasm4670591fa.6.2026.03.20.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:46:48 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:46:46 +0300
From: Ilya Mamay <mmamayka01@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: Re: [PATCH 01/18] dbtr: Add consistent range checks to trigger ecalls
Message-ID: <20260320124646.zd4cblhvoisk7flb@imamay-pc>
References: <20260313051948.4017134-1-npiggin@gmail.com>
 <20260313051948.4017134-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313051948.4017134-2-npiggin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_054651_647289_D870DCF1 
X-CRM114-Status: GOOD (  10.12  )
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

Hi, Nicholas
This is a significant improvement over the previous version!

I have a few comments below, though they may be off the mark since they're
based on my own reading of the SBI and Sdtrig specifications.

On Fri, Mar 13, 2026 at 03:19:30PM +1000, Nicholas Piggin wrote:
> @@ -594,6 +597,9 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  	if (!hs)
>  		return SBI_ERR_FAILED;
>  
> +	if (trig_count >= hs->total_trigs)
> +		return SBI_ERR_BAD_RANGE;

According to the SBI specification (section 19.4):
- "The sbiret.value is set to zero upon success or if shared memory is
  disabled". I interpret this to mean that sbi_dbtr_install_trig must return a
  trigger index along with an SBI_ERR_BAD_RANGE error.

- "sbiret.value is set to the array index i of the failing
  trigger configuration". In this case, sbiret.value should be hs->total_trigs,
  because that is the index of the first failing trigger configuration.

Same comment applies to sbi_dbtr_update_trig.

> @@ -710,14 +726,14 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  	if (!hs)
>  		return SBI_ERR_FAILED;
>  
> +	if (trig_count >= hs->total_trigs)
> +		return SBI_ERR_BAD_RANGE;
> +

Regards
Ilya

> -- 
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
