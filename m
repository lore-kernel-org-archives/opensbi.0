Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A728DEA8130
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yo473O4bHmsmgvDcHajKEv9FRaTccgJf09V4IhTpKIE=; b=xOTWEl3U/oX6ao
	63JhEsz+VbnaTJDHN18se1yfc6qRp76sJKjLUIEO3n7fddU64/cZJy8Sdn+vUKQNgN2VU3OmXUX0p
	2cQv4GD6OtLiagxzdjvRDg3uFzi+CUdJ5PAU0oMHZTHVmF/XfioXFk+OIf6n0QHVoHLPavktx6qW0
	0A3bOwGYbRnKvoHnSQv8qG3jehCLj+XBS6v9fj8GiuRX7zb2CrFTEDAIMbf9SDse+fmeM/+NHupYm
	63RSTEWsypZz1SX5Z6vAvpuEAGdE/UVCuqcmVk+NeIejBQ883GkLNWJQIoMpU6vAMVS8wcoM1tXO8
	urypJSd5bLm/MQaJ89jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqHs-0000000HBuS-3mgJ;
	Tue, 10 Feb 2026 16:08:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqHq-0000000HBu3-04m0
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 16:08:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AFJfBX2823169
	for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 16:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2sYkPV+XwWDqIt5jLfwEoKaA
	p7ktcE951pmDpwIwUvI=; b=jsZ8vA6UqIVf1L1c0R1+Dza0r4g/eWr3WhX+Vdk/
	3z5Yg6/8rTnvrJCAC43qtnCAB2Ab8CM9JRidUqEJ+oSR2/zvYgvSyIlDPDzfCQV9
	H3eGXGwDcce9uRrEmhhHuNOduc6D7WUAbGTspGmX3CDkQN0PJS5s92v9AK9t8VDj
	1O54Pkiuew+hN7wXwEyOMYvLGHBYKzktl7cfzHdo/r/1P9dUAIEaZSvmhVhIzOpE
	OoKCvFQyHUDZzbUQo/kxQEbBkiu/lqnwCq0A//e9We9YJ+P9HVX2SjWw0NzCEcN5
	4VnQSmEYI4Ph87a9fyHjcjp/oiPK/+p0V84NlhpWZfUKZA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c877hg62q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 16:08:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124a95d580cso41199862c88.1
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 08:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770739704; x=1771344504; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sYkPV+XwWDqIt5jLfwEoKaAp7ktcE951pmDpwIwUvI=;
        b=PEW2vm92LQ2oK/SrEvZBXo32+iPbJMCpSqkd9/0WdAPiYAA2aYfcxqaTOzNolv3nc8
         1RnI+RvqIePgON4/LgBj/2Xwn1K4FXhmAcAjXGXnU1V+7YFwJV1w4nLS/iBLUzU/HELo
         NqdtZhKgozHHlegmEMRZZb9xKEHx4nsNpVks2zYV4ec3qLY1FW0daoEOOenjD0MLKSl2
         6cbyc9s5nl2s1VlNsVr3nJ7mi/IydmBjGlS87Z6eSM5Ko8LsyeTZ8jmje3fvoPh+yB/p
         kAbEYtqmwVRxudDj1aOjGsNTrm7lsR/EFc7lxMKDJrm3GbbzTvuRxrMvv3VgHY0J7LMg
         4c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770739704; x=1771344504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sYkPV+XwWDqIt5jLfwEoKaAp7ktcE951pmDpwIwUvI=;
        b=KJUPVuQOrggnrFUx3ujqzj3QF2GFQnpjHm6SboAjbS9OpME60kFg7XPi6KowtllmZj
         ARirzdf/htcsfnN2Qn3GAFO8u1QZl7MbD7mer+wesSP7Clf97z4bx5uxocweC0sIubdN
         3XE7QSWTCtbcWG15Y3ROJeg284U7GE3T6S61B+ol9Us75H7qK6AMf3DsBIJMgERSSmj5
         CNiC25N1QbLmO85pR9xajOZXxiPM9oW1ssCqDZ9p0xMiitV35IoK2dGj8Nb+nAeyxRpy
         XsPRMziuAU/e5KYDvsRdXlXjw4cxda4f5nDGXL8DMa9aVHWcsth/tpg4pF0mKu+8Crug
         zNXA==
X-Gm-Message-State: AOJu0YwmBY5OuIAn3t/BynJEgGjy81VKwnOejH79L7hNQm2Iq4VDIrSn
	SGo1fOMHWfM6182QSveLTa1th0GjiEvrzyB5OaUyQHzDicfGghDTi6xF84MTumpIlGLulhhQHdN
	u4shSq7/3nR4femZEYasEpKNjJNCHqKGRm4Q3VVmEmcp6X7OfxJSU+m6H6BKlpSAQRQ==
