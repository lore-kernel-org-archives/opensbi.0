Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CFB606A31D
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SblG7XyR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=USjgV8/e;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8UW/txE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LIqDDhmcbZm0eHMdN1KJy7x2x3EhBJ5y0otfE3tLitA=; b=SblG7XyRtlaAZJcLSab1JZwXGB
	Ek0Olgyh3jHycHsWl1o14umqNpXfvUm3dxllKy5WLg+oL8K6LjFFwPl9y97Y/0KW5B/kWsG7XU1+n
	EDdiKEK9/wld2lKWiXzQpqeTIyRCtmilc6HTMTxUJ4QgNLQfinddnPW75eY8ZSoaBDCpeJs9G+QmS
	O4vUDIMXFPBQ8/8WmLAeEv1o1yX7kOqqv2Mf11BPtGbDThAkUeNI1jr8CsLVGI7qkhrFFDdLSk0W6
	1WjXJAankIFRtD8T37PI1Hzii60Hx4XeE5GkN9jUy1UIEuDwLCiJwZ+mreEZ/aiCsCJ1dFK8fKNeG
	86VzFpAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKvAT-00000000x6K-2J01;
	Sun, 25 Oct 2026 10:09:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKvAR-00000000x5z-1COY
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 10:09:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4t05V3027423
	for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 10:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vSQIWQuKELwbBbKmtrC8QYhJYXnd7sv92fX
	adI/XQHc=; b=USjgV8/ekxYWyrZon58+B18/0FaC1Z9b5NXZczIjQ1vLK5qbuuk
	mAuzELR43upTnu1jBhqhcfuFFHkLI0mUnvhwMj1ptleNcBKbsajtdXwbHHxNh48h
	JYnMAA//sxWKyDjG8u2OpIDLmP+2WeyS6qKILjYcWkgwCJukhJxxx9kD2eZhns0L
	YyHe1z/n5RVqTP/BKXGJK/UwwrxehAulQI5oN1qL641WK4sYJUhkE0US1kklleBr
	o9IogXHEsuQQYzoBaM9ou0B/72EefuKXEVjRcxTde1qbh940FxZQX3nZJAMV3K/J
	k6D95hbe/tJ2JGqlUCJFiQl3v1CYAunSRfw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnehjs1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 10:09:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3692c5b061bso8086210eec.1
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 03:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792922970; x=1793527770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vSQIWQuKELwbBbKmtrC8QYhJYXnd7sv92fXadI/XQHc=;
        b=P8UW/txEcAnbCHcrv+LhCGcIboOWaD4a6N9Dw0wjDI532lEYRR1v1cFkLzihyZJiEr
         4m6kL91G/T0AZI2w7ABOZZ7kWgQiKK1qBn1wNtVgNuaxBQJt+ZhL7CIhuJnt2PnoQEHk
         ESNxwuAiKOyBfpUf0VgbZfELAt8hGD119dKcU5d0GcXJG5mborv/UDByfHtTcXgedbnI
         e3Tv952lBQNFuXUYajWmgrj9bf+sikEnreheVQN0Bex4gYRHWmHFQXQtVdLU0GB/1Z8s
         f2Jzy2SUJkkRQeYacEb8kldMwHjKW2DXQ4NEzuXi2CifsP5b/Lol+IM/gPX0PYwsxE0S
         bOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792922970; x=1793527770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSQIWQuKELwbBbKmtrC8QYhJYXnd7sv92fXadI/XQHc=;
        b=A+1CkInZ5N949UdMCXOuIn7jTkZ4nyA5A51AL8EmGUrGrvXbRhRSCoXazS9BguFmH/
         ORG2sUX5bFDbbfiJtfuzsu6Wj4bekNVUpBestaZdL+JMiOIAn4loQ2EDuRUeIV3FxjPR
         vKY7X2kI2yLmrmxAw8OwsiE8ILbmekvHgd8/RS5zhZZQD19n0NisXDAVY1+camIJKT18
         0fCp0tlb+2GYOqMiRAn5zscl0WkTqlCx9qA28n1o8d8fcLEQN5jJ/iqByhynYOaW5Umk
         lcITp1t5eUDck1NTzaqnUym31lEgJlhikUedbfkwyTibaKEYu192LG1NpeF2Ffgen7Z7
         98qg==
X-Gm-Message-State: AFq9FYK45x9+JO3V9wgzLYoHeGi7BP4EnIkoZFVhlS+RDbJHnDCnt8Ps
	21JBnuN5EHh+ao489NVeDR2T8viFVpKhx86Y8oUcag408s6mQRR3oxgmcU2oZSSzKoUtY5kVYNl
	K3WDGgriW3z+Ww8dyJrxIpwdQf+x/sbOEbKYl9TSUxwstwx/MfKAwBdBbo6iJ/+IZ0jnNWwuR3Q
	==
