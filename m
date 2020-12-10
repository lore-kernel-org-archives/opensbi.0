From: Dimitri John Ledkov <xnox@ubuntu.com>
Date: Thu, 10 Dec 2020 11:03:57 +0000
Subject: [PATCH] libfdt: Upgrade to v1.6.0 release
Message-ID: <20201210110357.3549503-1-xnox@ubuntu.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sync with libfdt v1.6.0 release source codes.

Signed-off-by: Dimitri John Ledkov <xnox@ubuntu.com>
---
 Also submitted on github at https://github.com/riscv/opensbi/pull/186/files

 lib/utils/libfdt/Makefile.libfdt   |   2 +-
 lib/utils/libfdt/fdt.c             |  99 ++++++++++++--------
 lib/utils/libfdt/fdt_check.c       |  74 +++++++++++++++
 lib/utils/libfdt/fdt_overlay.c     |   2 +-
 lib/utils/libfdt/fdt_ro.c          | 143 ++++++++++-------------------
 lib/utils/libfdt/fdt_rw.c          |  29 ++++--
 lib/utils/libfdt/fdt_sw.c          |  19 ++--
 lib/utils/libfdt/libfdt.h          |  13 +--
 lib/utils/libfdt/libfdt_internal.h | 126 ++++++++++++++++++++++++-
 lib/utils/libfdt/objects.mk        |   2 +-
 lib/utils/libfdt/version.lds       |   1 +
 11 files changed, 356 insertions(+), 154 deletions(-)
 create mode 100644 lib/utils/libfdt/fdt_check.c

diff --git a/lib/utils/libfdt/Makefile.libfdt b/lib/utils/libfdt/Makefile.libfdt
index e546397..b6d8fc0 100644
--- a/lib/utils/libfdt/Makefile.libfdt
+++ b/lib/utils/libfdt/Makefile.libfdt
@@ -8,7 +8,7 @@ LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
 LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
 LIBFDT_VERSION = version.lds
 LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c \
-	fdt_addresses.c fdt_overlay.c
+	fdt_addresses.c fdt_overlay.c fdt_check.c
 LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
 LIBFDT_LIB = libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT)
 
diff --git a/lib/utils/libfdt/fdt.c b/lib/utils/libfdt/fdt.c
index d6ce7c0..c28fcc1 100644
--- a/lib/utils/libfdt/fdt.c
+++ b/lib/utils/libfdt/fdt.c
@@ -19,15 +19,21 @@ int32_t fdt_ro_probe_(const void *fdt)
 {
 	uint32_t totalsize = fdt_totalsize(fdt);
 
+	if (can_assume(VALID_DTB))
+		return totalsize;
+
 	if (fdt_magic(fdt) == FDT_MAGIC) {
 		/* Complete tree */
-		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
-			return -FDT_ERR_BADVERSION;
-		if (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION)
-			return -FDT_ERR_BADVERSION;
+		if (!can_assume(LATEST)) {
+			if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
+				return -FDT_ERR_BADVERSION;
+			if (fdt_last_comp_version(fdt) >
+					FDT_LAST_SUPPORTED_VERSION)
+				return -FDT_ERR_BADVERSION;
+		}
 	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
 		/* Unfinished sequential-write blob */
-		if (fdt_size_dt_struct(fdt) == 0)
+		if (!can_assume(VALID_INPUT) && fdt_size_dt_struct(fdt) == 0)
 			return -FDT_ERR_BADSTATE;
 	} else {
 		return -FDT_ERR_BADMAGIC;
@@ -70,44 +76,59 @@ size_t fdt_header_size_(uint32_t version)
 		return FDT_V17_SIZE;
 }
 
+size_t fdt_header_size(const void *fdt)
+{
+	return can_assume(LATEST) ? FDT_V17_SIZE :
+		fdt_header_size_(fdt_version(fdt));
+}
+
 int fdt_check_header(const void *fdt)
 {
 	size_t hdrsize;
 
 	if (fdt_magic(fdt) != FDT_MAGIC)
 		return -FDT_ERR_BADMAGIC;
+	if (!can_assume(LATEST)) {
+		if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
+		    || (fdt_last_comp_version(fdt) >
+			FDT_LAST_SUPPORTED_VERSION))
+			return -FDT_ERR_BADVERSION;
+		if (fdt_version(fdt) < fdt_last_comp_version(fdt))
+			return -FDT_ERR_BADVERSION;
+	}
 	hdrsize = fdt_header_size(fdt);
-	if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
-	    || (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION))
-		return -FDT_ERR_BADVERSION;
-	if (fdt_version(fdt) < fdt_last_comp_version(fdt))
-		return -FDT_ERR_BADVERSION;
-
-	if ((fdt_totalsize(fdt) < hdrsize)
-	    || (fdt_totalsize(fdt) > INT_MAX))
-		return -FDT_ERR_TRUNCATED;
+	if (!can_assume(VALID_DTB)) {
 
-	/* Bounds check memrsv block */
-	if (!check_off_(hdrsize, fdt_totalsize(fdt), fdt_off_mem_rsvmap(fdt)))
-		return -FDT_ERR_TRUNCATED;
+		if ((fdt_totalsize(fdt) < hdrsize)
+		    || (fdt_totalsize(fdt) > INT_MAX))
+			return -FDT_ERR_TRUNCATED;
 
-	/* Bounds check structure block */
-	if (fdt_version(fdt) < 17) {
+		/* Bounds check memrsv block */
 		if (!check_off_(hdrsize, fdt_totalsize(fdt),
-				fdt_off_dt_struct(fdt)))
+				fdt_off_mem_rsvmap(fdt)))
 			return -FDT_ERR_TRUNCATED;
