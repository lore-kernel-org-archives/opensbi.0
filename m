From: Xiang W <wxjstz@126.com>
Date: Thu, 27 Apr 2023 15:52:16 +0800
Subject: [PATCH] lib: sbi: Ensure SBI extension is available
In-Reply-To: <7bpjccwxbymemcbxwsbxnbzr5wacty4eyc6niauvxr6u2vfmul@7hrowpl2hrfh>
References: <20230426172753.70664-1-ajones@ventanamicro.com>
	 <f798c3f500849d71aba59a06d4c90ea0e4cb2071.camel@126.com>
	 <jhzdkddibw5j7nje66qxamammxruslfbaz4xshfbykgvcgcozn@rqv44g76lo4w>
	 <7bpjccwxbymemcbxwsbxnbzr5wacty4eyc6niauvxr6u2vfmul@7hrowpl2hrfh>
Message-ID: <96ece7486718e04e85dbd604d34656a7c5f42ee0.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-04-27???? 09:18 +0200?Andrew Jones???
> On Thu, Apr 27, 2023 at 09:00:35AM +0200, Andrew Jones wrote:
> > z4xshfbykgvcgcozn at rqv44g76lo4w>
> > References: <20230426172753.70664-1-ajones@ventanamicro.com>
> > ?<f798c3f500849d71aba59a06d4c90ea0e4cb2071.camel@126.com>
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=utf-8
> > Content-Disposition: inline
> > Content-Transfer-Encoding: 8bit
> > In-Reply-To: <f798c3f500849d71aba59a06d4c90ea0e4cb2071.camel@126.com>
> > 
> > On Thu, Apr 27, 2023 at 09:02:14AM +0800, Xiang W wrote:
> > > ? 2023-04-26???? 19:27 +0200?Andrew Jones???
> > > > Ensure attempts to invoke SBI extension functions fail with
> > > > SBI_ERR_NOT_SUPPORTED when the extension's probe function has
> > > > reported that the extension is not available. By adding a new
> > > > status member to the extension which has three states
> > > > (uninitialized, available, unavailable), we ensure that the
> > > > probe function is only invoked once, lazily, upon first use.
> > > 
> > > Adding this state may cause errors. For example: the id numberof an extension is from extid_start to extid_end, which has an
> > > unused ID. Searching for an ID in this extension will return NULL
> > > if an unused ID is searched first.
> > 
> > Hi Xiang,
> > 
> > You're right. Either sbi_ecall_extension::status needs to be a function of
> > extid, like probe is, or we should just always call probe (when it's
> > available) and leave any optimizations to the individual probe functions.
> > How about this?
> > 
> > diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
> > index 76a1ae9ab733..c86e4e8c9134 100644
> > --- a/lib/sbi/sbi_ecall.c
> > +++ b/lib/sbi/sbi_ecall.c
> > @@ -42,16 +42,18 @@ static SBI_LIST_HEAD(ecall_exts_list);
> > ?
> > ?struct sbi_ecall_extension *sbi_ecall_find_extension(unsigned long extid)
> > ?{
> > -???????struct sbi_ecall_extension *t, *ret = NULL;
> > +???????struct sbi_ecall_extension *t;
> > +???????unsigned long out_val;
> > ?
> > ????????sbi_list_for_each_entry(t, &ecall_exts_list, head) {
> > ????????????????if (t->extid_start <= extid && extid <= t->extid_end) {
> > -???????????????????????ret = t;
> > -???????????????????????break;
> > +???????????????????????if (t->probe && (t->probe(extid, &out_val) || !out_val))
> > +???????????????????????????????return NULL;
> > +???????????????????????return t;
> > ????????????????}
> > ????????}
> > ?
> > -???????return ret;
> > +???????return NULL;
> > ?}
> > ?
> > ?int sbi_ecall_register_extension(struct sbi_ecall_extension *ext)
> 
> And, as a separate patch, to optimize probing of srst, which has a single
> extid for its range, and therefore doesn't care about it in its probe,
> 
> diff --git a/lib/sbi/sbi_ecall_srst.c b/lib/sbi/sbi_ecall_srst.c
> index 93b012ce024c..f2690b80775a 100644
> --- a/lib/sbi/sbi_ecall_srst.c
> +++ b/lib/sbi/sbi_ecall_srst.c
> @@ -50,8 +50,15 @@ static int sbi_ecall_srst_handler(unsigned long extid, unsigned long funcid,
> ?
> ?static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
> ?{
> +???????static bool probed = false;
> +???????static unsigned long val;
> ????????u32 type, count = 0;
> ?
> +???????if (probed) {
> +???????????????*out_val = val;
> +???????????????return 0;
> +???????}
> +
> ????????/*
> ???????? * At least one standard reset types should be supported by
> ???????? * the platform for SBI SRST extension to be usable.
> @@ -63,7 +70,8 @@ static int sbi_ecall_srst_probe(unsigned long extid, unsigned long *out_val)
> ????????????????????????count++;
> ????????}
> ?
> -???????*out_val = (count) ? 1 : 0;
> +???????*out_val = val = (count) ? 1 : 0;
> +???????probed = true;
> ????????return 0;
> ?}
> 
> And susp can be optimized in exactly the same way.
> 
> Thanks,
> drew
> 

This can be a generic optimization. Since most extensions have only
one extension id, here is my suggestion

diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c
index 76a1ae9..900a4fa 100644
--- a/lib/sbi/sbi_ecall.c
+++ b/lib/sbi/sbi_ecall.c
@@ -42,16 +42,26 @@ static SBI_LIST_HEAD(ecall_exts_list);
 
 struct sbi_ecall_extension *sbi_ecall_find_extension(unsigned long extid)
 {
-       struct sbi_ecall_extension *t, *ret = NULL;
+       struct sbi_ecall_extension *t;
 
        sbi_list_for_each_entry(t, &ecall_exts_list, head) {
                if (t->extid_start <= extid && extid <= t->extid_end) {
-                       ret = t;
-                       break;
+                       if (t->extid_start == t->extid_end) {
+                               if (t->status == SBI_EXT_AVAILABLE)
+                                       return t;
+                               if (t->status == SBI_EXT_UNAVAILABLE)
+                                       return NULL;
+                       }
+                       if (t->probe && (t->probe(extid, &out_val) || !out_val)) {
+                               t->status = SBI_EXT_UNAVAILABLE;
+                               return NULL
+                       }
+                       t->status = SBI_EXT_AVAILABLE;
+                       return t;
                }
        }
 
-       return ret;
+       return NULL;
 }
 






