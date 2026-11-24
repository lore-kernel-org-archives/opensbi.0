Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F30606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 04:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j0h6WcaT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=cyL70CjK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dquw92mC2wF1j2peOgO+tmmCYKfBwMZ9nDvLPItl1uI=; b=j0h6WcaTu5OQi90QiaP4sjCgQa
	4MfRLCAmyo1iCjb1xoj/PSyALgHkxlQt4Kzxn0LStM7s9V4J+ArU/cQE/kXH+z0RAcbvnoOeGJ3eZ
	wkaKFz2WZtIUGNDOtF9ImRAQ/KfjX5GdHY4BHOAm+rJsRZo+ukhPWF5zWCE0t+W/g7cMpV/XvLBWR
	oXY2aG3GWDCJnAqvzAmcotbb25yMWhWY46/V6oDWIhrKB3jKMzCWTwdnWwPbpp7zMCrOrW1H/GrhY
	AKjEwQCCDaxi41x5ILm0Z21KnHDM13E8EP8hBWyGTrgCigjFTyQWHDv1nUQbduZ0yAF/5dL3iP3Qa
	hbbnuE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxo-00000005Vi1-1NYX;
	Tue, 24 Nov 2026 04:17:04 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxl-00000005Vg6-2zJ7
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 04:17:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2f0918f9e6cso6989545ad.1
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 20:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795493821; x=1796098621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyV/duzPS9i33gA/zPVb57zlj1TQ6ECV04ZVFyEmA78=;
        b=cyL70CjKMoqkvzucT3qcACARNQIrGkdaqGLw2anK8O2D5te8Lbt1U/upmVd/uJLi2F
         of0BAFOoNsMi88VUWQP+hsBR/LlTZKky6GxL3SzgWuPvflzCz26QeGMvIGsS7twbM4BE
         n5AEy+iuaYKQD6WuRwjFdCzehrHaPaVO14rDRxNm7SGk7GvghpNkq+GREbYAqFPmb8rP
         Lt3NgoBBxkJvzGTVy9DfxMKhk4Clv6khxIhOjcMkvls8XGIwFkzy4AfTrvxsD9rPKCgg
         LkbsLEkXUTt6LT0EoW4y/y2kZNMQoQso/Hb+Sx5fgzzRXCKcvEL1EenApn8O9ZglERqL
         avDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795493821; x=1796098621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RyV/duzPS9i33gA/zPVb57zlj1TQ6ECV04ZVFyEmA78=;
        b=Cj99zvfNcn045OPyOKVGtVkIKDt23mLLIa5gf/qKhl2AKiqcT7rzwoaupgMvv5ub12
         9AoOUJtqomNyxTwzBltB0lofPRHNhYr7nH/pV5a5oBdL+AsqxsJ7DGXZxoXRjxYlmCg7
         6vV1ME4XHl3ptYFqdJfSxdbIixgE+l2MDzMTst8nHw9ywE2+T82lILMOKeVB87OifVnP
         ufiGE3YlSMJNpWH+xChy2Mwhzuh32YugAkb9oQ5zIHit27oH9BusQ9kitPKfE3eItpJD
         t3FFg3A07HvUSWHPWhYfV+LG9OiQ6jv2HHcZ8unuHyiVzRRxsAMfJi+59Zilb4vZOtuL
         6ETQ==
X-Gm-Message-State: APuU4Z+MUvTmvTqW9UhaIFlRBZLV7m6hXKR+18H8I+GEckBd1id8QkKz
	+TS01MTU375XiHLHHWL2exTCvsxqRSJPMxTZ2706IQnl122RpeH17Mf6h9JWyzdsCXXcJieNLJ1
	Zsqe6rtkASZ7bkzFh6rFF0KmME0y9H37Im16L0TKBknl5KDRP276JQOw11TpOaxGzYHtnXplJDR
	gulSkdX5pE4ymzBrakwqiLDez+Z+qGjAjBzzso1nODGRnNBFMpy5g=
X-Gm-Gg: AZFdTZezsPN5kNNAntLkMxAt1Gg9J3FLduIDJKjM4blm6jmGS2bgwSvhgKO8v9Qpjtp
	aEEZm7zPNZCunmSHE7flt37WUduP/qXs/gl6/rzFCczn0KdnmBbEGrxUVPbED+urBfSBbX5X19o
	TeRJM1q3hHhYv6gIYfYC/27NeLEb9pUcHR+QehbY8lVnreecBC0Ya9mcyQm0baQQagkJEPoUfc2
	DcbMkecNe/u50O26An/dTQy1JII5lvtoyhdDWE5wtA/9L0odOTXx+8HZj6fyOQOH3pP34Y3aZiM
	7inoygKTBRPk1wqGrncdcfpFlewVIIVh7ZyqZneOi1KW3HF8QwEh8YkYyOLSUx4MPU+xK+cDQp2
	vNFDVsoCN3fS+oBg0u1EYEQ+kj17kq26mjdEeZj8IXIYEa3x9C5YNmWDP6VfbSHt4J1i8k4cAIh
	OjQeAmmaCrJZjPQMRZojXv91FmmCTPcU6OLswGOzyJ8EKgqg6DjBxfvBAbfIKnQ9FjE8az9WVvY
	MDimydJLZBDW8WdAASQXRKwvjz3SSBw7VUhWfB1lmr5/JeG/NW4nB9IBR1tun6f41h6CsR+Baxl
	SIsYnlqltRhSxCz00lkgZNt/VgZ7olV8pL0uGsydKtwJaTPk
