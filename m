Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3C1CA600C
	for <opensbi@archiver.kernel.org>; Thu,  8 Oct 2026 16:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JU5Sq3D5C1KybmAe1TRF6idOciPlXUvrJaY5IOmeoH0=; b=zm3zQ45+4bhsMH
	0/pDRsNg6ll7xPg3j1bciMsm6z3OEb32cSnO+Rro3DKLQjA6d54ivo9S2JXOvZopDlSVSunk/X9u6
	0ZtkoqWmirlNGRiX+jZi+p/i2Cnn5T0BH9VyGlGeWI/j5UBSJuXnWfzrZz8LVbNOb5ByHRJ7qdu1o
	tETiUHk7P8s5JD1cyAb/wbwebMenNMo0ruuX5eUEIvHUi34fkRYQ1bqdih1ycvDd1PyGm4yPuZkdP
	6m7X6V1nwx1/wKWAdwt63hPvg5GoNMeuh+xEaF8a+cGD4RVqB7Bj8+lcojcnRUMnua5N/rdSpPM1I
	bibyGTKdmQh4vYjDm2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqkG-00000004g5P-40NZ;
	Thu, 08 Oct 2026 16:13:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEqkD-00000004g4x-3H5E
	for opensbi@lists.infradead.org;
	Thu, 08 Oct 2026 16:13:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVHwi2299407
	for <opensbi@lists.infradead.org>; Thu, 8 Oct 2026 16:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8EMTrNCepEG/FpIbAYjqExnE
	9tgAGn+W9aEp9r7CbiU=; b=COYLntiExSYH3ju1s6aMK+X2j+MbMHk5SQeCWKbR
	ba+q5QF3SiTcPcKJ8K1RR3+VYv13vrTeoHAnJjD4K2iPkb2MPgDWO11vgDg9RagJ
	GRwJbcy2VRzjwwEv7uE7Lzml/TRsLrzK0e3FN38oCOeamNOcmoYhaONOM9TsqFPB
	6s/A20IvOVWax2lT74Qti2shhABCupu+DYRFE+iD3Dc9EX1VzfqGpIQGvKf5sj0P
	H/85RlR/U+ePnQBeYOX15J+lDK1FSrg1RiRbLy3Ok2dpbc6UBF8rVmngj38DViGn
	SLEqrlNhH1+nWhAgMdNoxYMStJYQqfGYHrlZ/aI10LS6lQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2uq4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 08 Oct 2026 16:13:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so904114585a.3
        for <opensbi@lists.infradead.org>; Thu, 08 Oct 2026 09:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791475999; cv=none;
        d=google.com; s=arc-20260327;
        b=sKZnySR6mnmVkwusFvsWpdxzrU5gZxyXkcYdvTCnza1zYngkRqfVX44yoP9516KLIg
         gWuDm0DyL9yxqoQelG9pABjYcmZpVfxroCbcpacBk6unj/WOG00BKy7YpIwUmiPvkoMb
         2t/i1oydQXmNkMpWbQO196Y0jRIQkeKtRHkFMoQOSFRLl13dC4hLlGL43wFV+96uJhjx
         /memNTGSdiSP47KxRZzISMO3eJKBSwc96WC1rJkySUv/lwGqvdH/1gwYKUmzhNjPpQ7h
         e5laeDIjxB9oKlejxlcdbR5IdCIV0/rRP6aJ+p+l49KlKV9dNZZipJwgrPW22zbV5xF9
         3W2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8EMTrNCepEG/FpIbAYjqExnE9tgAGn+W9aEp9r7CbiU=;
        fh=bl3YOGEsGOo7pCJaUpMXrEQ7HM6O/exCckg/Y/KpbO8=;
        b=Wx6GctqUTY3hVJD6BvdpokAn8duWzALYTnRYUusBXnYgmq16h34Z8QPHm20tLYv2Xa
         cU4kyL2/cWyhtWyD/pEPFmmdpTdsOS2SN01QZlIIg2JJ+4WY/1fBqIzxbApFwYwLFX1e
         bTA5tInADbmy5Cg9XVhW7jp8Q2Ps0/tllyH38DCWKNRpjktulUHfvEukO9fkew04o+uC
         yUwg2zKeq7usVpBCJeJkC0iBNom0bw/AVF+sZyyajAa6Wsqqo8gy32Jt1VAQCbMwX6iu
         IKdxFV0b/YK046+wkLvf0WKoclkKO1TuRuNcyb0+UEcQ7ZxnQcyw3gT8JrY1zE84EK2G
         khYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791475999; x=1792080799; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EMTrNCepEG/FpIbAYjqExnE9tgAGn+W9aEp9r7CbiU=;
        b=WTVuGTmet4Fi6pGR3g1PobMskdcMudIrcMp+UW2eDTK2TC8hkL0ngFs91DqNZk1XSI
         /DsMd4HEr4RAJ6kAYes0jp5Q2fHc/sRstM2Oy6Oot3RUMdiNHga7L/qqroXnj7Ig2gNa
         4jO5T6/093tFq5OUEUgAq+nJ+Y8x/cTeaA45zerljKa2VRX6ttJgXLvV4YOMje5+l+wn
         KrJpCwExpP8AUwsv28ntZfMvjCGFYJh7/LkpXFS/tYJbyRWX2tQ8ntZnCjtm7ztm+jhj
         gcKGlI33GkXbVXFPWJeAcUOjK8XSwHBoUEwjtZ7IShWiodEaoI2MWwMznJmwz76v2t4Q
         jbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475999; x=1792080799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8EMTrNCepEG/FpIbAYjqExnE9tgAGn+W9aEp9r7CbiU=;
        b=QjqVvyQSwawUQbLYNDytOTZj69UVyvfQFUI++L0jTyGiCnWAZHVWLKaM308hBgCBv+
         ffVVGuzWOte2Qa38tSv5ThZl+02X2WTyeZ44hn2snTAvELmmoi9JmzsCsA/Fwo6q0PBo
         u56VcBVbTGzpIf9UxdIsod9SsuvyoAYUkw6sc+YUetB1vTEel0pvAeo1Y7kwspe13AcV
         1HRGXtk5uDRH0VyKJRV/6i/9GbZEasTaQNJ7o66AjY14+dPiqTfa4C02QDWlgwwntL1j
         CCpVLKiCbJHT3/2ahPqz1IspN0B3hs9edeCChTgkHLyMvjzk38dDku13MKnH0NmS1KYW
         xJXA==
