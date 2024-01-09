From: Xiang W <wxjstz@126.com>
Date: Wed, 10 Jan 2024 00:51:06 +0800
Subject: [RFC PATCH 1/2] lib: sbi: Add shared memory region support
In-Reply-To: <IA1PR20MB495387C9EA9AA34C34952334BB6A2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495392B203C9DF5A3FF4F4A6BB6A2@IA1PR20MB4953.namprd20.prod.outlook.com>
	 <IA1PR20MB495387C9EA9AA34C34952334BB6A2@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <61cd1477d6fb3110a2105e8984e97a29d9f2c344.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-01-09???? 19:24 +0800?Inochi Amaoto???
> SBI 2.0 introducts shared memory between SBI and supervisor-mode software,
> which is needed by various extension. So add inital support for shared
> memory mechanisms.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
> ?include/sbi/sbi_bitops.h |?? 3 +
> ?include/sbi/sbi_shm.h??? | 129 +++++++++++++++++++++++++++++++++++++++
> ?lib/sbi/objects.mk?????? |?? 1 +
> ?lib/sbi/sbi_shm.c??????? | 114 ++++++++++++++++++++++++++++++++++
> ?4 files changed, 247 insertions(+)
> ?create mode 100644 include/sbi/sbi_shm.h
> ?create mode 100644 lib/sbi/sbi_shm.c
> 
> diff --git a/include/sbi/sbi_bitops.h b/include/sbi/sbi_bitops.h
> index 7d90334..19b478a 100644
> --- a/include/sbi/sbi_bitops.h
> +++ b/include/sbi/sbi_bitops.h
> @@ -28,6 +28,9 @@
> ?#define BIT_WORD_OFFSET(bit)	((bit) & (BITS_PER_LONG - 1))
> ?#define BIT_ALIGN(bit, align)	(((bit) + ((align) - 1)) & ~((align) - 1))
> 
> +#define IS_BIT_ALIGN(bit, align)	\
> +	(((bit) & ((align) - 1)) == 0)
> +
> ?#define GENMASK(h, l) \
> ?	(((~0UL) - (1UL << (l)) + 1) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
> 
> diff --git a/include/sbi/sbi_shm.h b/include/sbi/sbi_shm.h
> new file mode 100644
> index 0000000..c50753b
> --- /dev/null
> +++ b/include/sbi/sbi_shm.h
> @@ -0,0 +1,129 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2024 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#ifndef __SBI_SHM_H__
> +#define __SBI_SHM_H__
> +
> +#include <sbi/sbi_byteorder.h>
> +
> +#define SBI_SHMEM_M_READABLE		(1UL << 0)
> +#define SBI_SHMEM_M_WRITABLE		(1UL << 1)
> +#define SBI_SHMEM_M_EXECUTABLE		(1UL << 2)
> +#define SBI_SHMEM_S_READABLE		(1UL << 3)
> +#define SBI_SHMEM_S_WRITABLE		(1UL << 4)
> +#define SBI_SHMEM_S_EXECUTABLE		(1UL << 5)
> +
> +#define SBI_SHMEM_M_RW			\
> +	(SBI_SHMEM_M_READABLE |		\
> +	 SBI_SHMEM_M_WRITABLE)
> +#define SBI_SHMEM_M_RWX			\
> +	(SBI_SHMEM_M_READABLE |		\
> +	 SBI_SHMEM_M_WRITABLE |		\
> +	 SBI_SHMEM_M_EXECUTABLE)
> +
> +#define SBI_SHMEM_S_RW			\
> +	(SBI_SHMEM_S_READABLE |		\
> +	 SBI_SHMEM_S_WRITABLE)
> +#define SBI_SHMEM_S_RWX			\
> +	(SBI_SHMEM_S_READABLE |		\
> +	 SBI_SHMEM_S_WRITABLE |		\
> +	 SBI_SHMEM_S_EXECUTABLE)
> +
> +#define SBI_SHMEM_S_ACCESS_SHIFT	3
> +
> +struct sbi_shmem {
> +	unsigned long addr;
> +	unsigned long size;
> +};
> +
> +int sbi_shmem_region_init(unsigned long lo, unsigned long hi,
> +			? unsigned long size, unsigned long align,
> +			? struct sbi_shmem *shmem);
> +void sbi_shmem_region_clear(struct sbi_shmem *shmem);
> +
> +int sbi_shmem_region_check(struct sbi_shmem *shmem, unsigned long flags);
> +
> +int sbi_shmem_raw_read(struct sbi_shmem *shmem, unsigned long offset,
> +		?????? void* value, unsigned long size);
> +int sbi_shmem_raw_write(struct sbi_shmem *shmem, unsigned long offset,
> +			void* value, unsigned long size);
> +
> +static inline int sbi_shmem_read_u8(struct sbi_shmem *shmem,
> +				??? unsigned long offset,
> +				??? uint8_t* value)
> +{
> +	return sbi_shmem_raw_read(shmem, offset, value, 1);
> +}
> +
> +static inline int sbi_shmem_read_u16(struct sbi_shmem *shmem,
> +				???? unsigned long offset,
> +				???? uint16_t* value)
> +{
> +	uint16_t tmp;
> +	int ret = sbi_shmem_raw_write(shmem, offset, &tmp, 2);
s/sbi_shmem_raw_write/sbi_shmem_raw_read/
> +
> +	*value = le16_to_cpu(tmp);
> +
> +	return ret;
> +}
> +
> +static inline int sbi_shmem_read_u32(struct sbi_shmem *shmem,
> +				???? unsigned long offset,
> +				???? uint32_t* value)
> +{
> +	uint32_t tmp;
> +	int ret = sbi_shmem_raw_write(shmem, offset, &tmp, 4);
s/sbi_shmem_raw_write/sbi_shmem_raw_read/
> +
> +	*value = le32_to_cpu(tmp);
> +
> +	return ret;
> +}
> +
> +static inline int sbi_shmem_read_u64(struct sbi_shmem *shmem,
> +				???? unsigned long offset,
> +				???? uint64_t* value)
> +{
> +	uint64_t tmp;
> +	int ret = sbi_shmem_raw_write(shmem, offset, &tmp, 8);
s/sbi_shmem_raw_write/sbi_shmem_raw_read/

Regards,
Xiang W
> +
> +	*value = le64_to_cpu(tmp);
> +
> +	return ret;
> +}
> +
> +static inline int sbi_shmem_write_u8(struct sbi_shmem *shmem,
> +				???? unsigned long offset,
> +				???? uint8_t value)
> +{
> +	return sbi_shmem_raw_write(shmem, offset, &value, 1);
> +}
> +
> +static inline int sbi_shmem_write_u16(struct sbi_shmem *shmem,
> +				????? unsigned long offset,
> +				????? uint16_t value)
> +{
> +	uint16_t tmp = cpu_to_le16(value);
> +	return sbi_shmem_raw_write(shmem, offset, &tmp, 2);
> +}
> +
> +static inline int sbi_shmem_write_u32(struct sbi_shmem *shmem,
> +				????? unsigned long offset,
> +				????? uint32_t value)
> +{
> +	uint32_t tmp = cpu_to_le32(value);
> +	return sbi_shmem_raw_write(shmem, offset, &tmp, 4);
> +}
> +
> +static inline int sbi_shmem_write_u64(struct sbi_shmem *shmem,
> +				????? unsigned long offset,
> +				????? uint64_t value)
> +{
> +	uint64_t tmp = cpu_to_le64(value);
> +	return sbi_shmem_raw_write(shmem, offset, &tmp, 8);
> +}
> +
> +
> +#endif // __SBI_SHM_H__
> diff --git a/lib/sbi/objects.mk b/lib/sbi/objects.mk
> index c699187..5ffef06 100644
> --- a/lib/sbi/objects.mk
> +++ b/lib/sbi/objects.mk
> @@ -71,6 +71,7 @@ libsbi-objs-y += sbi_misaligned_ldst.o
> ?libsbi-objs-y += sbi_platform.o
> ?libsbi-objs-y += sbi_pmu.o
> ?libsbi-objs-y += sbi_scratch.o
> +libsbi-objs-y += sbi_shm.o
> ?libsbi-objs-y += sbi_string.o
> ?libsbi-objs-y += sbi_system.o
> ?libsbi-objs-y += sbi_timer.o
> diff --git a/lib/sbi/sbi_shm.c b/lib/sbi/sbi_shm.c
> new file mode 100644
> index 0000000..213edaf
> --- /dev/null
> +++ b/lib/sbi/sbi_shm.c
> @@ -0,0 +1,114 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2024 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <sbi/riscv_barrier.h>
> +#include <sbi/sbi_byteorder.h>
> +#include <sbi/sbi_domain.h>
> +#include <sbi/sbi_error.h>
> +#include <sbi/sbi_shm.h>
> +#include <sbi/sbi_string.h>
> +
> +void sbi_shmem_region_clear(struct sbi_shmem *shmem)
> +{
> +	shmem->addr = 0;
> +	shmem->size = 0;
> +}
> +
> +int sbi_shmem_region_init(unsigned long lo, unsigned long hi,
> +			? unsigned long size, unsigned long align,
> +			? struct sbi_shmem *shmem)
> +{
> +	if (IS_BIT_ALIGN(lo, align))
> +		return SBI_EINVAL;
> +
> +	if (size == 0)
> +		return SBI_EINVAL;
> +
> +	/* TODO: support address wider than XLEN bits */
> +	if (hi)
> +		return SBI_EINVALID_ADDR;
> +
> +	shmem->addr = lo;
> +	shmem->size = size;
> +
> +	return 0;
> +}
> +
> +static int __sbi_shmem_region_check(struct sbi_domain *domain,
> +				??? struct sbi_shmem *shmem,
> +				??? unsigned long mode, unsigned long flags)
> +{
> +	unsigned long access_flags = 0;
> +	int ret;
> +
> +	if (flags & SBI_SHMEM_M_RWX) {
> +		if (flags & SBI_SHMEM_M_READABLE)
> +			access_flags |= SBI_DOMAIN_READ;
> +		if (flags & SBI_SHMEM_M_WRITABLE)
> +			access_flags |= SBI_DOMAIN_WRITE;
> +		if (flags & SBI_SHMEM_M_EXECUTABLE)
> +			access_flags |= SBI_DOMAIN_EXECUTE;
> +		ret = sbi_domain_check_addr_range(domain,
> +						? shmem->addr, shmem->size,
> +						? mode, access_flags);
> +		if (!ret)
> +			return SBI_EINVALID_ADDR;
> +	}
> +
> +	return 0;
> +}
> +
> +
> +int sbi_shmem_region_check(struct sbi_shmem *shmem, unsigned long flags)
> +{
> +	struct sbi_domain *domain = sbi_domain_thishart_ptr();
> +	int ret;
> +
> +	if (shmem->size == 0)
> +		return SBI_EINVAL;
> +
> +	ret = __sbi_shmem_region_check(domain, shmem, PRV_M, flags);
> +	if (ret)
> +		return ret;
> +
> +	ret = __sbi_shmem_region_check(domain, shmem, PRV_S,
> +				?????? flags >> SBI_SHMEM_S_ACCESS_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +
> +int sbi_shmem_raw_write(struct sbi_shmem *shmem, unsigned long offset,
> +			void* value, unsigned long size)
> +{
> +	void *pos = (void *)(shmem->addr + offset);
> +
> +	if (shmem->size <= offset + size)
> +		return SBI_EINVAL;
> +
> +	mb();
> +	sbi_memcpy(pos, value, size);
> +	wmb();
> +
> +	return 0;
> +}
> +
> +int sbi_shmem_raw_read(struct sbi_shmem *shmem, unsigned long offset,
> +		?????? void* value, unsigned long size)
> +{
> +	void *pos = (void *)(shmem->addr + offset);
> +
> +	if (shmem->size <= offset + size)
> +		return SBI_EINVAL;
> +
> +	rmb();
> +	sbi_memcpy(value, pos, size);
> +	wmb();
> +
> +	return 0;
> +}
> --
> 2.43.0


