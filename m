Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD2F606A31E
	for <opensbi@archiver.kernel.org>; Mon, 23 Nov 2026 07:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b1FwgU8o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KOM6iTNn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gVgV2QyK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VWeARARYwFZasunpgwE5Cu0EKGnUaVFGgnbQfF0P+zQ=; b=b1FwgU8okL2J1llVU+O/6uHz/U
	YH9lDZqXVUYydHUoUEsWcCKf/G5Fn1p3DeA8fwLFPjmcl/YU2RpAB7KhdNgiHUt8GejtCNeL9d7Jc
	ibJfwNZl3h1IRghe/HH6EWfoUCAgyodplQT+tE/sxP6L06+G7NXyyo8NzYb13VEPgoixf4Sm6a8s4
	LLV39Pm/qeHMvwRpKqBqxGDUXqmeIOwHo5H8uAJSwhUGiAeSBI9fOvOQND+dl6xt75A/ejV0VSQSM
	PTJ2RFMIIWaP+L07a1uuEOSx7vfOSl3iG/7WQWHbTF+AhOA4Rii/+ksxcpOe3QhdW1FQEJov2HaNm
	jm+YVcFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOgn-00000002Tko-2TTY;
	Mon, 23 Nov 2026 07:42:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOgk-00000002Tji-0IYe
	for opensbi@lists.infradead.org;
	Mon, 23 Nov 2026 07:42:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50x9X1960992
	for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 07:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XhZfo+zbT5Y4wiLygaQEjLaU
	0XOOFszCvsixBX2K1f0=; b=KOM6iTNn9aLBea4CsdANBvl5FQL1PmE6CNsbhXIN
	z/tRb14D3i1Ghi01hcsg0qcZz3A0lLMGeOFnYCQEO6yZTjStAXAJI2OH0v2M8z+0
	M6bCnC6wS+/04+F9BMH1f5ySrMaqsDCtM1BO6p06USLhJWncMnvqvllTDlHCJjQe
	xBO+ayRl6Ckb9z6UddrtBUlALLKlm7PW98w9ufs3XEHqwsWuw7iFF6FRXviZmqVx
	Ddt2X/0daJ+J3+KzFuxAtNGelghK2tfBYNj3Ib3VFUTvQUnkKwp25KDIalGFyFrS
	CFzCxQP/ctD5uMvc1hN5HW8RrFdatMWuguZRGi26ZxI71Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6ntt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 07:42:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3403613eec.0
        for <opensbi@lists.infradead.org>; Sun, 22 Nov 2026 23:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795419728; x=1796024528; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XhZfo+zbT5Y4wiLygaQEjLaU0XOOFszCvsixBX2K1f0=;
        b=gVgV2QyKffxvN70/DfNy99D2bSKXpXhpFodzygKna0ehmWjE8Ivjv4XUOGr2h338Tn
         RYNFU3v0HDHeCpzyFI5DfM0GtP5YSHLrO5Vo+oyrDuDlInAvIqB5IFVOOmTh23JZMqqV
         AJpwFrdqK4zwxO6cRu0vaxxS5A8VFBWe33+vZ2P/Vj+CfTL1X3/4Ym1sQW4IhNGZJq+f
         5XzErTSsQ/Rv5txwdck5hXw09pxLlMW2fw7gGbcihuWyh7Do6ElmObkBKHR8C8LyLPcM
         JqdhRK1qiMtiMGZ3skDU+WK3pc5ZiJA9smW5cGuGQy3p0vCJJZJZ4W9o+R4vwP9w+6Ei
         oZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419728; x=1796024528;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhZfo+zbT5Y4wiLygaQEjLaU0XOOFszCvsixBX2K1f0=;
        b=CE6y9q6DeaLieyg7+GYHJB1ZpDW779tWZ7gK4Sa+ykl2AFlwKY+1j17KZ8s7zfPO4M
         oWqukC0Lf/rIqUxU5bHxMVXpJqfpIjXfhHE4gbqKoaAEjzJ6PIWSYAnPU4uSOMkPdKtE
         Psd8biQR94drAZ0JRPXdYxhMlSXsnA7PKUWcuzAwPl6R8K7Oeo5UXlFYBvy3VxHE6rtB
         V0hs7SOqkGESuw1OBDlMXo168Vn+fJm3Wp04Q8BwfQHG8a3STJL/6vwgKyFqs87+AghR
         q0I4EhnQLCcuY0Ty1lz/oILKg4MH0LZwhnjP0vAn20REaYZrSBEBqsvEjXwA/1ocZUNR
         /Q6g==
