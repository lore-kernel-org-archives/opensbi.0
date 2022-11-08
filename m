From: Xiang W <wxjstz@126.com>
Date: Tue, 08 Nov 2022 17:36:59 +0800
Subject: [PATCH] lib: utils/serial: Fix semihosting compile error using
 LLVM
In-Reply-To: <20221108032509.1382464-1-apatel@ventanamicro.com>
References: <20221108032509.1382464-1-apatel@ventanamicro.com>
Message-ID: <4e99c7f7cd261a7d6d582c0fbbcb1b9c8c31fb09.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-11-08???? 08:55 +0530?Anup Patel???
> We fix the following semihosting compile error observed using LLVM:
> lib/utils/serial/semihosting.c:158:12: error: result of comparison of constant -1 with expression of type 'char' is always true [-Werror,-
> Wtautological-constant-out-of-range-compare]
> ??????????????? ret = ch > -1 ? ch : -1;
> ????????????????????? ~~ ^ ~~
> 
> Fixes: 7f09fba86e43 ("lib: utils/serial: add semihosting support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
> ?lib/utils/serial/semihosting.c | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> index 5012fa1..72bbbb3 100644
> --- a/lib/utils/serial/semihosting.c
> +++ b/lib/utils/serial/semihosting.c
> @@ -155,7 +155,7 @@ static int semihosting_getc(void)
> ?
> ????????if (semihosting_infd < 0)? {
> ????????????????ch = semihosting_trap(SYSREADC, NULL);
> -???????????????ret = ch > -1 ? ch : -1;
> +???????????????ret = ((int)ch > -1) ? ch : -1;
> ????????} else
> ????????????????ret = semihosting_read(semihosting_infd, &ch, 1) > 0 ? ch : -1;

There is a bug here. This line should be changed to:
                ret = semihosting_read(semihosting_infd, &ch, 1) == 0 ? ch : -1;

The return value of semihosting_read is buffer_length - bytes_read. Not the length
of characters read. The following is the code comment from openocd about SYS_READ. 

		case SEMIHOSTING_SYS_READ:	/* 0x06 */
			/*
			 * Reads the contents of a file into a buffer. The file position
			 * is specified either:
			 * - Explicitly by a SYS_SEEK.
			 * - Implicitly one byte beyond the previous SYS_READ or
			 * SYS_WRITE request.
			 *
			 * The file position is at the start of the file when it is
			 * opened, and is lost when the file is closed. Perform the
			 * file operation as a single action whenever possible. For
			 * example, do not split a read of 16KB into four 4KB chunks
			 * unless there is no alternative.
			 *
			 * Entry
			 * On entry, the PARAMETER REGISTER contains a pointer to a
			 * three-field data block:
			 * - field 1 Contains a handle for a file previously opened
			 * with SYS_OPEN.
			 * - field 2 Points to a buffer.
			 * - field 3 Contains the number of bytes to read to the buffer
			 * from the file.
			 *
			 * Return
			 * On exit, the RETURN REGISTER contains the number of bytes not
			 * filled in the buffer (buffer_length - bytes_read) as follows:
			 * - If the RETURN REGISTER is 0, the entire buffer was
			 * successfully filled.
			 * - If the RETURN REGISTER is the same as field 3, no bytes
			 * were read (EOF can be assumed).
			 * - If the RETURN REGISTER contains a value smaller than
			 * field 3, the read succeeded but the buffer was only partly
			 * filled. For interactive devices, this is the most common
			 * return value.
			 */

> ?
> -- 
> 2.34.1
> 
> 



