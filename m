Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA11D606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GR3xDLHS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ienIEBRj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E7G7oRoh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xHj0PClJFiJyJDV0QOGiRKNHAN5yyZV5zwq2LC377L0=; b=GR3xDLHS1kJ+nCp3upQ5zUPThK
	i573ECofuQ7OjBkMc1W408nqk4njq72IgUJjf+QyvoFo7HrbUYEFiAJf+sZmyPcGBfrB4OTwjQQQI
	scBaTx9D6deWSnHcbVMcXka4nPbHM6zzjKqr3UI9CeooX59gc3zvl/61Ls/ZzsvufkwH3Rp/V6Yy9
	0iwmGaBzRIE9zSHwzhuFS+pkH1JSPIdbxMDQOYjHtFB3P7tojUwOYsmOoosKapDl4vtiDdvhOIqrt
	TkdTH0x+PVpVu644HxaCK0kakaHGrYva5vJFLk9u/+q/TwQSU52vWJsGwXUyRIYKqpNL6L7SVNYXV
	09IpEJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl1y-00000005mJR-1Jon;
	Tue, 24 Nov 2026 07:33:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl1v-00000005mIx-33ko
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 07:33:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kQ2K2209288
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 07:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2C8YP0sAVym3ZiETxBX0A15J
	+QwNcuIZwzDSzbhufEs=; b=ienIEBRjs3cMUmK2dOYdx5xKXVYdmDT9sMqj3+Je
	S4S0wATeHYuxB+jYJ+Z14rsalACEAmGv4NlDWk4UVrHJbPmD09/C875FdKlmRRR3
	QY0XYpEh1P++f/2BCTYg3c1dpfHPA7LVeDFKP9jZyK8H/2e9xr+giN7Q0JEB24gG
	qpXJQk+nu/dYjwB0CCwJvH+mSbrIyTz3gHUerR25rgW82/gNJ4zpB17AUUwHhSVE
	x0l7kyx8Uadq+ascPM9/RutraEriZT4o6UyQhfYotmx7xAplTBndpFzasIaYwI16
	eEzq95loqMsr6WroFvk+eFid0Fo2lY+JXG3A28Dv7+lo9Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy11ekd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 07:33:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a0f79047so4133220eec.1
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 23:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795505609; x=1796110409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2C8YP0sAVym3ZiETxBX0A15J+QwNcuIZwzDSzbhufEs=;
        b=E7G7oRohZjexgmvzoRp65+KomL9L9JLH5eawUX6+0eCAIbsFyBu6Wdd3VKYiBNpj0Q
         dvsR3AnU5gk1cvf7xnyenC3JhS+OtsslZPtXnaKcIVH5FjQJcHl+hTV19skxpV/bxZ1O
         GrtSFKyqTYziZzX5LwLDrB6QlTxYDY4TjXrhAUk9pQzugJy8MkMta+eWXK46miciAyi0
         nCDBeSUV2+4sTMzbqIMns/VI8MyHXuzfDrilNsqiQjhMtvadwNvrWyBe6B7SGRieCboR
         hh+5atoAVeEMWjnDNDEOA8LwjfZExwrFvNEPCK2RUsZQsij/vz2rNuAVl5E68nm8URbf
         J9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505609; x=1796110409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2C8YP0sAVym3ZiETxBX0A15J+QwNcuIZwzDSzbhufEs=;
        b=NcnVttkaG8ZYSu8bQlvtkodEZpgjer1y98CaghPN7mlKXSbjNc47vatQDMlsAYTdrO
         CmErwwrKYrI1XaTj9yX67OR7wSoFcA66l8pcUHEeNRs5ZykHp0fUuvXG5MhENxpuqgEY
         eG62VYh1W9Dc0Ht/qSARjeW8/IX8RVo/3t22Z11t5gAiDeB2suwVhEZpnH3fGKrAH3sY
         3Bv8hOAdt6d5YgiHVnwIQmHP1va37BjEu0sksnbpU6XysR1CY00BDtWBjDVmHRh8jBia
         jwpc7goiPrIDoN3iS7XDGYRQbFYI+L42PykZ344OzTbFCYFszfQuEWWb2qBz9OWzogF3
         PMSw==
X-Forwarded-Encrypted: i=1; AL+hErFkLzKdmQm5ipWhr4a05hRvXGnKf7gzRzYL/bOz23mgN+Scg0eUZDwSB5YnzeYyOHrsxsQqLVDB@lists.infradead.org
X-Gm-Message-State: APuU4Z/MgEFphqFMF6/5SPwbBHqMGRxtU0C6rBhPdUv38Cms3hEigEtJ
	otZvhYXn0dSSqmUIaWeE/clGNhg9txqfZ6zFTzw+R17qgrGHzpuG29UGAi7YM/HDUt6K9hpP1Hk
	Yj0Ei6kdvybxOdNSm0MLJ1SW0KBWSpyxeHj0YU2f5SIQG0X3UgxeHcgWOZhrBB8jJNKXOfzjKuQ
	==
