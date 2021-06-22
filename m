From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 22 Jun 2021 14:59:15 +0000
Subject: [PATCH] lib: utils/libfdt: Upgrade to v1.6.1 release
In-Reply-To: <20210611072727.287042-1-bmeng.cn@gmail.com>
References: <20210611072727.287042-1-bmeng.cn@gmail.com>
Message-ID: <87988D4E-009D-42DC-9FC0-B2320BEAD8EE@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



?On 11/06/21, 12:57 PM, "Bin Meng" <bmeng.cn@gmail.com> wrote:

    Sync with libfdt v1.6.1 release source codes.

    Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

    ---

     lib/utils/libfdt/fdt.c             |  39 ++++++---
     lib/utils/libfdt/fdt.h             |   2 +-
     lib/utils/libfdt/fdt_check.c       |  19 ++++
     lib/utils/libfdt/fdt_overlay.c     |   3 +-
     lib/utils/libfdt/fdt_ro.c          |  40 +++++----
     lib/utils/libfdt/fdt_rw.c          |  37 +++++---
     lib/utils/libfdt/fdt_strerror.c    |   4 +-
     lib/utils/libfdt/fdt_sw.c          |  31 ++++---
     lib/utils/libfdt/fdt_wip.c         |   2 +-
     lib/utils/libfdt/libfdt.h          | 134 ++++++++++++++++++++---------
     lib/utils/libfdt/libfdt_internal.h |  19 ++++
     11 files changed, 226 insertions(+), 104 deletions(-)

    diff --git a/lib/utils/libfdt/fdt.c b/lib/utils/libfdt/fdt.c
    index c28fcc1..9fe7cf4 100644
    --- a/lib/utils/libfdt/fdt.c
    +++ b/lib/utils/libfdt/fdt.c
    @@ -22,6 +22,10 @@ int32_t fdt_ro_probe_(const void *fdt)
     	if (can_assume(VALID_DTB))
     		return totalsize;

    +	/* The device tree must be at an 8-byte aligned address */
    +	if ((uintptr_t)fdt & 7)
    +		return -FDT_ERR_ALIGNMENT;
    +
     	if (fdt_magic(fdt) == FDT_MAGIC) {
     		/* Complete tree */
     		if (!can_assume(LATEST)) {
    @@ -86,6 +90,10 @@ int fdt_check_header(const void *fdt)
     {
     	size_t hdrsize;

    +	/* The device tree must be at an 8-byte aligned address */
    +	if ((uintptr_t)fdt & 7)
    +		return -FDT_ERR_ALIGNMENT;
    +
     	if (fdt_magic(fdt) != FDT_MAGIC)
     		return -FDT_ERR_BADMAGIC;
     	if (!can_assume(LATEST)) {
    @@ -134,16 +142,20 @@ int fdt_check_header(const void *fdt)

     const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
     {
    -	unsigned absoffset = offset + fdt_off_dt_struct(fdt);
    +	unsigned int uoffset = offset;
    +	unsigned int absoffset = offset + fdt_off_dt_struct(fdt);
    +
    +	if (offset < 0)
    +		return NULL;

     	if (!can_assume(VALID_INPUT))
    -		if ((absoffset < offset)
    +		if ((absoffset < uoffset)
     		    || ((absoffset + len) < absoffset)
     		    || (absoffset + len) > fdt_totalsize(fdt))
     			return NULL;

     	if (can_assume(LATEST) || fdt_version(fdt) >= 0x11)
    -		if (((offset + len) < offset)
    +		if (((uoffset + len) < uoffset)
     		    || ((offset + len) > fdt_size_dt_struct(fdt)))
     			return NULL;

    @@ -206,10 +218,11 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)

     int fdt_check_node_offset_(const void *fdt, int offset)
     {
    -	if (can_assume(VALID_INPUT))
    -		return offset;
    -	if ((offset < 0) || (offset % FDT_TAGSIZE)
    -	    || (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE))
    +	if (!can_assume(VALID_INPUT)
    +	    && ((offset < 0) || (offset % FDT_TAGSIZE)))
    +		return -FDT_ERR_BADOFFSET;
    +
    +	if (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE)
     		return -FDT_ERR_BADOFFSET;

     	return offset;
    @@ -217,8 +230,11 @@ int fdt_check_node_offset_(const void *fdt, int offset)

     int fdt_check_prop_offset_(const void *fdt, int offset)
     {
    -	if ((offset < 0) || (offset % FDT_TAGSIZE)
    -	    || (fdt_next_tag(fdt, offset, &offset) != FDT_PROP))
    +	if (!can_assume(VALID_INPUT)
    +	    && ((offset < 0) || (offset % FDT_TAGSIZE)))
    +		return -FDT_ERR_BADOFFSET;
    +
    +	if (fdt_next_tag(fdt, offset, &offset) != FDT_PROP)
     		return -FDT_ERR_BADOFFSET;

     	return offset;
    @@ -306,9 +322,12 @@ const char *fdt_find_string_(const char *strtab, int tabsize, const char *s)

     int fdt_move(const void *fdt, void *buf, int bufsize)
     {
    +	if (!can_assume(VALID_INPUT) && bufsize < 0)
    +		return -FDT_ERR_NOSPACE;
    +
     	FDT_RO_PROBE(fdt);

    -	if (fdt_totalsize(fdt) > bufsize)
    +	if (fdt_totalsize(fdt) > (unsigned int)bufsize)
     		return -FDT_ERR_NOSPACE;

     	memmove(buf, fdt, fdt_totalsize(fdt));
    diff --git a/lib/utils/libfdt/fdt.h b/lib/utils/libfdt/fdt.h
    index 57fe566..f2e6880 100644
    --- a/lib/utils/libfdt/fdt.h
    +++ b/lib/utils/libfdt/fdt.h
    @@ -7,7 +7,7 @@
      * Copyright 2012 Kim Phillips, Freescale Semiconductor.
      */

    -#ifndef __ASSEMBLER__
    +#ifndef __ASSEMBLY__

     struct fdt_header {
     	fdt32_t magic;			 /* magic word FDT_MAGIC */
    diff --git a/lib/utils/libfdt/fdt_check.c b/lib/utils/libfdt/fdt_check.c
    index 7f6a96c..fa410a8 100644
    --- a/lib/utils/libfdt/fdt_check.c
    +++ b/lib/utils/libfdt/fdt_check.c
    @@ -19,9 +19,12 @@ int fdt_check_full(const void *fdt, size_t bufsize)
     	unsigned int depth = 0;
     	const void *prop;
     	const char *propname;
    +	bool expect_end = false;

     	if (bufsize < FDT_V1_SIZE)
     		return -FDT_ERR_TRUNCATED;
    +	if (bufsize < fdt_header_size(fdt))
    +		return -FDT_ERR_TRUNCATED;
     	err = fdt_check_header(fdt);
     	if (err != 0)
     		return err;
    @@ -39,6 +42,10 @@ int fdt_check_full(const void *fdt, size_t bufsize)
     		if (nextoffset < 0)
     			return nextoffset;

    +		/* If we see two root nodes, something is wrong */
    +		if (expect_end && tag != FDT_END)
    +			return -FDT_ERR_BADSTRUCTURE;
    +
     		switch (tag) {
     		case FDT_NOP:
     			break;
    @@ -52,12 +59,24 @@ int fdt_check_full(const void *fdt, size_t bufsize)
     			depth++;
     			if (depth > INT_MAX)
     				return -FDT_ERR_BADSTRUCTURE;
    +
    +			/* The root node must have an empty name */
    +			if (depth == 1) {
    +				const char *name;
    +				int len;
    +
    +				name = fdt_get_name(fdt, offset, &len);
    +				if (*name || len)
    +					return -FDT_ERR_BADSTRUCTURE;
    +			}
     			break;

     		case FDT_END_NODE:
     			if (depth == 0)
     				return -FDT_ERR_BADSTRUCTURE;
     			depth--;
    +			if (depth == 0)
    +				expect_end = true;
     			break;

     		case FDT_PROP:
    diff --git a/lib/utils/libfdt/fdt_overlay.c b/lib/utils/libfdt/fdt_overlay.c
    index b310e49..d217e79 100644
    --- a/lib/utils/libfdt/fdt_overlay.c
    +++ b/lib/utils/libfdt/fdt_overlay.c
    @@ -241,6 +241,7 @@ static int overlay_update_local_node_references(void *fdto,

     		if (fixup_len % sizeof(uint32_t))
     			return -FDT_ERR_BADOVERLAY;
    +		fixup_len /= sizeof(uint32_t);

     		tree_val = fdt_getprop(fdto, tree_node, name, &tree_len);
     		if (!tree_val) {
    @@ -250,7 +251,7 @@ static int overlay_update_local_node_references(void *fdto,
     			return tree_len;
     		}

    -		for (i = 0; i < (fixup_len / sizeof(uint32_t)); i++) {
    +		for (i = 0; i < fixup_len; i++) {
     			fdt32_t adj_val;
     			uint32_t poffset;

    diff --git a/lib/utils/libfdt/fdt_ro.c b/lib/utils/libfdt/fdt_ro.c
    index e03570a..17584da 100644
    --- a/lib/utils/libfdt/fdt_ro.c
    +++ b/lib/utils/libfdt/fdt_ro.c
    @@ -53,7 +53,7 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)

     	err = -FDT_ERR_BADOFFSET;
     	absoffset = stroffset + fdt_off_dt_strings(fdt);
    -	if (absoffset >= totalsize)
    +	if (absoffset >= (unsigned)totalsize)
     		goto fail;
     	len = totalsize - absoffset;

    @@ -61,17 +61,19 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
     		if (stroffset < 0)
     			goto fail;
     		if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
    -			if (stroffset >= fdt_size_dt_strings(fdt))
    +			if ((unsigned)stroffset >= fdt_size_dt_strings(fdt))
     				goto fail;
     			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
     				len = fdt_size_dt_strings(fdt) - stroffset;
     		}
     	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
    -		if ((stroffset >= 0)
    -		    || (stroffset < -fdt_size_dt_strings(fdt)))
    +		unsigned int sw_stroffset = -stroffset;
    +
    +		if ((stroffset >= 0) ||
    +		    (sw_stroffset > fdt_size_dt_strings(fdt)))
     			goto fail;
    -		if ((-stroffset) < len)
    -			len = -stroffset;
    +		if (sw_stroffset < len)
    +			len = sw_stroffset;
     	} else {
     		err = -FDT_ERR_INTERNAL;
     		goto fail;
    @@ -157,8 +159,8 @@ int fdt_generate_phandle(const void *fdt, uint32_t *phandle)

     static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
     {
    -	int offset = n * sizeof(struct fdt_reserve_entry);
    -	int absoffset = fdt_off_mem_rsvmap(fdt) + offset;
    +	unsigned int offset = n * sizeof(struct fdt_reserve_entry);
    +	unsigned int absoffset = fdt_off_mem_rsvmap(fdt) + offset;

     	if (!can_assume(VALID_INPUT)) {
     		if (absoffset < fdt_off_mem_rsvmap(fdt))
    @@ -179,8 +181,8 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
     	if (!can_assume(VALID_INPUT) && !re)
     		return -FDT_ERR_BADOFFSET;

    -	*address = fdt64_ld(&re->address);
    -	*size = fdt64_ld(&re->size);
    +	*address = fdt64_ld_(&re->address);
    +	*size = fdt64_ld_(&re->size);
     	return 0;
     }

    @@ -190,7 +192,7 @@ int fdt_num_mem_rsv(const void *fdt)
     	const struct fdt_reserve_entry *re;

     	for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
    -		if (fdt64_ld(&re->size) == 0)
    +		if (fdt64_ld_(&re->size) == 0)
     			return i;
     	}
     	return -FDT_ERR_TRUNCATED;
    @@ -368,7 +370,7 @@ static const struct fdt_property *fdt_get_property_by_offset_(const void *fdt,
     	prop = fdt_offset_ptr_(fdt, offset);

     	if (lenp)
    -		*lenp = fdt32_ld(&prop->len);
    +		*lenp = fdt32_ld_(&prop->len);

     	return prop;
     }
    @@ -406,7 +408,7 @@ static const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
     			offset = -FDT_ERR_INTERNAL;
     			break;
     		}
    -		if (fdt_string_eq_(fdt, fdt32_ld(&prop->nameoff),
    +		if (fdt_string_eq_(fdt, fdt32_ld_(&prop->nameoff),
     				   name, namelen)) {
     			if (poffset)
     				*poffset = offset;
    @@ -459,7 +461,7 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,

     	/* Handle realignment */
     	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
    -	    (poffset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
    +	    (poffset + sizeof(*prop)) % 8 && fdt32_ld_(&prop->len) >= 8)
     		return prop->data + 4;
     	return prop->data;
     }
    @@ -477,7 +479,7 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
     		int namelen;

     		if (!can_assume(VALID_INPUT)) {
    -			name = fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
    +			name = fdt_get_string(fdt, fdt32_ld_(&prop->nameoff),
     					      &namelen);
     			if (!name) {
     				if (lenp)
    @@ -486,13 +488,13 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
     			}
     			*namep = name;
     		} else {
    -			*namep = fdt_string(fdt, fdt32_ld(&prop->nameoff));
    +			*namep = fdt_string(fdt, fdt32_ld_(&prop->nameoff));
     		}
     	}

     	/* Handle realignment */
     	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
    -	    (offset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
    +	    (offset + sizeof(*prop)) % 8 && fdt32_ld_(&prop->len) >= 8)
     		return prop->data + 4;
     	return prop->data;
     }
    @@ -517,7 +519,7 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
     			return 0;
     	}

    -	return fdt32_ld(php);
    +	return fdt32_ld_(php);
     }

     const char *fdt_get_alias_namelen(const void *fdt,
    @@ -680,7 +682,7 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
     {
     	int offset;

    -	if ((phandle == 0) || (phandle == -1))
    +	if ((phandle == 0) || (phandle == ~0U))
     		return -FDT_ERR_BADPHANDLE;

     	FDT_RO_PROBE(fdt);
    diff --git a/lib/utils/libfdt/fdt_rw.c b/lib/utils/libfdt/fdt_rw.c
    index 1385425..3621d36 100644
    --- a/lib/utils/libfdt/fdt_rw.c
    +++ b/lib/utils/libfdt/fdt_rw.c
    @@ -46,7 +46,7 @@ static int fdt_rw_probe_(void *fdt)
     			return err_; \
     	}

    -static inline int fdt_data_size_(void *fdt)
    +static inline unsigned int fdt_data_size_(void *fdt)
     {
     	return fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt);
     }
    @@ -54,15 +54,16 @@ static inline int fdt_data_size_(void *fdt)
     static int fdt_splice_(void *fdt, void *splicepoint, int oldlen, int newlen)
     {
     	char *p = splicepoint;
    -	char *end = (char *)fdt + fdt_data_size_(fdt);
    +	unsigned int dsize = fdt_data_size_(fdt);
    +	size_t soff = p - (char *)fdt;

    -	if (((p + oldlen) < p) || ((p + oldlen) > end))
    +	if ((oldlen < 0) || (soff + oldlen < soff) || (soff + oldlen > dsize))
     		return -FDT_ERR_BADOFFSET;
    -	if ((p < (char *)fdt) || ((end - oldlen + newlen) < (char *)fdt))
    +	if ((p < (char *)fdt) || (dsize + newlen < (unsigned)oldlen))
     		return -FDT_ERR_BADOFFSET;
    -	if ((end - oldlen + newlen) > ((char *)fdt + fdt_totalsize(fdt)))
    +	if (dsize - oldlen + newlen > fdt_totalsize(fdt))
     		return -FDT_ERR_NOSPACE;
    -	memmove(p + newlen, p + oldlen, end - p - oldlen);
    +	memmove(p + newlen, p + oldlen, ((char *)fdt + dsize) - (p + oldlen));
     	return 0;
     }

    @@ -348,7 +349,10 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
     		return offset;

     	/* Try to place the new node after the parent's properties */
    -	fdt_next_tag(fdt, parentoffset, &nextoffset); /* skip the BEGIN_NODE */
    +	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
    +	/* the fdt_subnode_offset_namelen() should ensure this never hits */
    +	if (!can_assume(LIBFDT_FLAWLESS) && (tag != FDT_BEGIN_NODE))
    +		return -FDT_ERR_INTERNAL;
     	do {
     		offset = nextoffset;
     		tag = fdt_next_tag(fdt, offset, &nextoffset);
    @@ -390,7 +394,9 @@ int fdt_del_node(void *fdt, int nodeoffset)
     }

     static void fdt_packblocks_(const char *old, char *new,
    -			    int mem_rsv_size, int struct_size)
    +			    int mem_rsv_size,
    +			    int struct_size,
    +			    int strings_size)
     {
     	int mem_rsv_off, struct_off, strings_off;

    @@ -405,8 +411,7 @@ static void fdt_packblocks_(const char *old, char *new,
     	fdt_set_off_dt_struct(new, struct_off);
     	fdt_set_size_dt_struct(new, struct_size);

    -	memmove(new + strings_off, old + fdt_off_dt_strings(old),
    -		fdt_size_dt_strings(old));
    +	memmove(new + strings_off, old + fdt_off_dt_strings(old), strings_size);
     	fdt_set_off_dt_strings(new, strings_off);
     	fdt_set_size_dt_strings(new, fdt_size_dt_strings(old));
     }
    @@ -427,15 +432,17 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)

     	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
     		struct_size = fdt_size_dt_struct(fdt);
    -	} else {
    +	} else if (fdt_version(fdt) == 16) {
     		struct_size = 0;
     		while (fdt_next_tag(fdt, struct_size, &struct_size) != FDT_END)
     			;
     		if (struct_size < 0)
     			return struct_size;
    +	} else {
    +		return -FDT_ERR_BADVERSION;
     	}

    -	if (can_assume(LIBFDT_ORDER) |
    +	if (can_assume(LIBFDT_ORDER) ||
     	    !fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
     		/* no further work necessary */
     		err = fdt_move(fdt, buf, bufsize);
    @@ -464,7 +471,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
     			return -FDT_ERR_NOSPACE;
     	}

    -	fdt_packblocks_(fdt, tmp, mem_rsv_size, struct_size);
    +	fdt_packblocks_(fdt, tmp, mem_rsv_size, struct_size,
    +			fdt_size_dt_strings(fdt));
     	memmove(buf, tmp, newsize);

     	fdt_set_magic(buf, FDT_MAGIC);
    @@ -484,7 +492,8 @@ int fdt_pack(void *fdt)

     	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
     		* sizeof(struct fdt_reserve_entry);
    -	fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt));
    +	fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt),
    +			fdt_size_dt_strings(fdt));
     	fdt_set_totalsize(fdt, fdt_data_size_(fdt));

     	return 0;
    diff --git a/lib/utils/libfdt/fdt_strerror.c b/lib/utils/libfdt/fdt_strerror.c
    index 768db66..b435693 100644
    --- a/lib/utils/libfdt/fdt_strerror.c
    +++ b/lib/utils/libfdt/fdt_strerror.c
    @@ -40,7 +40,7 @@ static struct fdt_errtabent fdt_errtable[] = {
     	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
     	FDT_ERRTABENT(FDT_ERR_BADFLAGS),
     };
    -#define FDT_ERRTABSIZE	(sizeof(fdt_errtable) / sizeof(fdt_errtable[0]))
    +#define FDT_ERRTABSIZE	((int)(sizeof(fdt_errtable) / sizeof(fdt_errtable[0])))

     const char *fdt_strerror(int errval)
     {
    @@ -48,7 +48,7 @@ const char *fdt_strerror(int errval)
     		return "<valid offset/length>";
     	else if (errval == 0)
     		return "<no error>";
    -	else if (errval > -FDT_ERRTABSIZE) {
    +	else if (-errval < FDT_ERRTABSIZE) {
     		const char *s = fdt_errtable[-errval].str;

     		if (s)
    diff --git a/lib/utils/libfdt/fdt_sw.c b/lib/utils/libfdt/fdt_sw.c
    index 26759d5..4c569ee 100644
    --- a/lib/utils/libfdt/fdt_sw.c
    +++ b/lib/utils/libfdt/fdt_sw.c
    @@ -32,7 +32,7 @@ static int fdt_sw_probe_(void *fdt)
     /* 'memrsv' state:	Initial state after fdt_create()
      *
      * Allowed functions:
    - *	fdt_add_reservmap_entry()
    + *	fdt_add_reservemap_entry()
      *	fdt_finish_reservemap()		[moves to 'struct' state]
      */
     static int fdt_sw_probe_memrsv_(void *fdt)
    @@ -93,8 +93,8 @@ static inline uint32_t sw_flags(void *fdt)

     static void *fdt_grab_space_(void *fdt, size_t len)
     {
    -	int offset = fdt_size_dt_struct(fdt);
    -	int spaceleft;
    +	unsigned int offset = fdt_size_dt_struct(fdt);
    +	unsigned int spaceleft;

     	spaceleft = fdt_totalsize(fdt) - fdt_off_dt_struct(fdt)
     		- fdt_size_dt_strings(fdt);
    @@ -108,8 +108,8 @@ static void *fdt_grab_space_(void *fdt, size_t len)

     int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags)
     {
    -	const size_t hdrsize = FDT_ALIGN(sizeof(struct fdt_header),
    -					 sizeof(struct fdt_reserve_entry));
    +	const int hdrsize = FDT_ALIGN(sizeof(struct fdt_header),
    +				      sizeof(struct fdt_reserve_entry));
     	void *fdt = buf;

     	if (bufsize < hdrsize)
    @@ -152,6 +152,9 @@ int fdt_resize(void *fdt, void *buf, int bufsize)

     	FDT_SW_PROBE(fdt);

    +	if (bufsize < 0)
    +		return -FDT_ERR_NOSPACE;
    +
     	headsize = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
     	tailsize = fdt_size_dt_strings(fdt);

    @@ -159,7 +162,7 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
     	    headsize + tailsize > fdt_totalsize(fdt))
     		return -FDT_ERR_INTERNAL;

    -	if ((headsize + tailsize) > bufsize)
    +	if ((headsize + tailsize) > (unsigned)bufsize)
     		return -FDT_ERR_NOSPACE;

     	oldtail = (char *)fdt + fdt_totalsize(fdt) - tailsize;
    @@ -247,18 +250,18 @@ int fdt_end_node(void *fdt)
     static int fdt_add_string_(void *fdt, const char *s)
     {
     	char *strtab = (char *)fdt + fdt_totalsize(fdt);
    -	int strtabsize = fdt_size_dt_strings(fdt);
    -	int len = strlen(s) + 1;
    -	int struct_top, offset;
    +	unsigned int strtabsize = fdt_size_dt_strings(fdt);
    +	unsigned int len = strlen(s) + 1;
    +	unsigned int struct_top, offset;

    -	offset = -strtabsize - len;
    +	offset = strtabsize + len;
     	struct_top = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
    -	if (fdt_totalsize(fdt) + offset < struct_top)
    +	if (fdt_totalsize(fdt) - offset < struct_top)
     		return 0; /* no more room :( */

    -	memcpy(strtab + offset, s, len);
    +	memcpy(strtab - offset, s, len);
     	fdt_set_size_dt_strings(fdt, strtabsize + len);
    -	return offset;
    +	return -offset;
     }

     /* Must only be used to roll back in case of error */
    @@ -374,7 +377,7 @@ int fdt_finish(void *fdt)
     	fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));

     	/* And fix up fields that were keeping intermediate state. */
    -	fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
    +	fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);
     	fdt_set_magic(fdt, FDT_MAGIC);

     	return 0;
    diff --git a/lib/utils/libfdt/fdt_wip.c b/lib/utils/libfdt/fdt_wip.c
    index f64139e..c2d7566 100644
    --- a/lib/utils/libfdt/fdt_wip.c
    +++ b/lib/utils/libfdt/fdt_wip.c
    @@ -23,7 +23,7 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
     	if (!propval)
     		return proplen;

    -	if (proplen < (len + idx))
    +	if ((unsigned)proplen < (len + idx))
     		return -FDT_ERR_NOSPACE;

     	memcpy((char *)propval + idx, val, len);
    diff --git a/lib/utils/libfdt/libfdt.h b/lib/utils/libfdt/libfdt.h
    index 48f375c..73467f7 100644
    --- a/lib/utils/libfdt/libfdt.h
    +++ b/lib/utils/libfdt/libfdt.h
    @@ -9,7 +9,12 @@
     #include <libfdt_env.h>
     #include <fdt.h>

    +#ifdef __cplusplus
    +extern "C" {
    +#endif
    +
     #define FDT_FIRST_SUPPORTED_VERSION	0x02
    +#define FDT_LAST_COMPATIBLE_VERSION 0x10
     #define FDT_LAST_SUPPORTED_VERSION	0x11

     /* Error codes: informative error codes */
    @@ -97,7 +102,11 @@
     	/* FDT_ERR_BADFLAGS: The function was passed a flags field that
     	 * contains invalid flags or an invalid combination of flags. */

    -#define FDT_ERR_MAX		18
    +#define FDT_ERR_ALIGNMENT	19
    +	/* FDT_ERR_ALIGNMENT: The device tree base address is not 8-byte
    +	 * aligned. */
    +
    +#define FDT_ERR_MAX		19

     /* constants */
     #define FDT_MAX_PHANDLE 0xfffffffe
    @@ -118,12 +127,10 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
     uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);

     /*
    - * Alignment helpers:
    - *     These helpers access words from a device tree blob.  They're
    - *     built to work even with unaligned pointers on platforms (ike
    - *     ARM) that don't like unaligned loads and stores
    + * External helpers to access words from a device tree blob. They're built
    + * to work even with unaligned pointers on platforms (such as ARMv5) that don't
    + * like unaligned loads and stores.
      */
    -
     static inline uint32_t fdt32_ld(const fdt32_t *p)
     {
     	const uint8_t *bp = (const uint8_t *)p;
    @@ -180,23 +187,23 @@ int fdt_next_node(const void *fdt, int offset, int *depth);

     /**
      * fdt_first_subnode() - get offset of first direct subnode
    - *
      * @fdt:	FDT blob
      * @offset:	Offset of node to check
    - * @return offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
    + *
    + * Return: offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
      */
     int fdt_first_subnode(const void *fdt, int offset);

     /**
      * fdt_next_subnode() - get offset of next direct subnode
    + * @fdt:	FDT blob
    + * @offset:	Offset of previous subnode
      *
      * After first calling fdt_first_subnode(), call this function repeatedly to
      * get direct subnodes of a parent node.
      *
    - * @fdt:	FDT blob
    - * @offset:	Offset of previous subnode
    - * @return offset of next subnode, or -FDT_ERR_NOTFOUND if there are no more
    - * subnodes
    + * Return: offset of next subnode, or -FDT_ERR_NOTFOUND if there are no more
    + *         subnodes
      */
     int fdt_next_subnode(const void *fdt, int offset);

    @@ -221,7 +228,6 @@ int fdt_next_subnode(const void *fdt, int offset);
      * Note that this is implemented as a macro and @node is used as
      * iterator in the loop. The parent variable be constant or even a
      * literal.
    - *
      */
     #define fdt_for_each_subnode(node, fdt, parent)		\
     	for (node = fdt_first_subnode(fdt, parent);	\
    @@ -265,17 +271,21 @@ fdt_set_hdr_(size_dt_struct);
     /**
      * fdt_header_size - return the size of the tree's header
      * @fdt: pointer to a flattened device tree
    + *
    + * Return: size of DTB header in bytes
      */
     size_t fdt_header_size(const void *fdt);

     /**
    - * fdt_header_size_ - internal function which takes a version number
    + * fdt_header_size_ - internal function to get header size from a version number
    + * @version: devicetree version number
    + *
    + * Return: size of DTB header in bytes
      */
     size_t fdt_header_size_(uint32_t version);

     /**
      * fdt_check_header - sanity check a device tree header
    -
      * @fdt: pointer to data which might be a flattened device tree
      *
      * fdt_check_header() checks that the given buffer contains what
    @@ -400,8 +410,7 @@ static inline uint32_t fdt_get_max_phandle(const void *fdt)
      * highest phandle value in the device tree blob) will be returned in the
      * @phandle parameter.
      *
    - * Returns:
    - *   0 on success or a negative error-code on failure
    + * Return: 0 on success or a negative error-code on failure
      */
     int fdt_generate_phandle(const void *fdt, uint32_t *phandle);

    @@ -421,9 +430,11 @@ int fdt_num_mem_rsv(const void *fdt);
     /**
      * fdt_get_mem_rsv - retrieve one memory reserve map entry
      * @fdt: pointer to the device tree blob
    - * @address, @size: pointers to 64-bit variables
    + * @n: index of reserve map entry
    + * @address: pointer to 64-bit variable to hold the start address
    + * @size: pointer to 64-bit variable to hold the size of the entry
      *
    - * On success, *address and *size will contain the address and size of
    + * On success, @address and @size will contain the address and size of
      * the n-th reserve map entry from the device tree blob, in
      * native-endian format.
      *
    @@ -446,6 +457,8 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size);
      * namelen characters of name for matching the subnode name.  This is
      * useful for finding subnodes based on a portion of a larger string,
      * such as a full path.
    + *
    + * Return: offset of the subnode or -FDT_ERR_NOTFOUND if name not found.
      */
     #ifndef SWIG /* Not available in Python */
     int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
    @@ -485,6 +498,8 @@ int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
      *
      * Identical to fdt_path_offset(), but only consider the first namelen
      * characters of path as the path name.
    + *
    + * Return: offset of the node or negative libfdt error value otherwise
      */
     #ifndef SWIG /* Not available in Python */
     int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
    @@ -584,9 +599,9 @@ int fdt_next_property_offset(const void *fdt, int offset);
     /**
      * fdt_for_each_property_offset - iterate over all properties of a node
      *
    - * @property_offset:	property offset (int, lvalue)
    - * @fdt:		FDT blob (const void *)
    - * @node:		node offset (int)
    + * @property:	property offset (int, lvalue)
    + * @fdt:	FDT blob (const void *)
    + * @node:	node offset (int)
      *
      * This is actually a wrapper around a for loop and would be used like so:
      *
    @@ -649,6 +664,9 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
      *
      * Identical to fdt_get_property(), but only examine the first namelen
      * characters of name for matching the property name.
    + *
    + * Return: pointer to the structure representing the property, or NULL
    + *         if not found
      */
     #ifndef SWIG /* Not available in Python */
     const struct fdt_property *fdt_get_property_namelen(const void *fdt,
    @@ -741,6 +759,8 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
      *
      * Identical to fdt_getprop(), but only examine the first namelen
      * characters of name for matching the property name.
    + *
    + * Return: pointer to the property's value or NULL on error
      */
     #ifndef SWIG /* Not available in Python */
     const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
    @@ -762,10 +782,10 @@ static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
      * @lenp: pointer to an integer variable (will be overwritten) or NULL
      *
      * fdt_getprop() retrieves a pointer to the value of the property
    - * named 'name' of the node at offset nodeoffset (this will be a
    + * named @name of the node at offset @nodeoffset (this will be a
      * pointer to within the device blob itself, not a copy of the value).
    - * If lenp is non-NULL, the length of the property value is also
    - * returned, in the integer pointed to by lenp.
    + * If @lenp is non-NULL, the length of the property value is also
    + * returned, in the integer pointed to by @lenp.
      *
      * returns:
      *	pointer to the property's value
    @@ -810,8 +830,11 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset);
      * @name: name of the alias th look up
      * @namelen: number of characters of name to consider
      *
    - * Identical to fdt_get_alias(), but only examine the first namelen
    - * characters of name for matching the alias name.
    + * Identical to fdt_get_alias(), but only examine the first @namelen
    + * characters of @name for matching the alias name.
    + *
    + * Return: a pointer to the expansion of the alias named @name, if it exists,
    + *	   NULL otherwise
      */
     #ifndef SWIG /* Not available in Python */
     const char *fdt_get_alias_namelen(const void *fdt,
    @@ -824,7 +847,7 @@ const char *fdt_get_alias_namelen(const void *fdt,
      * @name: name of the alias th look up
      *
      * fdt_get_alias() retrieves the value of a given alias.  That is, the
    - * value of the property named 'name' in the node /aliases.
    + * value of the property named @name in the node /aliases.
      *
      * returns:
      *	a pointer to the expansion of the alias named 'name', if it exists
    @@ -1000,14 +1023,13 @@ int fdt_node_offset_by_prop_value(const void *fdt, int startoffset,
     int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle);

     /**
    - * fdt_node_check_compatible: check a node's compatible property
    + * fdt_node_check_compatible - check a node's compatible property
      * @fdt: pointer to the device tree blob
      * @nodeoffset: offset of a tree node
      * @compatible: string to match against
      *
    - *
      * fdt_node_check_compatible() returns 0 if the given node contains a
    - * 'compatible' property with the given string as one of its elements,
    + * @compatible property with the given string as one of its elements,
      * it returns non-zero otherwise, or on error.
      *
      * returns:
    @@ -1071,7 +1093,7 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
      * one or more strings, each terminated by \0, as is found in a device tree
      * "compatible" property.
      *
    - * @return: 1 if the string is found in the list, 0 not found, or invalid list
    + * Return: 1 if the string is found in the list, 0 not found, or invalid list
      */
     int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);

    @@ -1080,7 +1102,8 @@ int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
      * @fdt: pointer to the device tree blob
      * @nodeoffset: offset of a tree node
      * @property: name of the property containing the string list
    - * @return:
    + *
    + * Return:
      *   the number of strings in the given property
      *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
      *   -FDT_ERR_NOTFOUND if the property does not exist
    @@ -1100,7 +1123,7 @@ int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property);
      * small-valued cell properties, such as #address-cells, when searching for
      * the empty string.
      *
    - * @return:
    + * return:
      *   the index of the string in the list of strings
      *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
      *   -FDT_ERR_NOTFOUND if the property does not exist or does not contain
    @@ -1124,7 +1147,7 @@ int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
      * If non-NULL, the length of the string (on success) or a negative error-code
      * (on failure) will be stored in the integer pointer to by lenp.
      *
    - * @return:
    + * Return:
      *   A pointer to the string at the given index in the string list or NULL on
      *   failure. On success the length of the string will be stored in the memory
      *   location pointed to by the lenp parameter, if non-NULL. On failure one of
    @@ -1213,6 +1236,8 @@ int fdt_size_cells(const void *fdt, int nodeoffset);
      * starting from the given index, and using only the first characters
      * of the name. It is useful when you want to manipulate only one value of
      * an array and you have a string that doesn't end with \0.
    + *
    + * Return: 0 on success, negative libfdt error value otherwise
      */
     #ifndef SWIG /* Not available in Python */
     int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
    @@ -1326,8 +1351,13 @@ static inline int fdt_setprop_inplace_u64(void *fdt, int nodeoffset,

     /**
      * fdt_setprop_inplace_cell - change the value of a single-cell property
    + * @fdt: pointer to the device tree blob
    + * @nodeoffset: offset of the node containing the property
    + * @name: name of the property to change the value of
    + * @val: new value of the 32-bit cell
      *
      * This is an alternative name for fdt_setprop_inplace_u32()
    + * Return: 0 on success, negative libfdt error number otherwise.
      */
     static inline int fdt_setprop_inplace_cell(void *fdt, int nodeoffset,
     					   const char *name, uint32_t val)
    @@ -1399,7 +1429,7 @@ int fdt_nop_node(void *fdt, int nodeoffset);

     /**
      * fdt_create_with_flags - begin creation of a new fdt
    - * @fdt: pointer to memory allocated where fdt will be created
    + * @buf: pointer to memory allocated where fdt will be created
      * @bufsize: size of the memory space at fdt
      * @flags: a valid combination of FDT_CREATE_FLAG_ flags, or 0.
      *
    @@ -1417,7 +1447,7 @@ int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags);

     /**
      * fdt_create - begin creation of a new fdt
    - * @fdt: pointer to memory allocated where fdt will be created
    + * @buf: pointer to memory allocated where fdt will be created
      * @bufsize: size of the memory space at fdt
      *
      * fdt_create() is equivalent to fdt_create_with_flags() with flags=0.
    @@ -1482,7 +1512,8 @@ int fdt_pack(void *fdt);
     /**
      * fdt_add_mem_rsv - add one memory reserve map entry
      * @fdt: pointer to the device tree blob
    - * @address, @size: 64-bit values (native endian)
    + * @address: 64-bit start address of the reserve map entry
    + * @size: 64-bit size of the reserved region
      *
      * Adds a reserve map entry to the given blob reserving a region at
      * address address of length size.
    @@ -1687,8 +1718,14 @@ static inline int fdt_setprop_u64(void *fdt, int nodeoffset, const char *name,

     /**
      * fdt_setprop_cell - set a property to a single cell value
    + * @fdt: pointer to the device tree blob
    + * @nodeoffset: offset of the node whose property to change
    + * @name: name of the property to change
    + * @val: 32-bit integer value for the property (native endian)
      *
      * This is an alternative name for fdt_setprop_u32()
    + *
    + * Return: 0 on success, negative libfdt error value otherwise.
      */
     static inline int fdt_setprop_cell(void *fdt, int nodeoffset, const char *name,
     				   uint32_t val)
    @@ -1859,8 +1896,14 @@ static inline int fdt_appendprop_u64(void *fdt, int nodeoffset,

     /**
      * fdt_appendprop_cell - append a single cell value to a property
    + * @fdt: pointer to the device tree blob
    + * @nodeoffset: offset of the node whose property to change
    + * @name: name of the property to change
    + * @val: 32-bit integer value to append to the property (native endian)
      *
      * This is an alternative name for fdt_appendprop_u32()
    + *
    + * Return: 0 on success, negative libfdt error value otherwise.
      */
     static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
     				      const char *name, uint32_t val)
    @@ -1963,13 +2006,16 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name);
      * fdt_add_subnode_namelen - creates a new node based on substring
      * @fdt: pointer to the device tree blob
      * @parentoffset: structure block offset of a node
    - * @name: name of the subnode to locate
    + * @name: name of the subnode to create
      * @namelen: number of characters of name to consider
      *
    - * Identical to fdt_add_subnode(), but use only the first namelen
    - * characters of name as the name of the new node.  This is useful for
    + * Identical to fdt_add_subnode(), but use only the first @namelen
    + * characters of @name as the name of the new node.  This is useful for
      * creating subnodes based on a portion of a larger string, such as a
      * full path.
    + *
    + * Return: structure block offset of the created subnode (>=0),
    + *	   negative libfdt error value otherwise
      */
     #ifndef SWIG /* Not available in Python */
     int fdt_add_subnode_namelen(void *fdt, int parentoffset,
    @@ -1988,7 +2034,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
      *
      * This function will insert data into the blob, and will therefore
      * change the offsets of some existing nodes.
    -
    + *
      * returns:
      *	structure block offset of the created nodeequested subnode (>=0), on
      *		success
    @@ -2069,4 +2115,8 @@ int fdt_overlay_apply(void *fdt, void *fdto);

     const char *fdt_strerror(int errval);

    +#ifdef __cplusplus
    +}
    +#endif
    +
     #endif /* LIBFDT_H */
    diff --git a/lib/utils/libfdt/libfdt_internal.h b/lib/utils/libfdt/libfdt_internal.h
    index d4e0bd4..16bda19 100644
    --- a/lib/utils/libfdt/libfdt_internal.h
    +++ b/lib/utils/libfdt/libfdt_internal.h
    @@ -46,6 +46,25 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(void *fdt, int n)
     	return (void *)(uintptr_t)fdt_mem_rsv_(fdt, n);
     }

    +/*
    + * Internal helpers to access tructural elements of the device tree
    + * blob (rather than for exaple reading integers from within property
    + * values).  We assume that we are either given a naturally aligned
    + * address for the platform or if we are not, we are on a platform
    + * where unaligned memory reads will be handled in a graceful manner.
    + * If not the external helpers fdtXX_ld() from libfdt.h can be used
    + * instead.
    + */
    +static inline uint32_t fdt32_ld_(const fdt32_t *p)
    +{
    +	return fdt32_to_cpu(*p);
    +}
    +
    +static inline uint64_t fdt64_ld_(const fdt64_t *p)
    +{
    +	return fdt64_to_cpu(*p);
    +}
    +
     #define FDT_SW_MAGIC		(~FDT_MAGIC)

     /**********************************************************************/
    -- 
    2.25.1


