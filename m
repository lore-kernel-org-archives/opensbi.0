Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59D6CD3430
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+j92imjt6Gd/KPyxEzVOJBqk4B3P4EPqkmLCYdYx4k=; b=2cMry0uNEn1Cm9
	d8qZYWsYaQhzv5xPqb1O1eRVdKQTkepPTzLl9+qgr3WXCj0Picya9647DOijlAng3EcpBay0p5K85
	LP/krgJDCZov6ehKtMJFbUxVcnAJfIDneDrHAdaOYiQjDwnWV3Q5NjImWB7Y+20I/yXlJVeXLvJBJ
	TlvwQGQIwUMmhhWaq4KiHSLl71fzoapmRjxbZPqSNLxub2xLztLBUqILImwe5zNhVg/omWdaEe4B7
	YMbaTybsfbrXlAsBNrpxP5bQQCBDneXF2nlqR28I0SCpQl3wribiZgb5kIR5StvJv8WqUOqEsFHJR
	ZTAO4dLkh/46c6Y77Epw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuwD-0000000DZ00-2F1H;
	Mon, 04 May 2026 15:10:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuw9-0000000DYz5-2pnZ
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 15:10:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644DrKSw331251
	for <opensbi@lists.infradead.org>; Mon, 4 May 2026 15:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WF/PLz6s4dF8+nX98SalNG7I
	/mjLoS41XGYwUNwYW7g=; b=PQw4TxaZX6MDVTzAg4HXVF0vFrDZvLvKcJrKkL6l
	x5+u8AlpdnGNWiQf0cP0PAQ4tEZe9nTW7EjslstWbZKhYJYOr4nLePtfjuvrjsG2
	jztNF6URicriofPr1s6bJ50U6QoCz1UCNC+POinZvm060+DQA/FtihX5LArq1DEG
	0opHV3QxDIP6Lq1tjzoJxGhhjQhvtQgOagDSVwUpk+R9ufdH2l/P4NDLNrTuL9cf
	2DSx0A2uMREJMlNVc2YiXDjy3EXwVsQREQp+eo6ZHfHH5HGUaSNr2X6NKm5BQgYT
	TZWtF3Gs2GKppt9ILOKCMWVV2SzDuxgfwWxjjmfYyAt9ZA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr18akf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 04 May 2026 15:10:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c798fc1a426so1364857a12.2
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 08:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777907420; x=1778512220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WF/PLz6s4dF8+nX98SalNG7I/mjLoS41XGYwUNwYW7g=;
        b=brXuCjvmZd7hQb0P9Pabm4mqPEUqdEkCpO/vq6B6cfTZnGcMBOhYyUETKceKljJsqg
         +WEEuEPXGAsV143Xp5xDPxtnPaNyrDrOtzsfNyhytDjgPf2XFtQ/M6+JEDx7S5av1CIM
         bzUXLQca/z/+AjZn9oPrlB8aWuuPMHyQ1wdYkV9vkhP9eU4BNbEm1IonY2B1lcfejvj/
         F9Cge6hCu/TFfL2JFw2S/gsFrg2AWTysY8Qnc5+RSJI8EtCBlPS5Ul9FMnoDWcelhMrp
         Uy8PvjQx4ur7Ut/KG5vLe/mrS1G7ZfQfSsYt9IF4BCTiQL84Hfbb+1qbB/zTb926sb9A
         OBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777907420; x=1778512220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WF/PLz6s4dF8+nX98SalNG7I/mjLoS41XGYwUNwYW7g=;
        b=NpFCxpV1poXbOAr8WU17wPiKmRdisEhzOuzMbCaWvPmd7kY9t7+JCgouX7cyWicf3K
         otQ3FVoEJBP7H4ln4AtY2Bf0XLszMD2HNKAASKOd2lJ8SSW2Qf44SATQR1/G8b9vT2UX
         Arb4T/vrG0XmuaGIMIvtiPVpIOE9avtI/M2Ce5cYmruwNxQrT2rj7ri5jkGV7+uuL+ju
         8t3ufu9Dsu5rqwqCCjmSfu6ww6Z8P4eEfM7dy31HPiA/VRisPWxEiuNpv6zQE4PdnPnv
         V5w8CWv6r5oB4QqXcPbP7rc73fqevVKXBHesatWsXUL73yv+LQtYf+aFaDR977jDbrQc
         G9/A==
X-Gm-Message-State: AOJu0YxHIWF6C2veFGDLeUGSDz09fyK8xFALRmLk+VDIW9WcbM58wCHB
	mbru008Kpur/New0K3qG4iGRh6AJzKvaSFbR61Jy2mGEA671+HBw92bJ2ZK57SJF4ulB5C47QlY
	sTDyPnnf8SLQp5P/yOJNB89cwZOwElc3kBX0jfQ/4czeuJrdv43BER/Q5e8R2CIG8EA==
