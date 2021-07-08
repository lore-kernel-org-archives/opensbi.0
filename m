From: Xiang W <wxjstz@126.com>
Date: Thu, 08 Jul 2021 20:06:39 +0800
Subject: [PATCH 2/2] docs: Make <xyz> visible in the rendered platform
 guide
In-Reply-To: <20210708110729.7136-2-bmeng.cn@gmail.com>
References: <20210708110729.7136-1-bmeng.cn@gmail.com>
 <20210708110729.7136-2-bmeng.cn@gmail.com>
Message-ID: <850fe527d6eb5d4f8804fec477b70617bcd7a9cf.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-07-08???? 19:07 +0800?Bin Meng???
> At present in the rendered platform guide, all instances of <xyz>
> are missing. Use &lt; and &gt; to replace <> to make them visible.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> 
> ?docs/platform_guide.md | 16 ++++++++--------
> ?1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/platform_guide.md b/docs/platform_guide.md
> index df90c6b..b6c2c2e 100644
> --- a/docs/platform_guide.md
> +++ b/docs/platform_guide.md
> @@ -25,18 +25,18 @@ APIs is available in the file
> *include/sbi/sbi_platform.h*.
> ?Adding support for a new platform
> ?---------------------------------
> ?
> -Support for a new platform named *<xyz>* can be added as follows:
> +Support for a new platform named *&lt;xyz&gt;* can be added as
> follows:
> ?
> -1. Create a directory named *<xyz>* under the *platform/* directory.
> +1. Create a directory named *&lt;xyz&gt;* under the *platform/*
> directory.
> ?2. Create a platform configuration file named *config.mk* under the
> -?? *platform/<xyz>/* directory. This configuration file will provide
> +?? *platform/&lt;xyz&gt;/* directory. This configuration file will
> provide
> ??? compiler flags, and select firmware options.
> -3. Create a *platform/<xyz>/objects.mk* file for listing the
> +3. Create a *platform/&lt;xyz&gt;/objects.mk* file for listing the
> ??? platform-specific object files to be compiled.
> -4. Create a *platform/<xyz>/platform.c* file providing a *struct
> sbi_platform*
> -?? instance.
> +4. Create a *platform/&lt;xyz&gt;/platform.c* file providing a
> +?? *struct sbi_platform* instance.
> ?
> ?A platform support code template is available under the
> *platform/template*
> ?directory. Copying this directory and its content as a new directory
> named
> -*<xyz>* under the *platform/* directory will create all the files
> mentioned
> -above.
> +*&lt;xyz&gt;* under the *platform/* directory will create all the
> files
> +mentioned above.
> -- 
> 2.25.1
> 
> 



