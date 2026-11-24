Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DC606A321
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 07:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ISukTBgO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K2UUSzGc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hm9f8P5O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LDv/t/X4B3s4RWLUdnru2DuBva2AYpicN4JHmnWLouI=; b=ISukTBgOFe7lc/f37JW4eiT3/8
	vkQ0MgSiBoI30i3JJ3/+WcfGID+Y9laRaBtyItOO+3YNqO57HzlBvCcdOYjLRLviMIVF/rD3K9rA1
	MxLEYO+oRI3+V5NSmtAGqqzz2O+m98AdLfMSrACQ0eCiE7w/+eS8MyCqr0ktuhRewalv76iu511gl
	W9Jcbest9ZLQipTJaXK5J5YIlmiiCpE6mFgr/ksUdzUE4tIwSXwSkOH/eKsgWdraLJeWfCkfXZZPB
	mYTHe9KxITfe95YWxWeZb1/cfFAKBntRb+guypev9iKPlDhEOsUYWHZDa6HvrfQi1bMsmYyFrJYS7
	e+xtThVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl3q-00000005ma5-3Nj1;
	Tue, 24 Nov 2026 07:35:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl3n-00000005mZl-3KjG
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 07:35:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2lds21598157
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 07:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jHmOKEIY4AJx6cFpT+7987DE
	CI3kG5RtHMsk8Jpp7sg=; b=K2UUSzGcGIVtf+R+H/2hTIGU+M9j92bsiMbhX5NZ
	owSyQzhWST3GopfxSjGo1s4Im2tlx+ij0ONZuKXNowqnbzgPUZIXN4aT2CTg1Bu/
	EpBYaBtklWkxu0uJkXtI0irEaGW1AXd7iTaKor7K/TwysKjqwFYF3YuAspHXLFco
	wAkfk8M9XKqLKOnWEnzSqPcegQgYOKO9XMFSAmbx3QF7vsb84JXDkQ8Vqsv4CwR5
	9QXeI1wGyFJjVonHFekjCf3dsjSBLInc76dqsmDveWgsdNXrfZTVh76uRgeBAqwU
	OYeInfw7KwhxVdze9zdhf9XeJJ6qkLsKU5xkCr6aQsFBIQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqjcgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 24 Nov 2026 07:35:26 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so4135637eec.1
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 23:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795505725; x=1796110525; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHmOKEIY4AJx6cFpT+7987DECI3kG5RtHMsk8Jpp7sg=;
        b=hm9f8P5OhIxEtKndVkUBrRHL6bhFmXDyBmFkKT28rnixMvhZ2mFRwZYpYdjalWLKBv
         Tm/tPNRvE5tjcSeyDEr/0B4DhBMUa+FH4KFH+CPZropPpnkUxbs7g55tOi+iRfGOIpHV
         N/0xxTxkMiPfSE+GpJLjyEtHjvNBkzGgLcExNSpdxFtJXcf5uBwy6WtPurN6TG2E7iO1
         aBib9w1kB19cVT7zsABY7hR6RkHKwdEtotoEpHFzH2Y4879FjuAodgtVQYhNwcTPaGl0
         XrDJ6q9WLuFMLo9ll7oQYpUWoGDFOwOo2sTRp6xIkfuT5gd7WnBKY6gzDegdrCIqqIzc
         9pSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505725; x=1796110525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHmOKEIY4AJx6cFpT+7987DECI3kG5RtHMsk8Jpp7sg=;
        b=JXuc44vmmpV/Ll6A596eMgA5Lam7ihSrtJb5NGzA4YKoIH5rwAS1rXjtv9lbb9X4YE
         +DlTmzTNb6cJd8RvDzts0E1geqqiJTILebs8YIjJi9Sg8bAK5KJaNxlYfP1bXJiIEfWT
         KxzrPh9i/7ALBfAcJrJgEVGjIjXuByEl2kBIz2dJMQlzH7ZdQULORPzw7mwzbzknHsEZ
         wT2vumOjRqsx8bHLE82USrt9T615JuJeLVSQlm8AhhveGOB2tqlKDPJBuvF7ZEBY1Mjx
         dFRV/rGaRK9EQKYq/313kD26xjik8XRcJyr4SEINRexMsSXhKf+fmnRrPXyrIFX4VDdI
         GuxQ==
X-Forwarded-Encrypted: i=1; AL+hErHq4ZqRnGtM/g+XIKWEGa1ZEabl4fTa1ELpjWDnsX4m+nYJn5zc9MZTm8yLKDF6rWLZn0Od62X+@lists.infradead.org
X-Gm-Message-State: APuU4Z80ef4h+anuJSXRP6H3LWapGpyDVKek+TcHz20OzpcOJvOy6Lmn
	AlL0Pvf5oRTRRga9trBdOLZodlya4sBqE+wCYxjvlzOF8Dvm1mQ+aLn+8k9fkEfi+R2NxsQZMdB
	HKUaMuT8RECxFgfeW8fPQ1fSXivcdlLODPUBVT3Oabja1t5IODGp3ITvhs2+LgvdW6g==
