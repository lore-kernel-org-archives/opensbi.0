Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CADCAC598
	for <opensbi@archiver.kernel.org>; Wed, 17 Sep 2025 19:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WS6aee5/sWFNwcFL+CdH2ZzN/MnMS0a5XObow0KRnOU=; b=Atj/0vRV0CeR3O
	zUcD8/qrGi3H7jibYbhz7jrZn4uY9j2fAcUm5DWOJQfQecRBlWuMQ+5VZ6jJd0xw4WOhdM81OZKF6
	Jifoo/jJC5G7a3S5kJlzytUYobzIBCGYWw3U9fB0HBKAu5gtkhshzNqDsSUw31aulITe/yfpHU+S8
	Ki2sTfQHEhgytPdjIlJTq93DRd0gmnDcinX4T5l/1fVsNucOyoFwCjV/iEpgMZ9mYG0gmWo1vfHLX
	JJ0cI9OhEhhhyyXnZW0xM9KpHJaufWdK/9zOI1Il2/ygPi74DwAwbfOslN4MwPk/Rf00fSwK4S3m7
	+O9H/+xE8n0F3jr+C5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyyAf-0000000EP1m-3Cof;
	Wed, 17 Sep 2025 19:50:29 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyyAb-0000000EOxq-3vzX
	for opensbi@lists.infradead.org;
	Wed, 17 Sep 2025 19:50:27 +0000
Received: from [192.168.2.54] (unknown [98.97.61.9])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 41EDAB2201BE;
	Wed, 17 Sep 2025 21:50:22 +0200 (CEST)
Message-ID: <36cfe431-40fb-470d-b50e-00a139d480f8@freeshell.de>
Date: Wed, 17 Sep 2025 12:50:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: Separate libsbi objects for each platform
To: Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
References: <20240903205345.2088737-1-samuel.holland@sifive.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20240903205345.2088737-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_125026_136901_2AFA0B5A 
X-CRM114-Status: GOOD (  23.48  )
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

Hi Samuel,

On 9/3/24 13:53, Samuel Holland wrote:
> Since commit 22f38ee6c658 ("lib: sbi_ecall: Add Kconfig option for each
> extension"), the libsbi object file contents depend on the Kconfig
> configuration, so these files may be different across platforms. As a
> result, each platform should get a separate copy of these object files,
> corresponding to that platform's configuration.
> 
> This change also allows building for multiple platforms in parallel.
> 
> Fixes: 22f38ee6c658 ("lib: sbi_ecall: Add Kconfig option for each extension")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> Note that Kconfig is not used for the generic (no PLATFORM set) libsbi
> build. But this is actually equivalent to all Kconfig options being
> disabled. As a result, since the referenced commit, the generic libsbi
> only supports the base SBI extension and none of the others. I don't
> know how we want to fix this -- does anyone even use libsbi anymore?
> 
>  Makefile | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e5a0f19e..ccb2e138 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -264,11 +264,13 @@ include $(libsbiutils-object-mks)
>  include $(firmware-object-mks)
>  
>  # Setup list of objects
> -libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(build_dir)/lib/sbi/$(obj))
>  ifdef PLATFORM
> +libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(platform_build_dir)/lib/sbi/$(obj))
>  libsbiutils-objs-path-y=$(foreach obj,$(libsbiutils-objs-y),$(platform_build_dir)/lib/utils/$(obj))
>  platform-objs-path-y=$(foreach obj,$(platform-objs-y),$(platform_build_dir)/$(obj))
>  firmware-bins-path-y=$(foreach bin,$(firmware-bins-y),$(platform_build_dir)/firmware/$(bin))
> +else
> +libsbi-objs-path-y=$(foreach obj,$(libsbi-objs-y),$(build_dir)/lib/sbi/$(obj))
>  endif
>  firmware-elfs-path-y=$(firmware-bins-path-y:.bin=.elf)
>  firmware-objs-path-y=$(firmware-bins-path-y:.bin=.o)
> @@ -504,9 +506,10 @@ compile_gen_dep = $(CMD_PREFIX)mkdir -p `dirname $(1)`; \
>  	     echo " GEN-DEP   $(subst $(build_dir)/,,$(1))"; \
>  	     echo "$(1:.dep=$(2)): $(3)" >> $(1)
>  
> -targets-y  = $(build_dir)/lib/libsbi.a
>  ifdef PLATFORM
>  targets-y += $(platform_build_dir)/lib/libplatsbi.a
> +else
> +targets-y  = $(build_dir)/lib/libsbi.a
>  endif
>  targets-y += $(firmware-bins-path-y)
>  
> @@ -565,6 +568,11 @@ $(platform_build_dir)/%.dep: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
>  $(platform_build_dir)/%.o: $(platform_src_dir)/%.c $(KCONFIG_AUTOHEADER)
>  	$(call compile_cc,$@,$<)
>  
> +ifeq ($(BUILD_INFO),y)
> +$(platform_build_dir)/lib/sbi/sbi_init.o: $(libsbi_dir)/sbi_init.c FORCE
> +	$(call compile_cc,$@,$<)
> +endif
> +
>  $(platform_build_dir)/%.dep: $(platform_src_dir)/%.S
>  	$(call compile_as_dep,$@,$<)
>  

