Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B8D606A31C
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 03:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EwH/FUQP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Ma97+2/E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gbut0pTZ6kRasNli5oURG68irUL/aHIFbf4Z/SKdfwc=; b=EwH/FUQPHZCAtQssMSVrSGhDRJ
	4gWj/OQjMf9WpLSiNnQtRcEBXo9J8eIX6G29PYG7I0gPCXzDDyEVEK2WLv2J5I+yN0ZlBaJX2FeyN
	Om42yt631tg8D3c6v7VOdA4/321bLyGLfQEHye13iK82/VuCVuwl5fctuxttxUUfCI0ZNgXilyWU1
	eEyfgytwu1fUW0S0NCmV2clCVAjE6XvllYfBAJjjWof6qLEE6DqN/r6J8H9A0aKWeevArXxi2GBf5
	WfhOFSMMlb3JWjlkZ1yIS/PrrKdJ4cZfK9CO3UKoZ7aka0TqBIiG7/S+ORbKGwmnv0fcjxZUtf0gq
	blO6l6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcek-00000002J91-3rj1;
	Tue, 10 Nov 2026 03:36:22 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcei-00000002J8W-1KDV
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 03:36:21 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1008376a91.3
        for <opensbi@lists.infradead.org>; Mon, 09 Nov 2026 19:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794281779; x=1794886579; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1YjunK+cepkWYMv0RtKVJKE1Ea7pHj943aZA4lWMoA=;
        b=Ma97+2/ExAyWPDDjYc9l0nstmQs1W9mlLlDmjx4rH1ULWipxT+LLTJQPqIvEKRLs+m
         60GCmOeGpKp5yG72Y/nsJZVq9EAniH6jVMSD3Sh6/QBlpmySDnb71Qc7bKJSKuqP6ijB
         +fb8/tj0HdJsG0dJl/W2MwrqbRCswDNtH2DMHxc9gP8PWV3yYEihR1Bl/mArRWg/RklR
         7DmHifFPgTAkIxeYVdyov9+nwCTU2/jANh/+y+Ie8TNokbgqcoLzI216faWZOE46/TQV
         gqxNmwD1VecVom72T6XkUrgb/15I+HPSu6CzheNTywCkXoO4X6vN04kgNUwX35bv2PRn
         dxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794281779; x=1794886579;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1YjunK+cepkWYMv0RtKVJKE1Ea7pHj943aZA4lWMoA=;
        b=xGNES2gL3wif2zYdlHVd7sThMIOozHHfgjtmiSQLcCJA7q+kKcyh2aVRDT8vYsY0dn
         /xYxpIMlFruopndH6u4RpS2ByOtWuL1iivxJ/HywSXiccy7AvRNPPHXf85PwvO8gQrmg
         rPGvaV+DgOKReVU9ByLZ/NTiwgXwK2HpNnbS89cDDI2X5n0zDoArcusRwir89JbuqtwW
         DfS3SijK05ky+eT6OpB7WkFJ4SroCtOi4m2geggQ+ZFtTc7/cMrmvxYS2BdNfTZvarHT
         iofQpHqoBjr9hfyIpQUpd1yYRcBTvRX7Arwx5jc0GJ4ydnEZr0nFYGRwLAkk7g0nKuon
         Uo+g==
X-Gm-Message-State: APuU4Z9mNTz0AfQhOnySxYY4RCut22g5MnPJF15q2LDIx+fMqJqgNh5t
	q57AZHI05NQEyuBrnn+Ny8JfZntTNjeagBsQby4iMGRLnQReCM9e7Ay266ccfJstJbQrEhIlpky
	lbFXLhicdpd+nyfcMECY8dSQ42cUySKLMGSg/wgHtp7pIy0aD0S3iOaUZlrKWMOMX94PANs1X/W
	vVMgzItLBQbK+bE71kLNYw0NbqK7CYo4/LjTqTSnifOkOzwR5CwNk=