-	} else {
+	}
+
+	if (!can_assume(VALID_DTB)) {
+		/* Bounds check structure block */
+		if (!can_assume(LATEST) && fdt_version(fdt) < 17) {
+			if (!check_off_(hdrsize, fdt_totalsize(fdt),
+					fdt_off_dt_struct(fdt)))
+				return -FDT_ERR_TRUNCATED;
+		} else {
+			if (!check_block_(hdrsize, fdt_totalsize(fdt),
+					  fdt_off_dt_struct(fdt),
+					  fdt_size_dt_struct(fdt)))
+				return -FDT_ERR_TRUNCATED;
+		}
+
+		/* Bounds check strings block */
 		if (!check_block_(hdrsize, fdt_totalsize(fdt),
-				  fdt_off_dt_struct(fdt),
-				  fdt_size_dt_struct(fdt)))
+				  fdt_off_dt_strings(fdt),
+				  fdt_size_dt_strings(fdt)))
 			return -FDT_ERR_TRUNCATED;
 	}
 
-	/* Bounds check strings block */
-	if (!check_block_(hdrsize, fdt_totalsize(fdt),
-			  fdt_off_dt_strings(fdt), fdt_size_dt_strings(fdt)))
-		return -FDT_ERR_TRUNCATED;
-
 	return 0;
 }
 