X-Forwarded-Encrypted: i=1; AL+hErGIG50oPCsTiuVNci/GjncQU2U9fAD84YtopDy9Zw8YUtGutoy2VbcJqMqc8rytqy3fyj2ZeDpB@lists.infradead.org
X-Gm-Message-State: APuU4Z/+XzPBcYWr4rtbtcLfpXE5MFsNlpQgbI1JfUIyKnhtsWbaHP1M
	QrB2PsGtDmfTh1Hhm1cUOKCpq9mapowVCrAPpR7gz6KKUY7MIJJRld3qGYMiA89yECl3foKpy2P
	oCNRBAsDjYsltBvafC7yWAec+mLDV3HspJewREKswYrdptv15qCVVGXCgN52JnZgfBw==
X-Gm-Gg: AZFdTZeNeFQFxgmM4o0HhrgsCra5MENm3IbLJ5QPBgKKHVilf4EvNj138IU5hY0HXKN
	BY60UCgCx7++0WqnJ7TjeUIDioeDL2yvoqcA8cNilo4FrXyyglrSX2KrBkEHwUlTKrCBpQv9Mu2
	k9fI1jpbdmAjDKfWbefVbEwM6TYu1OZa8j6T9c437/4geT1Uo0RJZmc5Z2K8WFiYUMg4mdxN/1P
	qCgZI14NfR2rCfIxnIq1YHekrohvq2CPmA2WaeOiuubo7tBISEDXqDeYJVt7G84+QFeydYPYTQN
	HzJxLyTDZ1RfpEvwM7TQnjXYg+JlGT7IqeoJV/XN31OIYuT8Y2YvIINDIHnXqUg3l5xPv/XlEnE
	rtYpiOxLnbtXEIPXmc+wAJxfagcIrKfLbBRXbmrNJUdWENi1dCizQ/T/SE0o4XYiNQLMpopAZi5
	76SmIap5sTQDUsod+paq6bgCsycnpbTy49sibh8FPDpYnfdP13Aeejix1o+Tug7mAmCIaNQ3/0
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr7963792eec.35.1795419727834;
        Sun, 22 Nov 2026 23:42:07 -0800 (PST)
X-Received: by 2002:a05:693c:8642:20b0:386:9e22:ca4c with SMTP id 5a478bee46e88-3869e22cc7emr7963778eec.35.1795419727344;
        Sun, 22 Nov 2026 23:42:07 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm39894503eec.11.2026.11.22.23.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:42:06 -0800 (PST)
Date: Mon, 23 Nov 2026 13:12:02 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org
Subject: Re: [PATCH 2/7] lib: sbi: dbtr: share trigger checks of install and
 update
Message-ID: <awPuSu5ka-wI9eOE@hu-himchau-blr.qualcomm.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
 <20261120231119.90214-3-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120231119.90214-3-heinrich.schuchardt@canonical.com>
X-Proofpoint-GUID: h0BEeKW2tC6SzL8yju8AjQdtBAb9YBiR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzMCBTYWx0ZWRfX6Y5eVYlZE0RD
 2zfhPmwhXVXeKjdjTh9UnNIHENiNOgfZnmcPCDR+hkgmbl7jaDsYloBzt3RgJ/gFivPTzO9yXVd
 BX1bAZRIneD7+tW4Hb0Q5iPS674T3gE=
X-Proofpoint-ORIG-GUID: h0BEeKW2tC6SzL8yju8AjQdtBAb9YBiR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzMCBTYWx0ZWRfX+L9ULpQruuWc
 CbGC9scEWjmNBr07sBaxJIKBZOC6Evl4jZDwuHNbv1DT79Gf2FzlOB+zXd5wCd8z2JcmnonIdqI
 aMkobd6GOWRXimgGG8Q+3nWQkdLDV6QBw15xLQCuHD+LiGKHqoXkAaJx5TydcmKUVdyLRxHMs83
 cb43Cmx91po/BX7jYUcicJonJT200ZhwsT1cNwbtsY9gKYOKKtrcW7AxvRWHkyUjwn//CNzBuEZ
 w7JvePhKb1NwlV49TGq9a+lfER6MTvOkEH8wOeaLVzkY2wf1lFbDqerJoBvWNmdl9gfRguF7Z3f
 YT5erfOZucSVaOpxX4dql7ILercy251mOYaXNvGos48h1W7NJtmX8D0tsIdj8hOcFCxbA0ojEKW
 NzAGbTcVNhcoSQWP1+wNOAVDxU3o/TJZnFMc8Uu5erctsYcgjZN6ZnapvQ0S/AupDCq0/t5UjqY
 Hrh76m0SrOi3b+DF7yw==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03ee50 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JfrnYn6hAAAA:8 a=DfNHnWVPAAAA:8 a=e1ao7hHNsue4iW8WTGAA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=1CNFftbPRP8L7MoqJWF3:22 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_234210_229030_31C06FD3 
