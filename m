Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB1DC982DE
	for <opensbi@archiver.kernel.org>; Mon, 21 Sep 2026 05:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LmRfCwO6j9wD5YiogiAIWDUmpn9HCrXpXVJMbOX2ao=; b=hT6mOt20VqidWU
	RlA2UAoeo6PmXsEtdVbgfeptMlUTGwiBwFNCkn8adwPT9mqLgAVB2nxd1E0TNgSFv9R5pnUI9R+M8
	9DuKbyFualWTucGBhYQr1R5bYKs23qIItqQ3+bscJWtBasceX7abAzzhjr6Pap41PKj3qkQzXjsVZ
	C2CyD6DeYJ7bq6k/v8VuGnPwFxCrYyxfTzd0hC6PS5P/t2vhxwCBLbD9EbBclD6Oxa5CBEQJBmbf4
	mV3msCl3Xt9deTA4pxKHnwHwk3FDwYLGVimngplYCk4KrOCrm1pj0z2Vl2Qh7yVcVZ39fOLyj1xO3
	Ir5Hj9vzpPczxpwxvQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WDF-00000000sMl-0pKz;
	Mon, 21 Sep 2026 05:05:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WDC-00000000sM6-3WE7
	for opensbi@lists.infradead.org;
	Mon, 21 Sep 2026 05:05:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZCmA1162383
	for <opensbi@lists.infradead.org>; Mon, 21 Sep 2026 05:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Umx/oS83GxH3xDr5sRquzD+U
	VqWdnqxoad6i7JRgVlg=; b=Rv9hDG9wcdPzojWG9iKBPOla1vfzLQkZEaj1KZ4U
	OtJfr5bK986LKOtC/bTAblfd1BqlGtiisU63CHbWtez3DbezP/Rabwc3R2Eii92L
	4eYkqsw8i1x2nvhTGz51bvdNBxszYJNZQ9uMzOBZMQplH7sLgnzAG4Ms5ih1Q+/d
	Kiq0HUuhg+VJBI+NLbvLYjkRQeMQBMBUPOYIQxHSkFfauTNamGLB9miYn02ODZL7
	jXZGmxX6IBD0OKYSDCQz1SpEp2SuJkmbG2kOkpgy5Rigm5SHzx4VpzjUigiW/MPd
	R1EdUCE+1wKxl94iUncUSecu7BtW3N/1zgT+SiFccryl9A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wrnhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 21 Sep 2026 05:05:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so6740131a91.2
        for <opensbi@lists.infradead.org>; Sun, 20 Sep 2026 22:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789967105; x=1790571905; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Umx/oS83GxH3xDr5sRquzD+UVqWdnqxoad6i7JRgVlg=;
        b=AFDcqQyEEoFjhctjyLYPaj/FSUG/LNdt71a5dCEnHAYAfCDkHD8Vh6Kz5v1z0qA58D
         tbhz0sNGvwPClSaXEoFPNV+IBh0LCSCeT1NiyC3OvUym//eOLPmNfIfqNoqRfx3a3ovX
         eLKica+XD49dDLSUpzNlfhURZf62HtrtEYQws5+kybqdRLNjhLGUMaubwhSC44+prUip
         GwlcyxftHlElF5ggj4xMdp7CiVIbn9ewNUzK6wuRlk5jvZDPcTNN4rpoHYR8iKExZm1k
         EzLKwVE0dNyMw5bhv2h/b1pYig9UQB3J9S0O502CDc+rxep559/dwlbAPjTEngP2fZaS
         8RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789967105; x=1790571905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Umx/oS83GxH3xDr5sRquzD+UVqWdnqxoad6i7JRgVlg=;
        b=zm8xDdW1DCSPHvwUEr7mEJXhP3nCJt607reNVo3GiktsF4RMuybqj+/nNOc3ipj06j
         swGQUYl6JD1tHl4tWkhKUneDVe5NmkSVMc9dPxBSYYid01qMNS1fHYM2s3k1SoiLdBn9
         xW/p8rsQDh9FNN3c2G/0H7Q66VHKiFDk0kcNM+XnyVcWbx595omJRCKP83atKJ34c1YC
         jq8q2Ctk551RnJLBGdHXaotnhBQ9G9HJFp/MMl+fj07HnZ5w6IEx1ZMu2cgefC+RjH3T
         Fl6b7fxU3NlWIS2PueBP2vEKO2MKqlVgx0dKVNRZOZe13APGVVa0nL649NlYVb7GAFp0
         WXQA==