X-Gm-Gg: AYBFou2DE15IXL3mwyy5NzTCRKutz3sd0uhmeTbJumgOCe9TDH8IDpNh7+UccFtfgUl
	B6lagjf/ulMSS+4uWDnFMi8ICX5Xqo+yK/s53RuZqo4LqBeYQtO3mDI1N74NqdlQWpA6WFE8UQS
	Y1jr9MkBXR4ajv5NCOvki0YkiLgcxUIf7HJAqY9Bk0AACSIKqF5/ttYvZ61zowiQQ4ER2CdFz6M
	OuiHueBpHt0xrbYUcB4i+1LUG0kuZ8JUi0Ku/h5KA5Kq3VkZShWK0sm2yoWldcOUoE12MbZb6LX
	bH7Qlo1b6b449lRy8dw6l3NJkOqmEs4jXd/SjuIherPWNeSFMu4TD5ZE01cF6JsYGzlY+q1Unzu
	8Cb9nnb7909wMcWtCeXIhVZJZUhBfKM+RmOPZ7ninXWq3mFPrCNBCusBGKsNKxVKeLRSR7OYz8u
	fnL3LD0EKoMCgR1FSPTgg6G+L3DMbr3+he1XEAxAnuqQkDvs4jWOBacypiefwrnOir5KkFMuLBv
	/Ab8hC/1f5idHFXRBOLmnrkGIZ74idFIg8RtnLaHPnlahoti+cne7DAmb3e+130TPWmvvdiyRkQ
	W1O/IMwvwALDn7JzHiI3QfHJ2bs=
X-Received: by 2002:a17:90b:3b85:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3b166ae79a3mr1750881a91.5.1794281778535;
        Mon, 09 Nov 2026 19:36:18 -0800 (PST)
Received: from plin-1878 ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779d58csm1983833a91.1.2026.11.09.19.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:36:17 -0800 (PST)
Date: Tue, 10 Nov 2026 11:36:13 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org, pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com,
	zong.li@sifive.com, greentime.hu@sifive.com
Subject: Re: [PATCH v4 6/9] lib: sbi_hart_worlds: Implement WID hart
 protection backend
Message-ID: <avKRLbO16dsWLmIl@plin-1878>
References: <20261030104518.3297875-1-peter.lin@sifive.com>
 <20261030104518.3297875-7-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030104518.3297875-7-peter.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_193620_396115_71B55D19 