Thanks for your reply [1] highlighting this patch. I recently
encountered the issue, here are the detailed steps to reproduce:

`git clone --branch v2025.10-rc4
https://source.denx.de/u-boot/u-boot.git /path/u-boot.git`
`make O=/path/u-boot -C /path/u-boot.git starfive_visionfive2_defconfig`
`make O=/path/u-boot -C /path/u-boot.git`

Image 'itb' is missing external blobs and is non-functional: opensbi
/binman/itb/fit/images/opensbi/opensbi (fw_dynamic.bin):
   See the documentation for your board. The OpenSBI git repo is at
   https://github.com/riscv/opensbi.git
   You may need to build fw_dynamic.bin first and re-build u-boot with
   OPENSBI=/path/to/fw_dynamic.bin
Image 'itb' has faked external blobs and is non-functional: fw_dynamic.bin

`git clone --branch v1.7
https://github.com/riscv-software-src/opensbi.git /path/opensbi.git`
`make O=/path/opensbi -C /path/opensbi.git`

# No such file fw_dynamic.bin, I am missing PLATFORM, try again:

`make O=/path/opensbi -C /path/opensbi.git PLATFORM=generic`
`make O=/path/u-boot -C /path/u-boot.git
OPENSBI=/path/opensbi/platform/generic/firmware/fw_payload.bin`

# U-Boot builds successfully however the result is defective in use

StarFive # reset
resetting ...
System reset not supported on this platform
### ERROR ### Please RESET the board ###

# Apply your patch, try again

`curl https://patchwork.ozlabs.org/series/422221/mbox/ | git -C
/path/opensbi.git am`
`make O=/path/opensbi -C /path/opensbi.git PLATFORM=generic`

# Result is no-op, must clean for patch to be effective

`make O=/path/opensbi -C /path/opensbi.git clean`
`make O=/path/opensbi -C /path/opensbi.git`
`make O=/path/opensbi -C /path/opensbi.git PLATFORM=generic`
`make O=/path/u-boot -C /path/u-boot.git
OPENSBI=/path/opensbi/platform/generic/firmware/fw_payload.bin`

# U-Boot builds successfully and result is valid

StarFive # reset
resetting ...
U-Boot SPL 2025.10-rc4...

1:
https://lore.kernel.org/opensbi/0d6bf7c7-7605-4ad6-a35c-54efc5230fb8@sifive.com/

I'm thinking this should get a mention in the documentation in addition
to the patch, if we're v1.7 and this is accepted for v1.8

"Releases prior to v1.8 would <technical description here>... when
building OpenSBI you must clean your build directory between v1.8 and
any earlier version for the new behavior to be effective."

With that, and without regard to uses other than PLATFORM=generic,

Tested-by: E Shattow <e@freeshell.de>

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
