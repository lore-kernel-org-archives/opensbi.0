Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CC3606A31C
	for <opensbi@archiver.kernel.org>; Tue, 17 Nov 2026 18:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Q3596Is;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AQc9+ITV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MyHN2rM791AVxhncuNowvqTPCOpAtX6bhuOTVlBBfoc=; b=2Q3596IsUBYMKNshOpmuGWHj1v
	KU1MmF2fy0p3K4EPN7JdA0ZgXAlZ7UG58goHHrpSYlG/0kcKkoapu5zUdUojpW+iApPQacDo0j8/Q
	/epBhgehfZSV07kmN6bpErgzZtiJimXWdGGwQp7wp278ZInnzyD+hE4EOOoQZwWcAJY7JEt0LBSoi
	BQrtCazwgeaEIjzvMF9//xHBxBCCC6jEBw5tfpdTc6roywM3Ngaqt2swVFaZliFnCj6/1a2MLvv/9
	q/0/mIVi7KetWjOfG6Lze022LYG71H+OUnCBUWHPtKW4paVrFChPZuwV9CyIO65SGdy1SboSSyD8Q
	+igTq6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOEG-00000006nNa-3Awt;
	Tue, 17 Nov 2026 18:48:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOEE-00000006nN7-0ZPZ
	for opensbi@lists.infradead.org;
	Tue, 17 Nov 2026 18:48:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHGJMEA3327629;
	Tue, 17 Nov 2026 18:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UiHqVkJMOmK
	59U6qYgEGr6r/wfO78KxHtjP0RnwaJWA=; b=AQc9+ITVIBU5/MCrwhjXXyauhk1
	5TjnShLlxMkcJqK2ZzaIRdnT7iGm5MJFECRpTCkrufF1L7LuBqu/f8dvO6moaNLM
	Aj60n3A45bxwlOTQn9jlcvP8lC6gl90IkM44JnSSl0B4I+4d6oIrEAlbSH0jljFl
	pKVjfWkVEPmMobFdoqoGT7UO0M0mwnsYmzxaX4ne6Z0jTmkHGpVe4Hh0VSBFy543
	HWSrBuGeWeiJ0vrTg6wHSXkxAYx9bL8u7fn8eEjcQE/WuvtqXfGBeX9+4f3ZMLIm
	dhMRbltIeud3K38nFNnpKw/CtdBTFKDsWk1+Uu5y80u+BJniwGfQH2505eA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbarngy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 18:48:24 +0000 (GMT)
Received: from pps.filterd (nalasppmta05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHIjpVB3060660;
	Tue, 17 Nov 2026 18:45:51 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-poza-lv.qualcomm.com [10.81.92.230])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 6AHIjpKg3060639
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 18:45:51 +0000 (GMT)
Received: by hu-devc-lv-u24-a.qualcomm.com (Postfix, from userid 467151)
	id D689124D74; Tue, 17 Nov 2026 10:45:50 -0800 (PST)
From: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
To: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
Cc: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH v9 6/7] lib: utils: mpxy: Fix RPMI service ID lookup
Date: Tue, 17 Nov 2026 10:45:45 -0800
Message-ID: <20261117184547.1145243-7-pawandeep.oza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com>
References: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfX797epgwxyBZr
 9eRVjkLVWAqht/g+zXFi1QHdl6K0X1NluPeuVluuqk0zsRa0HZ4yraNBdI7Ky0b9dtNq2tnwGmb
 LEX8zCSCjXa82VMXNhDAmWmzDxQO9CKRjMVjNuCKCxpdRp3mUADjkKDecc7Jjwdg12QWkw8Y3gd
 SYkjK0o+U8uW2vYBbwia0AJsoczppYLf334UVRMxxjDZ5MHrlO6Fm9JsrWLaL87vY6U7DSQ1tTA
 mXTC2qtBhz9CioGcXzwNCXeRvHZazlI7DvqERN2+ERUrn1oI4AACl26NbA9bLlRHNGnynDyNg9F
 /G4XosIB5ICNeHGaYQ0l19g/raNAq1eCuWyBXzYHtQhmv38U51rRXZCxgri3eQDaUG/ixf/MkS4
 q/bQSxA7xejDzSIVy6OwsMOGYffXnWvOUWjwLERZ97nYkySsUH64ZrfCPZxVpeYUvGKHtTeXRTI
 ZCpIHGu0BJjpl9YVH6w==
X-Proofpoint-ORIG-GUID: E6DHxy_m-kyJKxvnkg_v_r-4EgKJhbfM
X-Authority-Analysis: v=2.4 cv=Vsy2kO2n c=1 sm=1 tr=0 ts=6afca178 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=eg3pw4guCeLyxpHAFl8A:9
X-Proofpoint-GUID: E6DHxy_m-kyJKxvnkg_v_r-4EgKJhbfM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfX7moxYIdA22wl
 v0BeCkuuo2x70S7A600TAUNvEbMSuKTT1qDc4XrxdhqJ5/fp+zRre6DM2vuCuQ4EW4nIDFcWhUY
 lDGiCgQYa80HQImBSQlxnW/VoCBwU2Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_104826_309495_E5634404 
X-CRM114-Status: GOOD (  13.63  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>

mpxy_find_rpmi_srvid() incorrectly used the current service ID to
control iteration through the service table. This could stop the
search prematurely or read beyond the table.

Bound the search using num_services so every registered service is
checked without accessing entries past the end of the array.

Fixes: c5a8b15e398a ("lib: utils/mpxy: Add RPMI client driver for MPXY")
Signed-off-by: Oza Pawandeep <pawandeep.oza@oss.qualcomm.com>
---
 lib/utils/mpxy/fdt_mpxy_rpmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi.c b/lib/utils/mpxy/fdt_mpxy_rpmi.c
index 6b71803d..624831be 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi.c
@@ -76,7 +76,7 @@ static const struct mpxy_rpmi_service_data *mpxy_find_rpmi_srvid(u32 message_id,
 	const struct mpxy_rpmi_service_data *srv = data->service_data;
 	int mid = 0;
 
-	for (mid = 0; srv[mid].id < data->num_services; mid++) {
+	for (mid = 0; mid < data->num_services; mid++) {
 		if (srv[mid].id == (u8)message_id)
 			return &srv[mid];
 	}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