X-Gm-Gg: AZFdTZeWEkLV8H+LnBSwdzij+jBL3/MKABIXvPBDXeVFQIQWVM1lfmdo0ahyhvtcKM0
	dVItJGvw3o/ZKYjZH6u+enTd+LMhEIRWKCXPJmzJALBUBIE+E+CEWuugTTW26jJ80EcW2Lej+Uw
	4nio3QKGrOf89KcsGZT2w6R4DLflYRdZ9TbBQMjuCQRcSplI5GLYxFWglcUOt/K9gDdPnu0Yw4M
	wGXyZPErcsu26yJziQ/+G4M1BXYhrMVgIodFSH9BjWgs9x2cgdFrkfnVnsCCzLR+1W7f2rTrTdl
	zazM9+hAbXFjYhofzslzw7i5t8JxwPvYgmpIJLveO8Jl6jj3umywzyj1Pg6x1Y6ukwnwCpbxSOJ
	3c0HFvQf+7SLhm7SCtzTDjHUmEucWFTqJA/v7yHJH2dX9KWufar5t8dJvI4SCbKs+6rYA6+9qmA
	v2LpkPIVom6iFr8BikplUEFuNWdI7T57bWr74obsdh7JTX0shxZlfMY20IQ6hx7GwX2/rReX03
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr21654577eec.21.1795505608993;
        Mon, 23 Nov 2026 23:33:28 -0800 (PST)
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr21654536eec.21.1795505608391;
        Mon, 23 Nov 2026 23:33:28 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm17205105eec.0.2026.11.23.23.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:33:28 -0800 (PST)
Date: Tue, 24 Nov 2026 13:03:23 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org
Subject: Re: [PATCH 7/7] lib: sbi: dbtr: reject a chain in the last entry of
 INSTALL
Message-ID: <awU9w5lMcZPpf74A@hu-himchau-blr.qualcomm.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
 <20261120231119.90214-8-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120231119.90214-8-heinrich.schuchardt@canonical.com>
X-Proofpoint-ORIG-GUID: 1WFHHvaGUJt-PGd09vUWM4QIVot9zdzw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyOSBTYWx0ZWRfX7zuqtAo8wsUj
 bmjJc+BUDmZtGneX95sVw0WtmmqLV9RLqkgXdt5SVllKKQaZGdG/vLIGCtsRNXESzgdxFFKkrN8
 j5BB/MTHknIofmiRhKBDRySpOZE1T50=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b053dca cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=GHzwUeA2-Qlb0Roz:21 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=JfrnYn6hAAAA:8 a=DfNHnWVPAAAA:8 a=EUspDBNiAAAA:8 a=Pdp27MNKtpP4oiYPZ00A:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyOSBTYWx0ZWRfXx2DeB1FGcqTw
 UKBQwapkebn7Od/N2E7QYUncjKRm13zQDC4tzUJ47Y6vxNKxgHuLpP+G79n9IdeFZHu8hVOBkc8
 rFCqp9Vgdi3DUUB8MsJoELNz9GyZsGqZiMuau2nEWbRtNxuyTwDy9BsmDwztP/bJV/FMgfyfXNN
 emTVJpErTnPGBEF0N8shy0togr349YbswOiIZQHRdOqMMUrvlDUgtE+smv3UdCC5tG0qVoRtNdC
 RBlmy79DPrlgQ7GQStuRaNPiQVvZLMXYkuIHRBkFXLXEm2s4nIy/Lr+xcnqZsYW8BJGK+8qpZPk
 +SdzOi1a3DmE2ZYqQXSMeC03C+ClRMO/1WKjVjFyFIQxmEB8K8KpFeKzLPk/meuLS9Wd2ymGOEf
 RvwkMCPmjn8NxkysKWcJa+pAK/nGguzA9HJFqQvzbbhqY/X0z17bRvaSII+4APFMvFl3eCeHG+p
 9lZk4KEEbJ/Ujo2uyEA==
X-Proofpoint-GUID: 1WFHHvaGUJt-PGd09vUWM4QIVot9zdzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_233331_881271_34D6EFAA 
X-CRM114-Status: GOOD (  24.74  )
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

On Sat, Nov 21, 2026 at 12:11:19AM +0100, Heinrich Schuchardt wrote:
> The specification says that the last trigger configuration in the shared
> memory must not have trig_tdata1.chain == 1 for the types mcontrol and
> mcontrol6, to prevent an incomplete trigger configuration chain. It names
> no error code. SBI_ERR_INVALID_PARAM is the one for an invalid
> trig_tdata1.
> 
> sbi_dbtr_install_trig() accepted such a configuration and installed a
> chain whose last trigger points to a trigger that is not part of it.
> 
> Check the last entry together with the other configuration checks. The
> check runs before any trigger is installed, so a rejected request installs
> nothing, and sbiret.value is the array index of the last entry.
> 
> The chain field is only read for mcontrol and mcontrol6, as for the update
> function. Other types use the bit for something else.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  lib/sbi/sbi_dbtr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index a6b860da..f60cce7b 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -805,6 +805,13 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  
>  		rc = dbtr_check_trigger_config(hs, NULL, recv,
>  					       tdata2_impl, tdata3_impl);
> +		/*
> +		 * A chain has to be completed by the next configuration, so
> +		 * the last configuration must not continue it.
> +		 */
> +		if (!rc && _idx + 1 == trig_count &&
> +		    dbtr_tdata1_chain(lle_to_cpu(recv->tdata1)))
> +			rc = SBI_ERR_INVALID_PARAM;
Looks good.

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

>  		if (rc) {
>  			*out = _idx;
>  			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
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
