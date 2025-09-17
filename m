Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACEACAC59A
	for <opensbi@archiver.kernel.org>; Wed, 17 Sep 2025 22:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZaj8idgPXwXR1F6/HZtTecOUi81sQb4cDU4S3ux7LI=; b=YLguR4S+6U7/p/
	2LohBLWNhWQ4XAQ95QxNqNCEEgAWHZgrLv2YF7Nrs3+kSCYB9xQXbuDINx2/M/zTwZrx5aGMkAdII
	fH04U6gJ4YCf5VOsKGH4TgdPHcLJC5SXg+pCIWDaw2hrAv/iQK25o3Wwvsg7kAxbt0IBKHAEEe21n
	mHEr9p+Of6Q7TuTN6N0RWyyW9NSPLHzqZLko043SUGy8Fy7BstoveNX3zyvBZf2OcQJSfFsUjUXHj
	oJIQVhuB+w79f8ifKpIRnsAtfgPVgqis7HAHL1erSYRoJggOWnxW1ZHboLWERNWIdgHjhuI6SQz1q
	2DV6+1/K7g39Ivf9uUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz10g-0000000FMjE-3yCd;
	Wed, 17 Sep 2025 22:52:22 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz10e-0000000FMi2-04Zv
	for opensbi@lists.infradead.org;
	Wed, 17 Sep 2025 22:52:21 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-424117c229aso3000855ab.0
        for <opensbi@lists.infradead.org>; Wed, 17 Sep 2025 15:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1758149539; x=1758754339; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p9rzP2cuC+L/MqIV10kBkYPJyv47Kwr+z1DVMKxMxXo=;
        b=DdsWzIB+rycqin36VdX8X9tR7sIUzmrXchuFJ862r7zUgp+pa8EB5oUXYfuJBvqsbU
         ZGWTgJuTkmey9/oOII/vkbYEkrU1dQraOWk+9YldNA7AI0IC6LwvNwOEfS/6g04Z3Npf
         +ZrqZPUK0bYOiFS0nogxhX6LRS85gpRLsMU1CKCDPob0M8NSKhrovfNWb3UCFBx/I/67
         8I88aWJ6QNcOasPSFTUf+RuY46nzQDhYdlQ2pOWe7bug7PSLrKeSnFv4sFbXA8lnBdBI
         AtgaXXD4WOy2Cveal7X7c8NZa2sFvNAQhpxqjSZEuY+zWKG7QkWi40+Lto8eOgx8DWGr
         VRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758149539; x=1758754339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9rzP2cuC+L/MqIV10kBkYPJyv47Kwr+z1DVMKxMxXo=;
        b=krzV+ceKnorTo7TOmMH4JGUbYTuHY+JjwbeflfN3o4PJcJo7I67nl9Np2YQ/joWPJk
         FvIkhx1hVXfThULMOeQlzH33vZJ8GZ1gAW020rL0XADKi9iEmTP3zcvZS0cJR0/Vjja2
         23aovJ74kRh4/jfuOWccyRHkaVyaFrO3MjPUQubHxS+hP2nUbVvz0nwyeoc8oSzf4lhk
         6xNFZj1ymHHMECDMTDTPlhmJ3x52ej/kLlTQYTRFWSPygwsmNBSiE5E/sSmUp0DR4vRn
         Y7NgusQBzsrHyQeOwfegVcktWUIz8gfLix0qs/BN9QKOJ66xwsGlkJQdtQ16fhZ6NlEl
         ifYw==
X-Forwarded-Encrypted: i=1; AJvYcCWkh8L50JwvHKq2ThRrKiDDi2BOExYlqx49n7IPl6lnA7uuklq/WmTe2Yh72+M7tw6yKstLwFdH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2l004sZoVd0casnx6jD4meCJmduRzs8JlHBR3ReZG8f/AlNHi
	H2ybYBYV1X9KmOxA48161QsmWIkycP+uy2H65aVnkx+gc29KpG39OpvUXAOZ/lHkI5GI1+SlIqz
	z2G3P2Z8=