X-Forwarded-Encrypted: i=1; AKwUvBx0sP6D3TMlU8MgyXqIkXBzjV1+e52ahJXisZGLreP8+GXQhpwe9rppJRyKtMVdIeT9yzg+c1jW@lists.infradead.org
X-Gm-Message-State: AFuF++k48H+9vzZp+dkanF/0B9fiSLr1kjU1I3QrkVdV0m1Q1iaI13ai
	lodEjvWNkhEGQ9kRTj9qv5U+d9fh3uUgl/1mLfpfSptunyY1VT8FISyENc15a7i6CztsNKgdit9
	l3MlNRU3/IZW8mrxezxBQTMxKV3GHd2Bd0HsN5DOpZaEBk5qX/Ow+4OTs7uw/+dOJxls1RyELtP
	A5gtynJi+dbaaz1N7xLJS2rGYUKM5IF3vgYx/4dfGK
X-Gm-Gg: AYBFou2ZO8110cB0v5OY6T4zqM0Yd/jh9+dvoVbdBjcHf6dFzysRocBYvDqPoEy1GvC
	askCobKbKW1L76WKLulSenp2Jo3LluFLHAmDx+jDDzZWIGk2A2a1fr1u4CRsalnBhMHQiDaKoSM
	fBnnCmzaH6b34FrbrZ6+Xr9cZJbze6gwUSFFnmL8eEObgSfyNqsqlmPj0Q3GPmWKXUGnA+RROyg
	/oLYOYSndOoD5nFoA==
X-Received: by 2002:a05:620a:40c8:b0:939:a0f3:6aef with SMTP id af79cd13be357-93e9b7435c3mr1231922385a.23.1791475999209;
        Thu, 08 Oct 2026 09:13:19 -0700 (PDT)
