Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C7AC531D0
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AqcV+GtsDdFArQPTzOfeVXvpVEse6zKGQSj101kvZ2w=; b=a+WdOHjFgjiRP0
	Qkwq9dit/yrB9As3rBoVBweBJnw5nWu7ZtcAweJfCyIGuj89BJkdHfieZCD6b0p5Ni8jOpmxjyAx8
	V5VUpeUAiyTkL1AdD8oazSnaLNwb0/9FWD72uzZEY1SZTHlNhXndrPZrVhn3HmlADzmuL55cQ1GXv
	TEa6c0j7Qv2HB5wbo/KVOfju3kbsoZGAG3rYFhnRYsvCmXic0B51Rkp3HwNskRxh8SfYJI+if7Fxz
	NvMf2oN9a1yxwB72cNnVBm06giJJUToyyCXjIdgMtsxuFYZLmAFVTV/g0aFGAGDsOpGIoFK+ruDF3
	KW9cerynRsWBC0PBPZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoX-00000002ubb-0xBw;
	Mon, 27 Jul 2026 13:56:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoU-00000002uaW-1jIz
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 13:56:16 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlsK34035522
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iqsxKVBLO9gKjplmPEbqu0gpahA6UjNRgsS
	eADUFKTQ=; b=YQ5I3jcQsKPBd5mP1V3KGSUuJJUjduXS57CR5/GMz3m7JLB8vmg
	p+UhC9u8cILPWwmgnhgyGfPgj8mcetrE6p14TS+Udpt9AFUvNPjkNK36aPYgdEoa
	smgnthgSPaEtQJTvRgl9e5pM/1G1QfxhygXxabhI9/dXpcifmdOLogYxSLcjfAHq
	iGsSixsOjcnvuSd6QhxJ7y6EWfuiVDuZ7+0lEMmwo6RP0qr2jYov3JPbjLJxX75C
	tPRuJPWfG6DcC1iy/hgRkiKYSoxUOPKMuotuArFcKmpS1SNzYYhVfYkflzWRp/nR
	UZHLyLF/wYNuf4M/E1PcIn7x/BSE3B+nAUQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp30g1h41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:56:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso3044289a12.2
        for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160572; x=1785765372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iqsxKVBLO9gKjplmPEbqu0gpahA6UjNRgsSeADUFKTQ=;
        b=f7nVX6CIj5ZVJAYz2kQsmItpdcmPh2JNXFNTiX7SJe9tJqpsFr6Rg4dS2XZBDL5M3j
         LfZSiPLH3Gk2m+3PDjRnL+tJeC6sqNf4N+MJsfmOACDzCZAtt1UKOmcORI4ciQj4L/GP
         5eWx37Js+28uvaWzZmVthMkuZKhpUAsrRXcPSri5tpLUe9Io/m0rLDhZQLOAYSc1e67O
         R1XjLOf7I7UHYmqty/WW0uYTYcbYA93YU/JXqelP+5PUZwhCk+fmmtHnGbuz4IoDBJhb
         TXOJQHdgdrGJs0PDQYm2Z9LDltc5tNe6TJulfn6p84tsP20vc0yoPbsWjp8PgkBV7lHe
         IuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160572; x=1785765372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqsxKVBLO9gKjplmPEbqu0gpahA6UjNRgsSeADUFKTQ=;
        b=qgWoYTsDcjO8PzPA7lpVhHch+tYeT65992/6ND/Pk2gDXzqLb8CjJQr9MMhL47Pbsy
         SxOm80j9+vgA3j6hY5fmyqdi9k/KFK63jqRpO0ICFfJAyPnr2HlBW92bZ3C+D5V7W190
         cJcDj5vmoCKpktxqgnaMx2k6PBlwgFOAY/mVeJj4KLNde1F8lGcMI9KvhGu5vInd8rnc
         Dmvr8ZZyPbqXUkvtcS03xwQ1Qp0GdqsjTvw+aiiPELlyfWWZS1dMEr/bof9Nhy0eoEhn
         ajhHWVjPs/KyUUp+2mIS3ly0vxJSqB0XC0I9IrpBb15m96dRJ2dGzZysEFNc1yQWh9kd
         /zkg==
X-Gm-Message-State: AOJu0Yxz4NInyulVoN9WMJmTClbfx+Rv+yFDxC7xko5Dwt9y5MSxTR9w
	NqBspxGZljjfS9KkQkedShhcEmY0uLiEjQsodyYtu7eQaWSd9NwUI6+Tt9/1R+6sTLky9ZzEAGE
	dkzA1U5O2PPy7uU2pEuvlUToeMgTSmsC5sPelZo4cgtdHKfbGxIaRrDomaEki8f8vibMs7LOKcw
	==
