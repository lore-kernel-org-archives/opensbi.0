Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F26ECAC59F
	for <opensbi@archiver.kernel.org>; Thu, 18 Sep 2025 03:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ne35cLoeW13TDJ5A1YDa+XYMKX8BHnvkeuD6lZ4Povo=; b=g2dC1S5onDYyX3
	dRkPTBC9T88Znytj2Bj3KBe1xg9Mbjy1Pc3T9X2Lntke691Qd9vbP6QtZznqzpkgd7ThNYZg2Zm8k
	R2nRDsJFF0hPirDvwIWvqevcKCr0HtMO2LemYJo3E70tfRW9/J1j+GGCZJ0uN8GLVPuUJxbFPqK0o
	3QCRv9Z5et5XKltLmvaTcj8E2RLjYPRWvJFOI4aAFrVcnAOwjd30eJykDIJzKep65v1zFRY2TWPo6
	TFyvSN8Z5ooev7Q/3kK4BnbLHtjyRuB76loNTfreEP7fPqTe0HspAkEkbio7vhilGHy00wmozAN3d
	S4IlDHUuQyC+5nG8LXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5J0-0000000G8Ee-3kSY;
	Thu, 18 Sep 2025 03:27:34 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5Ix-0000000G8Bp-3RMh
	for opensbi@lists.infradead.org;
	Thu, 18 Sep 2025 03:27:33 +0000
Received: from [192.168.2.54] (unknown [98.97.61.9])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E5E01B2203E7;
	Thu, 18 Sep 2025 05:27:27 +0200 (CEST)
Message-ID: <32873fc7-2cc8-46d5-9f4e-3a16cf95f48a@freeshell.de>
Date: Wed, 17 Sep 2025 20:27:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: Separate libsbi objects for each platform
To: Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
References: <20240903205345.2088737-1-samuel.holland@sifive.com>
 <36cfe431-40fb-470d-b50e-00a139d480f8@freeshell.de>
 <4903d0a8-63b8-47f6-ae52-4de0490823ba@sifive.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <4903d0a8-63b8-47f6-ae52-4de0490823ba@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_202732_030410_04B582E4 
X-CRM114-Status: GOOD (  26.01  )
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



