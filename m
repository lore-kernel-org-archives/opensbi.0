Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2080ACAC5B7
	for <opensbi@archiver.kernel.org>; Thu, 25 Sep 2025 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k+Z/38LK+9Ooy1viuo+VaG1oW/zoiNl0reIG2QbJXnw=; b=d7zst/9beMYeod
	zxGoh/fMF4ZWdHiJU1I5fK/Tiz9TwWeezAJl3wdcTwm0/Mx1CHZwPlEDVFGS7KHTLAmeBZcM3bOk/
	VHq0izHEXBSLX05NiY0yV9pQteka9lN5GgbF9xDcVExIyy+JWwftq+u8Xj/b4BC+DIWWncIdxpp7I
	jcLXSJ5skwBMXJ0ruQfuyWsrn+7v+92KD9O2xaZpMCKpOYxk+kxrSPWL7SNVYJtzOO/rrT6TTDyT4
	JkKFTbmSYnIHJ2Cz+EHVACkKdQugjeJtmHKy9qQZhlLga2blP6dqooOVZxekCiedBYtY1JDOTWikT
	WCQY/rNsTjXeipZNXWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iba-00000007nV3-3HWA;
	Thu, 25 Sep 2025 09:49:38 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ibU-00000007nEE-3FWO
	for opensbi@lists.infradead.org;
	Thu, 25 Sep 2025 09:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758793745;
	bh=NBXbhzHkt6U7W8WwW3hNYO3je2UgVMwj578eB5oY2ww=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=oD88wgMT3rs9MthiX4VwzoQy/MG0AV7t5bzBTOAcST+PIjoEdksLIEUJ3bF+DcNuB
	 3JjyU+S1RJXsTs86Qe6PVe4YHkq28WvUrH/0xpSWT9HQSaa4juMIls+0rSnKcSU3US
	 LzsuQXnXcipMSmu4UyAAYcnx9bvdiKqhf5wwTeKg=
X-QQ-mid: zesmtpgz4t1758793744t42c5ceed
X-QQ-Originating-IP: V2/888KxUDAQL43ivZV46m7yu/El2qFfXRW0yoX7g64=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 17:49:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 817111345767695483
EX-QQ-RecipientCnt: 3
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/3] platform: generic: spacemit: add K1
Date: Thu, 25 Sep 2025 17:48:54 +0800
Message-Id: <20250925-smt-k1-8-cores-v3-0-0885a8a70f8e@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAYQ1WgC/23M0QqCMBTG8VeJXXfEzba0q94juljbMQ+lk82GI
 b57UwiiujnwP/D9JhbQEwZ22EzMY6RArktRbDfMNLq7IpBNzUQuZF5xDqEd4MahBOM8BiirUhp
 Z7/J0WBr1HmsaV/B0Tt1QGJx/rn7ky/dNqW8qcuAgL3uFubJcWH28U/cYs9Brgy0NmXEtW8woP
 hwhfhyRHGtQo1R1oWz115nn+QWJo/L2/QAAAA==