X-Gm-Message-State: AFuF++mMGpK8W03exsBuoR+khfy73+MLoNpS1KKEzMJg2Dwp8rE7XOgS
	ROS/J2spBvaud8jKtIHC1+1GaVDTwPUWsp335UyFmtoxUW3rem0VRUXKWZ+lNpnGCTb8tRu85eD
	7XRAy06Au3n0PU9/J/SO37TJ/CZ8mQvQqQui+b2wd06nBz9TGerJY3T70STfkL4v8Jg==
X-Gm-Gg: AYBFou1iIUkjK6pxwmufisszfUAFQDSD6FGwZBkLxux+WHpwU3T9N8WdhaonLX2z8In
	asK0CQRWO1+5RyYfjnz1yc3tmHavdXw7xQHwUckUiePKYnbxb9GnQF/1BliLRxUSrhFWyEqOqJo
	ewi8Jb87ppPmLb7T+WJPct+l7kmAoc4kQKB0Al1ccNhWW2/7UH1e4Kug4wZDPNdyeCxUvX9BeBG
	tik0Lv1/JBcwvKYr+0S7CVxud48dCvA5fFRlsllxV/2NyiCPehTbVDZ2PXzMtZBvv7zuzyDKLPj
	8MOmtOQI7xu6xdRNggSXsiIlbhYgco+Y1Q8QFUosS/e+Pdvy3YyRAQUiHcj6s9WwXkZLLMIQwCG
	xBhmkW4x8zsEsFZZbyyqb3HK38A0Ynpg2wwb61XqagghI/2i+UN6SDpoYeqjecc9jun8BUHVcB6
	vTBnCsVtHb8L+THbG6pfEC5CoF
X-Received: by 2002:a17:90b:180a:b0:3a0:519e:dac4 with SMTP id 98e67ed59e1d1-3a0519eed56mr1189884a91.45.1789967105397;
        Sun, 20 Sep 2026 22:05:05 -0700 (PDT)
X-Received: by 2002:a17:90b:180a:b0:3a0:519e:dac4 with SMTP id 98e67ed59e1d1-3a0519eed56mr1189861a91.45.1789967104916;
        Sun, 20 Sep 2026 22:05:04 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331aef9bsm16483906eec.25.2026.09.20.22.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 22:05:04 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:35:00 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, david.garcia@aheadcomputing.com
Subject: Re: [PATCH v3 0/3] lib: sbi: fix shared memory double-fetch in DBTR
 and SSE
Message-ID: <arC6_NukHKk_mH4U@hu-himchau-blr.qualcomm.com>
References: <20260910052958.3365324-1-liutong@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910052958.3365324-1-liutong@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA3MSBTYWx0ZWRfX07NFwV5WdlOj
 sFRieb+SckYOsO1N27is9k/nT0YPvPYJyBnrap4ZRg61XVzIIeQhUZ6iw1a+WXqB1MuLivUN2r/
 duaQWHGJIK5apJFIwwYC+wIQi7gFPAC6ZS1SBMHaKNiJbm5QhYD/2XXXaCaRshonPhB1pUpJYYa
 UdtDCY0In3GJbGlwU2T2wTrSmWZyximfrq/+Qisz5tF5TxuiWUsCcAKRh4PB3IMGPNwsaIK36pp
 M1RprntTPAxln2E7vysTjMXbY11a8efWMu8cU6xK4uAS1BQ80FVID+uOQjaAwFXeE1XHwErLf/V
 IDtBkOJj8Xdu71+wtcIV7RV7XEPx6s8Kc7/eDOGePXL887OWN/6lvTW6vbHeDfa3kR8ChMV976/
 bINaW7R92ILFMrv5xque4YN47lEMSuz7s5EXoieJf0UlLoFNVqxsfYMHgArxC3V8GSqGLSOR7Xk
 5UuIZf9+84X0ATYxf5w==