X-Gm-Gg: AR+sD10Wj7RPUGBAbA1h/nIYpcbb7khiX+XAZth+JxxCaiVPS70q2zRe1VGCOyEI4MX
	DYcEiAvJwY7zbt12A2kigQWh1ahxx8gSI7vwqUQlzYhcC0DfMQJ6Vg/mgA7hkPItvWLUO77WYgn
	5K6VpyCgy8olEUGGLklVK12YZ3c4APXjdlucMWrfyBRdizMZCh86VpcND4uRCyBbhZFYoC1hW+D
	yTDzBy+YDZYIQRLTz+3mY0Ak4L2FpyOHbRQu52102gOO171o5lIW9Um9r6n7Ftfgn3Dg0mVxblC
	iOo+g7V2EGcxdGPsnC6rEoPu18Y21ol/sDTDUBFeEMiSUcs2snInRatKPvoNyggcLFyvM9yGXmj
	Ere4hDCsEf0DlJCXYGm14vuUd1ORC9f/f1CXXF+Icl6wEgZqF1YRHIx9GNM8Hqa7Dv1nBXCGbGa
	ajUcK9vxsA/Kdnd2Cs7u4I
X-Received: by 2002:a05:6a21:60c4:b0:3c4:320f:42f4 with SMTP id adf61e73a8af0-3c67df86a42mr8395442637.56.1785160571360;
        Mon, 27 Jul 2026 06:56:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:60c4:b0:3c4:320f:42f4 with SMTP id adf61e73a8af0-3c67df86a42mr8395384637.56.1785160570679;
        Mon, 27 Jul 2026 06:56:10 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm47067658eec.25.2026.07.27.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:56:10 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v2 0/5] Add Smsdid and Smmpt supervisor domain protection
Date: Mon, 27 Jul 2026 19:25:58 +0530
Message-ID: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a67637c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=GaQpPoNlAAAA:8
 a=SRrdq9N9AAAA:8 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=Cz5PWc4kS4G9UDt_qlEA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX2J3jLLgu/2Ot
 YeXxyDH12W36Dm30i600KDhh/UkdgqWdhhfmHbN/t2wGNL4dG4N3LdZowQDuVmZZbWA7Qz37lFH
 Kert1Y+zDSREJAFd61+BKqOZd3NMjcc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX9usWXuyx99/g
 5YNWKk6GWzDyXTezY5K7fJcjX+7FRStqri15PTztT2sOaWWI9sx71S48VzQ4h0Y4c/DquSdY31F
 iF4wRzskPPm10V4YqOL0De9zZiw1TrdZtOs4U+eia7KKvi6K+s8rtrQzhsUZq3oEAyPEeY/eEXo
 hJfIhzNFoxu0XWcNCz5oa9D1OhoLjbXiChp34KYdD4vAJYWHtbtGLJeBHihjyz5AXxOhoRfXJKe
 ygRj99k3JU7N3tXbNBy+fZ9RzsJhoj2TgmA15dnebvMsTGI9jtIwQuP31LaguWfWBl4HQtz3DY1
 WU9G6co6h7w8CIzBisI3Ke1t+tt8k1I14v5/ucRfLAAqsIdhuRlknkzCIBqBGZZbtGTUWOxmyyw
 T+uUZI4LqOiZr3IMUgxmjVmCZzUFkA/ylBPK8WixmP0YEqZQXPwiGrVqxrDTMkmJuoxO8a7sG+6
 w0dTN/V1cLQfIxVnQ+g==
X-Proofpoint-GUID: tInuSAQvY4LV8Rbz-xg11u-1yq7_RC-9
X-Proofpoint-ORIG-GUID: tInuSAQvY4LV8Rbz-xg11u-1yq7_RC-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_065614_569239_1B06A076 
X-CRM114-Status: GOOD (  15.79  )
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

This series adds OpenSBI support for the RISC-V SMMPT specification
sub-extensions - Smsdid (supervisor domain ID) and
Smmpt (supervisor domain memory protection).

Together these let M-mode firmware confine each supervisor domain to a
physical address space that is enforced in hardware, via a per domain
memory protection table (MPT) selected by the mmpt CSR.

Every supervisor domain gets its own MPT built from the memory regions
of its SBI domain. Per-region XWR permissions are derived from the
region's S/U access flags from SBI domain, so a region that does not have S/U
access is mapped as an deny instead of skipped.