X-Gm-Gg: AYBFou0lWs+5JccWD02kZPJOmeMxT2Hg7rttM4hyl6gzjxAvgvNDkYC2tUrHSPZwv/O
	cxKplrg/h80FHF7lj3Rb/nrp/Edh3YmAiGmAl4F/5QntHGUMDGlxZUt7m3TpzPlS4sqwLG9uaXZ
	vJOi+6jVlF2awcZHuSCroxh0aief2UrN8IWvj6a4457DWKP0nmzbye+7urg/Nvf2P6APoMUaVZQ
	QmNL//XOKQ+3ILTgN/bmczQQia4FG2S7FrduIFSWKMDK6QzgAq02ckNe8EbUSTalAD2+42lgqJ3
	k8BbwTH+RES190hHmebZW95D+xUpgNdktmDtk2moWeRRKMjSWGnh93e4Q9Gg5cc7toQ72ovp13D
	exCIgbfVbg3xhY+WhPRo3H+YaqiC3kO2DgregQgy3rIpnIr7wYupbQucuFwW5CBg8gaRnehA6Zv
	rytRN491FogfiReFgifUg=
X-Received: by 2002:a05:7300:2301:b0:347:8d01:164f with SMTP id 5a478bee46e88-369e84b15ccmr9347714eec.19.1792922969701;
        Sun, 25 Oct 2026 03:09:29 -0700 (PDT)
X-Received: by 2002:a05:7300:2301:b0:347:8d01:164f with SMTP id 5a478bee46e88-369e84b15ccmr9347671eec.19.1792922969187;
        Sun, 25 Oct 2026 03:09:29 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d578casm17017170eec.6.2026.10.25.03.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 03:09:28 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [PATCH] lib: utils/mailbox: Allow service group version lower than RPMI spec version
Date: Sun, 25 Oct 2026 15:39:23 +0530
Message-ID: <20261025100923.4011235-1-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDA0MCBTYWx0ZWRfX2zvi4TXfbRzB
 16ItOrd4XkWFmO5TGBeBOd7+VIHWEbqkHBkAhQjI/AooVpZIcgBn8VF8n40vue/Xcb62mPoWWZf
 3w3jRr+AylxRm52lskb+2PlpdgHpKv4=
X-Proofpoint-ORIG-GUID: TDnT0AeRYlDMksy0y8Kyn7BxlEVAgsj-
X-Authority-Analysis: v=2.4 cv=d5tgWhjE c=1 sm=1 tr=0 ts=6addd55a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=bp1g5Iz1D7c7guLF1_8A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA0MCBTYWx0ZWRfXwfylSPRkHAfN
 knUJWV7atYswLfUmtrsrv4GdttpfWaC3QDHqPgqKy7BKzl4vWg0eyu0+qSkGy3+ESCpjbHWM6Id
 dxYpRUMaqYL8bBLAQtJ57WdXX64FMZ/GQLF9O5WGh3c6/7O4mYVmyTS3o2Yl6JwOKVbSIP/K3rs
 4JEpAgmwXwZjuYvRGMWjtODDIGAkZLIU90Y0JndLlT9lk59ROo5SDVXjCqlnFYZ6PEtQQctgZCL
 lBboplFteM7gQ93ufGu/SqIGP7MWz5XF0jMD02B02O1dk+rX0/gbLgPkGEN1M65cgrfvG9mg4c3
 /dpcAW6CWRQ1ZzhlCqZb4tA5SezUne/bNaPvYmPwuz1SK3NQFsiHaxqvjicVqhZhnEAY9MMsnzk
 BqwgizXBSMmQ8C0iBgIFOtErVG2cxtWWTQjH2YLL8mEAt+8e7niTP1A6mH+kIGQJTstc2MibWGP
 OE0aa9Yeq5jFsRUnEOw==
X-Proofpoint-GUID: TDnT0AeRYlDMksy0y8Kyn7BxlEVAgsj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_030931_358182_473FCA68 
X-CRM114-Status: GOOD (  15.28  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RPMI specfication defines the version of the
service group as the specification version that
service group complies with.

Its possible that group version may not changed
but spec version has due to other changes.

Allow RPMI mailbox driver to check for every service
group version including base to not be greater than
the reported RPMI spec version.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
index 21330c4b..7eded2fd 100644
--- a/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
+++ b/lib/utils/mailbox/fdt_mailbox_rpmi_shmem.c
@@ -562,8 +562,14 @@ static struct mbox_chan *rpmi_shmem_mbox_request_chan(
 		ret = smq_base_get_two_u32(mctl,
 					   RPMI_BASE_SRV_PROBE_SERVICE_GROUP,
 					   chan_args, tval);
-		if (ret || !tval[1])
+		/*
+		 * The service group version must not be greater than the
+		 * RPMI specification version implemented by the platform
+		 * microcontroller.
+		 */
+		if (ret || !tval[1] || tval[1] > mctl->spec_version)
 			return NULL;
+
 	}
 
 	srvgrp_chan = sbi_zalloc(sizeof(*srvgrp_chan));
@@ -773,8 +779,14 @@ static int rpmi_shmem_mbox_init(const void *fdt, int nodeoff,
 	if (ret)
 		goto fail_free_chan;
 	mctl->spec_version = tval[1];
+
+	/*
+	 * Spec version must not be lower than the Base service group
+	 * version. Spec allows the group version lower then the spec
+	 * version which is implemented by the platform microcontroller.
+	 */
 	if (mctl->spec_version < RPMI_BASE_VERSION_MIN ||
-	    mctl->spec_version != base_srvgrp->servicegroup_version) {
+	    base_srvgrp->servicegroup_version > mctl->spec_version) {
 		ret = SBI_EINVAL;
 		goto fail_free_chan;
 	}
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