X-Received: by 2002:a17:902:f603:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2f03f0c1f04mr123170745ad.7.1795493820650;
        Mon, 23 Nov 2026 20:17:00 -0800 (PST)
Received: from localhost ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f070a12491sm39416725ad.8.2026.11.23.20.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:17:00 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com
Cc: raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v6 9/9] docs: document WID DT properties
Date: Tue, 24 Nov 2026 12:16:31 +0800
Message-Id: <20261124041631.1049169-10-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124041631.1049169-1-peter.lin@sifive.com>
References: <20261124041631.1049169-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_201701_758659_35C1F468 
X-CRM114-Status: GOOD (  14.24  )
X-Spam-Score: -2.1 (--)
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

Add "wid" and "widdeleg" properties to domain instance node
documentation and example DT. Add a "Root Domain Node" section
describing the "root" subnode under the domain configuration
node for root domain WID configuration

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 docs/domain_support.md | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/docs/domain_support.md b/docs/domain_support.md
index 86a25f22..c30c1c14 100644
--- a/docs/domain_support.md
+++ b/docs/domain_support.md
@@ -56,6 +56,8 @@ has following details:
   domain. This can be either S-mode or U-mode.
 * **system_reset_allowed** - Is domain allowed to reset the system?
 * **system_suspend_allowed** - Is domain allowed to suspend the system?
+* **wid** - World ID for the domain
+* **widdeleg** - World ID delegation bitmask for the domain
 
 The memory regions represented by **regions** in **struct sbi_domain** have
 following additional constraints to align with RISC-V PMP requirements:
@@ -98,6 +100,8 @@ following manner:
   is the next mode for the ROOT domain
 * **system_reset_allowed** - The ROOT domain is allowed to reset the system
 * **system_suspend_allowed** - The ROOT domain is allowed to suspend the system
+* **wid** - Configurable World ID for the ROOT domain
+* **widdeleg** - Configurable World ID delegation bitmask for the ROOT domain
 
 Domain Effects
 --------------
@@ -131,6 +135,23 @@ The DT properties of a domain configuration DT node are as follows:
 * **compatible** (Mandatory) - The compatible string of the domain
   configuration. This DT property should have value *"opensbi,domain,config"*
 
+### Root Domain Node
+
+The root domain WID configuration is described in a **root** subnode under
+the domain configuration DT node.
+
+The DT properties of the root domain node are as follows:
+
+* **compatible** (Mandatory) - The compatible string of the root domain node.
+  This DT property should have value *"opensbi,domain,instance"*.
+* **wid** (Mandatory if Smlwid is present) - The World ID (must be less than XLEN) for
+  lower-privilege modes (S/U-mode) for the ROOT domain. If the hart
+  supports the Smlwid extension, this property must be provided.
+* **widdeleg** (Optional) - The World ID delegation bitmask (at most XLEN bits) for
+  the ROOT domain. If present, OpenSBI writes this value to **mwiddeleg**
+  when entering the ROOT domain (requires Smwiddeleg extension). If absent,
+  clears **mwiddeleg** to disable S-mode WID delegation.
+
 ### Domain Memory Region Node
 
 The domain memory region DT node describes details of a memory region and
@@ -205,6 +226,13 @@ The DT properties of a domain instance DT node are as follows:
   whether the domain instance is allowed to do system reset.
 * **system-suspend-allowed** (Optional) - A boolean flag representing
   whether the domain instance is allowed to do system suspend.
+* **wid** (Mandatory if Smlwid is present) - The World ID (must be less than XLEN) for
+  lower-privilege modes (S/U-mode) for the domain instance. If the hart
+  supports the Smlwid extension, this property must be provided.
+* **widdeleg** (Optional) - The World ID delegation bitmask (at most XLEN bits) for
+  the domain instance. If present, OpenSBI writes this value to **mwiddeleg**
+  on context switch into this domain (requires Smwiddeleg extension). If absent,
+  clears **mwiddeleg** to disable S-mode WID delegation.
 
 ### Assigning HART To Domain Instance
 
@@ -267,6 +295,12 @@ be done:
                 order = <64>;
             };
 
+            root {
+                compatible = "opensbi,domain,instance";
+                wid = <3>;
+                widdeleg = <0x0 0x0>;
+            };
+
             tdomain: trusted-domain {
                 compatible = "opensbi,domain,instance";
                 possible-harts = <&cpu0>;
@@ -275,6 +309,8 @@ be done:
                 next-arg1 = <0x0 0x0>;
                 next-addr = <0x0 0x80100000>;
                 next-mode = <0x0>;
+                wid = <1>;
+                widdeleg = <0x0 0x6>;
                 system-reset-allowed;
                 system-suspend-allowed;
             };
@@ -283,6 +319,8 @@ be done:
                 compatible = "opensbi,domain,instance";
                 possible-harts = <&cpu1 &cpu2 &cpu3 &cpu4>;
                 regions = <&tmem 0x0>, <&tuart 0x0>, <&allmem 0x3f>;
+                wid = <0>;
+                widdeleg = <0x0 0x1>;
             };
         };
     };
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