X-Gm-Gg: ASbGncvSh4RadXRoCB44DFApajj/IyJSRs1U7/Qnc3zQpeBeRtYurQ0bxc5WTRIdQ+1
	PTs4gZFL5QltBta8KqoQPDluooKQ1o2B1Fp/xPSm9FoAZ7mtovugJNJyK79wV58PWDV5sCZbVN2
	v/AetQyr+TpFKsQ5aKx8M9bT5ycMvxM0Cf/caUSGy2Z/zeajTD51dKNir6ifkOTXkkFgNdskbZz
	QjP5lYSaVLPz+J2f6azO4OkSnASC6erqJcqd1rVHBlJbbzpKICtF4Ws/vkgU8PTouLbtHCfxHsG
	h216/147XNj9uaaMpoQLJ3cdcH+SmdqUg+34EM3leIv4kUIbpRYNbbJ+jvqB3iLnQMZm/TE7PQB
	Jhcr32qZerCnRetQC5MdNupD0HO99AU9+auH3x9Ry6d/lQoc/xl7gFtS5zA==
X-Google-Smtp-Source: AGHT+IF42rTUzuXPnm2tmmNDfgUtOQiFCVzV12wwlb5BeKUCF86044dD2sJ7ZbkJ4PAMV3slVpHrmA==
X-Received: by 2002:a05:6e02:4617:b0:424:2357:d57 with SMTP id e9e14a558f8ab-42423571ee2mr39585505ab.25.1758149539013;
        Wed, 17 Sep 2025 15:52:19 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244b2ac7edsm2662255ab.41.2025.09.17.15.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 15:52:18 -0700 (PDT)
Message-ID: <4903d0a8-63b8-47f6-ae52-4de0490823ba@sifive.com>
Date: Wed, 17 Sep 2025 17:52:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: Separate libsbi objects for each platform
To: E Shattow <e@freeshell.de>, opensbi@lists.infradead.org
References: <20240903205345.2088737-1-samuel.holland@sifive.com>
 <36cfe431-40fb-470d-b50e-00a139d480f8@freeshell.de>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <36cfe431-40fb-470d-b50e-00a139d480f8@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_155220_084319_DB06CCAE 
X-CRM114-Status: GOOD (  29.30  )
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

Hi E,

