Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C94FC5B572
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G5A5Cm1A7ej5b+a7b633SebH6fDvjxclCAjERVMFjsY=; b=l/XX98gYTWBkjF
	CXiqABxwVz16f1pH63nVkpM7bOVITWdqhOKtauPsmXvpcmm9JsspTYXGsH1tU6+pMOCEgsVgNSSSO
	q1sX1yf63polBA6kdckhBdJjOVSTDcQfv21TUVlM/78Rcs7cCn6JTZa9aV5y9xPFjvVAYfkUhjjgW
	clKB4Rtw6mc+CH9RIoiBEr/A9d+n5XnrpVIin7P0L6EepRXi58VHEAI0jvxwFg0qnpJDwXqCyZrVy
	PM92vgsLggiMTsqpPkJP4O7rKYEX21F8BJ0CaVmCAQrHQ+ev4s7l+lw2GwRH8HDhDyGzntWhtWN+4
	hw/WkCAY3gJ2Qp5HDpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzlq-00000006Sut-2gCF;
	Mon, 17 Aug 2026 16:01:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzlD-00000006SrZ-1rYc
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 16:01:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYiv82263531
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 16:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zF6BnodQQrIBmx3qfBOlt0DiOqpPPIgtUL9
	BhCyDVRA=; b=PUcZ/70Y6MiKdF986/sKSB5MfGxC+i09epDvuAT8oQk7/0HgdRQ
	D1BCXg8psIQNMvJcCnblIDWwlL5JN1ETngb6W4We2t5QCVtrc2TlamWKt9JXfPFs
	S4cbNru/kliW1UIVtOVeCBTZrw0m34UoO5KYh86tEp/N7CbGTewVmLMDn8kRP2q0
	/Gzk4CQ2V1ago0jmd0r8cJWgvVwmm123En2AG7hHj8hPwL0RPi9t/9rMWsaRM5tl
	VNyqwOYfbphJPy+LQ0sJ5nJFd76xMFgkS68qojVjsFanWLdgpPW8bQBgzXXMPmjb
	4vFuLDuFbqFuDz5CtvLrmdcnrl8nMqSLDKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7hr82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 16:00:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so4426289a91.2
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982425; x=1787587225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zF6BnodQQrIBmx3qfBOlt0DiOqpPPIgtUL9BhCyDVRA=;
        b=XBxb0nr3f+w1UwPNzxdFJcFP7v+RKU4TfKZADj6RkN3VrbGqiPZwXFDROGX1xgl1p9
         xpAg0ziu2GfD8/IuFXsP6s2LmCV0dbKjHfzSi4so1ELU3JZ5HnYiNdBsmJYzYmY5OB0J
         vCyRqC9NVMjzEiMJIR/R0B9rl4uk0vnY9oY5TlVMMiJY0RJgR7083lSPqhVzF0f5DgmR
         RKpSg5wnaqXHg/tSfkhzVaMzCvM6JpGdyX/qzf327zwfqBpX6qM/f0nvJtiOPkkD3hpX
         wCgJ1svEyV+P8nmqJv6URXWTVRndaWkNecUKLl6FXTOjPfjJTSPhMarI0OX+vSBrfh/S
         hV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982425; x=1787587225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zF6BnodQQrIBmx3qfBOlt0DiOqpPPIgtUL9BhCyDVRA=;
        b=l6VEC606cEIqaHmCk1p9xav1v+HcuhsALV/MocghsfoPwDj5OiIxOERkef/bg8PqsQ
         S4Gun6VQmgKJ0XxAVeoeUd/KHlTEgN/tnwDTL2/IqzpKXTbRzaedmCyLEXQ8bfn49mn/
         CCdYKNHVb8Bp1GHm7wQsX/LvvsHTmCk/ruIkPf6sCsDRRNDGr+3CnxtQO/yxZNjkFOFJ
         kb33zh4favPYlrfsVlvekRk38Ga4x3EBVxlV4vIhil0vqXxOurxAGa1S3NdvgbPuBluZ
         bXfZMuH0dIsahBYzfWHGxd08Y/sqardj6CXcpRiVZUQ5IQaixd0wucqoV0Va2dNBhbOJ
         h8dw==
X-Forwarded-Encrypted: i=1; AHgh+Rq95jxWycTIgN+nvYKbGceJIw1S/pbwECPZE+SAKI8dUuu58ED6J9yV29n4aX0yn9n0VCw4hP/G@lists.infradead.org
X-Gm-Message-State: AOJu0YxbzyQ5ZodHNnekimzjtcpLbT7ETu/V6vEFrZVG9tFze42scQde
	6S4bSwJHUEsDjmF5ahGueeCv2v62nEfa/y37ZZUDw/6rwS7Botx79KmT7cra+1RMkh2UALTKmFj
	UV0K5gUduaCrtEyRJCcui4amD7VsYMuESBl7/NznVHvPlYVRLHZ1uTLk0xns3UT1K6aeONCO8Rw
	==
