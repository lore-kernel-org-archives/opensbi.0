Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD9710FCAF0
	for <opensbi@archiver.kernel.org>; Wed,  1 Apr 2026 22:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3QL/gKRWt/26IBDxeq4Q5rALFWdQbyWjm5cAbNBn0g=; b=HxwKIYQ+iIMZXh
	uoVCn86WZ1ekHocaUKBfC9rmNLmJum6aRBPHLMHg3i8hZ4fRKbogiVHNwBbbw4bJLHVMxAHVL8SPO
	cldy3JR97ybFBbUj48hPxbNp6sQsHmpy+rrZp7UbXCV4HhI+aqNzfxe7sGZF7KaJzOBNP3ygeRusK
	ivc1b4B9sb0qptHSKEvwBPhdbp/EvQA6klDQKC0VdKOQtWtJpRMPIegDxF1OwpfoektSX89yOQVv9
	iWvpB1SQYXk/u3uuO7j54pXMbk+9+k2MPgYgogpv9AabvXKu/LfSuQBiNuvyoRNlP9EH7Bwv4uFRf
	rzXVkfVHkNispozu+SKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w83ng-0000000GIiq-3uT8;
	Wed, 01 Apr 2026 22:12:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w83nd-0000000GIgi-3S7v
	for opensbi@lists.infradead.org;
	Wed, 01 Apr 2026 22:12:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4C7w3956007
	for <opensbi@lists.infradead.org>; Wed, 1 Apr 2026 22:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fKzye1ke2mY/97WGDOq3WzLy
	v3TBfzHEX/Q8ZOWtjGw=; b=eF9uOl++ajJGo+dkAkMlQapxuESTxLOiqyw3rB40
	4GgUHXFIOrwymh8k4ZSFAWvJJNyc3QTR7L6YqiAQJvawXeufddyNg9Mex+ELWpIe
	N7imi/a1aDX3Aaeb05JezdkiHoNhvl5eqOaUX/O48AdsTLsvOglNlOj8rYrLLAGY
	Jz3uCbY6PrAA5i1hE/Evrk6ertXW9tjgo2BTEWPQOdyPAwXQ/hVnNOvzkeiVPc2w
	phxgx+lCiBvEpbzdZTqW/fWD6pCmO57S/SmP9/6xsQq0nedd7zieKRcB3KvqdmeS
	ivsbHCPivtEpEvY6YF6MF+7lbd4Y5Td9A1TWWQ8NSsG3tg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5g9ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 01 Apr 2026 22:12:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so208966eec.0
        for <opensbi@lists.infradead.org>; Wed, 01 Apr 2026 15:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775081551; x=1775686351; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fKzye1ke2mY/97WGDOq3WzLyv3TBfzHEX/Q8ZOWtjGw=;
        b=AREkTC7sfJS067usFVtq0zei4p7tU4Pi7tgae/6YwJHIrSKak/YaluB+fhch1qlnwb
         Sp1KGlu+c3J+Qk++0jCBymcXZps9+U3G8UsfAFWnXYBtpgOzniubWvhbPZ1Dz9V1aswW
         Nuqc1yoQyfIhcaLizbKcSqrR2pl+Dni5dZcFg1ModyOaGmxNgMwa1rWZlWeNLALUIa+k
         9r9yMynEykk55fTOZaP7qma49E6EekKmRmzgoXMecVqcgtYBrm4wV5iGLb4pfTVh+nR/
         gRYbsaLGTlFmZG1s4kkpGy4sIC7lKuV67Ue0X+RB5TcCspGSci41sA4D2+KdvjZ/AQBQ
         sXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775081551; x=1775686351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKzye1ke2mY/97WGDOq3WzLyv3TBfzHEX/Q8ZOWtjGw=;
        b=p0x2VYT25b+houheAMiyDUHHANcHDQk0DZ7uzq32uG1iXix8RzeB8GZorno+Oey5nP
         2yHerLPmtI9luwNxFsoFB+zTIxEN++E6c/r4Q5jRRwSJCV6nvbJbpApy3ftOx6ehPevo
         Ac6drHoHFgB3Lp4v+nSijqkh4JmwTYEuf46C/j6Zu53wBiqMgb4ob+p0QmQ8fqr7lRjp
         f61LsNhSIKNQTDJ9i5rIkgBTn8be8Ir/xUY6kNfgQYcA9V0VHudPq920SKPKBkowzWX0
         oQUkZ6t6Rvh/139+2EoP5f8Bvu2193yAAiXYpBLdw+Si+9oIZ6OgFuIwgh3iNwzRbb8o
         ZQGQ==
