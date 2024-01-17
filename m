From: Xiang W <wxjstz@126.com>
Date: Wed, 17 Jan 2024 20:18:45 +0800
Subject: [PATCH v2] Makefile: add rebuild
In-Reply-To: <mvm4jfcxkct.fsf@suse.de>
References: <20240117105843.1058338-1-wxjstz@126.com>
	 <mvm4jfcxkct.fsf@suse.de>
Message-ID: <6653f9b1d27c97dcd9f8e42fba86c938d16b7e1e.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-01-17???? 12:36 +0100?Andreas Schwab???
> On Jan 17 2024, Xiang W wrote:
> 
> > diff --git a/Makefile b/Makefile
> > index de4e73a..17d0a22 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -688,5 +688,9 @@ endif
> > ?	$(if $(V), @echo " RM??????? $(src_dir)/cscope*")
> > ?	$(CMD_PREFIX)rm -f $(src_dir)/cscope*
> > ?
> > +# Rule for "make rebuild"
> > +.PHONY: rebuild
> > +rebuild: clean all
> 
> This will not work in a parallel build, since clean and all will be run
> in parallel.
> 
Thanks, let's drop this patch.

Regards,
Xiang W


