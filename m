From: Xiang W <wxjstz@126.com>
Date: Sat, 29 Jul 2023 16:37:58 +0800
Subject: [PATCH] gitignore: add VSCode workspace dir
In-Reply-To: <IA1PR20MB49531FC9B5E99A58C37DD66DBB07A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49531FC9B5E99A58C37DD66DBB07A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <2e17d973f96bfe31a8c41a9be2d591e406ee61a3.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-07-29???? 09:49 +0800?Inochi Amaoto???
> VSCode uses .vscode dir to store workspace settings, update .gitignore to
> ignore it
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Look good to me.

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?.gitignore | 1 +
> ?1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index c11afd3..69ff5f8 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -11,3 +11,4 @@ install/
> ?tags
> ?cscope*
> ?*.swp
> +.vscode
> -- 
> 2.41.0
> 
> 


