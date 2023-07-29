From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sat, 29 Jul 2023 02:52:18 +0100
Subject: [PATCH] gitignore: add VSCode workspace dir
In-Reply-To: <IA1PR20MB49531FC9B5E99A58C37DD66DBB07A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49531FC9B5E99A58C37DD66DBB07A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <F386D298-4E1D-4DC5-A798-D5F0D36E8CDC@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 29 Jul 2023, at 02:49, Inochi Amaoto <inochiama@outlook.com> wrote:
> 
> VSCode uses .vscode dir to store workspace settings, update .gitignore to
> ignore it

Put .vscode in your global gitignore file then? The *.swp shouldn?t
really be here either. Otherwise every project?s gitignore becomes a
mess trying to ignore every editor. Projects should be responsible for
their own build outputs, and users should be responsible for whatever
cruft their system?s tools leave around.

So, NAK from me (and a request for someone to remove the *.swp).

Jess

> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
> .gitignore | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index c11afd3..69ff5f8 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -11,3 +11,4 @@ install/
> tags
> cscope*
> *.swp
> +.vscode
> -- 
> 2.41.0
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


