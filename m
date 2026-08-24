Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94451C5DF9C
	for <opensbi@archiver.kernel.org>; Mon, 24 Aug 2026 02:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ui5RjWTUK5CMvRsBH41oE02T07EFzc71wdPZcqQwJwk=; b=YmpJGGz6DdXEly
	hjwMc1MRVBDJ8EWn2k6zRVsPleu04ZazUDXCaEAWluVSrup4FMQrtzqeVTRVv5uacsyQE9h1fJ54Q
	rlcR8+ZeNDHtMZP4UeId73kgYVNn8XbiIy+u1Gl4m9bFiQQxYyavBXwIK/R5dTyBKla14/OaG6Di0
	aCVhHq2BOR4Q18KV8yhn2l5iJLSimv1H6h0h8IIpTGG8VYdsirN99HKKHGLvePFVVBVz1Lso14Y53
	zugqF+Hw56TAfcpCgssjBORuJ1MeDmF86+qZ6/SbnHmQBrWkOonUeXYn7Ro8Qz9KkZyNuPe7OeBdc
	844IEkPbN9lwSXrI/G6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyK8c-0000000FkxG-1ZVM;
	Mon, 24 Aug 2026 02:10:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyK8a-0000000Fkwi-2cTP
	for opensbi@lists.infradead.org;
	Mon, 24 Aug 2026 02:10:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0lApX982804
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 02:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YfwoPexlS52
	rGZ9wcU+VHbQeAUjVL1bmhsl4MVGqwv0=; b=pVRqzg1t5jw4MkuHBuU8XM4SOjP
	TTC4/h+U4bIc4JJ3uqbskwcK9sv3XIYdgc/kvjvsxYnwWuJB+t2MDqgEGs6IeKrI
	h5tRn0NW5OtNN34lyqsQpswSrup2jvv4JBriFA+XJ9TvA8FrViVxZumWLwr2X79O
	z00fg/6SdbBTIhsDDBpgVIa5gBYDl2FVWwmnsbqunKc/Wd97CsC+H7kOoCg5mAfx
	Ok6CKJtFz0DsTp2ikYHFAu/2otdAkx0oxspoSF1NQOA/OcdhTgCUlzYv64Our20U
	WEXCAGO98+SZAZPpmB2vOhNEObzZ1M4l+8mHPocv3wf9Aam+IeP9V+3kffA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7456w2dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 02:10:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so4569306a91.3
        for <opensbi@lists.infradead.org>; Sun, 23 Aug 2026 19:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787537411; x=1788142211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfwoPexlS52rGZ9wcU+VHbQeAUjVL1bmhsl4MVGqwv0=;
        b=dITMfYspcnyQWkeg0eZsaMLcKDH97HB8VzM4E1GU7cKZ7JlVjo7WauUm9b48xZ7yPE
         Mi3qgTHrkR9d3aeWeGBNdtwhQ5+L7z6/khdg7Dn5H/9gZRoLaoIa9/rAxu7XTSYrcv6r
         ei5HNjcWYWelIwr9vQtP5ZsAMDDi1oXxZZVOI0TldHcIcavM17qfwXud37Ea0Vufkjgr
         /7Qt4l1PBfm52uKOylKgovwz47EEjhpgDAlw4J3pRJEmwFuRpynoh4qtOZ+4dDhBSGmf
         pi7ntxYuj9jcm0sK7JfFXZNmpHDoCnuHVRZGYY4ZCbuj64aYRiIq0c6V4RJVo3gQtys2
         V0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787537411; x=1788142211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfwoPexlS52rGZ9wcU+VHbQeAUjVL1bmhsl4MVGqwv0=;
        b=BNWI92AorHXCqoDqBZIJOhQ+4nDNmRets4y3ZY0AkTXVTRof9PUR/B5nqz5cAhZSks
         8AoRtLYEQbHfG3HqmWgk/MPFzGk6I4+qTogTk3wK44pEmGDEjyb3ZzxNeMHoRvETl8VF
         /pJejdRjat9i7AIwUFdRzSx1EMjuuWoQxwMUJaNibo8HQLSw8ziM5gBpfZOtwOHLUYyp
         HTPWS3sE+r47vK6xlph+i3Z/l5QUeE85c/Jb9BE9rvV9VChvPsCUHoJMonNVpv1pIlaU
         rT1UdWFRVsuOjZGKZj7kghegR36oLQFwDxW0xUmUdvmHMM6VSULjTkXfyzcdv/f3+8Y/
         cUYg==
X-Gm-Message-State: AFuF++muWrXBWKlD0C/Y8T4cyc1JPWINj+UPyrEkg9z+MCroGs78RK8a
	FzFwt1Y8cOJu1ZU13g4O7tUnSw6sNGOGWmSbDobacdgUsJNbm4A3x9OqaYEaXmT3D5MrHGmOpUc
	mbYbWukjF54WTW6chqS3KiarWnh+Eu4YsRrOd3AmTxt3ymYbyc8w+6O41r1K/vhWMjqo1PLUwig
	==
