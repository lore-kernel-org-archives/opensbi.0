From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 22 Nov 2022 18:29:36 +0100
Subject: [PATCH] Makefile: bugfix for handling platform paths
In-Reply-To: <904be39c57862760477bc0663527c55ab6db6ad2.camel@126.com>
References: <20221122102825.88440-1-aldaya@gmail.com>
 <904be39c57862760477bc0663527c55ab6db6ad2.camel@126.com>
Message-ID: <20221122172936.5ihepb3rgu7kw3jw@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 22, 2022 at 09:42:38PM +0800, Xiang W wrote:
> ? 2022-11-22???? 12:28 +0200?Alejandro Cabrera Aldaya???
> > If the path where this repo is located contains the platform name on it,
> > the original Makefile replaced its occurrences from the path making it an invalid path.
> > This commit prevents this behavior replacing only the last part of the path as intended.
> > 
> > Signed-off-by: Alejandro Cabrera Aldaya <aldaya@gmail.com>
> > ---
> > ?Makefile | 2 +-
> > ?1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 8db6eab..32d4c48 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -47,7 +47,7 @@ ifdef PLATFORM_DIR
> > ???? platform_parent_dir=$(platform_dir_path)
> > ?? else
> > ???? PLATFORM=$(shell basename $(platform_dir_path))
> > -??? platform_parent_dir=$(subst $(PLATFORM),,$(platform_dir_path))
> > +??? platform_parent_dir=$(shell dirname $(shell realpath $(platform_dir_path)))??? 
> > 
> 
> Looks good, could simplify it a bit.
> 	platform_parent_dir=$(shell realpath ${platform_dir_path}/..)

I like this simplified version better.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

> 
> Reviewed-by: Xiang W <wxjstz@126.com>
> 
> > ?? endif
> > ?else
> > ? platform_parent_dir=$(src_dir)/platform
> > -- 
> > 2.34.1
> > 
> > 
> 
> 
> 
> -- 
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

