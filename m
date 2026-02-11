Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B25E9E31B
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCOc6/i0T/7O+ws1d+SZ6Du210BgtfamhzxyE6oYoi0=; b=iQnhZeyfD2jYup
	6o7nHgrs6XCHQjplsmy5mokGA6cWG/oaB8bxBIoQ3+NkfdNJl4KWlii7gZsded+X2UCYJQIRtiO4I
	x5ztC5FGi904vyh2MiyD2cKdDaettVusqeuO0Th6KB1BGM6dU4Qiny05h2qoloQm+c/bxlqb66aJ9
	LsienEzE9X4YLhKu4ZoHPK3B5FQVxxwmH+aUJxOF9MWbzXn92CLDCyp5a0hMz9EJhKssv+Fvvlje9
	Q/B21YwgC1BUdHbKJZ07hbKmcOQagSYQKM1lR0jRXtMOsA+PC69qvhn1/cz2qvKMAHhNBVO8g3MOM
	xQcIM9keXRHPHp/mEDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBin-00000000kit-12BH;
	Wed, 11 Feb 2026 15:01:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqBij-00000000kiM-3AZl
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 15:01:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BAx8lt2396537
	for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 15:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hwx8Cgu0CSXPRYJ/y5C9O7SnfRD2Fv3OFcSxp+n/snU=; b=EZ6IXtoyfzZHYSfm
	DiVDLKpzLseG350HzuPDCyLDO4sgJIsnzNzgxbQT+HocGPJbzWzVTPD7KRIwDTxB
	+kx+5m//w6MKD39vYq/g9V9QCqm5NBENoshSCCnQ5CTGHkQfXJ7p7tQtQB5/8c2w
	vOqUWNmkwBTy1/vyVld5na3wONiOD48+cgbtSg8t4Z1z3AQ5+svhHrajhrb+ljgN
	vLYJWMjP6L/UURUpyQU9O0CUAUqzt+aR0InlMZf0nKDd4vZotjQ75j1l5VkzMCcc
	fzlDvnhDQYdp2pM87bf0Y0pY+QhPPCWmrWj+fK/Qozo8oz/+V77eQE5CABLh1ayR
	A4bGDA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c88wqkp7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 15:01:36 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124aa710af7so33807750c88.1
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 07:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770822095; x=1771426895; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hwx8Cgu0CSXPRYJ/y5C9O7SnfRD2Fv3OFcSxp+n/snU=;
        b=jQKN6pE55X1TPrwLU48C5+dpNEid4Kn46iTfkdUdeVnn3TGIMwu+cPCDVP/y9DD2du
         dpvV2pIviWRUZWjzOKL7kdeucCuXHvEW2UwVlUvbPcg/Vo/+bt4bO2JF9iY38Un6+6jX
         H7mse5gbPXdCGE9hxwPM+qWTIxuhZEBS/fU/s27z1ghrrQ8ieOSZLprgNahbp3LL7OHt
         xXUdWp6/OzZK3hyx83ggq40Bxd/h++dqMNsJOIWlMsQtOELYWmxBpzX8pZlGy9VJXJO7
         lTjA0xg8xXOs8E1Oxmz2m11UGyRovkmRuolO315EOuBfyX1seilXN2dNwflk58pOguOl
         DvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770822095; x=1771426895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hwx8Cgu0CSXPRYJ/y5C9O7SnfRD2Fv3OFcSxp+n/snU=;
        b=c1ycknRLaVV6U/oGHs6bzsyUse+zhzRKxBOEPO8gPmrDEoJpXky0GnVQfiwcSm5xSq
         yM3mZyRONTs51tTkr+u8J26jzjb7WajRRr4zbC1aT7tCt8QiTq7erXUtmYhyCkr2lk9n
         7vr2V7Q6oE0fMK09c2Bu6QHlZVfwcvH8w0aEB6XrwmbPGznG8W9M9ALGePLCOrkkgsdn
         osK8IxHUmZ7D3YkT2TGLEQGi/wtG7mcXJQ6OuhBKdVXQ0dW4IhHS++XpIzQjK69r1np5
         a0r0GlXAMC1DpLjm6PhVM+lFq1j4AbhkzVBzOoHx+m6eR4M4NDOBfiEnJMZj4/svP+Z0
         KXQA==
