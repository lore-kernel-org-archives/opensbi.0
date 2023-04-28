From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 28 Apr 2023 12:40:31 +0200
Subject: [PATCH] lib: sbi: Ensure SBI extension is available
In-Reply-To: <0163ae018708b6b107b9a2dcb27ebb10b54fdb62.camel@126.com>
References: <20230426172753.70664-1-ajones@ventanamicro.com>
 <f798c3f500849d71aba59a06d4c90ea0e4cb2071.camel@126.com>
 <jhzdkddibw5j7nje66qxamammxruslfbaz4xshfbykgvcgcozn@rqv44g76lo4w>
 <ad0ca17922ba61ec988fcee15f0940ee495d0759.camel@126.com>
 <ptjyzjjjlekztw3o2o6x2gg3c46ist2hcvk32iu4tguc4kt6f4@pnkmhiown66l>
 <0163ae018708b6b107b9a2dcb27ebb10b54fdb62.camel@126.com>
Message-ID: <7mcgz722zawguy2v25aspnmlnblaqd7l5zy4vxhezwaqipbsbv@nybztu72m443>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 28, 2023 at 09:52:00AM +0800, Xiang W wrote:
> ? 2023-04-27???? 10:01 +0200?Andrew Jones???
> > On Thu, Apr 27, 2023 at 03:26:20PM +0800, Xiang W wrote:
> > > ? 2023-04-27???? 09:00 +0200?Andrew Jones???
> > > > On Thu, Apr 27, 2023 at 09:02:14AM +0800, Xiang W wrote:
> > > > > ? 2023-04-26???? 19:27 +0200?Andrew Jones???
> > > > > > Ensure attempts to invoke SBI extension functions fail with
> > > > > > SBI_ERR_NOT_SUPPORTED when the extension's probe function has
> > > > > > reported that the extension is not available. By adding a new
> > > > > > status member to the extension which has three states
> > > > > > (uninitialized, available, unavailable), we ensure that the
> > > > > > probe function is only invoked once, lazily, upon first use.
> > > > > 
> > > > > Adding this state may cause errors. For example: the id numberof an extension is from extid_start to extid_end, which has an
> > > > > unused ID. Searching for an ID in this extension will return NULL
> > > > > if an unused ID is searched first.
> > > > 
> > > > Hi Xiang,
> > > > 
> > > > You're right. Either sbi_ecall_extension::status needs to be a function of
> > > > extid, like probe is, or we should just always call probe (when it's
> > > > available) and leave any optimizations to the individual probe functions.
> > > > How about this?
> > > > 
> > > > diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> > > > index 76a1ae9ab733..c86e4e8c9134 100644
> > > > --- a/lib/sbi/sbi_ecall.c
> > > > +++ b/lib/sbi/sbi_ecall.c
> > > > @@ -42,16 +42,18 @@ static SBI_LIST_HEAD(ecall_exts_list);
> > > > ?
> > > > ?struct sbi_ecall_extension *sbi_ecall_find_extension(unsigned long extid)
> > > > ?{
> > > > -???????struct sbi_ecall_extension *t, *ret = NULL;
> > > > +???????struct sbi_ecall_extension *t;
> > > > +???????unsigned long out_val;
> > > > ?
> > > > ????????sbi_list_for_each_entry(t, &ecall_exts_list, head) {
> > > > ????????????????if (t->extid_start <= extid && extid <= t->extid_end) {
> > > > -???????????????????????ret = t;
> > > > -???????????????????????break;
> > > > +???????????????????????if (t->probe && (t->probe(extid, &out_val) || !out_val))
> > > > +???????????????????????????????return NULL;
> > > > +???????????????????????return t;
> > > > ????????????????}
> > > > ????????}
> > > > ?
> > > > -???????return ret;
> > > > +???????return NULL;
> > > > ?}
> > > > ?
> > > > ?int sbi_ecall_register_extension(struct sbi_ecall_extension *ext)
> > > > 
> > > > Thanks,
> > > > drew
> > > Good. If so modified we can modify sbi_ecall_base_probe as well.
> > > As follows:
> > > 
> > > diff --git a/lib/sbi/sbi_ecall_base.c b/lib/sbi/sbi_ecall_base.c
> > > index 786d2ac..e3aa02b 100644
> > > --- a/lib/sbi/sbi_ecall_base.c
> > > +++ b/lib/sbi/sbi_ecall_base.c
> > > @@ -20,15 +20,7 @@ static int sbi_ecall_base_probe(unsigned long extid, unsigned long *out_val)
> > > ??????? struct sbi_ecall_extension *ext;
> > > ?
> > > ??????? ext = sbi_ecall_find_extension(extid);
> > > -?????? if (!ext) {
> > > -?????????????? *out_val = 0;
> > > -?????????????? return 0;
> > > -?????? }
> > > -
> > > -?????? if (ext->probe)
> > > -?????????????? return ext->probe(extid, out_val);
> > > -
> > > -?????? *out_val = 1;
> > > +?????? *out_val = ext ? 1 : 0;
> > > ??????? return 0;
> > > ?}
> > > 
> > 
> > If we do this, then we lose the return value of the extension's probe
> > function, which is currently getting propagated all the way back to
> > the SBI caller. sbi_ecall_base_probe() isn't in a fast path, so even
> > though probe will get invoked twice, I guess we can afford it.
> > 
> > Thanks,
> > drew
> 
> If you don't modify sbi_ecall_base_probe, I don't think we need to modify
> sbi_ecall_find_extension. sbi_ecall_find_extension just find the structure
> of extension. If there is a gap in the id number, the handle and probe
> will definitely handle it.

I'm not sure I follow. The main goal of modifying sbi_ecall_find_extension
is to ensure that we don't call handle unless probe says we can.

Thanks,
drew