X-Gm-Gg: AR+sD12u0Y+6yUrXZ6rzv0wnabG0VPGr+fyIUAIpc0OsEoyxNrb5xbi4/1E0X8/fdxJ
	PmLK7TgisvdFLjI0E4PzoJmFKAmuaThsv893qCeCCJZgu5TSO6f5vVzjFrNyznN5XDkxWmK8KHF
	vGBN1wLM3+2cKqIlXQDTDxeNXlYuUvuHyblC2VPZs9zM6Lpdb7s/yTt0BEIUo+717pdyXEmk51x
	gFQgUtqDWm5WZv5Lfudp96mDFSxNG6tRWFsw4y2/Mk36UO7LcqAAMr921AAidGHvlYq5G2nTWKE
	R6Ou535NMchlcgLu7KrhXiOGNrNT7w7hVRa2Sn/AzPNl+iLEtT4V6k33+sMFmoTwFT8++bUSnEN
	T88QKE7BtV2Fdyp9w3ydCA+mKNJjRyMgRs3I5UToaeUgVuVMNYGskhkVhGXcK2JcXnyzufN8zQA
	cv36UZGTXVDEIiE7cKS1RT
X-Received: by 2002:a17:90b:58cf:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-395deec0e5amr28463579a91.6.1787537410667;
        Sun, 23 Aug 2026 19:10:10 -0700 (PDT)
X-Received: by 2002:a17:90b:58cf:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-395deec0e5amr28463472a91.6.1787537410193;
        Sun, 23 Aug 2026 19:10:10 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm20487634eec.27.2026.08.23.19.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 19:10:09 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm, rahul@summations.net,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>,
        Ranbir Singh <ranbir.singh@oss.qualcomm.com>
Subject: [RFC PATCH v4 2/4] riscv: Add Smsdid and Smmpt hart extensions
Date: Mon, 24 Aug 2026 07:39:50 +0530
Message-ID: <20260824020953.2438946-3-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824020953.2438946-1-rahul.pathak@oss.qualcomm.com>
References: <20260824020953.2438946-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAxNyBTYWx0ZWRfX6CzjS/1EO4oU
 S+pbWSpUh+CIM7tm2C9WY4xeXlhr+jpoFmHISde1bjxOxdGdLjclby+Udtv0hfookiY80AkGz1H
 Tqk9YcIa5liilTs+S3cyl4JY6sWAb1s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAxNyBTYWx0ZWRfXz8Gr+nnwUB6k
 lDiD1hTjraCOZUOT+7+QO0Zupx8qJOj4D5pXHBfQNW2SJB0q0Ud0lFFNIaRgC8nYNb3YPzAHyVZ
 Xye4TAc7lPEXt5qrl1R30zbjGHgAJC9CIrbWy/TLeCDCbJcu79mFDFTVbwR8u3Ulus6144dgywn
 AOMyLPCvs19xGmYGBySNwGQaVsHvxnDasnCQGDtzA8iszMIGXKCtBId865xYaxb0rFRpKziyZSq
 BgB+SigsldEgIavsIA56NA60Vj+zY9f4wyfTaVHh7Y7193Ni0FvxmoPdf8J/ge2eqBw89f2UvuY
 V3jgr+irkVgiQMCAQgCvtwQ6ePz/5hF7cICc24W3fYpDP3sc988PqJvzN8zrf3UVljQ3AC9BQMp
 OojJf+TPzcWX+bwfRPWQ0YXH9/BGlD8mrTyOiQ3zEedXUcIJlaBUbZosw0Nmn+o9PmcsRqU2hlj
 JbsO7BRiffa/+nxbzDQ==
X-Authority-Analysis: v=2.4 cv=RtL16imK c=1 sm=1 tr=0 ts=6a8ba803 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=F7PIS_qpXq7oc_onYicA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: XVO1hluMxAiKR1A-eiq2ICsYfAj1cTMe
X-Proofpoint-GUID: XVO1hluMxAiKR1A-eiq2ICsYfAj1cTMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_191012_787469_458AA049 
X-CRM114-Status: GOOD (  11.12  )
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

Add hart extension identifiers for the RISC-V Smsdid (supervisor
domain ID) and Smmpt (supervisor domain memory protection) extensions.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Ranbir Singh <ranbir.singh@oss.qualcomm.com>
---
 include/sbi/sbi_hart.h | 4 ++++
 lib/sbi/sbi_hart.c     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bb..cbad94d4 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -95,6 +95,10 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_F,
 	/** Hart has D extension */
 	SBI_HART_EXT_D,
+	/** Hart has SMMTT - SMSDID extension */
+	SBI_HART_EXT_SMSDID,
+	/** Hart has SMMTT - SMMPT extension */
+	SBI_HART_EXT_SMMPT,
 
 	/** Maximum index of Hart extension */
 	SBI_HART_EXT_MAX,
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..4261fea8 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -360,6 +360,8 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(v, SBI_HART_EXT_V),
 	__SBI_HART_EXT_DATA(f, SBI_HART_EXT_F),
 	__SBI_HART_EXT_DATA(d, SBI_HART_EXT_D),
+	__SBI_HART_EXT_DATA(smsdid, SBI_HART_EXT_SMSDID),
+	__SBI_HART_EXT_DATA(smmpt,  SBI_HART_EXT_SMMPT),
 };
 
 _Static_assert(SBI_HART_EXT_MAX == array_size(sbi_hart_ext),
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