X-Gm-Message-State: AOJu0YxQKaX0tOZ3BdOBVJoJK3WL1HFhPHYbSuv2Lj2UJ6bFPxeOug/f
	T0JywlCQVZNYHcIJCpH9TKpkf7/aphENTFcaNaaE9zvvIeTeiRHeuR3aLw32UoGB12xOw0MIXpH
	0GLPMIdKEVu9R58hl1U6Nhcy2zP/E01wWeGFO5Wd0LRUljVwHEapyGlULDswM4KgStw==
X-Gm-Gg: AZuq6aKI4jQ9ysJQOK3qSvolv2pf2FVt2GaSYZvCr1uTSUBKMQOGew/FnQsUWRy6f2C
	Q9Zl9Sn/UnGzlb2iGcUqbsSh8xztmr8tZ5bVqdvpG84Nkpyd42oRfpU/XHM4AagjpGCdiabCxHH
	vY0A/EIQjl9adhPM4fFdPRMcxWQNDA5LOg4wtbUi1RQddI5HX5SQLqZ9cQd8WdOCYYVe9bIMzYk
	xkfAFI0vtMX4lmEtTLRbMj5xSMWIAHpd24NudLrYnKiy+2UA/NjPLBMi1O+r91IJnI6i7ghgryc
	2a6vCe2DZZk+OTFlne5LM753MovzmsEZD0veL716dYAsWj9CypoX33h7knWNAWyAsQUXM2ef5c5
	LtJxl++2s1dIKhR/wM/cFQJPtlCHnOzI=
X-Received: by 2002:a05:7022:b90:b0:11d:fc72:e17f with SMTP id a92af1059eb24-1272431f6camr3193019c88.18.1770822093362;
        Wed, 11 Feb 2026 07:01:33 -0800 (PST)
X-Received: by 2002:a05:7022:b90:b0:11d:fc72:e17f with SMTP id a92af1059eb24-1272431f6camr3192947c88.18.1770822090945;
        Wed, 11 Feb 2026 07:01:30 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a69cc93sm2071869c88.6.2026.02.11.07.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:01:30 -0800 (PST)
Date: Wed, 11 Feb 2026 09:01:28 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, dramforever@live.com,
        anup.patel@oss.qualcomm.com, anup@brainfault.org, cleger@rivosinc.com,
        samuel.holland@sifive.com
Subject: Re: [PATCH 6/7] lib: sbi: Rework load/store emulator instruction
 decoding
Message-ID: <h2wb43bzmxb45u6q6qdwa2nurdai7l2qarevrrwmutzgtsttdc@eyd2hyo66lqw>
References: <20260210094044.72591-1-ganboing@gmail.com>
 <20260210094044.72591-7-ganboing@gmail.com>
 <3joqam2xgawjrhjyao7q7ulni23x5b73lk7twirld2lpiw2xf6@slh6pvojkksv>
 <18716d93-ed49-4c30-80b3-0956306df776@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18716d93-ed49-4c30-80b3-0956306df776@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDExNiBTYWx0ZWRfXwRfPDPD4Ai2q
 zU5HtY4XSyOWuBdqw8Kk1E2xqpO48jOJyHpJVwKLSZARui1JSkkbp2cMQvwjokPkfsetZmu/O7P
 hLTr7OZ/kMuU3n6t23BrtaMF2vpwJwsAMzSqVhts4La5BXvTPWSYYAI2Dqofkmg1+tJr3G5fzlU
 l3t5X+kXj98elj4FE52BJvWNhErOJGEEU5VQIdeOLuulrfJyCNjRX6cSlEA31aczjpZ/o2OCgCa
 DJCoGCTwG8k3YO4CsTltdzdgUgznlfhGDmCmwhJfxawSD6hWniLcvs9WfhorVbDO9/nN+VnSOaX
 YdF3DcOBTtYZltxDzMnbigQCai0DIYrRc6ZV/0VRhOuUNNufwxPTlY74jZ+UzojKnzgaZXk81fM
 MM5v1rs8Qd+DnBRIPSisB44rYQMJcVeBR6zABOfjscWTTaQuyRANkriKxFLmEqYBUyz20e1sXCQ
 fp6dPZYFlFuo+n+ItqQ==