X-CRM114-Status: GOOD (  40.33  )
X-Spam-Score: -2.8 (--)
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

On Sat, Nov 21, 2026 at 12:11:14AM +0100, Heinrich Schuchardt wrote:
> sbi_dbtr_install_trig() validates every trigger configuration before it
> programs any trigger. sbi_dbtr_update_trig() only checked the optional
> tdata2/tdata3 CSRs and the platform hook. It did not check that the
> trigger type is supported and it did not reject a tdata1 with the M or
> DMODE bit set, which install refuses. Supervisor software could
> therefore update an installed trigger into one that fires in M-mode or
> that is owned by the debug module.
> 
> Move the checks of one configuration into dbtr_check_trigger_config()
> and call it from both functions. The checks and their order are the same
> as before for install. For update the configuration is additionally
> checked against the type mask of the trigger that is updated, instead of
> against any trigger of the hart.
> 
> The helper reads tdata1, tdata2 and tdata3 from the shared memory once
> and uses the local copies for all checks.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  lib/sbi/sbi_dbtr.c | 114 +++++++++++++++++++++++----------------------
>  1 file changed, 59 insertions(+), 55 deletions(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 2108ca9e..53fcb0a2 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -682,6 +682,55 @@ int sbi_dbtr_read_trig(unsigned long smode,
>  	return SBI_SUCCESS;
>  }
>  
> +/*
> + * Check the configuration of one trigger read from the shared memory.
> + *
> + * The same checks apply when a trigger is installed and when it is updated.
> + *
> + * @hs:		trigger state of the calling hart
> + * @trig:	trigger the configuration is meant for (update), or NULL if any
> + *		trigger of the hart may be used (install)
> + * @recv:	configuration to check
> + *
> + * SBI v3.0 sec 19.4 and 19.5 require SBI_ERR_NOT_SUPPORTED when a trigger
> + * programs a non-zero value into an unimplemented optional CSR. Only the
> + * "whole CSR unimplemented" case is caught here; WARL bits tied off inside an
> + * otherwise-implemented CSR are delegated to the device-specific
> + * trigger_supported() callback.
> + */

You can drop the reference to SBI sections. Mention them in cover letter. The comment
has been copied from the preivous implementation of the in function check. It is
neither clear nor approriate to what exactly function is trying to achieve. Please
take a look and add information pertaining to the function's job.

> +static int dbtr_check_trigger_config(struct sbi_dbtr_hart_triggers_state *hs,
> +				     const struct sbi_dbtr_trigger *trig,
> +				     const struct sbi_dbtr_data_msg *recv,
> +				     bool tdata2_impl, bool tdata3_impl)
> +{
> +	/* Read the shared memory only once */
> +	unsigned long tdata1 = lle_to_cpu(recv->tdata1);
> +	unsigned long tdata2 = lle_to_cpu(recv->tdata2);
> +	unsigned long tdata3 = lle_to_cpu(recv->tdata3);
> +	unsigned long type = TDATA1_GET_TYPE(tdata1);
> +
> +	if (!dbtr_trigger_supported(type))
> +		return SBI_ERR_FAILED;
> +
> +	if (!dbtr_trigger_valid(type, tdata1))
> +		return SBI_ERR_INVALID_PARAM;
> +
> +	if ((tdata2 && !tdata2_impl) || (tdata3 && !tdata3_impl))
> +		return SBI_ERR_NOT_SUPPORTED;
> +
> +	if (trig) {
> +		if (!__test_bit(type, &trig->type_mask) ||
> +		    !dbtr_trigger_hw_supported(trig->index, tdata1, tdata2,
> +					       tdata3))
> +			return SBI_ERR_NOT_SUPPORTED;
> +	} else if (!dbtr_trigger_any_hw_supported(hs, tdata1, tdata2,
> +						  tdata3)) {
> +		return SBI_ERR_NOT_SUPPORTED;
> +	}
> +
> +	return SBI_SUCCESS;
> +}
> +
>  int sbi_dbtr_install_trig(unsigned long smode,
>  			  unsigned long trig_count, unsigned long *out)
>  {
> @@ -689,9 +738,8 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  	union sbi_dbtr_shmem_entry *entry;
>  	struct sbi_dbtr_data_msg *recv;
>  	struct sbi_dbtr_id_msg *xmit;
> -	unsigned long ctrl;
>  	u32 claimed = 0;
> -	int slot;
> +	int slot, rc;
>  	struct sbi_dbtr_trigger *trig;
>  	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>  	bool tdata2_impl, tdata3_impl;
> @@ -710,52 +758,20 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
>  					   trig_count * sizeof(*entry));
>  
> -	/*
> -	 * SBI v3.0 sec 19.4 requires SBI_ERR_NOT_SUPPORTED when a trigger
> -	 * programs a non-zero value into an unimplemented optional CSR. Only
> -	 * the "whole CSR unimplemented" case is caught here; WARL bits tied
> -	 * off inside an otherwise-implemented CSR are delegated to the
> -	 * device-specific trigger_supported() callback via
> -	 * dbtr_trigger_any_hw_supported().
> -	 */
>  	tdata2_impl = tdata_implemented(CSR_TDATA2);
>  	tdata3_impl = tdata_implemented(CSR_TDATA3);
>  
>  	/* Check requested triggers configuration */
>  	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
>  		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
> -		ctrl = recv->tdata1;
>  
> -		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
> +		rc = dbtr_check_trigger_config(hs, NULL, recv,
> +					       tdata2_impl, tdata3_impl);
> +		if (rc) {
>  			*out = _idx;
>  			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
>  							     trig_count * sizeof(*entry));
> -			return SBI_ERR_FAILED;
> -		}
> -
> -		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
> -			*out = _idx;
> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
> -							     trig_count * sizeof(*entry));
> -			return SBI_ERR_INVALID_PARAM;
> -		}
> -
> -		if ((recv->tdata2 && !tdata2_impl) ||
> -		    (recv->tdata3 && !tdata3_impl)) {
> -			*out = _idx;
> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
> -							     trig_count * sizeof(*entry));
> -			return SBI_ERR_NOT_SUPPORTED;
> -		}
> -
> -		if (!dbtr_trigger_any_hw_supported(hs,
> -						   lle_to_cpu(recv->tdata1),
> -						   lle_to_cpu(recv->tdata2),
> -						   lle_to_cpu(recv->tdata3))) {
> -			*out = _idx;
> -			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
> -							     trig_count * sizeof(*entry));
> -			return SBI_ERR_NOT_SUPPORTED;
> +			return rc;
>  		}
>  	}
>  
> @@ -867,6 +883,7 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  	void *shmem_base = NULL;
>  	struct sbi_dbtr_hart_triggers_state *hs = NULL;
>  	bool tdata2_impl, tdata3_impl;
> +	int rc;
>  
>  	hs = dbtr_thishart_state_ptr();
>  	if (!hs)
> @@ -880,12 +897,6 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  	if (trig_count > hs->total_trigs)
>  		return SBI_ERR_BAD_RANGE;
>  
> -	/*
> -	 * SBI v3.0 sec 19.5 requires SBI_ERR_NOT_SUPPORTED when a trigger
> -	 * programs a non-zero value into an unimplemented optional CSR. Only
> -	 * the "whole CSR unimplemented" case is caught; WARL bits tied off
> -	 * inside an otherwise-implemented CSR are not.
> -	 */
>  	tdata2_impl = tdata_implemented(CSR_TDATA2);
>  	tdata3_impl = tdata_implemented(CSR_TDATA3);
>  
> @@ -905,18 +916,11 @@ int sbi_dbtr_update_trig(unsigned long smode,
>  			return SBI_ERR_FAILED;
>  		}
>  
> -		if ((entry->data.tdata2 && !tdata2_impl) ||
> -		    (entry->data.tdata3 && !tdata3_impl)) {
> +		rc = dbtr_check_trigger_config(hs, trig, &entry->data,
> +					       tdata2_impl, tdata3_impl);
> +		if (rc) {
>  			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
> -			return SBI_ERR_NOT_SUPPORTED;
> -		}
> -
> -		if (!dbtr_trigger_hw_supported(trig->index,
> -					       lle_to_cpu(entry->data.tdata1),
> -					       lle_to_cpu(entry->data.tdata2),
> -					       lle_to_cpu(entry->data.tdata3))) {
> -			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
> -			return SBI_ERR_NOT_SUPPORTED;
> +			return rc;
>  		}
>  
>  		dbtr_trigger_setup(trig, &entry->data);

Liutong was trying to solve the same TOCTOU problem. It is under review and I had similar comments on that patch series.
Could you please take a look at that?

Regards
Himanshu

> -- 
> 2.53.0
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