X-Received: by 2002:a05:620a:40c8:b0:939:a0f3:6aef with SMTP id
 af79cd13be357-93e9b7435c3mr1231915185a.23.1791475998631; Thu, 08 Oct 2026
 09:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260923032359.4041876-1-anup.patel@oss.qualcomm.com> <20260923032359.4041876-12-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260923032359.4041876-12-anup.patel@oss.qualcomm.com>
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 21:43:07 +0530
X-Gm-Features: AclHuK_-PxoMDJ97HLLef0C14GrfHpxuUyr1zys_pzx2xta7HT00kc7GMYnM0yk
Message-ID: <CAFR3w37k35NmVxV=xxRJYVrd0fk_FrsL+jecwBC+=zb-ow-vVQ@mail.gmail.com>
Subject: Re: [PATCH 11/11] lib: utils/mpxy: Use domain notifier for deferred
 creation of MPXY RPMI
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2NCBTYWx0ZWRfX3oTdw2+mtxH2
 1BcM43NaHiW7QfDt6N2SSOvv8ivC2mV+lsvO/Jx6hUeTCNmVpRgSNnP0CHkZiUrSInzhKMQf5Ky
 i8gxHQCPYPe9nNXYt2nLudHBxdUnbMs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2NCBTYWx0ZWRfX8aVMLvbIgoBc
 xPZs6lJwvseAGqQ4KEU40ClJT8sXjsYlEchZGN7mIya0nFRL+Uet6czGeaS50kow0g12nM2s4dQ
 6Xq3lR2UEfq3U0rBOkCPmHMQuOQt2++OeXOTuobx6k471TNS8HzzcROvPnO1UoeiL5YkJSjgr+W
 F/X1YepHulCaTcxNOloVcb7Jh2HDQr1V4CvPKDJwuEG7l7/BGCnZjPY3uMnm5EFYCGXESPZN7co
 0ATTbdLosIcwiHhFQflPm99WuNx6IuqJqQRsk+ShVzvO7tRZChlqqVSfXOaGqWtUHzcvizZcLdf
 quRcaQP5+r11uefHWOYxJmkXdLl4zpi3kEBoyARHTsRart7SGD0nFsXPz9GKqJVH8vFDU8gQoM/
 5MFExk1uWhD4Dkk5H9iIEzxEAqGPAjG+svkmlj/4zFT4WNXN6sVs1qsT5dOdXzj9a8XrsxCggH3
 bLIP4CMLmaNaZF9rU5g==
X-Proofpoint-ORIG-GUID: 8Le_yR4mj2CNXXla9AbrUj6rW_IdYISZ
X-Proofpoint-GUID: 8Le_yR4mj2CNXXla9AbrUj6rW_IdYISZ
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac7c120 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=G-WSK6hv3yiH_Aa9n5oA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_091321_832133_EFA3D837 
X-CRM114-Status: GOOD (  10.14  )
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

> +
> +static int __mpxy_rpmi_defer_notif(struct sbi_domain *dom,
> +                                  enum sbi_domain_notify_event event,
> +                                  void *priv)
> +{
> +       struct __mpxy_rpmi_defer_init_priv *ipriv = priv;
> +       int rc;
> +
> +       /* Do nothing if domain name does not match */
> +       if (sbi_strcmp(dom->name, ipriv->dom_name))
> +               return 0;
> +
> +       /* Unregister notifier */
> +       rc = sbi_domain_unregister_notifier(__mpxy_rpmi_defer_notif,
> +                                           SBI_DOMAIN_NOTIFY_EVENT_REGISTER, ipriv);
> +       if (rc)
> +               return rc;
> +
> +       /* Create MPXY RPMI instance */
> +       rc = __mpxy_rpmi_init(ipriv->data, ipriv->chan, ipriv->mpxy_channel_id, dom);
> +       if (rc)
> +               return rc;
> +
> +       sbi_free(ipriv);

Freeing the ipriv is only required for success path, what about error cases?

> +       return 0;
> +}
> +

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