X-Proofpoint-ORIG-GUID: 0_5iWNV7pG4T4-Ods2gUCpAOkLsYXX2k
X-Proofpoint-GUID: 0_5iWNV7pG4T4-Ods2gUCpAOkLsYXX2k
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0bb02 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=y5tkaSr5CZ5t6hXywIIA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA3MSBTYWx0ZWRfX12cjA1tGDK6x
 GzKt74XrvGD9M81CE57xS/MNdxFWtuBaqgebtule5D7YuAoz9Erk3WmfTvlFBud0OTe89kA6+4X
 L3X+F7WbPVaKEJ2R4eiHHNt1+DuyFUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_220506_906052_A699F222 
X-CRM114-Status: GOOD (  30.13  )
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

Hi Liutong,

On Thu, Sep 10, 2026 at 05:29:55AM +0000, liutong wrote:
> M-mode validates a request held in S-mode shared memory and then reads
> that same memory again in order to act on it. S-mode may rewrite the
> memory in between, so the values programmed into M-mode state are not
> necessarily the values that were validated.

After a thought, I think this is an S-mode problem we are trying to solve in
M-mode without much gain. First of all, this should be fixed in S-mode.
Secondly, even if there is a CPU running rogue code, cannot bring down the
system. The triggers programmed may be bad. But again, its a S-mode bug.

As said in one of the previos patch, a new series which optimizes a scenario
defined there would make sense.

I would NAK this patch series at this time.

Regards
Himanshu

> 
>   - sbi_dbtr_install_trig() re-reads each entry in three passes
>   - sbi_dbtr_update_trig() re-reads each entry four times
>   - sse_write_attrs() re-reads the attributes in a check pass and again
>     in an apply pass
> 
> Each is fixed by copying the request once and making every later
> decision against that copy.
> 
> Himanshu pointed out on v2 that the install_trig patch was written
> against a shape of the function that no longer exists upstream: the
> per-slot capability matching and the dry-run slot allocation added
> since then re-read shared memory independently, so the race was still
> open. That patch is reworked here against current master, with the
> copy threaded through those paths.
> 
> The other half of the previous six patch series, three integer overflow
> fixes and one unmap fix, is sent separately as "[PATCH v3 0/4] lib:
> sbi: fix integer overflows in shared memory bounds checks". Both halves
> apply to master in either order.
> 
> Changes in v3:
> - Rebased onto current master
> - Split out of the previous six patch series
> - Subject prefixes changed to "lib: sbi: dbtr:" and "lib: sbi: sse:" to
>   match the rest of those files' history
> - 1/3: reworked, see the patch for details
> - 2/3: new in v3
> - 3/3: added a bound check inside sse_write_attrs()
> - Dropped the DBTR shared memory range check that was v2 3/6. Pengpeng
>   Hou sent the same fix in "lib: sbi: dbtr: validate complete shared
>   memory range", which already carries a Reviewed-by. Note that
>   Himanshu's remark on v2 3/6, that the "dom &&" guard skips the check
>   entirely when dom is NULL, applies to that patch as well and is left
>   to its thread.
> - Link to v2: https://lore.kernel.org/opensbi/20260731103405.1535818-1-liutong@iscas.ac.cn/
> 
> liutong (3):
>   lib: sbi: dbtr: fix shared memory double-fetch in install_trig
>   lib: sbi: dbtr: fix shared memory double-fetch in update_trig
>   lib: sbi: sse: fix shared memory double-fetch in sse_write_attrs
> 
>  lib/sbi/sbi_dbtr.c | 226 +++++++++++++++++++++++++++------------------
>  lib/sbi/sbi_sse.c  |  26 ++++--
>  2 files changed, 158 insertions(+), 94 deletions(-)
>
> 
> base-commit: 3593a5facc4c6938b90429a6973ba9ee21fc5899
> -- 
> 2.34.1
> 

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