The Root domain maps all physical memory, with the firmware region explicitly
denied to S-mode. Regions may be shared between domains, each side keeping
its own permissions.

Testing:
Booted Linux when Smmpt was active. The boot dump shows the expected per region
permissions. Also checked with a small self-test in Qemu which confirms the
firmware region denied and the kernel region permitted from S-mode.

The Qemu RISC-V Virt machine was used to test this. The new cli args
required to be passed to Qemu are -

./qemu-system-riscv64 -nographic -M virt -cpu rv64,x-smsdid=true,x-smmpt=true

Please note that extra some logs in OpenSBI and Qemu are added for testing
which will be removed later.

Boot Logs:

sbi_mpt: mode=Smmpt52    SDIDLEN=6 max_domains=64
root_size=0x1000 root_align=0x1000
fw 0x0000000080000000+0x19e000  pool=global heap
SDID  0 root=0x0000000080098000 regions=9 dom=root
S-Domain0 Region01          : 0x0000000080000000+0x80000           : xwr=0 (---)
S-Domain0 Region02          : 0x0000000080000000+0x200000          : xwr=0 (---)
S-Domain0 Region03          : 0x0000000000100000+0x1000            : xwr=3 (RW-)
S-Domain0 Region04          : 0x0000000010000000+0x1000            : xwr=3 (RW-)
S-Domain0 Region05          : 0x0000000002000000+0x10000           : xwr=0 (---)
S-Domain0 Region06          : 0x000000000c400000+0x200000          : xwr=3 (RW-)
S-Domain0 Region07          : 0x000000000c000000+0x400000          : xwr=3 (RW-)
S-Domain0 Region08          : 0x0000000080000000+0x19e000          : xwr=0 (---) [LOCKED]
S-Domain0 Default           : Rest of the address space            : xwr=7 (RWX)   [baseline, overlay by regions above]
Boot HART ID                : 0
Boot HART Domain            : root
Boot HART Priv Version      : v1.12
Boot HART Base ISA          : rv64imafdch
Boot HART ISA Extensions    : sstc,zicntr,zihpm,zicboz,zicbom,sdtrig,svadu,f,d,smsdid,smmpt
Boot HART PMP Count         : 16
Boot HART PMP Granularity   : 2 bits
Boot HART PMP Address Bits  : 54
Boot HART MHPM Info         : 16 (0x0007fff8)
Boot HART Debug Triggers    : 2 triggers
Boot HART MIDELEG           : 0x0000000000001666
Boot HART MEDELEG           : 0x0000000000f4b509

The corresponding Qemu Smmpt support from LIU Zhiwei
https://patchew.org/QEMU/20260723200325.24969-1-zhiwei._5Fliu@linux.alibaba.com/

This is part of collaboration work for RISC-V SMMTT development. More
details are here: 
https://lists.gnu.org/archive/html/qemu-riscv/2026-07/msg01018.html

These OpenSBI changes are also present in github -
https://github.com/pathakraul/opensbi/tree/rpathak_smmpt_v2

Further Development:
This series add base infrastructure for Smsdid and Smmpt. Development
and testing with more then one Supervisor Domain. Extensive testing with
all the modes and other platform configurations.

v1 -> v2:
	1. Rebase to latest master
	2. Change probe order between mode and sdidlen.
	3. Add sbi_mpt_query_access() function.
	4. Formatting changes.

Rahul Pathak (5):
  riscv: Add Smsdid and Smmpt hart extensions
  mpt: Add Smsdid and Smmpt supervisor domain core
  platform/generic: Initialise MPT at boot
  sbi: hsm: Activate MPT for domain on hart start/resume
  sbi: init: Print supervisor domains at boot

 include/sbi/sbi_hart.h      |   4 +
 include/sbi/sbi_mpt.h       | 334 ++++++++++++
 lib/sbi/objects.mk          |   2 +
 lib/sbi/sbi_hart.c          |   2 +
 lib/sbi/sbi_hsm.c           |   7 +
 lib/sbi/sbi_init.c          |   4 +
 lib/sbi/sbi_mpt.c           | 926 +++++++++++++++++++++++++++++++++
 lib/sbi/sbi_mpt_mode.c      | 997 ++++++++++++++++++++++++++++++++++++
 platform/generic/platform.c | 101 ++++
 9 files changed, 2377 insertions(+)
 create mode 100644 include/sbi/sbi_mpt.h
 create mode 100644 lib/sbi/sbi_mpt.c
 create mode 100644 lib/sbi/sbi_mpt_mode.c

-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