X-Proofpoint-GUID: I8xeeVytgb8Kcw4d7J4UzpP0YNQGNPh1
X-Authority-Analysis: v=2.4 cv=W7Q1lBWk c=1 sm=1 tr=0 ts=698c99d0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=8nJEP1OIZ-IA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=h0uksLzaAAAA:8
 a=p0WdMEafAAAA:8 a=SiDgj2bqGq6Xx-teCb0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: I8xeeVytgb8Kcw4d7J4UzpP0YNQGNPh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_070137_943307_8AFF0C3B 
X-CRM114-Status: GOOD (  36.54  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

On Wed, Feb 11, 2026 at 02:36:26AM -0800, Bo Gan wrote:
> Hi Andrew,
> =

> On 2/10/26 08:08, Andrew Jones wrote:
> > On Tue, Feb 10, 2026 at 01:40:43AM -0800, Bo Gan wrote:
> > ...
> > > Validation:
> > > The patch is validated to have fixed the issue with test cases running
> > > on a modified version of QEMU that exposes misaligned faults [1], and
> > > a further modified version that removes tinst transformation [2]. The
> > > S-mode OS is a local build of Debian Trixie 6.12 kernel that enables
> > > COMPAT (RV32), and the U-mode test application exercises all integer
> > > and floating-point load/store (RVIFD64/32+RVC64/32) instructions with
> > > all possible imm values. The patch is also tested on real HW (Sifive
> > > P550/ESWIN EIC7700), which only supports RV64. On P550, the same test
> > > was validated both in U mode and VU mode, where the host runs a 6.12
> > > ESWIN vendor kernel that has some ESWIN SoC device driver patches [3]
> > > applied, and the guest runs the exact same Debian Trixie 6.12 kernel
> > > mentioned above.
> > > =

> > > [1] https://github.com/ganboing/qemu/tree/ganboing-misalign
> > > [2] https://github.com/ganboing/qemu/tree/ganboing-misalign-no-tinst
> > > [3] https://github.com/sifiveinc/riscv-linux/tree/rel/kernel-6.12/hif=
ive-premier-p550
> > > =

> > =

> > Hi Bo,
> > =

> > It'd be nice if we could integrate emulation tests into a test suite th=
at
> > gets run frequently in order to catch regressions. We have already star=
ted
> > using the kvm-unit-tests[4] framework for SBI testing so adding emulati=
on
> =

> Good to know. I wasn't aware of this project. I'll definitely take a look
> and see if I can upstream the test cases there. I guess it can be utilized
> to test misaligned handler in both M mode OpenSBI and the KVM SBI layer,
> depending on whether host Linux/KVM enables misaligned exc delegation,
> correct?

Yes, and it can also be run directly on hardware without KVM (despite the
testsuites' name) when launching tests from an EFI-capable firmware.

> =

> > tests there would make sense. If special QEMU behavior is needed then we
> > should get cpu properties that enable those behaviors upstreamed so we =
can
> > turn them on when running the tests.
> =

> I think this is done by others for sure. I was actually inspired by this
> https://lore.kernel.org/all/20241211211933.198792-1-fkonrad@amd.com/
> series by Frederic to hack QEMU. Similar patches have been done by others
> such as Cl=E9ment mentioned in this series:
> https://lore.kernel.org/all/20250106154847.1100344-1-cleger@rivosinc.com/
> I'd like to hear from folks to understand if there're any roadblocks
> exposing the misaligned fault in QEMU (gated by a config flag), before
> attempting.

I'm in favor of it (QEMU is meant to be a test environment, after all - so
it seems logical to me to want to test multiple configurations), but let's
start a thread on qemu-devel to see what feedback we get.

> =

> Spoiler alert: Linux's misaligned handler seems to be affected by the
> same insn decoding issue where there's no checking of previous XLEN. I'm
> yet to check if Linux is affected by other issues in this patchset, too.
> Once this change is merged in OpenSBI, I'll also be looking into fixing
> Linux and adding my test cases into Linux/selftests as well.

Excellent!

Thanks,
drew

> =

> > =

> > [4] https://gitlab.com/kvm-unit-tests/kvm-unit-tests
> > =

> > Thanks,
> > drew
> =

> Bo

-- =

opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