On 2025-09-17 2:50 PM, E Shattow wrote:
> Hi Samuel,
> 
> On 9/3/24 13:53, Samuel Holland wrote:
>> Since commit 22f38ee6c658 ("lib: sbi_ecall: Add Kconfig option for each
>> extension"), the libsbi object file contents depend on the Kconfig
>> configuration, so these files may be different across platforms. As a
>> result, each platform should get a separate copy of these object files,
>> corresponding to that platform's configuration.
>>
>> This change also allows building for multiple platforms in parallel.
>>
>> Fixes: 22f38ee6c658 ("lib: sbi_ecall: Add Kconfig option for each extension")
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>> Note that Kconfig is not used for the generic (no PLATFORM set) libsbi
>> build. But this is actually equivalent to all Kconfig options being
>> disabled. As a result, since the referenced commit, the generic libsbi
>> only supports the base SBI extension and none of the others. I don't
>> know how we want to fix this -- does anyone even use libsbi anymore?
>>
>>  Makefile | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index e5a0f19e..ccb2e138 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -264,11 +264,13 @@ include $(libsbiutils-object-mks)
>>  include $(firmware-object-mks)
>>  
>>  # Setup list of objects
>> -libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(build_dir)/lib/sbi/$(obj))
>>  ifdef PLATFORM
>> +libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(platform_build_dir)/lib/sbi/$(obj))
>>  libsbiutils-objs-path-y=$(foreach obj,$(libsbiutils-objs-y),$(platform_build_dir)/lib/utils/$(obj))
>>  platform-objs-path-y=$(foreach obj,$(platform-objs-y),$(platform_build_dir)/$(obj))
>>  firmware-bins-path-y=$(foreach bin,$(firmware-bins-y),$(platform_build_dir)/firmware/$(bin))
>> +else
>> +libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(build_dir)/lib/sbi/$(obj))
>>  endif
>>  firmware-elfs-path-y=$(firmware-bins-path-y:.bin=.elf)
>>  firmware-objs-path-y=$(firmware-bins-path-y:.bin=.o)
>> @@ -504,9 +506,10 @@ compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>>  	     echo " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
>>  	     echo "$(1:.dep=$(2)): $(3)" >> $(1)
>>  
>> -targets-y  = $(build_dir)/lib/libsbi.a
>>  ifdef PLATFORM
>>  targets-y += $(platform_build_dir)/lib/libplatsbi.a
>> +else
>> +targets-y  = $(build_dir)/lib/libsbi.a
>>  endif
>>  targets-y += $(firmware-bins-path-y)
>>  
>> @@ -565,6 +568,11 @@ $(platform_build_dir)/%.dep: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
>>  $(platform_build_dir)/%.o: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
>>  	$(call compile_cc,$@,$<)
>>  
>> +ifeq ($(BUILD_INFO),y)
>> +$(platform_build_dir)/lib/sbi/sbi_init.o: $(libsbi_dir)/sbi_init.c FORCE
>> +	$(call compile_cc,$@,$<)
>> +endif
>> +
>>  $(platform_build_dir)/%.dep: $(platform_src_dir)/%.S
>>  	$(call compile_as_dep,$@,$<)
>>  
> 
> Thanks for your reply [1] highlighting this patch. I recently
> encountered the issue, here are the detailed steps to reproduce:
> 
> `git clone --branch v2025.10-rc4
> https://source.denx.de/u-boot/u-boot.git /path/u-boot.git`
> `make O=/path/u-boot -C /path/u-boot.git starfive_visionfive2_defconfig`
> `make O=/path/u-boot -C /path/u-boot.git`
> 
> Image 'itb' is missing external blobs and is non-functional: opensbi
> /binman/itb/fit/images/opensbi/opensbi (fw_dynamic.bin):
>    See the documentation for your board. The OpenSBI git repo is at
>    https://github.com/riscv/opensbi.git
>    You may need to build fw_dynamic.bin first and re-build u-boot with
>    OPENSBI=/path/to/fw_dynamic.bin
> Image 'itb' has faked external blobs and is non-functional: fw_dynamic.bin
> 
> `git clone --branch v1.7
> https://github.com/riscv-software-src/opensbi.git /path/opensbi.git`
> `make O=/path/opensbi -C /path/opensbi.git`
> 
> # No such file fw_dynamic.bin, I am missing PLATFORM, try again:
> 
> `make O=/path/opensbi -C /path/opensbi.git PLATFORM=generic`
> `make O=/path/u-boot -C /path/u-boot.git
> OPENSBI=/path/opensbi/platform/generic/firmware/fw_payload.bin`
> 
> # U-Boot builds successfully however the result is defective in use
> 
> StarFive # reset
> resetting ...
> System reset not supported on this platform
> ### ERROR ### Please RESET the board ###
> 
> # Apply your patch, try again
> 
> `curl https://patchwork.ozlabs.org/series/422221/mbox/ | git -C
> /path/opensbi.git am`
> `make O=/path/opensbi -C /path/opensbi.git PLATFORM=generic`
> 
> # Result is no-op, must clean for patch to be effective

Thanks for testing! Yes, unfortunately this is still a problem that changes to
several files (especially objects.mk files) do not get picked up by the build
system, and it's a larger job to untangle. So currently it is best to assume you
need to clean the build directory after moving commits or applying a patch that
touches non-C files.

Regards,
Samuel

> `make O=/path/opensbi -C /path/opensbi.git clean`
> `make O=/path/opensbi -C /path/opensbi.git`
> `make O=/path/opensbi -C /path/opensbi.git PLATFORM=generic`
> `make O=/path/u-boot -C /path/u-boot.git
> OPENSBI=/path/opensbi/platform/generic/firmware/fw_payload.bin`
> 
> # U-Boot builds successfully and result is valid
> 
> StarFive # reset
> resetting ...
> U-Boot SPL 2025.10-rc4...
> 
> 1:
> https://lore.kernel.org/opensbi/0d6bf7c7-7605-4ad6-a35c-54efc5230fb8@sifive.com/
> 
> I'm thinking this should get a mention in the documentation in addition
> to the patch, if we're v1.7 and this is accepted for v1.8
> 
> "Releases prior to v1.8 would <technical description here>... when
> building OpenSBI you must clean your build directory between v1.8 and
> any earlier version for the new behavior to be effective."
> 
> With that, and without regard to uses other than PLATFORM=generic,
> 
> Tested-by: E Shattow <e@freeshell.de>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
