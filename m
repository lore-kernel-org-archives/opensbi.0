Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F73606A324
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 04:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TrDuG2FO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=myoyHMmp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lx1ry6Hn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pX7GqAeX/fTA53M5d+615pR39gxaEF5G6lj/t48q8mA=; b=TrDuG2FOPbbfLrFqWgxcV/wNKu
	TXxWNnUpQA9QlSKW71gD2ZI4zvdlGG4MQtMCA9rU/KZ5K7Omy/HpqAgrrmSPFB6ktC05t891cyF9j
	5VJ1pOvThiaIy/vmqfKoWLVp2HQ5KCy66WkDebXeKXlfV9Nm1iUGOB4PGun68KVp2Nud6DwhmQKpT
	IDD+n4kPtPDGYXCeBkjkC8KgN1c8PY+wpH7YXm/hdMGcSjQ00iaPt2yHBnATfES0wcY+8k6EStNmI
	DFfITmtgf6f3WxlK265Ie/G5iSK1f34bMJbaaUKa+3nT1IE92RChjP4bMy0Pa9VFaaUoJLCIfSUSd
	eJdPs7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjka-0000000FW7e-1QK8;
	Mon, 02 Nov 2026 04:34:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkX-0000000FW5b-3i9u
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 04:34:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vKP71676192
	for <opensbi@lists.infradead.org>; Mon, 2 Nov 2026 04:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wd/KYM3e+PA
	JRAmFetOiQ/j1DqcwiDbEgZzvJIGRPJU=; b=myoyHMmpSOWTTKOAxD7SciJcSyW
	5e4Vqsv7fAQykml0PjT40vMykYD+Np4w5mY7C/67XXvvuWRWvFgZi0x1tvn0chDI
	iLL96AH1TWhgy6Ukra+EyO0PA/sR5bwYwD7ISfTlYJdVZf2MfEyeCtqdMK4nIY5U
	1ZspEdpVVZ2nvnWZX81oR9mIZV5y/PSJ76wrbX0T6+xGKstE+K5nLHFJAj4Cc37i
	Sb/EHub6HJBqVwhQKo9TdLEQ98CCaT7sj/BVtXtIkFnGGhGCeJ9TU/Uz/J2RA3m7
	njTYHk0NYKyxDhK95v9S09OtC45FcECYKKUnmUtRFDYfhiMw7k3/8V8X7og==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7w3qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 04:34:24 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so4059781c88.0
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 20:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793594064; x=1794198864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wd/KYM3e+PAJRAmFetOiQ/j1DqcwiDbEgZzvJIGRPJU=;
        b=Lx1ry6HnacGRf2IdnfP6hA4wrnKf54DMnf9bSyneWfdPCTezN4QDg+zMzaTu+ke7rZ
         KAVmQe+oyxSkM73/vYGYqTAslCgo9nq5i/4qEWLj60tryqR/o+NLaRWwhlcd+UE90Siv
         ENFLnvXPFCSD7Vw3k5V+9RHzV6FSz7qKUcgSUHcq8oJnOtpf/p29TdtBxSPCgrz9L9Cx
         50UE4+BJ6nl3/uhZw7+Ro+m2dxcC/1ZwWs2sUTYWBad9rSFk3u6nNRfNvTVIKNjgRN2f
         ERYqlPeXikHSH8Qfk/WT93CAJ8C8WhTiBxCPh94P9jzMlMuObz+6Gs7JpADcJQvnWYmc
         Ft1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594064; x=1794198864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wd/KYM3e+PAJRAmFetOiQ/j1DqcwiDbEgZzvJIGRPJU=;
        b=xJiznPVWjrEsK5eb6Cc3oTJ/N5mPBQR0bQ9eUMz6cQgnKNBspH8Yk+NuKPCwD0eJnc
         pX4clRSrFPeqUi7u0QIBg7RUxOA8S9ZavDndJMaDZy7I3jcZkio+tHNH/q7GjGSTNIxL
         pnJL+Rn5S9EvODBRaIK9No9szZjRYu4T0oA1Bi7HLhoiqBvhLBM1dzBUQc7QoxjO6V1g
         q4IbGjhHq1TAWBpSK3S3eHQCGl6v7wdADxJ61gN63PeKEU8xlyo73+jg3PntPH67AgwF
         /HkYzL2uqMWlvTVmIQrEh40gWDSF6ulyv9/HBapyJj7heDG9lptQw8wjEOyTKlTWduDq
         BRAw==
X-Gm-Message-State: AFq9FYIUSw1qfzh01ldyJbeACX0jTymyPgcHVlhsC86LuG6c4DpPHJ7+
	dsI14FRpLEldjlrMlRimmQzuLO+hIZLtM4WKktKsKlc2anV9sSDkiqtZSfCnjN/Oepr1l3Q5PjG
	UesDd7419hLeCS/Wk6XRNdc4G9T7HbhaoGas11NROpa0Rva24cWMi2j/9Az9KK8VO0gPzD1COrA
	==