X-Gm-Message-State: AOJu0YwR6ytsYyGvDXXTHpAPc+ZdC0c17Ti9qcc3ymxz4PLlOghcrVl2
	7PY39iZK/ykOJP4aJ3Rju4vUbrOMJJ5R5FrlkEDSXMLnVWsOIh330L05690d+MxLO2iJGmvY/xq
	t9Gy+Kr5CXbrG4LEiRr+WMaoGE6GFkO59OghE8t9vVxicOi65hb1yfxWD8NN9+tZSrg==
X-Gm-Gg: ATEYQzxqmLjPuy7PSXLtEt0AV8AxxKAmBEoNVJdRk5fZSkuPVauEZL5o3cohV7J5V65
	eUyCc+BdSpYwSFAwLmaLFeu8OwWQXV7gnKxD0EjtvjoZnLRoWkgNA530wfKn7YfLLGsAHlt4KdC
	sjC/Sw1Cf0YBmfquxUjrnrph1wtLZe7qQMDDrGLlHl8ISMuqdFEa3mYnQKxjYRCR3DRW3mxKSnT
	TuBhb9DNxxl6sENSiUTeh5P+piM3UxlaxKkUAzKKA77uEInIymox01wRbfUbmEb0PY/A/LnGvq4
	2mJqHd/iGmytjSkcdi3e49dyu0OvbLpM2D7N4BL3tRwrWyB0I1GFwycmUqb3y/umpj48MTB4tBU
	KDeNNsrdfv0/DlHOBuWKRvxRaIPbM+Hw=
X-Received: by 2002:a05:7300:6da4:b0:2be:171c:2180 with SMTP id 5a478bee46e88-2cad308c50emr55532eec.0.1775081550841;
        Wed, 01 Apr 2026 15:12:30 -0700 (PDT)
X-Received: by 2002:a05:7300:6da4:b0:2be:171c:2180 with SMTP id 5a478bee46e88-2cad308c50emr55521eec.0.1775081550296;
        Wed, 01 Apr 2026 15:12:30 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c151sm959744eec.19.2026.04.01.15.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 15:12:30 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:12:28 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: sbi: Disable hw a/d updating by default
Message-ID: <wwxwuq5fm3unqwvxfh7uvq3zu4vugevzy2uaxcipfoag4r52zd@loifl73jl72g>
References: <20250314103301.10902-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250314103301.10902-2-ajones@ventanamicro.com>
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69cd984f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bDdBU3oEAAAA:8 a=YQUyvgbua8QK2MYsAkcA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-GUID: RxV5LnQD3kRkxHyS9M57A0YOLdXqDzZM
X-Proofpoint-ORIG-GUID: RxV5LnQD3kRkxHyS9M57A0YOLdXqDzZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDIwOSBTYWx0ZWRfX5jce+FgHDvC6
 9rH99fMlIMX2K//uRrkJRNKm/UoMJcrcazK72PKFTxKcZvpxJT+OPkANKVqU1fbZpD6UYaIezor
 vGyXvBTyZmikii3TGyPzEjuFz6hxXKgZeyULTWVZhg4fc5cdmkbXaVn83Ij4WPvwrvG6/iQ6Wuj
 6g7rbafT8J4N3zbLs6zEjo+Yx5VrwnsyO2pfSM9aED9knz5u6dRpVl/sZRkIDwVP1S8Kh7IRY3z
 7yOp3i5SHmRueZoobcjWAHk9R6jLiMzbIif0SjFch0GGKL1X5n+MjWVfpllF81gV9l0c3/L5N9L
 ZD4egbuSG3Sgf5zOW0rQhMFDzvRQqyPdMYt43kiosEE+JyipK7YPkj1+uSdet8cGLpHEeL+DDgi
 OafmUWzOqdlTXLiTjbSH8id+YB5t5nGZdk2mcFxB9TGvVIERtXlOH/vm7fPHoMwicQmkQyBVlGL
 pLTGOfo9dE30OyKh6Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_151234_007103_2A52D55A 
X-CRM114-Status: GOOD (  11.64  )
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

On Fri, Mar 14, 2025 at 11:33:02AM +0100, Andrew Jones wrote:
> SBI FWFT specifies zero for PTE_AD_HW_UPDATING's reset value, so
> ensure ENVCFG_ADUE is cleared on init. S-mode will use SBI FWFT
> to set it when desired.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>

Self-nacking. I've just sent an improved patch.

https://lore.kernel.org/opensbi/20260401220845.190680-1-andrew.jones@oss.qualcomm.com/

Thanks,
drew

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