X-CRM114-Status: GOOD (  27.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 06:45:15PM +0800, Yu-Chien Peter Lin wrote:
> Introduce a WID-based hart protection backend that switches World ID
> configurations across domains.
> 
> Access to slwid is gated by mwiddeleg (Sswid), which means slwid cannot
> be handled by generic hart_context save/restore. Instead, manage slwid as
> domain state with explicit sequencing:
> 
> - configure:
>   - Validate and program mlwid and mwiddeleg according to domain policy
>     and platform constraints (pmlwidlist/mlwidlist).
>   - Restore slwid after mwiddeleg is enabled.
> - unconfigure:
>   - Save slwid prior to clearing mwiddeleg.
>   - Reset mwiddeleg to 0 to disable Sswid.
> 
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  include/sbi/sbi_hart_worlds.h |  24 ++++
>  lib/sbi/objects.mk            |   1 +
>  lib/sbi/sbi_hart.c            |   5 +
>  lib/sbi/sbi_hart_worlds.c     | 210 ++++++++++++++++++++++++++++++++++
>  4 files changed, 240 insertions(+)
>  create mode 100644 include/sbi/sbi_hart_worlds.h
>  create mode 100644 lib/sbi/sbi_hart_worlds.c
> 
> diff --git a/include/sbi/sbi_hart_worlds.h b/include/sbi/sbi_hart_worlds.h
> new file mode 100644
> index 00000000..91b11023
> --- /dev/null
> +++ b/include/sbi/sbi_hart_worlds.h
> @@ -0,0 +1,24 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2026 SiFive Inc.
> + */
> +
> +#ifndef __SBI_HART_WORLDS_H__
> +#define __SBI_HART_WORLDS_H__
> +
> +struct sbi_scratch;
> +
> +/**
> + * Initialize WID hart protection for current HART
> + *
> + * Registers the WID protection mechanism if Smlwid
> + * extension is present.
> + *
> + * @param scratch pointer to scratch space of current HART
> + *
> + * @return 0 on success and negative error code on failure
> + */
> +int sbi_hart_worlds_init(struct sbi_scratch *scratch);
> +
> +#endif /* __SBI_HART_WORLDS_H__ */
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index ae27d0c5..355ae6e9 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -77,6 +77,7 @@ libsbi-objs-y += sbi_fwft.o
>  libsbi-objs-y += sbi_hart.o
>  libsbi-objs-y += sbi_hart_pmp.o
>  libsbi-objs-y += sbi_hart_protection.o
> +libsbi-objs-y += sbi_hart_worlds.o
>  libsbi-objs-y += sbi_heap.o
>  libsbi-objs-y += sbi_math.o
>  libsbi-objs-y += sbi_hfence.o
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 611c97bf..f7408f51 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -17,6 +17,7 @@
>  #include <sbi/sbi_error.h>
>  #include <sbi/sbi_hart.h>
>  #include <sbi/sbi_hart_pmp.h>
> +#include <sbi/sbi_hart_worlds.h>
>  #include <sbi/sbi_platform.h>
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_string.h>
> @@ -742,6 +743,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
>  		rc = sbi_hart_pmp_init(scratch);
>  		if (rc)
>  			return rc;
> +
> +		rc = sbi_hart_worlds_init(scratch);
> +		if (rc)
> +			return rc;
>  	}
>  
>  	return sbi_hart_reinit(scratch);
> diff --git a/lib/sbi/sbi_hart_worlds.c b/lib/sbi/sbi_hart_worlds.c
> new file mode 100644
> index 00000000..6f582bd2
> --- /dev/null
> +++ b/lib/sbi/sbi_hart_worlds.c
> @@ -0,0 +1,210 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2026 SiFive Inc.
> + */
> +
> +#include <sbi/riscv_encoding.h>
> +#include <sbi/sbi_bitops.h>
> +#include <sbi/sbi_console.h>
> +#include <sbi/sbi_domain.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_hart.h>
> +#include <sbi/sbi_hart_protection.h>
> +#include <sbi/sbi_hart_worlds.h>
> +#include <sbi/sbi_scratch.h>
> +
> +/**
> + * Initialize the per-hart slwid values of a domain using
> + * the lowest delegated WID as the initial value.
> + *
> + * S-mode OS should choose the desire slwid for it's
> + * U-mode.
> + */
> +static int sbi_hart_worlds_state_setup(struct sbi_domain *dom,
> +				       struct sbi_domain_state *state,
> +				       void *state_ptr)
> +{
> +	unsigned long widdeleg = dom->widdeleg;
> +	unsigned long *slwid = state_ptr;
> +	unsigned long init_wid;
> +
> +	if (!widdeleg)
> +		return SBI_OK;
> +
> +	init_wid = sbi_ffs(widdeleg);
> +	sbi_for_each_hartindex(i)
> +		slwid[i] = init_wid;
> +
> +	return SBI_OK;
> +}
> +
> +static struct sbi_domain_state wid_state = {
> +	.state_setup = sbi_hart_worlds_state_setup,
> +};
> +
> +static unsigned long *sbi_hart_worlds_slwid_ptr(struct sbi_domain *dom)
> +{
> +	unsigned long *slwid;
> +
> +	slwid = sbi_domain_state_ptr(dom, &wid_state);
> +	if (!slwid || !sbi_hartindex_valid(current_hartindex()))
> +		return NULL;
> +
> +	return &slwid[current_hartindex()];
> +}
> +
> +static int hart_worlds_validate_wid(struct sbi_scratch *scratch,
> +				    struct sbi_domain *dom,
> +				    unsigned long mlwidlist)
> +{
> +	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
> +
> +	if (hf->has_pmlwidlist && !(hf->pmlwidlist & BIT_ULL(dom->wid))) {
> +		sbi_printf("%s: domain%d WID %u not permitted by"
> +			   " pmlwidlist\n",
> +			   __func__, dom->index, dom->wid);
> +		return SBI_EINVAL;
> +	}
> +
> +	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWIDLIST) &&
> +	    !(mlwidlist & BIT_ULL(dom->wid))) {
> +		sbi_printf("%s: domain%d WID %u not permitted by"
> +			   " mlwidlist 0x%lx\n",
> +			   __func__, dom->index, dom->wid, mlwidlist);
> +		return SBI_EINVAL;
> +	}
> +
> +	return SBI_OK;
> +}
> +
> +/*
> + * Validate that a domain's widdeleg value, parsed from the
> + * "widdeleg" DT property, is permitted on this hart.
> + *
> + * mwiddeleg is a M-mode WARL register, so an S-mode OS must rely
> + * on the "widdeleg" DT property to determine which WIDs it may
> + * delegate to U-mode via slwid. If pmwidlist or mlwidlist silently
> + * filters out any of those WIDs, the S-mode OS's view of the WIDs
> + * available for delegation would be incorrect. Treat this mismatch
> + * as a misconfiguration.
> + */
> +static int hart_worlds_validate_widdeleg(struct sbi_scratch *scratch,
> +					 struct sbi_domain *dom,
> +					 unsigned long mlwidlist)
> +{
> +	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
> +	unsigned long widdeleg = dom->widdeleg;
> +
> +	if (!widdeleg)
> +		return SBI_OK;
> +
> +	if (hf->has_pmlwidlist && (widdeleg & ~hf->pmlwidlist)) {
> +		sbi_printf("%s: domain%d widdeleg 0x%lx has WID(s)"
> +			   " outside pmlwidlist 0x%lx\n",
> +			   __func__, dom->index, widdeleg,
> +			   (unsigned long)hf->pmlwidlist);
> +		return SBI_EINVAL;
> +	}
> +
> +	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWIDLIST) &&
> +	    (widdeleg & ~mlwidlist)) {
> +		sbi_printf("%s: domain%d widdeleg 0x%lx has WID(s)"
> +			   " outside mlwidlist 0x%lx\n",
> +			   __func__, dom->index, widdeleg, mlwidlist);
> +		return SBI_EINVAL;
> +	}
> +
> +	return SBI_OK;
> +}
> +
> +static int sbi_hart_worlds_configure(struct sbi_scratch *scratch,
> +				     struct sbi_domain *dom)
> +{
> +	unsigned long *slwid = NULL;
> +	unsigned long mlwidlist = 0;
> +	int rc;
> +
> +	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID))
> +		return SBI_OK;
> +
> +	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWIDLIST))
> +		mlwidlist = csr_read(CSR_MLWIDLIST);
> +
> +	rc = hart_worlds_validate_wid(scratch, dom, mlwidlist);
> +	if (rc)
> +		return rc;
> +
> +	csr_write(CSR_MLWID, dom->wid);

Need to validate widdelg and bail out before updating mlwid, so mlwid
isn't left holding an invalid target world state on failure. Will fix
in PATCHv5.

Regards,
Peter Lin

> +	rc = hart_worlds_validate_widdeleg(scratch, dom, mlwidlist);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * Enable Sswid before restoring slwid. A zero mwiddeleg
> +	 * disables access to slwid, so the order here is required.
> +	 */
> +	csr_write(CSR_MWIDDELEG, dom->widdeleg);
> +
> +	if (dom->widdeleg) {
> +		slwid = sbi_hart_worlds_slwid_ptr(dom);
> +		if (!slwid)
> +			return SBI_EINVAL;
> +		csr_write(CSR_SLWID, *slwid);
> +	}
> +
> +	return SBI_OK;
> +}

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