On 9/17/25 15:52, Samuel Holland wrote:
> Hi E,
> 
> On 2025-09-17 2:50 PM, E Shattow wrote:
>> Hi Samuel,
>>
>> On 9/3/24 13:53, Samuel Holland wrote:
>>> Since commit 22f38ee6c658 ("lib: sbi_ecall: Add Kconfig option for each
>>> extension"), the libsbi object file contents depend on the Kconfig
>>> configuration, so these files may be different across platforms. As a
>>> result, each platform should get a separate copy of these object files,
>>> corresponding to that platform's configuration.
>>>
>>> This change also allows building for multiple platforms in parallel.
>>>
>>> Fixes: 22f38ee6c658 ("lib: sbi_ecall: Add Kconfig option for each extension")
>>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>>> ---
>>> Note that Kconfig is not used for the generic (no PLATFORM set) libsbi
>>> build. But this is actually equivalent to all Kconfig options being
>>> disabled. As a result, since the referenced commit, the generic libsbi
>>> only supports the base SBI extension and none of the others. I don't
>>> know how we want to fix this -- does anyone even use libsbi anymore?
>>>
>>>  Makefile | 12 ++++++++++--
>>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index e5a0f19e..ccb2e138 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -264,11 +264,13 @@ include $(libsbiutils-object-mks)
>>>  include $(firmware-object-mks)
>>>  
>>>  # Setup list of objects
>>> -libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(build_dir)/lib/sbi/$(obj))
>>>  ifdef PLATFORM
>>> +libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(platform_build_dir)/lib/sbi/$(obj))
>>>  libsbiutils-objs-path-y=$(foreach obj,$(libsbiutils-objs-y),$(platform_build_dir)/lib/utils/$(obj))
>>>  platform-objs-path-y=$(foreach obj,$(platform-objs-y),$(platform_build_dir)/$(obj))
>>>  firmware-bins-path-y=$(foreach bin,$(firmware-bins-y),$(platform_build_dir)/firmware/$(bin))
>>> +else
>>> +libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(build_dir)/lib/sbi/$(obj))
>>>  endif
>>>  firmware-elfs-path-y=$(firmware-bins-path-y:.bin=.elf)
>>>  firmware-objs-path-y=$(firmware-bins-path-y:.bin=.o)
>>> @@ -504,9 +506,10 @@ compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>>>  	     echo " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
>>>  	     echo "$(1:.dep=$(2)): $(3)" >> $(1)
>>>  
>>> -targets-y  = $(build_dir)/lib/libsbi.a
>>>  ifdef PLATFORM
>>>  targets-y += $(platform_build_dir)/lib/libplatsbi.a
>>> +else
>>> +targets-y  = $(build_dir)/lib/libsbi.a
>>>  endif
>>>  targets-y += $(firmware-bins-path-y)
>>>  
>>> @@ -565,6 +568,11 @@ $(platform_build_dir)/%.dep: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
>>>  $(platform_build_dir)/%.o: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
>>>  	$(call compile_cc,$@,$<)
>>>  
>>> +ifeq ($(BUILD_INFO),y)
>>> +$(platform_build_dir)/lib/sbi/sbi_init.o: $(libsbi_dir)/sbi_init.c FORCE
>>> +	$(call compile_cc,$@,$<)
>>> +endif
>>> +
>>>  $(platform_build_dir)/%.dep: $(platform_src_dir)/%.S
>>>  	$(call compile_as_dep,$@,$<)
>>>  
>>
>> Thanks for your reply [1] highlighting this patch. I recently
>> encountered the issue, here are the detailed steps to reproduce:
>>
>> `git clone --branch v2025.10-rc4
>> https://source.denx.de/u-boot/u-boot.git /path/u-boot.git`
>> `make O=/path/u-boot -C /path/u-boot.git starfive_visionfive2_defconfig`
>> `make O=/path/u-boot -C /path/u-boot.git`
>>
>> Image 'itb' is missing external blobs and is non-functional: opensbi
>> /binman/itb/fit/images/opensbi/opensbi (fw_dynamic.bin):
>>    See the documentation for your board. The OpenSBI git repo is at
>>    https://github.com/riscv/opensbi.git
>>    You may need to build fw_dynamic.bin first and re-build u-boot with
>>    OPENSBI=/path/to/fw_dynamic.bin
>> Image 'itb' has faked external blobs and is non-functional: fw_dynamic.bin
>>
>> `git clone --branch v1.7
>> https://github.com/riscv-software-src/opensbi.git /path/opensbi.git`
>> `make O=/path/opensbi -C /path/opensbi.git`
>>
>> # No such file fw_dynamic.bin, I am missing PLATFORM, try again:
>>
>> `make O=/path/opensbi -C /path/opensbi.git PLATFORM=generic`
>> `make O=/path/u-boot -C /path/u-boot.git
>> OPENSBI=/path/opensbi/platform/generic/firmware/fw_payload.bin`
>>
>> # U-Boot builds successfully however the result is defective in use
>>
>> StarFive # reset
>> resetting ...
>> System reset not supported on this platform
>> ### ERROR ### Please RESET the board ###
>>
>> # Apply your patch, try again
>>
>> `curl https://patchwork.ozlabs.org/series/422221/mbox/ | git -C
>> /path/opensbi.git am`
>> `make O=/path/opensbi -C /path/opensbi.git PLATFORM=generic`
>>
>> # Result is no-op, must clean for patch to be effective
> 
> Thanks for testing! Yes, unfortunately this is still a problem that changes to
> several files (especially objects.mk files) do not get picked up by the build
> system, and it's a larger job to untangle. So currently it is best to assume you
> need to clean the build directory after moving commits or applying a patch that
> touches non-C files.
> 
> Regards,
> Samuel
> 
>> `make O=/path/opensbi -C /path/opensbi.git clean`
>> `make O=/path/opensbi -C /path/opensbi.git`
>> `make O=/path/opensbi -C /path/opensbi.git PLATFORM=generic`
>> `make O=/path/u-boot -C /path/u-boot.git
>> OPENSBI=/path/opensbi/platform/generic/firmware/fw_payload.bin`
>>
>> # U-Boot builds successfully and result is valid
>>
>> StarFive # reset
>> resetting ...
>> U-Boot SPL 2025.10-rc4...
>>
>> 1:
>> https://lore.kernel.org/opensbi/0d6bf7c7-7605-4ad6-a35c-54efc5230fb8@sifive.com/
>>
>> I'm thinking this should get a mention in the documentation in addition
>> to the patch, if we're v1.7 and this is accepted for v1.8
>>
>> "Releases prior to v1.8 would <technical description here>... when
>> building OpenSBI you must clean your build directory between v1.8 and
>> any earlier version for the new behavior to be effective."
>>
>> With that, and without regard to uses other than PLATFORM=generic,
>>
>> Tested-by: E Shattow <e@freeshell.de>
> 

Yes, thank you. Without the patch 100% it makes that defective chimera.
Postscript n.b. I'd wrote 'fw_payload.bin' in all cases what I meant was
'fw_dynamic.bin' for use with U-Boot. T-by still applies, it was a
transcription error writing to e-mail.  -E

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