X-Gm-Gg: AZuq6aJVDNmceazC6DkakP9TyGbOoX0Cqw0WV7kJYl7Eri3ddPmZ97siR67g9GQBqCp
	HBcFm+nHDNXIBHeFKb82fivPOr2SEgKwhArhaQwaGEDVNJLgNcf1zoWNyy9K6JFlmiobS26w52z
	GTJ3IQ0WmONRFDxF1P14C2dsW0a3NZghDX5oC8uWIqtJxy7cxuC0M7Dswi1sxD9qCiXEjnem+g8
	BL0ymvl8IG8LQV9oaFx499eGMCLx4CoDexX1/YuuAB7ubTIF3pZ1n2Vp/xjEElAQEBzzE2e9StG
	SwK/hFedw2nsQ3WuCw5CUpKVaz9r2yDiqrRNXCkac3ZbXCjfei5OXyHMpcop1f+ZJ/ebRY558Bx
	cEoojDAOLQkurU/u/UeYS9I9qeadj2Cw=
X-Received: by 2002:a05:7022:2523:b0:11a:29e5:12e5 with SMTP id a92af1059eb24-12704169ba5mr6604591c88.30.1770739703327;
        Tue, 10 Feb 2026 08:08:23 -0800 (PST)
X-Received: by 2002:a05:7022:2523:b0:11a:29e5:12e5 with SMTP id a92af1059eb24-12704169ba5mr6604575c88.30.1770739702606;
        Tue, 10 Feb 2026 08:08:22 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270d8e25f1sm9522116c88.9.2026.02.10.08.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:08:21 -0800 (PST)
Date: Tue, 10 Feb 2026 10:08:19 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, dramforever@live.com,
        anup.patel@oss.qualcomm.com, anup@brainfault.org, cleger@rivosinc.com,
        samuel.holland@sifive.com
Subject: Re: [PATCH 6/7] lib: sbi: Rework load/store emulator instruction
 decoding
Message-ID: <3joqam2xgawjrhjyao7q7ulni23x5b73lk7twirld2lpiw2xf6@slh6pvojkksv>
References: <20260210094044.72591-1-ganboing@gmail.com>
 <20260210094044.72591-7-ganboing@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260210094044.72591-7-ganboing@gmail.com>
X-Authority-Analysis: v=2.4 cv=N+8k1m9B c=1 sm=1 tr=0 ts=698b57f8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=g_eKs5NeoakQXFeYeBcA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: tlMH4lVsw6hG1I5T8c6SV4BDw1eAjcWx
X-Proofpoint-GUID: tlMH4lVsw6hG1I5T8c6SV4BDw1eAjcWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEzNCBTYWx0ZWRfX1d3ym++/IwtJ
 PVXR3mug6rrnjWrY/RUupWZXXdJfWLnmSvWRDljJ3M8A6RnFH/hwzYiZnkpzd+5UQ1xAbiZMlOg
 LKd6Th/ZTSrwQVSw+pbyMo7XrT6MwVRcO9+R4rMZWZ8Vipev/WQkVi0itcmasFQgRK03y4WMpO+
 6uRe5jEEqBpFkZONSGd8/uLgPrtb7T5NgCXpsXHB2qmCaFXb6GukdVTrsMRy+/5CjLogjUjpqWH
 xky+oDtwUhfFJGnDfx4WFiGwSavFj7Ej7TywVcKymwEqXVJ+bk4v9vmRx1UZvw2NwYcgUVBSZlD
 oj+uR3gOAJyo90HRSB5BZAJfyH/971AMChWfXAXVOvEYWGi6se+F5kUK66bYMfCdJMgqUR8qVG/
 AfWgPRgBZOPY0ZihIZTop+hIKncslBHaYC0k7sB0b7bjAM/+2ZDz2aOyYtVVLDO3tVrJxJSMuAD
 /KkZCvugkUwdijKbs/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_080826_175689_ABB34642 
X-CRM114-Status: GOOD (  18.93  )
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

On Tue, Feb 10, 2026 at 01:40:43AM -0800, Bo Gan wrote:
...
> Validation:
> The patch is validated to have fixed the issue with test cases running
> on a modified version of QEMU that exposes misaligned faults [1], and
> a further modified version that removes tinst transformation [2]. The
> S-mode OS is a local build of Debian Trixie 6.12 kernel that enables
> COMPAT (RV32), and the U-mode test application exercises all integer
> and floating-point load/store (RVIFD64/32+RVC64/32) instructions with
> all possible imm values. The patch is also tested on real HW (Sifive
> P550/ESWIN EIC7700), which only supports RV64. On P550, the same test
> was validated both in U mode and VU mode, where the host runs a 6.12
> ESWIN vendor kernel that has some ESWIN SoC device driver patches [3]
> applied, and the guest runs the exact same Debian Trixie 6.12 kernel
> mentioned above.
> 
> [1] https://github.com/ganboing/qemu/tree/ganboing-misalign
> [2] https://github.com/ganboing/qemu/tree/ganboing-misalign-no-tinst
> [3] https://github.com/sifiveinc/riscv-linux/tree/rel/kernel-6.12/hifive-premier-p550
>

Hi Bo,

It'd be nice if we could integrate emulation tests into a test suite that
gets run frequently in order to catch regressions. We have already started
using the kvm-unit-tests[4] framework for SBI testing so adding emulation
tests there would make sense. If special QEMU behavior is needed then we
should get cpu properties that enable those behaviors upstreamed so we can
turn them on when running the tests.

[4] https://gitlab.com/kvm-unit-tests/kvm-unit-tests

Thanks,
drew

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