X-Change-ID: 20250911-smt-k1-8-cores-8985c5f40c5f
To: opensbi@lists.infradead.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758793743; l=1849;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=adbZlBWFh5INtBCFGx+4PovvKLVSji5Mb+YFFp4gxMw=;
 b=fMRT3Wn3quvHGIkNUpC0IuZlCs1SbDVZ5ZnsMhTocnd2NGifDsrEp38shw2EIINjlB2BY6Ywe
 agkbsftpkdGCwTfQF2Rw4nn2wHhSbTg942CU9vo0WFAtkPDTDZu33Ff
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nl0CLVc4OOh2PDvWfKaGKxtvzRGcanzxS3HLzn0UzccpQGD0FFYpzsup
	R2YvXoYQLmveceiq0cVCmoZZj3bPS0cz6mHe0VwMXSMhB7URfJ3xZxqfRhRL8DJVUQ6zbQ0
	ElauiC8NQ0iLAzk1kJ/ryt/bwy44TsKC9H+Jnslj18ohMsV09P5Lf6+Vuuq9Sbzddp8PKhE
	J/gHhA9iizBG6iQN9afwF29fu/6U1BleYw/ULNka6w/k6rtw/ONS5SSITVYOjICBnq478C6
	ru/JZRpnrnfharJjUFNm5IXbiFVEWxfryNTXmBmyPf2kv3+23xaMQp63M/0umu1pZd/Ija6
	iTXr8RNBjKU5L58xNmm0olNUFdXi5fK0dqmF6XnKoqS0LvYaJ3YlOmJgNn9/x4JOcCGrt84
	HqgamvL5ClVsmR/zZIdvbPt1amm/yGMsJcJTO+G/qhTWZvTPN+5elQkLUTnGcYAg+koTNci
	oZnxKGa2/iW1bbDCiY9WPOGLNytUTE2m733QLey5kjDM5CSfctVnS9tCUy8wOA4RQObReai
	4YCryEgD60vqU0YGyabbDMZ0a5WSMM5Gh0zNuQ/uu29QVVCqeYjw2q0z2bDTvElhwVGIDmp
	HfcpsFWOY/Ih/KEsVjEdTQObZJJPPEpEoOjjblPK+apAjRp606bCM4K6UYoSeh/bwbcbwqt
	9GS4R+m7GU5mXGGPg47mz5ZCAh5JyL7zOGfeeLmOMMldD5ArMOUBOqT+gYXeWmsNmLJUGVV
	KL6slk5mGlRKvet2TgOlza9FvUZoEtFndPzPZVQqdr75mxKtEvymfn0TWMyRVE3Stu6D2pr
	7/ErRbaNH7itVXwavNTbSHdLWgalc9ekqq8hymJ2vNTARDbaeCG+2lusbKWtEeK+0vN97yF
	pXDCTJdTGhrko593Xfyf9MylfSktuMEveDc5hM4HcrBdZYjf0yhFQtsKWRI0/RaRRr5VVJA
	Xg2HmDSWyRKGyI/5Th1lcJUF6vmKWak3v+JxIIvpJvWCaPpw9XCDOAcPJ47j9kNfdftle+t
	uxXow/s4RHejTSZGbYnWL4MQ2dw6W58VFxVZEwbKJw1D0uyHrB3JpGmVdFWb85Hrfk2W6rY
	Nu3JU6QoJtSdVUmI9lq0sJ454V2aQS6dNmwrXR5qKzDfAOAZvqUDxi/rYRwKleVGTCC2Ut/
	JdQ4
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_024933_849664_3B7F1667 
X-CRM114-Status: UNSURE (   8.01  )
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

Extend generic platform to support SpacemiT K1.

On K1, the BROM only brings up the primary core and leaves the
other cores in a disabled state. This prevents Linux from booting
SMP and only one core is available.

This series enables CPU hotplug operations on the SpacemiT K1,
allowing Linux to run across all 8 cores.

Co-authored-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
---
Changes in v3:
- split out the HSM driver
- updated commit message
- use sbi_scratch_thishart_ptr() instead of sbi_hartid_to_scratch()
- Link to v2: https://lore.kernel.org/r/20250922-smt-k1-8-cores-v2-1-dceae56f36d9@linux.spacemit.com

Changes in v2:
- remove __sbi_hsm_hart_get_state() in spacemit_cold_boot_allowed()
- plus PMU_AP_BASE in PMU_AP_CORE(0|4)_(WAKEUP|IDLE)_OFFSET
- Link to v1: https://lore.kernel.org/r/20250916-smt-k1-8-cores-v1-1-5b76e06d12da@linux.spacemit.com

---
Xianbin Zhu (3):
      platform: generic: spacemit: add K1
      platform: spacemit: Add HSM driver
      platform: generic: Add SpacemiT K1 platform support

 lib/utils/hsm/Kconfig                  |   4 +
 lib/utils/hsm/fdt_hsm_spacemit.c       | 140 +++++++++++++++++++++++++++++++++
 lib/utils/hsm/objects.mk               |   3 +
 platform/generic/Kconfig               |   5 ++
 platform/generic/configs/defconfig     |   5 +-
 platform/generic/include/spacemit/k1.h |  98 +++++++++++++++++++++++
 platform/generic/spacemit/k1.c         | 119 ++++++++++++++++++++++++++++
 7 files changed, 372 insertions(+), 2 deletions(-)
---
base-commit: 153cdeea5350837c1206a2d2b6189fd0ba06d1f2
change-id: 20250911-smt-k1-8-cores-8985c5f40c5f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