X-Gm-Gg: AYBFou16tKMzPKReYJLpbUiUnvZG8xo/aUjb8zjfXkMxcFiaWvETdrRsjBYuvmW1prE
	taGJ/bDbK3OHD5zid/wMzR/q743jLFwXSMF9v2BEzJavCoMLk0LV5WUaAjcIcyBxTTkafQbAbSC
	BEnJoGwCL52MqUsEJj3hSfuvGeB8SbGg9thi7lBHAdCQtQXXk1NPYZJSFaNMo+p6IgV8cA2/hz7
	j9B2MShhUoXOTRi28a+nCKGOnG+t3UJVU+F0LWyPOmdls/hdX2dpZcbYTTMtIt4F1nMTieRxjDD
	LE0O5Vsng9p42iE43GizYSLlRUyQgfJ182jqCTnqmtXgCiFAD8LHFN39cdYy8Tnwi2G0Tu5LODd
	Q/c47dBkjd8L5Ao54k74PY+1mRg/fUTKsrEYT1v7OJMsxcw7wqbwhtlsngW125DD6njUz+yGKgB
	zGunfiMkgbVYzE9rLokT8JAL8qRv5C5ft2332zMfePPBcPjL10S0MTJz5EF720OT9cvApeLQ==
X-Received: by 2002:a05:7022:281:20b0:15e:9126:c60f with SMTP id a92af1059eb24-1ade9e3e690mr12169711c88.29.1793594063830;
        Sun, 01 Nov 2026 20:34:23 -0800 (PST)
X-Received: by 2002:a05:7022:281:20b0:15e:9126:c60f with SMTP id a92af1059eb24-1ade9e3e690mr12169688c88.29.1793594063339;
        Sun, 01 Nov 2026 20:34:23 -0800 (PST)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm28014910c88.12.2026.11.01.20.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:34:22 -0800 (PST)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Ranbir Singh <ranbir.singh@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>
Subject: [RFC PATCH v7 4/6] riscv: Add Smsd (supervisor domain) hart extensions
Date: Mon,  2 Nov 2026 10:03:55 +0530
Message-ID: <20261102043400.287938-5-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
References: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: oVZlCzq6DAxV_OV5j08vUakSj_A3Pglt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfXz6ZNgrBrfWU1
 9glyDyNh6CTzmiObdhf3dHjlztWGuC74L01Eb4pOxSKw7CqBm4myABawYX6l+anEZFe8zJyzRaP
 Gk+GZRyyrxkNPXlFJIQ5GQ1yCzC5zmE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfXz8V64+aans10
 TG6nIRPgbcY27uNdQ6MykL2Xro5aB/6EYrSUHBdY3pzFelCYvcQdfeXHDL2UlpB3t7ag30FtyYs
 MvCnlw1bUIzwOdhydP6K8WedhoKUikNGfDsYzxKLM4E2RPY/4xzXMw/bN3sesAGwS4zpHm0XsUe
 KVD6UqghSRAvjWsYlDzX9QZ4swzvHyhL2T8f0UM7o/IS0YfpNRlYf8JAbkCeNqJhvIHm0NeM5Om
 079Lbrw50sTrvzgBv5CF00IQaMz4k0qLj4ERWcgm3YJvxHBc/hl01ZxciHtX57eK9x9hysNWAOM
 aqLKHepWqc2Q9FK1jga1+HcZIUQInbwtSXg/TjTSF77zUl+LyFNpsRant0CLtaMop483ivuQFpT
 SLmSyCgKhcc71LT3jq42//cZthEqQ2PaY5IN7u/L6QLzd8JXJuSvf38DB4OhRBeJtqXmSoiRqMd
 oPnTgL8hAuNlHAUrLrQ==
X-Proofpoint-GUID: oVZlCzq6DAxV_OV5j08vUakSj_A3Pglt
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae812d0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=W-_n0kkjAAAA:8 a=Di_9Og4mI3HmhrfaDXMA:9 a=Fk4IpSoW4aLDllm1B1p-:22
 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_203426_044860_E6DCA222 
X-CRM114-Status: GOOD (  11.47  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add hart extension identifiers for the RISC-V Smsd
(supervisor domain) extension.

Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 include/sbi/sbi_hart.h | 2 ++
 lib/sbi/sbi_hart.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index a020cf031b25..bd120a0db52e 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -97,6 +97,8 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_F,
 	/** Hart has D extension */
 	SBI_HART_EXT_D,
+	/** Hart has Smsd extension */
+	SBI_HART_EXT_SMSD,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 925cfe96e7e1..54191041a2a1 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -355,6 +355,7 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
 	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
 	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
+	__SBI_HART_EXT_DATA(smsd, SBI_HART_EXT_SMSD),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