X-Gm-Gg: AZFdTZd956dMHIyHjqx0X+/rjjr1VYYcy3X4Z5Se+Zn29eA+QjWsPqRYk8mPq7YVqFb
	hNvd6LPtPBy69BNWY4/nFLWRBxApR1HSX9ymbyUduutIw90HW0/mVzfzMSsif53kOafE7D3WcyG
	yRp1yBbUG1k9i6csQbkKUEhcVuPEdVJ60sidVEvom94pZVX1fFhKlJ9CVeORHKBXSvwoidlauVm
	Hs6S2R/CK7ankAGQuuhnhX30/FC6+hHvDMfy1TAFN+iLFOL8RkDeKWG9XSzkM0Iox+OawmV1k/A
	prwX/TmtlyLMjmoLJfeKcX50m0zqpmLlN31rIAgeoPpAy9jSRGfJGwuw3PcTZgLEk7BPS43+5V8
	VvoDL2OHjOD4OACWtluWRobxmtgZDoC13yFMu/pmGx/NIIGfWZvw6F244rlMh1rA9ZeSRCZmDPK
	KohlcLSxmsF6j1bpOUWSp8TscgSrQZtiPjkdqHLiBLyxWyMQVd2k8E5PvMlQH/X/+bMGe7xvRWs
	w==
X-Received: by 2002:a05:7300:bf11:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3856fe5971amr15882337eec.13.1795505725355;
        Mon, 23 Nov 2026 23:35:25 -0800 (PST)
X-Received: by 2002:a05:7300:bf11:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-3856fe5971amr15882321eec.13.1795505724860;
        Mon, 23 Nov 2026 23:35:24 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm44187033eec.28.2026.11.23.23.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:35:24 -0800 (PST)
Date: Tue, 24 Nov 2026 13:05:20 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
        opensbi@lists.infradead.org
Subject: Re: [PATCH 0/7] lib: sbi: dbtr: improve parameter checks
Message-ID: <awU-OIScv_zYS649@hu-himchau-blr.qualcomm.com>
References: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261120231119.90214-1-heinrich.schuchardt@canonical.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b053e3e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JfrnYn6hAAAA:8 a=cETmoxWeYDDlgkZL0V8A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyOSBTYWx0ZWRfX2QPIZ6wqeN6P
 ktVHlU61BqW7PGpo58tfwOFsmvOPQF4wG9a+gh0M485XIenexdGESv83jBpCqbV6d07DC4VLkvy
 zW+yexTEk0+MzrNP8PpaqaLySudD57zv0jT00/QvCvKZA1dN21b8yFPwn8zjFUbtJcOosSjElQ1
 HUHIVWLfqrTOpfypDXqytnDxZCvv/gsYPOL56MqeXZCIwQOkmxnJajbhy7kqut6olvlP/eyQ6As
 /ajD6DNDTW4TVpxTAM9AOo7amDJAj+orTrdMgkgzRkerVEwqCAvE67SZVwH6QXEF3ZYaEJUhK6r
 DFjbFGlsBI03hBAx6bolR50vrMOcNo3LYWyFHRwJMDY9yMaKqtCX/HEnf3yZFBSaKzU0hN13tRz
 Erqq1FobhbkZNO9eZVfTXoaVIXG1zjdXzZsXYF/tWEsKY+3xWsQofeblhLiHyQVCfzzBBP42RVQ
 ffRcHnCU60foZf9katw==
X-Proofpoint-GUID: G9H9nlOUQSj6GWnjds0DCupBOo-wbZjB
X-Proofpoint-ORIG-GUID: G9H9nlOUQSj6GWnjds0DCupBOo-wbZjB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyOSBTYWx0ZWRfX8UyuPV739yri
 moNuegEOdWYxv0NoTDtzJ72HDQZdGTjJlfLcoWZcuBMf1k4GZWrqfVCWiI4zs82VcbYcgDh/TX/
 pV1wG4lY1cJR7ys1HSB5GjYj7ko83a8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_233527_948342_89BE0A5D 
X-CRM114-Status: GOOD (  18.80  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 12:11:12AM +0100, Heinrich Schuchardt wrote:
> There a numerous places where OpenSBI's parameter checks don't match
> the SBI specification (patches 1-5, 7). Patch 1/7 is a resend.
> 
> Patch 6 provides a missing return value.
> 
> Due to a bug kvm-unit-tests reports an error for patch 4.
> Enabling an uninstalled trigger must not be allowed.
> I am preparing a patch for kvm-unit-tests.
> 
> Heinrich Schuchardt (7):
>   lib: sbi: dbtr: check the flags parameter of SETUP_SHMEM
>   lib: sbi: dbtr: share trigger checks of install and update
>   lib: sbi: dbtr: check the whole shared memory range in SETUP_SHMEM
>   lib: sbi: dbtr: validate the trigger set of uninstall, enable, disable
>   lib: sbi: dbtr: keep type and chain of a trigger in UPDATE
>   lib: sbi: dbtr: report the failing index of UPDATE
>   lib: sbi: dbtr: reject a chain in the last entry of INSTALL
>

Hi Heinrich,

Most of the patches look good to me. One has a nit about function rename.
Also, all patches are missign fixes tag. You will need to send the patches.
You can keep the Reviewed-by tag for patches reviewed.

Thanks
Regards
Himanshu

>  include/sbi/sbi_dbtr.h   |   5 +-
>  lib/sbi/sbi_dbtr.c       | 250 ++++++++++++++++++++++++++-------------
>  lib/sbi/sbi_ecall_dbtr.c |   4 +-
>  3 files changed, 174 insertions(+), 85 deletions(-)
> 
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