@@ -115,12 +136,13 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 {
 	unsigned absoffset = offset + fdt_off_dt_struct(fdt);
 
-	if ((absoffset < offset)
-	    || ((absoffset + len) < absoffset)
-	    || (absoffset + len) > fdt_totalsize(fdt))
-		return NULL;
+	if (!can_assume(VALID_INPUT))
+		if ((absoffset < offset)
+		    || ((absoffset + len) < absoffset)
+		    || (absoffset + len) > fdt_totalsize(fdt))
+			return NULL;
 
-	if (fdt_version(fdt) >= 0x11)
+	if (can_assume(LATEST) || fdt_version(fdt) >= 0x11)
 		if (((offset + len) < offset)
 		    || ((offset + len) > fdt_size_dt_struct(fdt)))
 			return NULL;
@@ -137,7 +159,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 
 	*nextoffset = -FDT_ERR_TRUNCATED;
 	tagp = fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
-	if (!tagp)
+	if (!can_assume(VALID_DTB) && !tagp)
 		return FDT_END; /* premature end */
 	tag = fdt32_to_cpu(*tagp);
 	offset += FDT_TAGSIZE;
@@ -149,18 +171,19 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		do {
 			p = fdt_offset_ptr(fdt, offset++, 1);
 		} while (p && (*p != '\0'));
-		if (!p)
+		if (!can_assume(VALID_DTB) && !p)
 			return FDT_END; /* premature end */
 		break;
 
 	case FDT_PROP:
 		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
-		if (!lenp)
+		if (!can_assume(VALID_DTB) && !lenp)
 			return FDT_END; /* premature end */
 		/* skip-name offset, length and value */
 		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
 			+ fdt32_to_cpu(*lenp);
-		if (fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
+		if (!can_assume(LATEST) &&
+		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
 		    ((offset - fdt32_to_cpu(*lenp)) % 8) != 0)
 			offset += 4;
 		break;
@@ -183,6 +206,8 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 
 int fdt_check_node_offset_(const void *fdt, int offset)
 {
+	if (can_assume(VALID_INPUT))
+		return offset;
 	if ((offset < 0) || (offset % FDT_TAGSIZE)
 	    || (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE))
 		return -FDT_ERR_BADOFFSET;
diff --git a/lib/utils/libfdt/fdt_check.c b/lib/utils/libfdt/fdt_check.c
new file mode 100644
index 0000000..7f6a96c
--- /dev/null
+++ b/lib/utils/libfdt/fdt_check.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * libfdt - Flat Device Tree manipulation
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
+ */
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+int fdt_check_full(const void *fdt, size_t bufsize)
+{
+	int err;
+	int num_memrsv;
+	int offset, nextoffset = 0;
+	uint32_t tag;
+	unsigned int depth = 0;
+	const void *prop;
+	const char *propname;
+
+	if (bufsize < FDT_V1_SIZE)
+		return -FDT_ERR_TRUNCATED;
+	err = fdt_check_header(fdt);
+	if (err != 0)
+		return err;
+	if (bufsize < fdt_totalsize(fdt))
+		return -FDT_ERR_TRUNCATED;
+
+	num_memrsv = fdt_num_mem_rsv(fdt);
+	if (num_memrsv < 0)
+		return num_memrsv;
+
+	while (1) {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+
+		if (nextoffset < 0)
+			return nextoffset;
+
+		switch (tag) {
+		case FDT_NOP:
+			break;
+
+		case FDT_END:
+			if (depth != 0)
+				return -FDT_ERR_BADSTRUCTURE;
+			return 0;
+
+		case FDT_BEGIN_NODE:
+			depth++;
+			if (depth > INT_MAX)
+				return -FDT_ERR_BADSTRUCTURE;
+			break;
+
+		case FDT_END_NODE:
+			if (depth == 0)
+				return -FDT_ERR_BADSTRUCTURE;
+			depth--;
+			break;
+
+		case FDT_PROP:
+			prop = fdt_getprop_by_offset(fdt, offset, &propname,
+						     &err);
+			if (!prop)
+				return err;
+			break;
+
+		default:
+			return -FDT_ERR_INTERNAL;
+		}
+	}
+}
diff --git a/lib/utils/libfdt/fdt_overlay.c b/lib/utils/libfdt/fdt_overlay.c
index be71873..b310e49 100644
--- a/lib/utils/libfdt/fdt_overlay.c
+++ b/lib/utils/libfdt/fdt_overlay.c
@@ -752,7 +752,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
 			/* /<fragment-name>/__overlay__/<relative-subnode-path> */
 			rel_path = s + len;
-			rel_path_len = e - rel_path;
+			rel_path_len = e - rel_path - 1;
 		} else if ((e - s) == len
 			   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
 			/* /<fragment-name>/__overlay__ */
diff --git a/lib/utils/libfdt/fdt_ro.c b/lib/utils/libfdt/fdt_ro.c
index a5c2797..e03570a 100644
--- a/lib/utils/libfdt/fdt_ro.c
+++ b/lib/utils/libfdt/fdt_ro.c
@@ -33,17 +33,26 @@ static int fdt_nodename_eq_(const void *fdt, int offset,
 
 const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 {
-	int32_t totalsize = fdt_ro_probe_(fdt);
-	uint32_t absoffset = stroffset + fdt_off_dt_strings(fdt);
+	int32_t totalsize;
+	uint32_t absoffset;
 	size_t len;
 	int err;
 	const char *s, *n;
 
+	if (can_assume(VALID_INPUT)) {
+		s = (const char *)fdt + fdt_off_dt_strings(fdt) + stroffset;
+
+		if (lenp)
+			*lenp = strlen(s);
+		return s;
+	}
+	totalsize = fdt_ro_probe_(fdt);
 	err = totalsize;
 	if (totalsize < 0)
 		goto fail;
 
 	err = -FDT_ERR_BADOFFSET;
+	absoffset = stroffset + fdt_off_dt_strings(fdt);
 	if (absoffset >= totalsize)
 		goto fail;
 	len = totalsize - absoffset;
@@ -51,7 +60,7 @@ const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
 	if (fdt_magic(fdt) == FDT_MAGIC) {
 		if (stroffset < 0)
 			goto fail;
-		if (fdt_version(fdt) >= 17) {
+		if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 			if (stroffset >= fdt_size_dt_strings(fdt))
 				goto fail;
 			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
@@ -151,10 +160,13 @@ static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
 	int offset = n * sizeof(struct fdt_reserve_entry);
 	int absoffset = fdt_off_mem_rsvmap(fdt) + offset;
 
-	if (absoffset < fdt_off_mem_rsvmap(fdt))
-		return NULL;
-	if (absoffset > fdt_totalsize(fdt) - sizeof(struct fdt_reserve_entry))
-		return NULL;
+	if (!can_assume(VALID_INPUT)) {
+		if (absoffset < fdt_off_mem_rsvmap(fdt))
+			return NULL;
+		if (absoffset > fdt_totalsize(fdt) -
+		    sizeof(struct fdt_reserve_entry))
+			return NULL;
+	}
 	return fdt_mem_rsv_(fdt, n);
 }
 
@@ -164,7 +176,7 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 
 	FDT_RO_PROBE(fdt);
 	re = fdt_mem_rsv(fdt, n);
-	if (!re)
+	if (!can_assume(VALID_INPUT) && !re)
 		return -FDT_ERR_BADOFFSET;
 
 	*address = fdt64_ld(&re->address);
@@ -295,7 +307,7 @@ const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 
 	nameptr = nh->name;
 
-	if (fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
 		/*
 		 * For old FDT versions, match the naming conventions of V16:
 		 * give only the leaf name (after all /). The actual tree
@@ -346,7 +358,8 @@ static const struct fdt_property *fdt_get_property_by_offset_(const void *fdt,
 	int err;
 	const struct fdt_property *prop;
 
-	if ((err = fdt_check_prop_offset_(fdt, offset)) < 0) {
+	if (!can_assume(VALID_INPUT) &&
+	    (err = fdt_check_prop_offset_(fdt, offset)) < 0) {
 		if (lenp)
 			*lenp = err;
 		return NULL;
@@ -367,7 +380,7 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
 	/* Prior to version 16, properties may need realignment
 	 * and this API does not work. fdt_getprop_*() will, however. */
 
-	if (fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
 		if (lenp)
 			*lenp = -FDT_ERR_BADVERSION;
 		return NULL;
@@ -388,7 +401,8 @@ static const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
 	     (offset = fdt_next_property_offset(fdt, offset))) {
 		const struct fdt_property *prop;
 
-		if (!(prop = fdt_get_property_by_offset_(fdt, offset, lenp))) {
+		prop = fdt_get_property_by_offset_(fdt, offset, lenp);
+		if (!can_assume(LIBFDT_FLAWLESS) && !prop) {
 			offset = -FDT_ERR_INTERNAL;
 			break;
 		}
@@ -413,7 +427,7 @@ const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 {
 	/* Prior to version 16, properties may need realignment
 	 * and this API does not work. fdt_getprop_*() will, however. */
-	if (fdt_version(fdt) < 0x10) {
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
 		if (lenp)
 			*lenp = -FDT_ERR_BADVERSION;
 		return NULL;
@@ -444,8 +458,8 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 		return NULL;
 
 	/* Handle realignment */
-	if (fdt_version(fdt) < 0x10 && (poffset + sizeof(*prop)) % 8 &&
-	    fdt32_ld(&prop->len) >= 8)
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
+	    (poffset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
@@ -461,19 +475,24 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 	if (namep) {
 		const char *name;
 		int namelen;
-		name = fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
-				      &namelen);
-		if (!name) {
-			if (lenp)
-				*lenp = namelen;
-			return NULL;
+
+		if (!can_assume(VALID_INPUT)) {
+			name = fdt_get_string(fdt, fdt32_ld(&prop->nameoff),
+					      &namelen);
+			if (!name) {
+				if (lenp)
+					*lenp = namelen;
+				return NULL;
+			}
+			*namep = name;
+		} else {
+			*namep = fdt_string(fdt, fdt32_ld(&prop->nameoff));
 		}
-		*namep = name;
 	}
 
 	/* Handle realignment */
-	if (fdt_version(fdt) < 0x10 && (offset + sizeof(*prop)) % 8 &&
-	    fdt32_ld(&prop->len) >= 8)
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
+	    (offset + sizeof(*prop)) % 8 && fdt32_ld(&prop->len) >= 8)
 		return prop->data + 4;
 	return prop->data;
 }
@@ -598,10 +617,12 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
 		}
 	}
 
-	if ((offset == -FDT_ERR_NOTFOUND) || (offset >= 0))
-		return -FDT_ERR_BADOFFSET;
-	else if (offset == -FDT_ERR_BADOFFSET)
-		return -FDT_ERR_BADSTRUCTURE;
+	if (!can_assume(VALID_INPUT)) {
+		if ((offset == -FDT_ERR_NOTFOUND) || (offset >= 0))
+			return -FDT_ERR_BADOFFSET;
+		else if (offset == -FDT_ERR_BADOFFSET)
+			return -FDT_ERR_BADSTRUCTURE;
+	}
 
 	return offset; /* error from fdt_next_node() */
 }
@@ -613,7 +634,8 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
 
 	err = fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
 	if (err)
-		return (err < 0) ? err : -FDT_ERR_INTERNAL;
+		return (can_assume(LIBFDT_FLAWLESS) || err < 0) ? err :
+			-FDT_ERR_INTERNAL;
 	return nodedepth;
 }
 
@@ -833,66 +855,3 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
 
 	return offset; /* error from fdt_next_node() */
 }
-
-int fdt_check_full(const void *fdt, size_t bufsize)
-{
-	int err;
-	int num_memrsv;
-	int offset, nextoffset = 0;
-	uint32_t tag;
-	unsigned depth = 0;
-	const void *prop;
-	const char *propname;
-
-	if (bufsize < FDT_V1_SIZE)
-		return -FDT_ERR_TRUNCATED;
-	err = fdt_check_header(fdt);
-	if (err != 0)
-		return err;
-	if (bufsize < fdt_totalsize(fdt))
-		return -FDT_ERR_TRUNCATED;
-
-	num_memrsv = fdt_num_mem_rsv(fdt);
-	if (num_memrsv < 0)
-		return num_memrsv;
-
-	while (1) {
-		offset = nextoffset;
-		tag = fdt_next_tag(fdt, offset, &nextoffset);
-
-		if (nextoffset < 0)
-			return nextoffset;
-
-		switch (tag) {
-		case FDT_NOP:
-			break;
-
-		case FDT_END:
-			if (depth != 0)
-				return -FDT_ERR_BADSTRUCTURE;
-			return 0;
-
-		case FDT_BEGIN_NODE:
-			depth++;
-			if (depth > INT_MAX)
-				return -FDT_ERR_BADSTRUCTURE;
-			break;
-
-		case FDT_END_NODE:
-			if (depth == 0)
-				return -FDT_ERR_BADSTRUCTURE;
-			depth--;
-			break;
-
-		case FDT_PROP:
-			prop = fdt_getprop_by_offset(fdt, offset, &propname,
-						     &err);
-			if (!prop)
-				return err;
-			break;
-
-		default:
-			return -FDT_ERR_INTERNAL;
-		}
-	}
-}
diff --git a/lib/utils/libfdt/fdt_rw.c b/lib/utils/libfdt/fdt_rw.c
index 8795947..1385425 100644
--- a/lib/utils/libfdt/fdt_rw.c
+++ b/lib/utils/libfdt/fdt_rw.c
@@ -24,14 +24,16 @@ static int fdt_blocks_misordered_(const void *fdt,
 
 static int fdt_rw_probe_(void *fdt)
 {
+	if (can_assume(VALID_DTB))
+		return 0;
 	FDT_RO_PROBE(fdt);
 
-	if (fdt_version(fdt) < 17)
+	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
 		return -FDT_ERR_BADVERSION;
 	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
 				   fdt_size_dt_struct(fdt)))
 		return -FDT_ERR_BADLAYOUT;
-	if (fdt_version(fdt) > 17)
+	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
 		fdt_set_version(fdt, 17);
 
 	return 0;
@@ -112,6 +114,15 @@ static int fdt_splice_string_(void *fdt, int newlen)
 	return 0;
 }
 
+/**
+ * fdt_find_add_string_() - Find or allocate a string
+ *
+ * @fdt: pointer to the device tree to check/adjust
+ * @s: string to find/add
+ * @allocated: Set to 0 if the string was found, 1 if not found and so
+ *	allocated. Ignored if can_assume(NO_ROLLBACK)
+ * @return offset of string in the string table (whether found or added)
+ */
 static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
 {
 	char *strtab = (char *)fdt + fdt_off_dt_strings(fdt);
@@ -120,7 +131,8 @@ static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
 	int len = strlen(s) + 1;
 	int err;
 
-	*allocated = 0;
+	if (!can_assume(NO_ROLLBACK))
+		*allocated = 0;
 
 	p = fdt_find_string_(strtab, fdt_size_dt_strings(fdt), s);
 	if (p)
@@ -132,7 +144,8 @@ static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
 	if (err)
 		return err;
 
-	*allocated = 1;
+	if (!can_assume(NO_ROLLBACK))
+		*allocated = 1;
 
 	memcpy(new, s, len);
 	return (new - strtab);
@@ -206,7 +219,8 @@ static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 
 	err = fdt_splice_struct_(fdt, *prop, 0, proplen);
 	if (err) {
-		if (allocated)
+		/* Delete the string if we failed to add it */
+		if (!can_assume(NO_ROLLBACK) && allocated)
 			fdt_del_last_string_(fdt, name);
 		return err;
 	}
@@ -411,7 +425,7 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
 		* sizeof(struct fdt_reserve_entry);
 
-	if (fdt_version(fdt) >= 17) {
+	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 		struct_size = fdt_size_dt_struct(fdt);
 	} else {
 		struct_size = 0;
@@ -421,7 +435,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 			return struct_size;
 	}
 
-	if (!fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
+	if (can_assume(LIBFDT_ORDER) |
+	    !fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
 		/* no further work necessary */
 		err = fdt_move(fdt, buf, bufsize);
 		if (err)
diff --git a/lib/utils/libfdt/fdt_sw.c b/lib/utils/libfdt/fdt_sw.c
index 76bea22..26759d5 100644
--- a/lib/utils/libfdt/fdt_sw.c
+++ b/lib/utils/libfdt/fdt_sw.c
@@ -12,10 +12,13 @@
 
 static int fdt_sw_probe_(void *fdt)
 {
-	if (fdt_magic(fdt) == FDT_MAGIC)
-		return -FDT_ERR_BADSTATE;
-	else if (fdt_magic(fdt) != FDT_SW_MAGIC)
-		return -FDT_ERR_BADMAGIC;
+	if (!can_assume(VALID_INPUT)) {
+		if (fdt_magic(fdt) == FDT_MAGIC)
+			return -FDT_ERR_BADSTATE;
+		else if (fdt_magic(fdt) != FDT_SW_MAGIC)
+			return -FDT_ERR_BADMAGIC;
+	}
+
 	return 0;
 }
 
@@ -38,7 +41,7 @@ static int fdt_sw_probe_memrsv_(void *fdt)
 	if (err)
 		return err;
 
-	if (fdt_off_dt_strings(fdt) != 0)
+	if (!can_assume(VALID_INPUT) && fdt_off_dt_strings(fdt) != 0)
 		return -FDT_ERR_BADSTATE;
 	return 0;
 }
@@ -64,7 +67,8 @@ static int fdt_sw_probe_struct_(void *fdt)
 	if (err)
 		return err;
 
-	if (fdt_off_dt_strings(fdt) != fdt_totalsize(fdt))
+	if (!can_assume(VALID_INPUT) &&
+	    fdt_off_dt_strings(fdt) != fdt_totalsize(fdt))
 		return -FDT_ERR_BADSTATE;
 	return 0;
 }
@@ -151,7 +155,8 @@ int fdt_resize(void *fdt, void *buf, int bufsize)
 	headsize = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
 	tailsize = fdt_size_dt_strings(fdt);
 
-	if ((headsize + tailsize) > fdt_totalsize(fdt))
+	if (!can_assume(VALID_DTB) &&
+	    headsize + tailsize > fdt_totalsize(fdt))
 		return -FDT_ERR_INTERNAL;
 
 	if ((headsize + tailsize) > bufsize)
diff --git a/lib/utils/libfdt/libfdt.h b/lib/utils/libfdt/libfdt.h
index 8037f39..48f375c 100644
--- a/lib/utils/libfdt/libfdt.h
+++ b/lib/utils/libfdt/libfdt.h
@@ -136,7 +136,7 @@ static inline uint32_t fdt32_ld(const fdt32_t *p)
 
 static inline void fdt32_st(void *property, uint32_t value)
 {
-	uint8_t *bp = property;
+	uint8_t *bp = (uint8_t *)property;
 
 	bp[0] = value >> 24;
 	bp[1] = (value >> 16) & 0xff;
@@ -160,7 +160,7 @@ static inline uint64_t fdt64_ld(const fdt64_t *p)
 
 static inline void fdt64_st(void *property, uint64_t value)
 {
-	uint8_t *bp = property;
+	uint8_t *bp = (uint8_t *)property;
 
 	bp[0] = value >> 56;
 	bp[1] = (value >> 48) & 0xff;
@@ -266,11 +266,12 @@ fdt_set_hdr_(size_dt_struct);
  * fdt_header_size - return the size of the tree's header
  * @fdt: pointer to a flattened device tree
  */
+size_t fdt_header_size(const void *fdt);
+
+/**
+ * fdt_header_size_ - internal function which takes a version number
+ */
 size_t fdt_header_size_(uint32_t version);
-static inline size_t fdt_header_size(const void *fdt)
-{
-	return fdt_header_size_(fdt_version(fdt));
-}
 
 /**
  * fdt_check_header - sanity check a device tree header
diff --git a/lib/utils/libfdt/libfdt_internal.h b/lib/utils/libfdt/libfdt_internal.h
index 741eeb3..d4e0bd4 100644
--- a/lib/utils/libfdt/libfdt_internal.h
+++ b/lib/utils/libfdt/libfdt_internal.h
@@ -10,10 +10,10 @@
 #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
 #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
 
-int fdt_ro_probe_(const void *fdt);
+int32_t fdt_ro_probe_(const void *fdt);
 #define FDT_RO_PROBE(fdt)					\
 	{							\
-		int totalsize_;					\
+		int32_t totalsize_;				\
 		if ((totalsize_ = fdt_ro_probe_(fdt)) < 0)	\
 			return totalsize_;			\
 	}
@@ -48,4 +48,126 @@ static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(void *fdt, int n)
 
 #define FDT_SW_MAGIC		(~FDT_MAGIC)
 
+/**********************************************************************/
+/* Checking controls                                                  */
+/**********************************************************************/
+
+#ifndef FDT_ASSUME_MASK
+#define FDT_ASSUME_MASK 0
+#endif
+
+/*
+ * Defines assumptions which can be enabled. Each of these can be enabled
+ * individually. For maximum safety, don't enable any assumptions!
+ *
+ * For minimal code size and no safety, use ASSUME_PERFECT at your own risk.
+ * You should have another method of validating the device tree, such as a
+ * signature or hash check before using libfdt.
+ *
+ * For situations where security is not a concern it may be safe to enable
+ * ASSUME_SANE.
+ */
+enum {
+	/*
+	 * This does essentially no checks. Only the latest device-tree
+	 * version is correctly handled. Inconsistencies or errors in the device
+	 * tree may cause undefined behaviour or crashes. Invalid parameters
+	 * passed to libfdt may do the same.
+	 *
+	 * If an error occurs when modifying the tree it may leave the tree in
+	 * an intermediate (but valid) state. As an example, adding a property
+	 * where there is insufficient space may result in the property name
+	 * being added to the string table even though the property itself is
+	 * not added to the struct section.
+	 *
+	 * Only use this if you have a fully validated device tree with
+	 * the latest supported version and wish to minimise code size.
+	 */
+	ASSUME_PERFECT		= 0xff,
+
+	/*
+	 * This assumes that the device tree is sane. i.e. header metadata
+	 * and basic hierarchy are correct.
+	 *
+	 * With this assumption enabled, normal device trees produced by libfdt
+	 * and the compiler should be handled safely. Malicious device trees and
+	 * complete garbage may cause libfdt to behave badly or crash. Truncated
+	 * device trees (e.g. those only partially loaded) can also cause
+	 * problems.
+	 *
+	 * Note: Only checks that relate exclusively to the device tree itself
+	 * (not the parameters passed to libfdt) are disabled by this
+	 * assumption. This includes checking headers, tags and the like.
+	 */
+	ASSUME_VALID_DTB	= 1 << 0,
+
+	/*
+	 * This builds on ASSUME_VALID_DTB and further assumes that libfdt
+	 * functions are called with valid parameters, i.e. not trigger
+	 * FDT_ERR_BADOFFSET or offsets that are out of bounds. It disables any
+	 * extensive checking of parameters and the device tree, making various
+	 * assumptions about correctness.
+	 *
+	 * It doesn't make sense to enable this assumption unless
+	 * ASSUME_VALID_DTB is also enabled.
+	 */
+	ASSUME_VALID_INPUT	= 1 << 1,
+
+	/*
+	 * This disables checks for device-tree version and removes all code
+	 * which handles older versions.
+	 *
+	 * Only enable this if you know you have a device tree with the latest
+	 * version.
+	 */
+	ASSUME_LATEST		= 1 << 2,
+
+	/*
+	 * This assumes that it is OK for a failed addition to the device tree,
+	 * due to lack of space or some other problem, to skip any rollback
+	 * steps (such as dropping the property name from the string table).
+	 * This is safe to enable in most circumstances, even though it may
+	 * leave the tree in a sub-optimal state.
+	 */
+	ASSUME_NO_ROLLBACK	= 1 << 3,
+
+	/*
+	 * This assumes that the device tree components appear in a 'convenient'
+	 * order, i.e. the memory reservation block first, then the structure
+	 * block and finally the string block.
+	 *
+	 * This order is not specified by the device-tree specification,
+	 * but is expected by libfdt. The device-tree compiler always created
+	 * device trees with this order.
+	 *
+	 * This assumption disables a check in fdt_open_into() and removes the
+	 * ability to fix the problem there. This is safe if you know that the
+	 * device tree is correctly ordered. See fdt_blocks_misordered_().
+	 */
+	ASSUME_LIBFDT_ORDER	= 1 << 4,
+
+	/*
+	 * This assumes that libfdt itself does not have any internal bugs. It
+	 * drops certain checks that should never be needed unless libfdt has an
+	 * undiscovered bug.
+	 *
+	 * This can generally be considered safe to enable.
+	 */
+	ASSUME_LIBFDT_FLAWLESS	= 1 << 5,
+};
+
+/**
+ * can_assume_() - check if a particular assumption is enabled
+ *
+ * @mask: Mask to check (ASSUME_...)
+ * @return true if that assumption is enabled, else false
+ */
+static inline bool can_assume_(int mask)
+{
+	return FDT_ASSUME_MASK & mask;
+}
+
+/** helper macros for checking assumptions */
+#define can_assume(_assume)	can_assume_(ASSUME_ ## _assume)
+
 #endif /* LIBFDT_INTERNAL_H */
diff --git a/lib/utils/libfdt/objects.mk b/lib/utils/libfdt/objects.mk
index 8156cde..8c060df 100644
--- a/lib/utils/libfdt/objects.mk
+++ b/lib/utils/libfdt/objects.mk
@@ -7,7 +7,7 @@
 #   Atish Patra<atish.patra@wdc.com>
 #
 
-libfdt_files = fdt.o fdt_addresses.o fdt_empty_tree.o fdt_ro.o fdt_rw.o \
+libfdt_files = fdt.o fdt_addresses.o fdt_check.o fdt_empty_tree.o fdt_ro.o fdt_rw.o \
                fdt_strerror.o fdt_sw.o fdt_wip.o
 $(foreach file, $(libfdt_files), \
         $(eval CFLAGS_$(file) = -I$(src)/../../utils/libfdt))
diff --git a/lib/utils/libfdt/version.lds b/lib/utils/libfdt/version.lds
index ae32924..7ab85f1 100644
--- a/lib/utils/libfdt/version.lds
+++ b/lib/utils/libfdt/version.lds
@@ -20,6 +20,7 @@ LIBFDT_1.2 {
 		fdt_get_alias_namelen;
 		fdt_get_alias;
 		fdt_get_path;
+                fdt_header_size;
 		fdt_supernode_atdepth_offset;
 		fdt_node_depth;
 		fdt_parent_offset;
-- 
2.27.0