X-Gm-Gg: AeBDietite6gAtYktai7kDxme+IC5YNdH321x9iJ0xgQFJPgNtfuUh8LQcqOlw4XHXu
	BJCrAv/itoemqHdliRw2sn8BXD6Mv1frzTg/ZlEArSXnHE0AoDL4pdFo8GhTgEHLIeWkQieGlEY
	9LeF95XcULLQ7ITy/F5qYjrllHX6QqTFXJINA/2qzirvj3WnqX1qACJ4Bvl1sMdSQ4KCZlEGNGp
	qzFbU+KG6tqmH8e8/tdt8XWs+rJVRwLNqyvEFAlsaZMqQpTB/n31YlZA1ReXmLUT4BqF1DF7BRN
	UuvuQ9p1Zd8Ii2JfkRE3cUTo/jsMVJpcs9MZrttgoqVCDyT1hXn3Gx79WKKnmsz+8qNf0W5sbiv
	ZX+sUGcjV15/5RmZredhAGzj0KTc8zDoq/vNaAicPCa49Uq2ur261VTdSAusIeOlfXGxzw2pFLc
	oNMta6pCqIibM2HnkRwCZ2l5Byynhpuy7RgIDFXuD6A3CpXXw2kPuu2+Ss
X-Received: by 2002:a05:6a21:3285:b0:39b:8dcb:f36d with SMTP id adf61e73a8af0-3a7f1bc364fmr10352437637.35.1777907419765;
        Mon, 04 May 2026 08:10:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:3285:b0:39b:8dcb:f36d with SMTP id adf61e73a8af0-3a7f1bc364fmr10352393637.35.1777907419226;
        Mon, 04 May 2026 08:10:19 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8025008cb9sm5063962a12.30.2026.05.04.08.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:10:18 -0700 (PDT)
Date: Mon, 4 May 2026 20:40:14 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org, Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: Re: [PATCH 04/18] dbtr: Return correct error on install not supported
Message-ID: <afi21tVtYwkTVUr9@hu-himchau-blr.qualcomm.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
 <20260313051948.4017134-5-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313051948.4017134-5-npiggin@gmail.com>
X-Proofpoint-ORIG-GUID: 0YHL2LZT4sBthzJshCZ18czWZfBw0RNM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX3aztZuTC7npZ
 YbYP62qWmEisbkYchoX+KB8CsDDVt6agpr1SdbdZ9YPfO/c1bKiGHqE+vTr2SetPBruUKVIZ5uc
 g2fbaZwi2izP3TDCmoxyEg34kW9wxMo5TD/Hdy8rNF4tf3nZvPeHVKAmuQeXQvFWXRDKN8XFgKq
 YWDlZtOijvwl/sSXtcJAjRKaXLjKnpjB/FESPmdhN3ApSgTXSNSZxT18+xe8mcaUTcCpeg0Efz9
 U4EZCwh6ORa3/e1IDHprIE/ydr2Mj9bQacOnuTNlZSwrAo+8Jat3htNXDbAc37DoURL3y9TsBY0
 cAAbTmsZDqUiWqGY4/RYCu+rVzI0Aa7f55BwUxuUlrNbjvwtn7BFVD2qmq3Pp/hRcxi2eRUwdB5
 AZstg9/lJYI3e4DWoiOKKZyStVwwkNhTOmzYFOQ6WnWwMvVDiCVIsWCHI0L8KFqMNQUrSK++u8n
 eo6PfpdnFYTudZwQIUg==
X-Proofpoint-GUID: 0YHL2LZT4sBthzJshCZ18czWZfBw0RNM
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f8b6dc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=zYVSzclaV3lDZXx9WqkA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_081021_756674_0BCC63A9 
X-CRM114-Status: GOOD (  17.50  )
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

On Fri, Mar 13, 2026 at 03:19:33PM +1000, Nicholas Piggin wrote:
> Return SBI_ERR_NOT_SUPPORTED if a trigger is valid but not
> supported.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  lib/sbi/sbi_dbtr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
> index 10ed6b3e..65c3b2df 100644
> --- a/lib/sbi/sbi_dbtr.c
> +++ b/lib/sbi/sbi_dbtr.c
> @@ -617,7 +617,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
>  			*out = _idx;
>  			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
>  							trig_count * sizeof(*entry));
> -			return SBI_ERR_FAILED;
> +			return SBI_ERR_NOT_SUPPORTED;
>  		}
>

Looks good.

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

Thanks
Himanshu

>  		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1)) {
> -- 
> 2.51.0
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