X-Gm-Gg: AR+sD11eS5x1RvCxRD76zsjkFBaWHts8QMziCVcUtxa2nDKgyPvjtovZX1rJFCCaBkq
	WHyGjhhGcMj6z4nWhmt+88ynETzGVxjeqaZS/APK5dQA2diV2i0q6tRZGUeMKt6bG1sFYdneEEG
	WYu5/BEePI9Pd+2+TL5voPm8jGkWgqKH/O+BrNWvv5eU224IsfUmRhDEyJSQBImmiqyBUi9XBuC
	D6LJ+VthdMJ5Wuf/NHXUo5t+1Ndw/x/QvwM5FxyZDBgGmBh0UYaH8MmwVAmmYCe8yWfva+fV8NT
	eEw1ZP9DTUvy2T6u+6vXr+Lv7R7uoHQJYyxeCyb7OEIhT5OEXhES5NKtdXL/InKAsTfHfPE3xpw
	cAHdV7AN7NlwFX7efVtNDELyng2Dukj7BoxMIL7Uaur9u4grcRPvf0K9VeLyMT2o7+REIlAWntD
	UqAldKUSLgA50ZKgHnIfGp5dWagw==
X-Received: by 2002:a17:90b:39b0:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-3933b500d17mr25330480a91.0.1786982425171;
        Mon, 17 Aug 2026 09:00:25 -0700 (PDT)
X-Received: by 2002:a17:90b:39b0:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-3933b500d17mr25330403a91.0.1786982424518;
        Mon, 17 Aug 2026 09:00:24 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-39531cc6a3dsm5549033a91.0.2026.08.17.09.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:00:24 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        opensbi@lists.infradead.org
Subject: [RFC PATCH 0/1] RISC-V Sspesa: OpenSBI firmware support
Date: Mon, 17 Aug 2026 21:30:00 +0530
Message-ID: <20260817160006.3310109-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMiBTYWx0ZWRfX77P9U4FPLwk7
 kDse2cUYuzN8rwQcjU+hItJoQbcRBxwlLD+h4mV0xAt8JjMX7DBoZgSF3IHaCIf58CP8rPahJqZ
 XHQbXz66qmDHquCw8UQp+7QX8+BgO+U=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a833019 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=8ilw5EQWc8m46JC1U7oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: wlK9Nyh3iAOsMrmR36MZRBjqH2dP2rkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMiBTYWx0ZWRfX8jnLw0rmPoJo
 oE96bUTApWLgLYCvHhRmarfX/CDIJItSv04s01uoVIHd0KYwIc3SUmzYxDOAj/ngHaMMtKkojY7
 lyU8yegl+/EkVF9KWa+byeC8JJq3L+IgVFWrRAqr8TnrHrrmseYMzoRLUAL0qJLLIngcaABj8TJ
 4vHHbm4DV9PJRlzSiQFoF49uNzjzR4T66r79T8x8MRbnTr1wLpmYhgy2KYBB78A0urJtOyWO+tP
 DxW4iqBd9sy0Cayn1mK9QICW18Fiilo99lEGotqD1KKmYuOypjyFsY+P/CEo9ojlUQZlABP6Ine
 hfkY1CnmThnRNz2ADcl98vgB5xrG596edH4uVDt1jcdv9wPgMlYmGaP5v6F4R3fMXmmVmvx2rY8
 AqSBxbhHU0YOEMUmBxxakEfPI3S/xT32Xl+Wg5a/mdvAPJt5/q/X4A2wKF6mCLb1omcfQsV0bmd
 3S4wLG/3IlSNB1Szx9g==
X-Proofpoint-ORIG-GUID: wlK9Nyh3iAOsMrmR36MZRBjqH2dP2rkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_090027_491806_4DDCE322 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

This OpenSBI series enables firmware support for the Sspesa (Precise
Event Sample Attribution) extension.

Sspesa exposes the shpmspc and shpmsdata CSRs, and S-mode access to
these CSRs is gated by menvcfg.CDE. This patch detects the extension
and sets menvcfg.CDE so that Linux can read the sample CSRs.

Reproducing the full setup:

Sspesa support requires three projects: OpenSBI, Linux and QEMU. The
matching branches are:

  OpenSBI: https://github.com/mdchitale/opensbi/tree/riscv_sspesa_rfc_v1
  Linux:   https://github.com/mdchitale/linux/tree/riscv_sspesa_rfc_v1
  QEMU:    https://github.com/mdchitale/qemu/tree/riscv_sspesa_rfc_v1

To test Sspesa, build OpenSBI, Linux and QEMU from the branches above,
then boot Linux with:

  qemu-system-riscv64 -nographic -machine virt -smp 2 -m 2G \
    -cpu rv64,sscofpmf=on,sspesa=on \
    -bios /path/to/fw_dynamic.bin -kernel /path/to/Image \
    -drive file=/path/to/rootfs.img,id=hd0,format=raw,if=none \
    -device virtio-blk-device,drive=hd0 \
    -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"

With all three in place, a counter overflow (e.g. 'perf record -e
cycles -c 1000000 -- <workload>') is attributed using the
hardware-provided sample PC (shpmspc) and counter ID (shpmsdata)
instead of falling back to epc.

Mayuresh Chitale (1):
  lib/sbi: Enable menvcfg.CDE for Sspesa

 include/sbi/riscv_encoding.h | 4 ++++
 include/sbi/sbi_hart.h       | 2 ++
 lib/sbi/sbi_hart.c           | 7 ++++++-
 3 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
