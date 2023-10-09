From: Xiang W <wxjstz@126.com>
Date: Mon, 09 Oct 2023 17:25:09 +0800
Subject: [PATCH 0/3] Sparse HART id improvements
In-Reply-To: <CAAhSdy119qy6zksV6ofVf_iy1nTJsGTwNNhKEUiFqNYjaL+fEw@mail.gmail.com>
References: <20230924155745.1753120-1-wxjstz@126.com>
	 <CAAhSdy2iZruS48CqB9UDiaqL57KD7zX+DxsC-M8ArmxX8soWzg@mail.gmail.com>
	 <6ce921ad7d4ff85737d4605163e70abb451f910c.camel@126.com>
	 <CAAhSdy119qy6zksV6ofVf_iy1nTJsGTwNNhKEUiFqNYjaL+fEw@mail.gmail.com>
Message-ID: <dee74ff21f4e73f7394d541361a3f65cc35adebe.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-10-09???? 14:06 +0530?Anup Patel???
> On Sat, Oct 7, 2023 at 9:19?AM Xiang W <wxjstz@126.com> wrote:
> > 
> > ? 2023-10-06???? 10:05 +0530?Anup Patel???
> > > On Sun, Sep 24, 2023 at 9:28?PM Xiang W <wxjstz@126.com> wrote:
> > > > 
> > > > Modify last_hartindex_having_scratch/hartindex_to_hartid_table
> > > > /hartindex_to_scratch_table as static variables to prevent accidental
> > > > modification and reduce memory consumption
> > > > 
> > > > Xiang W (3):
> > > > ? lib: sbi: Refactor sbi_scratch_last_hartindex as a function
> > > > ? lib: sbi: Refactor sbi_hartindex_to_hartid as a function
> > > > ? lib: sbi: Refactor sbi_hartindex_to_scratch as a function
> > > 
> > > All these are in hot-path at various places so introducing a
> > > function is certainly not helping.
> > > 
> > > Also, if some buggy code is accidentally modifying global data
> > > then that buggy code should be fixed rather than papering over
> > > the problem by introducing these functions.
> > PATCH1:
> > The original code is a bit strange in that there is already a global variable
> > last_hartindex_having_scratch, but instead of using it outside of sbi_scratch.c,
> > the macro sbi_scratch_last_hartindex is used. If don't want to modify this macro
> > into a function, why not just change the name of the last_hartindex_having_scratch
> > renamed to sbi_scratch_last_hartindex and then remove the macro?
> 
> The sbi_scratch_last_hartindex() macro allows adding instrumentation
> code for debugging purposes. The caller of sbi_scratch_last_hartindex()
> should not care about how it is implemented.
> 
> > 
> > PATCH2:
> > The arrays hartindex_to_hartid_table and plat->hart_index2id store similar content,
> > and the extra length of the hartindex_to_hartid_table array is not used because
> > there is a determination of whether the index is less than sbi_scratch_last_ hartindex.
> > the array can be removed by adding just a little bit of checking.
> 
> The "plat->hart_index2id" is optional and can be NULL as well so
> we have to always use "if ()" before accessing "plat->hart_index2id".
> 
> Also, we always have to access "hart_index2id[]" via "plat" pointer
> which is slower compared to a global array like "hartindex_to_hartid_table[]".
My expression may not be very accurate, please review my code.
https://lists.infradead.org/pipermail/opensbi/2023-October/005703.html

Regards,
Xiang W
> 
> Regards,
> Anup
> 
> > 
> > Regards,
> > Xiang W
> > > 
> > > Regards,
> > > Anup
> > > 
> > > > 
> > > > ?include/sbi/sbi_scratch.h | 35 ++++++++++++-----------------------
> > > > ?lib/sbi/sbi_scratch.c???? | 30 ++++++++++++++++++++++++++----
> > > > ?2 files changed, 38 insertions(+), 27 deletions(-)
> > > > 
> > > > --
> > > > 2.40.1
> > > > 
> > > > 
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > 


