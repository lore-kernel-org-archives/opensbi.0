From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 2 Aug 2022 10:16:57 +0200
Subject: [PATCH v5 16/16] docs: Update documentation for kconfig support
In-Reply-To: <20220802081115.mrvklp74eeigsgjl@kamzik>
References: <20220802044132.280529-1-apatel@ventanamicro.com>
 <20220802044132.280529-17-apatel@ventanamicro.com>
 <20220802081115.mrvklp74eeigsgjl@kamzik>
Message-ID: <20220802081657.qy3eyurv5ctogxct@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 02, 2022 at 10:11:15AM +0200, Andrew Jones wrote:
> On Tue, Aug 02, 2022 at 10:11:32AM +0530, Anup Patel wrote:
..
> > diff --git a/docs/platform/platform.md b/docs/platform/platform.md
> > index cb4bec6..b726e1d 100644
> > --- a/docs/platform/platform.md
> > +++ b/docs/platform/platform.md
> > @@ -42,8 +42,8 @@ OpenSBI currently supports the following virtual and hardware platforms:
> >  The code for these supported platforms can be used as example to implement
> >  support for other platforms. The *platform/template* directory also provides
> >  template files for implementing support for a new platform. The *object.mk*,
> 
> objects.mk
>

The makefile has a object.mk in a comment too that we should fix.

Makefile:234:# Include all object.mk files

Thanks,
drew

